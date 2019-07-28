class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
     self.artist ? self.artist.name : nil
  end

  def genre_name=(name)
      self.genre= Genre.find_or_create_by(name: name)
  end

  def genre_name
      self.genre ? self.genre.name : nil
  end

  def note_contents= (contents)
    # byebug
    contents.each do |content|
      if content != ""
        newnote = Note.create(content: content, song_id: self.id)
      end
      # newnote.song_id = self.id

    end
  end

  def note_contents
    notearray=Note.where(song_id: self.id)
    returnarray=notearray.map do |note|
       note.content
     end
     # byebug
     returnarray
  end
  def note_ids=(ids)
    ids.each do |id|
     note = Note.find(id)
     self.notes << note
    end
  end

  def notes
    Note.where(song_id: self.id)
  end






  # def artist_name
  #     self.artist.name if self.artist
  # end
  #
  # def artist_name=(aname)
  #   @artist=self.artist.new(name: aname)
  #   @artist.save
  #
  # end
end
