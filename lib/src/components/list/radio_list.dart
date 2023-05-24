import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kyogojo_widgets/src/styles/design_system.dart';

enum AccountType { newAccount, existingAccount }

class RadioListView extends HookWidget {
  const RadioListView({Key? key, required this.onValueChanged})
      : super(key: key);

  final Function(AccountType) onValueChanged;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final listValue = useState(AccountType.newAccount);
    // final router = Routemaster.of(context);
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Select Account',
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: listValue.value == AccountType.newAccount
                      ? DesignSystem.foundation.primaryBackgroundA
                          .withOpacity(.3)
                      : null,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                      color: listValue.value == AccountType.newAccount
                          ? DesignSystem.foundation.primaryBackgroundA
                          : const Color(0XFFDEDEDE),
                      width: 1.5)),
              child: RadioListTile<AccountType>(
                activeColor: DesignSystem.foundation.primaryBackgroundA,
                title: Padding(
                  padding: const EdgeInsets.fromLTRB(2, 8, 8, 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'New Account',
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'Registration of application for new accounts',
                        style: TextStyle(
                            fontSize: 12.sp, fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
                value: AccountType.newAccount,
                groupValue: listValue.value,
                onChanged: (AccountType? value) {
                  onValueChanged(AccountType.newAccount);
                  listValue.value = AccountType.newAccount;
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: listValue.value == AccountType.existingAccount
                      ? DesignSystem.foundation.primaryBackgroundA
                          .withOpacity(.3)
                      : null,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                      color: listValue.value == AccountType.existingAccount
                          ? DesignSystem.foundation.primaryBackgroundA
                          : const Color(0XFFDEDEDE),
                      width: 1.5)),
              child: RadioListTile<AccountType>(
                activeColor: DesignSystem.foundation.primaryBackgroundA,
                title: Padding(
                  padding: const EdgeInsets.fromLTRB(2, 8, 8, 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Existing Account',
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'You may use your existing account for application of services',
                        style: TextStyle(
                            fontSize: 12.sp, fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
                value: AccountType.existingAccount,
                groupValue: listValue.value,
                onChanged: (AccountType? value) {
                  onValueChanged(AccountType.existingAccount);
                  listValue.value = AccountType.existingAccount;
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
