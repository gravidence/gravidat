Gravidat
========

## Overview
CouchDB initialization scripts and [Erica design documents](https://github.com/benoitc/erica#1--about-the-design-doc) for Gravifon service.

Basically, Erica is CouchApp management tool, so it might be useful to familiarize with CouchApp basics at http://couchapp.org.

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

Each Gravifon database setup is stored in separate folder. Database has several design documents which are stored in separate subfolders as well. Design document folder content is just an [Erica design document](https://github.com/benoitc/erica#1--about-the-design-doc) project.

Ref: [CouchApp filesystem mapping](http://couchapp.org/page/filesystem-mapping).

#### Manual way
Navigate to particular design document folder and execute `erica push http://<host>:<port>/<database>` command.

Alternatively, default CouchDB instance URL could be stored in `.couchapprc` file of particular design document project.

	{
	    "env": {
	        "default": {
	            "db": "http://<host>:<port>/<database>"
	        }
	    }
	}

This way, `erica push` command execution would be enough.

Ref: [CouchApp configuration](http://couchapp.org/page/couchapp-config).

#### Semi-automated way
Execute `init.sh` script to initialize/update all databases by calling `erica push http://<host>:<port>/<database>` for each design document project found.  
Execute `purge.sh` script to completely delete all databases.

Both scripts ask for CouchDB instance URL (defaults to http://127.0.0.1:5984).
