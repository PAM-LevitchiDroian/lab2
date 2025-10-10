class Doctor {
  final String name;
  final String specialty;
  final String qualification;
  final double rating;
  final int yearsOfWork;
  final int numberOfPatients;
  final String imageAsset; 
  final bool isFavorite;

  const Doctor({
    required this.name,
    required this.specialty,
    required this.qualification,
    required this.rating,
    required this.yearsOfWork,
    required this.numberOfPatients,
    required this.imageAsset,
    this.isFavorite = false,
  });
}
