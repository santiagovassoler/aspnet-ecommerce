using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BCrypt.Net;

/// <summary>
/// class that uses encrypt.net library to encrypt password
/// </summary>
public class Encrypt
{
    public Encrypt()
    {
      
    }
    private static string GetRandomSalt()
    {
        return BCrypt.Net.BCrypt.GenerateSalt(12);
    }

    public static string encryptPassword(string password)
    {
        return BCrypt.Net.BCrypt.HashPassword(password, GetRandomSalt());
    }

    public static bool ValidatePassword(string password, string correctHash)
    {
        return BCrypt.Net.BCrypt.Verify(password, correctHash);
    }
}