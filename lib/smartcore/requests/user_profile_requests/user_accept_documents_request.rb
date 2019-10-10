module Smartcore
  class UserAcceptDocumentsRequest < TokenRequest
    attribute :user_token, String

    def execute
      response = execute_request_with_token
      if response.status == success_status
        Smartcore::SiteDocumentsResponse.new(JSON.parse(response.body))
      else
        process_error(response)
      end
    end

    def path
      router.user_accept_documents_path
    end
  end
end