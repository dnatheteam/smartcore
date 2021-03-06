module Smartcore
  class UserSocialProfilesRequest < TokenRequest

    attribute :page,         Integer
    attribute :per_page,     Integer

    def execute
      Rails.logger.info "--SMARTCORE --- UserSocialProfilesRequest"
      response = execute_request_with_token
      if response.code == success_status
        Smartcore::UserProfilesResponse.new(JSON.parse(response.body))
      else
        process_error(response)
      end
    end

    def path
      router.social_profiles_path
    end
  end
end
