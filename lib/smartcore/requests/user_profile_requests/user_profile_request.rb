module Smartcore
  class UserProfileRequest < TokenRequest

    attribute :user_token, String


    def execute
      Rails.logger.info "--SMARTCORE --- UserProfileRequest"
      response = execute_request_with_token
      if response.code == success_status
        Smartcore::UserProfileResponse.new(JSON.parse(response.body)).profile
      else
        process_error(response)
      end
    end

    def path
      router.user_profile_path
    end
  end
end
