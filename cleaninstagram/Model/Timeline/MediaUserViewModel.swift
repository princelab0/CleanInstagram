

import IGListKit

final class UserViewModel: ListDiffable {
    
    let username: String
    var timestamp: String
    let userProfileImage: URL
    let location: String
    
    init(username: String, userProfileImage: URL, location: String, timestamp: Int) {
        self.username = username
//        self.timestamp = timestamp
        self.userProfileImage = userProfileImage
        self.location = location
        
        let unixTimestamp = Double(timestamp)
        self.timestamp = Date(timeIntervalSince1970: unixTimestamp).timeAgoDisplay()
    }
    
    // MARK: ListDiffable
    
    func diffIdentifier() -> NSObjectProtocol {
        return "user" as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? UserViewModel else { return false }
        return username == object.username
            && location == object.location
            && userProfileImage == object.userProfileImage
            && timestamp == object.timestamp
    }
    
}
