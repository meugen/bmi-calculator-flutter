import 'package:flutter/material.dart';

enum Gender {
  MALE, FEMALE
}

abstract class GenderState {

  static GenderState defaultState(Color activeColor, Color inactiveColor) {
    return _NoGenderState(
      activeColor: activeColor,
      inactiveColor: inactiveColor
    );
  }

  final Color _activeColor;
  final Color _inactiveColor;

  GenderState(this._activeColor, this._inactiveColor);

  GenderState._from(GenderState other)
      : this(other._activeColor, other._inactiveColor);

  Gender activeGender();

  GenderState onMaleTap();

  GenderState onFemaleTap();

  Color maleCardColor() {
    return activeGender() == Gender.MALE
      ? _activeColor : _inactiveColor;
  }

  Color femaleCardColor() {
    return activeGender() == Gender.FEMALE
        ? _activeColor : _inactiveColor;
  }
}

class _NoGenderState extends GenderState {

  _NoGenderState({
    @required activeColor,
    @required inactiveColor
  }): super(activeColor, inactiveColor);

  @override
  Gender activeGender() {
    return null;
  }

  @override
  GenderState onMaleTap() {
    return _MaleGenderState.from(this);
  }

  @override
  GenderState onFemaleTap() {
    return _FemaleGenderState.from(this);
  }
}

class _MaleGenderState extends GenderState {

  _MaleGenderState({
    @required Color activeColor,
    @required Color inactiveColor
  }): super(activeColor, inactiveColor);

  _MaleGenderState.from(GenderState genderState): super._from(genderState);

  @override
  Gender activeGender() {
    return Gender.MALE;
  }

  @override
  GenderState onMaleTap() {
    return this;
  }

  @override
  GenderState onFemaleTap() {
    return _FemaleGenderState.from(this);
  }
}

class _FemaleGenderState extends GenderState {

  _FemaleGenderState({
    @required Color activeColor,
    @required Color inactiveColor
  }): super(activeColor, inactiveColor);

  _FemaleGenderState.from(GenderState genderState): super._from(genderState);

  @override
  Gender activeGender() {
    return Gender.FEMALE;
  }

  @override
  GenderState onMaleTap() {
    return _MaleGenderState.from(this);
  }

  @override
  GenderState onFemaleTap() {
    return this;
  }
}