//
//  StartGame.swift
//  SAPChallenge3
//
//  Created by Tessa Lee on 6/11/25.
//

let animals = [ "Elephant", "Tiger", "Dolphin", "Kangaroo", "Lion", "Panda", "Bat",
  "Giraffe", "Wolf", "Zebra", "Eagle", "Penguin", "Owl", "Parrot",
  "Flamingo", "Crow", "Peacock", "Hummingbird", "Sparrow", "Falcon",
  "Crocodile", "Snake", "Turtle", "Lizard", "Chameleon", "Frog",
  "Salamander", "Toad", "Newt", "Fish", "Shark", "Clownfish", "Salmon",
  "Tuna", "Goldfish", "Butterfly", "Spider", "Octopus", "Crab",
  "Jellyfish", "Snail" ]

let items = [ "Chair", "Table", "Lamp", "Mirror", "Clock", "Sofa", "Bed", "Blanket", "Pillow", "Television",
  "Spoon", "Fork", "Knife", "Plate", "Cup", "Frying pan", "Refrigerator", "Blender", "Oven", "Toaster",
  "Pen", "Pencil", "Notebook", "Ruler", "Eraser", "Scissors", "Stapler", "Paper clip", "Calculator", "Laptop",
  "Smartphone", "Headphones", "Keyboard", "Mouse", "Tablet", "Printer", "USB drive", "Camera", "Charger", "Smartwatch" ]

let challenges = [  "draw without erasing/with a pen",
  "try drawing in a different style",
  "use a randomly generated color palette",
  "Draw a jungle environment",
  "Draw an art piece but you cannot use the undo button",
  "Draw normally, except when you want to change colors, you have to close your eyes when selecting it",
  "Draw using only monochrome tonal values",
  "Draw with your eyes closed, you can only open them every 5 seconds",
  "Draw the first thing you see when you look down",
  "Draw the first thing you see when you look up",
  "Draw the first thing you see when you look left",
  "Draw the first thing when you look right",
  "Draw your interpretation of your chinese zodiac sign",
  "Draw your interpretation of your star/zodiac sign",
  "Search up your birthday + nasa, then draw the picture you get",
  "Draw a human version of an animal",
  "Draw a human version of a flower",
  "Draw a human version of apps",
  "Draw your pet",
  "Draw your fingers as a family",
  "Do nail art",
  "Take a picture of yourself and draw accessories on yourself",
  "Take a picture of mundane objects and photobash it",
  "Close your eyes and draw a random line, continuing the line to create something new",
  "Draw different brands of footwear",
  "Learn to model the doughnut in blender",
  "Draw a supernatural being",
  "Try to imitate the style of a popular artist",
  "Draw a stretched out version of a normal object",
  "Draw a squished version of a normal object" ]

let locations = [ "Beach", "Forest", "Mountain", "Desert", "Canyon", "Riverbank", "Waterfall", "Lake", "Meadow", "Jungle", "City street", "Marketplace", "Train station",  "Airport", "Bus stop", "Library", "School classroom", "University campus", "Office building", "Restaurant", "Cafe", "Bakery", "Supermarket", "Hospital", "Playground", "Park", "Zoo",
  "Aquarium",
  "Museum",
  "Art gallery",
  "Amusement park",
  "Sports stadium",
  "Gym",
  "Swimming pool",
  "Hotel lobby",
  "Bedroom",
  "Living room",
  "Basement",
  "Attic",
  "Garage" ]

var combinedRod: [String] {
    return animals + locations + items
}
