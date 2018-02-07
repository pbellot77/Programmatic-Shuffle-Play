//
//  MenuController.swift
//  Shuffle Play
//
//  Created by Tyler Phillips on 1/12/18.
//  Copyright © 2018 Tyler Phillips. All rights reserved.
//

import UIKit
import MediaPlayer

class MenuController: UIViewController {
	
	var musicPlayer = MPMusicPlayerController.applicationMusicPlayer
	var nowPlayingInfo = MPNowPlayingInfoCenter.self

	//UIGradient Color
	let gradient = CAGradientLayer()
	var gradientSet = [[CGColor]]()
	var currentGradient: Int = 0
	
	let gradientOne = UIColor(red: 48/255, green: 62/255, blue: 103/255, alpha: 1).cgColor
	let gradientTwo = UIColor(red: 244/255, green: 88/255, blue: 53/255, alpha: 1).cgColor
	let gradientThree = UIColor(red: 196/255, green: 70/255, blue: 107/255, alpha: 1).cgColor
	
    override func viewDidLoad() {
        super.viewDidLoad()
	
		
		//UIGradient
		gradientSet.append([gradientOne, gradientTwo])
		gradientSet.append([gradientTwo, gradientThree])
		gradientSet.append([gradientThree, gradientOne])
		
		
		gradient.frame = self.view.bounds
		gradient.colors = gradientSet[currentGradient]
		gradient.startPoint = CGPoint(x:0, y:0)
		gradient.endPoint = CGPoint(x:1, y:1)
		gradient.drawsAsynchronously = true
		self.view.layer.addSublayer(gradient)
		
		animateGradient()

		//Genre Label
		
		let genreLabel = UILabel(frame: CGRect(x: 190, y: 450, width: 200, height: 21))
		genreLabel.center = CGPoint(x: 190, y: 50)
		genreLabel.textAlignment = .center
		genreLabel.text = "Genre's"
		self.view.addSubview(genreLabel)
		
		
		
		//Buttons
		
		let mainButtonTapped = UIButton(type: UIButtonType.system) as UIButton
		mainButtonTapped.frame = CGRect(x: 300, y: 50, width: 35, height: 35)
		mainButtonTapped.tintColor=UIColor .black
		mainButtonTapped.setTitle("Home", for: .normal)
		if let image  = UIImage(named: "home-icon.png") {
			mainButtonTapped.setImage(image, for: .normal)
		}
		mainButtonTapped.addTarget(self, action: #selector(mainButtonTapped(_:)), for:.touchUpInside)
		self.view.addSubview(mainButtonTapped)
		
		//Genre
		// X = left to right
		// Y = top to bottom
		
        let RockButton = UIButton(frame: CGRect(x: 55, y: 100, width: 260, height: 45))
		RockButton.tintColor=UIColor .gray
		RockButton.layer.cornerRadius = 5
		RockButton.layer.borderWidth = 1
		RockButton.layer.borderColor = UIColor.black.cgColor
        RockButton.setTitle("Rock", for: .normal)
		RockButton.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		self.view.addSubview(RockButton)
        
        let PopButton = UIButton(frame: CGRect(x: 55, y: 165, width: 260, height: 45))
		PopButton.tintColor=UIColor .gray
		PopButton.layer.cornerRadius = 5
		PopButton.layer.borderWidth = 1
		PopButton.layer.borderColor = UIColor.black.cgColor
		PopButton.setTitle("Pop", for: .normal)
		PopButton.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		self.view.addSubview(PopButton)
        
        let HipHopButton = UIButton(frame: CGRect(x: 55, y: 230, width: 260, height: 45))
		HipHopButton.tintColor=UIColor .gray
		HipHopButton.layer.cornerRadius = 5
		HipHopButton.layer.borderWidth = 1
		HipHopButton.layer.borderColor = UIColor.black.cgColor
		HipHopButton.setTitle("Hip-Hop", for: .normal)
		HipHopButton.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		self.view.addSubview(HipHopButton)
        
        let AlternativeButton = UIButton(frame: CGRect(x: 55, y: 295, width: 260, height: 45))
		AlternativeButton.tintColor=UIColor .gray
		AlternativeButton.layer.cornerRadius = 5
		AlternativeButton.layer.borderWidth = 1
		AlternativeButton.layer.borderColor = UIColor.black.cgColor
		AlternativeButton.setTitle("Alternative", for: .normal)
		AlternativeButton.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		self.view.addSubview(AlternativeButton)
        
        let RapButton = UIButton(frame: CGRect(x: 55, y: 360, width: 260, height: 45))
		RapButton.tintColor=UIColor .gray
		RapButton.layer.cornerRadius = 5
		RapButton.layer.borderWidth = 1
		RapButton.layer.borderColor = UIColor.black.cgColor
		RapButton.setTitle("Rap", for: .normal)
		RapButton.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		self.view.addSubview(RapButton)
        
        let RHButton = UIButton(frame: CGRect(x: 55, y: 425, width: 260, height: 45))
		RHButton.tintColor=UIColor .gray
		RHButton.layer.cornerRadius = 5
		RHButton.layer.borderWidth = 1
		RHButton.layer.borderColor = UIColor.black.cgColor
		RHButton.setTitle("Hip Hop/Rap", for: .normal)
		RHButton.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		self.view.addSubview(RHButton)
        
        let PopRockButton = UIButton(frame: CGRect(x: 55, y: 490, width: 260, height: 45))
		PopRockButton.tintColor=UIColor .gray
		PopRockButton.layer.cornerRadius = 5
		PopRockButton.layer.borderWidth = 1
		PopRockButton.layer.borderColor = UIColor.black.cgColor
		PopRockButton.setTitle("Pop/Rock", for: .normal)
		PopRockButton.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		self.view.addSubview(PopRockButton)
        
        let HeavyButton = UIButton(frame: CGRect(x: 55, y: 555, width: 260, height: 45))
		HeavyButton.tintColor=UIColor .gray
		HeavyButton.layer.cornerRadius = 5
		HeavyButton.layer.borderWidth = 1
		HeavyButton.layer.borderColor = UIColor.black.cgColor
		HeavyButton.setTitle("Heavy Metal", for: .normal)
		HeavyButton.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		self.view.addSubview(HeavyButton)
		

        // Do any additional setup after loading the view.
    }
	
	var mainButtonTapped : UIButton!
	
	@objc func mainButtonTapped(_ sender: UIButton) {
		
		//Segue between ViewControllers
		let vc = MainUIController() //your view controller
		self.present(vc, animated: true, completion: nil)
		
	}
    
    //Any of the genre buttons tapped = this action

	@objc func genreButtonTapped(_ sender: UIButton!) {
        
        MPMediaLibrary.requestAuthorization { (status) in
            if status == .authorized{
                self.playGenre(genre: sender.currentTitle!)
            }
        }
        
        sender.pulsate()
        
    }
    
    func playGenre(genre: String){
        
        musicPlayer.stop()
        let query = MPMediaQuery()
        let predicate = MPMediaPropertyPredicate(value: genre, forProperty: MPMediaItemPropertyGenre)
        
        query.addFilterPredicate(predicate)
        
        musicPlayer.setQueue(with: query)
        musicPlayer.shuffleMode = .songs
        musicPlayer.play()
    
    }
	
	//UIGradient Func
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
	}
	
	
	//UIColor Gradient Func
	
	func animateGradient() {
		if currentGradient < gradientSet.count - 1 {
			currentGradient += 1
		} else {
			currentGradient = 0
		}
		
		let gradientChangeAnimation = CABasicAnimation(keyPath: "colors")
		gradientChangeAnimation.duration = 7.00
		gradientChangeAnimation.toValue = gradientSet[currentGradient]
		gradientChangeAnimation.fillMode = kCAFillModeForwards
		gradientChangeAnimation.isRemovedOnCompletion = false
		gradient.add(gradientChangeAnimation, forKey: "colorChange")
	}
	
	}

	extension ProfileController: CAAnimationDelegate {
		func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
			if flag {
				gradient.colors = gradientSet[currentGradient]
				animateGradient()
		}
	}

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
