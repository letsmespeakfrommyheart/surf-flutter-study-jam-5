import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meme_generator/cubit/meme_cubit.dart';
import 'package:screenshot/screenshot.dart';

class MemeGeneratorPage extends StatelessWidget {
  const MemeGeneratorPage({super.key});

  @override
  Widget build(final BuildContext context) => _MemeGeneratorPageProvider(
        builder: (final context) => const _MemeGeneratoPageBody(),
      );
}

class _MemeGeneratorPageProvider extends StatelessWidget {
  const _MemeGeneratorPageProvider({required this.builder, super.key});

  final WidgetBuilder builder;
  @override
  Widget build(final BuildContext context) => BlocProvider(
        create: (final context) => MemeCubit(),
        child: Builder(builder: builder),
      );
}

class _MemeGeneratoPageBody extends StatelessWidget {
  const _MemeGeneratoPageBody();

  @override
  Widget build(final BuildContext context) {
    final memeCubit = context.watch<MemeCubit>();
    final fileImage = memeCubit.state.imageFilePath;
    final networkImage = memeCubit.state.imageNetworkUrl;
    final decoration = BoxDecoration(
      border: Border.all(
        color: Colors.white,
        width: 2,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Create your own demotivator',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: memeCubit.reset,
            icon: const Icon(
              Icons.restart_alt,
              size: 40,
              color: Colors.white,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Screenshot(
              controller: memeCubit.screenshotController,
              child: ColoredBox(
                color: Colors.black,
                child: DecoratedBox(
                  decoration: decoration,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 20,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 200,
                          width: double.infinity,
                          child: DecoratedBox(
                            decoration: decoration,
                            child: Padding(
                              padding: const EdgeInsets.all(4),
                              child: ColoredBox(
                                color: Colors.grey,
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    if (fileImage != null)
                                      Image.file(
                                        File(fileImage),
                                        fit: BoxFit.cover,
                                      )
                                    else if (networkImage != null)
                                      Image.network(
                                        networkImage,
                                        fit: BoxFit.cover,
                                      )
                                    else
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                            icon: const Icon(
                                              Icons.add_photo_alternate,
                                              size: 35,
                                            ),
                                            onPressed: () async {
                                              await memeCubit
                                                  .pickImagefromGallery(
                                                ImageSource.gallery,
                                              );
                                            },
                                          ),
                                          const Gap(10),
                                          Text(
                                            'OR',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey.shade700,
                                            ),
                                          ),
                                          const Gap(10),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextField(
                                              decoration: InputDecoration(
                                                suffixIcon: IconButton(
                                                  color: Colors.grey.shade700,
                                                  icon: const Icon(
                                                    Icons.travel_explore,
                                                  ),
                                                  iconSize: 30,
                                                  onPressed: () {
                                                    memeCubit
                                                        .searchImageFromNetwork(
                                                      memeCubit
                                                          .networkImageController
                                                          .text,
                                                    );
                                                  },
                                                ),
                                                filled: true,
                                                fillColor: Colors.white
                                                    .withOpacity(0.5),
                                                contentPadding:
                                                    const EdgeInsets.symmetric(
                                                  vertical: 10,
                                                  horizontal: 15,
                                                ),
                                                border: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                                hintText: 'Enter image url',
                                                hintStyle: const TextStyle(
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              controller: memeCubit
                                                  .networkImageController,
                                            ),
                                          ),
                                        ],
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        TextField(
                          textAlign: TextAlign.center,
                          controller: memeCubit.demotivatorTextController,
                          maxLines: 2,
                          decoration: InputDecoration(
                            hintText: 'Write your demotivator text here',
                            hintStyle: TextStyle(color: Colors.grey.shade800),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                          cursorColor: Colors.grey.shade700,
                          style: const TextStyle(
                            fontFamily: 'Impact',
                            fontSize: 18,
                            color: Colors.white,
                          ),
                          onChanged: memeCubit.onMemeFormChanged,
                          textInputAction: TextInputAction.done,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () async {
                final screenshot = await memeCubit.captureScreenshot();
                if (screenshot != null) {
                  await memeCubit.showCapturedWidget(context, screenshot);
                }
              },
              icon: Icon(Icons.photo_camera),
            ),
          ],
        ),
      ),
    );
  }
}
