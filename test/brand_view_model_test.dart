import 'package:flutter_test/flutter_test.dart';
import 'package:logging_flutter/brand/brand.dart';
import 'package:logging_flutter/brand/brand_view_model.dart';

void main() {
  test('Add and Remove Brand', () {
    final brandViewModel = BrandViewModel();

    final brand1 = Brand('Work');
    final brand2 = Brand('Personal');

    brandViewModel.addBrand(brand1);
    brandViewModel.addBrand(brand2);

    expect(brandViewModel.brands.length, 2);
    expect(brandViewModel.brands.contains(brand1), true);
    expect(brandViewModel.brands.contains(brand2), true);

    brandViewModel.removeBrand(brand1);
    expect(brandViewModel.brands.length, 1);
    expect(brandViewModel.brands.contains(brand1), false);
  });
}
