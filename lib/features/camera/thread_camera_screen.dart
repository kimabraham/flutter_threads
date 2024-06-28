import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:thread_clone/constants/gaps.dart';
import 'package:thread_clone/constants/sizes.dart';
import 'package:thread_clone/features/camera/photo_preview_screen.dart';
import 'package:thread_clone/features/camera/widgets/camera_bottom_appbar.dart';

class ThreadCameraScreen extends StatefulWidget {
  const ThreadCameraScreen({super.key});

  @override
  State<ThreadCameraScreen> createState() => _ThreadCameraScreenState();
}

class _ThreadCameraScreenState extends State<ThreadCameraScreen> {
  @override
  void initState() {
    super.initState();
    initPermission();
  }

  bool _hasPermission = false;
  bool _isSelf = false;
  FlashMode _flashMode = FlashMode.auto;

  late CameraController _cameraController;

  Future<void> initPermission() async {
    final cameraPermission = await Permission.camera.request();

    // isPermanentlyDenied -> 다시는 묻지 말라는 것과 함께 하는 거절.
    final cameraDenied =
        cameraPermission.isDenied || cameraPermission.isPermanentlyDenied;

    if (!cameraDenied) {
      _hasPermission = true;
      await initCamera();
      setState(() {});
    }
  }

  Future<void> initCamera() async {
    final cameras = await availableCameras();

    if (cameras.isEmpty) return;

    _cameraController =
        CameraController(cameras[_isSelf ? 0 : 1], ResolutionPreset.ultraHigh);

    await _cameraController.initialize();

    _flashMode = _cameraController.value.flashMode;
  }

  Future<void> _toggleSelfiMode() async {
    _isSelf = !_isSelf;
    await initCamera();
    setState(() {});
  }

  Future<void> _setFlashMode(FlashMode newFlashMode) async {
    await _cameraController.setFlashMode(newFlashMode);
    _flashMode = newFlashMode;
    setState(() {});
  }

  Future<void> _onTapPhoto() async {
    if (_cameraController.value.isTakingPicture) return;

    final photo = await _cameraController.takePicture();

    if (!mounted) return;

    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PhotoPreviewScreen(
          photo: photo,
          isPicked: false,
          onSave: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  Future<void> _onPickPhoto() async {
    final photo = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (photo == null) return;
    if (!mounted) return;

    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PhotoPreviewScreen(
          photo: photo,
          isPicked: true,
          onSave: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  void _onPressBack() {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(
              Sizes.size52,
            ),
          ),
        ),
        clipBehavior: Clip.hardEdge,
        child: !_hasPermission || !_cameraController.value.isInitialized
            ? const Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Initializing...",
                      style: TextStyle(
                          color: Colors.white, fontSize: Sizes.size20),
                    ),
                    Gaps.v20,
                    CircularProgressIndicator.adaptive(),
                  ],
                ),
              )
            : Stack(
                fit: StackFit.expand,
                children: [
                  CameraPreview(
                    _cameraController,
                  ),
                  Positioned(
                    top: Sizes.size44,
                    left: Sizes.size15,
                    child: IconButton(
                      onPressed: _onPressBack,
                      icon: const FaIcon(FontAwesomeIcons.chevronLeft),
                      color: Colors.white,
                      iconSize: Sizes.size24,
                    ),
                  ),
                  Positioned(
                    width: MediaQuery.of(context).size.width,
                    bottom: Sizes.size32,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _flashMode == FlashMode.auto
                            ? IconButton(
                                onPressed: () => _setFlashMode(FlashMode.off),
                                color: Colors.white,
                                icon: const Icon(
                                  Icons.flash_off_rounded,
                                ),
                              )
                            : IconButton(
                                onPressed: () => _setFlashMode(FlashMode.auto),
                                color: Colors.white,
                                icon: const Icon(
                                  Icons.flash_auto_rounded,
                                ),
                              ),
                        Stack(
                          children: [
                            Positioned(
                              child: Container(
                                width: Sizes.size72 + Sizes.size6,
                                height: Sizes.size72 + Sizes.size6,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.white, width: Sizes.size3),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 9,
                              left: 9,
                              child: GestureDetector(
                                onTap: _onTapPhoto,
                                child: Container(
                                  width: Sizes.size60,
                                  height: Sizes.size60,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: _toggleSelfiMode,
                          color: Colors.white,
                          icon: const FaIcon(
                            FontAwesomeIcons.arrowsRotate,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
      ),
      bottomNavigationBar: CameraBottomAppBar(onPressLibrary: _onPickPhoto),
    );
  }
}
