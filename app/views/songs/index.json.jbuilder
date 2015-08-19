json.array!(@songs) do |song|
  json.extract! song, :id, :year, :rank, :artist, :name
  json.url song_url(song, format: :json)
end
