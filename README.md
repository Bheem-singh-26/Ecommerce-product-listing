Third Party used :
Networking library : Alamofire
Offline storage : Realm
Swift Core Concepts :Optional channing, Property observers, Closure (@escape /@nonescape),Optional Binding ,sort etc.
Project and Swift concepts Used Information:
1. Alamofire is used  to fetch data from server  and other networking related functionalities. Other swift concepts  closure with escaping is used  to handle async responses. Created a network manager singleton class to manage network calls
2. Realms mobile database is used to stored data in mobile for offline uses
3. Created general utility class to manage interaction with realm database like fetching categories and product to display
4. HomeViewContoller: Designed user interface using auto layout for table view cells in table view which is used to listing products. Collection view to show list of categories so that user can filter products based on category.
5. core concept used in login to display filtered project : Enums, array.sort(), optional chaining, optional binding, property observers and switch cases to handle filter based on different ratings
5. At very first you can see all product from all the categories: You can also filter all products based on rankings
6. If you select any category from categories shown on top via horizontal collection view : The tableView shows all product within that selected category and user can filter based on rankings within that category as well.
7. Improved user interface using view extension such as CardView class for better look and feel
8. All the constants related to app i have kept in EConstant.swift file







