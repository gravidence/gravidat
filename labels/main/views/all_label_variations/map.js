function map(doc) {
    emit(doc.name.toLowerCase(), null);
}
