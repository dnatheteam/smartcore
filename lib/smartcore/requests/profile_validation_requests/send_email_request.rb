module Smartcore
  class SendEmailRequest < TokenRequest
    attribute :email,    String
    attribute :token,    String

    def execute
      response = execute_request_with_token
      if response.status == success_status
        Smartcore::SendConfirmationEmailResponse.new(JSON.parse(response.body))
      else
        process_error(response)
      end
    end

    def path
      router.send_confirm_email_path
    end
  end
end
