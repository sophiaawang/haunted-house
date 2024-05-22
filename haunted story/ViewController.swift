//
//  ViewController.swift
//  haunted story
//
//  Created by Sophia Wang on 4/5/21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var monsterImage: UIImageView!
        
    var AudioPlayer = AVAudioPlayer()
    
    var stepNumber = 0
    let storyline = [Story (l: "WELCOME TO THE HAUNTED HOUSE!", one: "ENTER", two: "RUN TO THE EXIT"), Story(l:"WELCOME! OH NO THERE'S A GHOST",one:"Shine a flashlight at the ghost!", two:"Run away up the stairs"), Story(l:"Ghost launches itself at you!",one:"Freeze", two:"Run away up the stairs"), Story(l:"Oh no! The ghost killed you!",one:"START", two:"OVER"), Story(l: "AHH there's a zombie!!", one: "Whack it with a bat", two: "Shine a flashlight at the zombie"), Story(l: "THE ZOMBIE BITES YOU! YOU DIE.", one: "START", two: "OVER"), Story(l: "Spiders crawl up your arm and you scream, awakening all the tremors of the building. You get a panic attack and die.", one: "START", two: "OVER"), Story(l: "THE MONSTERS HEAR YOUR SCREAMS! YOU DIE.", one: "START", two: "OVER"),Story(l: "THE GHOST CATCHES YOU LEAVING! YOU DIE.", one: "START", two: "OVER"), Story(l: "YOU RUN INTO COBWEBS AND GET STUCK! SPIDERS EAT YOU.", one: "START", two: "OVER"), Story(l: "WHEN RUNNING BACK DOWN YOU TRIP AND FALL! YOU DIE.", one: "START", two: "OVER"), Story(l: "YOU DIED", one: "START", two: "OVER")]
    
    let storyline2 = [Story (l: "WELCOME TO THE HAUNTED HOUSE!", one: "ENTER", two: "RUN TO THE EXIT"), Story(l:"To bad! You're in the house anyways! Look there's a ghost!", one:"Shine a flashlight at the ghost", two:"Run away up the stairs"),Story(l:"Which way do you want to go?",one: "Left Door", two: "Right Door"), Story(l: "You're in a dark room. What do you do?", one: "Hide in a corner", two: "Turn on the flashlight"), Story(l: "Oh no! There are a bunch of paintings with eyes that seem to follow your movements", one: "Scream and run out", two: "Touch the closest painting (there's something weird about it)"), Story(l: "The painting swings open and reveals a hidden passageway", one: "Chicken out and leave the room", two: "Enter the dark passage"), Story(l: "After some time walking in the dim passage you reach some stairs", one: "Go down", two: "Go up"), Story(l: "You've reached an old prison-like door", one: "Run back down the stairs", two: "Open the door"), Story(l: "You see bright lights, buttons, and switches. You've reached the control room!", one: "Rather die than become a slave running the house", two: "Become the new master"), Story(l: "YOU'VE REACHED THE \"HAPPY ENDING\"", one: "START", two: "OVER")] //master storyline
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonOne.titleLabel?.numberOfLines = 0; // Dynamic number of lines
        buttonOne.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping;
        buttonTwo.titleLabel?.numberOfLines = 0; // Dynamic number of lines
        buttonTwo.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping;
        monsterImage.isHidden = true
//        let AssortedMusics = NSURL(fileURLWithPath: Bundle.main.path(forResource: "Creepy old Music box - When Memories Break", ofType: "mp3")!)
//        AudioPlayer = try! AVAudioPlayer(contentsOf: AssortedMusics as URL)
//                AudioPlayer.prepareToPlay()
//                AudioPlayer.numberOfLoops = -1
//                AudioPlayer.play()
    }
    @IBAction func buttonPressed(_ sender: UIButton) {
        let userAnswer = String(sender.currentTitle!)
        var sto:String = ""
        if(stepNumber==0 || userAnswer == "Chicken out and leave the room"){
            monsterImage.image = #imageLiteral(resourceName: "ghost")
            monsterImage.isHidden=false
        }else if(userAnswer == "Run away up the stairs"){
            monsterImage.isHidden=true
        }else if(userAnswer=="Go down"){
            monsterImage.image = #imageLiteral(resourceName: "spider")
            monsterImage.isHidden = false
        }else if(userAnswer=="Open the door"){
            monsterImage.image = #imageLiteral(resourceName: "controlroom")
            monsterImage.isHidden = false
        }
        if(sender == buttonOne){
            firstButton(user:userAnswer)
            sto="storyline"
            if stepNumber+1<storyline.count{
                stepNumber+=1
            }
        }else{
            secondButton(user:userAnswer)
            sto="storyline2"
            if stepNumber+1<storyline2.count{
                stepNumber+=1
            }
        }
        if(userAnswer=="Shine a flashlight at the zombie"){
            sto="storyline"
        }
        print(stepNumber)
        updateUI(stor: sto)

    }
    func updateUI(stor:String){
        if(stor == "storyline"){
            label.text =  storyline[stepNumber].label
            buttonOne.setTitle(storyline[stepNumber].optionOne, for: UIControl.State.normal)
            buttonTwo.setTitle(storyline[stepNumber].optionTwo, for: UIControl.State.normal)
            
        }else if(stor=="storyline2"){
            label.text = storyline2[stepNumber].label
            buttonOne.setTitle(storyline2[stepNumber].optionOne, for: UIControl.State.normal)
            buttonTwo.setTitle(storyline2[stepNumber].optionTwo, for: UIControl.State.normal)
        }else{
            label.text = "HI"
        }
    }
    
    func firstButton(user:String){
        if (user=="START"){
            stepNumber = -1
            monsterImage.isHidden=true
        }else if (user == "Left Door"){
            stepNumber+=1
            monsterImage.image = #imageLiteral(resourceName: "zombie")
            monsterImage.isHidden=false
        }else if (user == "Hide in a corner"){
            stepNumber+=2
            monsterImage.isHidden = false
            monsterImage.image = #imageLiteral(resourceName: "spider")
        }else if (user == "Hide in a corner" || user == "Scream and run out" || user == "Chicken out and leave the room" || user == "Go down" || user == "Run back down the stairs" || user == "Rather die than become a slave running the house") {
            stepNumber+=2
        }
    }
    func secondButton(user:String){
        if (user=="OVER"){
            stepNumber = -1
            monsterImage.isHidden=true
        }else if(user=="Run away up the stairs" && stepNumber==2){
            stepNumber-=1
        }
    }
}

