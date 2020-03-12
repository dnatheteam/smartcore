module Smartcore
  class CheckEmailPresenceRequest < BaseRequest
    attribute :email,    String

    def execute
      response = execute_request
      if response.code == success_status
        data = JSON.parse(response.body)
        Smartcore::CheckEmailPresenceResponse.new( { status: true, api_id: data['api_id'] } )
      elsif response.code == 404
        Smartcore::CheckEmailPresenceResponse.new( { status: false } )
      else
        process_error(response)
      end
    end

    def path
      router.information_check_email_path
    end
  end
end
