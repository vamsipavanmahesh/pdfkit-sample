require 'render_anywhere'

class PdfWriter
  include RenderAnywhere

  def initialize(name)
    @name = name
  end

  def write_pdf
    File.open("tmp/#{@name}_certificate.pdf", 'wb') do |file|
      file << render_to_string pdf: "#{@name}_certificate.pdf",
                               template: "templates/pdf",
                               encoding: "UTF-8",
                               locals: { name: @name }
    end
  end

  private

  def as_html
    render template: "certificates/pdf",
    layout: 'certificate',
    locals: { name: @name }
  end
end
