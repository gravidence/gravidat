function map(doc) {
    emit([doc.status,doc.last_activity_datetime], null);
}
