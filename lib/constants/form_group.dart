import 'package:reactive_forms/reactive_forms.dart';
import 'constants.dart';

FormGroup formGroup = FormGroup({
  'Name': FormControl<String>(
    validators: [Validators.required],
  ),
  'Email': FormControl<String>(
    validators: [Validators.required, Validators.email],
  ),
  'Password': FormControl<String>(validators: [
    Validators.required,
    Validators.minLength(8),
    Validators.pattern(passwordRegx)
  ], touched: false),
  'PasswordAgain': FormControl<String>(),
  'DateOfBirth': FormControl<String>(
    validators: [Validators.required, _ageValidator],
  ),
  'Other': FormControl<String>(),
  'Agree': FormControl<bool>(
    value: false,
    validators: [Validators.requiredTrue],
  ),
}, validators: [
  Validators.mustMatch('Password', 'PasswordAgain')
]);
Map<String, dynamic>? _ageValidator(control) {
  final error = <String, dynamic>{
    'You must be at least 18 years old ': true,
  };
  final formControl = control as FormControl;
  var selectedDate = formControl.value;
  if (selectedDate != null) {
    var dateDifference = currenTDate.difference(DateTime.parse(selectedDate));
    if (dateDifference < const Duration(days: 6570)) {
      return error;
    }
  }

  return null;
}
