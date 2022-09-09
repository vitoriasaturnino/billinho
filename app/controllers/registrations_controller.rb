class RegistrationsController < ApplicationController
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