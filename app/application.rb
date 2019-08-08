    class Application
      
      @@items = []
     
      def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)
        
        if req.path.match(/items/)
          
          items_name = req.path.split("/items").last
          items = @@items.find{|i| i.name == items_name}
          
          resp.write items.name
          

          
          
        else
          resp.write "Route not found"
          resp.status = 404
        end
        
        resp.finish
      end
    end