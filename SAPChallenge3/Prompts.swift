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

let challenges = ["Draw with a pen",
  "Draw in a different style",
  "Use a random color palette",
  "Draw with a jungle background",
  "Draw without the undo button/eraser",
  "Close your eyes when selecting the color",
  "Use only with monochrome tonal values",
  "Draw with your eyes closed",
  "Draw the first thing you see when you look down",
  "Draw the first thing you see when you look up",
  "Draw the first thing you see when you look left",
  "Draw the first thing you see when you look right",
  "Draw your chinese zodiac sign",
  "Draw your star/zodiac sign",
  "Search 'your birthday + NASA' and draw it",
  "Draw a human version of an animal",
  "Draw a human version of a flower",
  "Draw your pet",
  "Do nail art",
  "Take a picture of yourself and draw accessories on yourself",
  "Take a picture of mundane objects and photobash it",
  "Learn to model the doughnut in blender",
  "Try to imitate the style of a popular artist",
  "Use markers only",
  "Use crayons only",
  "Draw an emotion as if it were a creature",
  "Make a short comic",
  "Draw with your non-dominant hand",
  "Draw your favourite fictional character",
  "Draw upside down",
  "Complete a drawing with one line",
  "Redraw an old art piece"]


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

let food = [
    "Pizza",
    "Sushi",
    "Burger",
    "Spaghetti",
    "Fried rice",
    "Pancakes",
    "Ice cream",
    "Ramen",
    "Salad",
    "Sandwich",
    "Donut",
    "Steak",
    "Tacos",
    "Dumplings",
    "Chocolate cake",
    "Popcorn",
    "French fries",
    "Chicken wings",
    "Noodles",
    "Watermelon",
    "Hotdog",
    "Curry",
    "Mashed potatoes",
    "Nachos",
    "Muffins",
    "Omelette",
    "Brownies",
    "Fish and chips",
    "Smoothie",
    "Apple pie"
]


var combinedRod: [String] {
    return animals + locations + items
}
