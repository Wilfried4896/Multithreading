//
//  Post.swift
//  Navigation1_3
//
//  Created by Вилфриэд Оди on 14.06.2022.
//

import Foundation

struct Post {
    
    static let shared = Post()

    private init() {}

    let data: [Article] = [
        Article(
            author: "Jean-Laurent Cassely",
            image: "Steve-Jobs",
            description: "On a déjà parlé ici du danger qui consiste à justifier l’accueil de réfugiés par la mise en avant d’argument utilitaires: principalement économiques —les migrants sont une force de travail utile– et démographiques– ils combleront les trous de nos pyramides des âges de sociétés vieillissantes. Encore une fois, il ne s’agit pas de tenir le discours inverse, affirmant que l’immigration serait globalement un poids pour les sociétés d’accueil, simplement se cacher derrière un discours utilitariste est ambigu et parfois hors sujet.",
            likes: 234,
            views: 330
        ),

        Article(
            author: "Материал из Википедии",
            image: "Vladimir-Poutine",
            description: "Влади́мир Влади́мирович Пу́тин (род. 7 октября 1952, Ленинград, РСФСР, СССР) — российский государственный, политический и военный деятель. Действующий президент Российской Федерации, председатель Государственного Совета Российской Федерации и верховный главнокомандующий Вооружёнными силами Российской Федерации с 7 мая 2012 года. Ранее занимал должность президента с 7 мая 2000 года по 7 мая 2008 года, также в 1999—2000 и 2008—2012 годах занимал должность председателя правительства Российской Федерации. Выпускник юридического факультета Ленинградского государственного университета (ЛГУ). С 1977 года работал в следственном отделе Управления КГБ СССР по Ленинграду и Ленинградской области[6]. С 1985 по 1990 год служил в резидентуре советской внешней разведки в ГДР.",
             likes: 90,
            views: 100
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

struct Photo {
    static let shared = Photo()
    private init() {}

    let imageData: [PhotoGameOfThrone] = [
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
            image: "Vladimir-Poutine"
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
