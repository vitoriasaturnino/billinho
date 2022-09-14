class RegistrationsController < ApplicationController
  wrap_parameters false
  # create registration
  def create    
    registration = Registration.new(registration_params)

    if registration.save && create_invoices(registration_params, registration.id)
      render json: {status: 'SUCCESS', message:'Saved registration', data:registration}, status: :ok
    else
      render json: {status: 'ERROR', message:'registration not saved', data:registration.errors}, status: :unprocessable_entity
    end
  end

  def index
    registration = Registration.order('created_at DESC');
    render json: {status: 'SUCCESS', message:'registrations listed', data:registration}, status: :ok
  end

  def show
    registration = Registration.find(params[:id])
    render json: {status: 'SUCCESS', message:'Loaded registration', data:registration}, status: :ok
  end

  def create_invoices(registration_params, registration_id)
    expiration_day = registration_params[:expiration_day]
    invoice_quantity = registration_params[:invoice_quantity]
    invoice_amount = registration_params[:amount] / invoice_quantity

    date = Time.now.to_date
    current_day = date.day
    
    if expiration_day >= current_day
      due_date = date.strftime("#{due_date}/%m/%y").to_date
    else
      due_date = date.next_month.strftime("#{due_date}/%m/%y").to_date
    end

    if Invoice.create(invoice_amount: invoice_amount, due_date: due_date, status: "open", registration_id: registration_id).save
      invoice_index = 1

      while invoice_index < invoice_quantity
        due_date = Date.new(due_date.year, due_date.month, due_date.day).next_month(invoice_index)
        invoice_index += 1
        Invoice.create(invoice_amount: invoice_amount, due_date: due_date, status: "open", registration_id: registration_id).save
      end
      true
    end
  end

  # Parametros aceitos
  private
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
