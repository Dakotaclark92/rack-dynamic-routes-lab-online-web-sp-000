    class Application
      
      @@items = [Item.new("name", "price")]
     
      def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)
        
        if req.path.match(/item/)
          
          items_price = req.path.split("/item").last
          item = @@items.find{|i| i.price == items_price}
          
          resp.write items.name
        else
          resp.write "Route not found"
          resp.status = 404
        end
        
        resp.finish
      end
    end