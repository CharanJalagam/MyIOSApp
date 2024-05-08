import UIKit

class PreviousJokesTableViewController: UITableViewController {
    var jokesData: [JokesData] = []
    let pv = RetrieveJokes()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        jokesData = pv.getJokesData()
        if jokesData.isEmpty {
            print("No jokes data available.")
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jokesData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0;
        cell.textLabel?.lineBreakMode = .byWordWrapping
        cell.textLabel?.text = jokesData[indexPath.row].cJoke
        cell.textLabel?.textColor = .white
        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {

            guard indexPath.row < jokesData.count else {
                return
            }
            
            let jokeToDelete = jokesData[indexPath.row]

            pv.deleteCell(data: jokeToDelete)

            jokesData.remove(at: indexPath.row)

            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
