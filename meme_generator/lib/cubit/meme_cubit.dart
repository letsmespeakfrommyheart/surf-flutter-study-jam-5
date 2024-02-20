import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

part 'meme_cubit.freezed.dart';
part 'meme_cubit_states.dart';

class MemeCubit extends Cubit<MemeCubitState> {
  MemeCubit() : super(const MemeCubitState());

  final _imagePicker = ImagePicker();
  File? image;
  final demotivatorTextController = TextEditingController();
  final networkImageController = TextEditingController();
  ScreenshotController screenshotController = ScreenshotController();

  Future<void> pickImagefromGallery(final ImageSource source) async {
    final XFile? xFileImage = await _imagePicker.pickImage(source: source);
    if (xFileImage != null) {
      final File image = File(xFileImage.path);
      emit(state.copyWith(imageFilePath: image.path));
    }
  }

  void onMemeFormChanged(final String inputText) {
    emit(state.copyWith(memeText: inputText));
  }

  void searchImageFromNetwork(final String inputUrl) {
    if (inputUrl == '') {
      return;
    }
    emit(state.copyWith(imageNetworkUrl: inputUrl));
  }

  Future<Uint8List?> captureScreenshot() async {
    final screenshot = await screenshotController.capture(
      delay: const Duration(milliseconds: 10),
    );
    return screenshot;
  }

  Future<dynamic> showCapturedWidget(
    final BuildContext context,
    final Uint8List capturedImage,
  ) =>
      showDialog(
        useSafeArea: false,
        context: context,
        builder: (final context) => Scaffold(
          appBar: AppBar(
            title: const Text('Demotivator screenshot'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.memory(capturedImage),
                // IconButton(
                //   onPressed: () {
                //     shareScreenshot(body: 'https://www.');
                //   },
                //   icon: const Icon(Icons.share),
                // ),
              ],
            ),
          ),
        ),
      );

  Future<bool> shareScreenshot({
    required final String body,
    final Uint8List? image,
  }) async {
    try {
      List<int> bytes = image!.map((e) => e.toInt()).toList();
      final String imageUrl = 'data:image/png;base64,${base64Encode(image)}';
      await Share.share(
        body,
        subject: imageUrl,
      );
      return true;
    } on PlatformException {
      return false;
    } on FormatException {
      return false;
    }
  }

  void reset() {
    demotivatorTextController.clear();
    networkImageController.clear();
    emit(
      state.copyWith(
        imageFilePath: null,
      ),
    );
    emit(
      state.copyWith(
        imageNetworkUrl: null,
      ),
    );
    emit(
      state.copyWith(
        memeText: '',
      ),
    );
  }

  @override
  Future<void> close() {
    demotivatorTextController.dispose();
    networkImageController.dispose();
    return super.close();
  }
}
