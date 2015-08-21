class Book < ActiveRecord::Base
	validates :title, presence: {
		message: "Le titre doit etre renseigne."
	}

	validates :title, uniqueness: {
		message: "Ce titre est deja pris."
	}
end
