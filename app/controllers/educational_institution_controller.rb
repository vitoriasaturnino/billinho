class EducationalInstitutionController < ApplicationController
  # cria instituição de ensino
  def create
    educational_institution = EducationalInstitution.new(educational_institution_params)
    if educational_institution.save
      render json: {status: 'SUCCESS', message:'Saved educational institution', data:educational_institution},status: :ok
    else
      render json: {status: 'ERROR', message:'EducationalInstitution not saved', data:educational_institution.errors}, status: :unprocessable_entity
    end
  end

  # lista todas as instituições
  def index
    educational_institution = EducationalInstitution.order('created_at DESC');
    render json: {status: 'SUCCESS', message:'Educational Institutions listed', data:educational_institution}, status: :ok
  end

  # encontra a instituição de ensino pelo id
  def show
    educational_institution = EducationalInstitution.find(params[:id])
    render json: {status: 'SUCCESS', message:'Loaded educational_institution', data:educational_institution},status: :ok
  end

  # Parametros aceitos
  private
  def educational_institution_params
    params.permit(:name, :cnpj, :institution_type)
  end
end
