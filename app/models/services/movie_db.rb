class Services::MovieDb
    BASE_URL = 'https://api.themoviedb.org'
    CACHE_POLICY = lambda { 5.minutes.ago }
  
    attr_reader :search

    def initialize(search)
        @search = search
    end
  
    def search
      BASE_URL + '/3/search/movie?' + {
        api_key: "452edde92ab88c555542fa97d61e641a", # TODO read from ENV['MOVIE_DB_KEY']]
        query: @search
      }.to_query
    end
end