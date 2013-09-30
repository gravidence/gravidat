function map(doc) {
    if (doc.id == doc.variation_info.primary_variation_id) {
        emit(doc.id, null);
    }
}
