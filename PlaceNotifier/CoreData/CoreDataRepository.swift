import CoreData

final class CoreDataRepository {
    init() { }
    
    private static let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "PlaceNotifier")
        // コンテナが初期化されたら、これを読んでCoreDataスタックの作成を完了させる必要がある
        // 完了ハンドラが呼ばれると、CoreDataは完全に初期化され、使用できるようになる
        container.loadPersistentStores { storeDescription, error in
            if let error = error as? NSError {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    private static var viewContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }
}

// MARK: - Common
extension CoreDataRepository {
    /// CoreDataへの変更を保存する
    static func save() throws {
        guard viewContext.hasChanges else { return }
        try viewContext.save()
    }
    
    /// CoreDataの変更を元に戻す
    static func rollBack() throws {
        guard viewContext.hasChanges else { return }
        viewContext.rollback()
    }
}

// MARK: - PlaceNotifier
extension CoreDataRepository {
    /// CoreDataにPlacenotifierを登録する
    static func createCDPlaceNotifier(by placeNotifier: PlaceNotifier) throws {
        let newCDPlaceNotifier = CDPlaceNotifier(context: viewContext)
        newCDPlaceNotifier.title = placeNotifier.title
        try save()
    }
    
    /// CoreDataからPlaceNotifierを取得する
    static func fetchPlaceNotifiers() throws -> [PlaceNotifier] {
        let request = NSFetchRequest<CDPlaceNotifier>(entityName: "CDPlaceNotifier")
        let cdPlaceNotifiers = try viewContext.fetch(request)
        return cdPlaceNotifiers.map {
            PlaceNotifier(title: $0.title ?? "")
        }
    }
}
