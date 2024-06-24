cls ; date
$username = ' '

$User = Get-ADUser -Server " " $username -Properties *
$User | Select-Object -Property * -ExcludeProperty userSMIMECertificate, userCertificate, msExchRecordedName
$User | Select-Object -Property `
    Name, `
    samAccountName, `
    EmployeeID, `
    extensionAttribute5, `
    extensionAttribute7, `
    Enabled, `
    accountExpires, `
    AccountExpirationDate,
    LastLogonDate, `
    @{Name="LastLogonTimestamp";Expression={[datetime]::FromFileTime($_.LastLogonTimestamp)}}, `
    LockedOut, `
    @{Name="lockoutTime";Expression={[datetime]::FromFileTime($_.lockoutTime)}}, `
    BadLogonCount, `
    LastBadPasswordAttempt, `
    PasswordExpired, `
    PasswordLastSet,
    msDS-KeyCredentialLink,
    altsecurityidentities
