require 'render_anywhere'

class PdfWriter
  # include RenderAnywhere

  def initialize(name)
    @name = name
  end

  def write_pdf
    kit = PDFKit.new(as_html)
    # kit.stylesheets << Rails.root.join(
    #   'public' + ActionController::Base.helpers.stylesheet_path('certificates_style')
    # ).to_s
    kit.to_file("tmp/#{@name}_certificate.pdf")
  end

  private

  def as_html
    ApplicationController.render(
      template: "certificates/pdf",
      layout: 'certificate',
      locals: { name: @name }
    )
  end
end
