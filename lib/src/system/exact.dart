mixin Exact {
  Iterable<Object?> get properties;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Exact) return false;
    bool exact = true;
    for (var i = 0; i < properties.length; i++) {
      if (properties.elementAt(i) != other.properties.elementAt(i)) {
        exact = false;
        break;
      }
    }
    return exact;
  }

  @override
  int get hashCode {
    int hash = 0;
    for (var i = 0; i < properties.length; i++) {
      hash ^= properties.elementAt(i).hashCode;
    }
    return hash;
  }
}
