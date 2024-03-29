package ar.edu.itba.paw.webapp.form.customvalidator;

import ar.edu.itba.paw.model.PasswordPair;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class PasswordLengthValidator implements ConstraintValidator<PasswordLengthConstraint, PasswordPair> {

    @Override
    public void initialize(PasswordLengthConstraint orderConstraint) {

    }

    @Override
    public boolean isValid(PasswordPair pair, ConstraintValidatorContext constraintValidatorContext) {
        if(pair == null || pair.getPassword() == null)
            return true;
        return pair.getPassword().length() >= 8;
    }
}
