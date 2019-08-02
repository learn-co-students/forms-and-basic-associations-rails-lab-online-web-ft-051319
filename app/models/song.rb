class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
    # self.try(:artist).try(:name)
  end

  def genre_name=(name)
    self.genre = Genre.find_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
    # self.try(:genre).try(:name)
  end

  def note_contents=(contents)
    contents.reject(&:blank?).each do |content|
      note = Note.create(content: content)
      self.notes << note
    end
  end

  # def note_contents=(notes)
  #   notes.each do |content|
  #     if content.strip != ''
  #       self.notes.build(content: content)
  #     end
  #   end
  # end

  def note_contents
    song_notes = []
    self.notes.each do |note|
      song_notes << note.content
    end
    song_notes

    # self.notes.map(&:content)
  end

end
