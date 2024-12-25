import 'package:flutter/material.dart';

import 'colors.dart';
import 'typography/typography.dart';

class PreluraTheme {
  static ThemeData get lightMode => ThemeData(
        useMaterial3: false,
        brightness: Brightness.light,
        highlightColor: Colors.transparent,
        // splashFactory: Colors.transparent,
        colorScheme: ColorScheme.fromSeed(
          seedColor: PreluraColors.primaryColor,
          primary: PreluraColors.activeColor,
          secondary: const Color(0xFFD9D9D9),
          tertiary: PreluraColors.primaryColor,
          surface: PreluraColors.white,
          onSecondary: PreluraColors.white,
          onSurface: PreluraColors.primaryColor,
          surfaceVariant: PreluraColors.surfaceVariantLight,
          onSurfaceVariant: PreluraColors.onSurfaceVariantLight,
          surfaceContainerHighest: PreluraColors.surfaceVariantLight,
          onBackground: PreluraColors.greyLightColor,
        ),
        splashColor: Colors.transparent,
        primaryColor: PreluraColors.primaryColor,
        scaffoldBackgroundColor: PreluraColors.background,
        primarySwatch: PreluraColors.vModelprimarySwatch,
        fontFamily: PreluraTypography1.primaryfontName,
        indicatorColor: PreluraColors.primaryColor, //PreluraColors.mainColor,
        dividerColor: PreluraColors.divideColor,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: PreluraColors.primaryColor,
          selectedItemColor: PreluraColors.primaryColor,
        ),
        splashFactory: NoSplash.splashFactory,
        tabBarTheme: TabBarTheme(
          unselectedLabelColor: PreluraColors.primaryColor.withOpacity(0.4),
          labelColor: Colors.black, //PreluraColors.primaryColor,

          splashFactory: NoSplash.splashFactory,
        ),
        buttonTheme: ButtonThemeData(
          colorScheme: ColorScheme(
            brightness: Brightness.light,
            primary: PreluraColors.activeColor,
            onPrimary: PreluraColors.white,
            secondary: PreluraColors.buttonBgColor,
            tertiary: PreluraColors.white,
            onSecondary: PreluraColors.primaryColorOld, //PreluraColors.primaryColor,
            error: PreluraColors.primaryColorOld, // PreluraColors.primaryColor,
            onError: PreluraColors.primaryColorOld, // PreluraColors.primaryColor,
            surface: PreluraColors.primaryColorOld, // PreluraColors.primaryColor,
            onSurface: PreluraColors.primaryColorOld, //PreluraColors.primaryColor,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black, // PreluraColors.primaryColor,
        ),
        appBarTheme: const AppBarTheme(backgroundColor: PreluraColors.appBarBackgroundColor, elevation: 0),
        textTheme: const TextTheme(
                // displayLarge: PreluraTypography1.normalTextStyle,
                // displayMedium: PreluraTypography1.mediumTextStyle,
                // displaySmall: PreluraTypography1.smallTextStyle,
                // titleLarge: PreluraTypography1.normalTextStyle,
                // titleMedium: PreluraTypography1.normalTextStyle,
                // titleSmall: PreluraTypography1.normalTextStyle,
                // labelSmall: ThemeData.light().textTheme.labelSmall?.copyWith(
                //       color: Colors.black, // PreluraColors.primaryColor,
                //       fontFamily: PreluraTypography1.primaryfontName,
                //     ),
                // labelMedium: ThemeData.light().textTheme.labelMedium?.copyWith(
                //       color: Colors.black, // PreluraColors.primaryColor,
                //       fontFamily: PreluraTypography1.primaryfontName,
                //     ),
                // labelLarge: ThemeData.light().textTheme.labelLarge?.copyWith(
                //       color: Colors.black, // PreluraColors.primaryColor,
                //       fontFamily: PreluraTypography1.primaryfontName,
                //     ),
                // // bodyLarge: PreluraTypography1.normalTextStyle,
                // // bodyMedium: PreluraTypography1.mediumTextStyle,
                // // bodySmall: PreluraTypography1.smallTextStyle,
                // bodyLarge: ThemeData.light().textTheme.bodyLarge?.copyWith(
                //       color: Colors.black, // PreluraColors.primaryColor,
                //       fontFamily: PreluraTypography1.primaryfontName,
                //     ),
                // // ?.copyWith(color: Colors.amber),
                // bodyMedium: ThemeData.light().textTheme.bodyMedium?.copyWith(
                //       color: Colors.black, // PreluraColors.primaryColor,
                //       fontFamily: PreluraTypography1.primaryfontName,
                //     ),
                // // ?.copyWith(color: Colors.amber),
                // bodySmall: ThemeData.light().textTheme.bodySmall?.copyWith(
                //       color: Colors.black, // PreluraColors.primaryColor,
                //       fontSize: 10.sp,
                //       fontFamily: PreluraTypography1.primaryfontName,
                //     ),
                // ?.copyWith(color: Colors.amber),
                )
            .apply(
          fontFamily: PreluraTypography1.primaryfontName,
          bodyColor: Colors.black,
          displayColor: Colors.black,
        ),
        radioTheme: const RadioThemeData(
          fillColor: WidgetStatePropertyAll(PreluraColors.primaryColor),
        ),
        chipTheme: ChipThemeData.fromDefaults(
          primaryColor: PreluraColors.primaryColor,

          //Definitely needs updating but for now just keep brown as default
          secondaryColor: PreluraColors.primaryColor,
          labelStyle: const TextStyle(
            color: PreluraColors.primaryColor,
            fontFamily: PreluraTypography1.primaryfontName,
          ),
        ),
        bottomSheetTheme: ThemeData.dark().bottomSheetTheme.copyWith(
              backgroundColor: PreluraColors.white,
            ),
        switchTheme: ThemeData.light().switchTheme.copyWith(
          trackColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
            if (states.contains(WidgetState.selected)) {
              return PreluraColors.primaryColor;
            }
            if (states.contains(WidgetState.disabled)) {
              return PreluraColors.primaryColor.withOpacity(0.3);
            }
            return Colors.grey.withOpacity(.48);
          }),
        ),
        cardTheme: ThemeData.light().cardTheme.copyWith(
              shadowColor: Colors.black45,
              elevation: 5,
            ),
        pageTransitionsTheme: PageTransitionsTheme(
          builders: Map<TargetPlatform, PageTransitionsBuilder>.fromIterable(
            TargetPlatform.values,
            value: (dynamic _) => const ZoomPageTransitionsBuilder(),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          fillColor: PreluraColors.greyColor.withOpacity(0.2),
          filled: true,
          isDense: true,
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: PreluraColors.primaryColor,
                width: 1,
              ),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: PreluraColors.greyColor.withOpacity(0.4), width: 1.5), borderRadius: const BorderRadius.all(Radius.circular(10))),
          border: OutlineInputBorder(
              borderSide: BorderSide(
                color: PreluraColors.buttonBgColor,
                width: 1.5,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: PreluraColors.buttonBgColor, width: 0), borderRadius: const BorderRadius.all(Radius.circular(10))),
          focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: PreluraColors.buttonBgColor, width: 0), borderRadius: const BorderRadius.all(Radius.circular(10))),
          errorBorder: OutlineInputBorder(borderSide: BorderSide(color: PreluraColors.buttonBgColor, width: 0), borderRadius: const BorderRadius.all(Radius.circular(8))),
        ),
      );

  static ThemeData get darkTheme => ThemeData.dark(
        useMaterial3: false,
      ).copyWith(
        brightness: Brightness.dark,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        // splashFactory: Colors.transparent,
        colorScheme: ColorScheme.fromSeed(
          seedColor: PreluraColors.darkPrimaryColor,
          primary: PreluraColors.activeColor,
          secondary: PreluraColors.darkPrimaryColor,
          tertiary: PreluraColors.blueColor9D,
          onSecondary: PreluraColors.darkPrimaryColor,
          surface: PreluraColors.darkScaffoldBackround,
          onSurface: PreluraColors.darkOnSurfaceColor,
          surfaceVariant: PreluraColors.surfaceVariantLight.withOpacity(0.2),
          surfaceContainerHighest: PreluraColors.surfaceVariantLight.withOpacity(0.2),
          onSurfaceVariant: PreluraColors.onSurfaceVariantLight.withOpacity(0.25),
        ),
        scaffoldBackgroundColor: PreluraColors.darkScaffoldBackround,
        visualDensity: VisualDensity.adaptivePlatformDensity,

        dividerColor: PreluraColors.darkOnSurfaceColor.withOpacity(0.1),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: PreluraColors.white.withOpacity(.8),
          selectedItemColor: PreluraColors.darkSecondaryButtonColor,
          unselectedItemColor: PreluraColors.white.withOpacity(.5),
          unselectedIconTheme: IconThemeData(color: PreluraColors.white.withOpacity(.5)),
          selectedIconTheme: const IconThemeData(color: PreluraColors.darkSecondaryButtonColor),
        ),
        splashFactory: NoSplash.splashFactory,
        tabBarTheme: TabBarTheme(
          unselectedLabelColor: PreluraColors.darkPrimaryColorWhite.withOpacity(.5),
          labelColor: PreluraColors.white,
          // indicatorColor: PreluraColors.darkSecondaryButtonColor,
          indicatorColor: PreluraColors.white,
          splashFactory: NoSplash.splashFactory,
        ),
        primaryColor: PreluraColors.darkPrimaryColorWhite,
        // primarySwatch: PreluraColors.vModelprimarySwatch,
        indicatorColor: PreluraColors.white,
        // fontFamily: PreluraDarkTheme.primaryfontName,
        switchTheme: ThemeData.light().switchTheme.copyWith(
          trackColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
            if (states.contains(WidgetState.selected)) {
              return PreluraColors.primaryColor;
            }
            if (states.contains(WidgetState.disabled)) {
              return PreluraColors.primaryColor.withOpacity(0.3);
            }
            return Colors.grey.withOpacity(.48);
          }),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: PreluraColors.darkButtonColor,
          disabledColor: PreluraColors.darkSecondaryButtonColor,
          colorScheme: ColorScheme(
            brightness: Brightness.dark,
            primary: PreluraColors.darkButtonColor,
            onPrimary: PreluraColors.white,
            // secondary: PreluraColors.darkSecondaryButtonColor,
            secondary: PreluraColors.greyColor.withOpacity(0.2),
            onSecondary: PreluraColors.white,
            tertiary: PreluraColors.darkSecondaryButtonColor,
            onTertiary: PreluraColors.white,
            error: PreluraColors.darkButtonColor,
            onError: PreluraColors.darkButtonColor,
            surface: PreluraColors.darkButtonColor,
            onSurface: PreluraColors.darkButtonColor,
          ),
        ),
        textSelectionTheme: const TextSelectionThemeData(
          // cursorColor: Colors.yellow,
          selectionColor: PreluraColors.darkSecondaryButtonColor,
          selectionHandleColor: PreluraColors.darkSecondaryButtonColor,
        ),
        navigationBarTheme: NavigationBarThemeData(
            iconTheme: WidgetStateProperty.all(
          IconThemeData(
            color: PreluraColors.white.withOpacity(.6),
          ),
        )),
        dialogTheme: const DialogTheme(
          backgroundColor: PreluraColors.darkScaffoldBackround,
        ),
        appBarTheme: const AppBarTheme(backgroundColor: PreluraColors.blackScaffoldBackround, elevation: 0),
        iconTheme: const IconThemeData(color: PreluraColors.darkPrimaryColorWhite),
        textTheme: const TextTheme(
                // displayLarge: PreluraDarkTheme.normalTextStyle,
                // displayMedium: PreluraDarkTheme.mediumTextStyle,
                // displaySmall: PreluraDarkTheme.smallTextStyle,
                // titleLarge: PreluraDarkTheme.normalTextStyle,
                // titleMedium: PreluraDarkTheme.normalTextStyle,
                // titleSmall: PreluraDarkTheme.normalTextStyle,
                // bodyLarge: PreluraTypography1.normalTextStyle,
                // bodyMedium: PreluraDarkTheme.mediumTextStyle,
                // bodySmall: PreluraDarkTheme.smallTextStyle,
                // bodyLarge: ThemeData.dark().textTheme.bodyLarge?.copyWith(
                //       color: PreluraColors.darkOnPrimaryColor,
                //       fontFamily: PreluraDarkTheme.primaryfontName,
                //     ),
                // bodyMedium: ThemeData.dark().textTheme.bodyMedium?.copyWith(
                //       color: PreluraColors.darkOnPrimaryColor,
                //       fontFamily: PreluraDarkTheme.primaryfontName,
                //     ),
                // bodySmall: ThemeData.dark().textTheme.bodySmall?.copyWith(
                //       color: PreluraColors.darkOnPrimaryColor,
                //       fontFamily: PreluraDarkTheme.primaryfontName,
                //     ),
                )
            .apply(
          fontFamily: PreluraTypography1.primaryfontName,
          bodyColor: PreluraColors.darkOnPrimaryColor,
          displayColor: PreluraColors.darkOnPrimaryColor,
        ),
        cardTheme: ThemeData.dark().cardTheme.copyWith(
              // color: PreluraColors.darkPrimaryColor,
              color: PreluraColors.darkThemeCardColor,
              elevation: 5,
              // color: Colors.grey.withOpacity(0.1),
            ),
        bottomSheetTheme: ThemeData.dark().bottomSheetTheme.copyWith(
              backgroundColor: PreluraColors.darkScaffoldBackround,
            ),
        chipTheme: ChipThemeData.fromDefaults(
          brightness: Brightness.dark,
          // primaryColor: PreluraColors.darkSecondaryButtonColor,
          secondaryColor: PreluraColors.darkSecondaryButtonColor,
          labelStyle: const TextStyle(
            color: PreluraColors.darkSecondaryButtonColor,
            fontFamily: PreluraDarkTheme.primaryfontName,
          ),
        ),
        // switchTheme: ThemeData.dark().switchTheme.copyWith(
        //   trackColor:
        //       WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
        //     if (states.contains(WidgetState.selected)) {
        //       return PreluraColors.darkSecondaryButtonColor;
        //     }
        //     if (states.contains(WidgetState.disabled)) {
        //       return PreluraColors.darkSecondaryButtonColor.withOpacity(0.3);
        //     }
        //     return Colors.grey.withOpacity(.48);
        //   }),
        // ),
        pageTransitionsTheme: PageTransitionsTheme(
          builders: Map<TargetPlatform, PageTransitionsBuilder>.fromIterable(
            TargetPlatform.values,
            value: (dynamic _) => const ZoomPageTransitionsBuilder(),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          fillColor: PreluraColors.greyColor.withOpacity(0.2),
          filled: true,
          isDense: true,
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: PreluraColors.darkButtonColor,
                width: 1,
              ),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: PreluraColors.greyColor.withOpacity(0.4), width: 1.5), borderRadius: const BorderRadius.all(Radius.circular(10))),
          border: OutlineInputBorder(
              borderSide: BorderSide(
                color: PreluraColors.greyColor.withOpacity(0.2),
                width: 1.5,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: PreluraColors.greyColor.withOpacity(0.2), width: 0), borderRadius: const BorderRadius.all(Radius.circular(10))),
          focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: PreluraColors.greyColor.withOpacity(0.2), width: 0), borderRadius: const BorderRadius.all(Radius.circular(10))),
          errorBorder: OutlineInputBorder(borderSide: BorderSide(color: PreluraColors.greyColor.withOpacity(0.2), width: 0), borderRadius: const BorderRadius.all(Radius.circular(8))),
        ),
      );

  static ThemeData get blackTheme => ThemeData.dark(
        useMaterial3: false,
      ).copyWith(
          brightness: Brightness.dark,
          splashColor: Colors.transparent,
          // colorScheme:
          // const ColorScheme.dark(primary: PreluraColors.darkScaffoldBackround),
          colorScheme: ColorScheme.fromSeed(
            // seedColor: const Color.fromRGBO(55, 71, 79, 1),
            seedColor: PreluraColors.darkPrimaryColor,
            primary: PreluraColors.activeColor,
            onPrimary: PreluraColors.primaryColor,

            secondary: PreluraColors.white,
            tertiary: PreluraColors.blueColor9D,
            onSecondary: PreluraColors.darkPrimaryColor,
            surface: PreluraColors.modalBgColorBlackMode,
            onSurface: PreluraColors.darkOnSurfaceColor,
            surfaceVariant: PreluraColors.surfaceVariantLight.withOpacity(0.2),
            surfaceContainerHighest: PreluraColors.surfaceVariantLight.withOpacity(0.2),
            onSurfaceVariant: PreluraColors.onSurfaceVariantLight.withOpacity(0.25),
          ),
          dialogTheme: const DialogTheme(
            backgroundColor: Color.fromARGB(255, 27, 27, 27),
          ),
          scaffoldBackgroundColor: PreluraColors.darkScaffoldBackround,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          dividerColor: PreluraColors.darkOnSurfaceColor.withOpacity(0.3),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: PreluraColors.white.withOpacity(.8),
            selectedItemColor: PreluraColors.white,
            unselectedItemColor: PreluraColors.white.withOpacity(.5),
            unselectedIconTheme: IconThemeData(color: PreluraColors.white.withOpacity(.5)),
            selectedIconTheme: const IconThemeData(color: PreluraColors.darkSecondaryButtonColor),
          ),
          tabBarTheme: TabBarTheme(unselectedLabelColor: PreluraColors.darkPrimaryColorWhite.withOpacity(.5), labelColor: PreluraColors.grey, indicatorColor: PreluraColors.white),
          primaryColor: PreluraColors.darkPrimaryColorWhite,
          indicatorColor: PreluraColors.white,
          buttonTheme: ButtonThemeData(
            buttonColor: PreluraColors.blackButtonColor,
            disabledColor: PreluraColors.darkSecondaryButtonColor,
            colorScheme: ColorScheme(
              brightness: Brightness.dark,
              primary: PreluraColors.blackButtonColor,
              onPrimary: PreluraColors.white,
              secondary: PreluraColors.greyColor.withOpacity(0.2),
              onSecondary: PreluraColors.white,
              tertiary: PreluraColors.darkSecondaryButtonColor,
              onTertiary: PreluraColors.white,
              error: PreluraColors.blackButtonColor,
              onError: PreluraColors.blackButtonColor,
              surface: PreluraColors.blackButtonColor,
              onSurface: PreluraColors.blackButtonColor,
            ),
          ),
          timePickerTheme: const TimePickerThemeData(
            dialTextColor: Colors.white,
            dayPeriodTextColor: Colors.white,
            hourMinuteTextColor: Colors.white,
            cancelButtonStyle: ButtonStyle(foregroundColor: WidgetStatePropertyAll(Colors.white)),
            confirmButtonStyle: ButtonStyle(foregroundColor: WidgetStatePropertyAll(Colors.white)),
          ),
          textSelectionTheme: const TextSelectionThemeData(
            // cursorColor: Colors.yellow,
            selectionColor: PreluraColors.darkSecondaryButtonColor,
            selectionHandleColor: PreluraColors.darkSecondaryButtonColor,
          ),
          navigationBarTheme: NavigationBarThemeData(
              iconTheme: WidgetStateProperty.all(
            IconThemeData(
              color: PreluraColors.white.withOpacity(.6),
            ),
          )),
          appBarTheme: AppBarTheme(
            backgroundColor: PreluraColors.blackUpdated,
            elevation: 0,
          ),
          iconTheme: const IconThemeData(color: PreluraColors.darkPrimaryColorWhite),
          textTheme: TextTheme(
            displayLarge: PreluraDarkTheme.normalTextStyle,
            displayMedium: PreluraDarkTheme.mediumTextStyle,
            displaySmall: PreluraDarkTheme.smallTextStyle,
            titleLarge: PreluraDarkTheme.normalTextStyle,
            titleMedium: PreluraDarkTheme.normalTextStyle,
            titleSmall: PreluraDarkTheme.normalTextStyle,
            bodyLarge: ThemeData.dark().textTheme.bodyLarge?.copyWith(
                  color: PreluraColors.darkOnPrimaryColor,
                  fontFamily: PreluraDarkTheme.primaryfontName,
                ),
            bodyMedium: ThemeData.dark().textTheme.bodyMedium?.copyWith(
                  color: PreluraColors.darkOnPrimaryColor,
                  fontFamily: PreluraDarkTheme.primaryfontName,
                ),
            bodySmall: ThemeData.dark().textTheme.bodySmall?.copyWith(
                  color: PreluraColors.darkOnPrimaryColor,
                  fontFamily: PreluraDarkTheme.primaryfontName,
                ),
          ),
          cardTheme: CardTheme(
            color: PreluraColors.blackCardColor,
            surfaceTintColor: PreluraColors.blackCardColor,
            elevation: 5,
          ),
          bottomSheetTheme: ThemeData.dark().bottomSheetTheme.copyWith(
                backgroundColor: PreluraColors.modalBgColorBlackMode,
              ),
          chipTheme: ChipThemeData.fromDefaults(
            brightness: Brightness.dark,
            secondaryColor: PreluraColors.darkSecondaryButtonColor,
            labelStyle: const TextStyle(
              color: PreluraColors.darkSecondaryButtonColor,
              fontFamily: PreluraTypography1.primaryfontName,
            ),
          ),
          switchTheme: ThemeData.dark().switchTheme.copyWith(
            trackColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
              if (states.contains(WidgetState.selected)) {
                return PreluraColors.darkSecondaryButtonColor;
              }
              if (states.contains(WidgetState.disabled)) {
                return PreluraColors.darkSecondaryButtonColor.withOpacity(0.3);
              }
              return Colors.grey.withOpacity(.48);
            }),
          ),
          pageTransitionsTheme: PageTransitionsTheme(
            builders: Map<TargetPlatform, PageTransitionsBuilder>.fromIterable(
              TargetPlatform.values,
              value: (dynamic _) => const ZoomPageTransitionsBuilder(),
            ),
          ),
          progressIndicatorTheme: const ProgressIndicatorThemeData(
            color: Colors.white,
          ),
          inputDecorationTheme: InputDecorationTheme(
            fillColor: PreluraColors.greyColor.withOpacity(0.2),
            filled: true,
            isDense: true,
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 1,
                ),
                borderRadius: BorderRadius.all(Radius.circular(8))),
            disabledBorder: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
            border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
            enabledBorder: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
            focusedErrorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 1), borderRadius: BorderRadius.all(Radius.circular(10))),
            errorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 0), borderRadius: BorderRadius.all(Radius.circular(8))),
          ));
}
