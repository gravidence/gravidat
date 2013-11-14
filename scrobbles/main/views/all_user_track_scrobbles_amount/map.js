function map(doc) {
    emit([doc.user_id, doc.primary_track_id, doc.scrobble_start_datetime], 1);
}
