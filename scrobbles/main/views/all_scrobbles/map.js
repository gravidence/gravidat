function map(doc) {
    emit([doc.user_id, doc.scrobble_start_datetime], null);
}
