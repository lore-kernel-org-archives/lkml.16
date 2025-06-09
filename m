Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E371386B4;
	Mon,  9 Jun 2025 12:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749472065; cv=none; b=UnzWylX52wy3dH0tpS9oecwgWfxk0KQqIU/coj/2+McJ0K3rEsbdRRLZwLiioUduqzJlCJ5wueHSOK8/DXHQFkpCGQHTctcaMd07DYhuH50kyFuZMOOEYGwiQR2LNtn5q8PjefvCnF8kKwloMvKFprjiOIome7shdkVdlYDORDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749472065; c=relaxed/simple;
	bh=SCC/07RAK0zVNVGbDXJ9rTerqOCXYhnksk6Y0nru5Dc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ThoTvuOvo7Kmf3rUCCzleLkNpqkye15QesCtYapgnA1sSxwjVXXZsOODY/27oUS7q1SnGfrViuCI2LVvMW298UwOeRlTpAflvPZCWBAUxqxGTTzEKN9j1wEdVgg68iYXHi9ZiEtwuufP02aCCXNMJz66ukFA61rfSCo24F5GmRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=R+HSaGG7; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=lqxBPhZd; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="R+HSaGG7";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="lqxBPhZd"
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id 0F2AC13804F6;
	Mon,  9 Jun 2025 08:27:40 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Mon, 09 Jun 2025 08:27:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1749472060; x=
	1749558460; bh=+HrbCVNyRmqrNbgx/AeZ+MCUmR1ZJowaPt23OYi+HbA=; b=R
	+HSaGG7M/Deq9kTcLWqXfS/3Z2FAmrIq2pxD7IKgZGwQElgz6Inl604l29MPZCzB
	V57E0uXGjSU8uHR85q0cHlrgqrTdIMbbbWdVfQGZsuhateus4MSHGQEkGoE9Zgyn
	8+K7Y2AlMNKhzUYeFEzQoFXVtZ0A6IBEbppnlFz0770PUksOGtN4lgUvcJDmCs7T
	TG11WaxPEyV2NhkHqc3y+bMsn5C9fCSfxF2GFHTeTdJR7qLusWWIx6PfKjxPIezT
	W11J7cV1PNms8VQSwETNBf/6aQ/mrqT+Y2GJ943tQ8Xvypol46/RhQBBkTOUHYb4
	y+Irs8VbDbBG5St5pAYzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1749472060; x=1749558460; bh=+
	HrbCVNyRmqrNbgx/AeZ+MCUmR1ZJowaPt23OYi+HbA=; b=lqxBPhZd9j7BAM11j
	87aJjoFoNSthGobIqFGKgA73jbMo1O0qWyKBVq/a7XRUjUPs/QfBp5eqGWONk/Ry
	OxYGov+WWmf5MBOnzzp5OeKG9mr8chctoiBE7wlHbW3cIwU5rlbi3nDaeYsHXq0d
	zKnqMz9gwouXkJybc4jXWQKRa1AE9+UlAz7IbVvrKPcJQeprjKtqwJvHiehCq+xr
	3iLmybaXr1kzwUvXG7knKATfVVisxLC4ORvMaihidmnsAoLJkMmOSiw5zUvO3QJ1
	vtldWA3eyHcY80aE0wtDIdNucrN4fWolNV69CekVPtdAtjM+xKznATcgD+1KXgQ9
	UeLrg==
X-ME-Sender: <xms:O9NGaLBTjNGhW5XyoSgHMmONnmqDr-ZclF7fnadGqTf9UiAh3oZ8ig>
    <xme:O9NGaBjeJVq-fL7QeEHNp0B2wz-i367BAhUhawJZn-SujMuJ8ulUSdXMCeKKpmqTb
    MHaQeKLIPPcGVDrVbs>
X-ME-Received: <xmr:O9NGaGl4Ke2-UPa3iHUt8F3nsUfBr5mnQX9C9hY7HpCznPGBtc4CsRf5iBwUh2vR2Kz80mkkweIBAd5dekQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdelvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucgoufhushhpvggtthffoh
    hmrghinhculdegledmnegoteeftdduqddtudculdduhedmnecujfgurhephffvvefufffk
    ofgjfhgggfestdekredtredttdenucfhrhhomhepofgrrhhkucfrvggrrhhsohhnuceomh
    hpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrgeqnecuggftrfgrthhtvghr
    nhepveevfffhveefgfevvdetheejteegudekieejhefgteeitdeukeeigfffjeetleejne
    cuffhomhgrihhnpehlrghunhgthhhprggurdhnvghtpdhsohhurhgtvghfohhrghgvrdhn
    vghtpdhthhhinhhkfihikhhirdhorhhgpdhorhdrtgiipdhsfhdrnhgvthenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmphgvrghrshhonhdq
    lhgvnhhovhhosehsqhhuvggssgdrtggrpdhnsggprhgtphhtthhopeduvddpmhhouggvpe
    hsmhhtphhouhhtpdhrtghpthhtohepmhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgv
    sggsrdgtrgdprhgtphhtthhopehilhhpohdrjhgrrhhvihhnvghnsehlihhnuhigrdhinh
    htvghlrdgtohhmpdhrtghpthhtohephhguvghgohgvuggvsehrvgguhhgrthdrtghomhdp
    rhgtphhtthhopegtohhrsggvtheslhifnhdrnhgvthdprhgtphhtthhopehikhgvphgrnh
    hhtgesghhmrghilhdrtghomhdprhgtphhtthhopehhmhhhsehhmhhhrdgvnhhgrdgsrhdp
    rhgtphhtthhopeifpggrrhhmihhnsehgmhigrdguvgdprhgtphhtthhopegrnhgurhhihi
    drshhhvghvtghhvghnkhhosehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohep
    lhhinhhugidqughotgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:O9NGaNwGhpBLbmJfINxl-YowDVTHmhSMT7aKmIF0MeCRP3qruHtUiQ>
    <xmx:O9NGaARYTkofQpCt3HOo46iW65zqFdwwHrwEzSlqlKZv1s9g-BClHQ>
    <xmx:O9NGaAauBSNxODPRcQkPnDa0iGq4ig25oA0TH3jlx8-601hnw5Z_pQ>
    <xmx:O9NGaBQO6heO525waj3DgxTANjbtCUIEySReKIlnyEF54F9umfSZmQ>
    <xmx:PNNGaO10wtHxBPjfNogwgrqqGcQ3rlrAv3CWPjRhCT7iBU4ZMd4Ltgua>
Feedback-ID: ibe194615:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 9 Jun 2025 08:27:38 -0400 (EDT)
From: Mark Pearson <mpearson-lenovo@squebb.ca>
To: mpearson-lenovo@squebb.ca
Cc: ilpo.jarvinen@linux.intel.com,
	hdegoede@redhat.com,
	corbet@lwn.net,
	ikepanhc@gmail.com,
	hmh@hmh.eng.br,
	W_Armin@gmx.de,
	andriy.shevchenko@linux.intel.com,
	linux-doc@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] platform/x86: Move Lenovo files into lenovo subdir
Date: Mon,  9 Jun 2025 08:27:24 -0400
Message-ID: <20250609122736.3373471-1-mpearson-lenovo@squebb.ca>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <mpearson-lenovo@squebb.ca>
References: <mpearson-lenovo@squebb.ca>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Create lenovo subdirectory for holding Lenovo specific drivers.

Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
---
Changes in v3:
 - implement file naming as suggested by Andy Shevchenko
 - Removed documentation as not required
 - Added date to Makefile for improved clarity on split
 - Cosmetic clean ups.

Changes in v2:
 - Rebased to Linus's latest as requested
 - Updated documentation reference
 - Updated MAINTAINER file
 - Removed X86_PLATFORM_DRIVERS_LENOVO as I was worried about
   maintaining backwards compatibility for the distros.
 - Removed 2nd patch in series splitting out hkeys. That will be for
   the future

 MAINTAINERS                                   |  16 +-
 drivers/platform/x86/Kconfig                  | 229 +----------------
 drivers/platform/x86/Makefile                 |  13 +-
 drivers/platform/x86/lenovo/Kconfig           | 234 ++++++++++++++++++
 drivers/platform/x86/lenovo/Makefile          |  23 ++
 .../x86/{ => lenovo}/ideapad-laptop.c         |   0
 .../x86/{ => lenovo}/ideapad-laptop.h         |   0
 drivers/platform/x86/{ => lenovo}/think-lmi.c |   2 +-
 drivers/platform/x86/{ => lenovo}/think-lmi.h |   0
 .../platform/x86/{ => lenovo}/thinkpad_acpi.c |   2 +-
 .../wmi-camera.c}                             |   0
 .../wmi-hotkey-utilities.c}                   |   0
 .../x86/{lenovo-ymc.c => lenovo/ymc.c}        |   0
 .../yoga-tab2-pro-1380-fastcharger.c}         |   2 +-
 .../{lenovo-yogabook.c => lenovo/yogabook.c}  |   0
 15 files changed, 276 insertions(+), 245 deletions(-)
 create mode 100644 drivers/platform/x86/lenovo/Kconfig
 create mode 100644 drivers/platform/x86/lenovo/Makefile
 rename drivers/platform/x86/{ => lenovo}/ideapad-laptop.c (100%)
 rename drivers/platform/x86/{ => lenovo}/ideapad-laptop.h (100%)
 rename drivers/platform/x86/{ => lenovo}/think-lmi.c (99%)
 rename drivers/platform/x86/{ => lenovo}/think-lmi.h (100%)
 rename drivers/platform/x86/{ => lenovo}/thinkpad_acpi.c (99%)
 rename drivers/platform/x86/{lenovo-wmi-camera.c => lenovo/wmi-camera.c} (100%)
 rename drivers/platform/x86/{lenovo-wmi-hotkey-utilities.c => lenovo/wmi-hotkey-utilities.c} (100%)
 rename drivers/platform/x86/{lenovo-ymc.c => lenovo/ymc.c} (100%)
 rename drivers/platform/x86/{lenovo-yoga-tab2-pro-1380-fastcharger.c => lenovo/yoga-tab2-pro-1380-fastcharger.c} (99%)
 rename drivers/platform/x86/{lenovo-yogabook.c => lenovo/yogabook.c} (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 75da23034e18..f386fce7e5c7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11555,7 +11555,7 @@ M:	Ike Panhc <ikepanhc@gmail.com>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 W:	http://launchpad.net/ideapad-laptop
-F:	drivers/platform/x86/ideapad-laptop.c
+F:	drivers/platform/x86/lenovo/ideapad-laptop.c
 
 IDEAPAD LAPTOP SLIDEBAR DRIVER
 M:	Andrey Moiseev <o2g.org.ru@gmail.com>
@@ -13604,11 +13604,17 @@ S:	Maintained
 W:	http://legousb.sourceforge.net/
 F:	drivers/usb/misc/legousbtower.c
 
+LENOVO drivers
+M:	Mark Pearson <mpearson-lenovo@squebb.ca>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	drivers/platform/x86/lenovo/*
+
 LENOVO WMI HOTKEY UTILITIES DRIVER
 M:	Jackie Dong <xy-jackie@139.com>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
-F:	drivers/platform/x86/lenovo-wmi-hotkey-utilities.c
+F:	drivers/platform/x86/lenovo/lenovo-wmi-hotkey-utilities.c
 
 LETSKETCH HID TABLET DRIVER
 M:	Hans de Goede <hdegoede@redhat.com>
@@ -24538,14 +24544,14 @@ S:	Maintained
 W:	http://ibm-acpi.sourceforge.net
 W:	http://thinkwiki.org/wiki/Ibm-acpi
 T:	git git://repo.or.cz/linux-2.6/linux-acpi-2.6/ibm-acpi-2.6.git
-F:	drivers/platform/x86/thinkpad_acpi.c
+F:	drivers/platform/x86/lenovo/thinkpad_acpi.c
 
 THINKPAD LMI DRIVER
-M:	Mark Pearson <markpearson@lenovo.com>
+M:	Mark Pearson <mpearson-lenovo@squebb.ca>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	Documentation/ABI/testing/sysfs-class-firmware-attributes
-F:	drivers/platform/x86/think-lmi.?
+F:	drivers/platform/x86/lenovo/think-lmi.?
 
 THP7312 ISP DRIVER
 M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index e5cbd58a99f3..43055df44827 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -120,32 +120,6 @@ config GIGABYTE_WMI
 	  To compile this driver as a module, choose M here: the module will
 	  be called gigabyte-wmi.
 
-config YOGABOOK
-	tristate "Lenovo Yoga Book tablet key driver"
-	depends on ACPI_WMI
-	depends on INPUT
-	depends on I2C
-	select LEDS_CLASS
-	select NEW_LEDS
-	help
-	  Say Y here if you want to support the 'Pen' key and keyboard backlight
-	  control on the Lenovo Yoga Book tablets.
-
-	  To compile this driver as a module, choose M here: the module will
-	  be called lenovo-yogabook.
-
-config YT2_1380
-	tristate "Lenovo Yoga Tablet 2 1380 fast charge driver"
-	depends on SERIAL_DEV_BUS
-	depends on EXTCON
-	depends on ACPI
-	help
-	  Say Y here to enable support for the custom fast charging protocol
-	  found on the Lenovo Yoga Tablet 2 1380F / 1380L models.
-
-	  To compile this driver as a module, choose M here: the module will
-	  be called lenovo-yogabook.
-
 config ACERHDF
 	tristate "Acer Aspire One temperature and fan driver"
 	depends on ACPI_EC && THERMAL
@@ -459,43 +433,6 @@ config IBM_RTL
 	 state = 0 (BIOS SMIs on)
 	 state = 1 (BIOS SMIs off)
 
-config IDEAPAD_LAPTOP
-	tristate "Lenovo IdeaPad Laptop Extras"
-	depends on ACPI
-	depends on RFKILL && INPUT
-	depends on SERIO_I8042
-	depends on BACKLIGHT_CLASS_DEVICE
-	depends on ACPI_VIDEO || ACPI_VIDEO = n
-	depends on ACPI_WMI || ACPI_WMI = n
-	select ACPI_PLATFORM_PROFILE
-	select INPUT_SPARSEKMAP
-	select NEW_LEDS
-	select LEDS_CLASS
-	help
-	  This is a driver for Lenovo IdeaPad netbooks contains drivers for
-	  rfkill switch, hotkey, fan control and backlight control.
-
-config LENOVO_WMI_HOTKEY_UTILITIES
-	tristate "Lenovo Hotkey Utility WMI extras driver"
-	depends on ACPI_WMI
-	select NEW_LEDS
-	select LEDS_CLASS
-	imply IDEAPAD_LAPTOP
-	help
-	  This driver provides WMI support for Lenovo customized hotkeys function,
-	  such as LED control for audio/mic mute event for Ideapad, YOGA, XiaoXin,
-	  Gaming, ThinkBook and so on.
-
-config LENOVO_YMC
-	tristate "Lenovo Yoga Tablet Mode Control"
-	depends on ACPI_WMI
-	depends on INPUT
-	depends on IDEAPAD_LAPTOP
-	select INPUT_SPARSEKMAP
-	help
-	  This driver maps the Tablet Mode Control switch to SW_TABLET_MODE input
-	  events for Lenovo Yoga notebooks.
-
 config SENSORS_HDAPS
 	tristate "Thinkpad Hard Drive Active Protection System (hdaps)"
 	depends on INPUT
@@ -514,160 +451,8 @@ config SENSORS_HDAPS
 	  Say Y here if you have an applicable laptop and want to experience
 	  the awesome power of hdaps.
 
-config THINKPAD_ACPI
-	tristate "ThinkPad ACPI Laptop Extras"
-	depends on ACPI_EC
-	depends on ACPI_BATTERY
-	depends on INPUT
-	depends on RFKILL || RFKILL = n
-	depends on ACPI_VIDEO || ACPI_VIDEO = n
-	depends on BACKLIGHT_CLASS_DEVICE
-	depends on I2C
-	depends on DRM
-	select ACPI_PLATFORM_PROFILE
-	select DRM_PRIVACY_SCREEN
-	select HWMON
-	select NVRAM
-	select NEW_LEDS
-	select LEDS_CLASS
-	select INPUT_SPARSEKMAP
-	help
-	  This is a driver for the IBM and Lenovo ThinkPad laptops. It adds
-	  support for Fn-Fx key combinations, Bluetooth control, video
-	  output switching, ThinkLight control, UltraBay eject and more.
-	  For more information about this driver see
-	  <file:Documentation/admin-guide/laptops/thinkpad-acpi.rst> and
-	  <http://ibm-acpi.sf.net/> .
-
-	  This driver was formerly known as ibm-acpi.
-
-	  Extra functionality will be available if the rfkill (CONFIG_RFKILL)
-	  and/or ALSA (CONFIG_SND) subsystems are available in the kernel.
-	  Note that if you want ThinkPad-ACPI to be built-in instead of
-	  modular, ALSA and rfkill will also have to be built-in.
-
-	  If you have an IBM or Lenovo ThinkPad laptop, say Y or M here.
-
-config THINKPAD_ACPI_ALSA_SUPPORT
-	bool "Console audio control ALSA interface"
-	depends on THINKPAD_ACPI
-	depends on SND
-	depends on SND = y || THINKPAD_ACPI = SND
-	default y
-	help
-	  Enables monitoring of the built-in console audio output control
-	  (headphone and speakers), which is operated by the mute and (in
-	  some ThinkPad models) volume hotkeys.
-
-	  If this option is enabled, ThinkPad-ACPI will export an ALSA card
-	  with a single read-only mixer control, which should be used for
-	  on-screen-display feedback purposes by the Desktop Environment.
-
-	  Optionally, the driver will also allow software control (the
-	  ALSA mixer will be made read-write).  Please refer to the driver
-	  documentation for details.
-
-	  All IBM models have both volume and mute control.  Newer Lenovo
-	  models only have mute control (the volume hotkeys are just normal
-	  keys and volume control is done through the main HDA mixer).
-
-config THINKPAD_ACPI_DEBUGFACILITIES
-	bool "Maintainer debug facilities"
-	depends on THINKPAD_ACPI
-	help
-	  Enables extra stuff in the thinkpad-acpi which is completely useless
-	  for normal use.  Read the driver source to find out what it does.
-
-	  Say N here, unless you were told by a kernel maintainer to do
-	  otherwise.
-
-config THINKPAD_ACPI_DEBUG
-	bool "Verbose debug mode"
-	depends on THINKPAD_ACPI
-	help
-	  Enables extra debugging information, at the expense of a slightly
-	  increase in driver size.
-
-	  If you are not sure, say N here.
-
-config THINKPAD_ACPI_UNSAFE_LEDS
-	bool "Allow control of important LEDs (unsafe)"
-	depends on THINKPAD_ACPI
-	help
-	  Overriding LED state on ThinkPads can mask important
-	  firmware alerts (like critical battery condition), or misled
-	  the user into damaging the hardware (undocking or ejecting
-	  the bay while buses are still active), etc.
-
-	  LED control on the ThinkPad is write-only (with very few
-	  exceptions on very ancient models), which makes it
-	  impossible to know beforehand if important information will
-	  be lost when one changes LED state.
-
-	  Users that know what they are doing can enable this option
-	  and the driver will allow control of every LED, including
-	  the ones on the dock stations.
-
-	  Never enable this option on a distribution kernel.
-
-	  Say N here, unless you are building a kernel for your own
-	  use, and need to control the important firmware LEDs.
-
-config THINKPAD_ACPI_VIDEO
-	bool "Video output control support"
-	depends on THINKPAD_ACPI
-	default y
-	help
-	  Allows the thinkpad_acpi driver to provide an interface to control
-	  the various video output ports.
-
-	  This feature often won't work well, depending on ThinkPad model,
-	  display state, video output devices in use, whether there is a X
-	  server running, phase of the moon, and the current mood of
-	  Schroedinger's cat.  If you can use X.org's RandR to control
-	  your ThinkPad's video output ports instead of this feature,
-	  don't think twice: do it and say N here to save memory and avoid
-	  bad interactions with X.org.
-
-	  NOTE: access to this feature is limited to processes with the
-	  CAP_SYS_ADMIN capability, to avoid local DoS issues in platforms
-	  where it interacts badly with X.org.
-
-	  If you are not sure, say Y here but do try to check if you could
-	  be using X.org RandR instead.
-
-config THINKPAD_ACPI_HOTKEY_POLL
-	bool "Support NVRAM polling for hot keys"
-	depends on THINKPAD_ACPI
-	default y
-	help
-	  Some thinkpad models benefit from NVRAM polling to detect a few of
-	  the hot key press events.  If you know your ThinkPad model does not
-	  need to do NVRAM polling to support any of the hot keys you use,
-	  unselecting this option will save about 1kB of memory.
-
-	  ThinkPads T40 and newer, R52 and newer, and X31 and newer are
-	  unlikely to need NVRAM polling in their latest BIOS versions.
-
-	  NVRAM polling can detect at most the following keys: ThinkPad/Access
-	  IBM, Zoom, Switch Display (fn+F7), ThinkLight, Volume up/down/mute,
-	  Brightness up/down, Display Expand (fn+F8), Hibernate (fn+F12).
-
-	  If you are not sure, say Y here.  The driver enables polling only if
-	  it is strictly necessary to do so.
-
-config THINKPAD_LMI
-	tristate "Lenovo WMI-based systems management driver"
-	depends on ACPI_WMI
-	select FW_ATTR_CLASS
-	help
-	  This driver allows changing BIOS settings on Lenovo machines whose
-	  BIOS support the WMI interface.
-
-	  To compile this driver as a module, choose M here: the module will
-	  be called think-lmi.
-
 source "drivers/platform/x86/intel/Kconfig"
+source "drivers/platform/x86/lenovo/Kconfig"
 
 config ACPI_QUICKSTART
 	tristate "ACPI Quickstart button driver"
@@ -1078,18 +863,6 @@ config INSPUR_PLATFORM_PROFILE
 	To compile this driver as a module, choose M here: the module
 	will be called inspur-platform-profile.
 
-config LENOVO_WMI_CAMERA
-	tristate "Lenovo WMI Camera Button driver"
-	depends on ACPI_WMI
-	depends on INPUT
-	help
-	  This driver provides support for Lenovo camera button. The Camera
-	  button is a GPIO device. This driver receives ACPI notifications when
-	  the camera button is switched on/off.
-
-	  To compile this driver as a module, choose M here: the module
-	  will be called lenovo-wmi-camera.
-
 config DASHARO_ACPI
 	tristate "Dasharo ACPI Platform Driver"
 	depends on ACPI
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index abbc2644ff6d..0530a224bebd 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -58,17 +58,12 @@ obj-$(CONFIG_X86_PLATFORM_DRIVERS_HP)	+= hp/
 # Hewlett Packard Enterprise
 obj-$(CONFIG_UV_SYSFS)       += uv_sysfs.o
 
-# IBM Thinkpad and Lenovo
+# IBM Thinkpad (before 2005)
 obj-$(CONFIG_IBM_RTL)		+= ibm_rtl.o
-obj-$(CONFIG_IDEAPAD_LAPTOP)	+= ideapad-laptop.o
-obj-$(CONFIG_LENOVO_WMI_HOTKEY_UTILITIES)	+= lenovo-wmi-hotkey-utilities.o
-obj-$(CONFIG_LENOVO_YMC)	+= lenovo-ymc.o
 obj-$(CONFIG_SENSORS_HDAPS)	+= hdaps.o
-obj-$(CONFIG_THINKPAD_ACPI)	+= thinkpad_acpi.o
-obj-$(CONFIG_THINKPAD_LMI)	+= think-lmi.o
-obj-$(CONFIG_YOGABOOK)		+= lenovo-yogabook.o
-obj-$(CONFIG_YT2_1380)		+= lenovo-yoga-tab2-pro-1380-fastcharger.o
-obj-$(CONFIG_LENOVO_WMI_CAMERA)	+= lenovo-wmi-camera.o
+
+# Lenovo
+obj-y				+= lenovo/
 
 # Intel
 obj-y				+= intel/
diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x86/lenovo/Kconfig
new file mode 100644
index 000000000000..a4b565283768
--- /dev/null
+++ b/drivers/platform/x86/lenovo/Kconfig
@@ -0,0 +1,234 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Lenovo X86 Platform Specific Drivers
+#
+
+config IDEAPAD_LAPTOP
+	tristate "Lenovo IdeaPad Laptop Extras"
+	depends on ACPI
+	depends on RFKILL && INPUT
+	depends on SERIO_I8042
+	depends on BACKLIGHT_CLASS_DEVICE
+	depends on ACPI_VIDEO || ACPI_VIDEO = n
+	depends on ACPI_WMI || ACPI_WMI = n
+	select ACPI_PLATFORM_PROFILE
+	select INPUT_SPARSEKMAP
+	select NEW_LEDS
+	select LEDS_CLASS
+	help
+	  This is a driver for Lenovo IdeaPad netbooks contains drivers for
+	  rfkill switch, hotkey, fan control and backlight control.
+
+config LENOVO_WMI_HOTKEY_UTILITIES
+	tristate "Lenovo Hotkey Utility WMI extras driver"
+	depends on ACPI_WMI
+	select NEW_LEDS
+	select LEDS_CLASS
+	imply IDEAPAD_LAPTOP
+	help
+	  This driver provides WMI support for Lenovo customized hotkeys function,
+	  such as LED control for audio/mic mute event for Ideapad, YOGA, XiaoXin,
+	  Gaming, ThinkBook and so on.
+
+config LENOVO_WMI_CAMERA
+	tristate "Lenovo WMI Camera Button driver"
+	depends on ACPI_WMI
+	depends on INPUT
+	help
+	  This driver provides support for Lenovo camera button. The Camera
+	  button is a GPIO device. This driver receives ACPI notifications when
+	  the camera button is switched on/off.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called lenovo-wmi-camera.
+
+config LENOVO_YMC
+	tristate "Lenovo Yoga Tablet Mode Control"
+	depends on ACPI_WMI
+	depends on INPUT
+	depends on IDEAPAD_LAPTOP
+	select INPUT_SPARSEKMAP
+	help
+	  This driver maps the Tablet Mode Control switch to SW_TABLET_MODE input
+	  events for Lenovo Yoga notebooks.
+
+config THINKPAD_ACPI
+	tristate "ThinkPad ACPI Laptop Extras"
+	depends on ACPI_EC
+	depends on ACPI_BATTERY
+	depends on INPUT
+	depends on RFKILL || RFKILL = n
+	depends on ACPI_VIDEO || ACPI_VIDEO = n
+	depends on BACKLIGHT_CLASS_DEVICE
+	depends on I2C
+	depends on DRM
+	select ACPI_PLATFORM_PROFILE
+	select DRM_PRIVACY_SCREEN
+	select HWMON
+	select NVRAM
+	select NEW_LEDS
+	select LEDS_CLASS
+	select INPUT_SPARSEKMAP
+	help
+	  This is a driver for the IBM and Lenovo ThinkPad laptops. It adds
+	  support for Fn-Fx key combinations, Bluetooth control, video
+	  output switching, ThinkLight control, UltraBay eject and more.
+	  For more information about this driver see
+	  <file:Documentation/admin-guide/laptops/thinkpad-acpi.rst> and
+	  <http://ibm-acpi.sf.net/> .
+
+	  This driver was formerly known as ibm-acpi.
+
+	  Extra functionality will be available if the rfkill (CONFIG_RFKILL)
+	  and/or ALSA (CONFIG_SND) subsystems are available in the kernel.
+	  Note that if you want ThinkPad-ACPI to be built-in instead of
+	  modular, ALSA and rfkill will also have to be built-in.
+
+	  If you have an IBM or Lenovo ThinkPad laptop, say Y or M here.
+
+config THINKPAD_ACPI_ALSA_SUPPORT
+	bool "Console audio control ALSA interface"
+	depends on THINKPAD_ACPI
+	depends on SND
+	depends on SND = y || THINKPAD_ACPI = SND
+	default y
+	help
+	  Enables monitoring of the built-in console audio output control
+	  (headphone and speakers), which is operated by the mute and (in
+	  some ThinkPad models) volume hotkeys.
+
+	  If this option is enabled, ThinkPad-ACPI will export an ALSA card
+	  with a single read-only mixer control, which should be used for
+	  on-screen-display feedback purposes by the Desktop Environment.
+
+	  Optionally, the driver will also allow software control (the
+	  ALSA mixer will be made read-write).  Please refer to the driver
+	  documentation for details.
+
+	  All IBM models have both volume and mute control.  Newer Lenovo
+	  models only have mute control (the volume hotkeys are just normal
+	  keys and volume control is done through the main HDA mixer).
+
+config THINKPAD_ACPI_DEBUGFACILITIES
+	bool "Maintainer debug facilities"
+	depends on THINKPAD_ACPI
+	help
+	  Enables extra stuff in the thinkpad-acpi which is completely useless
+	  for normal use.  Read the driver source to find out what it does.
+
+	  Say N here, unless you were told by a kernel maintainer to do
+	  otherwise.
+
+config THINKPAD_ACPI_DEBUG
+	bool "Verbose debug mode"
+	depends on THINKPAD_ACPI
+	help
+	  Enables extra debugging information, at the expense of a slightly
+	  increase in driver size.
+
+	  If you are not sure, say N here.
+
+config THINKPAD_ACPI_UNSAFE_LEDS
+	bool "Allow control of important LEDs (unsafe)"
+	depends on THINKPAD_ACPI
+	help
+	  Overriding LED state on ThinkPads can mask important
+	  firmware alerts (like critical battery condition), or misled
+	  the user into damaging the hardware (undocking or ejecting
+	  the bay while buses are still active), etc.
+
+	  LED control on the ThinkPad is write-only (with very few
+	  exceptions on very ancient models), which makes it
+	  impossible to know beforehand if important information will
+	  be lost when one changes LED state.
+
+	  Users that know what they are doing can enable this option
+	  and the driver will allow control of every LED, including
+	  the ones on the dock stations.
+
+	  Never enable this option on a distribution kernel.
+
+	  Say N here, unless you are building a kernel for your own
+	  use, and need to control the important firmware LEDs.
+
+config THINKPAD_ACPI_VIDEO
+	bool "Video output control support"
+	depends on THINKPAD_ACPI
+	default y
+	help
+	  Allows the thinkpad_acpi driver to provide an interface to control
+	  the various video output ports.
+
+	  This feature often won't work well, depending on ThinkPad model,
+	  display state, video output devices in use, whether there is a X
+	  server running, phase of the moon, and the current mood of
+	  Schroedinger's cat.  If you can use X.org's RandR to control
+	  your ThinkPad's video output ports instead of this feature,
+	  don't think twice: do it and say N here to save memory and avoid
+	  bad interactions with X.org.
+
+	  NOTE: access to this feature is limited to processes with the
+	  CAP_SYS_ADMIN capability, to avoid local DoS issues in platforms
+	  where it interacts badly with X.org.
+
+	  If you are not sure, say Y here but do try to check if you could
+	  be using X.org RandR instead.
+
+config THINKPAD_ACPI_HOTKEY_POLL
+	bool "Support NVRAM polling for hot keys"
+	depends on THINKPAD_ACPI
+	default y
+	help
+	  Some thinkpad models benefit from NVRAM polling to detect a few of
+	  the hot key press events.  If you know your ThinkPad model does not
+	  need to do NVRAM polling to support any of the hot keys you use,
+	  unselecting this option will save about 1kB of memory.
+
+	  ThinkPads T40 and newer, R52 and newer, and X31 and newer are
+	  unlikely to need NVRAM polling in their latest BIOS versions.
+
+	  NVRAM polling can detect at most the following keys: ThinkPad/Access
+	  IBM, Zoom, Switch Display (fn+F7), ThinkLight, Volume up/down/mute,
+	  Brightness up/down, Display Expand (fn+F8), Hibernate (fn+F12).
+
+	  If you are not sure, say Y here.  The driver enables polling only if
+	  it is strictly necessary to do so.
+
+config THINKPAD_LMI
+	tristate "Lenovo WMI-based systems management driver"
+	depends on ACPI_WMI
+	select FW_ATTR_CLASS
+	help
+	  This driver allows changing BIOS settings on Lenovo machines whose
+	  BIOS support the WMI interface.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called think-lmi.
+
+config YOGABOOK
+	tristate "Lenovo Yoga Book tablet key driver"
+	depends on ACPI_WMI
+	depends on INPUT
+	depends on I2C
+	select LEDS_CLASS
+	select NEW_LEDS
+	help
+	  Say Y here if you want to support the 'Pen' key and keyboard backlight
+	  control on the Lenovo Yoga Book tablets.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called lenovo-yogabook.
+
+config YT2_1380
+	tristate "Lenovo Yoga Tablet 2 1380 fast charge driver"
+	depends on SERIAL_DEV_BUS
+	depends on EXTCON
+	depends on ACPI
+	help
+	  Say Y here to enable support for the custom fast charging protocol
+	  found on the Lenovo Yoga Tablet 2 1380F / 1380L models.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called lenovo-yogabook.
+
+
diff --git a/drivers/platform/x86/lenovo/Makefile b/drivers/platform/x86/lenovo/Makefile
new file mode 100644
index 000000000000..f1aa2449293b
--- /dev/null
+++ b/drivers/platform/x86/lenovo/Makefile
@@ -0,0 +1,23 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Makefile for linux/drivers/platform/x86/lenovo
+# Lenovo x86 Platform Specific Drivers
+#
+obj-$(CONFIG_IDEAPAD_LAPTOP)	+= ideapad-laptop.o
+obj-$(CONFIG_THINKPAD_LMI)	+= think-lmi.o
+obj-$(CONFIG_THINKPAD_ACPI)	+= thinkpad_acpi.o
+
+lenovo-target-$(CONFIG_LENOVO_WMI_HOTKEY_UTILITIES)	+= wmi-hotkey-utilities.o
+lenovo-target-$(CONFIG_LENOVO_YMC)	+= ymc.o
+lenovo-target-$(CONFIG_YOGABOOK)	+= yogabook.o
+lenovo-target-$(CONFIG_YT2_1380)	+= yoga-tab2-pro-1380-fastcharger.o
+lenovo-target-$(CONFIG_LENOVO_WMI_CAMERA)	+= wmi-camera.o
+
+# Add 'lenovo' prefix to each module listed in lenovo-target-*
+define LENOVO_OBJ_TARGET
+lenovo-$(1)-y := $(1).o
+obj-$(2) += lenovo-$(1).o
+endef
+
+$(foreach target, $(basename $(lenovo-target-y)), $(eval $(call LENOVO_OBJ_TARGET,$(target),y)))
+$(foreach target, $(basename $(lenovo-target-m)), $(eval $(call LENOVO_OBJ_TARGET,$(target),m)))
diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/lenovo/ideapad-laptop.c
similarity index 100%
rename from drivers/platform/x86/ideapad-laptop.c
rename to drivers/platform/x86/lenovo/ideapad-laptop.c
diff --git a/drivers/platform/x86/ideapad-laptop.h b/drivers/platform/x86/lenovo/ideapad-laptop.h
similarity index 100%
rename from drivers/platform/x86/ideapad-laptop.h
rename to drivers/platform/x86/lenovo/ideapad-laptop.h
diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/lenovo/think-lmi.c
similarity index 99%
rename from drivers/platform/x86/think-lmi.c
rename to drivers/platform/x86/lenovo/think-lmi.c
index 00b1e7c79a3d..143d9fdedb65 100644
--- a/drivers/platform/x86/think-lmi.c
+++ b/drivers/platform/x86/lenovo/think-lmi.c
@@ -20,7 +20,7 @@
 #include <linux/types.h>
 #include <linux/dmi.h>
 #include <linux/wmi.h>
-#include "firmware_attributes_class.h"
+#include "../firmware_attributes_class.h"
 #include "think-lmi.h"
 
 static bool debug_support;
diff --git a/drivers/platform/x86/think-lmi.h b/drivers/platform/x86/lenovo/think-lmi.h
similarity index 100%
rename from drivers/platform/x86/think-lmi.h
rename to drivers/platform/x86/lenovo/think-lmi.h
diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
similarity index 99%
rename from drivers/platform/x86/thinkpad_acpi.c
rename to drivers/platform/x86/lenovo/thinkpad_acpi.c
index e7350c9fa3aa..e1c7bd06fa12 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -81,7 +81,7 @@
 #include <sound/core.h>
 #include <sound/initval.h>
 
-#include "dual_accel_detect.h"
+#include "../dual_accel_detect.h"
 
 /* ThinkPad CMOS commands */
 #define TP_CMOS_VOLUME_DOWN	0
diff --git a/drivers/platform/x86/lenovo-wmi-camera.c b/drivers/platform/x86/lenovo/wmi-camera.c
similarity index 100%
rename from drivers/platform/x86/lenovo-wmi-camera.c
rename to drivers/platform/x86/lenovo/wmi-camera.c
diff --git a/drivers/platform/x86/lenovo-wmi-hotkey-utilities.c b/drivers/platform/x86/lenovo/wmi-hotkey-utilities.c
similarity index 100%
rename from drivers/platform/x86/lenovo-wmi-hotkey-utilities.c
rename to drivers/platform/x86/lenovo/wmi-hotkey-utilities.c
diff --git a/drivers/platform/x86/lenovo-ymc.c b/drivers/platform/x86/lenovo/ymc.c
similarity index 100%
rename from drivers/platform/x86/lenovo-ymc.c
rename to drivers/platform/x86/lenovo/ymc.c
diff --git a/drivers/platform/x86/lenovo-yoga-tab2-pro-1380-fastcharger.c b/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c
similarity index 99%
rename from drivers/platform/x86/lenovo-yoga-tab2-pro-1380-fastcharger.c
rename to drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c
index 25933cd018d1..b3fd6a35052a 100644
--- a/drivers/platform/x86/lenovo-yoga-tab2-pro-1380-fastcharger.c
+++ b/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c
@@ -21,7 +21,7 @@
 #include <linux/time.h>
 #include <linux/types.h>
 #include <linux/workqueue.h>
-#include "serdev_helpers.h"
+#include "../serdev_helpers.h"
 
 #define YT2_1380_FC_PDEV_NAME		"lenovo-yoga-tab2-pro-1380-fastcharger"
 #define YT2_1380_FC_SERDEV_CTRL		"serial0"
diff --git a/drivers/platform/x86/lenovo-yogabook.c b/drivers/platform/x86/lenovo/yogabook.c
similarity index 100%
rename from drivers/platform/x86/lenovo-yogabook.c
rename to drivers/platform/x86/lenovo/yogabook.c
-- 
2.43.0

