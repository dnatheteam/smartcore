module Smartcore
  class SiteDocumentsResponse < SuccessResponse

    attribute :documents, Array[Smartcore::Models::SiteDocument]

  end
end