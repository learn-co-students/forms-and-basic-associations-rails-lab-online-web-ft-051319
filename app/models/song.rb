require 'pry'

class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist=Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def genre_name=(name)
    self.genre=Genre.find_or_create_by(name:name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def note_contents=(content)
    content=content.reject{|c| c.empty?}
    content.each do |c|
      note=Note.create(content: c)
      self.notes << note
    end
  end

  def note_contents
    self.notes ? self.notes.map{|note| note.content} : nil
  end

end
