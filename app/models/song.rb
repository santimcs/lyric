class Song < ActiveRecord::Base
	default_scope { order('year ASC, rank ASC')}
end
