package com.xedrux.cclouds.web.entities;

import com.xedrux.cclouds.web.exceptions.UnableToCreateUserException;
import java.util.Date;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;


/**
 *
 * @author Isidro Rodríguez Gamez
 */
public class CcloudsUsuario {

    private long idUser = -1;
    @NotNull
    private long idRol;
    @NotNull
    @Size(min = 1, max = 25)
    private String username;
    @NotNull
    @Size(min = 1, max = 255)
    private String password;
    @Size(max = 255)
    private String passwordResetToken;
    @Size(max = 255)
    private String phoneNumber;
    @Size(max = 255)
    private String userEmail;
    @Size(max = 255)
    private String firstName;
    @Size(max = 255)
    private String lastName;
    private String sex;
    @NotNull
    private Date dateBirth;
    @NotNull
    @Size(min = 1, max = 50)
    private String dbHash;
    @NotNull
    @Size(min = 1, max = 10)
    private String plainTextPassword;
    @Size(max = 50)
    private String country;
    @Size(max = 50)
    private String province;
    @Size(max = 50)
    private String city;

    public CcloudsUsuario() {
    }

    public CcloudsUsuario(long idUser) {
        this.idUser = idUser;
    }

    public CcloudsUsuario(long idUser, long idRol, String username,
            String password, Date dateBirth, String dbHash,
            String plainTextPassword) {
        
        this.idUser = idUser;
        this.idRol = idRol;
        this.username = username;
        this.password = password;
        this.dateBirth = dateBirth;
        this.dbHash = dbHash;
        this.plainTextPassword = plainTextPassword;
    }

    private void checkEmailSyntax(String email) throws UnableToCreateUserException{
        if(!email.matches("^[0-9a-zA-Z]([-.\\w]*[0-9a-zA-Z_+])*@([0-9a-zA-Z][-\\w]*" +
                "[0-9a-zA-Z]\\.)+[a-zA-Z]{2,9}$"))
            throw new UnableToCreateUserException("Invalid email address");
    } 
    public CcloudsUsuario(long idUser, long idRol, String username,
            String password, String passwordResetToken, String phoneNumber,
            String userEmail, String firstName, String lastName, String sex,
            Date dateBirth, String dbHash, String plainTextPassword,
            String country, String province, String city) throws UnableToCreateUserException {
        checkEmailSyntax(userEmail);
        this.idUser = idUser;
        this.idRol = idRol;
        this.username = username;
        this.password = password;
        this.passwordResetToken = passwordResetToken;
        this.phoneNumber = phoneNumber;
        this.userEmail = userEmail;
        this.firstName = firstName;
        this.lastName = lastName;
        this.sex = sex;
        this.dateBirth = dateBirth;
        this.dbHash = dbHash;
        this.plainTextPassword = plainTextPassword;
        this.country = country;
        this.province = province;
        this.city = city;
    }

    public long getIdUser() {
        return idUser;
    }

    public void setIdUser(long idUser) {
        this.idUser = idUser;
    }

    public long getIdRol() {
        return idRol;
    }

    public void setIdRol(long idRol) {
        this.idRol = idRol;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPasswordResetToken() {
        return passwordResetToken;
    }

    public void setPasswordResetToken(String passwordResetToken) {
        this.passwordResetToken = passwordResetToken;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) throws UnableToCreateUserException {
        checkEmailSyntax(userEmail);
        this.userEmail = userEmail;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Date getDateBirth() {
        return dateBirth;
    }

    public void setDateBirth(Date dateBirth) {
        this.dateBirth = dateBirth;
    }

    public String getDbHash() {
        return dbHash;
    }

    public void setDbHash(String dbHash) {
        this.dbHash = dbHash;
    }

    public String getPlainTextPassword() {
        return plainTextPassword;
    }

    public void setPlainTextPassword(String plainTextPassword) {
        this.plainTextPassword = plainTextPassword;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    @Override
    public String toString() {
        return "test.CcloudsUsuario[ idUser=" + idUser + " ]";
    }

}
