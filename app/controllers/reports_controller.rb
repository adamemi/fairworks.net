class ReportsController < ApplicationController

  def index
  end

  def checks
    output = Checks.new(:margin => 60).to_pdf(2942)

    respond_to do |format|
      format.html do
        send_data output, :filename => "checks.pdf", :type => "application/pdf"
      end
    end
  end

end
