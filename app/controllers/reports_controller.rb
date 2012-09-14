class ReportsController < ApplicationController

  def index
  end

  def download_checks
    output = Checks.new(:margin => 60).to_pdf(params[:starting_number].to_i, params[:cash_by])

    respond_to do |format|
      format.html do
        send_data output, :filename => "checks.pdf", :type => "application/pdf"
      end
    end
  end

end
