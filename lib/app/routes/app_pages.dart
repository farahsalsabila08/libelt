import 'package:get/get.dart';
import 'package:libelt/app/modules/ranking/bindings/ranking_binding.dart';
import 'package:libelt/app/modules/ranking/views/ranking_view.dart';
import 'package:libelt/app/modules/splash/views/splash_view.dart';
import 'package:libelt/app/modules/splash/bindings/splash_binding.dart';
import 'package:libelt/app/modules/home/views/home_view.dart';
import 'package:libelt/app/modules/home/bindings/home_binding.dart';
import 'package:libelt/app/modules/onboarding/views/onboarding_view.dart';
import 'package:libelt/app/modules/onboarding/bindings/onboarding_binding.dart';
import 'package:libelt/app/modules/auth/views/login_view.dart';
import 'package:libelt/app/modules/auth/views/register_view.dart';
import 'package:libelt/app/modules/auth/views/forgot_password_view.dart';
import 'package:libelt/app/modules/auth/views/verify_code_view.dart';
import 'package:libelt/app/modules/auth/views/reset_password_view.dart';
import 'package:libelt/app/modules/auth/bindings/auth_binding.dart';
import 'package:libelt/app/modules/profile/views/complete_profile_view.dart';
import 'package:libelt/app/modules/profile/bindings/complete_profile_binding.dart';
import 'package:libelt/app/modules/materi/views/materi_view.dart';
import 'package:libelt/app/modules/materi/bindings/materi_binding.dart';
import 'package:libelt/app/modules/ranking/bindings/ranking_binding.dart';
import 'package:libelt/app/modules/ranking/views/ranking_view.dart';
import 'package:libelt/app/modules/search/views/search_view.dart';
import 'package:libelt/app/modules/search/bindings/search_binding.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.onboarding,
      page: () => OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => const RegisterView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.forgot,
      page: () => const ForgotPasswordView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.verify,
      page: () => const VerifyCodeView(),
    ),
    GetPage(
      name: AppRoutes.resetPassword,
      page: () => const ResetPasswordView(),
    ),
    GetPage(
      name: AppRoutes.completeProfile,
      page: () => const CompleteProfileView(),
      binding: CompleteProfileBinding(),
    ),
    GetPage(
  name: AppRoutes.materi,
  page: () => const MateriView(),
  binding: MateriBinding(),
),
GetPage(
  name: AppRoutes.search,
  page: () => const SearchView(),
  binding: SearchBinding(),
),
GetPage(
  name: AppRoutes.ranking,
  page: () => const RankingView(),
  binding: RankingBinding(),
),
  ];
}
