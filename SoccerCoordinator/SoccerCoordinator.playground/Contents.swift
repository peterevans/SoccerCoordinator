// Project #1: Soccer Coordinator

// Dictionary containing the full list of players

let players = [
    ["name": "Joe Smith", "height": "42", "experience": "yes", "guardian": "Jim and Jan Smith"],
    ["name": "Jill Tanner", "height": "36", "experience": "yes", "guardian": "Clara Tanner"],
    ["name": "Bill Bon", "height": "43", "experience": "yes", "guardian": "Sara and Jenny Bon"],
    ["name": "Eva Gordon", "height": "45", "experience": "no", "guardian": "Wendy and Mike Gordon"],
    ["name": "Matt Gill", "height": "40", "experience": "no", "guardian": "Charles and Sylvia Gill"],
    ["name": "Kimmy Stein", "height": "41", "experience": "no", "guardian": "Bill and Hillary Stein"],
    ["name": "Sammy Adams", "height": "45", "experience": "no", "guardian": "Jeff Adams"],
    ["name": "Karl Saygan", "height": "42", "experience": "yes", "guardian": "Heather Bledsoe"],
    ["name": "Suzane Greenberg", "height": "44", "experience": "yes", "guardian": "Henrietta Dumas"],
    ["name": "Sal Dali", "height": "41", "experience": "no", "guardian": "Gala Dali"],
    ["name": "Joe Kavalier", "height": "39", "experience": "no", "guardian": "Sam and Elaine Kavalier"],
    ["name": "Ben Finkelstein", "height": "44", "experience": "no", "guardian": "Aaron and Jill Finkelstein"],
    ["name": "Diego Soto", "height": "41", "experience": "yes", "guardian": "Robin and Sarika Soto"],
    ["name": "Chloe Alaska", "height": "47", "experience": "no", "guardian": "David and Jamie Alaska"],
    ["name": "Arnold Willis", "height": "43", "experience": "no", "guardian": "Claire Willis"],
    ["name": "Phillip Helm", "height": "44", "experience": "yes", "guardian": "Thomas Helm and Eva Jones"],
    ["name": "Les Clay", "height": "42", "experience": "yes", "guardian": "Wynonna Brown"],
    ["name": "Herschel Krustofski", "height": "45", "experience": "yes", "guardian": "Hyman and Rachel Krustofski"]
]


// create team Names and empty arays for the rosters

let team1Name = "Dragons"
let team1PracticeTime = "March 17, 1pm"
var teamDragons: [[String: String]] = []

let team2Name = "Sharks"
let team2PracticeTime = "March 17, 3pm"
var teamSharks: [[String: String]] = []

let team3Name = "Raptors"
let team3PracticeTime = "March 18, 1pm"
var teamRaptors: [[String: String]] = []

// empty array to hold the letters for each player's parents
var letters: [String] = []


// this function uses a bubble sort to sort a roster by height, returns a sorted roster
func sortByHeight(roster: [[String: String]]) -> [[String: String]] {
    var sortedRoster = roster
    
    while true {
        var swapped = false
        for index in 1..<sortedRoster.count {
            if sortedRoster[index]["height"]! < sortedRoster[index - 1]["height"]! {
                let temp = sortedRoster[index]
                sortedRoster[index] = sortedRoster[index - 1]
                sortedRoster[index - 1] = temp
                swapped = true
            }
        }
        if !swapped {
            break
        }
    }
    return sortedRoster
}


// prints out the avergae height for a given roster
func printAvgHeight(roster: [[String: String]]) {
    var sumOfHeights = 0.0
    for player in roster {
        sumOfHeights = sumOfHeights + Double(player["height"]!)!
    }
    let avgRosterHeight = sumOfHeights / Double(roster.count)
    print(" Average Team Height: \(avgRosterHeight)")
}

// function takes a list of players and splits them evenly into three teams
// the loop runs through and adds every thrid player to a specific team roster

func splitToThreeTeams(roster: [[String: String]]) {
    var index: Int = 0
    while index < roster.count {
        if index % 3 == 0 {
            teamDragons.append(roster[index])
        }
        else if index % 3 == 1 {
            teamSharks.append(roster[index])
        }
        else {
            teamRaptors.append(roster[index])
        }
        index += 1
    }
}

// this function loops through a given roster and creates an individual letter for each player's parents. These individual letters are then added to the main letters array

func generateTeamLetters(teamName: String, teamPracticeTime: String, roster: [[String: String]]) {
    var parentLetter: String = ""
    for player in roster {
        parentLetter = "Dear \(player["guardian"]!), Welcome to your new soccer team. Please check the following info for \(player["name"]!). Team Name: \(teamName), First Practice Time: \(teamPracticeTime)."
        letters.append(parentLetter)
    }
}

// create two lists, one for experienced players, one for non-experienced players

var experiencedList: [[String: String]] = []
var nonexperiencedList: [[String: String]] = []



for player in players {
    if player["experience"] == "yes" {
        experiencedList.append(player)
    }
    else {
        nonexperiencedList.append(player)
    }
}

experiencedList = sortByHeight(roster: experiencedList)
nonexperiencedList = sortByHeight(roster: nonexperiencedList)



//calls the fucntion to take each team list and split it into three team roster_list
splitToThreeTeams(roster: experiencedList)
splitToThreeTeams(roster: nonexperiencedList)

printAvgHeight(roster: experiencedList)
printAvgHeight(roster: nonexperiencedList)

// generates the letters for each team
generateTeamLetters(teamName: team1Name, teamPracticeTime: team1PracticeTime, roster: teamDragons)
generateTeamLetters(teamName: team2Name, teamPracticeTime: team2PracticeTime, roster: teamSharks)
generateTeamLetters(teamName: team3Name, teamPracticeTime: team3PracticeTime, roster: teamRaptors)

// displays the letters in the console
for letter in letters {
    print(letter)
}





