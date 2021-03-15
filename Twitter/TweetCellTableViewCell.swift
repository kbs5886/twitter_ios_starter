//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Kartikey Singh on 3/13/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetContent: UILabel!
    
    @IBOutlet weak var retweetButton1: UIButton!
    
    @IBOutlet weak var retweetButton: UIView!
    
    @IBOutlet weak var favButton: UIButton!
    
    
    @IBAction func retweet(_ sender: Any) {
        TwitterAPICaller.client?.retweet(tweetId: tweetId, success: {
            self.setRetweeted(true)
        }, failure: { (Error) in
            print("Error in retweeting \(Error)")
        })
        
    }
    
    @IBAction func favoriteTweet(_ sender: Any) {
        let tobeFavorited = !favorited
        if (tobeFavorited) {
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(true)
            }, failure: { (Error) in
                print("Favorite did not succeed: \(Error)")
            })
        }else {
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {                self.setFavorite(false)
                
            }, failure: { (Error) in
                print("Unfavorite did not succeed: \(Error)")

            })
        }
    }
    
    var favorited:Bool = false
    var tweetId:Int = -1
    var retweeted:Bool = false
    
    
    func setRetweeted(_ isRetweeted: Bool){
        if (isRetweeted){
            retweetButton1.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            retweetButton1.isEnabled = false
        }else {
            retweetButton1.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
            retweetButton1.isEnabled = true
        }
    }
    
    func setFavorite(_ isFavorited: Bool){
        favorited = isFavorited
        if(favorited){
            favButton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
        }
        else {
            favButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)

        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
