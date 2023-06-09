
import IGListKit
import SDWebImage

class UserInfoPostSectionController: ListSectionController {
    private var object: GridItem?
    
    override init() {
        super.init()
        minimumLineSpacing = 1
        minimumInteritemSpacing = 1
    }
    
    // MARK: ListSectionController
    
    override func sizeForItem(at index: Int) -> CGSize {
        guard let width = collectionContext?.containerSize.width else { fatalError() }
        
        return CGSize(width: floor((width - 2 * minimumInteritemSpacing) / 3), height: floor((width - 2 * minimumInteritemSpacing) / 3))
    }
    
    override func numberOfItems() -> Int {
        return object?.itemCount ?? 0
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext!.dequeueReusableCell(of: UserInfoPostCell.self, for: self, at: index) as? UserInfoPostCell else { fatalError("Cell not bindable") }
        cell.imageView.sd_setImage(with: object?.items[index].imageURL)
        if object?.items[index].type == 2 {
            cell.carouselFlag.isHidden = false
        } else if object?.items[index].type == 3 {
            cell.videoFlag.isHidden = false
        }
        return cell
    }
    
    override func didUpdate(to object: Any) {
        self.object = object as? GridItem
    }
    
    override func didSelectItem(at index: Int) {
        print("Tap photo " + (object?.items[index].id)!)
        let userInfoViewController = MediaViewController(media_id: (object?.items[index].id)!)
        viewController?.navigationController?.pushViewController(userInfoViewController, animated: true)
    }
}
