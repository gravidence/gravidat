function map(doc) {
    if (doc.username) {
        emit(doc.username.toLowerCase(), null);
    }
}