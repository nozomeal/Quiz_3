//
//  QuizViewController.swift
//  Quiz
//
//  Created by ohtatomotaka on 2015/02/10.
//  Copyright (c) 2015年 LifeisTech. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    //出題数
    var questionNumber:Int = 5
    
    //現在の問題数
    var sum:Int = 0
    
    //正解数
    var correctAnswer:Int = 0
    
    //乱数
    var random:Int = 0
    
    //クイズを格納する配列
    var quizArray = [NSMutableArray]()
    
    //クイズを表示するTextView
    @IBOutlet var quizTextView: UITextView!
    
    //選択肢のボタン
    @IBOutlet var choiceButtons: Array<UIButton>!
    
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //------------------------ここから下にクイズを書く------------------------//
        quizArray.append(["このラーメン味がむつこいわあ。","このラーメン味が受け付けないな。","このラーメン味がしつこいな。","このラーメン味が薄いな",2])
        quizArray.append(["帰ってこーわい！","帰って戻ってくるね！","帰るね！","帰って違うところにいくね！",2])
        quizArray.append(["机かいて〜","机下げて〜","机の絵をかいて〜","机をあげて〜",1])
        quizArray.append(["その荷物かろって！","その荷物持ってきて！","その荷物背負って！","その荷物運んで！",2])
        quizArray.append(["そんなこといよらんわ","そんなこと言ってない","そんなこと聞いてない","そんなことしてない",1])
        quizArray.append(["おらばんで！","叫ばないで！","暴れないで！","泣かないで！",1])
        quizArray.append(["それいろわんで！","それしまわないで！","それ色ぬといて！","それ触らないで！",3])
        quizArray.append(["ほんならええやん","本ならいいね","そうならいいじゃん！","本なら好きよ！",2])
        //------------------------ここから下にクイズを書く------------------------//
        choiceQuiz();
        
    }
    
    
    
    func choiceQuiz() {
        println(quizArray.count)
        //クイズの問題文をシャッフルしてTextViewにセット
        random = Int(arc4random_uniform(UInt32(quizArray.count)))
        quizTextView.text = quizArray[random][0] as! NSString as String
        
        //選択肢のボタンにそれぞれ選択肢のテキストをセット
        for var i = 0; i < choiceButtons.count; i++ {
            choiceButtons[i].setTitle(quizArray[random][i+1] as! NSString as String, forState: .Normal)
            
            //どのボタンが押されたか判別するためのtagをセット
            choiceButtons[i].tag = i + 1;
        }
    }
    
    @IBAction func choiceAnswer(sender: UIButton) {
        sum++
        println("random \(random)")
        if quizArray[random][4] as! Int == sender.tag {
            //正解数を増やす
            correctAnswer++
                    }
        
        //解いた問題数の合計が予め設定していた問題数に達したら結果画面へ
            if sum == questionNumber {
                performSegueToResult()
            }
                quizArray.removeAtIndex(random)
                choiceQuiz()
    
    func performSegueToResult() {
        performSegueWithIdentifier("toResultView", sender: nil)
    }

     func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "toResultView") {
            
            var ResultView : ResultViewController = segue.destinationViewController as! ResultViewController

            ResultView.correctAnswer = self.correctAnswer
        }
    }
    
     func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
}



