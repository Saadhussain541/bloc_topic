import 'package:equatable/equatable.dart';

abstract class ImageEvent extends Equatable
{
  const ImageEvent();

  @override
  List<Object> get props=>[];

}

class CameraCapture extends ImageEvent{}
class GalleryImageCapture extends ImageEvent{}