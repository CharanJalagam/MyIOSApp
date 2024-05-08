import UIKit
import CoreData

class JokesViewController: UIViewController {
    let jokesManager = JokesManager()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jokesManager.delegate = self
    }
    
    @IBAction func generatePressed(_ sender: UIButton) {
        jokesManager.getdata()
    }
    
    @IBAction func savePressed(_ sender: UIButton) {
        guard let jokeText = label.text,  jokeText != "Press Generate to Start"else {
            showAlert(withTitle: "Warning", message: "Generate a joke first!")
            return
        }
        
        let newJoke = JokesData(context: context)
        newJoke.cJoke = jokeText
        
        do {
            try context.save()
            showAlert(withTitle: "Saved Successfully", message: "")
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
            showAlert(withTitle: "Error Occurred", message: "")
        }
    }
    
    // Function to present alerts
    private func showAlert(withTitle title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}

extension JokesViewController: JokesManagerDelegate {
    func getJoke(joke: String) {
        DispatchQueue.main.async {
            self.label.text = joke
        }
    }
}
