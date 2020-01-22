require ('pry')
require_relative('./models/albums')
require_relative('./models/artist')

Album.delete_all()
Artist.delete_all()




musician1=Artist.new({'name'=>'Bon Jovi'})
musician2=Artist.new({'name'=>'Weezer'})

musician1.save()
musician2.save()
album1=Album.new({'title'=>'Slippery When Wet','genre'=>'Soft Rock','artist_id'=>musician1.id})
album2=Album.new({'title'=>'Pinkerton','genre'=>'Indie','artist_id'=>musician2.id})


album1.save()
album2.save()

binding.pry
nil
