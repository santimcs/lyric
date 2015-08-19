class InsertSongs < ActiveRecord::Base

  file_in = 'db/SONGS.csv'
  file = File.open(file_in,"r")

  file.each do |line|
    ary = line.split("|")
    year = ary[0]
    rank = ary[1]
    artist = ary[2]
    name = ary[3]
    if Song.where(year: ary[0], rank: ary[1]).exists?
    else
      Song.create(:year => year, :rank => rank, :artist => artist, :name => name)
    end
  end

end
