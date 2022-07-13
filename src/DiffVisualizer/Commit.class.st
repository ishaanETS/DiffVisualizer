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

{ #category : #'instance creation' }
Commit class >> loadMSE: filename [
	| mseFileRef mseStream mooseModel |
	mseFileRef := filename  asFileReference. "Generated by FamixMaker"
	mseStream := mseFileRef readStream.
	mseStream
		ifNotNil: [ 
			mooseModel := MooseModel importFromMSEStream: mseStream.
			mooseModel rootFolder: '/Users/ishaan/Documents/Pharo/images/Moose Suite 8.0 (old stable)/tmp/MooseEasyRepos/bethrobson__Head-First-Design-Patterns'.
			mooseModel install. "So it appears in the Panel"
			mseStream close. ]
		ifNil: [ self error: 'Could not load MSE file into Moose: ' , mseFileRef asString ].
	
]