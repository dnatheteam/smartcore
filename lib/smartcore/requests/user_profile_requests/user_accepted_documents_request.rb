module Smartcore
  class UserAcceptedDocumentsRequest < TokenRequest
    attribute :user_token, String

    def execute
      response = execute_request_with_token
      if response.code == success_status
        Smartcore::SiteDocumentsResponse.new(JSON.parse(response.body))
      else
        process_error(response)
      end
    end

    def path
      router.user_accepted_documents_path
    end
  end
end