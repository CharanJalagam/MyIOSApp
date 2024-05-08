import Foundation

struct Joke: Codable {
    let joke: String
}

protocol JokesManagerDelegate{
    func getJoke(joke: String)
}
class JokesManager {
    
    var delegate : JokesManagerDelegate?
    func getdata() {
        let url = URL(string: "https://api.api-ninjas.com/v1/jokes?limit=1")!
        var request = URLRequest(url: url)
        request.setValue("Cvfb1HJ8xT2kmNL/gn/Z5Q==QmKA7CyyTBVSezoI", forHTTPHeaderField: "X-Api-Key")
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                print("No data received: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            do {
                // Use JSONDecoder to decode the JSON data into an array of Joke objects
                let jokes = try JSONDecoder().decode([Joke].self, from: data)
                
                // Access the properties of the decoded Joke objects
                for joke in jokes {
                    print("Joke: \(joke.joke)")
                    self.delegate?.getJoke(joke: joke.joke)
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
        
        task.resume()
    }
}
