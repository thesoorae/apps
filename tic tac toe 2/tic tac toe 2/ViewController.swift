//
//  ViewController.swift
//  tic tac toe 2
//
//  Created by the Soo-Rae's Mac on 7/9/15.
//  Copyright (c) 2015 sourceapps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button: UIButton!
    @IBOutlet var gameOver: UIButton!
    @IBAction func gameOverPressed(sender: AnyObject) {
        activePlayer = 1
        gameActive = true
        gameState = [0,0,0,0,0,0,0,0,0]
        var button : UIButton
        for var q=0; q<9; q++ {
        button = view.viewWithTag(q) as! UIButton
            button.setImage(nil , forState: .Normal)}
        winner.hidden=true
        gameOver.hidden=true
            winner.center=CGPointMake(winner.center.x-400, winner.center.y)
            gameOver.center=CGPointMake(gameOver.center.x-400, gameOver.center.y)}
    
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    var win=""
    var winningCombinations = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    var activePlayer = 1
    var gameActive=true
    @IBOutlet var winner: UILabel!
    //1=O's, 2=X's
    @IBAction func buttonPressed(sender: AnyObject){
    var image = UIImage()
        if gameActive{
        if gameState[sender.tag]==0{
        gameState[sender.tag]=activePlayer
        if activePlayer == 1{
        image = UIImage(named:"o.gif")!
            activePlayer=2
        } else{
         image = UIImage(named:"x.png")!
            activePlayer = 1}
        sender.setImage(image, forState: .Normal)
            for combination in winningCombinations{
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]{
                winner.hidden=false
                gameOver.hidden=false
                UIView.animateWithDuration(0.5, animations:{ () -> Void in
                self.winner.center=CGPointMake(self.winner.center.x+400, self.winner.center.y)
                    self.gameOver.center = CGPointMake(self.gameOver.center.x+400, self.gameOver.center.y)})
                if gameState[combination[0]]==1{
                    win="O"}else{win="X"}
                
                winner.text="\(win) wins!"
                gameActive=false
                }}}
        }}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        winner.hidden=true
        gameOver.hidden=true
        winner.center=CGPointMake(winner.center.x-400, winner.center.y)
        gameOver.center=CGPointMake(gameOver.center.x-400, gameOver.center.y)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidLayoutSubviews() {
       
    }

}

