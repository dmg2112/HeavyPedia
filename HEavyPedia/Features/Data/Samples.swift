//
//  File.swift
//  HEavyPedia
//
//  Created by david M on 27/05/2019.
//  Copyright © 2019 david M. All rights reserved.


import foundation


var hetfield = Musician(photo: "hetfield",name: "James", surname: "Hetfield", birth: Calendar.current.date(from: DateComponents(year:1963,month:8,day:03)) )

var ulrich = Musician(photo: "ulrich",name: "Lars", surname: "Ulrich", birth: Calendar.current.date(from: DateComponents(year:1963,month:12,day:26)) )

var hammet =  Musician(photo: "hammet",name: "Kirk", surname: "Hammet", birth: Calendar.current.date(from: DateComponents(year:1963,month:8,day:3)) )

var trujillo = Musician(photo: "robTrujillo",name: "Robert", surname: "Trujillo", birth: Calendar.current.date(from: DateComponents(year:1964,month:10,day:23)) )

var ronnieJamesDio = Musician(photo: "ronnieJames",name: "Ronnie ", surname: "James Dio", birth: Calendar.current.date(from: DateComponents(year:1942,month:7,day:10)), defunction:Calendar.current.date(from: DateComponents(year:2010,month:5,day:16)))

var goldy = Musician(photo: "goldy",name: "Craig", surname: "Goldy", birth: Calendar.current.date(from: DateComponents(year:1961,month:11,day:6)) )

var sarzo = Musician(photo: "sarzo",name: "Rudy", surname: "Sarzo", birth: Calendar.current.date(from: DateComponents(year:1950,month:11,day:18)) )

var wright = Musician(photo: "wright",name: "Simon", surname: "Wright", birth: Calendar.current.date(from: DateComponents(year:1963,month:6,day:19)) )

var warren =  Musician(photo: "warren",name: "Scott", surname: "Warren", birth: Calendar.current.date(from: DateComponents(year:1962,month:11,day:11)) )

var iommi =  Musician(photo: "iommi",name: "Tony", surname: "Iommi", birth: Calendar.current.date(from: DateComponents(year:1948,month:2,day:19)) )

var ozzy =  Musician(photo: "ozzy",name: "Ozzy", surname: "Osbourne", birth: Calendar.current.date(from: DateComponents(year:1948,month:3,day:12)) )

var buttler = Musician(photo: "buttler",name: "Geezer", surname: "Buttler", birth: Calendar.current.date(from: DateComponents(year:1949,month:7,day:17)) )

var ward = Musician(photo: "ward",name: "Bill", surname: "Ward", birth: Calendar.current.date(from: DateComponents(year:1948,month:5,day:5)) )

var artists: [Musician] = [hetfield,ulrich,trujillo,hammet,ronnieJamesDio,goldy,sarzo,wright,warren,iommi,ozzy,buttle,ward]


var puppets = Album(photo: "masterofpuppets", name: "Master of Puppets",trackList: ["Battery","Master of puppets","The thing that should not be","Welcome home (sanitarium)","Disposable heroes","Leper messiah","Orion","Damage Inc"],group: metallica,year:Calendar.current.date(from: DateComponents(year:1986,month:7,day:1)) )

var killemall = Album(photo: "killemall", name: "Kill'Em All",trackList:["Hit the lights","The four horsemen","Motorbreath","(Anesthesia) Pulling teeth","Wiplash","Phantom lord","No remorse","Seek and destroy","Metal militia"],group: metallica,year:Calendar.current.date(from: DateComponents(year:1983,month:7,day:25)) )

var paranoid = Album(photo: "paranoid", name: "Paranoid",trackList:["War pigs","Paranoid","Planet caravan","Iron man","Electric funeral","Hand of doom","Rat salad","Fairies wear boots"],group: blackSabbath,year:Calendar.current.date(from: DateComponents(year:1970,month:9,day:18)) )

var records: [Album] = [killemall,puppets,paranoid]


var metallica = Group(photo:"metallica",name: "Metallica", debut:Calendar.current.date(from: DateComponents(year:1982,month:3,day:14)) , members: [hetfield,ulrich,hammet,trujillo], genre: .thrash
)

var dioBand = Group(photo:"dioBand",name: "DIO", debut:Calendar.current.date(from: DateComponents(year:1983,month:5,day:25)) , members: [ronnieJamesDio,goldy,sarzo,warren,wright], genre: .heavy
)

var blackSabbath = Group(photo:"sabbath",name: "Black Sabbath", debut:Calendar.current.date(from: DateComponents(year:1969,month:8,day:30)) , members: [ozzy,iommi,buttler], genre: .heavy,past: [ronnieJamesDio]
)

var bands = [metallica,dioBand,blackSabbath]


let wacken = Festival(photo:"wacken",name: "Wacken Open Air" , location: "Wacken, GER" ,description: "The biggest festival of metal and rock in the world. 30 years have been there, rocking the world. A must if you are into metal")


var fests: [Festival]? = [wacken]












