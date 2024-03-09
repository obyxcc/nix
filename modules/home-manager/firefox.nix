{pkgs, inputs, ...}: {
  programs.firefox = {
    enable = true;
    profiles.default = {
      settings = {
	"dom.security.https_only_mode" = true;
	"dom.security.https_only_mode_ever_enabled" = true;
	"signon.remeberSignons" = false;
	"app.shield.optoutstudies.enabled" = false;
	"browser.aboutConfig.showWarning" = false;
	"browser.contentblocking.category" = "strict";
	"browser.newtabpage.activity-stream.feeds.section.topstories" = false;
	"browser.safebrowsing.malware.enabled" = false;
	"browser.safebrowsing.phishing.enabled" = false;
	"browser.toolbars.bookmarks.visibility" = "never";
	"browser.urlbar.placeholderName" = "DuckDuckGo";
	"browser.urlbar.placeholderName.private" = "DuckDuckGo";
	"browser.urlbar.suggest.quicksuggest.nonsponsored" = false;
	"browser.urlbar.suggest.quicksuggest.sponsored" = false;
	"extensions.formautofill.addresses.enabled" = false;
	"extensions.formautofill.creditCards.enabled" = false;
	"privacy.donottrackheader.enabled" = true;
	"privacy.fingerprintingProtection" = true;
	"privacy.globalprivacycontrol.enabled" = true;
	"privacy.trackingprotection.emailtracking.enabled" = true;
	"privacy.trackingprotection.enabled" = true;
	"privacy.trackingprotection.socialtracking.enabled" = true;
	"signon.management.page.breach-alerts.enabled	" = true;
	"browser.tabs.inTitlebar" = 0;
      };
      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
	ublock-origin
      ];
    };
  };
}
