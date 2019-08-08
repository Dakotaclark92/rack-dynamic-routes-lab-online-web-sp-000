    class Application
      
      @@items = [Item.new("name", "price")]
     
      def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)
        
        if req.path.match(/items/)
          
          item_name = req.path.split("/items").last
          item = @@items.find{|i| i.name == item_name}
          
          resp.write item.price
        end
        
        resp.finish
      end
    end