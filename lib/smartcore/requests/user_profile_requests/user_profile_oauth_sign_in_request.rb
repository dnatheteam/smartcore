module Smartcore
  class UserProfileOAuthSignInRequest < TokenRequest

    attribute :callback_url,      String
    attribute :confirm_email_url, String, default: ''
    attribute :failure_url,       String


    def execute
      Rails.logger.info "--SMARTCORE --- UserProfileOAuthSignInRequest"
      response = execute_request_with_token
      if response.code == success_status
        Smartcore::UserProfileOAuthResponse.new(JSON.parse(response.body))
      else
        process_error(response)
      end
    end

    def path
      router.user_oauth_sign_in_path
    end
  end
end
