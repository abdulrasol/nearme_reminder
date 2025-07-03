import 'package:flexify/flexify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nearme_reminder/database/models/reminder_model.dart';
import 'package:nearme_reminder/layouts/remiders/screens/location_selecrtor.dart';
import 'package:nearme_reminder/providers/objectbox_provider.dart';
import 'package:nearme_reminder/utils/app_constants.dart';
import 'package:validatorless/validatorless.dart';
//import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';

class AddReminderScreen extends ConsumerStatefulWidget {
  const AddReminderScreen({super.key});

  @override
  ConsumerState<AddReminderScreen> createState() => _AddReminderScreenState();
}

class _AddReminderScreenState extends ConsumerState<AddReminderScreen> {
  final reminder = Reminder(
      title: '', description: '', latitude: 1, longitude: 1, radius: 50);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descController = TextEditingController();
  final distanceController = TextEditingController();
  bool showErrorMessage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.addReminderTitle(context)),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                decoration: inputDecoration.copyWith(
                    labelText: AppStrings.addFromTitle(context)),
                validator: Validatorless.required(
                    AppStrings.addRequiredRecord(context)),
                onChanged: (value) => reminder.title = value,
              ),
              TextFormField(
                controller: descController,
                decoration: inputDecoration.copyWith(
                    labelText: AppStrings.addRFromDesc(context)),
                validator: Validatorless.required(
                    AppStrings.addRequiredRecord(context)),
                onChanged: (value) => reminder.description = value,
              ),
              TextFormField(
                controller: distanceController,
                keyboardType: TextInputType.number,
                decoration: inputDecoration.copyWith(
                  labelText: AppStrings.addFromDistane(context),
                ),
                validator: Validatorless.multiple([
                  Validatorless.number(''),
                  Validatorless.required(
                    AppStrings.addRequiredRecord(context),
                  )
                ]),
                onChanged: (value) => reminder.radius = double.parse(value),
              ),
              Row(
                children: [
                  Checkbox(
                    value: reminder.repeated,
                    onChanged: (value) {
                      setState(() {
                        reminder.repeated = value ?? false;
                      });
                    },
                  ),
                  7.horizontalSpace,
                  Text(
                    AppStrings.addReminderCheckBox(context),
                  ),
                ],
              ),
              ListTile(
                onTap: () {
                  selectPlacebuttonAction(context);
                },
                title: Text(reminder.address ??
                    AppStrings.addLocationNotSelected(context)),
                subtitle: Text(AppStrings.addClickToEdit(context)),
                trailing: Icon(Icons.location_searching),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            if (reminder.latitude != 1 && reminder.longitude != 1) {
              ref.read(reminderProvider.notifier).addReminder(reminder);
              Flexify.back();
            } else {
              setState(() {
                ScaffoldMessenger.of(context)
                  ..removeCurrentSnackBar()
                  ..showSnackBar(SnackBar(
                    content: Text('please select plase address!'),
                    //showCloseIcon: true,
                    action: SnackBarAction(
                      label: AppStrings.addClickToEdit(context),
                      onPressed: () {
                        selectPlacebuttonAction(context);
                      },
                    ),
                  ));
              });
            }
          }
        },
        child: Icon(Icons.save_alt),
      ),
      // extendBodyBehindAppBar: true,
    );
  }

  Future<void> selectPlacebuttonAction(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    var result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => LocationSelecrtor()));
    if (!context.mounted) return;
    if (result != null) {
      setState(
        () {
          reminder.latitude = result['latitude'];
          reminder.longitude = result['longitude'];
          reminder.address =
              '${result['country']} ${result['state']} ${result['neighbourhood']} ${result['road']} ${result['place']}';
        },
      );
    }
  }
}
