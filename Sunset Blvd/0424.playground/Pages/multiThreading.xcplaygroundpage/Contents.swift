import Foundation

func modernConcurrencyExample() async {
    print("Structured Concurrency Example: Task started on main thread.")

    // Create a new Task and await its completion
    await Task {
        print("Structured Concurrency Example: Performing heavy work in a Task...")
        // Simulate a time-consuming task using Task.sleep
        try? await Task.sleep(for: .seconds(4)) // Awaiting an asynchronous operation
        print("Structured Concurrency Example: Heavy work finished.")

        // Code within a Task can often interact with the main actor directly
        // if needed, especially for UI updates, although explicit @MainActor
        // or Task { @MainActor in ... } might be used in more complex scenarios.
        print("Structured Concurrency Example: Potentially updating UI context.")
    }.value

    print("Structured Concurrency Example: Main thread continues executing.")
}

// Call the function to run the example
Task {
    await modernConcurrencyExample()
}
