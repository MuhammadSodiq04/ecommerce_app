import 'package:firebase_auth/firebase_auth.dart';
import '../models/universal_data.dart';

class ProfileService {
  Future<UniversalData> updateUserEmail({
    required String email,
  }) async {
    try {
      await FirebaseAuth.instance.currentUser?.updateEmail(email);
      return UniversalData(data: "Updated!");
    } on FirebaseAuthException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }


  Future<UniversalData> updateUserImage({
    required String imagePath,
  }) async {
    try {
      await FirebaseAuth.instance.currentUser?.updatePhotoURL(imagePath);
      return UniversalData(data: "Updated!");
    } on FirebaseAuthException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }


  Future<UniversalData> updateUserName({
    required String username,
  }) async {
    try {
      await FirebaseAuth.instance.currentUser?.updateDisplayName(username);
      return UniversalData(data: "Updated!");
    } on FirebaseAuthException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Future<UniversalData> updateAll({
    required String username,required String imagePath, required String email,
  }) async {
    try {
      await FirebaseAuth.instance.currentUser?.updateDisplayName(username);
      await FirebaseAuth.instance.currentUser?.updateEmail(email);
      await FirebaseAuth.instance.currentUser?.updatePhotoURL(imagePath);
      return UniversalData(data: "Updated!");
    } on FirebaseAuthException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }


}
