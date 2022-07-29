//
//  ViewController.swift
//  Hello_Swift
//
//  Created by 박재형 on 2022/07/29.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate, AVAudioRecorderDelegate {
    
    @IBOutlet var playProgress: UIProgressView!
    @IBOutlet var labelCurrentTime: UILabel!
    @IBOutlet var labelEndTime: UILabel!
    
    @IBOutlet var buttonPlay: UIButton!
    @IBOutlet var buttonPause: UIButton!
    @IBOutlet var buttonStop: UIButton!
    
    @IBOutlet var volumeSlider: UISlider!
    
    @IBOutlet var buttonRecord: UIButton!
    @IBOutlet var labelRecordTime: UILabel!
    
    var audioPlayer: AVAudioPlayer!
    var audioFile: URL!
    let MAX_VOLUME = 10.0
    var progressTimer: Timer! = nil
    
    var audioRecorder: AVAudioRecorder!
    var isRecordMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        selectAudioFile()
        if !isRecordMode {
            initPlay()
            buttonRecord.isEnabled = false
            labelRecordTime.isEnabled = false
        } else {
            initRecord()
        }
    }
    
    func selectAudioFile() {
        if !isRecordMode {
            audioFile = Bundle.main.url(forResource: "Sicilian_Breeze", withExtension: "mp3")
        } else {
            let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            audioFile = directory.appendingPathComponent("recordFile.m4a")
        }
    }
    
    func initPlay() {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioFile)
        } catch let error as NSError {
            print("Error-initplay: \(error)")
        }
        
        volumeSlider.maximumValue = Float(MAX_VOLUME)
        volumeSlider.value = 1.0
        playProgress.progress = 0
        
        audioPlayer.delegate = self
        audioPlayer.prepareToPlay()
        audioPlayer.volume = volumeSlider.value
        
        labelEndTime.text = convertTimeToString(audioPlayer.duration)
        labelCurrentTime.text = convertTimeToString(0)
        
        handleButtonEnable(true, pause: false, stop: false)
    }
    
    func initRecord() {
        let recordSettings = [
            AVFormatIDKey: NSNumber(value: kAudioFormatAppleLossless as UInt32),
            AVEncoderAudioQualityKey: AVAudioQuality.max.rawValue,
            AVEncoderBitRateKey: 320000,
            AVNumberOfChannelsKey: 2,
            AVSampleRateKey: 44100.0
        ] as [String: Any]
        
        do {
            audioRecorder = try AVAudioRecorder(url: audioFile, settings: recordSettings)
        } catch let error as NSError {
            print("Error-initRecord: \(error)")
        }
        
        audioRecorder.delegate = self
        
        volumeSlider.value = 1.0
        audioPlayer.volume = volumeSlider.value
        labelEndTime.text = convertTimeToString(0)
        labelCurrentTime.text = convertTimeToString(0)
        handleButtonEnable(false, pause: false, stop: false)
        
        let session = AVAudioSession.sharedInstance()
        do {
            try AVAudioSession.sharedInstance().setCategory(.playAndRecord, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch let error as NSError {
            print("Error-setCategory: \(error)")
        }
        
        do {
            try session.setActive(true)
        } catch let error as NSError {
            print("Error-setActive: \(error)")
        }
    }
    
    func convertTimeToString(_ time: TimeInterval) -> String {
        let min = Int(time / 60)
        let sec = Int(time.truncatingRemainder(dividingBy: 60))
        let strTime = String(format: "%02d:%02d", min, sec)
        
        return strTime
    }
    
    func handleButtonEnable(_ play: Bool, pause: Bool, stop: Bool) {
        buttonPlay.isEnabled = play
        buttonPause.isEnabled = pause
        buttonStop.isEnabled = stop
    }
    
    @IBAction func handlePlay(_ sender: UIButton) {
        audioPlayer.play()
        handleButtonEnable(false, pause: true, stop: true)
        
        progressTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(playTimeSelector), userInfo: nil, repeats: true)
    }
    
    @objc func playTimeSelector() {
        labelCurrentTime.text = convertTimeToString(audioPlayer.currentTime)
        playProgress.progress = Float(audioPlayer.currentTime / audioPlayer.duration)
    }
    
    
    @IBAction func handlePause(_ sender: UIButton) {
        audioPlayer.pause()
        handleButtonEnable(true, pause: false, stop: true)
    }
    
    @IBAction func handleStop(_ sender: UIButton) {
        audioPlayer.stop()
        audioPlayer.currentTime = 0
        labelCurrentTime.text = convertTimeToString(0)
        handleButtonEnable(true, pause: false, stop: false)
        progressTimer.invalidate()
    }
    
    @IBAction func handleVolumeChange(_sender: UISlider) {
        audioPlayer.volume = volumeSlider.value
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        progressTimer.invalidate()
        handleButtonEnable(true, pause: false, stop: false)
    }

    @IBAction func handleModeSwitch(_ sender: UISwitch) {
        if sender.isOn {
            audioPlayer.stop()
            audioPlayer.currentTime = 0
            labelRecordTime!.text = convertTimeToString(0)
            isRecordMode = true
            buttonRecord.isEnabled = true
            labelRecordTime.isEnabled = true
        } else {
            isRecordMode = false
            buttonRecord.isEnabled = false
            labelRecordTime.isEnabled = false
            labelRecordTime.text = convertTimeToString(0)
        }
        
        selectAudioFile()
        
        if !isRecordMode {
            initPlay()
        } else {
            initRecord()
        }
    }
    
    @IBAction func handleRecordButton(_ sender: UIButton) {
        if (sender as AnyObject).titleLabel?.text == "Record" {
            audioRecorder.record()
            (sender as AnyObject).setTitle("Stop", for: UIControl.State())
            progressTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(recordTimeSelector), userInfo: nil, repeats: true)
        } else {
            audioRecorder.stop()
            progressTimer.invalidate()
            (sender as AnyObject).setTitle("Record", for: UIControl.State())
            buttonPlay.isEnabled = true
            initPlay()
        }
    }
    
    @objc func recordTimeSelector() {
        labelRecordTime.text = convertTimeToString(audioRecorder.currentTime)
    }
}
