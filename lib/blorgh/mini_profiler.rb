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
        @code = ""
        @code << %Q{<div id="show_price" class="show_price"></div>\n}
        @code << %Q{<style type="text/css">#{read_public_file("show_price.css")}</style>\n}
        @code << %Q{<script type="text/javascript">#{read_public_file("fetch_price.js")}</script>\n}
        @code << %Q{
          <script type="text/javascript">
            setInterval(function () {
              fetch_price("/blog", function(price){
                document.getElementById("show_price").innerHTML = price;
              });
            }, 2000);
          </script>
        }
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

      def read_public_file(filename)
        output = ::File.open(::File.join(::File.dirname(__FILE__), "public", filename), "r:UTF-8") do |f|
          f.read
        end
      end
  end
end
