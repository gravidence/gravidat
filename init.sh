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

#!/bin/sh
echo "Init Gravifon DB script"
echo "2013 Gravidence"

WORKING_DIR="$PWD"
LOCAL_DATABASE_INSTANCE="http://127.0.0.1:5984"

echo
read -p "Enter URL to Gravifon DB instance [ $LOCAL_DATABASE_INSTANCE ]: " dbInstance

if [ -z "$dbInstance" ];
    then dbInstance="$LOCAL_DATABASE_INSTANCE";
fi

for database in `find $WORKING_DIR/* -type d -prune -printf "%f\n"`
do
    echo
    echo "Initializing /$database database..."
    echo "-----------------------------------"
    echo

    for designDocument in `find $WORKING_DIR/$database/* -type d -prune -printf "%f\n"`
    do
        cd "$WORKING_DIR/$database/$designDocument"
        erica push $dbInstance/$database
    done
done

echo
echo "Finished."

