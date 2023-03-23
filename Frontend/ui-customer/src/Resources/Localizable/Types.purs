{-
 
  Copyright 2022-23, Juspay India Pvt Ltd
 
  This program is free software: you can redistribute it and/or modify it under the terms of the GNU Affero General Public License
 
  as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version. This program
 
  is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
 
  or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License for more details. You should have received a copy of
 
  the GNU Affero General Public License along with this program. If not, see <https://www.gnu.org/licenses/>.
-}

module Language.Types where

data STR =  DOWNLOAD_INVOICE
        | REPORT_AN_ISSUE
        | SUBMIT
        | TRIP_DETAILS_
        | VIEW_INVOICE
        | YOU_RATED
        | TOTAL_AMOUNT
        | AMOUNT_PAID 
        | DOWNLOAD_PDF
        | GST
        | INVOICE
        | TRIP_CHARGES
        | PROMOTION
        | SEND_EMAIL
        | YOU_CAN_DESCRIBE_THE_ISSUE_YOU_FACED_HERE
        | THANK_YOU_FOR_WRITING 
        | WE_HAVE_RECEIVED_YOUR_ISSUE 
        | GO_HOME_
        | ABOUT_APP_DESCRIPTION
        | CONTINUE
        | ENTER_YOUR_NAME
        | FULL_NAME
        | EMAIL
        | LOGO
        | TERMS_AND_CONDITIONS
        | ABOUT
        | PRIVACY_POLICY
        | SET_UP_YOUR_ACCOUNT
        | WELCOME_TO_NAMMA_YATRI
        | PLEASE_CHOOSE_YOUR_PREFERRED_LANGUAGE_TO_CONTINUE
        | WRITE_TO_US
        | NOTE
        | VISIT_MY_RIDES_SECTION_FOR_RIDE_SPECIFIC_COMPLAINTS
        | THANK_YOU_FOR_WRITING_TO_US
        | WE_HAVE_RECEIVED_YOUR_ISSUE_WELL_REACH_OUT_TO_YOU_IN_SOMETIME
        | GO_TO_HOME__
        | SUBJECT
        | YOUR_EMAIL_ID
        | DESCRIBE_YOUR_ISSUE
        | ENTER_MOBILE_NUMBER
        | BY_TAPPING_CONTINUE
        | TO_THE
        | ENTER_OTP
        | RESEND
        | ENTER_YOUR_MOBILE_NUMBER
        | LOGIN_USING_THE_OTP_SENT_TO
        | YOUR_RECENT_RIDE
        | VIEW_ALL_RIDES
        | ALL_TOPICS
        | FAQ
        | REPORT_AN_ISSUE_WITH_THIS_TRIP
        | GETTING_STARTED_AND_FAQS
        | FOR_OTHER_ISSUES_WRITE_TO_US
        | HELP_AND_SUPPORT
        | OUR_SUGGESTED_PRICE_FOR_THIS_TRIP_IS
        | DRIVERS_CAN_CHARGE_BETWEEN_THE_ABOVE_RANGE
        | HOW_THIS_WORKS
        | FINDING_RIDES_NEAR_YOU
        | CONFIRMING_THE_RIDE_FOR_YOU
        | CANCEL_SEARCH
        | YOUR_RIDE_IS_NOW_COMPLETE
        | PLEASE_PAY_THE_FINAL_AMOUNT_TO_THE_DRIVER_VIA_CASH
        | WHERE_TO
        | HOME
        | PICK_UP_LOCATION
        | REQUEST_RIDE
        | NAME
        | MOBILE_NUMBER_STR
        | PERSONAL_DETAILS
        | YOUR_RIDES
        | YOU_ARE_OFFLINE
        | CHECK_YOUR_INTERNET_CONNECTION_AND_TRY_AGAIN
        | TRY_AGAIN
        | THANK_YOUR_DRIVER
        | HOPE_YOUR_RIDE_WAS_HASSLE_FREE
        | HOW_WAS_YOUR_RIDE_WITH
        | GOT_IT_TELL_US_MORE
        | WRITE_A_COMMENT
        | UPDATE
        | LANGUAGE
        | OTP
        | PAYMENT_METHOD
        | PAYMENT_METHOD_STRING
        | CANCEL_RIDE
        | SUPPORT
        | PICKUP_AND_DROP
        | CANCELLED
        | HOW_THE_PRICING_WORKS
        | SELECT_AN_OFFER
        | CHOOSE_A_RIDE_AS_PER_YOUR_COMFORT
        | IT_SEEMS_TO_BE_A_VERY_BUSY_DAY
        | SORT_BY
        | SORRY_WE_COULDNT_FIND_ANY_RIDES
        | LOAD_MORE
        | WE_NEED_ACCESS_TO_YOUR_LOCATION
        | YOUR_LOCATION_HELPS_OUR_SYSTEM
        | CALL
        | EMPTY_RIDES
        | YOU_HAVENT_TAKEN_A_TRIP_YET
        | BOOK_NOW
        | T_AND_C_A
        | DATA_COLLECTION_AUTHORITY
        | SOFTWARE_LICENSE
        | DENY_ACCESS
        | PLEASE_TELL_US_WHY_YOU_WANT_TO_CANCEL
        | MANDATORY
        | LOGOUT_
        | REQUEST_AUTO_RIDE
        | RATE_YOUR_RIDE
        | SKIP
        | ERROR_404
        | PROBLEM_AT_OUR_END
        | NOTIFY_ME
        | ADDRESS
        | CHANGE
        | SAVE_AS
        | ADD_TAG
        | WORK
        | OTHER
        | SAVE 
        | ADD_NEW_ADDRESS
        | SAVED_ADDRESSES
        | ADDRESSES
        | NO_FAVOURITES_SAVED_YET
        | EMERGENCY_CONTACTS
        | NO_EMERGENCY_CONTACTS_SET
        | EMERGENCY_CONTACTS_SCREEN_DESCRIPTION
        | ADD_EMERGENCY_CONTACTS
        | SAVED_ADDRESS_HELPS_YOU_KEEP_YOUR_FAVOURITE_PLACES_HANDY
        | COPIED
        | TRIP_ID
        | SAVE_PLACE
        | RIDE_FARE
        | ASK_FOR_PRICE
        | ASK_FOR_PRICE_INFO
        | GET_ESTIMATE_FARE
        | SELECT_AN_OFFER_FROM_OUR_DRIVERS
        | SELECT_AN_OFFER_FROM_OUR_DRIVERS_INFO
        | PAY_THE_DRIVER
        | PAY_THE_DRIVER_INFO
        | PAY_THE_DRIVER_NOTE
        | UPDATE_PERSONAL_DETAILS
        | EDIT
        | DEL_ACCOUNT
        | ACCOUNT_DELETION_CONFIRMATION
        | REQUEST_SUBMITTED
        | WE_WILL_DELETE_YOUR_ACCOUNT
        | YES_DELETE_IT
        | REQUEST_TO_DELETE_ACCOUNT
        | CANCEL_STR
        | LOADING
        | PLEASE_WAIT_WHILE_IN_PROGRESS
        | SET_LOCATION_ON_MAP
        | CURRENT_LOCATION
        | I_AM_NOT_RECEIVING_ANY_RIDES
        | DELETE
        | ARE_YOU_SURE_YOU_WANT_TO_LOGOUT
        | ARE_YOU_SURE_YOU_WANT_TO_CANCEL
        | YOU_HAVE_RIDE_OFFERS_ARE_YOU_SURE_YOU_WANT_TO_CANCEL
        | GO_BACK_
        | REGISTER_USING_DIFFERENT_NUMBER
        | YES
        | NO
        | CANCEL_
        | IS_ON_THE_WAY
        | ENTER_4_DIGIT_OTP
        | WRONG_OTP
        | GRANT_ACCESS
        | ENTER_A_LOCATION
        | NEARBY
        | MINS_AWAY
        | PAID
        | BY_CASH
        | ONLINE_
        | USER
        | EMAIL_ALREADY_EXISTS
        | IN
        | VERIFYING_OTP
        | TRACK_LIVE_LOCATION_USING
        | GOOGLE_MAP_
        | IN_APP_TRACKING
        | REQUEST_TIMED_OUT
        | LIMIT_EXCEEDED
        | ERROR_OCCURED
        | QUOTE_EXPIRED
        | GETTING_ESTIMATES_FOR_YOU
        | LET_TRY_THAT_AGAIN
        | CONFIRM_PICKUP_LOCATION
        | CONFIRM_DROP_LOCATION
        | NO_DRIVERS_AVAILABLE
        | ERROR_OCCURED_TRY_AGAIN
        | ERROR_OCCURED_TRY_AFTER_SOMETIME
        | ASKED_FOR_MORE_MONEY
        | START_
        | LIMIT_REACHED
        | RIDE_NOT_SERVICEABLE
        | CONFIRM_FOR
        | ETA_WAS_TOO_SHORT
        | DRIVER_REQUESTED_TO_CANCEL
        | PICK_UP_LOCATION_INCORRECT
        | COULD_NOT_CONNECT_TO_DRIVER
        | ETA_WAS_TOO_LONG
        | OTHERS
        | DESTINATION_OUTSIDE_LIMITS
        | DROP_LOCATION_FAR_AWAY
        | CHANGE_DROP_LOCATION
        | YOU_CAN_TAKE_A_WALK_OR_CONTINUE_WITH_RIDE_BOOKING
        | YOUR_TRIP_IS_TOO_SHORT_YOU_ARE_JUST
        | METERS_AWAY_FROM_YOUR_DESTINATION
        | BOOK_RIDE_
        | LOCATION_UNSERVICEABLE 
        | CURRENTLY_WE_ARE_LIVE_IN_
        | CHANGE_LOCATION 
        | IF_YOU_STILL_WANNA_BOOK_RIDE_CLICK_CONTINUE_AND_START_BOOKING_THE_RIDE
        | THE_TRIP_IS_VERY_SHORT_AND_JUST_TAKE
        | STEPS_TO_COMPLETE
        | CANCEL_AUTO_ASSIGNING
        | AUTO_ACCEPTING_SELECTED_RIDE
        | HELP_US_WITH_YOUR_REASON
        | MAX_CHAR_LIMIT_REACHED
        | DRIVER_WAS_NOT_REACHABLE
        | SHOW_ALL_OPTIONS
        | EXPIRES_IN
        | PAY_DIRECTLY_TO_YOUR_DRIVER_USING_CASH_UPI
        | UPDATE_REQUIRED
        | PLEASE_UPDATE_APP_TO_CONTINUE_SERVICE
        | NOT_NOW 
        | OF
        | LOST_SOMETHING
        | TRY_CONNECTING_WITH_THE_DRIVER
        | CALL_DRIVER
        | NO_MORE_RIDES
        | CONTACT_SUPPORT
        | INVALID_MOBILE_NUMBER
        | CONFIRM_LOCATION
        | RIDE_COMPLETED
        | SUBMIT_FEEDBACK 
        | HOW_WAS_YOUR_RIDE_EXPERIENCE
        | DROP 
        | RATE_YOUR_RIDE_WITH
        | VIEW_BREAKDOWN
        | PAY_DRIVER_USING_CASH_OR_UPI
        | RATE_YOUR_DRIVER
        | MY_RIDES
        | RIDE_ID 
        | RIDE_DETAILS
        | SELECT_A_RIDE 
        | CONFIRM_RIDE_
        | YOU_CAN_CANCEL_RIDE
        | ESTIMATES_CHANGED
        | ESTIMATES_REVISED_TO
        | RATE_CARD 
        | NIGHT_TIME_CHARGES
        | MIN_FARE_UPTO
        | RATE_ABOVE_MIN_FARE
        | DRIVER_PICKUP_CHARGES
        | NOMINAL_FARE
        | DAY_TIMES_OF 
        | NIGHT_TIMES_OF
        | DAYTIME_CHARGES_APPLICABLE_AT_NIGHT
        | DAYTIME_CHARGES_APPLIED_AT_NIGHT
        | DRIVERS_MAY_QUOTE_EXTRA_TO_COVER_FOR_TRAFFIC
        | GOT_IT
        | DAY_TIME_CHARGES
        | SHARE_APP
        | AWAY_C
        | AWAY
        | AT_PICKUP
        | FARE_UPDATED
        | TOTAL_FARE_MAY_CHANGE_DUE_TO_CHANGE_IN_ROUTE
        | HELP_US_WITH_YOUR_FEEDBACK
        | WAIT_TIME      
        | FAVOURITES
        | ADD_FAVOURITE
        | ALL_FAVOURITES
        | REMOVE
        | SELECT_ON_MAP
        | FAVOURITE_LOCATION
        | EDIT_FAVOURITE
        | DRAG_THE_MAP
        | CHOOSE_ON_MAP
        | USE_CURRENT_LOCATION
        | FAVOURITE_YOUR_CURRENT_LOCATION
        | LOCATION
        | LOCATION_ALREADY_EXISTS_AS
        | GIVE_THIS_LOCATION_A_NAME
        | FAVOURITE
        | CONFIRM_AND_SAVE 
        | REMOVE_FAVOURITE
        | ARE_YOU_SURE_YOU_WANT_TO_REMOVE_FAVOURITE_
        | YES_REMOVE
        | ADD_NEW_FAVOURITE
        | SELECT_YOUR_DROP
        | FAVOURITE_REMOVED_SUCCESSFULLY
        | LOCATION_ALREADY_EXISTS
        | FAVOURITE_LIMIT_REACHED
        | LOCATION_ALREADY 
        | EXISTS_AS
        | FAVOURITE_ADDED_SUCCESSFULLY
        | FAVOURITE_UPDATED_SUCCESSFULLY
        | ALREADY_EXISTS
        | NAME_ALREADY_IN_USE
        | SELECT_FAVOURITE
        | CONFIRM_CHANGES
        | ADD_SAVED_LOCATION_FROM_SETTINGS
        | AT_DROP
        | EMERGENCY_HELP
        | CALL_POLICE
        | ALSO_SHARE_YOUR_RIDE_STATUS_AND_LOCATION
        | SHARE_RIDE_WITH_EMERGENCY_CONTACTS
        | DO_YOU_NEED_EMERGENCY_HELP 
        | CALL_SUPPORT
        | YOU_ARE_ABOUT_TO_CALL_NAMMA_YATRI_SUPPORT
        | YOU_ARE_ABOUT_TO_CALL_POLICE
        | DAIL_100
        | YOU_WILL_BE_ASKED_TO_SELECT_CONTACTS
        | AUTO_ASSIGN_A_RIDE
        | IS_WAITING_FOR_YOU
        | WAIT_TIME_TOO_LONG
        | GOT_ANOTHER_RIDE_ELSE_WHERE
        | DRIVER_WAS_RUDE 
        | MAYBE_LATER
        | YOUR_RIDE_HAS_STARTED
        | ENJOY_RIDING_WITH_US
        | VIEW_DETAILS
        | REPEAT_RIDE
        | FARE_WAS_HIGH
        | AUTO_ASSIGN_DRIVER
        | CHOOSE_BETWEEN_MULTIPLE_DRIVERS
        | CHOOSE_BETWEEN_MULTIPLE_RIDES
        | ENABLE_THIS_FEATURE_TO_CHOOSE_YOUR_RIDE
        | BOOKING_PREFERENCE
        | BASE_FARES
        | PICKUP_CHARGE
        | WAITING_CHARGE
        | TOTAL_PAID
        | NOMINAL_FARES
        | DRIVERS_CAN_CHARGE_AN_ADDITIONAL_FARE_UPTO
        | WAITING_CHARGE_DESCRIPTION
        | SUCCESSFUL_ONBOARD
        | HAVE_REFERRAL_CODE
        | REFEREAL_CODE_DISCRIPTION
        | SIX_DIGIT_REFERRAL_CODE
        | ABOUT_REFERRAL_PROGRAM
        | ABOUT_REFERRAL_PROGRAM_DISCRIPTION
        | REFERRAL_CODE_SUCCESSFULL
        | REFERRAL_CODE_APPLIED
        | HEY
        | YOU_CAN_GET_REFERRAL_CODE_FROM_DRIVER
        | INVALID_CODE_PLEASE_RE_ENTER
        | CONTACTS_SELECTED
        | SELECT_CONTACTS
        | CONFIRM_EMERGENCY_CONTACTS
        | MAXIMUM_CONTACTS_LIMIT_REACHED
        | ARE_YOU_SURE_YOU_WANT_TO_REMOVE_CONTACT
        | SEARCH_CONTACTS
        | SELECTED_CONTACT_IS_INVALID
        
type PLEASE_TELL_US_WHY_YOU_WANT_TO_CANCEL = String

type MANDATORY = String

type DOWNLOAD_INVOICE = String

type REPORT_AN_ISSUE = String

type SUBMIT = String

type VIEW_INVOICE = String

type YOU_RATED = String

type TOTAL_AMOUNT = String

type AMOUNT_PAID = String

type TRIP_DETAILS_ = String

type DOWNLOAD_PDF = String

type GST = String

type INVOICE = String

type TRIP_CHARGES = String

type PROMOTION = String

type SEND_EMAIL = String

type YOU_CAN_DESCRIBE_THE_ISSUE_YOU_FACED_HERE = String

type THANK_YOU_FOR_WRITING = String

type WE_HAVE_RECEIVED_YOUR_ISSUE = String
 
type GO_HOME_ = String

type LOGO = String

type ABOUT_APP_DESCRIPTION = String

type TERMS_AND_CONDITIONS = String

type ABOUT = String

type PRIVACY_POLICY = String

type SET_UP_YOUR_ACCOUNT = String

type CONTINUE  = String

type ENTER_YOUR_NAME = String

type FULL_NAME = String

type EMAIL = String

type WELCOME_TO_NAMMA_YATRI = String

type PLEASE_CHOOSE_YOUR_PREFERRED_LANGUAGE_TO_CONTINUE = String

type WRITE_TO_US = String

type NOTE = String

type VISIT_MY_RIDES_SECTION_FOR_RIDE_SPECIFIC_COMPLAINTS = String

type THANK_YOU_FOR_WRITING_TO_US = String

type WE_HAVE_RECEIVED_YOUR_ISSUE_WELL_REACH_OUT_TO_YOU_IN_SOMETIME = String

type GO_TO_HOME__ = String

type SUBJECT = String

type YOUR_EMAIL_ID = String

type DESCRIBE_YOUR_ISSUE = String

type ENTER_MOBILE_NUMBER = String

type BY_TAPPING_CONTINUE = String

type TO_THE = String

type ENTER_OTP = String

type RESEND = String

type ENTER_YOUR_MOBILE_NUMBER = String

type LOGIN_USING_THE_OTP_SENT_TO = String

type YOUR_RECENT_RIDE = String

type VIEW_ALL_RIDES = String

type ALL_TOPICS = String

type FAQ = String

type REPORT_AN_ISSUE_WITH_THIS_TRIP = String

type GETTING_STARTED_AND_FAQS = String

type FOR_OTHER_ISSUES_WRITE_TO_US = String

type HELP_AND_SUPPORT = String

type OUR_SUGGESTED_PRICE_FOR_THIS_TRIP_IS = String

type DRIVERS_CAN_CHARGE_BETWEEN_THE_ABOVE_RANGE = String

type HOW_THIS_WORKS = String

type FINDING_RIDES_NEAR_YOU = String

type CONFIRMING_THE_RIDE_FOR_YOU = String

type CANCEL_SEARCH = String

type YOUR_RIDE_IS_NOW_COMPLETE = String

type PLEASE_PAY_THE_FINAL_AMOUNT_TO_THE_DRIVER_VIA_CASH = String

type WHERE_TO = String

type HOME = String

type PICK_UP_LOCATION = String

type REQUEST_RIDE = String

type NAME = String

type MOBILE_NUMBER_STR = String

type PERSONAL_DETAILS = String

type YOUR_RIDES = String

type YOU_ARE_OFFLINE = String

type CHECK_YOUR_INTERNET_CONNECTION_AND_TRY_AGAIN = String

type TRY_AGAIN = String

type THANK_YOUR_DRIVER = String

type HOPE_YOUR_RIDE_WAS_HASSLE_FREE = String

type HOW_WAS_YOUR_RIDE_WITH = String

type GOT_IT_TELL_US_MORE = String

type WRITE_A_COMMENT = String

type UPDATE = String

type LANGUAGE = String

type OTP = String

type PAYMENT_METHOD = String

type PAYMENT_METHOD_STRING = String

type CANCEL_RIDE = String

type PICKUP_AND_DROP = String

type CANCELLED = String

type HOW_THE_PRICING_WORKS = String

type SELECT_AN_OFFER = String

type CHOOSE_A_RIDE_AS_PER_YOUR_COMFORT = String

type IT_SEEMS_TO_BE_A_VERY_BUSY_DAY = String

type SORRY_WE_COULDNT_FIND_ANY_RIDES = String

type LOAD_MORE = String

type WE_NEED_ACCESS_TO_YOUR_LOCATION = String

type YOUR_LOCATION_HELPS_OUR_SYSTEM = String

type CALL = String

type EMPTY_RIDES = String

type YOU_HAVENT_TAKEN_A_TRIP_YET = String

type BOOK_NOW = String

type T_AND_C_A = String

type DATA_COLLECTION_AUTHORITY = String
type SOFTWARE_LICENSE = String

type DENY_ACCESS = String

type LOGOUT = String

type REQUEST_AUTO_RIDE = String

type RATE_YOUR_RIDE = String

type SKIP = String

type ERROR_404 = String

type PROBLEM_AT_OUR_END = String

type NOTIFY_ME = String

type ADDRESS = String

type CHANGE = String

type SAVE_AS = String

type ADD_TAG = String

type WORK = String

type OTHER = String

type SAVE = String

type ADD_NEW_ADDRESS = String

type SAVED_ADDRESSES = String

type ADDRESSES = String

type NO_FAVOURITES_SAVED_YET = String
type EMERGENCY_CONTACTS = String

type ADD_EMERGENCY_CONTACTS = String

type NO_EMERGENCY_CONTACTS_SET = String

type EMERGENCY_CONTACTS_SCREEN_DESCRIPTION = String

type SAVED_ADDRESS_HELPS_YOU_KEEP_YOUR_FAVOURITE_PLACES_HANDY = String

type COPIED = String 

type TRIP_ID = String

type SAVE_PLACE = String

type RIDE_FARE = String
type ASK_FOR_PRICE = String

type ASK_FOR_PRICE_INFO = String

type GET_ESTIMATE_FARE = String

type SELECT_AN_OFFER_FROM_OUR_DRIVERS = String

type SELECT_AN_OFFER_FROM_OUR_DRIVERS_INFO = String

type PAY_THE_DRIVER = String

type PAY_THE_DRIVER_INFO = String

type PAY_THE_DRIVER_NOTE = String

type UPDATE_PERSONAL_DETAILS = String

type EDIT = String

type DEL_ACCOUNT = String

type ACCOUNT_DELETION_CONFIRMATION = String

type REQUEST_SUBMITTED = String 

type WE_WILL_DELETE_YOUR_ACCOUNT = String

type YES_DELETE_IT = String

type REQUEST_TO_DELETE_ACCOUNT = String

type CANCEL = String
type LOADING = String

type PLEASE_WAIT_WHILE_IN_PROGRESS = String

type SET_LOCATION_ON_MAP = String

type CURRENT_LOCATION = String

type I_AM_NOT_RECEIVING_ANY_RIDES = String

type DELETE = String

type ARE_YOU_SURE_YOU_WANT_TO_LOGOUT = String

type ARE_YOU_SURE_YOU_WANT_TO_CANCEL = String

type YOU_HAVE_RIDE_OFFERS_ARE_YOU_SURE_YOU_WANT_TO_CANCEL = String

type GO_BACK_ = String

type REGISTER_USING_DIFFERENT_NUMBER = String

type YES = String

type NO = String

type CANCEL_ = String

type IS_ON_THE_WAY = String

type ENTER_4_DIGIT_OTP = String

type WRONG_OTP = String

type GRANT_ACCESS = String

type ENTER_A_LOCATION = String

type NEARBY = String

type MINS_AWAY = String

type PAID = String

type BY_CASH = String

type ONLINE_ = String

type USER = String

type EMAIL_ALREADY_EXISTS = String

type IN = String

type VERIFYING_OTP = String

type TRACK_LIVE_LOCATION_USING = String

type GOOGLE_MAP_ = String

type IN_APP_TRACKING = String

type REQUEST_TIMED_OUT = String

type LIMIT_EXCEEDED = String

type ERROR_OCCURED = String

type QUOTE_EXPIRED = String

type GETTING_ESTIMATES_FOR_YOU = String

type CONFIRM_PICKUP_LOCATION = String

type CONFIRM_DROP_LOCATION = String

type NO_DRIVERS_AVAILABLE = String

type ERROR_OCCURED_TRY_AGAIN = String

type ERROR_OCCURED_TRY_AFTER_SOMETIME = String

type ASKED_FOR_MORE_MONEY = String

type START_ = String

type LIMIT_REACHED = String

type RIDE_NOT_SERVICEABLE = String

type CONFIRM_FOR = String

type ETA_WAS_TOO_SHORT = String

type DRIVER_REQUESTED_TO_CANCEL = String

type PICK_UP_LOCATION_INCORRECT = String

type COULD_NOT_CONNECT_TO_DRIVER = String

type ETA_WAS_TOO_LONG = String

type OTHERS = String

type DESTINATION_OUTSIDE_LIMITS = String 

type DROP_LOCATION_FAR_AWAY = String 

type CHANGE_DROP_LOCATION = String 

type YOU_CAN_TAKE_A_WALK_OR_CONTINUE_WITH_RIDE_BOOKING = String

type YOUR_TRIP_IS_TOO_SHORT_YOU_ARE_JUST = String

type METERS_AWAY_FROM_YOUR_DESTINATION = String

type BOOK_RIDE_ = String

type LOCATION_UNSERVICEABLE = String
        
type CURRENTLY_WE_ARE_LIVE_IN_ = String 

type CHANGE_LOCATION = String
type STEPS_TO_COMPLETE = String
type CANCEL_AUTO_ASSIGNING = String
type AUTO_ACCEPTING_SELECTED_RIDE = String
type HELP_US_WITH_YOUR_REASON = String 
type MAX_CHAR_LIMIT_REACHED = String
type DRIVER_WAS_NOT_REACHABLE = String  
type SHOW_ALL_OPTIONS = String
type EXPIRES_IN = String
type PAY_DIRECTLY_TO_YOUR_DRIVER_USING_CASH_UPI = String
type UPDATE_REQUIRED = String
type PLEASE_UPDATE_APP_TO_CONTINUE_SERVICE = String 
type NOT_NOW = String 
type OF = String
type LOST_SOMETHING = String
type TRY_CONNECTING_WITH_THE_DRIVER = String
type CALL_DRIVER = String
type NO_MORE_RIDES = String
type CONTACT_SUPPORT = String
type INVALID_MOBILE_NUMBER = String 
type CONFIRM_LOCATION = String 
type RIDE_COMPLETED = String 
type SUBMIT_FEEDBACK = String 
type HOW_WAS_YOUR_RIDE_EXPERIENCE = String 
type DROP = String
type RATE_YOUR_RIDE_WITH = String
type VIEW_BREAKDOWN = String
type PAY_DRIVER_USING_CASH_OR_UPI = String
type RATE_YOUR_DRIVER = String
type RIDE_ID = String 
type RIDE_DETAILS = String
type SELECT_A_RIDE = String
type CONFIRM_RIDE = String
type YOU_CAN_CANCEL_RIDE = String
type ESTIMATES_CHANGED = String
type ESTIMATES_REVISED_TO = String
type RATE_CARD = String
type NIGHT_TIME_CHARGES = String
type MIN_FARE_UPTO = String
type RATE_ABOVE_MIN_FARE = String
type DRIVER_PICKUP_CHARGES = String
type NOMINAL_FARE = String
type DAY_TIMES_OF = String
type DAYTIME_CHARGES_APPLICABLE_AT_NIGHT = String
type NIGHT_TIMES_OF = String
type DAYTIME_CHARGES_APPLIED_AT_NIGHT = String
type DRIVERS_MAY_QUOTE_EXTRA_TO_COVER_FOR_TRAFFIC = String
type GOT_IT = String
type DAY_TIME_CHARGES = String
type AWAY_C = String
type AWAY = String
type AT_PICKUP = String
type FARE_UPDATED = String
type TOTAL_FARE_MAY_CHANGE_DUE_TO_CHANGE_IN_ROUTE = String 
type AT_DROP = String
type EMERGENCY_HELP = String
type CALL_POLICE = String
type ALSO_SHARE_YOUR_RIDE_STATUS_AND_LOCATION = String
type SHARE_RIDE_WITH_EMERGENCY_CONTACTS = String
type DO_YOU_NEED_EMERGENCY_HELP  = String
type CALL_SUPPORT = String
type YOU_ARE_ABOUT_TO_CALL_NAMMA_YATRI_SUPPORT  = String
type YOU_ARE_ABOUT_TO_CALL_POLICE = String
type DAIL_100 = String
type HELP_US_WITH_YOUR_FEEDBACK = String
type WAIT_TIME = String
type FAVOURITES = String
type ADD_FAVOURITE = String
type ALL_FAVOURITES = String
type REMOVE = String 
type SELECT_ON_MAP = String
type FAVOURITE_LOCATION = String
type EDIT_FAVOURITE = String
type DRAG_THE_MAP = String
type CHOOSE_ON_MAP = String
type USE_CURRENT_LOCATION = String
type FAVOURITE_YOUR_CURRENT_LOCATION = String
type LOCATION = String
type LOCATION_ALREADY_EXISTS_AS = String
type GIVE_THIS_LOCATION_A_NAME = String 
type FAVOURITE = String
type CONFIRM_AND_SAVE = String
type REMOVE_FAVOURITE = String
type ARE_YOU_SURE_YOU_WANT_TO_REMOVE_FAVOURITE_ = String
type YES_REMOVE = String
type ADD_NEW_FAVOURITE = String
type SELECT_YOUR_DROP = String
type FAVOURITE_REMOVED_SUCCESSFULLY = String
type LOCATION_ALREADY_EXISTS = String
type FAVOURITE_LIMIT_REACHED = String
type LOCATION_ALREADY = String 
type EXISTS_AS = String
type FAVOURITE_ADDED_SUCCESSFULLY = String 
type FAVOURITE_UPDATED_SUCCESSFULLY = String
type ALREADY_EXISTS = String
type NAME_ALREADY_IN_USE = String
type SELECT_FAVOURITE = String
type CONFIRM_CHANGES = String
type ADD_SAVED_LOCATION_FROM_SETTINGS = String
type SHARE_APP = String
type YOU_WILL_BE_ASKED_TO_SELECT_CONTACTS = String
type AUTO_ASSIGN_A_RIDE = String
type IS_WAITING_FOR_YOU = String
type WAIT_TIME_TOO_LONG = String 
type GOT_ANOTHER_RIDE_ELSE_WHERE = String
type DRIVER_WAS_RUDE = String
type MAYBE_LATER = String
type YOUR_RIDE_HAS_STARTED = String
type ENJOY_RIDING_WITH_US = String
type VIEW_DETAILS = String
type REPEAT_RIDE = String
type FARE_WAS_HIGH = String
type AUTO_ASSIGN_DRIVER = String
type CHOOSE_BETWEEN_MULTIPLE_DRIVERS = String
type CHOOSE_BETWEEN_MULTIPLE_RIDES = String
type ENABLE_THIS_FEATURE_TO_CHOOSE_YOUR_RIDE = String
type BOOKING_PREFERENCE = String
type BASE_FARES = String
type TOTAL_PAID = String
type PICKUP_CHARGE = String
type WAITING_CHARGE = String
type NOMINAL_FARES = String
type DRIVERS_CAN_CHARGE_AN_ADDITIONAL_FARE_UPTO = String
type WAITING_CHARGE_DESCRIPTION = String

type SUCCESSFUL_ONBOARD = String

type HAVE_REFERRAL_CODE = String

type REFEREAL_CODE_DISCRIPTION = String

type SIX_DIGIT_REFERRAL_CODE = String

type ABOUT_REFERRAL_PROGRAM = String

type ABOUT_REFERRAL_PROGRAM_DISCRIPTION = String

type REFERRAL_CODE_SUCCESSFULL = String

type REFERRAL_CODE_APPLIED = String
type HEY = String
type YOU_CAN_GET_REFERRAL_CODE_FROM_DRIVER = String
type INVALID_CODE_PLEASE_RE_ENTER = String
type LET_TRY_THAT_AGAIN = String
type CONTACTS_SELECTED = String
type SELECT_CONTACTS = String
type CONFIRM_EMERGENCY_CONTACTS = String
type MAXIMUM_CONTACTS_LIMIT_REACHED = String
type ARE_YOU_SURE_YOU_WANT_TO_REMOVE_CONTACT = String
type SEARCH_CONTACTS = String
type SELECTED_CONTACT_IS_INVALID = String
