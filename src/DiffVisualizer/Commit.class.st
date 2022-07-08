Class {
	#name : #Commit,
	#superclass : #Object,
	#category : #DiffVisualizer
}

{ #category : #'instance creation' }
Commit class >> fromCSV: filename [
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
