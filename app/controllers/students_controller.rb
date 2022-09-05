class StudentsController < ApplicationController
  # cria instituição de ensino
  def create
    student = Student.new(student_params)
    if student.save
      render json: {status: 'SUCCESS', message:'Saved student', data:student},status: :ok
    else
      render json: {status: 'ERROR', message:'Student not saved', data:student.errors}, status: :unprocessable_entity
    end
  end
  
  # lista tosoa os students
  def index
    student = Student.order('created_at DESC');
    render json: {status: 'SUCCESS', message:'Students listed', data:student}, status: :ok
  end

  # encontra a instituição de ensino pelo id
  def show
    student = Student.find(params[:id])
    render json: {status: 'SUCCESS', message:'Loaded student', data:student},status: :ok
  end

  # Parametros aceitos
  private
  def student_params
    params.permit(:name, :cpf, :genre, :form_of_payment)
  end
end
