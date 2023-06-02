abstract class ServiceState {}

class ServiceInitialState extends ServiceState {}

class AllServiceLoadingState extends ServiceState {}

class AllServiceSuccessState extends ServiceState {}

class AllServiceErrorState extends ServiceState {}

class MealsLoadingState extends ServiceState {}

class MealsSuccessState extends ServiceState {}

class MealsErrorState extends ServiceState {}
