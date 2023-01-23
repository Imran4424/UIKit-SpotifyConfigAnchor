//
//  ViewController.swift
//  SpotifyConfiguration
//
//  Created by Shah Md Imran Hossain on 23/1/23.
//

import UIKit

class ViewController: UIViewController {
    let margin: CGFloat = 20
    let spacing: CGFloat = 32
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupNavigationBar()
        setupViews()
    }
    
    func setupNavigationBar() {
        navigationItem.title = "Playback"
    }
    
    func setupViews() {
        let offlineLabel = makeLabel(withText: "Offline")
        let offlineSwitch = makeSwitch(isOn: false)
        let offlineSublabel = makeSubLabel(withText: "When you go offline, you'll only be able to play the music and podcasts you've downloaded.")
        
        let crossfadeLabel = makeBoldLabel(withText: "Crossfade")
        let crossfadeMinLabel = makeSubLabel(withText: "0s")
        let crossfadeMaxLabel = makeSubLabel(withText: "12s")
        let crossfadeProgressView = makeProgressView()
        let leadingGuide = UILayoutGuide()
        let trailingGuide = UILayoutGuide()
        
        let gaplessPlaybackLabel = makeLabel(withText: "Gapless Playback")
        let gaplessPlaybackSwitch = makeSwitch(isOn: true)
        
        let hideSongsLabel = makeLabel(withText: "Hide Unplayable Songs")
        let hideSongsSwitch = makeSwitch(isOn: true)
        
        let enableNormalizationLabel = makeLabel(withText: "Enable Audio Normalization")
        let enableNormalizationSwitch = makeSwitch(isOn: true)
        
        view.addSubview(offlineLabel)
        view.addSubview(offlineSwitch)
        view.addSubview(offlineSublabel)
        
        view.addSubview(crossfadeLabel)
        view.addSubview(crossfadeMinLabel)
        view.addSubview(crossfadeProgressView)
        view.addSubview(crossfadeMaxLabel)
        view.addLayoutGuide(leadingGuide) // using addLayoutGuide
        view.addLayoutGuide(trailingGuide)
//
//        view.addSubview(gaplessPlaybackLabel)
//        view.addSubview(gaplessPlaybackSwitch)
//
//        view.addSubview(hideSongsLabel)
//        view.addSubview(hideSongsSwitch)
//
//        view.addSubview(enableNormalizationLabel)
//        view.addSubview(enableNormalizationSwitch)
        
        // offlineLabel
        NSLayoutConstraint.activate([
            offlineLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            offlineLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        
        // offline switch
        NSLayoutConstraint.activate([
            offlineSwitch.topAnchor.constraint(equalTo: offlineLabel.topAnchor),
            view.trailingAnchor.constraint(equalTo: offlineSwitch.trailingAnchor, constant: 20)
        ])
        
        // offline sublabel
        NSLayoutConstraint.activate([
            offlineSublabel.topAnchor.constraint(equalTo: offlineLabel.bottomAnchor, constant: 20),
            offlineSublabel.leadingAnchor.constraint(equalTo: view.readableContentGuide.leadingAnchor),
            offlineSublabel.trailingAnchor.constraint(equalTo: view.readableContentGuide.trailingAnchor)
        ])
        
        // crossfade
        NSLayoutConstraint.activate([
            crossfadeLabel.topAnchor.constraint(equalTo: offlineSublabel.bottomAnchor, constant: 32),
            crossfadeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // crossfade progress view
        leadingGuide.widthAnchor.constraint(equalTo: trailingGuide.widthAnchor).isActive = true
        leadingGuide.widthAnchor.constraint(equalToConstant: 5).isActive = true
        
        // cross fade min label
        NSLayoutConstraint.activate([
            crossfadeMinLabel.topAnchor.constraint(equalTo: crossfadeLabel.bottomAnchor, constant: 32),
            crossfadeMinLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            crossfadeMinLabel.trailingAnchor.constraint(equalTo: leadingGuide.leadingAnchor)
        ])
        
        // cross fade progress view
        NSLayoutConstraint.activate([
            leadingGuide.trailingAnchor.constraint(equalTo: crossfadeProgressView.leadingAnchor),
            crossfadeProgressView.trailingAnchor.constraint(equalTo: trailingGuide.leadingAnchor),
            crossfadeProgressView.centerYAnchor.constraint(equalTo: crossfadeMinLabel.centerYAnchor)
        ])
        
        // cross fade max label
        NSLayoutConstraint.activate([
            trailingGuide.trailingAnchor.constraint(equalTo: crossfadeMaxLabel.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: crossfadeMaxLabel.trailingAnchor, constant: 20),
            crossfadeMaxLabel.topAnchor.constraint(equalTo: crossfadeMinLabel.topAnchor)
        ])
    }
}

