import 'package:flutter/material.dart';

const addAdsBorder= UnderlineInputBorder(
    borderSide: BorderSide(
      color: Colors.black12,
      width: 1,
    )
);
const addAdsFocusBorder= UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.black54,width: 1)
);
final requestBorder= OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: const BorderSide(color: Colors.grey,width: 1)
);
final homeSearchBorder= OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(color: Colors.transparent,width: 1)
);
final focusRequestBorder= OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: const BorderSide(color: Colors.grey,width: 2)
);