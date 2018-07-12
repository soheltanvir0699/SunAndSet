//
//  Constants.swift
//  SunAndSet
//
//  Created by User on 6/14/18.
//  Copyright © 2018 clueapps. All rights reserved.
//

import UIKit

class Constants: NSObject {
    struct Fonts {
        static let OpenSansBold = "OpenSans-Bold"
        static let OpenSansExtraBold = "OpenSans-ExtraBold"
        static let OpenSansLight = "OpenSans-Light"
        static let OpenSansRegular = "OpenSans-Regular"
        static let OpenSansSemiBold = "OpenSans-SemiBold"
        
    }
    struct Key {
        static let verificationId = "verificationId"
        static let deviceId = "deviceId"
        static let fcmToken = "fcmToken"
        static let userName = "userName"
        static let userMobile = "userMobile"
        static let userPassword = "userPassword"
        static let userCountryCode = "countryCode"
        static let userIsBlocked = "UserBlocked"
        static let userId = "userId"
        static let userEmail = "userEmail"
        static let userIsLogged = "isLogged"
        static let mobile_signUp = "mobile_signUp"
        static let token = "token"
        static let updatedUserMobile = "updatedUserMobile"
     
        
    }
    struct Urls {
        static let baseUrl = "http://sunandsat.mtech-ins.com/api/v1/"
        static let loginUrl = baseUrl + "login"
        static let signUpUrl = baseUrl + "signup"
        static let ForgetPassUrl = baseUrl + "forget"
        static let Addfavourite = baseUrl + "advertise/"
        static let getfavoriteByUserID = baseUrl + "users/favorite"
        static let socialLoginUrl = baseUrl + "auth/social"
         static let categories = baseUrl + "categories"
         static let SupCat = baseUrl + "category/"
         static let CatPro = baseUrl + "advertise"
        static let CreateAd = baseUrl + "advertise"
        static let AllCat = baseUrl + "category/0"
        static let AllOfferByCat = baseUrl + "offers/"
       // http://sunandsat.mtech-ins.com/api/v1/offers/4
    }
    struct StoryBoardViewControllersIDs {
        
        // for login Screens
        static let login = "LoginVC"
        static let RegisterVC = "RegisterVC"
        static let EditProfileVC = "EditProfileVC"
        static let ChangePasswordVC = "ChangePasswordVC"
        static let ForgetPassword = "ForgetPassword"
        static let verificationCode = "VerificationCodeVC"
        static let onBoarding = "OnBoardingVC"
        
        // for MainScreen screens
        static let SubcategoryVC = "SubcategoryVC"
        static let ProductVC = "ProductVC"
        static let DescripProVC = "DescripProVC"
        static let ListOffAdsUsersVC = "ListOffAdsUsersVC"
        static let NotLoginVC = "NotLoginVC"
        static let MainViewVC = "MainView"
        static let ChoosePhotoVC = "ChoosePhotoVC"
          static let DetailsCreateAdVC = "DetailsCreateAdVC"
        static let SeeMoreHotDealsTB = "SeeMoreHotDealsTB"
        static let SeeMorePopulerNowTB = "SeeMorePopulerNowTB"
        static let SeeMoreGroceriesTB = "SeeMoreGroceriesTB"
        static let SeeMoreNearByRestaurantsTB = "SeeMoreNearByRestaurantsTB"
        static let restaurantMenuProductVC = "RestaurantMenuProductVC"
        static let GroceryMenuProductVC = "GroceryMenuProductVC"
        static let restaurantOnMapVC = "RestaurantOnMapVC"
        static let SelectingCategTB = "SelectingCategTB"
        static let addReview = "AddReviewVC"
        // for popUps
        static let pickImagePopUp = "PickImagePopUpVC"
        static let resetPasswordPopUp = "ResetPasswordPopUpVC"
        static let selectCountryPopUp = "SelectCountryVC"
        static let ForceUpdateVC = "ForceUpdateVC"
        static let BlockScreenVC = "BlockScreenVC"
        static let DidUgetUrorderPopUp = "DidUgetUrorderPopUpVC"
        static let OrderArrivedPopUp = "OrderArrivedPopUpVC"
        static let RatingControllerPopUp = "RatingControllerPopup"
        static let ReportOrderPopUp = "ReportOrderPopUpVC"
        
        
        //Searching
        static let BrowsingTablesVC = "BrowsingTablesVC"
        static let BrowsingSearchResultsVC = "BrowsingSearchResultsVC"
        static let SearchSeeMoreCusinesTB = "SearchSeeMoreCusines"
        static let SearchSeeMoreRecentRestaurantsTB = "SearchSeeMoreRecentRestaurants"
        static let SearchSeeMoreAvailableTablesTB = "SearchSeeMoreAvailableTables"
        static let SearchSeeMoreFeaturedRestaurantsTB = "SearchSeeMoreFeaturedRestaurants"
        static let SearchSeeMorePopularNowTB = "SearchSeeMorePopularNow"
        static let ChangeBranchPopUpVC = "ChangeBranchPopUpVC"
        static let pickUpNotesForMenuProductPopUpVC = "PickUpNotesForMenuProductPopUpVC"
        //Orders
        static let TrackOrders = "TrakingOrders"
        
        // for MoreAndProfile
        static let editProfile = "EditProfileViewController"
        static let aboutSpoon = "AboutSpoonViewController"
        static let NotificationCenter = "NotificationCenterVC"
        static let Maps = "SelectLocationVC"
        static let WalletVC = "WalletVC"
        static let InviteFrined = "InviteFrinedVC"
        //Cart
        static let EmptyCartVC = "EmptyCartVC"
    }
    
    

}
