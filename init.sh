# The MIT License
#
# Copyright 2013 Gravidence.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

#!/bin/bash
echo "Init Gravifon DB script"
echo "2013 Gravidence"

echo
read -p "Enter URL to Gravifon DB instance: " dbInstance

if [ -z "$dbInstance" ];
    then dbInstance="http://localhost:5984";
fi

databasesDirName="databases"
designDocumentsDirName="designs"

for database in $(find ./$databasesDirName -mindepth 1 -maxdepth 1 -type d -printf "%f\n");
do
    echo
    echo "Creating /$database database..."
    curl -X PUT $dbInstance/$database

    for designDocument in $(find -path ./$databasesDirName/$database/$designDocumentsDirName/* -type f -name *.json -printf "%f\n" | sed 's/\.json//');
    do
        echo
        echo "Creating /$database/_design/$designDocument design document..."
        curl -X PUT $dbInstance/$database/_design/$designDocument -d @./$databasesDirName/$database/$designDocumentsDirName/$designDocument.json
    done
done

echo
echo "Finished."

