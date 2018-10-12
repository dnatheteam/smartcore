module Smartcore
  class CheckPhonePresenceRequest < BaseRequest
    attribute :phone_number,    String

    def execute
      response = execute_request
      if response.status == success_status
        data = JSON.parse(response.body)
        Smartcore::CheckPhonePresenceResponse.new( { status: true, api_id: data['api_id'] } )
      elsif response.status == 404
        Smartcore::CheckPhonePresenceResponse.new( { status: false } )
      else
        process_error(response)
      end
    end

    def path
      router.information_check_phone_path
    end
  end
end