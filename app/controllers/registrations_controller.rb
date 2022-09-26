class RegistrationsController < ApplicationController
  wrap_parameters false
  # create registration
  def create    
    registration = Registration.new(registration_params)

    if registration.save && create_invoices(registration_params, registration.id)
      render json: {status: 'SUCCESS', message:'Saved registration', date:registration}, status: :ok
    else
      render json: {status: 'ERROR', message:'registration not saved', date:registration.errors}, status: :unprocessable_entity
    end
  end

  def index
    registration = Registration.order('created_at DESC');
    render json: {status: 'SUCCESS', message:'registrations listed', date:registration}, status: :ok
  end

  def show
    registration = Registration.find(params[:id])
    render json: {status: 'SUCCESS', message:'Loaded registration', date:registration}, status: :ok
  end

  # Parametros aceitos
  private

  def create_invoices(registration_params, registration_id)
    expiration_day = registration_params[:expiration_day]
    invoice_quantity = registration_params[:invoice_quantity]
    invoice_amount = registration_params[:amount] / invoice_quantity
    due_date = validate_due_date(expiration_day)

    if Invoice.create(invoice_amount: invoice_amount, due_date: due_date, status: "open", registration_id: registration_id).save
      invoice_index = 1

      while invoice_index <= invoice_quantity -1
        due_date = Date.new(due_date.year, due_date.month, due_date.day).next_month()
        invoice_index += 1
        Invoice.create(invoice_amount: invoice_amount, due_date: due_date, status: "open", registration_id: registration_id).save
      end
      true
    end
  end

  def validate_due_date(expiration_day)
    date = DateTime.now.to_date
    current_day = date.day
    
    if expiration_day >= current_day
      due_date = date.strftime("#{expiration_day}/%m/%Y").to_date
    else
      due_date = date.date.next_month.strftime("#{expiration_day}/%m/%Y").to_date
    end 
  end

  def registration_params
    params.permit(
      :amount,
      :invoice_quantity, # numero de parcelas
      :expiration_day,
      :course_name,
      :educational_institution_id,
      :student_id
    )
  end
end
