class ApplicationController < ActionController::Base

  def version
    render json: { :product_version => Rails.application.config.product_version }.to_json

    # respond_to do |format|
    #   format.html { render html: { product_version: Rails.application.config.product_version}.to_json }
    #   format.json { render json: { product_version: Rails.application.config.product_version}.to_json }
    # end
  end

end
