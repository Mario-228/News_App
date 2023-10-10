abstract class AppNewsStates{}

class InitialApp extends AppNewsStates{}

class NavBarIndex extends AppNewsStates{}

class BusinessData extends AppNewsStates{}

class BusinessLoad extends AppNewsStates{}

class BusinessError extends AppNewsStates{
  final String error;
  BusinessError(this.error);
}

class SportData extends AppNewsStates{}

class SportLoad extends AppNewsStates{}

class SportError extends AppNewsStates{
  final String error;
  SportError(this.error);
}

class ScienceData extends AppNewsStates{}

class ScienceLoad extends AppNewsStates{}

class ScienceError extends AppNewsStates{
  final String error;
  ScienceError(this.error);
}

class ModeChange extends AppNewsStates{}
class GetModeChange extends AppNewsStates{}

class SearchData extends AppNewsStates{}
class SearchLoad extends AppNewsStates{}
class SearchError extends AppNewsStates{
  final String error;
  SearchError(this.error);
}