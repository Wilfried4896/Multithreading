//
//  Post.swift
//  Navigation1_3
//
//  Created by Вилфриэд Оди on 14.06.2022.
//

import UIKit

public struct PostFeed {
    public var title: String
    
    public init(Title title: String) {
        self.title = title
    }
    
}

public struct Article {
    public var author: String
    public var image: String?
    public var description: String
    public var likes: Int
    public var views: Int
}

public struct PhotoGameOfThrone {
    public var image: String?
}

public struct Post {
    
    public static let shared = Post()

    private init() {}

    public let data: [Article] = [
        Article(
            author: "Jean-Laurent Cassely",
            image: "Steve-Jobs",
            description: "On a déjà parlé ici du danger qui consiste à justifier l’accueil de réfugiés par la mise en avant d’argument utilitaires: principalement économiques —les migrants sont une force de travail utile– et démographiques– ils combleront les trous de nos pyramides des âges de sociétés vieillissantes. Encore une fois, il ne s’agit pas de tenir le discours inverse, affirmant que l’immigration serait globalement un poids pour les sociétés d’accueil, simplement se cacher derrière un discours utilitariste est ambigu et parfois hors sujet.",
            likes: 234,
            views: 330
        ),

        Article(
            author: "Temujin",
            image: "Kali-Linux",
            description: "В начале июня состоялся релиз дистрибутива для цифровой криминалистики и тестирования систем безопасности Kali Linux 2021.2.",
            likes: 67,
            views: 322
        ),

        Article(
            author: "Destination Africa",
            image: "basilique",
            description: "Also called the Yamoussoukro Basilica, the Basilica of Our Lady of Peace is the largest Catholic religious monument in the world. Every year, thousands of people, natives, foreign pilgrims and tourists come to discover the splendor of this majestic building. However, the construction of the Basilica of Our Lady of Peace is marred by many controversies. Discover in this guide 6 things that you probably did not know about this basilica.",
            likes: 400,
            views: 300
        )
     ]
}

public struct Photo {
    public static let shared = Photo()
    private init() {}

    public let imageData: [PhotoGameOfThrone] = [
        PhotoGameOfThrone(
            image: "2"
        ),

        PhotoGameOfThrone(
            image: "3"
        ),

        PhotoGameOfThrone(
            image: "4"
        ),

        PhotoGameOfThrone(
            image: "5"
        ),

        PhotoGameOfThrone(
            image: "Kali-Linux"
        ),

        PhotoGameOfThrone(
            image: "basilique"
        ),

        PhotoGameOfThrone(
            image: "Steve-Jobs"
        ),

    ]
}
