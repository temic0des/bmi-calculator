import '../../infrastructure/models/gender_model.dart';

String getGender(GenderEnum gender) {
  switch (gender) {
    case GenderEnum.female:
      return 'Female';
    case GenderEnum.male:
      return 'Male';
    default:
      return '';
  }
}
