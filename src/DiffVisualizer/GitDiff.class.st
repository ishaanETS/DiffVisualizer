Class {
	#name : #GitDiff,
	#superclass : #Object,
	#instVars : [
		'plus_indexes',
		'minus_indexes',
		'filename'
	],
	#category : #DiffVisualizer
}

{ #category : #'instance creation' }
GitDiff class >> fromCSV: filename [
	^ filename asFileReference
		readStreamDo: [ :readStream |
			(NeoCSVReader on: readStream)
				skipHeader;
				recordClass: GitDiff;
				addField: #filename: ;
				addField: #plus_indexes: ;
				addField: #minus_indexes: ;
				upToEnd ].
	
]

{ #category : #accessing }
GitDiff >> additions [
	^plus_indexes size.
]

{ #category : #accessing }
GitDiff >> filename [
	^filename.
]

{ #category : #accessing }
GitDiff >> filename: temp [
	filename := temp.
]

{ #category : #initialization }
GitDiff >> initialize [
	super initialize.
	plus_indexes := #(1 4 7 10 11).
	minus_indexes := #(2 5 6).
	
]

{ #category : #accessing }
GitDiff >> minus_indexes [
	^minus_indexes
]

{ #category : #accessing }
GitDiff >> minus_indexes: temp [
	minus_indexes := temp.
]

{ #category : #accessing }
GitDiff >> plus_indexes [
	^plus_indexes
]

{ #category : #accessing }
GitDiff >> plus_indexes: temp [
	plus_indexes := temp.
]

{ #category : #accessing }
GitDiff >> subtractions [
	^minus_indexes size.
]
