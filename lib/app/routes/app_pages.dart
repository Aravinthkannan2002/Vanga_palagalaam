import 'package:get/get.dart';

import '../modules/Todoapp/bindings/todoapp_binding.dart';
import '../modules/Todoapp/views/todoapp_view.dart';
import '../modules/about/bindings/about_binding.dart';
import '../modules/about/views/about_view.dart';
import '../modules/chat/bindings/chat_binding.dart';
import '../modules/chat/views/chat_view.dart';
import '../modules/chatbot/bindings/chatbot_binding.dart';
import '../modules/chatbot/views/chatbot_view.dart';
import '../modules/games/Tic-Tact-Toe-Game/bindings/games_tic_tact_toe_game_binding.dart';
import '../modules/games/Tic-Tact-Toe-Game/views/games_tic_tact_toe_game_view.dart';
import '../modules/games/bindings/games_binding.dart';
import '../modules/games/dino/bindings/games_dino_binding.dart';
import '../modules/games/dino/views/games_dino_view.dart';
import '../modules/games/quiz/bindings/games_quiz_binding.dart';
import '../modules/games/quiz/views/games_quiz_view.dart';
import '../modules/games/snakcobra/bindings/games_snakcobra_binding.dart';
import '../modules/games/snakcobra/views/games_snakcobra_view.dart';
import '../modules/games/views/games_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/onboardingscreen/bindings/onboardingscreen_binding.dart';
import '../modules/onboardingscreen/views/onboardingscreen_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';
import '../modules/splashscreen/bindings/splashscreen_binding.dart';
import '../modules/splashscreen/views/splashscreen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static var INITIAL = Routes.SPLASHSCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASHSCREEN,
      page: () => SplashscreenView(),
      binding: SplashscreenBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.CHATBOT,
      page: () => const ChatbotView(),
      binding: ChatbotBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDINGSCREEN,
      page: () => OnboardingscreenView(),
      binding: OnboardingscreenBinding(),
    ),
    GetPage(
      name: _Paths.GAMES,
      page: () => const GamesView(),
      binding: GamesBinding(),
      children: [
        GetPage(
          name: _Paths.GAMES_SNAKCOBRA,
          page: () => GamesSnakcobraView(),
          binding: GamesSnakcobraBinding(),
        ),
        GetPage(
          name: _Paths.GAMES_QUIZ,
          page: () => GamesQuizView(),
          binding: GamesQuizBinding(),
        ),
        GetPage(
          name: _Paths.GAMES_DINO,
          page: () => GamesDinoView(),
          binding: GamesDinoBinding(),
        ),
        GetPage(
          name: _Paths.GAMES_TIC_TACT_TOE_GAME,
          page: () => GamesTicTactToeGameView(),
          binding: GamesTicTactToeGameBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.CHAT,
      page: () => const ChatView(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: _Paths.ABOUT,
      page: () => const AboutView(),
      binding: AboutBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.TODOAPP,
      page: () => const TodoappView(),
      binding: TodoappBinding(),
    ),
  ];
}
