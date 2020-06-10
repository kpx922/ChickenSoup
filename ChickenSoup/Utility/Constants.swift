//
//  Constants.swift
//  ChickenSoup
//
//  Created by Shihchiao Chao on 4/1/20.
//  Copyright © 2020 Shihchiao Chao. All rights reserved.
//

import UIKit

enum AdUnitId {
    enum interstitial {
        static let id = interstitial.real
        static let test = "ca-app-pub-3940256099942544/4411468910"
        static let real = "ca-app-pub-3986084569145000/8853873883"
    }
    
    enum banner {
        static let id = banner.real
        static let test = "ca-app-pub-3940256099942544/2934735716"
        static let real = "ca-app-pub-3986084569145000/2381883198"
    }
}

enum Title {
    static let appTitle = "Chicken Soup"
    static let cellTitles = ["Soup of the day", "Positivity", "Negativity"]
}

enum FontName {
    static let Futura = "Futura"
}

enum Color {
    static let white = UIColor(white: 0.9, alpha: 0.8)
    static let black = UIColor(white: 0.06, alpha: 0.7)
    static let backgroundColor = UIColor.init(named: "backgroundColor")
}

enum SFSymbols {
    static let configuration = UIImage.SymbolConfiguration(scale: .large)
    
    static let more          = UIImage(systemName: "ellipsis", withConfiguration: configuration)
    static let close         = UIImage(systemName: "xmark", withConfiguration: configuration)
    static let warning       = UIImage(systemName: "exclamationmark.triangle", withConfiguration: configuration)
    static let error         = UIImage(systemName: "xmark.circle", withConfiguration: configuration)
}

enum Alert {
    enum type {
        case warning
        case error
    }
}

enum Quotations {
    enum type: String {
        case soupOfTheDay = "S"
        case positivity = "P"
        case negativity = "N"
    }
    
    static let allQuotes = Quotations.positivity + Quotations.negativity
    static let positivity = [
        Quote(type: type.positivity, author: "Helen Keller", quote: "Keep your face to the sunshine and you cannot see a shadow."),
        Quote(type: type.positivity, author: "Willie Nelson", quote: "Once you replace negative thoughts with positive ones, you’ll start having positive results."),
        Quote(type: type.positivity, author: "Lyndon B. Johnson", quote: "Yesterday is not ours to recover, but tomorrow is ours to win or lose."),
        Quote(type: type.positivity, author: "Dalai Lama", quote: "In order to carry a positive action we must develop here a positive vision."),
        Quote(type: type.positivity, author: "Walt Disney", quote: "I always like to look on the optimistic side of life, but I am realistic enough to know that life is a complex matter."),
        Quote(type: type.positivity, author: "Zig Ziglar", quote: "Positive thinking will let you do everything better than negative thinking will."),
        Quote(type: type.positivity, author: "William James", quote: "Pessimism leads to weakness, optimism to power."),
        Quote(type: type.positivity, author: "Deepak Chopra", quote: "You can’t make positive choices for the rest of your life without an environment that makes those choices easy, natural, and enjoyable."),
        Quote(type: type.positivity, author: "Lee lacocca", quote: "The thing that lies at the foundation of positive change, the way I see it, is service to a fellow human being."),
        Quote(type: type.positivity, author: "Harvey Mackay", quote: "Positive thinking is more than just a tagline. It changes the way we behave. And I firmly believe that when I am positive, it not only makes me better, but it also makes those around me better."),
        Quote(type: type.positivity, author: "Les Brown", quote: "In every day, there are 1,440 minutes. That means we have 1,440 daily opportunities to make a positive impact."),
        Quote(type: type.positivity, author: "Winston Churchill", quote: "Attitude is a little thing that makes a big difference."),
        Quote(type: type.positivity, author: "Stephen King", quote: "You can, you should, and if you’re brave enough to start, you will."),
        Quote(type: type.positivity, author: "Roy T. Bennett", quote: "Don’t be pushed around by the fears in your mind. Be led by the dreams in your heart."),
        Quote(type: type.positivity, author: "Oprah Winfrey", quote: "The greatest discovery of all time is that a person can change his future by merely changing his attitude."),
        Quote(type: type.positivity, author: "Tyler Perry", quote: "It’s most important that you surround yourself with positivity always, and have it in your mind at all times."),
        Quote(type: type.positivity, author: "Seth Godin", quote: "Optimism is the most important human trait, because it allows us to evolve our ideas, to improve our situation, and to hope for a better tomorrow."),
        Quote(type: type.positivity, author: "Stephen Richards", quote: "The only time you fail is when you fall down and stay down."),
        Quote(type: type.positivity, author: "Lou Holtz", quote: "Virtually nothing is impossible in this world if you just put your mind to it and maintain a positive attitude."),
        Quote(type: type.positivity, author: "Roy T. Bennett", quote: "Start each day with a positive thought and a grateful heart."),
        Quote(type: type.positivity, author: "Deborah Day", quote: "Beliefs that are good promote your potential and enhance your unique special qualities."),
        Quote(type: type.positivity, author: "Rodolfo Costa", quote: "Cultivate an optimistic mind, use your imagination, always consider alternatives, and dare to believe that you can make possible what others think is impossible."),
        Quote(type: type.positivity, author: "Remez Sasson", quote: "“A powerful attitude awakens inner strength, energy, motivation, and initiative."),
        Quote(type: type.positivity, author: "L.F. Young", quote: "Don’t hang with negative people. They will pull you down with them. Instead, invite them into your light and together you will both shine strong.")
    ]
    
    static let negativity = [
        Quote(type: type.negativity, quote: "If you can stay calm, while all around you is chaos…then you probably haven't completely understood the seriousness of the situation."),
        Quote(type: type.negativity, quote: "Nobody can stop me, but only because I've not started yet."),
        Quote(type: type.negativity, quote: "When you fail, there will be people who cares. They come and ask. They listen. And they leave with satisfaction."),
        Quote(type: type.negativity, quote: "Why does fate always mess up with geniuses? Because no one bother caring about idiots."),
        Quote(type: type.negativity, quote: "There is no such a thing called allodoxaphobia. You are just being poor."),
        Quote(type: type.negativity, quote: "Even though you are single, but you weight like double."),
        Quote(type: type.negativity, quote: "Some people seem to have everything. In fact, they do have everything."),
        Quote(type: type.negativity, quote: "Don't photoshop yourself again and again.We know you look ugly in reality."),
        Quote(type: type.negativity, quote: "Bill Gates became the richest manby dropping out of school and starting his own business. But the school he dropped out is Harvard."),
        Quote(type: type.negativity, quote: "If you don't try, how can you know what it feels like to be desperate?"),
        Quote(type: type.negativity, quote: "All roads lead to Rome. Yet, some people have been living there ever since they were born."),
        Quote(type: type.negativity, quote: "Don't be discouraged. Life is full of ups and downs,and all the downs after those downs."),
        Quote(type: type.negativity, quote: "You have chicken soup for the soul. Because someone else already ate the chicken."),
        Quote(type: type.negativity, quote: "You think the rich are happy? No, the way they're happy is beyond your imagination."),
        Quote(type: type.negativity, quote: "If you feel ugly, poor and useless, don't be devastated. At least you have good judgement."),
        Quote(type: type.negativity, quote: "The more you learn, the more you know; the more you know, the more you forget. The more you forget, the less you know. So why bother to learn?"),
        Quote(type: type.negativity, quote: "“Hard work never killed anybody.” But why take the risk?"),
        Quote(type: type.negativity, quote: "Started from the bottom…still at the bottom"),
        Quote(type: type.negativity, quote: "There’s no such thing as waking up from a nightmare because the world is a nightmare."),
        Quote(type: type.negativity, quote: "Relationships are just two people constantly asking each other where they want to go eat, until one of them die."),
        Quote(type: type.negativity, quote: "I have a really bad habit called assuming the worst."),
        Quote(type: type.negativity, quote: "I take super hot showers because I’d like to practice burning in hell."),
        Quote(type: type.negativity, quote: "If life knocks you down, then just stay lying down."),
        Quote(type: type.negativity, quote: "While you are still young, take more challenges so when you grow old, you will get used to it eventually."),
        Quote(type: type.negativity, quote: "99% of the things on this world could be solved with money, and the last percentage, is that you need more money."),
        Quote(type: type.negativity, quote: "People who are gifted are still working hard in life, there’s no point to try anymore."),
        Quote(type: type.negativity, quote: "When God closes a door, he might as well slams your head on the way."),
        Quote(type: type.negativity, quote: "Sometimes you worry about your abilities is not good enough, don’t, because you are correct."),
        Quote(type: type.negativity, quote: "Who says you have no perseverance? You insisted staying single for decades."),
        Quote(type: type.negativity, quote: "Some say: “Money brings your happiness”, but most were never happy."),
        Quote(type: type.negativity, quote: "The early bird catches the worm, but a lot of you are the worm."),
        Quote(type: type.negativity, quote: "Three stages of life: birth, WTF, death"),
        
        Quote(type: type.negativity, quote: "I feel like I’m already tired tomorrow."),
        Quote(type: type.negativity, quote: "Birth certificates are just receipts for human bings. How and where can I return."),
        Quote(type: type.negativity, quote: "Always be yourself (except during job interviews, the first few months of a relationship or any type of social interaction)"),
        Quote(type: type.negativity, quote: "Sometimes, as motivation, I reward myself before I accomplish something. It’s called a “preward“ and it 100% does not work."),
        Quote(type: type.negativity, quote: "Me: I want to travel more. Bank Account: Like what? The park?"),
        Quote(type: type.negativity, quote: "People are always like “Are you a morning person or a night person?” and I’m just like “Mate, I’m barely even a person.”"),
        Quote(type: type.negativity, quote: "I’m not running away from hard work, I’m too lazy to run."),
        Quote(type: type.negativity, quote: "“Do you hate people?”\n“I don't hate them...I just feel better when they're not around.”"),
        Quote(type: type.negativity, quote: "Never put off the work till tomorrow what you can put off today.")
    ]
}
