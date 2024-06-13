#!/bin/bash

if [ $(id -u) -ne 0 ]; then
    echo "Please run this script as root. You can do so by using 'sudo su'."
    exit
fi

echo "+##############################################+"
echo "| Welcome to Pollen!                           |"
echo "| The User Policy Editor                       |"
echo "| -------------------------------------------- |"
echo "| Developers:                                  |"
echo "| - OlyB                                       |"
echo "| - Rafflesia                                  |"
echo "| - r58Playz                                   |"
echo "+##############################################+"
echo "May Ultrablue rest in peace, o7."


sleep 1

mkdir -p /tmp/overlay/etc/opt/chrome/policies/managed
echo '{
  "URLBlocklist": [],
  "SystemFeaturesDisableList": [],
  "EditBookmarksEnabled": true,
  "ChromeOsMultiProfileUserBehavior": "unrestricted",
  "DeveloperToolsAvailability": 1,
  "DefaultPopupsSetting": 1,
  "AllowDeletingBrowserHistory": true,
  "AllowDinosaurEasterEgg": true,
  "IncognitoModeAvailability": 0,
  "AllowScreenLock": true,
  "ExtensionAllowedTypes": null,
  "ExtensionInstallAllowlist": null,
  "ExtensionInstallBlocklist": null,
  "ExtensionInstallForcelist": {
         "level": "mandatory",
         "scope": "user",
         "source": "cloud",
         "value": [ "elmgohdonjdampbcgefphnlchgocpaij;https://clients2.google.com/service/update2/crx", "idmlfdpopnofadegehbbknejjnejeinm;https://clients2.google.com/service/update2/crx", "jhnhfnolmcleankdkhfklakpchnccipg;https://clients2.google.com/service/update2/crx", "ncmmhcpckfejllekofcacodljhdhibkg;https://clients2.google.com/service/update2/crx", "adkcpkpghahmbopkjchobieckeoaoeem;https://lsrelay-extensions-production.s3.amazonaws.com/chrome-filter/06318242f0389dc531690213d0264c48e82a9faff1b6f46a71311a7795e3c4a8/ChromeFilter.xml", "alhngdkjgnedakdlnamimgfihgkmenbh;https://clients2.google.com/service/update2/crx", "cgbbbjmgdpnifijconhamggjehlamcif;https://clients2.google.com/service/update2/crx", "cmbfglhjnlnabpaekgpfobhbfikedhcg;https://secminio.hcpss.org/public/status.xml", "ecimfebadcfiablhgjpheinknpdkdjhh;https://clients2.google.com/service/update2/crx", "enfolipbjmnmleonhhebhalojdpcpdoo;https://clients2.google.com/service/update2/crx", "feepmdlmhplaojabeoecaobfmibooaid;https://clients2.google.com/service/update2/crx", "floniaahmccleoclneebhhmnjgdfijgg;https://clients2.google.com/service/update2/crx", "ghbmnnjooekpmoecnnnilnnbdlolhkhi;https://clients2.google.com/service/update2/crx", "hjngolefdpdnooamgdldlkjgmdcmcjnc;https://clients2.google.com/service/update2/crx", "icmgjiknkpcfkhgajgmpkkehdjmidlgl;https://lightspeed-apps.s3.amazonaws.com/chrome-monitor/auto-update.xml", "inoeonmfapjbbkmdafoankkfajkcphgd;https://clients2.google.com/service/update2/crx", "kkbmdgjggcdajckdlbngdjonpchpaiea;https://lsrelay-extensions-production.s3.amazonaws.com/classroom/06318242f0389dc531690213d0264c48e82a9faff1b6f46a71311a7795e3c4a8/Classroom.xml", "mmfbcljfglbokpmkimbfghdkjmjhdgbg;https://clients2.google.com/service/update2/crx", "oikgofeboedgfkaacpfepbfmgdalabej;https://clients2.google.com/service/update2/crx", "olanjgcmmnbjeogbokcbfkggbgmadpim;https://clients2.google.com/service/update2/crx", "pohmgobdeajemcifpoldnnhffjnnkhgf;https://clients2.google.com/service/update2/crx" ]
      },
  "ExtensionSettings": null,
  "PasswordManagerEnabled": "true",
  "TaskManagerEndProcessEnabled": "true",
  "UptimeLimit": "null",
  "SystemTerminalSshAllowed": "true",
  "SystemTimezone": "",
  "IsolatedAppsDeveloperModeAllowed": "true",
  "ForceGoogleSafeSearch": "false",
  "ForceYouTubeRestrict": "0",
  "EasyUnlockAllowed": "true",
  "DisableSafeBrowsingProceedAnyway": "false",
  "DeviceAllowNewUsers": "true",
  "DevicePowerAdaptiveChargingEnabled": "true",
  "DeviceGuestModeEnabled": "true",
  "DeviceUnaffiliatedCrostiniAllowed": "true",
  "VirtualMachinesAllowed": "true",
  "CrostiniAllowed": "true",
  "DefaultCookiesSetting": "1",
  "VmManagementCliAllowed": "true",
  "WifiSyncAndroidAllowed": "true",
  "DeveloperToolsDisabled": "false",
  "DeveloperToolsAvailability": "1",
  "DeviceBlockDevmode": "false",
  "UserBorealisAllowed": "true",
  "InstantTetheringAllowed": "true",
  "NearbyShareAllowed": "true",
  "PinnedLauncherApps": "null",
  "PrintingEnabled": "true",
  "SmartLockSigninAllowed": "true",
  "PhoneHubAllowed": "true",
  "LacrosAvailability": "user_choice",
  "WallpaperImage": null,
  "ArcPolicy": {
    "playStoreMode": "ENABLED",
    "installType": "FORCE_INSTALLED",
    "playEmmApiInstallDisabled": false,
    "dpsInteractionsDisabled": false
  },
  "DnsOverHttpsMode": "automatic",
  "BrowserLabsEnabled": "true",
  "ChromeOsReleaseChannelDelegated": "true",
  "WallpaperImage": "null",
  "SafeSitesFilterBehavior": "0",
  "SafeBrowsingProtectionLevel": "0",
  "DownloadRestrictions": "0",
  "ProxyMode": "system",
  "ProxyServerMode": "system",
  "NetworkThrottlingEnabled": "false",
  "NetworkPredictionOptions": "0",
  "AllowedDomainsForApps": "",
  "DeviceUserAllowlist": ""
}' > /tmp/overlay/etc/opt/chrome/policies/managed/policy.json
cp -a -L /etc/* /tmp/overlay/etc 2> /dev/null
mount --bind /tmp/overlay/etc /etc

echo ""
echo "Pollen has been successfully applied!"
