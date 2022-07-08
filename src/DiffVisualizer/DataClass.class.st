Class {
	#name : #DataClass,
	#superclass : #Object,
	#instVars : [
		'plus_indexes',
		'minus_indexes',
		'filename'
	],
	#category : #DiffVisualizer
}

{ #category : #'instance creation' }
DataClass class >> fromCSV: filename [
	^ filename asFileReference
		readStreamDo: [ :readStream |
			(NeoCSVReader on: readStream)
				skipHeader;
				recordClass: DataClass;
				addField: #filename: ;
				addField: #plus_indexes: ;
				addField: #minus_indexes: ;
				upToEnd ].
	
]

{ #category : #accessing }
DataClass >> additions [
	^plus_indexes size.
]

{ #category : #accessing }
DataClass >> filename [
	^filename.
]

{ #category : #accessing }
DataClass >> filename: temp [
	filename := temp.
]

{ #category : #initialization }
DataClass >> initialize [
	super initialize.
	plus_indexes := #(1 4 7 10 11).
	minus_indexes := #(2 5 6).
	
]

{ #category : #accessing }
DataClass >> minus_indexes [
	^minus_indexes
]

{ #category : #accessing }
DataClass >> minus_indexes: temp [
	minus_indexes := temp.
]

{ #category : #accessing }
DataClass >> plus_indexes [
	^plus_indexes
]

{ #category : #accessing }
DataClass >> plus_indexes: temp [
	plus_indexes := temp.
]

{ #category : #accessing }
DataClass >> subtractions [
	^minus_indexes size.
]
