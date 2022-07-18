Class {
	#name : #GitDiffTest,
	#superclass : #TestCase,
	#category : #DiffVisualizer
}

{ #category : #test }
GitDiffTest >> testAdditions [
	| temp |
	temp := GitDiff new.
	temp plus_indexes: #(1 2 3) .
	self assert: temp additions equals: temp plus_indexes size.
]

{ #category : #test }
GitDiffTest >> testSubtractions [
	
	| temp |
	temp := GitDiff new.
	temp minus_indexes: #(0) .
	self assert: temp subtractions equals: temp minus_indexes size.
]
