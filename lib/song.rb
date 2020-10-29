require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    @@all << song 
    song 
  end 

  def self.new_by_name(name)
    song = self.new
    song.name = name 
    song
  end 

  def self.create_by_name(name)
    song = self.new 
    song.name = name 
    @@all << song 
    song
  end 

  def self.find_by_name(name)
    @@all.find {|s| s.name == name }
  end 

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    song ? song : self.create_by_name(name)
  end 

  def self.alphabetical
    self.all.sort_by {|s| s.name} 
  end

  def self.new_from_filename(filename)
      n = filename.gsub(".mp3","")
      array = n.split(" - ")
      song_name = array[1]
      artist_name = array[0]
      song = self.new
      song.name = song_name
      song.artist_name = artist_name
      song
  end
  
  def self.create_from_filename(filename)
    n = filename.gsub(".mp3","")
    array = n.split(" - ")
    song_name = array[1]
    artist_name = array[0]
    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end
  
  def self.destroy_all
    @@all.clear
  end 
end
