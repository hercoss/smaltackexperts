"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	name:		<Object>
	position:		<Object>


    Implementation Points
"
Class {
	#name : #Player,
	#superclass : #Object,
	#instVars : [
		'name',
		'position',
		'lapsCompleted'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
Player class >> withName: aName [
	^ self new initializeWithName: aName.
]

{ #category : #initialization }
Player >> initializeWithName: aName [
	name:= aName.
	position := 1.
	lapsCompleted := 0.
]

{ #category : #accessing }
Player >> lapsCompleted [
	^ lapsCompleted.
]

{ #category : #update }
Player >> moveBackward: aNumberOfSlots on: aBoard [
	position := position - aNumberOfSlots.
	position > 0
		ifFalse: [ lapsCompleted := lapsCompleted - 1.
			position := position + aBoard numberOfSlots ].
]

{ #category : #update }
Player >> moveForward: aNumberOfSlots on: aBoard [
	position := position + aNumberOfSlots.
	position >= aBoard numberOfSlots
		ifTrue: [ 
			lapsCompleted := lapsCompleted + position // (aBoard numberOfSlots).
			position > aBoard numberOfSlots
				ifTrue: [ 
					position := position rem: (aBoard numberOfSlots).
					 ]
			 ]
]

{ #category : #update }
Player >> moveToFirstPosition [
	position := 1.
]

{ #category : #accessing }
Player >> name [
	^ name.
]

{ #category : #accessing }
Player >> position [
	^ position.
]

{ #category : #update }
Player >> rollDices: dices on: aBoard [
	self
		moveForward: (dices sumNumbers: [ :each | each rollDice ])
		on: aBoard
]