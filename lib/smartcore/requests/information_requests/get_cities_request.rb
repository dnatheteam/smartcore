module Smartcore
  class GetCitiesRequest < BaseRequest

    attribute :per_page, Integer, default: 500

    def execute
      response = execute_request
      if response.code == success_status
        Smartcore::CitiesResponse.new(JSON.parse(response.body)).cities
      else
        process_error(response)
      end
    end

    def path
      router.information_cities_path
    end
  end
end
