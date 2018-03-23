class HomeController < ApplicationController
  before_action :load_organization, except: :fetch_data

  def fetch_data
    response = OrganizationService.fetch
    if response.is_a? Hash
      render :index, alert: response[:error]
    else
      load_organization
      render :index
    end
  end

  private

  def load_organization
    @organization = Organization.find_by(ext_id: Rails.application.secrets.organization_id)
    @pipes = @organization&.pipes.info
  end
end
