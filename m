Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A231CF5C6;
	Wed,  7 May 2025 19:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746644715; cv=none; b=PPIzuBxU0p1O033iN0v5NRyzF4VWHvRnJ17hr4C8xVEkqYxdYfEjJBagU87VRzGXlLJ89T9nL54FJF2WkW2AyU4t7Cs17+f07ie65QzY7bj/LQtzzLOYc67bwPFC1WfyEHgrlSpQVonAJY2wawy6cb5H0RYvbTZGmH7aE//TgPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746644715; c=relaxed/simple;
	bh=OzIGbmd/EnaPPsFRHRvLtEP27OZNl4GkGphc+sbJ0yI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DttZMvK9CfeLupSU8QqXccN9SuD1jQHPwy6TVQwO3II5dzZGsNxU6WfKo7BAXjq6tOy06AuVi64CWqMUhbA2JTK01jHatTVgr26VBLEYZFGuoKkA+AsB4DpKJt4m/uuUf0yphvSNt4rwEL7uqwWM15JSkDsO1SzK/VRNex6m3K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=hmQkD6Z2; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=r+Jg1L32; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="hmQkD6Z2";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="r+Jg1L32"
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 4F84C2540142;
	Wed,  7 May 2025 15:05:10 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Wed, 07 May 2025 15:05:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1746644710; x=
	1746731110; bh=EJluX69AUKrWYLmUdPIMLqYY7gZyKg54+v1dt+WrE6I=; b=h
	mQkD6Z2r+2qv0m3t0T0xRHqN9aFnJtn22RCMLU8InpxxrcKe+qsbqY4glxTA0B0O
	wlGCPWgXqMD+sP4mLvdK4v3SG+zIbDcMI89wMqXVGZMd1HDPtIrsoojpzSJavQJj
	Qa2KsJLcEBuUv7+Ia845AbT/xlrKg6aJnFLN9lzvC1pDzCRRGwLQjANgNJn5ru1x
	ECJfrmKNwbJ2YiHywyjhP8EhbuGyxer10eXBSyEVsmihexKwT1A09zpxXBylZiDp
	Apyh3Ue2azAy/tsp+ogvyyT1teBjzwX7g/jtCVisQovUjR9vwORMgQjsc3ZsqpUK
	Xh2cXNnPS4cA/jfLcIjPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1746644710; x=1746731110; bh=E
	JluX69AUKrWYLmUdPIMLqYY7gZyKg54+v1dt+WrE6I=; b=r+Jg1L328ksMH8+IO
	izi0fjpJEdxw1lHpv1eP2x84OgqQay0xjfiFXkw5jiiHQMM8BrSmCLIVNJBNjZ08
	2ZexlBOrgiCui9El4N2YPd676r0uA/7oMevZhwGHMq4+SO/j9MTy4JYD6yDIPcuc
	nNnUSRvvxXTocHzQa1BVVT6u60RhuiW+K7NG5Y59U1KsyRcFvIhTsU+ySb3ens2p
	hATuJB+eTjq4H4fz93SezYRNRph6GfWcu0sjaS1Z3mVemWlQ8DrNbSykLfvzoTwW
	jzK5mSTDAZXjbeQp7jJsEcMW1D03qc+mGyXGjqot7VLqc4rMmwyJ0Lc0EExj8qM4
	4Re2g==
X-ME-Sender: <xms:5a4baAtG8QXP5fm7jxu_hNOgTVEc1VgQ8YsJGjo99b9b2cJoSRc4bg>
    <xme:5a4baNfQwrCb3vzQK9VMPFUVDQ_JeRErX2Pf07lXCug0Pv71QRaJW98Mu341ZGW6a
    XtYsLUDZE-nScElDfY>
X-ME-Received: <xmr:5a4baLxtKDqT_0Z-o2IHG4Aw5xjw-Bs7cXrNW_srBXQcup-ROltNj5wRp8bqUTdeg1Zi1bpik6uiHeJCRodvszZLWo2zeyRsBv5-V1vcwR8pXmImOA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeejieehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucgoteeftdduqddtud
    culdduhedmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhho
    mhepofgrrhhkucfrvggrrhhsohhnuceomhhpvggrrhhsohhnqdhlvghnohhvohesshhquh
    gvsggsrdgtrgeqnecuggftrfgrthhtvghrnhepuefggedvvdehueekkeetgeeutdfhgefg
    fedutdegvdfgfeehjedthfelvdekgeetnecuffhomhgrihhnpehsfhdrnhgvthenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmphgvrghrshho
    nhdqlhgvnhhovhhosehsqhhuvggssgdrtggrpdhnsggprhgtphhtthhopeelpdhmohguvg
    epshhmthhpohhuthdprhgtphhtthhopehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhu
    vggssgdrtggrpdhrtghpthhtohephhguvghgohgvuggvsehrvgguhhgrthdrtghomhdprh
    gtphhtthhopehilhhpohdrjhgrrhhvihhnvghnsehlihhnuhigrdhinhhtvghlrdgtohhm
    pdhrtghpthhtohepihhkvghprghnhhgtsehgmhgrihhlrdgtohhmpdhrtghpthhtohepfi
    gprghrmhhinhesghhmgidruggvpdhrtghpthhtoheprghnughrihihrdhshhgvvhgthhgv
    nhhkoheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvg
    hrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehplhgrthhfohhr
    mhdqughrihhvvghrqdigkeeisehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    epihgsmhdqrggtphhiqdguvghvvghlsehlihhsthhsrdhsohhurhgtvghfohhrghgvrdhn
    vght
X-ME-Proxy: <xmx:5a4baDMNAYwZocRByIlGXlNcVuHY2Xt69rI8C15v7d_RhjkomQ2WKA>
    <xmx:5a4baA81li9At3v3ltcPYpP5n10-fIhsS_tjmA21RGU_TF_5UvkTcw>
    <xmx:5a4baLWtWqPufji5g-9SV2jKdQjzlQ5DYAQzmlcT70bnPJnitsIf5Q>
    <xmx:5a4baJclJpF1LvcyO8djHtt7HHMntrfo0HWTPr75E7tiCWVOmfAN2A>
    <xmx:5q4baGbg4KIz8lRfJLCk9fywbN0BiyU9FKQtuYSiNtNCJRDnC-QRib_3>
Feedback-ID: ibe194615:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 May 2025 15:05:09 -0400 (EDT)
From: Mark Pearson <mpearson-lenovo@squebb.ca>
To: mpearson-lenovo@squebb.ca
Cc: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	ikepanhc@gmail.com,
	W_Armin@gmx.de,
	andriy.shevchenko@linux.intel.com,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net
Subject: [PATCH 1/2] platform/x86: Move Lenovo files into lenovo subdir
Date: Wed,  7 May 2025 15:04:34 -0400
Message-ID: <20250507190456.3004367-1-mpearson-lenovo@squebb.ca>
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

Move all Lenovo specific files into their own sub-directory as part
of clean-up exercise.
Longer term goal is to break-up thinkpad_acpi to improve maintainability
and perhaps share more functionality with other non thinkpad Lenovo
platforms.

Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
---
Some questions that I didn't want to put in the commit comment:

 - I didn't know if now was a good time to propose this change. I
   realise it could cause headaches for anybody with patches being
   worked on. Please let me know what makes it easiest for maintainers
   and other developers. If there is a particular branch that would be
   better to do this against also let me know.
 - Should I be updating the MAINTAINERS file? I'm still not sure what
   the protocol there is. I'm very happy to help review anything in the
   lenovo directory, but I didn't want to make assumptions.
 - I have tested on multiple platforms but I don't have any ideapads I
   can use.

 drivers/platform/x86/Kconfig                  | 229 +---------------
 drivers/platform/x86/Makefile                 |  13 +-
 drivers/platform/x86/lenovo/Kconfig           | 246 ++++++++++++++++++
 drivers/platform/x86/lenovo/Makefile          |  16 ++
 .../x86/{ => lenovo}/ideapad-laptop.c         |   0
 .../x86/{ => lenovo}/ideapad-laptop.h         |   0
 .../x86/{ => lenovo}/lenovo-wmi-camera.c      |   0
 .../lenovo-wmi-hotkey-utilities.c             |   0
 .../platform/x86/{ => lenovo}/lenovo-ymc.c    |   0
 .../lenovo-yoga-tab2-pro-1380-fastcharger.c   |   2 +-
 .../x86/{ => lenovo}/lenovo-yogabook.c        |   0
 drivers/platform/x86/{ => lenovo}/think-lmi.c |   2 +-
 drivers/platform/x86/{ => lenovo}/think-lmi.h |   0
 .../platform/x86/{ => lenovo}/thinkpad_acpi.c |   2 +-
 14 files changed, 270 insertions(+), 240 deletions(-)
 create mode 100644 drivers/platform/x86/lenovo/Kconfig
 create mode 100644 drivers/platform/x86/lenovo/Makefile
 rename drivers/platform/x86/{ => lenovo}/ideapad-laptop.c (100%)
 rename drivers/platform/x86/{ => lenovo}/ideapad-laptop.h (100%)
 rename drivers/platform/x86/{ => lenovo}/lenovo-wmi-camera.c (100%)
 rename drivers/platform/x86/{ => lenovo}/lenovo-wmi-hotkey-utilities.c (100%)
 rename drivers/platform/x86/{ => lenovo}/lenovo-ymc.c (100%)
 rename drivers/platform/x86/{ => lenovo}/lenovo-yoga-tab2-pro-1380-fastcharger.c (99%)
 rename drivers/platform/x86/{ => lenovo}/lenovo-yogabook.c (100%)
 rename drivers/platform/x86/{ => lenovo}/think-lmi.c (99%)
 rename drivers/platform/x86/{ => lenovo}/think-lmi.h (100%)
 rename drivers/platform/x86/{ => lenovo}/thinkpad_acpi.c (99%)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 43407e76476b..20b61b658e88 100644
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
@@ -1063,18 +848,6 @@ config INSPUR_PLATFORM_PROFILE
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
 source "drivers/platform/x86/x86-android-tablets/Kconfig"
 
 config FW_ATTR_CLASS
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 650dfbebb6c8..dae9dbb2ac94 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -58,21 +58,16 @@ obj-$(CONFIG_X86_PLATFORM_DRIVERS_HP)	+= hp/
 # Hewlett Packard Enterprise
 obj-$(CONFIG_UV_SYSFS)       += uv_sysfs.o
 
-# IBM Thinkpad and Lenovo
+# IBM Thinkpad
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
 
 # Intel
 obj-y				+= intel/
 
+# Lenovo
+obj-y				+= lenovo/
+
 # Microsoft
 obj-$(CONFIG_ACPI_QUICKSTART)  += quickstart.o
 
diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x86/lenovo/Kconfig
new file mode 100644
index 000000000000..1c6e609cef6d
--- /dev/null
+++ b/drivers/platform/x86/lenovo/Kconfig
@@ -0,0 +1,246 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Lenovo X86 Platform Specific Drivers
+#
+
+menuconfig X86_PLATFORM_DRIVERS_LENOVO
+	bool "Lenovo X86 Platform Specific Device Drivers"
+	help
+	  Say Y here to get to see options for device drivers for various
+	  Lenovo x86 platforms, including vendor-specific laptop extension drivers.
+	  This option alone does not add any kernel code.
+
+	  If you say N, all options in this submenu will be skipped and disabled.
+
+if X86_PLATFORM_DRIVERS_LENOVO
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
+endif # X86_PLATFORM_DRIVERS_LENOVO
+
diff --git a/drivers/platform/x86/lenovo/Makefile b/drivers/platform/x86/lenovo/Makefile
new file mode 100644
index 000000000000..f3290d9c6fd6
--- /dev/null
+++ b/drivers/platform/x86/lenovo/Makefile
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Makefile for linux/drivers/platform/x86/lenovo
+# Lenovo x86 Platform-Specific Drivers
+#
+obj-$(CONFIG_IDEAPAD_LAPTOP)	+= ideapad-laptop.o
+obj-$(CONFIG_LENOVO_WMI_HOTKEY_UTILITIES)	+= lenovo-wmi-hotkey-utilities.o
+obj-$(CONFIG_LENOVO_YMC)	+= lenovo-ymc.o
+obj-$(CONFIG_THINKPAD_ACPI)	+= thinkpad_acpi.o
+obj-$(CONFIG_THINKPAD_LMI)	+= think-lmi.o
+obj-$(CONFIG_YOGABOOK)		+= lenovo-yogabook.o
+obj-$(CONFIG_YT2_1380)		+= lenovo-yoga-tab2-pro-1380-fastcharger.o
+obj-$(CONFIG_LENOVO_WMI_CAMERA)	+= lenovo-wmi-camera.o
+
+
+
diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/lenovo/ideapad-laptop.c
similarity index 100%
rename from drivers/platform/x86/ideapad-laptop.c
rename to drivers/platform/x86/lenovo/ideapad-laptop.c
diff --git a/drivers/platform/x86/ideapad-laptop.h b/drivers/platform/x86/lenovo/ideapad-laptop.h
similarity index 100%
rename from drivers/platform/x86/ideapad-laptop.h
rename to drivers/platform/x86/lenovo/ideapad-laptop.h
diff --git a/drivers/platform/x86/lenovo-wmi-camera.c b/drivers/platform/x86/lenovo/lenovo-wmi-camera.c
similarity index 100%
rename from drivers/platform/x86/lenovo-wmi-camera.c
rename to drivers/platform/x86/lenovo/lenovo-wmi-camera.c
diff --git a/drivers/platform/x86/lenovo-wmi-hotkey-utilities.c b/drivers/platform/x86/lenovo/lenovo-wmi-hotkey-utilities.c
similarity index 100%
rename from drivers/platform/x86/lenovo-wmi-hotkey-utilities.c
rename to drivers/platform/x86/lenovo/lenovo-wmi-hotkey-utilities.c
diff --git a/drivers/platform/x86/lenovo-ymc.c b/drivers/platform/x86/lenovo/lenovo-ymc.c
similarity index 100%
rename from drivers/platform/x86/lenovo-ymc.c
rename to drivers/platform/x86/lenovo/lenovo-ymc.c
diff --git a/drivers/platform/x86/lenovo-yoga-tab2-pro-1380-fastcharger.c b/drivers/platform/x86/lenovo/lenovo-yoga-tab2-pro-1380-fastcharger.c
similarity index 99%
rename from drivers/platform/x86/lenovo-yoga-tab2-pro-1380-fastcharger.c
rename to drivers/platform/x86/lenovo/lenovo-yoga-tab2-pro-1380-fastcharger.c
index 25933cd018d1..b3fd6a35052a 100644
--- a/drivers/platform/x86/lenovo-yoga-tab2-pro-1380-fastcharger.c
+++ b/drivers/platform/x86/lenovo/lenovo-yoga-tab2-pro-1380-fastcharger.c
@@ -21,7 +21,7 @@
 #include <linux/time.h>
 #include <linux/types.h>
 #include <linux/workqueue.h>
-#include "serdev_helpers.h"
+#include "../serdev_helpers.h"
 
 #define YT2_1380_FC_PDEV_NAME		"lenovo-yoga-tab2-pro-1380-fastcharger"
 #define YT2_1380_FC_SERDEV_CTRL		"serial0"
diff --git a/drivers/platform/x86/lenovo-yogabook.c b/drivers/platform/x86/lenovo/lenovo-yogabook.c
similarity index 100%
rename from drivers/platform/x86/lenovo-yogabook.c
rename to drivers/platform/x86/lenovo/lenovo-yogabook.c
diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/lenovo/think-lmi.c
similarity index 99%
rename from drivers/platform/x86/think-lmi.c
rename to drivers/platform/x86/lenovo/think-lmi.c
index 0fc275e461be..5d629a85a55a 100644
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
index 5790095c175e..7dd4abf47f61 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -81,7 +81,7 @@
 #include <sound/core.h>
 #include <sound/initval.h>
 
-#include "dual_accel_detect.h"
+#include "../dual_accel_detect.h"
 
 /* ThinkPad CMOS commands */
 #define TP_CMOS_VOLUME_DOWN	0
-- 
2.43.0

