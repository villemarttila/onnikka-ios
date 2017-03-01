//
//  BussLinesTableViewController.swift
//  Onnikka
//
//  Created by Ville Marttila on 24.5.2016.
//
//

import UIKit

class BussLinesTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        loadBussLinesData()
        // loadInitialData()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        
    }
    
     var bussLines = [BussLine]()
    
    // MARK: Load data (simple way)
    
    func loadBussLinesData() {
        let bussNumber1 = UIImage(named: "bussNumber1")!
        let bussLine1 = BussLine(lineName: "Metelinkangas - Jylkykangas", lineNumber: "Linja 1", driveTime: "Ajoaika 60min", bussNumber: bussNumber1)!
        
        let bussNumber2 = UIImage(named: "bussNumber2")!
        let bussLine2 = BussLine(lineName: "Ritaharju - Metsokangas", lineNumber: "Linja 2", driveTime: "Ajoaika 75min", bussNumber: bussNumber2)!
        
        let bussNumber2N = UIImage(named: "bussNumber2N")!
        let bussLine2N = BussLine(lineName: "Ritaharju - Metsokangas", lineNumber: "Linja 2N", driveTime: "Ajoaika 75min", bussNumber: bussNumber2N)!
        
        let bussNumber3 = UIImage(named: "bussNumber3")!
        let bussLine3 = BussLine(lineName: "Kaakkuri - Ritaharju", lineNumber: "Linja 3", driveTime: "Ajoaika 60min", bussNumber: bussNumber3)!
        
        let bussNumber4 = UIImage(named: "bussNumber4")!
        let bussLine4 = BussLine(lineName: "Herukka - Iinatti", lineNumber: "Linja 4", driveTime: "Ajoaika 60min", bussNumber: bussNumber4)!
        
        let bussNumber4N = UIImage(named: "bussNumber4N")!
        let bussLine4N = BussLine(lineName: "Keskusta - Heikkilänkangas", lineNumber: "Linja 4N", driveTime: "Ajoaika 30min", bussNumber: bussNumber4N)!
        
        let bussNumber7 = UIImage(named: "bussNumber7")!
        let bussLine7 = BussLine(lineName: "Saarela - Puolivälikangas", lineNumber: "Linja 7", driveTime: "Ajoaika 40min", bussNumber: bussNumber7)!
        
        let bussNumber7N = UIImage(named: "bussNumber7N")!
        let bussLine7N = BussLine(lineName: "Keskusta - Saarela - Keskusta", lineNumber: "Linja 7N", driveTime: "Ajoaika 25min", bussNumber: bussNumber7N)!
        
        let bussNumber8 = UIImage(named: "bussNumber8")!
        let bussLine8 = BussLine(lineName: "Lentoasema - Teknologiakylä", lineNumber: "Linja 8", driveTime: "Ajoaika 55min", bussNumber: bussNumber8)!
        
        let bussNumber9 = UIImage(named: "bussNumber9")!
        let bussLine9 = BussLine(lineName: "Lentoasema - Oulunsalo - Heikinharju", lineNumber: "Linja 9", driveTime: "Ajoaika 55min", bussNumber: bussNumber9)!
        
        let bussNumber10 = UIImage(named: "bussNumber10")!
        let bussLine10 = BussLine(lineName: "Koskela - Heikinharju", lineNumber: "Linja 10", driveTime: "Ajoaika 55min", bussNumber: bussNumber10)!
        
        let bussNumber11 = UIImage(named: "bussNumber11")!
        let bussLine11 = BussLine(lineName: "Keskusta - Kivikkokangas", lineNumber: "Linja 11", driveTime: "Ajoaika 25min", bussNumber: bussNumber11)!
        
        let bussNumber14 = UIImage(named: "bussNumber14")!
        let bussLine14 = BussLine(lineName: "Lintula - Välivainio", lineNumber: "Linja 14", driveTime: "Ajoaika 30min", bussNumber: bussNumber14)!
        
        let bussNumber15 = UIImage(named: "bussNumber15")!
        let bussLine15 = BussLine(lineName: "Nallikari - Mäntylä", lineNumber: "Linja 15", driveTime: "Ajoaika 30min", bussNumber: bussNumber15)!
        
        let bussNumber15N = UIImage(named: "bussNumber15N")!
        let bussLine15N = BussLine(lineName: "Nallikari - Keskusta - Nallikari", lineNumber: "Linja 15N", driveTime: "Ajoaika 15min", bussNumber: bussNumber15N)!
        
        let bussNumber17 = UIImage(named: "bussNumber17")!
        let bussLine17 = BussLine(lineName: "Heikinharju - Keskusta", lineNumber: "Linja 17", driveTime: "Ajoaika 35min", bussNumber: bussNumber17)!
        
        let bussNumber20 = UIImage(named: "bussNumber20")!
        let bussLine20 = BussLine(lineName: "OSAO - Haukipudas - Martinniemi", lineNumber: "Linja 20", driveTime: "Ajoaika 70min", bussNumber: bussNumber20)!
        
        let bussNumber20N = UIImage(named: "bussNumber20N")!
        let bussLine20N = BussLine(lineName: "Keskusta - Haukipudas - Metsokangas", lineNumber: "Linja 20N", driveTime: "Ajoaika 40min", bussNumber: bussNumber20N)!
        
        let bussNumber21 = UIImage(named: "bussNumber21")!
        let bussLine21 = BussLine(lineName: "Oulunsuu - Kellon Kiviniemi", lineNumber: "Linja 21", driveTime: "Ajoaika 55min", bussNumber: bussNumber21)!
        
        let bussNumber22 = UIImage(named: "bussNumber22")!
        let bussLine22 = BussLine(lineName: "Asemakylä - Haukipudas - OSAO", lineNumber: "Linja 22", driveTime: "Ajoaika 65min", bussNumber: bussNumber22)!
        
        let bussNumber23 = UIImage(named: "bussNumber23")!
        let bussLine23 = BussLine(lineName: "Ii - Haukipudas - Linnanmaa - Oulu", lineNumber: "Linja 23", driveTime: "Ajoaika 80min", bussNumber: bussNumber23)!
        
        bussLines += [bussLine1, bussLine2, bussLine2N, bussLine3, bussLine4, bussLine4N, bussLine7, bussLine7N, bussLine8, bussLine9, bussLine10, bussLine11, bussLine14, bussLine15, bussLine15N, bussLine17, bussLine20, bussLine20N, bussLine21, bussLine22, bussLine23]
    }
    
    // MARK: Load data from JSON file
    
    /*
    func loadInitialData() {
    
        let fileName = NSBundle.mainBundle().pathForResource("Routes", ofType: "json");
        
        var data: NSData?
        do {
            data = try NSData(contentsOfFile: fileName!, options: NSDataReadingOptions(rawValue: 0))
        } catch _ {
            data = nil
        }
        
        var jsonObject: AnyObject? = nil
        if let data = data {
            do {
                jsonObject = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(rawValue: 0))
            } catch _ {
                jsonObject = nil
            }
        }
        
        if let jsonObject = jsonObject as? [String: AnyObject],
            // 4
            let jsonData = JSONValue.fromObject(jsonObject)?["data"]?.array {
            for routeJSON in jsonData {
                if let routeJSON = routeJSON.array,
                    // 5
                    BussLine = BussLine.fromJSON(routeJSON) {
                    BussLines.append(BussLine)
                }
            }
        }
        
        print([BussLines])
 
    }
 */


    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bussLines.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "BussLineTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! BussLineTableViewCell

        // Fetches the appropriate line for the data source layout
        let bussLine = bussLines[(indexPath as NSIndexPath).row]
        
        cell.bussNumber.image = bussLine.bussNumber
        cell.driveTime.text = bussLine.driveTime
        cell.lineName.text = bussLine.lineName

        return cell
    }
 
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }

    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showLineMap" {
            let lineDetailViewController = segue.destination as! LineMapViewController
            
            // Get the cell that generated this segue
            if let selectedLineCell = sender as? BussLineTableViewCell {
                let indexPath = tableView.indexPath(for: selectedLineCell)!
                let selectedLine = bussLines[(indexPath as NSIndexPath).row]
                lineDetailViewController.bussLine = selectedLine
            }
        }
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
