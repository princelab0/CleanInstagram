
import IGListKit

final class SearchUserModel: ListDiffable {
    
    var pk: Int
    var profile_image: String
    var username: String
    var full_name: String
    var search_social_context: String?
    
    init(pk: Int, profile_image: String, search_social_context: String?, username: String, full_name: String) {
        self.pk = pk
        self.profile_image = profile_image
        self.search_social_context = search_social_context
        self.username = username
        self.full_name = full_name
        
    }
    
    // MARK: ListDiffable
    
    func diffIdentifier() -> NSObjectProtocol {
        return username as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? SearchUserModel else { return false }
        return username == object.username
            && pk == object.pk
    }
    
}
