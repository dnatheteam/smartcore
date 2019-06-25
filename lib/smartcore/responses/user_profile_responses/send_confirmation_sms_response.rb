module Smartcore
  class SendConfirmationSmsResponse < SuccessResponse
    attribute :status,  Boolean
    attribute :api_id,  String
  end
end