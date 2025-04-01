// The Swift Programming Language
// https://docs.swift.org/swift-book


import MyTestFrameWork


public class MySwiftPackage {
    public init() {}
    
    public func callFrameworkFunction() {
        print("MyTestFrameWork: is called with NetworkManager")

        NetworkManager.shared.fetchData(from: "https://api.example.com") { result in
            switch result {
            case .success(let data):
                print("Data received: \(data)")
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
        
    }
}
