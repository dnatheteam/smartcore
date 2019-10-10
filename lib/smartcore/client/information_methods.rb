require 'smartcore/client/information_methods/geo_data'
require 'smartcore/client/information_methods/brand_data'
require 'smartcore/client/information_methods/site_documents'

module Smartcore
  class Client

    def check_email_presence(email)
      Smartcore::CheckEmailPresenceRequest.new(email: email).execute
    end

    def check_phone_presence(phone_number)
      Smartcore::CheckPhonePresenceRequest.new(phone_number: phone_number).execute
    end

  end
end
