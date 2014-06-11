require "lita"

module Lita
  module Handlers

    class Notify < Handler

      # Routes
      # -----------------------------------------------------------------------
      route(
        /^notify/,
        :note,
        command: true,
        help: { "notify" => "this is what notify does" }
      )


      # Note
      # -----------------------------------------------------------------------
      def note(response)
        response.reply "this is a note"
      end


      # Web API
      # -----------------------------------------------------------------------
      http.post "/notify", :web

      def web(_request, response)
        puts '***'
        puts 'request', _request
        puts 'response', response
        puts '***'
        response.headers["Content-Type"] = "application/json"
        json = MultiJson.dump(
          lita: notify
        )
        response.write(json)
      end

      def self.default_config(config)
        puts '***'
        puts 'config', config
        puts '***'
        config.key = ""
      end

      def self.namespace
        'notify'
      end
    end

    Lita.register_handler(Notify)
  end
end
