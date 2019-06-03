//
//  File.swift
//  HEavyPedia
//
//  Created by david M on 27/05/2019.
//  Copyright © 2019 david M. All rights reserved.
//

import Foundation



var hetfield = Musician(photo: "hetfield",name: "James", surname: "Hetfield", birth: Calendar.current.date(from: DateComponents(year:1963,month:8,day:03)) )

var ulrich = Musician(photo: "ulrich",name: "Lars", surname: "Ulrich", birth: Calendar.current.date(from: DateComponents(year:1963,month:12,day:26)) )

var hammet =  Musician(photo: "hammet",name: "Kirk", surname: "Hammet", birth: Calendar.current.date(from: DateComponents(year:1963,month:8,day:3)) )

var trujillo = Musician(photo: "robTrujillo",name: "Robert", surname: "Trujillo", birth: Calendar.current.date(from: DateComponents(year:1964,month:10,day:23)) )
var ronnieJamesDio = Musician(photo: "ronnieJames",name: "Ronnie ", surname: "James Dio", birth: Calendar.current.date(from: DateComponents(year:1942,month:7,day:10)), defunction:Calendar.current.date(from: DateComponents(year:2010,month:5,day:16)))
var goldy = Musician(photo: "goldy",name: "Craig", surname: "Goldy", birth: Calendar.current.date(from: DateComponents(year:1963,month:8,day:3)) )



var musicians: [Musician] = [hetfield,ulrich,trujillo,hammet]







var puppets = Album(photo: "masterOfPuppets", name: "Master of Puppets",producer: "Flemming Rassmusen",group: metallica,year:Calendar.current.date(from: DateComponents(year:1986,month:7,day:1)) )

var killemall = Album(photo: "killEmAll", name: "Kill'Em All",producer:"Paul Curcio",group: metallica,year:Calendar.current.date(from: DateComponents(year:1983,month:7,day:25)) )
var albums: [Album] = [killemall,puppets]
var metallica = Group(photo:"metallica",name: "Metallica", debut:Calendar.current.date(from: DateComponents(year:1982,month:3,day:14)) , members: [hetfield,ulrich,hammet,trujillo], retirement: nil, genre: .thrash
)
let wacken = Festival(photo:"wacken",name: "Wacken Open Air" , location: "Wacken, GER" ,description: "The biggest festival of metal and rock in the world. 30 years have been there, rocking the world. A must if you are into metal")
var festivals: [Festival]? = [wacken]

var groups = [metallica]






