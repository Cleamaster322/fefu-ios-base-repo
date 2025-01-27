//
//  ViewControllerActivnostiMain.swift
//  fefuactivity
//

//

import UIKit
import CoreData

class ViewControllerActivnosiMain: UIViewController {
    @IBOutlet weak var table_with_activnosti: UITableView!
    let name_of_table_cell = "OneStatementInActivityTableViewCell";
    let data_for_table: [LocationData] = [];
    private let fefuCoreData = FEFUCoreDataContainer.instance
    override func viewDidLoad() {
        super.viewDidLoad()
        table_with_activnosti.dataSource = self
        registerCell()
        fetchDataFromCoreData()
    }
    private func registerCell(){
        table_with_activnosti.register(UINib(nibName: name_of_table_cell , bundle: nil), forCellReuseIdentifier: name_of_table_cell)
    }
    
    private func fetchDataFromCoreData(){
        let locate_request: NSFetchRequest<CDUserActivitys> = CDUserActivitys.fetchRequest()
        do {
            let rawActivity =
                try FEFUCoreDataContainer.instance.context.fetch(locate_request)
            if ( rawActivity.count != 0 ){
                let testViewData:[String] = rawActivity.map{
                    rawActivity in
                    return rawActivity.locationData ?? "??"
                }
                print("ООООООООККККККККККК")
                print(testViewData)
                print("OOOOOOOKKKKKK222222")
            }
        } catch {
            print(error)
        }
    }
    
}


extension ViewControllerActivnosiMain: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(
            withIdentifier: name_of_table_cell,
            for:indexPath ) as? OneStatementInActivityTableViewCell{
            cell.how_time_ago.text = "Дай бог здоровья"
            return cell
        } else {
            assert(false)
            return UITableViewCell()
        }
        
    }
    
    
}
