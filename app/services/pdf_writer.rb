require 'render_anywhere'

class PdfWriter
  # include RenderAnywhere

  def initialize(name)
    @name = name
  end

  def write_pdf
    kit = PDFKit.new(as_html)
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
