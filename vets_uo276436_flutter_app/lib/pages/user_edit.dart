import 'package:flutter/material.dart';
import 'package:vets_uo276436_flutter_app/src/user.dart';

class UserEdit extends StatefulWidget {
  final User user;
  const UserEdit({super.key, required this.user});
  @override
  State<StatefulWidget> createState() => StateUserEdit();
}

class StateUserEdit extends State<UserEdit> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  @override
  void initState() {
    User user = widget.user;
    nameController.text = user.name;
    surnameController.text = user.surname;
    emailController.text = user.email;
    phoneController.text = user.phone;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Modificar datos usuario"),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                  hintText: 'Introduce tu nombre',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'por Favor digite el nombre';
                  }
                  if (value.length < 5) {
                    return 'El nombre debe tener al menos 5 caracteres';
                  }
                  return null;
                },
                onSaved: (value) => nameController.text = value ?? '',
              ),
              TextFormField(
                controller: surnameController,
                decoration: const InputDecoration(
                  labelText: 'Apellidos',
                  hintText: 'Introduce tu apellidos',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'por favor digite los apellidos';
                  }
                  if (value.length < 5) {
                    return 'Los apellidos deben tener al menos 5 caracteres';
                  }
                  return null;
                },
                onSaved: (value) {
                  surnameController.text = value ?? '';
                },
              ),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Introduce tu email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'por favor digite el email';
                  }
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                      .hasMatch(value)) {
                    return 'Por favor, introduce un email válido';
                  }
                  return null;
                },
                onSaved: (value) {
                  emailController.text = value ?? '';
                },
              ),
              TextFormField(
                controller: phoneController,
                decoration: const InputDecoration(
                  labelText: 'Telefóno',
                  hintText: 'Introduce tu email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'por favor digite el telefono ';
                  }
                  if (!RegExp(r'^[0-9]{9}$').hasMatch(value)) {
                    return 'Por favor, introduce un número de teléfono válido';
                  }
                  return null;
                },
                onSaved: (value) {
                  phoneController.text = value ?? '';
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                      _formKey.currentState!.save();
                      User user = User(
                          nameController.text,
                          surnameController.text,
                          emailController.text,
                          phoneController.text);
                      Navigator.pop(context, user);
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ));
  }
}
