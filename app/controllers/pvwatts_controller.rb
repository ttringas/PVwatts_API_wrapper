require 'net/http'

class PvwattsController < ApplicationController
  def index
     begin
        uri = "http://developer.nrel.gov/api/georeserv/app/sam/pvwatts.json?api_key=63c942412438e444a28152d4ffe3ea9a4d8467a2&timeframe=monthly&"
        # omit true Rails query parameters, and append the rest back to the URI
        query_string = params.select {|k,v| not %w[action controller source format].include?(k)}
        query_params = query_string.collect {|k,v| "#{k}=#{URI::escape(v)}"}
        uri << query_params.join("&")
        # add default system size if left blank
          if params[:system_size].blank?
            uri << "&system_size=4.0"
          end
        #fetch the contents from NREL API http://developer.nrel.gov/doc/api/georeserv/app/sam/pvwatts
        
        url_contents = Net::HTTP.get(URI.parse(uri))
        data = JSON.parse(url_contents)
      rescue
        data = { "error" => ["network error"] }
      end
      respond_to do |format|
        format.json {render json: data}
      end
   end
end


