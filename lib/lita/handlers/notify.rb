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
      http.get "/notify", :web


      # Web
      # -----------------------------------------------------------------------
      def web(_request, response)
        response.headers["Content-Type"] = "application/json"
        json = MultiJson.dump(
          lita: notify
        )
        response.write(json)
      end
    end

    Lita.register_handler(Notify)
  end
end
