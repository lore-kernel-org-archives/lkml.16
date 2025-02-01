Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D65E1547DC;
	Sat,  1 Feb 2025 10:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738407304; cv=none; b=NKZZD1to5gHMx+HQFKPXTF9A+nrquHTQBYgy/TmhmN7NR/QcVxCyCPvVRguNnEiRJUbgHct27ONy+6iGBFvH89MpPu3R60aA/gROtV7S5E/yI1gumip4E/LGcxGiMVRM+B9vVjOa4bGw9Xxe3fT3DxPRouiqiqbvC3vHumLE6Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738407304; c=relaxed/simple;
	bh=AuHUSLHqej8jzm/GLx/qRLMtk7vVF2VNZ/D+OhHXpAI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hocltf6KFgWEHJwPxGaDI2c0JSLiynDAPNaj3Mbx3H+syCab5EGVy/zq1IYd1ARq6pZDw6knSm86Yrtzlfyf2SAaEYBx+qvlX9gedHgzL6OvKWd7sBpmKGnwJLmWAHorEJvGY4HOT3hMfuD5G41tYLpIY0X/qTkGxRefQlHxDfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-543e4bbcd86so3301491e87.1;
        Sat, 01 Feb 2025 02:55:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738407298; x=1739012098;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wc+CiK8KB7sg3qGAgIq9Yu+T8sJAXsp8amr9gJL6oBM=;
        b=pu9oPTWGylZgVrBrEP+R//x8JUDrWpmn5hZCMn88JdK0FWb2um8QNNVv84C5BMFt1L
         +r+eAkKhkiZ7wCILVVHoxsGD8rYyeYd99hTfUE4qg0sZWH1vRtsc6J3v9z5nghOuz2ua
         rWvTgglkkW6eYaXeZC0dn5CmOiILWVhwfeHQc6rqAEVF7YeFtN1f2apgbIqrXHVG5w+5
         nbFQZV+kNX4wicgc+N/dyJz/SZm0VKIFnjKJq/FAxwd5dzZysj3yXd94qgNsnC14al+u
         kxiaKG1b+Apaesy4B32RI/rEqGJumfggo/r+9a8Lz/VewQiRy/kNItewBS19PLSoLHKz
         zWag==
X-Forwarded-Encrypted: i=1; AJvYcCW0EMm+LQL1Yax8VCeGugq3vmPJe9LECrnGyUbZk/p4ZVVk8OC5PxDrBGXjXxbu9UOktbn8zWdv5Ck=@vger.kernel.org, AJvYcCWjD78N9HXjW9mVNlUuws4ufANtbYEFnKGE14/uoqMaLVq6xdHQcvkSfG4DKodqhSIF+4qqqt7hWYeYnIOuqNV1vz7N9Q==@vger.kernel.org, AJvYcCX88A+qtxo4aQRqBPxsWbyA4XT7BfGlCRIF182iqjhNQPaJjaQp831VZq/2+g4gTypui1rVXU7iZ+25XXep@vger.kernel.org
X-Gm-Message-State: AOJu0YzrweaRYR7Yo8YGwk+8+a8NN9idgDUn7EfqBekyXD73zxUNO0Bo
	ky8ThM8H8ZKDPw7+IieQRTntTGbJzg3xU5rwkRMrKj5ST5x9EmGLfVzk8eo6RbU=
X-Gm-Gg: ASbGncuaOMj/scqXVq0mmNqAMx0Ed9lx31/RPqBx2KxZFNKiKXhb685QQ6ta8RQy1gG
	HVJwq9jQ0QgKVQuK3e4wySttZZHnR3jh60rZdXs8ER3bcGfV8/niDI7zNyZiUr8c6W418VR/god
	SSICzh5b5vLgULs/2Wdng7b2Ofm35W9rpkVjyH/XrKhmU8PJSxqR5W5e28/kzEUAMzdG6sTJTYV
	gNrpOfYz56oGKvSrtaZiCXJNyrRjUg2+n9jATMTDcVnxdQt8A3QC2mfkheMPt5kMItXt5l6v+PS
	dqoRPA5cLULponYkQhH9wNZ2NLQto7/BXxK6VaGU32acbiqZ7jgwCAY5
X-Google-Smtp-Source: AGHT+IEQ0le+4FWmiYs1ATF4v6VhisQJ9OHqDjfGnDgxmQBQCer2qilml4wpFPv5AL6yWHfabp4tTQ==
X-Received: by 2002:a05:6512:3d2:b0:542:1b63:2e52 with SMTP id 2adb3069b0e04-543e4bd8eb1mr3803109e87.6.1738407297898;
        Sat, 01 Feb 2025 02:54:57 -0800 (PST)
Received: from galaxybook.local (82-183-24-76.customers.ownit.se. [82.183.24.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebeb7f64sm722460e87.203.2025.02.01.02.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 02:54:56 -0800 (PST)
From: Joshua Grisham <josh@joshuagrisham.com>
To: W_Armin@gmx.de,
	thomas@t-8ch.de,
	kuurtb@gmail.com,
	ilpo.jarvinen@linux.intel.com,
	hdegoede@redhat.com,
	platform-driver-x86@vger.kernel.org,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Joshua Grisham <josh@joshuagrisham.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH v10] platform/x86: samsung-galaxybook: Add samsung-galaxybook driver
Date: Sat,  1 Feb 2025 11:54:50 +0100
Message-ID: <20250201105450.193450-1-josh@joshuagrisham.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a new driver for Samsung Galaxy Book series notebook devices with the
following features:

- Keyboard backlight control
- Battery hook for installing power supply extension to add charge
  control end threshold
- Controller for Samsung's performance modes using the platform profile
  interface
- Adds firmware-attributes to control various system features
- Handles various hotkeys and notifications

Signed-off-by: Joshua Grisham <josh@joshuagrisham.com>
Reviewed-by: Thomas Weißschuh <linux@weissschuh.net>
Reviewed-by: Armin Wolf <W_Armin@gmx.de>

---

v1->v2:
- Attempt to resolve all review comments from v1 as written here:
https://lore.kernel.org/platform-driver-x86/53c5075b-1967-45d0-937f-463912dd966d@gmx.de/T/#mbcbd8d5d9bc4496bac5486636c7d3b32bc3e5cd0

v2->v3:
- Tweak to battery attribute to closer match pattern in dell-wmi-ddv
- implement platform_profile_remove() change from
  9b3bb37b44a317626464e79da8b39989b421963f
- Small tweak to Documentation page

v3->v4:
- Remove custom tracepoint (can trace via existing mechanisms)
- Remove module parameters
- Move sysfs attributes from device to firmware-attributes
- Refactor "allow_recording" to "camera_lens_cover" plus other small
  renames in aim to have more standardized naming that are cross-vendor
- Attempt to improve locking mechanisms
- Tweak logic for setting and getting led brightness
- More fixes for aiming to use devres/devm pattern
- Change battery charge end threshold to use 1 to 100 instead of 0 to 99
- Add swtich input event for camera_lens_cover remove all others (they will
  be generated as ACPI netlink events instead)
- Various other small tweaks and features as requested from feedback

v4-v5:
- Prefix all locally defined symbols with "GB_" as a namespace
- Remove extra unused out_buf from galaxybook_acpi_method
- Tighten up logic flow for setting and unsetting global pointer (now it
  is done directly in association with the i8042 filter init and exit)
- Rename "camera_lens_cover" to "block_recording"
- Change input device to only apply for "Camera Lens Cover", remove sparse
  keymap and set capabilities manually as part of block_recording init,
  then notify using input_report_switch when setting block_recording
- Correct firmware-attributes enumeration implementation (adding all
  attributes) and remove erroneous ABI fw attrs docs update
- Few small tweaks to how locks are used
- Use device_unregister instead of device_destroy for firmware attributes
  device
- Tighten up and clean up performance mode to profile mapping logic; now
  the mapping is largely "fixed" apart from "Ultra" that will map to
  performance while also re-mapping "Performance" to balanced-performance
- Tighten up error handling so probe will fail in more cases where it
  should fail
- Replace platform_profile_register with devm_platform_profile_register

v5->v6:
- A few small clean-up/fixes as requested from feedback
- Revamp performance mode profile mapping so it is more static and relies
  more on the facilities already built in to platform_profile, including:
  - setting and using bits on profile handler choices to drive most of the
    behavior instead of having totally separate logic
  - get_performance_mode_profile() is now a mostly static mapping that
    drives both setting initial profile choices and retrieving the right
    profile for a given performance_mode during runtime
  - during init most of the mappings are hard-coded and the only things
    that are changed are the exception cases (override legacy values and
    downgrade of performance when Ultra mode is present)
  - new function galaxybook_performance_mode_init() now handles initial
    startup performance mode in a much more simple and straight-forward way

v6->v7:
- Rebase to latest for-next and implement updates to firmware-attributes,
  platform_profile, and i8042 filter (including removal of global pointer).

v7->v8:
- Simplification and logic correction to platform_profile mapping and
  probe implementation, including renaming the internal performance modes
  to more closely match the internal names used by Samsung in Windows and
  align the logic in this driver to how it works with their Windows
  services.

v8->v9:
- Refactored "optional feature" init logic to return EOPNOTSUPP instead of
  0 and then centralized handling of various flags in the probe function
- Re-sorted so get/show functions are always defined before set/store
- Removed manually deleting fw_attrs (kset_unregister takes care of this)
- Removed some unnecessary variable initializations
- Removed manually creating charge_control_end_threshold sysfs attribute
  and implemented new power supply extension framework instead
- Removed gb_pfmode() macro and instead use a local pointer in
  galaxybook_platform_profile_probe()

v9->v10:
- Change "not supported" error code to use a locally defined symbol
  GB_NOT_SUPPORTED instead of directly returning EOPNOTSUPP as it is more
  self-documenting and avoids checkpatch warnings which would otherwise be
  present when returning positive error codes
- Also brought up Thomas's and Armin's Reviewed-by tag so they do not get
  lost in the shuffle :)
---
 Documentation/admin-guide/laptops/index.rst   |    1 +
 .../laptops/samsung-galaxybook.rst            |  174 ++
 MAINTAINERS                                   |    7 +
 drivers/platform/x86/Kconfig                  |   17 +
 drivers/platform/x86/Makefile                 |    5 +-
 drivers/platform/x86/samsung-galaxybook.c     | 1423 +++++++++++++++++
 6 files changed, 1625 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/admin-guide/laptops/samsung-galaxybook.rst
 create mode 100644 drivers/platform/x86/samsung-galaxybook.c

diff --git a/Documentation/admin-guide/laptops/index.rst b/Documentation/admin-guide/laptops/index.rst
index cd9a1c2695fd..e71c8984c23e 100644
--- a/Documentation/admin-guide/laptops/index.rst
+++ b/Documentation/admin-guide/laptops/index.rst
@@ -11,6 +11,7 @@ Laptop Drivers
    disk-shock-protection
    laptop-mode
    lg-laptop
+   samsung-galaxybook
    sony-laptop
    sonypi
    thinkpad-acpi
diff --git a/Documentation/admin-guide/laptops/samsung-galaxybook.rst b/Documentation/admin-guide/laptops/samsung-galaxybook.rst
new file mode 100644
index 000000000000..752b8f1a4a74
--- /dev/null
+++ b/Documentation/admin-guide/laptops/samsung-galaxybook.rst
@@ -0,0 +1,174 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+==========================
+Samsung Galaxy Book Driver
+==========================
+
+Joshua Grisham <josh@joshuagrisham.com>
+
+This is a Linux x86 platform driver for Samsung Galaxy Book series notebook
+devices which utilizes Samsung's ``SCAI`` ACPI device in order to control
+extra features and receive various notifications.
+
+Supported devices
+=================
+
+Any device with one of the supported ACPI device IDs should be supported. This
+covers most of the "Samsung Galaxy Book" series notebooks that are currently
+available as of this writing, and could include other Samsung notebook devices
+as well.
+
+Status
+======
+
+The following features are currently supported:
+
+- :ref:`Keyboard backlight <keyboard-backlight>` control
+- :ref:`Performance mode <performance-mode>` control implemented using the
+  platform profile interface
+- :ref:`Battery charge control end threshold
+  <battery-charge-control-end-threshold>` (stop charging battery at given
+  percentage value) implemented as a battery hook
+- :ref:`Firmware Attributes <firmware-attributes>` to allow control of various
+  device settings
+- :ref:`Handling of Fn hotkeys <keyboard-hotkey-actions>` for various actions
+- :ref:`Handling of ACPI notifications and hotkeys
+  <acpi-notifications-and-hotkey-actions>`
+
+Because different models of these devices can vary in their features, there is
+logic built within the driver which attempts to test each implemented feature
+for a valid response before enabling its support (registering additional devices
+or extensions, adding sysfs attributes, etc). Therefore, it can be important to
+note that not all features may be supported for your particular device.
+
+The following features might be possible to implement but will require
+additional investigation and are therefore not supported at this time:
+
+- "Dolby Atmos" mode for the speakers
+- "Outdoor Mode" for increasing screen brightness on models with ``SAM0427``
+- "Silent Mode" on models with ``SAM0427``
+
+.. _keyboard-backlight:
+
+Keyboard backlight
+==================
+
+A new LED class named ``samsung-galaxybook::kbd_backlight`` is created which
+will then expose the device using the standard sysfs-based LED interface at
+``/sys/class/leds/samsung-galaxybook::kbd_backlight``. Brightness can be
+controlled by writing the desired value to the ``brightness`` sysfs attribute or
+with any other desired userspace utility.
+
+.. note::
+  Most of these devices have an ambient light sensor which also turns
+  off the keyboard backlight under well-lit conditions. This behavior does not
+  seem possible to control at this time, but can be good to be aware of.
+
+.. _performance-mode:
+
+Performance mode
+================
+
+This driver implements the
+Documentation/userspace-api/sysfs-platform_profile.rst interface for working
+with the "performance mode" function of the Samsung ACPI device.
+
+Mapping of each Samsung "performance mode" to its respective platform profile is
+performed dynamically by the driver, as not all models support all of the same
+performance modes. Your device might have one or more of the following mappings:
+
+- "Silent" maps to ``low-power``
+- "Quiet" maps to ``quiet``
+- "Optimized" maps to ``balanced``
+- "High performance" maps to ``performance``
+
+The result of the mapping can be printed in the kernel log when the module is
+loaded. Supported profiles can also be retrieved from
+``/sys/firmware/acpi/platform_profile_choices``, while
+``/sys/firmware/acpi/platform_profile`` can be used to read or write the
+currently selected profile.
+
+The ``balanced`` platform profile will be set during module load if no profile
+has been previously set.
+
+.. _battery-charge-control-end-threshold:
+
+Battery charge control end threshold
+====================================
+
+This platform driver will add the ability to set the battery's charge control
+end threshold, but does not have the ability to set a start threshold.
+
+This feature is typically called "Battery Saver" by the various Samsung
+applications in Windows, but in Linux we have implemented the standardized
+"charge control threshold" sysfs interface on the battery device to allow for
+controlling this functionality from the userspace.
+
+The sysfs attribute
+``/sys/class/power_supply/BAT1/charge_control_end_threshold`` can be used to
+read or set the desired charge end threshold.
+
+If you wish to maintain interoperability with the Samsung Settings application
+in Windows, then you should set the value to 100 to represent "off", or enable
+the feature using only one of the following values: 50, 60, 70, 80, or 90.
+Otherwise, the driver will accept any value between 1 and 100 as the percentage
+that you wish the battery to stop charging at.
+
+.. note::
+  Some devices have been observed as automatically "turning off" the charge
+  control end threshold if an input value of less than 30 is given.
+
+.. _firmware-attributes:
+
+Firmware Attributes
+===================
+
+The following enumeration-typed firmware attributes are set up by this driver
+and should be accessible under
+``/sys/class/firmware-attributes/samsung-galaxybook/attributes/`` if your device
+supports them:
+
+- ``power_on_lid_open`` (device should power on when the lid is opened)
+- ``usb_charging``  (USB ports can deliver power to connected devices even when
+  the device is powered off or in a low sleep state)
+- ``block_recording`` (blocks access to camera and microphone)
+
+All of these attributes are simple boolean-like enumeration values which use 0
+to represent "off" and 1 to represent "on". Use the ``current_value`` attribute
+to get or change the setting on the device.
+
+Note that when ``block_recording`` is updated, the input device "Samsung Galaxy
+Book Lens Cover" will receive a ``SW_CAMERA_LENS_COVER`` switch event which
+reflects the current state.
+
+.. _keyboard-hotkey-actions:
+
+Keyboard hotkey actions (i8042 filter)
+======================================
+
+The i8042 filter will swallow the keyboard events for the Fn+F9 hotkey (Multi-
+level keyboard backlight toggle) and Fn+F10 hotkey (Block recording toggle)
+and instead execute their actions within the driver itself.
+
+Fn+F9 will cycle through the brightness levels of the keyboard backlight. A
+notification will be sent using ``led_classdev_notify_brightness_hw_changed``
+so that the userspace can be aware of the change. This mimics the behavior of
+other existing devices where the brightness level is cycled internally by the
+embedded controller and then reported via a notification.
+
+Fn+F10 will toggle the value of the "block recording" setting, which blocks
+or allows usage of the built-in camera and microphone (and generates the same
+Lens Cover switch event mentioned above).
+
+.. _acpi-notifications-and-hotkey-actions:
+
+ACPI notifications and hotkey actions
+=====================================
+
+ACPI notifications will generate ACPI netlink events under the device class
+``samsung-galaxybook`` and bus ID matching the Samsung ACPI device ID found on
+your device. The events can be received using userspace tools such as
+``acpi_listen`` and ``acpid``.
+
+The Fn+F11 Performance mode hotkey will be handled by the driver; each keypress
+will cycle to the next available platform profile.
diff --git a/MAINTAINERS b/MAINTAINERS
index 936e80f2c9ce..9d3d5359d304 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20913,6 +20913,13 @@ L:	linux-fbdev@vger.kernel.org
 S:	Maintained
 F:	drivers/video/fbdev/s3c-fb.c
 
+SAMSUNG GALAXY BOOK DRIVER
+M:	Joshua Grisham <josh@joshuagrisham.com>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	Documentation/admin-guide/laptops/samsung-galaxybook.rst
+F:	drivers/platform/x86/samsung-galaxybook.c
+
 SAMSUNG INTERCONNECT DRIVERS
 M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
 M:	Artur Świgoń <a.swigon@samsung.com>
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 0258dd879d64..c77178e2640b 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -778,6 +778,23 @@ config BARCO_P50_GPIO
 	  To compile this driver as a module, choose M here: the module
 	  will be called barco-p50-gpio.
 
+config SAMSUNG_GALAXYBOOK
+	tristate "Samsung Galaxy Book driver"
+	depends on ACPI
+	depends on ACPI_BATTERY
+	depends on INPUT
+	depends on LEDS_CLASS
+	depends on SERIO_I8042
+	select ACPI_PLATFORM_PROFILE
+	select FW_ATTR_CLASS
+	help
+	  This is a driver for Samsung Galaxy Book series notebooks. It adds
+	  support for the keyboard backlight control, performance mode control,
+	  function keys, and various firmware attributes.
+
+	  For more information about this driver, see
+	  <file:Documentation/admin-guide/laptops/samsung-galaxybook.rst>.
+
 config SAMSUNG_LAPTOP
 	tristate "Samsung Laptop driver"
 	depends on RFKILL || RFKILL = n
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index e1b142947067..32ec4cb9d902 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -95,8 +95,9 @@ obj-$(CONFIG_PCENGINES_APU2)	+= pcengines-apuv2.o
 obj-$(CONFIG_BARCO_P50_GPIO)	+= barco-p50-gpio.o
 
 # Samsung
-obj-$(CONFIG_SAMSUNG_LAPTOP)	+= samsung-laptop.o
-obj-$(CONFIG_SAMSUNG_Q10)	+= samsung-q10.o
+obj-$(CONFIG_SAMSUNG_GALAXYBOOK)	+= samsung-galaxybook.o
+obj-$(CONFIG_SAMSUNG_LAPTOP)		+= samsung-laptop.o
+obj-$(CONFIG_SAMSUNG_Q10)		+= samsung-q10.o
 
 # Toshiba
 obj-$(CONFIG_TOSHIBA_BT_RFKILL)	+= toshiba_bluetooth.o
diff --git a/drivers/platform/x86/samsung-galaxybook.c b/drivers/platform/x86/samsung-galaxybook.c
new file mode 100644
index 000000000000..9c658a45da44
--- /dev/null
+++ b/drivers/platform/x86/samsung-galaxybook.c
@@ -0,0 +1,1423 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Samsung Galaxy Book driver
+ *
+ * Copyright (c) 2025 Joshua Grisham <josh@joshuagrisham.com>
+ *
+ * With contributions to the SCAI ACPI device interface:
+ * Copyright (c) 2024 Giulio Girardi <giulio.girardi@protechgroup.it>
+ *
+ * Implementation inspired by existing x86 platform drivers.
+ * Thank you to the authors!
+ */
+
+#include <linux/acpi.h>
+#include <linux/bits.h>
+#include <linux/err.h>
+#include <linux/i8042.h>
+#include <linux/init.h>
+#include <linux/input.h>
+#include <linux/kernel.h>
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+#include <linux/platform_profile.h>
+#include <linux/serio.h>
+#include <linux/sysfs.h>
+#include <linux/uuid.h>
+#include <linux/workqueue.h>
+#include <acpi/battery.h>
+#include "firmware_attributes_class.h"
+
+#define DRIVER_NAME "samsung-galaxybook"
+
+struct samsung_galaxybook {
+	struct platform_device *platform;
+	struct acpi_device *acpi;
+
+	struct device *fw_attrs_dev;
+	struct kset *fw_attrs_kset;
+	/* block in case firmware attributes are updated in multiple threads */
+	struct mutex fw_attr_lock;
+
+	bool has_kbd_backlight;
+	bool has_block_recording;
+	bool has_performance_mode;
+
+	struct led_classdev kbd_backlight;
+	struct work_struct kbd_backlight_hotkey_work;
+	/* block in case brightness updated using hotkey and another thread */
+	struct mutex kbd_backlight_lock;
+
+	void *i8042_filter_ptr;
+
+	struct work_struct block_recording_hotkey_work;
+	struct input_dev *camera_lens_cover_switch;
+
+	struct acpi_battery_hook battery_hook;
+
+	u8 profile_performance_modes[PLATFORM_PROFILE_LAST];
+};
+
+enum galaxybook_fw_attr_id {
+	GB_ATTR_POWER_ON_LID_OPEN,
+	GB_ATTR_USB_CHARGING,
+	GB_ATTR_BLOCK_RECORDING,
+};
+
+static const char * const galaxybook_fw_attr_name[] = {
+	[GB_ATTR_POWER_ON_LID_OPEN] = "power_on_lid_open",
+	[GB_ATTR_USB_CHARGING]      = "usb_charging",
+	[GB_ATTR_BLOCK_RECORDING]   = "block_recording",
+};
+
+static const char * const galaxybook_fw_attr_desc[] = {
+	[GB_ATTR_POWER_ON_LID_OPEN] = "Power On Lid Open",
+	[GB_ATTR_USB_CHARGING]      = "USB Charging",
+	[GB_ATTR_BLOCK_RECORDING]   = "Block Recording",
+};
+
+#define GB_ATTR_LANGUAGE_CODE "en_US.UTF-8"
+
+struct galaxybook_fw_attr {
+	struct samsung_galaxybook *galaxybook;
+	enum galaxybook_fw_attr_id fw_attr_id;
+	struct attribute_group attr_group;
+	struct kobj_attribute display_name;
+	struct kobj_attribute current_value;
+	int (*get_value)(struct samsung_galaxybook *galaxybook, bool *value);
+	int (*set_value)(struct samsung_galaxybook *galaxybook, const bool value);
+};
+
+struct sawb {
+	u16 safn;
+	u16 sasb;
+	u8 rflg;
+	union {
+		struct {
+			u8 gunm;
+			u8 guds[250];
+		} __packed;
+		struct {
+			u8 caid[16];
+			u8 fncn;
+			u8 subn;
+			u8 iob0;
+			u8 iob1;
+			u8 iob2;
+			u8 iob3;
+			u8 iob4;
+			u8 iob5;
+			u8 iob6;
+			u8 iob7;
+			u8 iob8;
+			u8 iob9;
+		} __packed;
+		struct {
+			u8 iob_prefix[18];
+			u8 iobs[10];
+		} __packed;
+	} __packed;
+} __packed;
+
+#define GB_SAWB_LEN_SETTINGS          0x15
+#define GB_SAWB_LEN_PERFORMANCE_MODE  0x100
+
+#define GB_SAFN  0x5843
+
+#define GB_SASB_KBD_BACKLIGHT     0x78
+#define GB_SASB_POWER_MANAGEMENT  0x7a
+#define GB_SASB_USB_CHARGING_GET  0x67
+#define GB_SASB_USB_CHARGING_SET  0x68
+#define GB_SASB_NOTIFICATIONS     0x86
+#define GB_SASB_BLOCK_RECORDING   0x8a
+#define GB_SASB_PERFORMANCE_MODE  0x91
+
+#define GB_SAWB_RFLG_POS     4
+#define GB_SAWB_GB_GUNM_POS  5
+
+#define GB_RFLG_SUCCESS  0xaa
+#define GB_GUNM_FAIL     0xff
+
+#define GB_GUNM_FEATURE_ENABLE          0xbb
+#define GB_GUNM_FEATURE_ENABLE_SUCCESS  0xdd
+#define GB_GUDS_FEATURE_ENABLE          0xaa
+#define GB_GUDS_FEATURE_ENABLE_SUCCESS  0xcc
+
+#define GB_GUNM_GET  0x81
+#define GB_GUNM_SET  0x82
+
+#define GB_GUNM_POWER_MANAGEMENT  0x82
+
+#define GB_GUNM_USB_CHARGING_GET            0x80
+#define GB_GUNM_USB_CHARGING_ON             0x81
+#define GB_GUNM_USB_CHARGING_OFF            0x80
+#define GB_GUDS_POWER_ON_LID_OPEN           0xa3
+#define GB_GUDS_POWER_ON_LID_OPEN_GET       0x81
+#define GB_GUDS_POWER_ON_LID_OPEN_SET       0x80
+#define GB_GUDS_BATTERY_CHARGE_CONTROL      0xe9
+#define GB_GUDS_BATTERY_CHARGE_CONTROL_GET  0x91
+#define GB_GUDS_BATTERY_CHARGE_CONTROL_SET  0x90
+#define GB_GUNM_ACPI_NOTIFY_ENABLE          0x80
+#define GB_GUDS_ACPI_NOTIFY_ENABLE          0x02
+
+#define GB_BLOCK_RECORDING_ON   0x0
+#define GB_BLOCK_RECORDING_OFF  0x1
+
+#define GB_FNCN_PERFORMANCE_MODE       0x51
+#define GB_SUBN_PERFORMANCE_MODE_LIST  0x01
+#define GB_SUBN_PERFORMANCE_MODE_GET   0x02
+#define GB_SUBN_PERFORMANCE_MODE_SET   0x03
+
+/* guid 8246028d-8bca-4a55-ba0f-6f1e6b921b8f */
+static const guid_t performance_mode_guid =
+	GUID_INIT(0x8246028d, 0x8bca, 0x4a55, 0xba, 0x0f, 0x6f, 0x1e, 0x6b, 0x92, 0x1b, 0x8f);
+#define GB_PERFORMANCE_MODE_GUID performance_mode_guid
+
+#define GB_PERFORMANCE_MODE_FANOFF          0xb
+#define GB_PERFORMANCE_MODE_LOWNOISE        0xa
+#define GB_PERFORMANCE_MODE_OPTIMIZED       0x0
+#define GB_PERFORMANCE_MODE_OPTIMIZED_V2    0x2
+#define GB_PERFORMANCE_MODE_PERFORMANCE     0x1
+#define GB_PERFORMANCE_MODE_PERFORMANCE_V2  0x15
+#define GB_PERFORMANCE_MODE_ULTRA           0x16
+#define GB_PERFORMANCE_MODE_IGNORE1         0x14
+#define GB_PERFORMANCE_MODE_IGNORE2         0xc
+
+#define GB_ACPI_METHOD_ENABLE            "SDLS"
+#define GB_ACPI_METHOD_ENABLE_ON         1
+#define GB_ACPI_METHOD_ENABLE_OFF        0
+#define GB_ACPI_METHOD_SETTINGS          "CSFI"
+#define GB_ACPI_METHOD_PERFORMANCE_MODE  "CSXI"
+
+#define GB_KBD_BACKLIGHT_MAX_BRIGHTNESS  3
+
+#define GB_ACPI_NOTIFY_BATTERY_STATE_CHANGED    0x61
+#define GB_ACPI_NOTIFY_DEVICE_ON_TABLE          0x6c
+#define GB_ACPI_NOTIFY_DEVICE_OFF_TABLE         0x6d
+#define GB_ACPI_NOTIFY_HOTKEY_PERFORMANCE_MODE  0x70
+
+#define GB_KEY_KBD_BACKLIGHT_KEYDOWN    0x2c
+#define GB_KEY_KBD_BACKLIGHT_KEYUP      0xac
+#define GB_KEY_BLOCK_RECORDING_KEYDOWN  0x1f
+#define GB_KEY_BLOCK_RECORDING_KEYUP    0x9f
+#define GB_KEY_BATTERY_NOTIFY_KEYUP     0xf
+#define GB_KEY_BATTERY_NOTIFY_KEYDOWN   0x8f
+
+/*
+ * Optional features which have been determined as not supported on a particular
+ * device will return GB_NOT_SUPPORTED from their init function. Positive
+ * EOPNOTSUPP is used as the underlying value instead of negative to
+ * differentiate this return code from valid upstream failures.
+ */
+#define GB_NOT_SUPPORTED EOPNOTSUPP /* Galaxy Book feature not supported */
+
+/*
+ * ACPI method handling
+ */
+
+static int galaxybook_acpi_method(struct samsung_galaxybook *galaxybook, acpi_string method,
+				  struct sawb *buf, size_t len)
+{
+	struct acpi_buffer output = {ACPI_ALLOCATE_BUFFER, NULL};
+	union acpi_object in_obj, *out_obj;
+	struct acpi_object_list input;
+	acpi_status status;
+	int err;
+
+	in_obj.type = ACPI_TYPE_BUFFER;
+	in_obj.buffer.length = len;
+	in_obj.buffer.pointer = (u8 *)buf;
+
+	input.count = 1;
+	input.pointer = &in_obj;
+
+	status = acpi_evaluate_object_typed(galaxybook->acpi->handle, method, &input, &output,
+					    ACPI_TYPE_BUFFER);
+
+	if (ACPI_FAILURE(status)) {
+		dev_err(&galaxybook->acpi->dev, "failed to execute method %s; got %s\n",
+			method, acpi_format_exception(status));
+		return -EIO;
+	}
+
+	out_obj = output.pointer;
+
+	if (out_obj->buffer.length != len || out_obj->buffer.length < GB_SAWB_GB_GUNM_POS + 1) {
+		dev_err(&galaxybook->acpi->dev,
+			"failed to execute %s; response length mismatch\n",
+			method);
+		err = -EPROTO;
+		goto out_free;
+	}
+	if (out_obj->buffer.pointer[GB_SAWB_RFLG_POS] != GB_RFLG_SUCCESS) {
+		dev_err(&galaxybook->acpi->dev,
+			"failed to execute %s; device did not respond with success code 0x%x\n",
+			method, GB_RFLG_SUCCESS);
+		err = -ENXIO;
+		goto out_free;
+	}
+	if (out_obj->buffer.pointer[GB_SAWB_GB_GUNM_POS] == GB_GUNM_FAIL) {
+		dev_err(&galaxybook->acpi->dev,
+			"failed to execute %s; device responded with failure code 0x%x\n",
+			method, GB_GUNM_FAIL);
+		err = -ENXIO;
+		goto out_free;
+	}
+
+	memcpy(buf, out_obj->buffer.pointer, len);
+	err = 0;
+
+out_free:
+	kfree(out_obj);
+	return err;
+}
+
+static int galaxybook_enable_acpi_feature(struct samsung_galaxybook *galaxybook, const u16 sasb)
+{
+	struct sawb buf = {};
+	int err;
+
+	buf.safn = GB_SAFN;
+	buf.sasb = sasb;
+	buf.gunm = GB_GUNM_FEATURE_ENABLE;
+	buf.guds[0] = GB_GUDS_FEATURE_ENABLE;
+
+	err = galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTINGS,
+				     &buf, GB_SAWB_LEN_SETTINGS);
+	if (err)
+		return err;
+
+	if (buf.gunm != GB_GUNM_FEATURE_ENABLE_SUCCESS &&
+	    buf.guds[0] != GB_GUDS_FEATURE_ENABLE_SUCCESS)
+		return -ENODEV;
+
+	return 0;
+}
+
+/*
+ * Keyboard Backlight
+ */
+
+static int kbd_backlight_acpi_get(struct samsung_galaxybook *galaxybook,
+				  enum led_brightness *brightness)
+{
+	struct sawb buf = {};
+	int err;
+
+	buf.safn = GB_SAFN;
+	buf.sasb = GB_SASB_KBD_BACKLIGHT;
+	buf.gunm = GB_GUNM_GET;
+
+	err = galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTINGS,
+				     &buf, GB_SAWB_LEN_SETTINGS);
+	if (err)
+		return err;
+
+	*brightness = buf.gunm;
+
+	return 0;
+}
+
+static int kbd_backlight_acpi_set(struct samsung_galaxybook *galaxybook,
+				  const enum led_brightness brightness)
+{
+	struct sawb buf = {};
+
+	buf.safn = GB_SAFN;
+	buf.sasb = GB_SASB_KBD_BACKLIGHT;
+	buf.gunm = GB_GUNM_SET;
+
+	buf.guds[0] = brightness;
+
+	return galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTINGS,
+				      &buf, GB_SAWB_LEN_SETTINGS);
+}
+
+static enum led_brightness kbd_backlight_show(struct led_classdev *led)
+{
+	struct samsung_galaxybook *galaxybook =
+		container_of(led, struct samsung_galaxybook, kbd_backlight);
+	enum led_brightness brightness;
+	int err;
+
+	err = kbd_backlight_acpi_get(galaxybook, &brightness);
+	if (err)
+		return err;
+
+	return brightness;
+}
+
+static int kbd_backlight_store(struct led_classdev *led,
+			       const enum led_brightness brightness)
+{
+	struct samsung_galaxybook *galaxybook =
+		container_of_const(led, struct samsung_galaxybook, kbd_backlight);
+
+	return kbd_backlight_acpi_set(galaxybook, brightness);
+}
+
+static int galaxybook_kbd_backlight_init(struct samsung_galaxybook *galaxybook)
+{
+	struct led_init_data init_data = {};
+	enum led_brightness brightness;
+	int err;
+
+	err = devm_mutex_init(&galaxybook->platform->dev, &galaxybook->kbd_backlight_lock);
+	if (err)
+		return err;
+
+	err = galaxybook_enable_acpi_feature(galaxybook, GB_SASB_KBD_BACKLIGHT);
+	if (err) {
+		dev_dbg(&galaxybook->platform->dev,
+			"failed to enable kbd_backlight feature, error %d\n", err);
+		return GB_NOT_SUPPORTED;
+	}
+
+	err = kbd_backlight_acpi_get(galaxybook, &brightness);
+	if (err) {
+		dev_dbg(&galaxybook->platform->dev,
+			"failed to get initial kbd_backlight brightness, error %d\n", err);
+		return GB_NOT_SUPPORTED;
+	}
+
+	init_data.devicename = DRIVER_NAME;
+	init_data.default_label = ":" LED_FUNCTION_KBD_BACKLIGHT;
+	init_data.devname_mandatory = true;
+
+	galaxybook->kbd_backlight.brightness_get = kbd_backlight_show;
+	galaxybook->kbd_backlight.brightness_set_blocking = kbd_backlight_store;
+	galaxybook->kbd_backlight.flags = LED_BRIGHT_HW_CHANGED;
+	galaxybook->kbd_backlight.max_brightness = GB_KBD_BACKLIGHT_MAX_BRIGHTNESS;
+
+	return devm_led_classdev_register_ext(&galaxybook->platform->dev,
+					      &galaxybook->kbd_backlight, &init_data);
+}
+
+/*
+ * Battery Extension (adds charge_control_end_threshold to the battery device)
+ */
+
+static int charge_control_end_threshold_acpi_get(struct samsung_galaxybook *galaxybook, u8 *value)
+{
+	struct sawb buf = {};
+	int err;
+
+	buf.safn = GB_SAFN;
+	buf.sasb = GB_SASB_POWER_MANAGEMENT;
+	buf.gunm = GB_GUNM_POWER_MANAGEMENT;
+	buf.guds[0] = GB_GUDS_BATTERY_CHARGE_CONTROL;
+	buf.guds[1] = GB_GUDS_BATTERY_CHARGE_CONTROL_GET;
+
+	err = galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTINGS,
+				     &buf, GB_SAWB_LEN_SETTINGS);
+	if (err)
+		return err;
+
+	*value = buf.guds[1];
+
+	return 0;
+}
+
+static int charge_control_end_threshold_acpi_set(struct samsung_galaxybook *galaxybook, u8 value)
+{
+	struct sawb buf = {};
+
+	buf.safn = GB_SAFN;
+	buf.sasb = GB_SASB_POWER_MANAGEMENT;
+	buf.gunm = GB_GUNM_POWER_MANAGEMENT;
+	buf.guds[0] = GB_GUDS_BATTERY_CHARGE_CONTROL;
+	buf.guds[1] = GB_GUDS_BATTERY_CHARGE_CONTROL_SET;
+	buf.guds[2] = value;
+
+	return galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTINGS,
+				      &buf, GB_SAWB_LEN_SETTINGS);
+}
+
+static int galaxybook_battery_ext_property_get(struct power_supply *psy,
+					       const struct power_supply_ext *ext,
+					       void *ext_data,
+					       enum power_supply_property psp,
+					       union power_supply_propval *val)
+{
+	struct samsung_galaxybook *galaxybook = ext_data;
+	int err;
+
+	if (psp != POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD)
+		return -EINVAL;
+
+	err = charge_control_end_threshold_acpi_get(galaxybook, (u8 *)&val->intval);
+	if (err)
+		return err;
+
+	/*
+	 * device stores "no end threshold" as 0 instead of 100;
+	 * if device has 0, report 100
+	 */
+	if (val->intval == 0)
+		val->intval = 100;
+
+	return 0;
+}
+
+static int galaxybook_battery_ext_property_set(struct power_supply *psy,
+					       const struct power_supply_ext *ext,
+					       void *ext_data,
+					       enum power_supply_property psp,
+					       const union power_supply_propval *val)
+{
+	struct samsung_galaxybook *galaxybook = ext_data;
+	u8 value;
+
+	if (psp != POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD)
+		return -EINVAL;
+
+	value = val->intval;
+
+	if (value < 1 || value > 100)
+		return -EINVAL;
+
+	/*
+	 * device stores "no end threshold" as 0 instead of 100;
+	 * if setting to 100, send 0
+	 */
+	if (value == 100)
+		value = 0;
+
+	return charge_control_end_threshold_acpi_set(galaxybook, value);
+}
+
+static int galaxybook_battery_ext_property_is_writeable(struct power_supply *psy,
+							const struct power_supply_ext *ext,
+							void *ext_data,
+							enum power_supply_property psp)
+{
+	if (psp == POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD)
+		return true;
+
+	return false;
+}
+
+static const enum power_supply_property galaxybook_battery_properties[] = {
+	POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD,
+};
+
+static const struct power_supply_ext galaxybook_battery_ext = {
+	.name			= DRIVER_NAME,
+	.properties		= galaxybook_battery_properties,
+	.num_properties		= ARRAY_SIZE(galaxybook_battery_properties),
+	.get_property		= galaxybook_battery_ext_property_get,
+	.set_property		= galaxybook_battery_ext_property_set,
+	.property_is_writeable	= galaxybook_battery_ext_property_is_writeable,
+};
+
+static int galaxybook_battery_add(struct power_supply *battery, struct acpi_battery_hook *hook)
+{
+	struct samsung_galaxybook *galaxybook =
+		container_of(hook, struct samsung_galaxybook, battery_hook);
+
+	return power_supply_register_extension(battery, &galaxybook_battery_ext,
+					       &battery->dev, galaxybook);
+}
+
+static int galaxybook_battery_remove(struct power_supply *battery, struct acpi_battery_hook *hook)
+{
+	power_supply_unregister_extension(battery, &galaxybook_battery_ext);
+	return 0;
+}
+
+static int galaxybook_battery_threshold_init(struct samsung_galaxybook *galaxybook)
+{
+	u8 value;
+	int err;
+
+	err = charge_control_end_threshold_acpi_get(galaxybook, &value);
+	if (err) {
+		dev_dbg(&galaxybook->platform->dev,
+			"failed to get initial battery charge end threshold, error %d\n", err);
+		return 0;
+	}
+
+	galaxybook->battery_hook.add_battery = galaxybook_battery_add;
+	galaxybook->battery_hook.remove_battery = galaxybook_battery_remove;
+	galaxybook->battery_hook.name = "Samsung Galaxy Book Battery Extension";
+
+	return devm_battery_hook_register(&galaxybook->platform->dev, &galaxybook->battery_hook);
+}
+
+/*
+ * Platform Profile / Performance mode
+ */
+
+static int performance_mode_acpi_get(struct samsung_galaxybook *galaxybook, u8 *performance_mode)
+{
+	struct sawb buf = {};
+	int err;
+
+	buf.safn = GB_SAFN;
+	buf.sasb = GB_SASB_PERFORMANCE_MODE;
+	export_guid(buf.caid, &GB_PERFORMANCE_MODE_GUID);
+	buf.fncn = GB_FNCN_PERFORMANCE_MODE;
+	buf.subn = GB_SUBN_PERFORMANCE_MODE_GET;
+
+	err = galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_PERFORMANCE_MODE,
+				     &buf, GB_SAWB_LEN_PERFORMANCE_MODE);
+	if (err)
+		return err;
+
+	*performance_mode = buf.iob0;
+
+	return 0;
+}
+
+static int performance_mode_acpi_set(struct samsung_galaxybook *galaxybook,
+				     const u8 performance_mode)
+{
+	struct sawb buf = {};
+
+	buf.safn = GB_SAFN;
+	buf.sasb = GB_SASB_PERFORMANCE_MODE;
+	export_guid(buf.caid, &GB_PERFORMANCE_MODE_GUID);
+	buf.fncn = GB_FNCN_PERFORMANCE_MODE;
+	buf.subn = GB_SUBN_PERFORMANCE_MODE_SET;
+	buf.iob0 = performance_mode;
+
+	return galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_PERFORMANCE_MODE,
+				      &buf, GB_SAWB_LEN_PERFORMANCE_MODE);
+}
+
+static int get_performance_mode_profile(struct samsung_galaxybook *galaxybook,
+					const u8 performance_mode,
+					enum platform_profile_option *profile)
+{
+	switch (performance_mode) {
+	case GB_PERFORMANCE_MODE_FANOFF:
+		*profile = PLATFORM_PROFILE_LOW_POWER;
+		break;
+	case GB_PERFORMANCE_MODE_LOWNOISE:
+		*profile = PLATFORM_PROFILE_QUIET;
+		break;
+	case GB_PERFORMANCE_MODE_OPTIMIZED:
+	case GB_PERFORMANCE_MODE_OPTIMIZED_V2:
+		*profile = PLATFORM_PROFILE_BALANCED;
+		break;
+	case GB_PERFORMANCE_MODE_PERFORMANCE:
+	case GB_PERFORMANCE_MODE_PERFORMANCE_V2:
+	case GB_PERFORMANCE_MODE_ULTRA:
+		*profile = PLATFORM_PROFILE_PERFORMANCE;
+		break;
+	case GB_PERFORMANCE_MODE_IGNORE1:
+	case GB_PERFORMANCE_MODE_IGNORE2:
+		return -EOPNOTSUPP;
+	default:
+		dev_warn(&galaxybook->platform->dev,
+			 "unrecognized performance mode 0x%x\n", performance_mode);
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+static int galaxybook_platform_profile_get(struct device *dev,
+					   enum platform_profile_option *profile)
+{
+	struct samsung_galaxybook *galaxybook = dev_get_drvdata(dev);
+	u8 performance_mode;
+	int err;
+
+	err = performance_mode_acpi_get(galaxybook, &performance_mode);
+	if (err)
+		return err;
+
+	return get_performance_mode_profile(galaxybook, performance_mode, profile);
+}
+
+static int galaxybook_platform_profile_set(struct device *dev,
+					   enum platform_profile_option profile)
+{
+	struct samsung_galaxybook *galaxybook = dev_get_drvdata(dev);
+
+	return performance_mode_acpi_set(galaxybook,
+					 galaxybook->profile_performance_modes[profile]);
+}
+
+static int galaxybook_platform_profile_probe(void *drvdata, unsigned long *choices)
+{
+	struct samsung_galaxybook *galaxybook = drvdata;
+	u8 *perfmodes = galaxybook->profile_performance_modes;
+	enum platform_profile_option profile;
+	struct sawb buf = {};
+	unsigned int i;
+	int err;
+
+	buf.safn = GB_SAFN;
+	buf.sasb = GB_SASB_PERFORMANCE_MODE;
+	export_guid(buf.caid, &GB_PERFORMANCE_MODE_GUID);
+	buf.fncn = GB_FNCN_PERFORMANCE_MODE;
+	buf.subn = GB_SUBN_PERFORMANCE_MODE_LIST;
+
+	err = galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_PERFORMANCE_MODE,
+				     &buf, GB_SAWB_LEN_PERFORMANCE_MODE);
+	if (err) {
+		dev_dbg(&galaxybook->platform->dev,
+			"failed to get supported performance modes, error %d\n", err);
+		return err;
+	}
+
+	/* set initial default profile performance mode values */
+	perfmodes[PLATFORM_PROFILE_LOW_POWER] = GB_PERFORMANCE_MODE_FANOFF;
+	perfmodes[PLATFORM_PROFILE_QUIET] = GB_PERFORMANCE_MODE_LOWNOISE;
+	perfmodes[PLATFORM_PROFILE_BALANCED] = GB_PERFORMANCE_MODE_OPTIMIZED;
+	perfmodes[PLATFORM_PROFILE_PERFORMANCE] = GB_PERFORMANCE_MODE_PERFORMANCE;
+
+	/*
+	 * Value returned in iob0 will have the number of supported performance
+	 * modes per device. The performance mode values will then be given as a
+	 * list after this (iob1-iobX). Loop through the supported values and
+	 * enable their mapped platform_profile choice, overriding "legacy"
+	 * values along the way if a non-legacy value exists.
+	 */
+	for (i = 1; i <= buf.iob0; i++) {
+		err = get_performance_mode_profile(galaxybook, buf.iobs[i], &profile);
+		if (err) {
+			dev_dbg(&galaxybook->platform->dev,
+				"ignoring unmapped performance mode 0x%x\n", buf.iobs[i]);
+			continue;
+		}
+		switch (buf.iobs[i]) {
+		case GB_PERFORMANCE_MODE_OPTIMIZED_V2:
+			perfmodes[profile] = GB_PERFORMANCE_MODE_OPTIMIZED_V2;
+			break;
+		case GB_PERFORMANCE_MODE_PERFORMANCE_V2:
+			/* only update if not already overwritten by Ultra */
+			if (perfmodes[profile] != GB_PERFORMANCE_MODE_ULTRA)
+				perfmodes[profile] = GB_PERFORMANCE_MODE_PERFORMANCE_V2;
+			break;
+		case GB_PERFORMANCE_MODE_ULTRA:
+			perfmodes[profile] = GB_PERFORMANCE_MODE_ULTRA;
+			break;
+		default:
+			break;
+		}
+		set_bit(profile, choices);
+		dev_dbg(&galaxybook->platform->dev,
+			"setting platform profile %d to use performance mode 0x%x\n",
+			profile, perfmodes[profile]);
+	}
+
+	/* initialize performance_mode using balanced's mapped value */
+	if (test_bit(PLATFORM_PROFILE_BALANCED, choices))
+		return performance_mode_acpi_set(galaxybook, perfmodes[PLATFORM_PROFILE_BALANCED]);
+
+	return 0;
+}
+
+static const struct platform_profile_ops galaxybook_platform_profile_ops = {
+	.probe = galaxybook_platform_profile_probe,
+	.profile_get = galaxybook_platform_profile_get,
+	.profile_set = galaxybook_platform_profile_set,
+};
+
+static int galaxybook_platform_profile_init(struct samsung_galaxybook *galaxybook)
+{
+	struct device *platform_profile_dev;
+	u8 performance_mode;
+	int err;
+
+	err = performance_mode_acpi_get(galaxybook, &performance_mode);
+	if (err) {
+		dev_dbg(&galaxybook->platform->dev,
+			"failed to get initial performance mode, error %d\n", err);
+		return GB_NOT_SUPPORTED;
+	}
+
+	platform_profile_dev = devm_platform_profile_register(&galaxybook->platform->dev,
+							      DRIVER_NAME, galaxybook,
+							      &galaxybook_platform_profile_ops);
+
+	return PTR_ERR_OR_ZERO(platform_profile_dev);
+}
+
+/*
+ * Firmware Attributes
+ */
+
+/* Power on lid open (device should power on when lid is opened) */
+
+static int power_on_lid_open_acpi_get(struct samsung_galaxybook *galaxybook, bool *value)
+{
+	struct sawb buf = {};
+	int err;
+
+	buf.safn = GB_SAFN;
+	buf.sasb = GB_SASB_POWER_MANAGEMENT;
+	buf.gunm = GB_GUNM_POWER_MANAGEMENT;
+	buf.guds[0] = GB_GUDS_POWER_ON_LID_OPEN;
+	buf.guds[1] = GB_GUDS_POWER_ON_LID_OPEN_GET;
+
+	err = galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTINGS,
+				     &buf, GB_SAWB_LEN_SETTINGS);
+	if (err)
+		return err;
+
+	*value = buf.guds[1];
+
+	return 0;
+}
+
+static int power_on_lid_open_acpi_set(struct samsung_galaxybook *galaxybook, const bool value)
+{
+	struct sawb buf = {};
+
+	lockdep_assert_held(&galaxybook->fw_attr_lock);
+
+	buf.safn = GB_SAFN;
+	buf.sasb = GB_SASB_POWER_MANAGEMENT;
+	buf.gunm = GB_GUNM_POWER_MANAGEMENT;
+	buf.guds[0] = GB_GUDS_POWER_ON_LID_OPEN;
+	buf.guds[1] = GB_GUDS_POWER_ON_LID_OPEN_SET;
+	buf.guds[2] = value ? 1 : 0;
+
+	return galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTINGS,
+				      &buf, GB_SAWB_LEN_SETTINGS);
+}
+
+/* USB Charging (USB ports can provide power when device is powered off) */
+
+static int usb_charging_acpi_get(struct samsung_galaxybook *galaxybook, bool *value)
+{
+	struct sawb buf = {};
+	int err;
+
+	buf.safn = GB_SAFN;
+	buf.sasb = GB_SASB_USB_CHARGING_GET;
+	buf.gunm = GB_GUNM_USB_CHARGING_GET;
+
+	err = galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTINGS,
+				     &buf, GB_SAWB_LEN_SETTINGS);
+	if (err)
+		return err;
+
+	*value = buf.gunm == 1;
+
+	return 0;
+}
+
+static int usb_charging_acpi_set(struct samsung_galaxybook *galaxybook, const bool value)
+{
+	struct sawb buf = {};
+
+	lockdep_assert_held(&galaxybook->fw_attr_lock);
+
+	buf.safn = GB_SAFN;
+	buf.sasb = GB_SASB_USB_CHARGING_SET;
+	buf.gunm = value ? GB_GUNM_USB_CHARGING_ON : GB_GUNM_USB_CHARGING_OFF;
+
+	return galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTINGS,
+				      &buf, GB_SAWB_LEN_SETTINGS);
+}
+
+/* Block recording (blocks access to camera and microphone) */
+
+static int block_recording_acpi_get(struct samsung_galaxybook *galaxybook, bool *value)
+{
+	struct sawb buf = {};
+	int err;
+
+	buf.safn = GB_SAFN;
+	buf.sasb = GB_SASB_BLOCK_RECORDING;
+	buf.gunm = GB_GUNM_GET;
+
+	err = galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTINGS,
+				     &buf, GB_SAWB_LEN_SETTINGS);
+	if (err)
+		return err;
+
+	*value = buf.gunm == GB_BLOCK_RECORDING_ON;
+
+	return 0;
+}
+
+static int block_recording_acpi_set(struct samsung_galaxybook *galaxybook, const bool value)
+{
+	struct sawb buf = {};
+	int err;
+
+	lockdep_assert_held(&galaxybook->fw_attr_lock);
+
+	buf.safn = GB_SAFN;
+	buf.sasb = GB_SASB_BLOCK_RECORDING;
+	buf.gunm = GB_GUNM_SET;
+	buf.guds[0] = value ? GB_BLOCK_RECORDING_ON : GB_BLOCK_RECORDING_OFF;
+
+	err = galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTINGS,
+				     &buf, GB_SAWB_LEN_SETTINGS);
+	if (err)
+		return err;
+
+	input_report_switch(galaxybook->camera_lens_cover_switch,
+			    SW_CAMERA_LENS_COVER, value ? 1 : 0);
+	input_sync(galaxybook->camera_lens_cover_switch);
+
+	return 0;
+}
+
+static int galaxybook_block_recording_init(struct samsung_galaxybook *galaxybook)
+{
+	bool value;
+	int err;
+
+	err = galaxybook_enable_acpi_feature(galaxybook, GB_SASB_BLOCK_RECORDING);
+	if (err) {
+		dev_dbg(&galaxybook->platform->dev,
+			"failed to initialize block_recording, error %d\n", err);
+		return GB_NOT_SUPPORTED;
+	}
+
+	guard(mutex)(&galaxybook->fw_attr_lock);
+
+	err = block_recording_acpi_get(galaxybook, &value);
+	if (err) {
+		dev_dbg(&galaxybook->platform->dev,
+			"failed to get initial block_recording state, error %d\n", err);
+		return GB_NOT_SUPPORTED;
+	}
+
+	galaxybook->camera_lens_cover_switch =
+		devm_input_allocate_device(&galaxybook->platform->dev);
+	if (!galaxybook->camera_lens_cover_switch)
+		return -ENOMEM;
+
+	galaxybook->camera_lens_cover_switch->name = "Samsung Galaxy Book Camera Lens Cover";
+	galaxybook->camera_lens_cover_switch->phys = DRIVER_NAME "/input0";
+	galaxybook->camera_lens_cover_switch->id.bustype = BUS_HOST;
+
+	input_set_capability(galaxybook->camera_lens_cover_switch, EV_SW, SW_CAMERA_LENS_COVER);
+
+	err = input_register_device(galaxybook->camera_lens_cover_switch);
+	if (err)
+		return err;
+
+	input_report_switch(galaxybook->camera_lens_cover_switch,
+			    SW_CAMERA_LENS_COVER, value ? 1 : 0);
+	input_sync(galaxybook->camera_lens_cover_switch);
+
+	return 0;
+}
+
+/* Firmware Attributes setup */
+
+static ssize_t type_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "enumeration\n");
+}
+
+static struct kobj_attribute fw_attr_type = __ATTR_RO(type);
+
+static ssize_t default_value_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "0\n");
+}
+
+static struct kobj_attribute fw_attr_default_value = __ATTR_RO(default_value);
+
+static ssize_t possible_values_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "0;1\n");
+}
+
+static struct kobj_attribute fw_attr_possible_values = __ATTR_RO(possible_values);
+
+static ssize_t display_name_language_code_show(struct kobject *kobj, struct kobj_attribute *attr,
+					       char *buf)
+{
+	return sysfs_emit(buf, "%s\n", GB_ATTR_LANGUAGE_CODE);
+}
+
+static struct kobj_attribute fw_attr_display_name_language_code =
+	__ATTR_RO(display_name_language_code);
+
+static ssize_t display_name_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
+{
+	struct galaxybook_fw_attr *fw_attr =
+		container_of(attr, struct galaxybook_fw_attr, display_name);
+
+	return sysfs_emit(buf, "%s\n", galaxybook_fw_attr_desc[fw_attr->fw_attr_id]);
+}
+
+static ssize_t current_value_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
+{
+	struct galaxybook_fw_attr *fw_attr =
+		container_of(attr, struct galaxybook_fw_attr, current_value);
+	bool value;
+	int err;
+
+	err = fw_attr->get_value(fw_attr->galaxybook, &value);
+	if (err)
+		return err;
+
+	return sysfs_emit(buf, "%u\n", value);
+}
+
+static ssize_t current_value_store(struct kobject *kobj, struct kobj_attribute *attr,
+				   const char *buf, size_t count)
+{
+	struct galaxybook_fw_attr *fw_attr =
+		container_of(attr, struct galaxybook_fw_attr, current_value);
+	struct samsung_galaxybook *galaxybook = fw_attr->galaxybook;
+	bool value;
+	int err;
+
+	if (!count)
+		return -EINVAL;
+
+	err = kstrtobool(buf, &value);
+	if (err)
+		return err;
+
+	guard(mutex)(&galaxybook->fw_attr_lock);
+
+	err = fw_attr->set_value(galaxybook, value);
+	if (err)
+		return err;
+
+	return count;
+}
+
+#define NUM_FW_ATTR_ENUM_ATTRS  6
+
+static int galaxybook_fw_attr_init(struct samsung_galaxybook *galaxybook,
+				   const enum galaxybook_fw_attr_id fw_attr_id,
+				   int (*get_value)(struct samsung_galaxybook *galaxybook,
+						    bool *value),
+				   int (*set_value)(struct samsung_galaxybook *galaxybook,
+						    const bool value))
+{
+	struct galaxybook_fw_attr *fw_attr;
+	struct attribute **attrs;
+
+	fw_attr = devm_kzalloc(&galaxybook->platform->dev, sizeof(*fw_attr), GFP_KERNEL);
+	if (!fw_attr)
+		return -ENOMEM;
+
+	attrs = devm_kcalloc(&galaxybook->platform->dev, NUM_FW_ATTR_ENUM_ATTRS + 1,
+			     sizeof(*attrs), GFP_KERNEL);
+	if (!attrs)
+		return -ENOMEM;
+
+	attrs[0] = &fw_attr_type.attr;
+	attrs[1] = &fw_attr_default_value.attr;
+	attrs[2] = &fw_attr_possible_values.attr;
+	attrs[3] = &fw_attr_display_name_language_code.attr;
+
+	sysfs_attr_init(&fw_attr.display_name);
+	fw_attr->display_name.attr.name = "display_name";
+	fw_attr->display_name.attr.mode = 0444;
+	fw_attr->display_name.show = display_name_show;
+	attrs[4] = &fw_attr->display_name.attr;
+
+	sysfs_attr_init(&fw_attr.current_value);
+	fw_attr->current_value.attr.name = "current_value";
+	fw_attr->current_value.attr.mode = 0644;
+	fw_attr->current_value.show = current_value_show;
+	fw_attr->current_value.store = current_value_store;
+	attrs[5] = &fw_attr->current_value.attr;
+
+	attrs[6] = NULL;
+
+	fw_attr->galaxybook = galaxybook;
+	fw_attr->fw_attr_id = fw_attr_id;
+	fw_attr->attr_group.name = galaxybook_fw_attr_name[fw_attr_id];
+	fw_attr->attr_group.attrs = attrs;
+	fw_attr->get_value = get_value;
+	fw_attr->set_value = set_value;
+
+	return sysfs_create_group(&galaxybook->fw_attrs_kset->kobj, &fw_attr->attr_group);
+}
+
+static void galaxybook_kset_unregister(void *data)
+{
+	struct kset *kset = data;
+
+	kset_unregister(kset);
+}
+
+static void galaxybook_fw_attrs_dev_unregister(void *data)
+{
+	struct device *fw_attrs_dev = data;
+
+	device_unregister(fw_attrs_dev);
+}
+
+static int galaxybook_fw_attrs_init(struct samsung_galaxybook *galaxybook)
+{
+	bool value;
+	int err;
+
+	err = devm_mutex_init(&galaxybook->platform->dev, &galaxybook->fw_attr_lock);
+	if (err)
+		return err;
+
+	galaxybook->fw_attrs_dev = device_create(&firmware_attributes_class, NULL, MKDEV(0, 0),
+						 NULL, "%s", DRIVER_NAME);
+	if (IS_ERR(galaxybook->fw_attrs_dev))
+		return PTR_ERR(galaxybook->fw_attrs_dev);
+
+	err = devm_add_action_or_reset(&galaxybook->platform->dev,
+				       galaxybook_fw_attrs_dev_unregister,
+				       galaxybook->fw_attrs_dev);
+	if (err)
+		return err;
+
+	galaxybook->fw_attrs_kset = kset_create_and_add("attributes", NULL,
+							&galaxybook->fw_attrs_dev->kobj);
+	if (!galaxybook->fw_attrs_kset)
+		return -ENOMEM;
+	err = devm_add_action_or_reset(&galaxybook->platform->dev,
+				       galaxybook_kset_unregister, galaxybook->fw_attrs_kset);
+	if (err)
+		return err;
+
+	err = power_on_lid_open_acpi_get(galaxybook, &value);
+	if (!err) {
+		err = galaxybook_fw_attr_init(galaxybook,
+					      GB_ATTR_POWER_ON_LID_OPEN,
+					      &power_on_lid_open_acpi_get,
+					      &power_on_lid_open_acpi_set);
+		if (err)
+			return err;
+	}
+
+	err = usb_charging_acpi_get(galaxybook, &value);
+	if (!err) {
+		err = galaxybook_fw_attr_init(galaxybook,
+					      GB_ATTR_USB_CHARGING,
+					      &usb_charging_acpi_get,
+					      &usb_charging_acpi_set);
+		if (err)
+			return err;
+	}
+
+	err = galaxybook_block_recording_init(galaxybook);
+	if (!err)
+		galaxybook->has_block_recording = true;
+	else if (err != GB_NOT_SUPPORTED)
+		return err;
+
+	return galaxybook_fw_attr_init(galaxybook,
+				       GB_ATTR_BLOCK_RECORDING,
+				       &block_recording_acpi_get,
+				       &block_recording_acpi_set);
+}
+
+/*
+ * Hotkeys and notifications
+ */
+
+static void galaxybook_kbd_backlight_hotkey_work(struct work_struct *work)
+{
+	struct samsung_galaxybook *galaxybook =
+		from_work(galaxybook, work, kbd_backlight_hotkey_work);
+	int brightness;
+	int err;
+
+	guard(mutex)(&galaxybook->kbd_backlight_lock);
+
+	brightness = galaxybook->kbd_backlight.brightness;
+	if (brightness < galaxybook->kbd_backlight.max_brightness)
+		brightness++;
+	else
+		brightness = 0;
+
+	err = led_set_brightness_sync(&galaxybook->kbd_backlight, brightness);
+	if (err) {
+		dev_err(&galaxybook->platform->dev,
+			"failed to set kbd_backlight brightness, error %d\n", err);
+		return;
+	}
+
+	led_classdev_notify_brightness_hw_changed(&galaxybook->kbd_backlight, brightness);
+}
+
+static void galaxybook_block_recording_hotkey_work(struct work_struct *work)
+{
+	struct samsung_galaxybook *galaxybook =
+		from_work(galaxybook, work, block_recording_hotkey_work);
+	bool value;
+	int err;
+
+	guard(mutex)(&galaxybook->fw_attr_lock);
+
+	err = block_recording_acpi_get(galaxybook, &value);
+	if (err) {
+		dev_err(&galaxybook->platform->dev,
+			"failed to get block_recording, error %d\n", err);
+		return;
+	}
+
+	err = block_recording_acpi_set(galaxybook, !value);
+	if (err)
+		dev_err(&galaxybook->platform->dev,
+			"failed to set block_recording, error %d\n", err);
+}
+
+static bool galaxybook_i8042_filter(unsigned char data, unsigned char str, struct serio *port,
+				    void *context)
+{
+	struct samsung_galaxybook *galaxybook = context;
+	static bool extended;
+
+	if (str & I8042_STR_AUXDATA)
+		return false;
+
+	if (data == 0xe0) {
+		extended = true;
+		return true;
+	} else if (extended) {
+		extended = false;
+		switch (data) {
+		case GB_KEY_KBD_BACKLIGHT_KEYDOWN:
+			return true;
+		case GB_KEY_KBD_BACKLIGHT_KEYUP:
+			if (galaxybook->has_kbd_backlight)
+				schedule_work(&galaxybook->kbd_backlight_hotkey_work);
+			return true;
+
+		case GB_KEY_BLOCK_RECORDING_KEYDOWN:
+			return true;
+		case GB_KEY_BLOCK_RECORDING_KEYUP:
+			if (galaxybook->has_block_recording)
+				schedule_work(&galaxybook->block_recording_hotkey_work);
+			return true;
+
+		/* battery notification already sent to battery + SCAI device */
+		case GB_KEY_BATTERY_NOTIFY_KEYUP:
+		case GB_KEY_BATTERY_NOTIFY_KEYDOWN:
+			return true;
+
+		default:
+			/*
+			 * Report the previously filtered e0 before continuing
+			 * with the next non-filtered byte.
+			 */
+			serio_interrupt(port, 0xe0, 0);
+			return false;
+		}
+	}
+
+	return false;
+}
+
+static void galaxybook_i8042_filter_remove(void *data)
+{
+	struct samsung_galaxybook *galaxybook = data;
+
+	i8042_remove_filter(galaxybook_i8042_filter);
+	cancel_work_sync(&galaxybook->kbd_backlight_hotkey_work);
+	cancel_work_sync(&galaxybook->block_recording_hotkey_work);
+}
+
+static int galaxybook_i8042_filter_install(struct samsung_galaxybook *galaxybook)
+{
+	int err;
+
+	if (!galaxybook->has_kbd_backlight && !galaxybook->has_block_recording)
+		return 0;
+
+	INIT_WORK(&galaxybook->kbd_backlight_hotkey_work,
+		  galaxybook_kbd_backlight_hotkey_work);
+	INIT_WORK(&galaxybook->block_recording_hotkey_work,
+		  galaxybook_block_recording_hotkey_work);
+
+	err = i8042_install_filter(galaxybook_i8042_filter, galaxybook);
+	if (err)
+		return err;
+
+	return devm_add_action_or_reset(&galaxybook->platform->dev,
+					galaxybook_i8042_filter_remove, galaxybook);
+}
+
+/*
+ * ACPI device setup
+ */
+
+static void galaxybook_acpi_notify(acpi_handle handle, u32 event, void *data)
+{
+	struct samsung_galaxybook *galaxybook = data;
+
+	switch (event) {
+	case GB_ACPI_NOTIFY_BATTERY_STATE_CHANGED:
+	case GB_ACPI_NOTIFY_DEVICE_ON_TABLE:
+	case GB_ACPI_NOTIFY_DEVICE_OFF_TABLE:
+		break;
+	case GB_ACPI_NOTIFY_HOTKEY_PERFORMANCE_MODE:
+		if (galaxybook->has_performance_mode)
+			platform_profile_cycle();
+		break;
+	default:
+		dev_warn(&galaxybook->platform->dev,
+			 "unknown ACPI notification event: 0x%x\n", event);
+	}
+
+	acpi_bus_generate_netlink_event(DRIVER_NAME, dev_name(&galaxybook->platform->dev),
+					event, 1);
+}
+
+static int galaxybook_enable_acpi_notify(struct samsung_galaxybook *galaxybook)
+{
+	struct sawb buf = {};
+	int err;
+
+	err = galaxybook_enable_acpi_feature(galaxybook, GB_SASB_NOTIFICATIONS);
+	if (err)
+		return err;
+
+	buf.safn = GB_SAFN;
+	buf.sasb = GB_SASB_NOTIFICATIONS;
+	buf.gunm = GB_GUNM_ACPI_NOTIFY_ENABLE;
+	buf.guds[0] = GB_GUDS_ACPI_NOTIFY_ENABLE;
+
+	return galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTINGS,
+				      &buf, GB_SAWB_LEN_SETTINGS);
+}
+
+static void galaxybook_acpi_remove_notify_handler(void *data)
+{
+	struct samsung_galaxybook *galaxybook = data;
+
+	acpi_remove_notify_handler(galaxybook->acpi->handle, ACPI_ALL_NOTIFY,
+				   galaxybook_acpi_notify);
+}
+
+static void galaxybook_acpi_disable(void *data)
+{
+	struct samsung_galaxybook *galaxybook = data;
+
+	acpi_execute_simple_method(galaxybook->acpi->handle,
+				   GB_ACPI_METHOD_ENABLE, GB_ACPI_METHOD_ENABLE_OFF);
+}
+
+static int galaxybook_acpi_init(struct samsung_galaxybook *galaxybook)
+{
+	acpi_status status;
+	int err;
+
+	status = acpi_execute_simple_method(galaxybook->acpi->handle, GB_ACPI_METHOD_ENABLE,
+					    GB_ACPI_METHOD_ENABLE_ON);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+	err = devm_add_action_or_reset(&galaxybook->platform->dev,
+				       galaxybook_acpi_disable, galaxybook);
+	if (err)
+		return err;
+
+	status = acpi_install_notify_handler(galaxybook->acpi->handle, ACPI_ALL_NOTIFY,
+					     galaxybook_acpi_notify, galaxybook);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+	err = devm_add_action_or_reset(&galaxybook->platform->dev,
+				       galaxybook_acpi_remove_notify_handler, galaxybook);
+	if (err)
+		return err;
+
+	err = galaxybook_enable_acpi_notify(galaxybook);
+	if (err)
+		dev_dbg(&galaxybook->platform->dev, "failed to enable ACPI notifications; "
+			"some hotkeys will not be supported\n");
+
+	err = galaxybook_enable_acpi_feature(galaxybook, GB_SASB_POWER_MANAGEMENT);
+	if (err)
+		dev_dbg(&galaxybook->platform->dev,
+			"failed to initialize ACPI power management features; "
+			"many features of this driver will not be available\n");
+
+	return 0;
+}
+
+/*
+ * Platform driver
+ */
+
+static int galaxybook_probe(struct platform_device *pdev)
+{
+	struct acpi_device *adev = ACPI_COMPANION(&pdev->dev);
+	struct samsung_galaxybook *galaxybook;
+	int err;
+
+	if (!adev)
+		return -ENODEV;
+
+	galaxybook = devm_kzalloc(&pdev->dev, sizeof(*galaxybook), GFP_KERNEL);
+	if (!galaxybook)
+		return -ENOMEM;
+
+	galaxybook->platform = pdev;
+	galaxybook->acpi = adev;
+
+	/*
+	 * Features must be enabled and initialized in the following order to
+	 * avoid failures seen on certain devices:
+	 * - GB_SASB_POWER_MANAGEMENT (including performance mode)
+	 * - GB_SASB_KBD_BACKLIGHT
+	 * - GB_SASB_BLOCK_RECORDING (as part of fw_attrs init)
+	 */
+
+	err = galaxybook_acpi_init(galaxybook);
+	if (err)
+		return dev_err_probe(&galaxybook->platform->dev, err,
+				     "failed to initialize ACPI device\n");
+
+	err = galaxybook_platform_profile_init(galaxybook);
+	if (!err)
+		galaxybook->has_performance_mode = true;
+	else if (err != GB_NOT_SUPPORTED)
+		return dev_err_probe(&galaxybook->platform->dev, err,
+				     "failed to initialize platform profile\n");
+
+	err = galaxybook_battery_threshold_init(galaxybook);
+	if (err)
+		return dev_err_probe(&galaxybook->platform->dev, err,
+				     "failed to initialize battery threshold\n");
+
+	err = galaxybook_kbd_backlight_init(galaxybook);
+	if (!err)
+		galaxybook->has_kbd_backlight = true;
+	else if (err != GB_NOT_SUPPORTED)
+		return dev_err_probe(&galaxybook->platform->dev, err,
+				     "failed to initialize kbd_backlight\n");
+
+	err = galaxybook_fw_attrs_init(galaxybook);
+	if (err)
+		return dev_err_probe(&galaxybook->platform->dev, err,
+				     "failed to initialize firmware-attributes\n");
+
+	err = galaxybook_i8042_filter_install(galaxybook);
+	if (err)
+		return dev_err_probe(&galaxybook->platform->dev, err,
+				     "failed to initialize i8042_filter\n");
+
+	return 0;
+}
+
+static const struct acpi_device_id galaxybook_device_ids[] = {
+	{ "SAM0427" },
+	{ "SAM0428" },
+	{ "SAM0429" },
+	{ "SAM0430" },
+	{}
+};
+MODULE_DEVICE_TABLE(acpi, galaxybook_device_ids);
+
+static struct platform_driver galaxybook_platform_driver = {
+	.driver = {
+		.name = DRIVER_NAME,
+		.acpi_match_table = galaxybook_device_ids,
+	},
+	.probe = galaxybook_probe,
+};
+module_platform_driver(galaxybook_platform_driver);
+
+MODULE_AUTHOR("Joshua Grisham <josh@joshuagrisham.com>");
+MODULE_DESCRIPTION("Samsung Galaxy Book driver");
+MODULE_LICENSE("GPL");
-- 
2.45.2

