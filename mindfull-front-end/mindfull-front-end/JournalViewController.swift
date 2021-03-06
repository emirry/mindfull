//
//  JournalViewController.swift
//  mindfull-front-end
//
//  Created by Emily Nagai on 2/3/21.
//

import UIKit

class JournalViewController: UIViewController {
    
    
//    let vc = FoodListViewController(nibName: "FoodListViewController", bundle: nil)
    
    @IBOutlet weak var firstFoodItem: UILabel!
    @IBOutlet weak var secondFoodItem: UILabel!
    @IBOutlet weak var thirdFoodItem: UILabel!
    @IBOutlet weak var fourthFoodItem: UILabel!
    
    let shapeLayer = CAShapeLayer()
    var totalCal = 0
    var passedInFoods = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        vc.delegate = self

       getDate()
        
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 246/225.0, green: 141/225.0, blue: 95/225.0, alpha: 1)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Thasadith-Regular", size: 20)!]
        
            
        let center = view.center
        //track layer
        let trackLayer = CAShapeLayer()
        
        let circlePath = UIBezierPath(arcCenter: center, radius: 100, startAngle: -CGFloat.pi/2, endAngle: 2 * CGFloat.pi, clockwise: true)
        trackLayer.path = circlePath.cgPath
        
        trackLayer.strokeColor = UIColor.lightGray.cgColor
        trackLayer.lineWidth = 10
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineCap = CAShapeLayerLineCap.round
        view.layer.addSublayer(trackLayer)

        shapeLayer.path = circlePath.cgPath
        shapeLayer.strokeColor = UIColor.orange.cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        shapeLayer.strokeEnd = 0
        
        view.layer.addSublayer(shapeLayer)
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        
        caluculateCal()
    }
    
    @objc private func handleTap() {
        print("animating")
        
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        
        basicAnimation.toValue = 0.2
        //This is where I want to add code to stop the progress ring depending on user's calories
        //create a function to make calculation, and then upload screen.

        basicAnimation.duration = 1.5
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false
        shapeLayer.add(basicAnimation, forKey: "someString")
    }
    
    func getDate() {
        let formatter = DateFormatter()
        formatter.timeStyle = .none
        formatter.dateStyle = .full
        formatter.timeZone = TimeZone.current
        self.title = formatter.string(from: Date())
        
    }

    func caluculateCal() {
        //foodSearch/totalCal
        print("TOTALCAL", totalCal)
//        print("WHAT IS THIS?", caloriesFromList)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    
    @IBAction func toFoodList(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let toFoodList = storyboard.instantiateViewController(identifier: "FoodListViewController") as! FoodListViewController

        self.navigationController?.pushViewController(toFoodList, animated: true)
    }
    
//    var grabData = 0
//    func getFood(_ food: BackendData) {
//        self.grabData = food.food_entries[0].calories
//        print("CAL", grabData)
//
//    }

//
    @IBAction func unwindFromFoodDetailViewController(segue: UIStoryboardSegue) {
//        if let foodListViewController = segue.source as? FoodListViewController {
//            foodSearch = foodListViewController.foodSearch
//
//        }
    }


}

