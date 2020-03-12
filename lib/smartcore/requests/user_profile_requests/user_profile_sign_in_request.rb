module Smartcore
  class UserProfileSignInRequest < TokenRequest

    attribute :email,    String
    attribute :phone_number,    String
    attribute :password, String
    attribute :user_ip, String


    def execute
      Rails.logger.info "--SMARTCORE --- UserProfileSignInRequest"
      response = execute_request_with_token
      if response.status == success_status
        Smartcore::UserProfileResponse.new(JSON.parse(response.body))
      else
        process_error(response)
      end
    end

    def path
      router.user_sign_in_path
    end
  end
end
