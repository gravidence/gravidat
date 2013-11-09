function map(doc) {
    emit(doc.scrobble_start_datetime, doc.primary_track_id);
}
