module Smartcore
  class CheckEmailPresenceRequest < BaseRequest
    attribute :email,    String

    def execute
      response = execute_request
      if response.status == success_status
        { status: true, api_id: response.api_id }
      elsif response.status == 404
        { status: false }
      else
        process_error(response)
      end
    end

    def path
      router.information_check_email_path
    end
  end
end
