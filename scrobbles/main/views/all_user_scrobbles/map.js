function map(doc) {
    emit([doc.user_id, doc.scrobble_start_datetime], doc.primary_track_id);
}
