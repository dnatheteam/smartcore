module Smartcore
  class GetSiteDocumentsRequest < TokenRequest

    def execute
      response = execute_request_with_token
      if response.code == success_status
        Smartcore::SiteDocumentsResponse.new(JSON.parse(response.body))
      else
        process_error(response)
      end
    end

    def path
      router.information_current_site_documents_path
    end
  end
end