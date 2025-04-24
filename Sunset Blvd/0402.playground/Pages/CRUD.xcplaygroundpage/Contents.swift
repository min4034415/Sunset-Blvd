//<file name=0 path=CRUD.xcplaygroundpage>//: [Previous](@previous)
//
//import Foundation // Import the Foundation framework for basic functionalities
//import SwiftUI // Import SwiftUI for building user interfaces
//
//var greeting = "Hello, playground" // Initialize a greeting variable
//
//let jsonDecoder = JSONDecoder() // Create an instance of JSONDecoder for decoding JSON data
////
////let url = URLRequest(url: URL(string: "http://localhost:3000/posts")!) // URLRequest commented out for future use
//
//struct post: Codable { // Define a struct named 'post' that conforms to Codable protocol
//    let id: String // Property to store the post's ID
//    let title: String // Property to store the post's title
//    let description: String // Property to store the post's description
//}
//
//struct PostDetailView: View {
//    let post: post
//    @State private var title: String
//    @State private var description: String
//
//    init(post: post) {
//        self.post = post
//        _title = State(initialValue: post.title)
//        _description = State(initialValue: post.description)
//    }
//
//    var body: some View {
//        Form {
//            TextField("Title", text: $title)
//            TextField("Description", text: $description)
//            Button("Save Changes") {
//                let updated = post(id: post.id, title: title, description: description)
//                Task {
//                    await updatePost(updated)
//                }
//            }
//        }
//        .navigationTitle("Edit Post")
//    }
//}
//
//func fetchPosts() async { // Define an asynchronous function to fetch posts
//    guard let url = URL(string: "http://localhost:3000/posts") else { // Safely unwrap the URL
//        print("Invalid URL") // Print error if URL is invalid
//        return // Exit the function if the URL is invalid
//    }
//    let request = URLRequest(url: url) // Create a URLRequest object with the URL
//    do {
//        let (data, response) = try await URLSession.shared.data(for: request) // Perform the network request and wait for the response
//        
//        guard let httpResponse = response as? HTTPURLResponse, // Check if the response is an HTTPURLResponse
//              (200...299).contains(httpResponse.statusCode) else { // Ensure the status code is in the success range
//            print("Server error") // Print error if the server response indicates an error
//            return // Exit the function if there's a server error
//        }
//
//        if let jsonString = String(data: data, encoding: .utf8) { // Convert the response data to a JSON string
//            print("Raw Json \(jsonString)") // Print the raw JSON string
//        }
//
//        let decodedPosts = try jsonDecoder.decode([post].self, from: data) // Decode the JSON data into an array of 'post' objects
//        for post in decodedPosts { // Iterate through the decoded posts
//            print("\(post.id): \(post.title)") // Print the ID and title of each post
//        }
//    } catch { // Catch any errors that occur during fetching or decoding
//        print("Error fetching or decoding data: \(error)") // Print the error message
//    }
//}
//
//Task {
//    await fetchPosts()
//}
//
//NavigationStack {
//    VStack(spacing: 8) {
//        // Assuming there's a ForEach loop here to iterate over posts
//        ForEach(decodedPosts, id: \.id) { post in
//            NavigationLink(destination: PostDetailView(post: post)) {
//                VStack(alignment: .leading) {
//                    HStack {
//                        Text(post.title)
//                        Spacer()
//                        Text(post.id)
//                            .foregroundColor(.gray)
//                            .font(.caption)
//                    }
//                    Text(post.description)
//                        .font(.subheadline)
//                        .foregroundColor(.secondary)
//                }
//                .padding(.vertical, 4)
//            }
//        }
//    }
//}
//
//</file>
