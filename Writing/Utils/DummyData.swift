import Foundation

struct DummyData {
    
    static let fictionalNames = [
        FictionalName(uuid: UUID(uuidString: "49F97FA2-450A-4FFD-9A32-635BC824F33C") ?? UUID.init(), name: "Wand", description: "Casts Magic"),
        FictionalName(uuid: UUID(uuidString: "527A57ED-7E53-485F-B125-23BE2E58D38D") ?? UUID.init(), name: "Light Saber", description: "Fancy Cheese Cutter"),
        FictionalName(uuid: UUID(uuidString: "7E4EBBB4-7D5F-4A4A-9747-0AC55427D67D") ?? UUID.init(), name: "Jutsu", description: "Magic By Gang Signs")
    ]
    
    static let organizations = [
        Organization(uuid: UUID(uuidString: "EEBDA180-5DDB-4759-8E6E-2756788EC5E3") ?? UUID.init(),
                     name: "Dumbledore's Army",
                     goals: ["Defeat Vodemort", "Save Dobby"],
                     relationships: [],
                     members: []),
        Organization(uuid: UUID(uuidString: "DF03AB67-40B3-489C-B9A9-59EFCF10A5EE") ?? UUID.init(),
                     name: "The Rebels",
                     goals: ["Destroy the Empire", "Learn the ways of the force"],
                     relationships: [],
                     members: []),
        Organization(uuid: UUID(uuidString: "ECF834A2-956C-40DE-B6AF-B1A1A6582358") ?? UUID.init(),
                     name: "Hidden Leaf Village",
                     goals: ["Raise Ninja"],
                     relationships: [],
                     members: [])
    
    ]
    
    static let characters = [
        Character(uuid: UUID(uuidString: "6E4371D8-47B5-403A-AEA2-64D5D3C899AD") ?? UUID.init(),
                  firstName: "Harry",
                  lastName: "Potter",
                  middleName: nil,
                  nickNames: ["The boy who lives"],
                  gender: .male,
                  birthday: Date(),
                  skills: ["Magic", "Plot Armor"],
                  appearance: ["Black Hair", "Round Glasses", "British Accent"],
                  allegiances: [organizations[0]],
                  relationships: [],
                  ethnicity: "Leprecaun",
                  flaws: ["Stuttering", "Bad Eyesight"],
                  strength: ["Main Character", "Magic"],
                  arc: "Does stuff and lives happily ever after",
                  background: "Did stuff in the past",
                  goals: ["Defeat Voldemort", "Get Dates"]),
        
        Character(uuid: UUID(uuidString: "89D086D0-930E-4D12-91BC-EE46D30182C9") ?? UUID.init(),
                  firstName: "Luke",
                  lastName: "Skywalker",
                  middleName: nil,
                  nickNames: ["The Chosen One"],
                  gender: .male,
                  birthday: Date(),
                  skills: ["The Force", "Plot Armor", "Light Saber Skills"],
                  appearance: ["Brown Hair", "Robes"],
                  allegiances: [organizations[0], organizations[1]],
                  relationships: [],
                  ethnicity: "Main Character",
                  flaws: ["Egotistical"],
                  strength: ["Main Character", "The force"],
                  arc: "Does stuff and lives happily ever after",
                  background: "Did stuff in the past",
                  goals: ["Defeat Darth Vader", "Defeat the Empire"]),
        
        Character(uuid: UUID(uuidString: "268499CA-4A27-4889-9098-314A36AEE483") ?? UUID.init(),
                  firstName: "Naruto",
                  lastName: "Uzumaki",
                  middleName: nil,
                  nickNames: ["The Chosen One", "Host of the Nine-Tails"],
                  gender: .male,
                  birthday: Date(),
                  skills: ["Jutsu", "Plot Armor"],
                  appearance: ["Yellow Hair", "Headband"],
                  allegiances: [organizations[2]],
                  relationships: [],
                  ethnicity: "Main Character",
                  flaws: ["Unintelligent"],
                  strength: ["Main Character", "Friendship Power"],
                  arc: "Does stuff and lives happily ever after",
                  background: "Did stuff in the past",
                  goals: ["Help Friends", "Get Stronger"])
    ]
    
    static let relationships = [
        Relationship(uuid: UUID(uuidString: "568499CA-4A27-4889-9098-314A36AEE484") ?? UUID.init(), participats: [characters[0], characters[2]], relationshipImportance: .important, type: .ally),
        
        Relationship(uuid: UUID(uuidString: "668499CA-4A27-4889-9098-314A36AEE485") ?? UUID.init(), participats: [characters[2], characters[1]], relationshipImportance: .somewhatImportant, type: .enemy),
        
        Relationship(uuid: UUID(uuidString: "768499CA-4A27-4889-9098-314A36AEE486") ?? UUID.init(), participats: [characters[0], characters[1]], relationshipImportance: .important, type: .enemy)
    ]
    
    static let chapters = [
        Chapter(uuid: UUID(uuidString: "E86C6062-75F8-4D2C-8109-152BD67BDB26") ?? UUID.init(), name: "Chapter 1", text: "This is the text for chapter 1", appearingCharacters: [characters[0].uuid, characters[1].uuid], nextChapter: UUID(uuidString: "1440517A-A0E8-4A9E-B872-45008A9F6CB2") ?? UUID.init(), summary: ["Something happened", "Something else happened", "A third thing happened"]),
        Chapter(uuid: UUID(uuidString: "1440517A-A0E8-4A9E-B872-45008A9F6CB2") ?? UUID.init(), name: "Chapter 2", text: "This is the text for chapter 2", appearingCharacters: [characters[2].uuid], nextChapter: UUID(uuidString: "1C6C4069-63CA-4712-AA87-6F6DD62B7595") ?? UUID.init(), summary: ["Something happened", "Something else happened", "A third thing happened"]),
        Chapter(uuid: UUID(uuidString: "1C6C4069-63CA-4712-AA87-6F6DD62B7595") ?? UUID.init(), name: "Chapter 3", text: "This is the text for chapter 3", appearingCharacters: [characters[0].uuid, characters[2].uuid], nextChapter: nil, summary: ["Something happened", "Something else happened", "A third thing happened"])
    ]
    
    static let places = [
        Place(uuid: UUID(uuidString: "7CD0F95C-2685-47B4-A3DB-949AB8B4A5FE") ?? UUID.init(), name: "Hogwarts", appearsIn: [chapters[0], chapters[1]]),
        Place(uuid: UUID(uuidString: "CF49755F-1CD1-4D2D-9183-2098C5356ECF") ?? UUID.init(), name: "Magnolia", appearsIn: [chapters[0], chapters[2]]),
        Place(uuid: UUID(uuidString: "E20EB299-DB31-4D64-95DE-84E823087182") ?? UUID.init(), name: "Hidden Leaf Village", appearsIn: [chapters[1]])
    ]
    
    
}
