import 'package:bloc/bloc.dart';
import 'package:bloc_prac/bloc/image_bloc/image_event.dart';
import 'package:bloc_prac/bloc/image_bloc/image_state.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/image_picker_utils.dart';

class ImageBloc extends Bloc<ImageEvent,ImageState>
{
  final ImagePickerUtils _imagePickerUtils;
  ImageBloc(this._imagePickerUtils):super(const ImageState())
  {
    on<CameraCapture>(_cameraCapture);
    on<GalleryImageCapture>(_galleryImageCapture);
  }

  void _cameraCapture(CameraCapture event,Emitter<ImageState> emit) async
  {
    XFile? file=await _imagePickerUtils.cameraCapture();
    emit(state.copyWith(file: file));

  }

  void _galleryImageCapture(GalleryImageCapture event,Emitter<ImageState> emit) async
  {
    XFile? file=await _imagePickerUtils.galleryCapture();
    emit(state.copyWith(file: file));

  }


}
