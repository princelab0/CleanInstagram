

import IGListKit

final class MediaInfo: ListDiffable {
    
    let username: String
    let userProfileImage: URL
    let location: String
    let timestamp: Int
    let imageURL: URL
    let likes: Int
    let imageHeight: Int
    let imageWidth: Int
    let beliked: Bool
    let caption: CaptionViewModel
    let id: String
    let userid: Int
    let comment_count: Int
    let carousel: [String]?
    let type: Int?
    let videoURL: URL?
    let videoHeight: Int?
    let videoWidth: Int?
    let beSaved: Bool?
    
    init(username: String, userProfileImage: URL, location: String, timestamp: Int, imageURL: URL, imageHeight: Int, imageWidth: Int, likes: Int, beliked: Bool, caption: CaptionViewModel, id: String, userid: Int, comment_count: Int, type: Int? = 1, carousel: [String]? = nil, videoURL: URL? = nil, videoHeight: Int? = nil, videoWidth: Int? = nil, beSaved: Bool) {
        self.username = username
        self.userProfileImage = userProfileImage
        self.location = location
        self.timestamp = timestamp
        self.imageURL = imageURL
        self.likes = likes
        self.imageHeight = imageHeight
        self.imageWidth = imageWidth
        self.beliked = beliked
        self.caption = caption
        self.id = id
        self.userid = userid
        self.comment_count = comment_count
        self.type = type
        self.carousel = carousel
        self.videoURL = videoURL
        self.videoHeight = videoHeight
        self.videoWidth = videoWidth
        self.beSaved = beSaved
    }
    
    // MARK: ListDiffable
    
    func diffIdentifier() -> NSObjectProtocol {
        return (username + String(timestamp) + String(id)) as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? MediaInfo else { return false }
        return username == object.username
            && id == object.id
            && timestamp == object.timestamp
    }
    
}
