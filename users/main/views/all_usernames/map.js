function map(doc) {
    emit(doc.username.toLowerCase(), null);
}
