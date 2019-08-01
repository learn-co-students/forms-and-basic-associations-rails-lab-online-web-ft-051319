class Song < ActiveRecord::Base
  # add associations here
      belongs_to :genre
      belongs_to :artist
      has_many :notes

      def artist_name=(name)
        self.artist = Artist.find_or_create_by(name: name)
      end 

      def artist_name 
        self.artist ? self.artist.name : nil
      end 

     def genre_name=(name)
        genre = Genre.find_or_create_by(name:  name)
        self.genre = genre 
    end 

    def genre_name 
      self.genre ? self.genre.name : nil 
    end 

    def note_contents=(contents)
      contents.each do |content|
        if content.strip  != ""
          self.notes.build(content: content)
        end 
      end 
    end 

    def note_contents 
      self.notes.map do |note|
        note.content
      end 
    end 
    
end 