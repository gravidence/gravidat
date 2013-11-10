function map(doc) {
    emit([doc.primary_track_id, doc.scrobble_start_datetime], doc.scrobble_duration);
}
