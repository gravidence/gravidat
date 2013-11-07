function map(doc) {
    emit(doc.email.toLowerCase(), null);
}
