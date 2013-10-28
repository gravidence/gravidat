function map(doc) {
    emit(doc.title.toLowerCase(), null);
}
