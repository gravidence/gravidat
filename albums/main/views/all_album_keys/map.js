function map(doc) {
    emit(doc.variation_info.key, null);
}
