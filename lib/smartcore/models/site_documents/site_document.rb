module Smartcore
  module Models
    class SiteDocument < BaseModel
      attribute :id,               Integer
      attribute :doc_type,         String
      attribute :content,          String
      attribute :version,          Integer
      attribute :start_date,       Date
    end
  end
end