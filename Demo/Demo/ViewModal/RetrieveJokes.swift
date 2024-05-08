import Foundation
import UIKit
import CoreData

class RetrieveJokes {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    func getJokesData() -> [JokesData] {
        let fetchRequest: NSFetchRequest<JokesData> = JokesData.fetchRequest()
        do {
            // Fetch data
            let fetchedResults = try context.fetch(fetchRequest)
            return fetchedResults
        } catch let error as NSError {
            print("Fetch error: \(error), \(error.userInfo)")
            return []
        }
    }
    
    func deleteCell(data: JokesData) {
        context.delete(data)
        do {
            try context.save()
        } catch let error as NSError {
            print("Delete error: \(error), \(error.userInfo)")
        }
    }
}
