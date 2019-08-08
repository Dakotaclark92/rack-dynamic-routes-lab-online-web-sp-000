    class Application
      
      @@items = []
     
      def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)
        
        if req.path.match(/items/)
          
          items_price = req.path.split("/items").last
          items = @@items.find{|i| i.price == items_price}
          
          resp.write items.price
        else
          resp.write "Route not found"
          resp.status = 404
        end
        
        resp.finish
      end
    end