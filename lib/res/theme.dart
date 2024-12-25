import 'package:flutter/material.dart';

import 'colors.dart';
import 'typography/typography.dart';

class CHatifyTheme {
  static ThemeData get lightMode => ThemeData(
        useMaterial3: false,
        brightness: Brightness.light,
        highlightColor: Colors.transparent,
        // splashFactory: Colors.transparent,
        colorScheme: ColorScheme.fromSeed(
          seedColor: ChatifyColors.primaryColor,
          primary: ChatifyColors.activeColor,
          secondary: const Color(0xFFD9D9D9),
          tertiary: ChatifyColors.primaryColor,
          surface: ChatifyColors.white,
          onSecondary: ChatifyColors.white,
          onSurface: ChatifyColors.primaryColor,
          surfaceVariant: ChatifyColors.surfaceVariantLight,
          onSurfaceVariant: ChatifyColors.onSurfaceVariantLight,
          surfaceContainerHighest: ChatifyColors.surfaceVariantLight,
          onBackground: ChatifyColors.greyLightColor,
        ),
        splashColor: Colors.transparent,
        primaryColor: ChatifyColors.primaryColor,
        scaffoldBackgroundColor: ChatifyColors.background,
        primarySwatch: ChatifyColors.vModelprimarySwatch,
        fontFamily: PreluraTypography1.primaryfontName,
        indicatorColor: ChatifyColors.primaryColor, //ChatifyColors.mainColor,
        dividerColor: ChatifyColors.divideColor,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: ChatifyColors.primaryColor,
          selectedItemColor: ChatifyColors.primaryColor,
        ),
        splashFactory: NoSplash.splashFactory,
        tabBarTheme: TabBarTheme(
          unselectedLabelColor: ChatifyColors.primaryColor.withOpacity(0.4),
          labelColor: Colors.black, //ChatifyColors.primaryColor,

          splashFactory: NoSplash.splashFactory,
        ),
        buttonTheme: ButtonThemeData(
          colorScheme: ColorScheme(
            brightness: Brightness.light,
            primary: ChatifyColors.activeColor,
            onPrimary: ChatifyColors.white,
            secondary: ChatifyColors.buttonBgColor,
            tertiary: ChatifyColors.white,
            onSecondary: ChatifyColors.primaryColorOld, //ChatifyColors.primaryColor,
            error: ChatifyColors.primaryColorOld, // ChatifyColors.primaryColor,
            onError: ChatifyColors.primaryColorOld, // ChatifyColors.primaryColor,
            surface: ChatifyColors.primaryColorOld, // ChatifyColors.primaryColor,
            onSurface: ChatifyColors.primaryColorOld, //ChatifyColors.primaryColor,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black, // ChatifyColors.primaryColor,
        ),
        appBarTheme: const AppBarTheme(backgroundColor: ChatifyColors.appBarBackgroundColor, elevation: 0),
        textTheme: const TextTheme(
                // displayLarge: PreluraTypography1.normalTextStyle,
                // displayMedium: PreluraTypography1.mediumTextStyle,
                // displaySmall: PreluraTypography1.smallTextStyle,
                // titleLarge: PreluraTypography1.normalTextStyle,
                // titleMedium: PreluraTypography1.normalTextStyle,
                // titleSmall: PreluraTypography1.normalTextStyle,
                // labelSmall: ThemeData.light().textTheme.labelSmall?.copyWith(
                //       color: Colors.black, // ChatifyColors.primaryColor,
                //       fontFamily: PreluraTypography1.primaryfontName,
                //     ),
                // labelMedium: ThemeData.light().textTheme.labelMedium?.copyWith(
                //       color: Colors.black, // ChatifyColors.primaryColor,
                //       fontFamily: PreluraTypography1.primaryfontName,
                //     ),
                // labelLarge: ThemeData.light().textTheme.labelLarge?.copyWith(
                //       color: Colors.black, // ChatifyColors.primaryColor,
                //       fontFamily: PreluraTypography1.primaryfontName,
                //     ),
                // // bodyLarge: PreluraTypography1.normalTextStyle,
                // // bodyMedium: PreluraTypography1.mediumTextStyle,
                // // bodySmall: PreluraTypography1.smallTextStyle,
                // bodyLarge: ThemeData.light().textTheme.bodyLarge?.copyWith(
                //       color: Colors.black, // ChatifyColors.primaryColor,
                //       fontFamily: PreluraTypography1.primaryfontName,
                //     ),
                // // ?.copyWith(color: Colors.amber),
                // bodyMedium: ThemeData.light().textTheme.bodyMedium?.copyWith(
                //       color: Colors.black, // ChatifyColors.primaryColor,
                //       fontFamily: PreluraTypography1.primaryfontName,
                //     ),
                // // ?.copyWith(color: Colors.amber),
                // bodySmall: ThemeData.light().textTheme.bodySmall?.copyWith(
                //       color: Colors.black, // ChatifyColors.primaryColor,
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
          fillColor: WidgetStatePropertyAll(ChatifyColors.primaryColor),
        ),
        chipTheme: ChipThemeData.fromDefaults(
          primaryColor: ChatifyColors.primaryColor,

          //Definitely needs updating but for now just keep brown as default
          secondaryColor: ChatifyColors.primaryColor,
          labelStyle: const TextStyle(
            color: ChatifyColors.primaryColor,
            fontFamily: PreluraTypography1.primaryfontName,
          ),
        ),
        bottomSheetTheme: ThemeData.dark().bottomSheetTheme.copyWith(
              backgroundColor: ChatifyColors.white,
            ),
        switchTheme: ThemeData.light().switchTheme.copyWith(
          trackColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
            if (states.contains(WidgetState.selected)) {
              return ChatifyColors.primaryColor;
            }
            if (states.contains(WidgetState.disabled)) {
              return ChatifyColors.primaryColor.withOpacity(0.3);
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
          fillColor: ChatifyColors.greyColor.withOpacity(0.2),
          filled: true,
          isDense: true,
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: ChatifyColors.primaryColor,
                width: 1,
              ),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: ChatifyColors.greyColor.withOpacity(0.4), width: 1.5), borderRadius: const BorderRadius.all(Radius.circular(10))),
          border: OutlineInputBorder(
              borderSide: BorderSide(
                color: ChatifyColors.buttonBgColor,
                width: 1.5,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: ChatifyColors.buttonBgColor, width: 0), borderRadius: const BorderRadius.all(Radius.circular(10))),
          focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: ChatifyColors.buttonBgColor, width: 0), borderRadius: const BorderRadius.all(Radius.circular(10))),
          errorBorder: OutlineInputBorder(borderSide: BorderSide(color: ChatifyColors.buttonBgColor, width: 0), borderRadius: const BorderRadius.all(Radius.circular(8))),
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
          seedColor: ChatifyColors.darkPrimaryColor,
          primary: ChatifyColors.activeColor,
          secondary: ChatifyColors.darkPrimaryColor,
          tertiary: ChatifyColors.blueColor9D,
          onSecondary: ChatifyColors.darkPrimaryColor,
          surface: ChatifyColors.darkScaffoldBackround,
          onSurface: ChatifyColors.darkOnSurfaceColor,
          surfaceVariant: ChatifyColors.surfaceVariantLight.withOpacity(0.2),
          surfaceContainerHighest: ChatifyColors.surfaceVariantLight.withOpacity(0.2),
          onSurfaceVariant: ChatifyColors.onSurfaceVariantLight.withOpacity(0.25),
        ),
        scaffoldBackgroundColor: ChatifyColors.darkScaffoldBackround,
        visualDensity: VisualDensity.adaptivePlatformDensity,

        dividerColor: ChatifyColors.darkOnSurfaceColor.withOpacity(0.1),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: ChatifyColors.white.withOpacity(.8),
          selectedItemColor: ChatifyColors.darkSecondaryButtonColor,
          unselectedItemColor: ChatifyColors.white.withOpacity(.5),
          unselectedIconTheme: IconThemeData(color: ChatifyColors.white.withOpacity(.5)),
          selectedIconTheme: const IconThemeData(color: ChatifyColors.darkSecondaryButtonColor),
        ),
        splashFactory: NoSplash.splashFactory,
        tabBarTheme: TabBarTheme(
          unselectedLabelColor: ChatifyColors.darkPrimaryColorWhite.withOpacity(.5),
          labelColor: ChatifyColors.white,
          // indicatorColor: ChatifyColors.darkSecondaryButtonColor,
          indicatorColor: ChatifyColors.white,
          splashFactory: NoSplash.splashFactory,
        ),
        primaryColor: ChatifyColors.darkPrimaryColorWhite,
        // primarySwatch: ChatifyColors.vModelprimarySwatch,
        indicatorColor: ChatifyColors.white,
        // fontFamily: PreluraDarkTheme.primaryfontName,
        switchTheme: ThemeData.light().switchTheme.copyWith(
          trackColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
            if (states.contains(WidgetState.selected)) {
              return ChatifyColors.primaryColor;
            }
            if (states.contains(WidgetState.disabled)) {
              return ChatifyColors.primaryColor.withOpacity(0.3);
            }
            return Colors.grey.withOpacity(.48);
          }),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: ChatifyColors.darkButtonColor,
          disabledColor: ChatifyColors.darkSecondaryButtonColor,
          colorScheme: ColorScheme(
            brightness: Brightness.dark,
            primary: ChatifyColors.darkButtonColor,
            onPrimary: ChatifyColors.white,
            // secondary: ChatifyColors.darkSecondaryButtonColor,
            secondary: ChatifyColors.greyColor.withOpacity(0.2),
            onSecondary: ChatifyColors.white,
            tertiary: ChatifyColors.darkSecondaryButtonColor,
            onTertiary: ChatifyColors.white,
            error: ChatifyColors.darkButtonColor,
            onError: ChatifyColors.darkButtonColor,
            surface: ChatifyColors.darkButtonColor,
            onSurface: ChatifyColors.darkButtonColor,
          ),
        ),
        textSelectionTheme: const TextSelectionThemeData(
          // cursorColor: Colors.yellow,
          selectionColor: ChatifyColors.darkSecondaryButtonColor,
          selectionHandleColor: ChatifyColors.darkSecondaryButtonColor,
        ),
        navigationBarTheme: NavigationBarThemeData(
            iconTheme: WidgetStateProperty.all(
          IconThemeData(
            color: ChatifyColors.white.withOpacity(.6),
          ),
        )),
        dialogTheme: const DialogTheme(
          backgroundColor: ChatifyColors.darkScaffoldBackround,
        ),
        appBarTheme: const AppBarTheme(backgroundColor: ChatifyColors.blackScaffoldBackround, elevation: 0),
        iconTheme: const IconThemeData(color: ChatifyColors.darkPrimaryColorWhite),
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
                //       color: ChatifyColors.darkOnPrimaryColor,
                //       fontFamily: PreluraDarkTheme.primaryfontName,
                //     ),
                // bodyMedium: ThemeData.dark().textTheme.bodyMedium?.copyWith(
                //       color: ChatifyColors.darkOnPrimaryColor,
                //       fontFamily: PreluraDarkTheme.primaryfontName,
                //     ),
                // bodySmall: ThemeData.dark().textTheme.bodySmall?.copyWith(
                //       color: ChatifyColors.darkOnPrimaryColor,
                //       fontFamily: PreluraDarkTheme.primaryfontName,
                //     ),
                )
            .apply(
          fontFamily: PreluraTypography1.primaryfontName,
          bodyColor: ChatifyColors.darkOnPrimaryColor,
          displayColor: ChatifyColors.darkOnPrimaryColor,
        ),
        cardTheme: ThemeData.dark().cardTheme.copyWith(
              // color: ChatifyColors.darkPrimaryColor,
              color: ChatifyColors.darkThemeCardColor,
              elevation: 5,
              // color: Colors.grey.withOpacity(0.1),
            ),
        bottomSheetTheme: ThemeData.dark().bottomSheetTheme.copyWith(
              backgroundColor: ChatifyColors.darkScaffoldBackround,
            ),
        chipTheme: ChipThemeData.fromDefaults(
          brightness: Brightness.dark,
          // primaryColor: ChatifyColors.darkSecondaryButtonColor,
          secondaryColor: ChatifyColors.darkSecondaryButtonColor,
          labelStyle: const TextStyle(
            color: ChatifyColors.darkSecondaryButtonColor,
            fontFamily: PreluraDarkTheme.primaryfontName,
          ),
        ),
        // switchTheme: ThemeData.dark().switchTheme.copyWith(
        //   trackColor:
        //       WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
        //     if (states.contains(WidgetState.selected)) {
        //       return ChatifyColors.darkSecondaryButtonColor;
        //     }
        //     if (states.contains(WidgetState.disabled)) {
        //       return ChatifyColors.darkSecondaryButtonColor.withOpacity(0.3);
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
          fillColor: ChatifyColors.greyColor.withOpacity(0.2),
          filled: true,
          isDense: true,
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: ChatifyColors.darkButtonColor,
                width: 1,
              ),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: ChatifyColors.greyColor.withOpacity(0.4), width: 1.5), borderRadius: const BorderRadius.all(Radius.circular(10))),
          border: OutlineInputBorder(
              borderSide: BorderSide(
                color: ChatifyColors.greyColor.withOpacity(0.2),
                width: 1.5,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: ChatifyColors.greyColor.withOpacity(0.2), width: 0), borderRadius: const BorderRadius.all(Radius.circular(10))),
          focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: ChatifyColors.greyColor.withOpacity(0.2), width: 0), borderRadius: const BorderRadius.all(Radius.circular(10))),
          errorBorder: OutlineInputBorder(borderSide: BorderSide(color: ChatifyColors.greyColor.withOpacity(0.2), width: 0), borderRadius: const BorderRadius.all(Radius.circular(8))),
        ),
      );

  static ThemeData get blackTheme => ThemeData.dark(
        useMaterial3: false,
      ).copyWith(
          brightness: Brightness.dark,
          splashColor: Colors.transparent,
          // colorScheme:
          // const ColorScheme.dark(primary: ChatifyColors.darkScaffoldBackround),
          colorScheme: ColorScheme.fromSeed(
            // seedColor: const Color.fromRGBO(55, 71, 79, 1),
            seedColor: ChatifyColors.darkPrimaryColor,
            primary: ChatifyColors.activeColor,
            onPrimary: ChatifyColors.primaryColor,

            secondary: ChatifyColors.white,
            tertiary: ChatifyColors.blueColor9D,
            onSecondary: ChatifyColors.darkPrimaryColor,
            surface: ChatifyColors.modalBgColorBlackMode,
            onSurface: ChatifyColors.darkOnSurfaceColor,
            surfaceVariant: ChatifyColors.surfaceVariantLight.withOpacity(0.2),
            surfaceContainerHighest: ChatifyColors.surfaceVariantLight.withOpacity(0.2),
            onSurfaceVariant: ChatifyColors.onSurfaceVariantLight.withOpacity(0.25),
          ),
          dialogTheme: const DialogTheme(
            backgroundColor: Color.fromARGB(255, 27, 27, 27),
          ),
          scaffoldBackgroundColor: ChatifyColors.darkScaffoldBackround,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          dividerColor: ChatifyColors.darkOnSurfaceColor.withOpacity(0.3),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: ChatifyColors.white.withOpacity(.8),
            selectedItemColor: ChatifyColors.white,
            unselectedItemColor: ChatifyColors.white.withOpacity(.5),
            unselectedIconTheme: IconThemeData(color: ChatifyColors.white.withOpacity(.5)),
            selectedIconTheme: const IconThemeData(color: ChatifyColors.darkSecondaryButtonColor),
          ),
          tabBarTheme: TabBarTheme(unselectedLabelColor: ChatifyColors.darkPrimaryColorWhite.withOpacity(.5), labelColor: ChatifyColors.grey, indicatorColor: ChatifyColors.white),
          primaryColor: ChatifyColors.darkPrimaryColorWhite,
          indicatorColor: ChatifyColors.white,
          buttonTheme: ButtonThemeData(
            buttonColor: ChatifyColors.blackButtonColor,
            disabledColor: ChatifyColors.darkSecondaryButtonColor,
            colorScheme: ColorScheme(
              brightness: Brightness.dark,
              primary: ChatifyColors.blackButtonColor,
              onPrimary: ChatifyColors.white,
              secondary: ChatifyColors.greyColor.withOpacity(0.2),
              onSecondary: ChatifyColors.white,
              tertiary: ChatifyColors.darkSecondaryButtonColor,
              onTertiary: ChatifyColors.white,
              error: ChatifyColors.blackButtonColor,
              onError: ChatifyColors.blackButtonColor,
              surface: ChatifyColors.blackButtonColor,
              onSurface: ChatifyColors.blackButtonColor,
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
            selectionColor: ChatifyColors.darkSecondaryButtonColor,
            selectionHandleColor: ChatifyColors.darkSecondaryButtonColor,
          ),
          navigationBarTheme: NavigationBarThemeData(
              iconTheme: WidgetStateProperty.all(
            IconThemeData(
              color: ChatifyColors.white.withOpacity(.6),
            ),
          )),
          appBarTheme: AppBarTheme(
            backgroundColor: ChatifyColors.blackUpdated,
            elevation: 0,
          ),
          iconTheme: const IconThemeData(color: ChatifyColors.darkPrimaryColorWhite),
          textTheme: TextTheme(
            displayLarge: PreluraDarkTheme.normalTextStyle,
            displayMedium: PreluraDarkTheme.mediumTextStyle,
            displaySmall: PreluraDarkTheme.smallTextStyle,
            titleLarge: PreluraDarkTheme.normalTextStyle,
            titleMedium: PreluraDarkTheme.normalTextStyle,
            titleSmall: PreluraDarkTheme.normalTextStyle,
            bodyLarge: ThemeData.dark().textTheme.bodyLarge?.copyWith(
                  color: ChatifyColors.darkOnPrimaryColor,
                  fontFamily: PreluraDarkTheme.primaryfontName,
                ),
            bodyMedium: ThemeData.dark().textTheme.bodyMedium?.copyWith(
                  color: ChatifyColors.darkOnPrimaryColor,
                  fontFamily: PreluraDarkTheme.primaryfontName,
                ),
            bodySmall: ThemeData.dark().textTheme.bodySmall?.copyWith(
                  color: ChatifyColors.darkOnPrimaryColor,
                  fontFamily: PreluraDarkTheme.primaryfontName,
                ),
          ),
          cardTheme: CardTheme(
            color: ChatifyColors.blackCardColor,
            surfaceTintColor: ChatifyColors.blackCardColor,
            elevation: 5,
          ),
          bottomSheetTheme: ThemeData.dark().bottomSheetTheme.copyWith(
                backgroundColor: ChatifyColors.modalBgColorBlackMode,
              ),
          chipTheme: ChipThemeData.fromDefaults(
            brightness: Brightness.dark,
            secondaryColor: ChatifyColors.darkSecondaryButtonColor,
            labelStyle: const TextStyle(
              color: ChatifyColors.darkSecondaryButtonColor,
              fontFamily: PreluraTypography1.primaryfontName,
            ),
          ),
          switchTheme: ThemeData.dark().switchTheme.copyWith(
            trackColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
              if (states.contains(WidgetState.selected)) {
                return ChatifyColors.darkSecondaryButtonColor;
              }
              if (states.contains(WidgetState.disabled)) {
                return ChatifyColors.darkSecondaryButtonColor.withOpacity(0.3);
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
            fillColor: ChatifyColors.greyColor.withOpacity(0.2),
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
