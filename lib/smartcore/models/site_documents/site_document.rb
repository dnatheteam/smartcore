module Smartcore
  module Models
    class SiteDocument < BaseModel
      attribute :doc_type,         String
      attribute :content,          String
      attribute :version,          String
      attribute :start_date,       Date
    end
  end
end