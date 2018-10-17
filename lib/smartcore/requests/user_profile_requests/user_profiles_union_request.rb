module Smartcore
  class UserProfilesUnionRequest < TokenRequest

    attribute :email, String
    attribute :user_token, String

    def execute
      response = execute_request_with_token
      if response.status == success_status
        true
      else
        process_error(response)
      end
    end

    def path
      router.profiles_union_path
    end
  end
end