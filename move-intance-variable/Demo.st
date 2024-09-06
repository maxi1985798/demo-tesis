!classDefinition: #BankCustomerTest category: 'Demo-move01'!
TestCase subclass: #BankCustomerTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Demo-move01'!

!BankCustomerTest methodsFor: 'as yet unclassified' stamp: 'mc 9/3/2024 00:47:27'!
lapridaAddress

	^ Address street: 'Laprida' streetNumber: '123' city: 'Florida' postalCode: '1430'! !

!BankCustomerTest methodsFor: 'as yet unclassified' stamp: 'mc 9/3/2024 00:47:51'!
meloAddress

	^ Address street: 'Melo' streetNumber: '124' city: 'Florida' postalCode: '1430'! !

!BankCustomerTest methodsFor: 'as yet unclassified' stamp: 'mc 7/31/2024 02:33:46'!
micaelaFernandezCustomer

	^ BankCustomer 
		firstName: 'Micaela'
		lastName: 'Fernadez'
		dni: '28908736'
		cvu: '0000123456795'
		ccNumber: '1234567812345679'
		phone: '77779999'
		email: 'micaela@micaela.com'
		country: 'Argentina'
		livesAt: self meloAddress! !

!BankCustomerTest methodsFor: 'as yet unclassified' stamp: 'mc 7/31/2024 02:34:20'!
pedroFernandezCustomer

	^ BankCustomer 
		firstName: 'Pedro'
		lastName: 'Fernadez'
		dni: '28908735'
		cvu: '0000123456789'
		ccNumber: '1234567812345678'
		phone: '77778888'
		email: 'pedro@pedro.com'
		country: 'Argentina'
		livesAt: self lapridaAddress! !

!BankCustomerTest methodsFor: 'as yet unclassified' stamp: 'mc 8/16/2024 01:41:12'!
test01CanFindBankCustomerByDNI
	| aBankSystem result pedro |
	aBankSystem := BankSystem new.
	pedro := self pedroFernandezCustomer.
	aBankSystem addCustomer: pedro.
	
	result := aBankSystem findByDNI: '28908735'.
	
	self assert: result equals: pedro.
	! !

!BankCustomerTest methodsFor: 'as yet unclassified' stamp: 'mc 8/16/2024 01:39:54'!
test02CanFindBankCustomerByLastName
	| aBankSystem result pedro micaela |
	aBankSystem := BankSystem new.
	pedro := self pedroFernandezCustomer.
	micaela := self micaelaFernandezCustomer.
	aBankSystem addCustomer: pedro.
	aBankSystem addCustomer: micaela.
	
	result := aBankSystem findByLastName: 'Fernadez'.
	
	self assert: result size equals: 2.
	self assert: (result includes: pedro).
	self assert: (result includes: micaela).
	! !

!BankCustomerTest methodsFor: 'as yet unclassified' stamp: 'mc 8/16/2024 01:42:56'!
test03CanFindBankCustomerByCountry
	| aBankSystem result pedro micaela |
	aBankSystem := BankSystem new.
	pedro := self pedroFernandezCustomer.
	micaela := self micaelaFernandezCustomer.
	aBankSystem addCustomer: pedro.
	aBankSystem addCustomer: micaela.
	
	result := aBankSystem findByCountry: 'Argentina'.
	
	self assert: result size equals: 2.
	self assert: (result includes: pedro).
	self assert: (result includes: micaela).
	! !

!BankCustomerTest methodsFor: 'as yet unclassified' stamp: 'mc 9/3/2024 01:00:24'!
test04CanAskBankCustomerHomeAdressByDNI
	| aBankSystem result pedro |
	aBankSystem := BankSystem new.
	pedro := self pedroFernandezCustomer.
	aBankSystem addCustomer: pedro.
	
	result := aBankSystem findAdddressByDNI: '28908735'.
	
	self assert: result equals: 'home address: Laprida 123 Florida Argentina'.
	! !


!classDefinition: #Address category: 'Demo-move01'!
Object subclass: #Address
	instanceVariableNames: 'postalCode streetName cityName streetNumber'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Demo-move01'!

!Address methodsFor: 'initialization' stamp: 'mc 9/3/2024 00:50:21'!
initializeStreet: aStreetName streetNumber: aStreetNumber city: aCityName postalCode: aPostalCode 
	streetName := aStreetName.
	cityName := aCityName.
	postalCode := aPostalCode.
	streetNumber := aStreetNumber ! !


!Address methodsFor: 'accessing' stamp: 'mc 9/3/2024 00:50:52'!
cityName
	^cityName! !

!Address methodsFor: 'accessing' stamp: 'mc 9/3/2024 00:45:45'!
streetName
	^streetName! !

!Address methodsFor: 'accessing' stamp: 'mc 9/3/2024 00:46:02'!
streetNumber
	^streetNumber! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Address class' category: 'Demo-move01'!
Address class
	instanceVariableNames: ''!

!Address class methodsFor: 'instance creation' stamp: 'mc 9/3/2024 00:50:03'!
street: aStreetName streetNumber: streetNumber city: aCityName postalCode: aPostalCode 
	^self new initializeStreet: aStreetName streetNumber: streetNumber city: aCityName postalCode: aPostalCode ! !


!classDefinition: #BankCustomer category: 'Demo-move01'!
Object subclass: #BankCustomer
	instanceVariableNames: 'firstName lastName cvu ccNumber phone email country dni livesAt'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Demo-move01'!

!BankCustomer methodsFor: 'initialization' stamp: 'mc 8/26/2024 01:44:01'!
initializeFirstName: aFirstName lastName: aLastName dni: aDNI cvu: aCvu ccNumber: accNumber phone: aPhone email: anEmail country: aCountry livesAt: anAddress 
	livesAt := anAddress.
	firstName := aFirstName.
	lastName := aLastName.
	dni := aDNI.
	cvu := aCvu.
	ccNumber := accNumber.
	phone := aPhone.
	email := anEmail.
	country := aCountry.
	! !


!BankCustomer methodsFor: 'accessing' stamp: 'mc 7/29/2024 02:11:03'!
firstName
	^firstName! !

!BankCustomer methodsFor: 'accessing' stamp: 'mc 7/29/2024 02:11:36'!
hasDni: aDni
	^dni  = aDni ! !

!BankCustomer methodsFor: 'accessing' stamp: 'mc 7/31/2024 02:28:48'!
hasLastName: aLastName 
	^aLastName = lastName ! !

!BankCustomer methodsFor: 'accessing' stamp: 'mc 8/16/2024 01:45:33'!
livesOnCountry: aCountryName 
	^country = aCountryName! !


!BankCustomer methodsFor: 'as yet unclassified' stamp: 'mc 9/3/2024 00:57:47'!
homeAdress
	^'home address: ', livesAt streetName, ' ', livesAt streetNumber, ' ', livesAt cityName, ' ', country ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'BankCustomer class' category: 'Demo-move01'!
BankCustomer class
	instanceVariableNames: ''!

!BankCustomer class methodsFor: 'instance creation' stamp: 'mc 7/29/2024 02:00:29'!
firstName: aFirstName lastName: aLastName dni: aDNI cvu: aCvu ccNumber: accNumber phone: aPhone email: anEmail country: aCountry livesAt: anAddress 
	^self new 
		initializeFirstName: aFirstName
		lastName: aLastName
		dni: aDNI
		cvu: aCvu
		ccNumber: accNumber
		phone: aPhone
		email: anEmail
		country: aCountry
		livesAt: anAddress ! !


!classDefinition: #BankSystem category: 'Demo-move01'!
Object subclass: #BankSystem
	instanceVariableNames: 'bankCustomers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Demo-move01'!

!BankSystem methodsFor: 'associating' stamp: 'mc 7/29/2024 02:05:10'!
addCustomer: aBankCustomer 
	bankCustomers add: aBankCustomer ! !


!BankSystem methodsFor: 'accessing' stamp: 'mc 9/2/2024 23:50:07'!
findAdddressByDNI: aDni 
	^(self findByDNI: aDni) homeAdress.! !

!BankSystem methodsFor: 'accessing' stamp: 'mc 8/16/2024 01:45:09'!
findByCountry: aCountryName 
	^bankCustomers select: [ :aCustomer | aCustomer livesOnCountry: aCountryName ].! !

!BankSystem methodsFor: 'accessing' stamp: 'mc 7/29/2024 02:10:47'!
findByDNI: aDni
	^bankCustomers detect: [ :aBankCustomer | aBankCustomer hasDni: aDni ]! !

!BankSystem methodsFor: 'accessing' stamp: 'mc 7/31/2024 02:28:29'!
findByLastName: aLastName
	^bankCustomers select: [ :aBankCustomer | aBankCustomer hasLastName: aLastName ]! !


!BankSystem methodsFor: 'initialization' stamp: 'mc 7/29/2024 02:04:43'!
initialize
	bankCustomers := OrderedCollection new.! !
!classDefinition: #ClassA category: #'Demo-move02'!
Object subclass: #ClassA
	instanceVariableNames: 'objB instVarB'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Demo-move02'!

!ClassA methodsFor: 'as yet unclassified' stamp: 'mc 8/21/2024 01:13:28'!
initialize
	objB := ClassB new.
	instVarB := 10.! !

!ClassA methodsFor: 'as yet unclassified' stamp: 'mc 8/21/2024 01:14:11'!
instVarB_plus_one
	^instVarB + 1! !


!classDefinition: #ClassB category: #'Demo-move02'!
Object subclass: #ClassB
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Demo-move02'!

!ClassB methodsFor: 'as yet unclassified' stamp: 'mc 8/21/2024 01:05:24'!
instVarB
	^1! !
!classDefinition: #Car category: #'Demo-move03'!
Object subclass: #Car
	instanceVariableNames: 'engine starterMotor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Demo-move03'!

!Car methodsFor: 'as yet unclassified' stamp: 'mc 8/22/2024 01:57:18'!
startWithDefaultMotors
	starterMotor := StarterMotor new.
	engine := CarEngine new.
	starterMotor start.
	engine start.
	! !



!classDefinition: #CarEngine category: #'Demo-move03'!
Object subclass: #CarEngine
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Demo-move03'!

!CarEngine methodsFor: 'as yet unclassified' stamp: 'mc 8/22/2024 01:54:17'!
start
	! !


!classDefinition: #StarterMotor category: #'Demo-move03'!
Object subclass: #StarterMotor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Demo-move03'!

!StarterMotor methodsFor: 'as yet unclassified' stamp: 'mc 8/22/2024 01:48:08'!
start! !
