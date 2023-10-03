import 'package:budget_tracker/core/core.dart';

import '../../entities/account.dart';

abstract class GetAccountsStream extends NoParamsStreamUseCase<List<Account>> {}
