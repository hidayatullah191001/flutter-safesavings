import 'dart:async';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:d_info/d_info.dart';
import 'package:d_method/d_method.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_flushbar/flutter_flushbar.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:safesavings/blocs/auth/auth_bloc.dart';
import 'package:safesavings/blocs/transaction/transaction_bloc.dart';
import 'package:safesavings/config/configs.dart';
import 'package:safesavings/data/models/category_model.dart';
import 'package:safesavings/data/models/forms/sign_in_form_model.dart';
import 'package:safesavings/data/models/forms/sign_up_form_model.dart';
import 'package:safesavings/data/models/forms/transaction_form_model.dart';
import 'package:safesavings/data/models/transaction_model.dart';
import 'package:safesavings/data/models/user_model.dart';
import 'package:safesavings/presentation/widgets/widgets.dart';

import '../../blocs/category/category_bloc.dart';

part 'splash_page.dart';
part 'login_page.dart';
part 'register_page.dart';
part 'home_page.dart';
part 'pemasukan_page.dart';
part 'pengeluaran_page.dart';
part 'category_page.dart';
part 'main_page.dart';
part 'transaction_add_page.dart';
part 'transaction_all_page.dart';
