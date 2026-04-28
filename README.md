README

o App title and purpose

	App Title: XVsO
	Purpose: To provide users with a simple, ergonomic, offline, and non-intrusive (no-ads) game experience, with three games that are easy to understand and medium-length. All games must be symmetrical horizontally (read the same upside down and right-side up) and widely known.


o Group members

	Eli Krouse: Admin, Designer, frontend dev, backend dev, etc.

o List of implemented course concepts
	1. Functions and Closures
		-> waitTime() uses a trailing closure, exemplifying asynchronouns code execution and @Escaping function variables (WaitTime(0.5){code()})
	2. Navigation Controller
		-> used for the settings button and table view delegate. The navigation controller's root view is replaced when changing games. (NavigationController?...)
	3. Error handling
		-> various guard statements help validate game logic functions correctly in each game (guard total > 0 else{return})
	4. Optionals 
		-> Many game logic variables use an optional type, allowing them to be nil until they are initialized by the game. ([[Player?]])
	5. Structs and Enums
		-> Used to handle game logic more easily. (Player enum, lineState enum, Struct linePosition)
	6. MVC Architecture
		-> Given
	7. View Controller Lifecycle
		-> various viewDidLoad() UI setups, various coding, and NSNotif
	8. NSNotification
		-> used to update background colors by button tap and without needing to reload a view controller (Base View Controller)
	9. Collection Types:
		-> dictionaries, arrays, and IBOutlet collections (boxLabels, defaultButtonImages)
	10. Alerts
		-> General settings has an end game button which sends a UIAlert and allows the player to end the game or turn back

o Description and references for new concepts
	
	Lazy Variables: A lazy variable waits to initialize until the first time it is used. This allows you to define more complex structures in a class that uses IBOutlets, and are useful when data relies on some outside variable. In my case, I needed class variables that would appear outside of viewDidLoad and contained IBOutlet variables. 
	https://docs.swift.org/swift-book/documentation/the-swift-programming-language/properties
	https://developer.apple.com/documentation/swift/array/lazy

	
	Singleton: Not a direct Swift concept, but (for Swift) a type of data type that allows you to pass data through view controllers or files without prepare(). A singleton in Swift is defined by creating a static variable of the class you're currently in. (Static let shared = GamesManager())
		https://docs.swift.org/swift-book/documentation/the-swift-programming-language/classesandstructures/


	CAGradientLayer: A "Core Animation" (CA) layer used to create smooth gradients for views. It uses startPoint and endPoint do define the gradient constraints, as well as using LayoutSubview to define bounds and layer conformation.
		https://developer.apple.com/documentation/uikit/uiview
		https://developer.apple.com/documentation/quartzcore/cagradientlayer
		https://developer.apple.com/documentation/quartzcore/calayer
		https://developer.apple.com/documentation/uikit/uiview/layoutsubviews()
		https://stackoverflow.com/questions/23074539/programmatically-create-a-uiview-with-color-gradient?
	

o Short setup or testing instructions

	Start Simulator 
	hit play, show tic tac toe
	finish tic tac toe and move to dots and boxes
	show some line placements and a box being created
	hit settings and go to color scheme
	change colors
	leave settings and show colors changed
	go back to settings and use go to button to speed test
	play through a round of speed test and let it go to End Game View Controller
	click exit
	hit play button
	go to settings and go to general
	click exit game
	DONE

o Proof your group used GitHub (show push/pull history or connected repository)
	
	Full Group Github: https://github.com/CSC-308-Group-8-Project-1
	Individual Github: https://github.com/Eli-Krouse/Group8-XVsO
