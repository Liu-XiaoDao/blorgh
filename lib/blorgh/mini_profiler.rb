module Blorgh
  class MiniProfiler
    def initialize(app)
      @app = app
    end

    def call(env)
      @env = env

      @start = Time.now
      @status, @headers, @response = @app.call(env)
      @stop = Time.now

      puts "#{@start}~~hahahahah~~#{@stop}"

      inject_html

      [@status, @headers, @response]
    end

    private
      def inject_html
        @code = "Test Insert"
        response = Rack::Response.new([], @status, @headers)
        @response.each do |fragment|
          response.write inject(fragment)
        end

      end

      def inject(fragment)
        # find explicit or implicit body
        index = fragment.rindex(/<\/body>/i) || fragment.rindex(/<\/html>/i)
        if index
          fragment.insert(index, @code)
        else
          fragment
        end
      end
  end
end
