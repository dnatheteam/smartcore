module Smartcore
  class UserAcceptDocumentsRequest < TokenRequest
    attribute :user_token, String

    def execute
      Rails.logger.info "--SMARTCORE --- UserAcceptDocumentsRequest"
      response = execute_request_with_token
      if response.code == success_status
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