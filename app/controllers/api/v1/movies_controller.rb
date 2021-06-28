class Api::V1::MoviesController < ActionController::API
    def search  
        query = params[:query]
        
        if query.blank?
            send_error_message("Please specify a search criteria (example: /search?query=Gump)", 400) 
        else
            render json: Search.cache(
                Services::MovieDb.new(query).search,
                Services::MovieDb::CACHE_POLICY
            )
        end
    end

    def send_error_message(error, code=500)
        render json: {'error_message' => "#{error}"}.to_json, status: code
    end
end