class CertificatesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
  end

  def create
    PdfWriter.new(params[:name]).write_pdf
    render json: { message: "ok" }
  end
end
