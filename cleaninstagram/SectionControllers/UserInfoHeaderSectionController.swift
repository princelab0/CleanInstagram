

import IGListKit

class UserInfoHeaderSectionController: ListBindingSectionController<ListDiffable>, ListBindingSectionControllerDataSource, UserInfoHeaderCellDelegate {
    
    var userInfo: UserInfo?
    var followFlagChange: Bool = false
    
    override init() {
        super.init()
        dataSource = self
    }
    
    // MARK: ListBindingSectionController
    
    func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, viewModelsFor object: Any) -> [ListDiffable] {
        guard let object = object as? UserInfo else { fatalError() }
        userInfo = object
        return [object]
    }
    
    func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, cellForViewModel viewModel: Any, at index: Int) -> UICollectionViewCell & ListBindable {
        guard let cell = collectionContext!.dequeueReusableCell(of: UserInfoHeaderCell.self, for: self, at: index) as? UICollectionViewCell & ListBindable
            else { fatalError("Cell not bindable") }
        if let cell = cell as? UserInfoHeaderCell {
            cell.delegate = self
        }
        return cell
    }
    
    func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, sizeForViewModel viewModel: Any, at index: Int) -> CGSize {
        guard let width = collectionContext?.containerSize.width else { fatalError() }
        var height: CGFloat = 175 + UserInfoHeaderCell.textHeight((userInfo?.biography)!, width: width)
        if userInfo?.full_name == "" { height -= 20}
        if userInfo?.biography == "" { height -= 14}
        if userInfo?.external_url == "" { height -= 14}
        
        return CGSize(width: width, height: height)
    }
    
    // UserInfoHeaderCellDelegate
    
    func didTapFollow(cell: UserInfoHeaderCell) {
        if userInfo?.friendship.following == true {
            if followFlagChange == false {
                followFlagChange = true
                cell.followButton.setTitle("Follow", for: .normal)
                insta.FollowOp(type: false, user_id: String(userInfo!.pk))
            } else {
                followFlagChange = false
                if userInfo?.is_private == true {
                    cell.followButton.setTitle("Requesting", for: .normal)
                } else {
                    cell.followButton.setTitle("Following", for: .normal)
                }
                insta.FollowOp(type: true, user_id: String(userInfo!.pk))
            }
        } else {
            if followFlagChange == false {
                if userInfo?.friendship.outgoing_request == false {
                    if userInfo?.is_private == true {
                        cell.followButton.setTitle("Requesting", for: .normal)
                    } else {
                        cell.followButton.setTitle("Following", for: .normal)
                    }
                    followFlagChange = true
                    insta.FollowOp(type: true, user_id: String(userInfo!.pk))
                } else { // sent request already
                    cell.followButton.setTitle("Follow", for: .normal)
                    insta.FollowOp(type: false, user_id: String(userInfo!.pk))
                }
            } else {
                followFlagChange = false
                cell.followButton.setTitle("Follow", for: .normal)
                insta.FollowOp(type: false, user_id: String(userInfo!.pk))
            }
        }

        update(animated: true)
    }
    
    func didTapFollowerCount(cell: UserInfoHeaderCell) {
        let friendshipViewController = FriendshipViewController(username_id: (userInfo?.pk)!, type: "Follower")
        viewController?.navigationController?.pushViewController(friendshipViewController, animated: true)
    }
    
    func didTapFollowingCount(cell: UserInfoHeaderCell) {
        let friendshipViewController = FriendshipViewController(username_id: (userInfo?.pk)!, type: "Following")
        viewController?.navigationController?.pushViewController(friendshipViewController, animated: true)
    }
}
