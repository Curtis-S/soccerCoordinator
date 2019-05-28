import UIKit

/*
 The dictionary for the players is a dictionary that contains another dictionary for the player attributes
 */
// test player info
let joe: [String:String] = ["name":"Joe smith","height":"","isExperienced":"true","guardian(s)":"Jim and Jan Smith"]

let players: [String:[String:Any]] = ["Joe smith":["height":42,"isExperienced":true,"guardian(s)":"Jim and Jan Smith"],
                  "Jill Tanner":["height":36,"isExperienced":true,"guardian(s)":"Clara Tanner"],
                  "Bill Bon":["height":43,"isExperienced":true,"guardian(s)":"Sara and Jenny Bon"],
                  "Eva Gordon":["height":45,"isExperienced":false,"guardian(s)":"Wendy and Mike Gordon"],
                  "Matt Gill":["height":40,"isExperienced":false,"guardian(s)":"Charles and Sylvia Gill"],
                  "Kimmy Stien":["height":41,"isExperienced":false,"guardian(s)":"Bill and Hillary Stein"],
                  "sammy Adams":["height":45,"isExperienced":false,"guardian(s)":"Jeff Adams"],
                  "karl Saygan":["height":42,"isExperienced":true,"guardian(s)":"Heather Bledsoe"],
                  "Suzane Greenberg":["height":44,"isExperienced":true,"guardian(s)":"Henrietta Dumas"],
                  "Sal Dali":["height":41,"isExperienced":false,"guardian(s)":"Gala Dali"],
                  "Joe Kavalier":["height":39,"isExperienced":false,"guardian(s)":"Sam and Elaine Kavalier"],
                  "Ben Finkelstein":["height":44,"isExperienced":false,"guardian(s)":"Aaron and Jill Finkelstein"],
                  "Diego Soto":["height":41,"isExperienced":true,"guardian(s)":"Robin and Sarika Soto"],
                  "Chloe Alaska":["height":47,"isExperienced":false,"guardian(s)":"David and Jamie Alaska"],
                  "Arnold Willis":["height":43,"isExperienced":false,"guardian(s)":"Claire Willis"],
                  "Phillip Helm":["height":44,"isExperienced":true,"guardian(s)":"Thomas Helm and Eva Jones"],
                  "Les Clay":["height":42,"isExperienced":true,"guardian(s)":"Wynonna Brown"],
                  "Herschel Krustofski":["height":45,"isExperienced":true,"guardian(s)":"Hyman and Rachel Krustofski"]]

/*
 Here is the data stuctures declared that will store the team members and the guardians letters that get genreated
 */
var teamRaptors: [(key: String, value: [String : Any])] = []
var teamSharks : [(key: String, value: [String : Any])] = []
var teamDragons: [(key: String, value: [String : Any])] = []
var guardianLetters: [String] = []

/*
 this is the fucntion that splits the players into the three equal teams with expereinced playes divided amoung the three
 */
func teamSort(all players:[String:[String:Any]]){
    var experiencedPlayers: [(key: String, value: [String : Any])] = []
    var nonExperiencedPlayers: [(key: String, value: [String : Any])] = []
    
    for player in players {
        if let playerIsExperienced = player.value["isExperienced"]{
            if playerIsExperienced as! Bool {
                experiencedPlayers.append(player)
            }else {
                nonExperiencedPlayers.append(player)
            }
        }
    }
    
    for player in 0..<experiencedPlayers.count {
        if player % 3 == 0 {
            teamRaptors.append(experiencedPlayers[player])
        }else if player % 3 == 1 {
            teamSharks.append(experiencedPlayers[player])
        } else {
            teamDragons.append(experiencedPlayers[player])
        }
    }
    
    for player in 0..<nonExperiencedPlayers.count {
        if player % 3 == 0 {
            teamRaptors.append(nonExperiencedPlayers[player])
        }else if player % 3 == 1 {
            teamSharks.append(nonExperiencedPlayers[player])
        } else {
            teamDragons.append(nonExperiencedPlayers[player])
        }
    }
}
/*
 this is the function to genertate the letters
 for the gurdians of the team members and stores them in the gurdian letters array
 */
func generateLetters(){
    var letter = ""
    
    for member in teamDragons {
        letter = "Dear \(member.value["guardian(s)"]!), \n your child \(member.key) has been drafted to the Dragons and the practice date is March 17, 1pm \n\n\n"
        guardianLetters.append(letter)
    }
    
    for member in teamSharks {
        letter = "Dear \(member.value["guardian(s)"]!), \n your child \(member.key) has been drafted to the Sharks and the practice date is March 17, 3pm \n\n\n"
        guardianLetters.append(letter)
    }
    
    for member in teamRaptors {
        letter = "Dear \(member.value["guardian(s)"]!), \n your child \(member.key) has been drafted to the Raptors and the practice date is March 18, 1pm \n\n\n"
        guardianLetters.append(letter)
    }
}


// function to print the letters to the console
func printLetters(){
    for letter in guardianLetters{
        print(letter)
    }
}
// function to print player detials requires name
func printPlayerDetails(for player:String){
    if let playerDetails  = players[player] {
    print(" name - \(player)\n height- \(playerDetails["height"]!)\n experienced - \(playerDetails["isExperienced"]!)\n guardian name(s)- \(playerDetails["guardian(s)"]!)" )
    }
}
printPlayerDetails(for: "Joe smith")

// running all functions to see if it runs as intended
teamSort(all: players)
generateLetters()
printLetters()



  


