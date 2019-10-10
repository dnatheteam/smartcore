module Smartcore
  class Client

    def get_current_documents
      GetSiteDocumentsRequest.new.execute
    end
  end
end