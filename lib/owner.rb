class Owner
  attr_reader :name, :species 
  @@all = []
  
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end
  
  def say_species
    "I am a #{species}."
  end 
  
  def self.all 
    @@all 
  end
  
  def self.count
    @@all.count
  end
  
  def self.reset_all
    self.all.clear
  end
  
  def cats 
    Cat.all.select {|cats| cats.owner == self}
  end
  
  def dogs 
    Dog.all.select {|dogs| dogs.owner == self}
  end
  
  def buy_cat(name)
    cat = Cat.new(name, self)
  end
  
  def buy_dog(name)
    dog = Dog.new(name, self)
  end
  
  def walk_dogs
    Dog.all.select {|i| i.mood = "happy"}
  end
  
  def feed_cats
    Cat.all.select {|i| i.mood = "happy"}
  end 
  
  def sell_pets
    Dog.all.select {|i| i.mood = "nervous"}
    Cat.all.select {|i| i.mood = "nervous"}
    Dog.all.each {|x| x.owner = nil} # I have no idea what I'm doing
    Cat.all.each {|x| x.owner = nil} # Test... must... pass... 
  end 
  
  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end