import UIKit


//: ## 1. Create custom types to represent an Airport Departures display
//: ![Airport Departures](matthew-smith-5934-unsplash.jpg)
//: Look at data from [Departures at JFK Airport in NYC](https://www.airport-jfk.com/departures.php) for reference.
//:
//: a. Use an `enum` type for the FlightStatus (En Route, Scheduled, Canceled, Delayed, etc.)
//:
//: b. Use a struct to represent an `Airport` (Destination or Arrival)
//:
//: c. Use a struct to represent a `Flight`.
//:
//: d. Use a `Date?` for the departure time since it may be canceled.
//:
//: e. Use a `String?` for the Terminal, since it may not be set yet (i.e.: waiting to arrive on time)
//:
//: f. Use a class to represent a `DepartureBoard` with a list of departure flights, and the current airport
enum FlightStatus: String { // options
  case Route
  case Scheduled
  case Canceled
  case Delayed
}

struct Airport {
    let name: String
    let abrreviation: String
  }

struct Flight {
    var destination: String
    var airline: String
    var flight: String
    var departure: Date?
    var terminal: String?
    var status: FlightStatus
    
}

class DepartureBoard {
    var depFlight: [Flight]
    var currAir: Airport
    

    init(name: String, abrreviation: String){
        currAir = Airport(name: name, abrreviation: abrreviation)
        self.depFlight = []
        
  }
    func alertPassenger(){
        for deperatures in depFlight {
            var depTime = String()
            var terminalNumber = String()
            
            if let time = deperatures.departure {
                depTime = "\(DateFormatter().string(from: time))"
            } else {
                depTime = "TBD"
            }
            
            if let number = deperatures.terminal {
                terminalNumber = "\(number)"
            } else {
                terminalNumber = "TBD"
                
            }
            switch (deperatures.status){
            case .Canceled:
                print("We're sorry your flight to \(deperatures.destination) was canceled, here is a $500 voucher")
            case .Delayed:
                print("Your flight has been delayed")
            case .Scheduled:
                print("Your flight to \(deperatures.destination) is scheduled to depart at \(depTime) from terminal: \(terminalNumber)")
            case .Route:
                print("Your flight is boarding, please head to terminal: \(terminalNumber) immediately. The doors are closing soon.")
                
            }
            
        }
    }
}
//: ## 2. Create 3 flights and add them to a departure board
//: a. For the departure time, use `Date()` for the current time
//:
//: b. Use the Array `append()` method to add `Flight`'s
//:
//: c. Make one of the flights `.canceled` with a `nil` departure time
//:
//: d. Make one of the flights have a `nil` terminal because it has not been decided yet.
//:
//: e. Stretch: Look at the API for [`DateComponents`](https://developer.apple.com/documentation/foundation/datecomponents?language=objc) for creating a specific time
let flight1 = Flight(destination: "NY", airline: "JFK", flight: "8", departure: Date(), terminal: "3", status: .Canceled)
let flight2 = Flight(destination: "NJ", airline: "JFK", flight: "2", departure: nil, terminal: "4", status: .Route)
let flight3 = Flight(destination: "TX", airline: "LGA", flight: "5", departure: Date(), terminal: nil, status: .Delayed)

let ticket1 = DepartureBoard(name: "JFK", abrreviation: "JFK")
ticket1.depFlight.append(flight1)
ticket1.depFlight.append(flight2)
ticket1.depFlight.append(flight3)

//: ## 3. Create a free-standing function that can print the flight information from the `DepartureBoard`
//: a. Use the function signature: `printDepartures(departureBoard:)`
//:
//: b. Use a `for in` loop to iterate over each departure
//:
//: c. Make your `FlightStatus` enum conform to `String` so you can print the `rawValue` String values from the `enum`. See the [enum documentation](https://docs.swift.org/swift-book/LanguageGuide/Enumerations.html).
//:
//: d. Print out the current DepartureBoard you created using the function
func printDepartures(departureBoard: DepartureBoard){
    for departures in departureBoard.depFlight{
        print(departures.status.rawValue)

        
        
}
}

//: ## 4. Make a second function to print print an empty string if the `departureTime` is nil
//: a. Createa new `printDepartures2(departureBoard:)` or modify the previous function
//:
//: b. Use optional binding to unwrap any optional values, use string interpolation to turn a non-optional date into a String
//:
//: c. Call the new or udpated function. It should not print `Optional(2019-05-30 17:09:20 +0000)` for departureTime or for the Terminal.
//:
//: d. Stretch: Format the time string so it displays only the time using a [`DateFormatter`](https://developer.apple.com/documentation/foundation/dateformatter) look at the `dateStyle` (none), `timeStyle` (short) and the `string(from:)` method
//:
//: e. Your output should look like:
//:
//:     Destination: Los Angeles Airline: Delta Air Lines Flight: KL 6966 Departure Time:  Terminal: 4 Status: Canceled
//:     Destination: Rochester Airline: Jet Blue Airways Flight: B6 586 Departure Time: 1:26 PM Terminal:  Status: Scheduled
//:     Destination: Boston Airline: KLM Flight: KL 6966 Departure Time: 1:26 PM Terminal: 4 Status: Scheduled
func printDepartures2(departureBoard: DepartureBoard){
    for departures in departureBoard.depFlight{
        var depTime = String()
        var terminalNumber = String()
        
        if let time = departures.departure {
            depTime = "\(DateFormatter().string(from: time))"
        }
        
        if let number = departures.terminal {
            terminalNumber = "\(number)"
        }
        print("\(departures.airline)-\(departures.destination)-\(departures.flight)-\(departures.status.rawValue)-\(depTime)-\(terminalNumber)")
    }
}
//: ## 5. Add an instance method to your `DepatureBoard` class (above) that can send an alert message to all passengers about their upcoming flight. Loop through the flights and use a `switch` on the flight status variable.
//: a. If the flight is canceled print out: "We're sorry your flight to \(city) was canceled, here is a $500 voucher"
//:
//: b. If the flight is scheduled print out: "Your flight to \(city) is scheduled to depart at \(time) from terminal: \(terminal)"
//:
//: c. If their flight is boarding print out: "Your flight is boarding, please head to terminal: \(terminal) immediately. The doors are closing soon."
//:
//: d. If the `departureTime` or `terminal` are optional, use "TBD" instead of a blank String
//:
//: e. If you have any other cases to handle please print out appropriate messages
//:
//: d. Call the `alertPassengers()` function on your `DepartureBoard` object below
//:
//: f. Stretch: Display a custom message if the `terminal` is `nil`, tell the traveler to see the nearest information desk for more details.
  ticket1.alertPassenger()


// let time = deperature.deperatures ?? "TBA"



//: ## 6. Create a free-standing function to calculate your total airfair for checked bags and destination
//: Use the method signature, and return the airfare as a `Double`
//:
//:     func calculateAirfare(checkedBags: Int, distance: Int, travelers: Int) -> Double {
//:     }
//:
//: a. Each bag costs $25
//:
//: b. Each mile costs $0.10
//:
//: c. Multiply the ticket cost by the number of travelers
//:
//: d. Call the function with a variety of inputs (2 bags, 2000 miles, 3 travelers = $750)
//:
//: e. Make sure to cast the numbers to the appropriate types so you calculate the correct airfare
//:
//: f. Stretch: Use a [`NumberFormatter`](https://developer.apple.com/documentation/foundation/numberformatter) with the `currencyStyle` to format the amount in US dollars.
func calculateAirfare(checkedBags: Int, distance: Int, travelers: Int) -> Double {
let bagCost = 25.0
let milesCost = 0.1

let totalBagCost = bagCost * Double(checkedBags) * Double(travelers)
let travelCost = milesCost * Double(distance) * Double(travelers)

return totalBagCost + travelCost

}



