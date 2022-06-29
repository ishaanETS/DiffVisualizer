Class {
	#name : #DataClassTest,
	#superclass : #TestCase,
	#category : #DiffVisualizer
}

{ #category : #test }
DataClassTest >> testAdditions [
	| temp |
	temp := DataClass new.
	temp plus_indexes: #(1 2 3) .
	self assert: temp additions equals: temp plus_indexes size.
]

{ #category : #test }
DataClassTest >> testSubtractions [
	
	| temp |
	temp := DataClass new.
	temp minus_indexes: #(0) .
	self assert: temp subtractions equals: temp minus_indexes size.
]
