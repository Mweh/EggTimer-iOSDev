import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var eggProgress: UIProgressView!
    @IBOutlet weak var topLabel: UILabel!
    
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    
    var timer = Timer()
    
    var totalTime = 0
    var secondPassed = 0
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        //        Ini caraku, kita pakai cara Angela
        //        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
        //            if totalTime > 0 {
        //                print ("\(totalTime) seconds")
        //                totalTime -= 1
        //                progressBar()
        //            } else {
        //                Timer.invalidate()
        //                self.topLabel.text = "DONE!"
        //            }
        //        }
        //
        //        func progressBar(){
        //            if hardness == "Soft"{
        //                eggProgress.progress += 0.334
        //            } else if hardness == "Medium"{
        //                eggProgress.progress += 0.250
        //            } else {
        //                eggProgress.progress += 0.143
        //            }
        //        }
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
        eggProgress.progress = 0.0
        secondPassed = 0
        topLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }

    @objc func updateCounter() {
        //example functionality
        if secondPassed < totalTime {
            secondPassed += 1
            eggProgress.progress = Float(secondPassed) / Float(totalTime)
            print(Float(secondPassed) / Float(totalTime))
        } else {
//            eggProgress.progress = 1
            timer.invalidate()
            topLabel.text = "DONE!"
        }
    }
}
