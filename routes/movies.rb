get '/api/movies' do
    Movies.all.to_json
end

get '/api/movies/:id' do
    t = Movies.get(params[:id])
    if t.nil?
        halt 404
    end
    t.to_json
end

post '/api/movies' do
    body = JSON.parse request.body.read
    t = Movies.create(
        title:    body['title'],
        director: body['director'],
        year:     body['year'],
        active:   body['active']
    )
    status 201
    t.to_json 
end

put '/api/movies/:id' do
    body = JSON.parse request.body.read
    t = Movies.get(params[:id])
    if t.nil?
        halt 404
    end
    halt 500 unless Movies.update(
        title:      body['title'],
        director:   body['director'],
        year:       body['year'],
        active:     body['active'] 
    )
    t.to_json
end

delete '/api/movies/:id' do
    t = Movies.get(params[:id])
    if t.nil?
        halt 404
    end
    halt 500 unless t.destroy
end
