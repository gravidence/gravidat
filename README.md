Gravidat
========

## Overview
CouchDB initialization scripts and design documents for Gravifon service.

## Requirements
- Erica 0.4 ([Github](https://github.com/benoitc/erica))

## How-To Use

#### Folder structure
	.
	├── init.sh
	├── purge.sh
	├── <database_name_1>
	│   └── <design_document_name_1>
	│       ├── .couchapprc
	│       ├── _attachments
	│       ├── _id
	│       ├── language
	│       ├── lists
	│       ├── shows
	│       └── views
	└── <database_name_2>
	    └── <design_document_name_2>
	        ├── .couchapprc
	        ├── _attachments
	        ├── _id
	        ├── language
	        ├── lists
	        ├── shows
	        └── views

Each Gravifon database setup is stored in separate folder. Database have several design documents which are stored in separate subfolders as well. Design document folder content is just an [Erica design document](https://github.com/benoitc/erica#1--about-the-design-doc) project.

#### Manual way
Navigate to particular design document folder and execute `erica push` command. CouchDB instance URL is specified in `.couchapprc` file.

#### Semi-automated way
Execute `init.sh` script to initialize/update all databases by calling `erica push` for every design document found.  
Execute `purge.sh` script to completely delete all databases.

Both scripts ask for CouchDB instance URL (defaults to http://127.0.0.1:5984).
