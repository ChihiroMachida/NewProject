//
//  RecordViewController.swift
//  NewProject
//
//  Created by 町田千優 on 2017/11/11.
//  Copyright © 2017年 町田千優. All rights reserved.
//

import UIKit
import AVFoundation

class RecordViewController: UIViewController {
    
    let fileManager = FileManager()       //ファイルマネージャー
    var audioRecorder = AVAudioRecorder() //レコーダー
    var audioPlayer = AVAudioPlayer()     //プレイヤー
    let fileName = "sample.caf"           //ファイル名

    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.setupAudioRecorder()
    }
    
    @IBAction func recordButton() { //録音ボタン
        
        audioRecorder.record()
    }
    
    @IBAction func stopButton() { //録音停止ボタン
        
        audioRecorder.stop()
    }
    
    @IBAction func playButton() { //再生ボタン
        
        play()
    }
    
    func setupAudioRecorder() { // 再生と録音機能をアクティブにする
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        try! session.setActive(true)
        let recordSetting : [String : Any] = [
            AVEncoderAudioQualityKey : AVAudioQuality.min.rawValue,
            AVEncoderBitRateKey : 16,
            AVNumberOfChannelsKey: 2,
            AVSampleRateKey: 44100.0
        ]
        do {
            try audioRecorder = AVAudioRecorder(url: documentFilePath(), settings: recordSetting)
        } catch {
            print("初期設定エラー")
        }
    }
    func play() { //再生
        
        do {
            try audioPlayer = AVAudioPlayer(contentsOf: documentFilePath())
        } catch {
            print("再生エラー")
        }
        audioPlayer.play()
    }
    
    func documentFilePath()-> URL { //ファイルのパスを取得
        
        let urls: [URL] = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        guard let dieUrl = urls.first else {
            fatalError()
        }
        return dieUrl.appendingPathComponent(fileName)
    }
    
    @IBAction func backButton() {
        
        dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
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
