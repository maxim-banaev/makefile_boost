#define BOOST_TEST_MODULE CalculatorTests
#include <boost/test/included/unit_test.hpp>
#include "../src/calculator.h"

BOOST_AUTO_TEST_SUITE(CalculatorTestSuite)

BOOST_AUTO_TEST_CASE(test_add) {
    Calculator calc;
    BOOST_CHECK_EQUAL(calc.add(2, 3), 5);
    BOOST_CHECK_EQUAL(calc.add(-1, 1), 0);
    BOOST_CHECK_EQUAL(calc.add(-5, -3), -8);
}

BOOST_AUTO_TEST_CASE(test_subtract) {
    Calculator calc;
    BOOST_CHECK_EQUAL(calc.subtract(5, 3), 2);
    BOOST_CHECK_EQUAL(calc.subtract(1, 1), 0);
    BOOST_CHECK_EQUAL(calc.subtract(-5, -3), -2);
}

BOOST_AUTO_TEST_CASE(test_multiply) {
    Calculator calc;
    BOOST_CHECK_EQUAL(calc.multiply(3, 4), 12);
    BOOST_CHECK_EQUAL(calc.multiply(-2, 5), -10);
    BOOST_CHECK_EQUAL(calc.multiply(0, 100), 0);
}

BOOST_AUTO_TEST_CASE(test_divide) {
    Calculator calc;
    BOOST_CHECK_CLOSE(calc.divide(10.0, 2.0), 5.0, 0.001);
    BOOST_CHECK_CLOSE(calc.divide(7.0, 2.0), 3.5, 0.001);
    BOOST_CHECK_THROW(calc.divide(5.0, 0.0), std::invalid_argument);
}

BOOST_AUTO_TEST_SUITE_END()
