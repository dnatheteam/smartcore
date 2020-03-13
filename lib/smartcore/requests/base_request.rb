require 'httparty'
module Smartcore
  class BaseRequest

    include Virtus.model

    def execute
      raise 'Abstract Method'
    end

    def execute_request
      post_json(path: path, data: attributes)
    end

    def execute_request_with_token
      post_json_with_token(path: path, data: attributes)
    end

    private

    def router
      Smartcore::Router.new
    end

    def success_status
      200
    end

    def path
      raise 'Abstract Method'
    end

    def method
      'POST'
    end

    def post_json(path: nil, data: nil)
      uri = URI(Smartcore.uri)
      uri.path = File.join(uri.path, path) if path.present?

      begin
        retries ||= 0
        response = HTTParty.post("#{uri}.json",
                                 multipart: true,
                                 body: data,
                                 open_timeout: 0.2,
                                 verify: false)
      rescue Net::OpenTimeout
        retry if (retries += 1) < 5
      end
    end

    def process_error(response)
      # HTTP: unprocessable entity -> returns JSON
      if response.code == 422
        json = JSON.parse(response.body)
        case json['error']
          when 'user_verification'
            raise Smartcore::UserVerificationRequired
          when 'bad_user_token'
            raise Smartcore::BadUserToken
          when 'user_locked'
            raise Smartcore::UserIsLocked
          when 'old_password_wrong'
            Smartcore::ErrorResponse.new
        end
        # HTTP unauthorized -> API client is not authorized.
      elsif response.code == 401
        # so, if we have any client token in cache,
        if Rails.cache && Rails.cache.exist?(:api_token)
          # we should delete it
          Rails.cache.delete(:api_token)
          raise Smartcore::ApiClientInvalidToken
        else
          # in other case we have bad credentials
          raise Smartcore::ApiClientNotAuthorized
        end

        # HTTP not modified
        # HTTP not found
        # HTTP locked
        # -> we should do nothing and pass cause this error should be handled in children classes
      elsif response.code == 404
        raise Smartcore::NotFoundError
      elsif response.code.in? [304, 423]
        # any other codes are not used in standard cases
      else
        raise Smartcore::BadResponseError
      end
    rescue JSON::ParserError
      raise Smartcore::BadResponseFormat
    end

  end
end
