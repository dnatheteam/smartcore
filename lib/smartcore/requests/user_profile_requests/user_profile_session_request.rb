module Smartcore
  class UserProfileSessionRequest < TokenRequest

    attribute :user_token,  String
    attribute :check_in,    DateTime
    attribute :active_time, Integer
    attribute :url,         String
    attribute :title,       String


    def execute
      Rails.logger.info "--SMARTCORE --- UserProfileSessionRequest"
      response = execute_request_with_token
      if response.code == success_status
        true
      else
        process_error(response)
      end
    end

    def path
      router.user_profile_session_path
    end
  end
end