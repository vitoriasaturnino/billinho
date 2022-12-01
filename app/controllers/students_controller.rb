class StudentsController < ApplicationController
  def create
    student = Student.new(student_params)
    if student.save
      render json: { status: 'SUCCESS', message: 'Saved student', data: student }, status: :ok
    else
      render json: { status: 'ERROR', message: 'Student not saved', data: student.errors },
             status: :unprocessable_entity
    end
  end

  def index
    student = Student.order('created_at DESC')
    render json: { status: 'SUCCESS', message: 'Students listed', data: student }, status: :ok
  end

  def show
    student = Student.find(params[:id])
    render json: { status: 'SUCCESS', message: 'Loaded student', data: student }, status: :ok
  end

  private

  def student_params
    params.permit(:name, :cpf, :cell, :birth_date, :genre, :form_of_payment)
  end
end
