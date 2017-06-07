//
//  homeTableViewController.swift
//  yomaView
//
//  Created by renminghe on 2017/6/5.
//  Copyright © 2017年 renminghe. All rights reserved.
//

import UIKit
import ImageSlideshow

class homeTableViewController: UITableViewController {
//    let localSource = [ImageSource(imageString: "img1")!, ImageSource(imageString: "img2")!, ImageSource(imageString: "img3")!, ImageSource(imageString: "img4")!]
    
    let alamofireSource = [AlamofireSource(urlString: "http://i0.hdslb.com/bfs/archive/0c679505bb7262ff83fd9f9a428b68c0499ada91.jpg")!, AlamofireSource(urlString: "http://i0.hdslb.com/bfs/archive/e5a0f4e88c076fd9565c3d25e4a89d8db5f6a5af.jpg")!, AlamofireSource(urlString: "http://i0.hdslb.com/bfs/archive/379365a4ecab3107165489ec0e977dca6211166c.jpg")!, AlamofireSource(urlString: "http://i0.hdslb.com/bfs/archive/ca4f1beae414f4b48193ef5e5dd3753acb83b11d.jpg")!, AlamofireSource(urlString: "http://i0.hdslb.com/bfs/archive/4aba131c0f1ec1d16005c2a90994f92f4d9eff71.jpg")!];
    
    open override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 初始化样式
        self.initStyle();

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    
    func initStyle() {
        self.title = "首页";
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none;
        self.tableView.backgroundColor = UIColor(red: 0xF4/255, green: 0xF4/255, blue: 0xF4/255, alpha: 1);
        
        let tableViewHeader = ImageSlideshow(frame:CGRect(x: 0, y: 0, width: 600, height: 120));
        tableViewHeader.backgroundColor = UIColor.white;
        tableViewHeader.slideshowInterval = 5.0
        tableViewHeader.pageControlPosition = PageControlPosition.insideScrollView
        tableViewHeader.pageControl.currentPageIndicatorTintColor = UIColor.orange
        tableViewHeader.pageControl.pageIndicatorTintColor = UIColor.white
        tableViewHeader.contentScaleMode = UIViewContentMode.scaleAspectFill
        tableViewHeader.setImageInputs(alamofireSource)
        self.tableView.tableHeaderView = tableViewHeader;
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
