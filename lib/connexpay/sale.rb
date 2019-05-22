# Sale
# Create sale

# The Sale transaction is used to charge a credit card. When running a sale you’re authorizing an amount on a credit card that 
# will make the settlement of that amount at the end of the day. The sale is just like running an AuthOnly and a Capture all together.

# This endpoint creates a sale.

# HTTP Request
# POST https://sandboxsalesapi.connexpay.com/api/v1/sales

# Headers
# Key Value
# Content-Type  "application/json"
# Authorization Token. Eg: "Bearer eHSN5rTBzqDozgAAlN1UlTMVuIT1zSiAZWCo6E..."

# Query Parameters
# Parameter Type  M/C/O Value
# DeviceGuid  string  Mandatory Device's Guid.
# Amount  decimal Mandatory Amount of the transaction. Min. amt.: $0.50
# SequenceNumber  string  Optional  Your transaction sequence number.
# OrderNumber string  Optional  Order Number. Max length = 20.
# SendReceipt boolean Optional  Default: true. Determines if receipt is emailed to the customer. If true, customer's email must be included in the Card.Customer.email parameter.
# RiskProcessingOnly  boolean Optional  Allowed values:
#                                         1. Set to true will only run risk validations.
#                                         2. Set to false will run risk validations and an authorization on the card. For this option a Processing Merchant account is required, contact ConnexPay support if any questions.
#                                         3. Set to NULL and your Merchant Level settings would apply. Please contact ConnexPay support for further information.
# StatementDescription  string  Optional  Merchant's name on customer receipt after settlement for this specific sale. Max length = 25.
# CustomerID  string  Optional  Any combination of numbers and letters you use to identify the customer.
# ConnexPayTransaction  object  Mandatory ConnexPay Transaction.
# RiskData  object  Mandatory Risk Data.
# Card  object  Mandatory Card.

# ConnexPayTransaction
# ExpectedPayments  integer Mandatory Expected Payments.

# RiskData
# Name  string  Optional  Customer's name.
# Gender  string  Optional  Customer's gender. "M" or "F".
# DateOfBirth string  Optional  Customer's date of birth.
# BillingPhoneNumber  string  Optional  Customer's billing phone number. Phone number up to 15 characters. Numbers and plus sign (+) allowed only.
# BillingAddress1 string  Optional  Customer's billing address1.
# BillingAddress2 string  Optional  Customer's billing address2.
# BillingCity string  Optional  Customer's billing city.
# BillingState  string  Optional  Customer's billing state.
# BillingPostalCode string  Optional  Customer's billing postal code.
# BillingCountryCode  string  Optional  Customer's billing country code.
# Email string  Optional  Customer's valid email address.
# ProductType string  Mandatory Generalized description of the item added passed as plain text.
# ProductDesc string  Optional  Attribute for a specific description of the item being purchased i.e. airline ticket.
# ProductItem string  Mandatory Typically the SKU for an item passed as plain text; this value should be free from any markup or Unicode values.
# ProductQuantity integer Optional  Quantity of the item being purchased.
# ProductPrice  integer Optional  Product price expressed in cents. Example: 42400.
# OrderNumber string  Optional  Order Number.
# SellerId  string  Optional  SellerId.
# FlightData  object  Optional  Flight Data.
# FlightPassengers  object[]  Optional  Flight Passengers. Array.
# CustomParameters  object[]  Optional  Custom Parameters. Array.

# FlightData
# Airline string  Optional  Name of Airline.
# DepartureAirport  string  Optional  Departure Airport Code.
# DepartureDate date  Optional  Departure date of flight. Formatted as YYYY-MM-DD or YYYY-MM-DD HH:MI:SS.
# DestinationAirport  string  Optional  Destination Airport Code.
# HoursToDeparture  string  Optional  Time in hours to flight departure.
# JourneyType string  Optional  Round Trip / One Way.
# Route string  Optional  Complete flight route.
# RouteByCountry  string  Optional  Complete flight route by country.

# FlightPassengers
# Country string  Optional  Country of origin of passenger.
# DateOfBirth date  Optional  DOB of first passenger.
# Id  string  Optional  Passport of first passenger.
# Name  string  Optional  Name of first passenger.

# CustomParameters
# Name  string  Optional  Custom Parameter's Name.
# Value string  Optional  Custom Parameter's Value.

# Card
# CardNumber  string  Mandatory Card number. Must be 16 characters. (example: 4532538795426624) or token (example: FfL7exC7Xe2y6624).
# CardHolderName  string  Optional  Cardholder's name.
# Cvv2  integer Optional  This is the three or four digit CVV code at the back side of the credit and debit card.
# ExpirationDate  date  Optional with Token Card's expiry date in the YYMM format.
# Customer  object  Optional  Customer.

# Customer
# FirstName string  Optional  Customer's first name.
# LastName  string  Optional  Customer's last name.
# Phone string  Optional  Customer's phone number. Phone number up to 15 characters. Numbers and plus sign (+) allowed only.
# City  string  Optional  Customer's city.
# State string  Optional  Customer's short name state. The ISO 3166-2 CA and US state or province code of a customer. Length = 2.
# Country string  Optional  Customer's country. The ISO country code of a customer’s country. Length = 2 or 3.
# Email string  Optional  Customer's valid email address.
# Address1  string  Optional  Customer's address.
# Address2  string  Optional  Customer's address line 2.
# Zip integer Optional  Customer's zipcode. Length = 5.
# DateOfBirth date  Optional  Customer's date of birth.
#                                         Allowed format:
#                                         YYYY-MM-DD.
#                                         For example: 2002-05-30
# DriverLicenseNumber integer Optional  Customer's driver license number.
# DriverLicenseState  string  Mandatory when DriverLicenseNumber is provided  Customer's driver license short name state. The ISO 3166-2 CA and US state or province code of a customer. Length = 2.
# SSN4  integer Mandatory when DOB is not submitted Customer's social security number.
#
# Response
# 201 code (created).

module Connexpay
  class Sale < Connexpay::Base


    def create_sale(token, query_params)
      begin
        response = HTTParty.post(end_point, {
                                headers: { "Content-Type" => "application/json", "Authorization" => token },
                                body: query_params })
        response.parsed_response
      rescue => exception
        { 'error' => exception.message }
      end
    end

    # mandatory params
    # DeviceGuid, Amount, ConnexPayTransaction, RiskData, Card,
    # ConnexPayTransaction: ExpectedPayments
    # RiskData: ProductType, ProductItem
    # Card: CardNumber
    # Customer: DriverLicenseNumber integer Optional  Customer's driver license number.
    #           DriverLicenseState  string  Mandatory when DriverLicenseNumber is provided  Customer's driver license short name state. The ISO 3166-2 CA and US state or province code of a customer. Length = 2.
    #           SSN4 Mandatory when DOB is not submitted Customer's social security number.

    def validate_query_params

    end

    private

    def live_url
      'https://salesapi.connexpay.com/api/v1/sales'
    end

    def test_url
      'https://sandboxsalesapi.connexpay.com/api/v1/sales'
    end
  end
end