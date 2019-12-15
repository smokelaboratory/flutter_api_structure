class Observable<T> {
  T _value;
  Function(T) _onValueChanged;

  void observe(Function(T) onValueChanged) {
    this._onValueChanged = onValueChanged;
  }

  void setValue(T changedValue) {
    if (changedValue != null) {
      _value = changedValue;
      _onValueChanged(_value);
    }
  }
}