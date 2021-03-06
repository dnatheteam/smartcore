module Smartcore
  class UserProfileSignInByIdRequest < TokenRequest

    attribute :profile_id, String
    attribute :user_ip, String

    def execute
      Rails.logger.info "--SMARTCORE --- UserProfileSignInByIdRequest"
      response = execute_request_with_token
      if response.code == success_status
        Smartcore::UserProfileResponse.new(JSON.parse(response.body))
      else
        process_error(response)
      end
    end

    def path
      '/sessions/sign_in_by_id'
    end
  end
end
