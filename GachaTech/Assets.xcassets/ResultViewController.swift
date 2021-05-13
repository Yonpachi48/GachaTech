//
//  ResultViewController.swift
//  GachaTech
//
//  Created by Yudai Takahashi on 2021/05/03.
//

import UIKit

class ResultViewController: UIViewController {
    //背景画像
    @IBOutlet var haikeiImageView: UIImageView!
    //モンスター画像
    @IBOutlet var monsterImageView: UIImageView!
    //モンスター画像を保存しておく配列
    var monsterArray: [UIImage]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //0~9の間でランダムに数字を発生させる
        let number = Int.random(in: 0..<10)
        
        //モンスターの画像を10枚追加する
        monsterArray = [UIImage(named: "monster001.png")!,
                        UIImage(named: "monster002.png")!,
                        UIImage(named: "monster003.png")!,
                        UIImage(named: "monster004.png")!,
                        UIImage(named: "monster005.png")!,
                        UIImage(named: "monster006.png")!,
                        UIImage(named: "monster007.png")!,
                        UIImage(named: "monster008.png")!,
                        UIImage(named: "monster009.png")!,
                        UIImage(named: "monster010.png")!]
        
        //モンスターを表示
        monsterImageView.image = monsterArray[number]
    
        //モンスターごとに背景を変える
        if number == 9 {            //9の時
            haikeiImageView.image = UIImage(named: "bg_gold@2x.png")
        }
        else if number > 6 {        //7~8の時
            haikeiImageView.image = UIImage(named: "bg_red@2x.png")
        }
        else {                      //0~6の時
            haikeiImageView.image = UIImage(named: "bg_blue@2x.png")
        }
    }
    
    //ResultViewControllerが表示されるたびに呼び出すメソッド
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        //アニメーションの中でもtransform(変形)させるキーパスを設定
        let animation = CABasicAnimation(keyPath: "transform")
        
        //アニメーションの開始の数値
        animation.fromValue = NSNumber(value: 0)
        
        //アニメーション終了時の数値(M_piとは角度の180度)
        animation.toValue = NSNumber(value: 2 * Double.pi)
        
        //z軸を中心としたアニメーションにする
        animation.valueFunction = CAValueFunction(name: CAValueFunctionName.rotateZ)
        
        //アニメーションの速さを指定
        animation.duration = 5
        
        //アニメーションを何回繰り返すかを決める(今回は無限)
        animation.repeatCount = Float.infinity
        
        //どのレイヤーをアニメーションさせるか指定
        haikeiImageView.layer.add(animation, forKey: nil)
    }
    
    //最初の画面へ戻る
    @IBAction func modoru() {
        self.dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
