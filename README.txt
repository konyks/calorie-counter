README

******************************************************************************************

Created by: Serhiy Konyk

******************************************************************************************

Project Name: Calorie Counter App
Included:
#Calorie Couter Project
#Charts Project (Copyright 2015 Daniel Cohen Gindi & Philipp Jahoda)
	* https://github.com/danielgindi/ios-charts
	* Used for creating a chart on a home screen
#Backend is using Facebook service called Parse
	* https://parse.com/

******************************************************************************************
Features of Calorie Counter App: 
	* Sign In and Sign Up View
		* Forces user to comply with a basic requirements of a username and
		password

	* Forgot Password View
		* Parse sends out a reset email with a link to reset password page

	* Personal Information View
		* Captures basic information about a user for a later use in calculating
		BMR target calories for a day

	* Home View
		* Displays a username of a user
		* Displays a formula (Goal - Current = Remaining)
		* Remove calorie data button
		* Pie Chart the illustrates the formula in a visual way

	* Log View
		* Displays five buttons:
			Meal Types: Breakfast, Lunch, Dinner, Snacks:
			action to display Food/Calorie Table View 
			Add Button: action to display Food/Calorie Input View

	* Food/Calorie Input View
		* Displays a form to enter a food name, type, and calories

	* Food/Calorie Table View 
		* Displays food/calorie entries based on a Meal type button 
		type	

******************************************************************************************