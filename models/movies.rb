class Movies
    include DataMapper::Resource

    property :id,           Serial
    property :title,        String,  :required => true
    property :director,     String,  :required => false
    property :year,         Integer, :required => true
    property :active,       Boolean, :default => true
end
