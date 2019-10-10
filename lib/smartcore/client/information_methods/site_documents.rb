module Smartcore
  class Client

    def get_current_documents
      GetSiteDocumentsRequest.new(api_token: self.token).execute
    end
  end
end