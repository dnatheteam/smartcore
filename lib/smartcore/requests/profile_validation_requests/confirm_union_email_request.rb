module Smartcore
  class ConfirmUnionEmailRequest < TokenRequest

    attribute :token, String

    def execute
      response = execute_request_with_token
      if response.code == success_status
        Smartcore::UserProfileResponse.new(JSON.parse(response.body))
      else
        process_error(response)
      end
    end

    def path
      router.confirm_union_email_path
    end
  end
end