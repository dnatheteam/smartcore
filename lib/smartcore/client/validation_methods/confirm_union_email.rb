module Smartcore
  class Client
    def user_profile_confirm_union_email(token)
      Smartcore::ConfirmUnionEmailRequest.new(api_token: self.token, token: token).execute
    end
  end
end