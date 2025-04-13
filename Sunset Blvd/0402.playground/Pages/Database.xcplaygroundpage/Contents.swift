import SwiftUI

struct Pokemon: Codable {
    var id: Int
    var name: String
    var type: String
}

func getJson() {
    guard let url = URL(string: "http://localhost:3000/pokemons") else {
        print("Invalid URL")
        return
    }
    let request = URLRequest(url: url)
    URLSession.shared.dataTask(with: request) { (data, response, error) in
        if let error = error {
            print("Error: \(error)")
            return
        }
        
        guard let data = data else {
            print("No data returned")
            return
        }
        
        if let jsonString = String(data: data, encoding: .utf8) {
            print("Raw JSON response: \(jsonString)")
        }
        
        let decoder = JSONDecoder()
        do {
            let decodedPokemons = try decoder.decode([Pokemon].self, from: data)
//            print(decodedPokemons)
            
            for pokemon in decodedPokemons {
                print(pokemon.name)
            }
        } catch {
            print("Error decoding JSON: \(error)")
        }
    }.resume()
    
    
}
getJson()

func addPokemon(_ pokemon: Pokemon) {
    guard let url = URL(string: "http://localhost:3000/pokemons") else {
        print("Invalid URL")
        return
    }

    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")

    do {
        let jsonData = try JSONEncoder().encode(pokemon)
        request.httpBody = jsonData
    } catch {
        print("Error encoding Pokémon: \(error)")
        return
    }

    URLSession.shared.dataTask(with: request) { data, response, error in
        if let error = error {
            print("Error: \(error)")
            return
        }

        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            print("Server error")
            return
        }

        if let data = data, let responseString = String(data: data, encoding: .utf8) {
            print("Response: \(responseString)")
        }
    }.resume()
}

let newPokemon = Pokemon(id: 1, name: "canadianmoss", type: "Grass")
addPokemon(newPokemon)
