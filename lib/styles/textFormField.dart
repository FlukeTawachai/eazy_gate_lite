import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import 'colors.dart';
import 'containers.dart';
import 'text.dart';

class InputTextFromField {
  var themeColor = ColorInTheme();
  var containerStyles = ContainerStyles();
  var textInTheme = TextInTheme();
  Widget inputField(
      FocusNode node,
      TextEditingController controller,
      Function onSubmit,
      Function onChang,
      TextStyle inputStyle,
      TextInputType type) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
      child: Center(
        child: TextFormField(
          keyboardType: type,
          textAlignVertical: TextAlignVertical.center,
          enabled: true,
          autofocus: true,
          focusNode: node,
          enableInteractiveSelection: false,
          readOnly: false,
          controller: controller,
          style: inputStyle,
          decoration: InputDecoration(
            border: InputBorder.none,
          ),
          onFieldSubmitted: (value) {
            onSubmit(value);
          },
          onChanged: (value) {
            onChang(value);
          },
        ),
      ),
    );
  }

  Widget inputFieldLimit(
      FocusNode node,
      TextEditingController controller,
      Function onSubmit,
      Function onChang,
      TextStyle inputStyle,
      int limit,
      TextInputType type) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
      child: Center(
        child: TextFormField(
          keyboardType: type,
          textAlignVertical: TextAlignVertical.center,
          enabled: true,
          // autofocus: true,
          focusNode: node,
          enableInteractiveSelection: false,
          readOnly: false,
          controller: controller,
          style: inputStyle,
          decoration: InputDecoration(
            border: InputBorder.none,
          ),
          onFieldSubmitted: (value) {
            onSubmit(value);
          },
          onChanged: (value) {
            onChang(value);
          },
          inputFormatters: [
            LengthLimitingTextInputFormatter(limit),
          ],
        ),
      ),
    );
  }

  Widget inputFieldLabel(
      FocusNode node,
      TextEditingController controller,
      Function onSubmit,
      Function onChang,
      TextStyle inputStyle,
      TextInputType type,
      bool enabled,
      String label) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
      child: Center(
        child: TextFormField(
          keyboardType: type,
          textAlignVertical: TextAlignVertical.center,
          enabled: enabled,
          autofocus: false,
          focusNode: node,
          enableInteractiveSelection: false,
          readOnly: false,
          controller: controller,
          style: inputStyle,
          decoration: InputDecoration(
              border: InputBorder.none,
              label: Text(label),
              labelStyle: textInTheme.textCustomNormal(themeColor.grey03, 16)),
          onFieldSubmitted: (value) {
            onSubmit(value);
          },
          onChanged: (value) {
            onChang(value);
          },
        ),
      ),
    );
  }

  Widget generalFromFieldLabel(
      FocusNode node,
      TextEditingController controller,
      Function onSubmit,
      Function onChang,
      TextStyle inputStyle,
      TextInputType type,
      bool enabled,
      String title,
      String label) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: textInTheme.textCustomNormal(themeColor.grey03, 16),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              height: 48,
              decoration: containerStyles.customBottom(
                  enabled ? themeColor.white : themeColor.grey01,
                  themeColor.grey03),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                child: Center(
                  child: TextFormField(
                    keyboardType: type,
                    textAlignVertical: TextAlignVertical.center,
                    enabled: enabled,
                    autofocus: false,
                    focusNode: node,
                    enableInteractiveSelection: false,
                    readOnly: false,
                    controller: controller,
                    style: inputStyle,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        label: Text(label),
                        labelStyle: textInTheme.textCustomNormal(
                            themeColor.grey03, 16)),
                    onFieldSubmitted: (value) {
                      onSubmit(value);
                    },
                    onChanged: (value) {
                      onChang(value);
                    },
                  ),
                ),
              )),
        ),
      ],
    );
  }

    Widget generalFromFieldLabelRemark(
      FocusNode node,
      TextEditingController controller,
      Function onSubmit,
      Function onChang,
      TextStyle inputStyle,
      TextInputType type,
      bool enabled,
      String title,
      String label,
      String remark) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Text(
                title,
                style: textInTheme.textCustomNormal(themeColor.grey03, 16),
              ),
              Text(
                remark,
                style: textInTheme.textCustomNormal(themeColor.red04, 16),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              height: 48,
              decoration: containerStyles.customBottom(
                  enabled ? themeColor.white : themeColor.grey01,
                  themeColor.grey03),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                child: Center(
                  child: TextFormField(
                    keyboardType: type,
                    textAlignVertical: TextAlignVertical.center,
                    enabled: enabled,
                    autofocus: false,
                    focusNode: node,
                    enableInteractiveSelection: false,
                    readOnly: false,
                    controller: controller,
                    style: inputStyle,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        label: Text(label),
                        labelStyle: textInTheme.textCustomNormal(
                            themeColor.grey03, 16)),
                    onFieldSubmitted: (value) {
                      onSubmit(value);
                    },
                    onChanged: (value) {
                      onChang(value);
                    },
                  ),
                ),
              )),
        ),
      ],
    );
  }
}
