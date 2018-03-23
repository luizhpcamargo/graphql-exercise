require "graphql/client"
require "graphql/client/http"

class OrganizationService
  attr_accessor :organization_id

  def self.fetch(organization_id = nil)
    request = new(organization_id)
    request.create_organization
  end

  def create_organization
    Organization.create_from(data&.organization, organization_id)
    rescue Graphlient::Errors::Error => error
      { error: error.to_s }
  end

  def initialize(organization_id = nil)
    self.organization_id = organization_id || Rails.application.secrets.organization_id
  end

  private

  def client
    headers = { 'Authorization' => "Bearer #{Rails.application.secrets.api_token}"}
    Graphlient::Client.new('https://app.pipefy.com/queries', headers: headers)
  end

  def data
    response = client.query(organization_id: organization_id) do
      query(organization_id: :id!) do
        organization(id: :organization_id) do
          name
          pipes do
            id
            name
            phases do
              id
              name
              fields do
                id
                label
              end
              cards do
                edges do
                  node do
                    id
                    title
                    created_at
                    due_date
                    fields do
                      name
                      value
                    end
                    labels do
                      id
                      name
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    response&.data
  end
end
