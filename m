Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FAB1624C0;
	Mon, 28 Apr 2025 01:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745803249; cv=none; b=fWRDNYGscT8bQqpl9oRSwQdmsi7fBwX9E/vxV4CJs+eSwKnpRKwUfJXNquLXBUnlji6GrsbMnxYxg9mWt2QgcUWvjcnU7OJrpbsgZAjrRp9kxmvDKJAStONUNMfEY4QoLGNv8afJ0VDAsnUqs/QW8HE7pH2zGKs6+gfcjajI3I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745803249; c=relaxed/simple;
	bh=ZlODCxyvMpSQIWyULeF0bFpy45aKf4XgzDvCvJE94dc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ny2r29s0I3QqR+lMACNcS6OEvF8L6amJO8LeOmW0hMdWRazhu0AR9fqSnLCHqKreUs/FggFdMAX8Pi38nrFDrYH5vtym9URuLAPJLjAEfNUyWy146r9+HRrUrXGjpc/rfSqj4VzaxZOHmTRahDSVun6+11qNsxzGYj7RwyXgl+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SynANfIl; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SynANfIl"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-227d6b530d8so45089675ad.3;
        Sun, 27 Apr 2025 18:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745803246; x=1746408046; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e0gj1XjFhOllJ6JtgGa/0jg7f5Xh1Ca0h/OnquTmdFo=;
        b=SynANfIlT8eTDA7ikt1GNP/Zjx5nRZllxw/FmkpBh4/gGfmC2j9KYv8S93mWsw6+3b
         +UXmuG1G1lN8cB5DgsfH7jWPbvfMjGEdN3CrDb17/56woljcZNVmMqkfmSJYU3ls+0xh
         VfSfvqTg14aToC8YGNAn/ztO6W2ZEfcber0bL+0w6za7JWrKWbUlV8agOY7Ron4O7jJk
         +p0AT7i4xvO/eXKussfZtbo1r1EUVbEuHQy+0aLs3qlOj2GrkZ1vG2fUmDeo7nHQQq7u
         dHZ0nBSLd+5KE0B/S5wLAnFpGTHfRl+kon5WWyuZsT/ZcaqsNAiqcbP51c4OSxemByJ7
         BY2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745803246; x=1746408046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e0gj1XjFhOllJ6JtgGa/0jg7f5Xh1Ca0h/OnquTmdFo=;
        b=Qd4T/1RdZ9U5gv7AxXbfByLHLSbmNXLDSxpx2A3yCFOlYs7JLI/cUi4RuQzFLB8RJc
         yPc6LOBiSbDfDIwdqM8XZlkP5f8GM6zcS/O/gLfnq7KwEqMfAhTUFYB+uiB9IjttGP+i
         UOKLZH110Ri0suRgnPsqXIKc/ztUOsDqiwdq4BKVIVuYCOY3u4H4so98qSiK0mxU5zKx
         yHYS5vRfB8gbVx0k7Fy2avm/ysRG+K8xJTwV52OSzoRY4Zg1tSfjc6/RkKMhIJW0jMFL
         +BmiYnhmtyxv9k4POkm4J5JwrA4QYytZekyp8mUUeDpSRmk6ORp8CIzVJNjfrZz2/4aH
         bR8w==
X-Forwarded-Encrypted: i=1; AJvYcCVhryGftMR8pMg91mpn47k4aMjDgQcom8TTlAl0sfmxSbsrjcaZXVUwrBXZg0qoWUgZhRDVXuTE91I=@vger.kernel.org, AJvYcCWP8gpmnCG1YakLzce9QlRNJbBwleqthoUmOl+xAH3yGLr6hlQxd/VIRMp/HMiBCca3pRpoPKdoAKDt2Agk@vger.kernel.org, AJvYcCXRY7FlX6XQKxzUlaxqCxcT4qOfnpWCNMoo+w0MRR6UHjLvKuWgZDZnOSiqZC7X+6V0E3y4nsYgfXmukM2Wp8p1qo75uw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMbPJuSm9XUxnPlLi0ksSzBXxwS3isyf0MDiSRTu3jPYXhHLG+
	oCFMIz1MMzpKWM4Uuhjxlt85XVYFIsyjN928c8RnRORJ8QN0Nwwq
X-Gm-Gg: ASbGnctixbEBfuGrla8kXPz9P3O8YTwRnHkkhfyn8mxgwNSMv32MSOn4mAeX0gtLZDr
	aCdPsjdSlBelt6VyPFrDo2HuZfDiqhkrn0Zq0M6nIyLe7xWeWNzOkXUM7R4W+yXRYG4K05mDzwa
	GQvPVvuplns/Oy5zUOQBaxzzO7OqEXOkCvbZmpRRM1ZG659bePKfZvl2ovILZTmfyHVJGKI5v8i
	OCodpjCcUySZMvsqADomTStD4ve2LsxPZNs9QZueNeXMZ5GFRpnbW0DetkqrvW9ESgsfpOs/9WZ
	J3m4PhUwGKK/9ZkUoUqA0kq3gREw2adDAmhVR1EIy9LJzd4HsRrx1Fa90BJgj7O9Hd6oKIBXzH7
	iw3CaJf0p1gICvIctl0WHLE7KbdR6bmTp7sxj6HY=
X-Google-Smtp-Source: AGHT+IGjLGuaSh6aIZosvOaYOtXCRTalx3nm+tQLokV2jBS56OKs5UWczP7x1qCke4l472XAppL83A==
X-Received: by 2002:a17:902:ce8b:b0:223:501c:7576 with SMTP id d9443c01a7336-22dbf5ef67dmr159038315ad.12.1745803246386;
        Sun, 27 Apr 2025 18:20:46 -0700 (PDT)
Received: from localhost.localdomain (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5216ba5sm70334725ad.222.2025.04.27.18.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 18:20:46 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Armin Wolf <W_Armin@gmx.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Mario Limonciello <superm1@kernel.org>,
	Luke Jones <luke@ljones.dev>,
	Xino Ni <nijs1@lenovo.com>,
	Zhixin Zhang <zhangzx36@lenovo.com>,
	Mia Shao <shaohz1@lenovo.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	"Cody T . -H . Chiu" <codyit@gmail.com>,
	John Martens <johnfanv2@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 5/6] platform/x86: Add Lenovo WMI Gamezone Driver
Date: Sun, 27 Apr 2025 18:18:05 -0700
Message-ID: <20250428012029.970017-6-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250428012029.970017-1-derekjohn.clark@gmail.com>
References: <20250428012029.970017-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds lenovo-wmi-gamezone driver which provides the Lenovo Gamezone WMI
interface that comes on Lenovo "Gaming Series" hardware. Provides ACPI
platform profiles over WMI.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
v6:
- Switch to guard/scoped_guard instead of spin_lock/spin_unlock.
- Fix typos and rewordings from v5 review.
v5:
- Move to patch 5 of the series and omit the portions of the driver that
  rely on Other Mode.
- Rename most defines to clearly indicate they are defined in this
  driver.
- Misc fixes from v4 review.
v4:
- Add notifier blocks for the Events and Other Mode drivers.
- Remove notifier block chain head and all reference to Thermal Mode
  Event GUID.
- Add header for Gamezone specific structs and functions.
- Various fixes from review.
v3:
- Use notifier chain to report platform profile changes to any
  subscribed drivers.
- Adds THERMAL_MODE_EVENT GUID and .notify function to trigger notifier
  chain.
- Adds support for Extreme Mode profile on supported hardware, as well
  as a DMI quirk table for some devices that report extreme mode version
  support but so not have it fully implemented.
- Update to include recent changes to platform-profile.
v2:
- Use devm_kmalloc to ensure driver can be instanced, remove global
  reference.
- Ensure reverse Christmas tree for all variable declarations.
- Remove extra whitespace.
- Use guard(mutex) in all mutex instances, global mutex.
- Use pr_fmt instead of adding the driver name to each pr_err.
- Remove noisy pr_info usage.
- Rename gamezone_wmi to lenovo_wmi_gz_priv and gz_wmi to priv.
- Remove GZ_WMI symbol exporting.
 MAINTAINERS                                |   1 +
 drivers/platform/x86/Kconfig               |  14 +
 drivers/platform/x86/Makefile              |   1 +
 drivers/platform/x86/lenovo-wmi-gamezone.c | 374 +++++++++++++++++++++
 drivers/platform/x86/lenovo-wmi-gamezone.h |  20 ++
 5 files changed, 410 insertions(+)
 create mode 100644 drivers/platform/x86/lenovo-wmi-gamezone.c
 create mode 100644 drivers/platform/x86/lenovo-wmi-gamezone.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 1b22e41cc730..511d7547fdd9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13167,6 +13167,7 @@ F:	Documentation/wmi/devices/lenovo-wmi-other.rst
 F:	drivers/platform/x86/lenovo-wmi-capdata01.*
 F:	drivers/platform/x86/lenovo-wmi-events.*
+F:	drivers/platform/x86/lenovo-wmi-gamezone.*
 F:	drivers/platform/x86/lenovo-wmi-helpers.*
 
 LENOVO WMI HOTKEY UTILITIES DRIVER
 M:	Jackie Dong <xy-jackie@139.com>
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 64663667f0cb..aaa1a69c10ca 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -467,6 +467,20 @@ config LENOVO_WMI_HELPERS
 	tristate
 	depends on ACPI_WMI
 
+config LENOVO_WMI_GAMEZONE
+	tristate "Lenovo GameZone WMI Driver"
+	depends on ACPI_WMI
+	depends on DMI
+	select ACPI_PLATFORM_PROFILE
+	select LENOVO_WMI_EVENTS
+	select LENOVO_WMI_HELPERS
+	help
+	  Say Y here if you have a WMI aware Lenovo Legion device and would like to use the
+	  platform-profile firmware interface to manage power usage.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called lenovo-wmi-gamezone.
+
 config LENOVO_WMI_DATA01
 	tristate
 	depends on ACPI_WMI
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 7a35c77221b7..60058b547de2 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -71,6 +71,7 @@ obj-$(CONFIG_YT2_1380)		+= lenovo-yoga-tab2-pro-1380-fastcharger.o
 obj-$(CONFIG_LENOVO_WMI_CAMERA)	+= lenovo-wmi-camera.o
 obj-$(CONFIG_LENOVO_WMI_DATA01)	+= lenovo-wmi-capdata01.o
 obj-$(CONFIG_LENOVO_WMI_EVENTS)	+= lenovo-wmi-events.o
+obj-$(CONFIG_LENOVO_WMI_GAMEZONE)	+= lenovo-wmi-gamezone.o
 obj-$(CONFIG_LENOVO_WMI_HELPERS)	+= lenovo-wmi-helpers.o
 
 # Intel
diff --git a/drivers/platform/x86/lenovo-wmi-gamezone.c b/drivers/platform/x86/lenovo-wmi-gamezone.c
new file mode 100644
index 000000000000..713f7dbbabe2
--- /dev/null
+++ b/drivers/platform/x86/lenovo-wmi-gamezone.c
@@ -0,0 +1,374 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Lenovo GameZone WMI interface driver.
+ *
+ * The GameZone WMI interface provides platform profile and fan curve settings
+ * for devices that fall under the "Gaming Series" of Lenovo Legion devices.
+ *
+ * Copyright(C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
+ */
+
+#include "linux/cleanup.h"
+#include <linux/acpi.h>
+#include <linux/dmi.h>
+#include <linux/export.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/notifier.h>
+#include <linux/spinlock.h>
+#include <linux/platform_profile.h>
+#include <linux/types.h>
+#include <linux/wmi.h>
+
+#include "lenovo-wmi-events.h"
+#include "lenovo-wmi-gamezone.h"
+#include "lenovo-wmi-helpers.h"
+
+#define LENOVO_GAMEZONE_GUID "887B54E3-DDDC-4B2C-8B88-68A26A8835D0"
+
+#define LWMI_GZ_METHOD_ID_SMARTFAN_SUP 43
+#define LWMI_GZ_METHOD_ID_SMARTFAN_SET 44
+#define LWMI_GZ_METHOD_ID_SMARTFAN_GET 45
+
+static BLOCKING_NOTIFIER_HEAD(gz_chain_head);
+static DEFINE_SPINLOCK(gz_mode_lock); /* lwmi_gz_priv.current_mode RW lock */
+
+struct lwmi_gz_priv {
+	enum thermal_mode current_mode;
+	struct notifier_block event_nb;
+	struct notifier_block mode_nb;
+	struct wmi_device *wdev;
+	int extreme_supported;
+	struct device *ppdev;
+};
+
+struct quirk_entry {
+	int extreme_supported;
+};
+
+static struct quirk_entry quirk_no_extreme_bug = {
+	.extreme_supported = false,
+};
+
+/**
+ * lwmi_gz_event_call() - Call method for lenovo-wmi-events driver notifier.
+ * block call chain.
+ * @nb: The notifier_block registered to lenovo-wmi-events driver.
+ * @cmd: The event type.
+ * @data: The data to be updated by the event.
+ *
+ * For LWMI_EVENT_THERMAL_MODE, set current_mode and notify platform_profile
+ * of a change.
+ *
+ * Return: notifier_block status.
+ */
+static int lwmi_gz_event_call(struct notifier_block *nb, unsigned long cmd,
+			      void *data)
+{
+	enum thermal_mode *mode = data;
+	struct lwmi_gz_priv *priv;
+
+	priv = container_of(nb, struct lwmi_gz_priv, event_nb);
+
+	switch (cmd) {
+	case LWMI_EVENT_THERMAL_MODE:
+		scoped_guard(spinlock, &gz_mode_lock) {
+			priv->current_mode = *mode;
+		}
+		platform_profile_notify(priv->ppdev);
+		return NOTIFY_STOP;
+	default:
+		return NOTIFY_DONE;
+	}
+}
+
+/**
+ * lwmi_gz_thermal_mode_supported() - Get the version of the WMI
+ * interface to determine the support level.
+ * @wdev: The Gamezone WMI device.
+ * @supported: Pointer to return the support level with.
+ *
+ * Return: 0 on success, or an error code.
+ */
+static int lwmi_gz_thermal_mode_supported(struct wmi_device *wdev,
+					  int *supported)
+{
+	return lwmi_dev_evaluate_int(wdev, 0x0, LWMI_GZ_METHOD_ID_SMARTFAN_SUP,
+				     0, 0, supported);
+}
+
+/**
+ * lwmi_gz_thermal_mode_get() - Get the current thermal mode.
+ * @wdev: The Gamezone interface WMI device.
+ * @mode: Pointer to return the thermal mode with.
+ *
+ * Return: 0 on success, or an error code.
+ */
+static int lwmi_gz_thermal_mode_get(struct wmi_device *wdev,
+				    enum thermal_mode *mode)
+{
+	return lwmi_dev_evaluate_int(wdev, 0x0, LWMI_GZ_METHOD_ID_SMARTFAN_GET,
+				     0, 0, mode);
+}
+
+/**
+ * lwmi_gz_profile_get_get() - Get the current platform profile.
+ * @dev: the Gamezone interface parent device.
+ * @profile: Pointer to provide the current platform profile with.
+ *
+ * Call lwmi_gz_thermal_mode_get and convert the thermal mode into a platform
+ * profile based on the support level of the interface.
+ *
+ * Return: 0 on success, or an error code.
+ */
+static int lwmi_gz_profile_get(struct device *dev,
+			       enum platform_profile_option *profile)
+{
+	struct lwmi_gz_priv *priv = dev_get_drvdata(dev);
+	enum thermal_mode mode;
+	int ret;
+
+	ret = lwmi_gz_thermal_mode_get(priv->wdev, &mode);
+	if (ret)
+		return ret;
+
+	switch (mode) {
+	case LWMI_GZ_THERMAL_MODE_QUIET:
+		*profile = PLATFORM_PROFILE_LOW_POWER;
+		break;
+	case LWMI_GZ_THERMAL_MODE_BALANCED:
+		*profile = PLATFORM_PROFILE_BALANCED;
+		break;
+	case LWMI_GZ_THERMAL_MODE_PERFORMANCE:
+		if (priv->extreme_supported) {
+			*profile = PLATFORM_PROFILE_BALANCED_PERFORMANCE;
+			break;
+		}
+		*profile = PLATFORM_PROFILE_PERFORMANCE;
+		break;
+	case LWMI_GZ_THERMAL_MODE_EXTREME:
+		*profile = PLATFORM_PROFILE_PERFORMANCE;
+		break;
+	case LWMI_GZ_THERMAL_MODE_CUSTOM:
+		*profile = PLATFORM_PROFILE_CUSTOM;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	guard(spinlock)(&gz_mode_lock);
+	priv->current_mode = mode;
+
+	return 0;
+}
+
+/**
+ * lwmi_gz_profile_get_get() - Set the current platform profile.
+ * @dev: The Gamezone interface parent device.
+ * @profile: Pointer to the desired platform profile.
+ *
+ * Convert the given platform profile into a thermal mode based on the support
+ * level of the interface, then call the WMI method to set the thermal mode.
+ *
+ * Return: 0 on success, or an error code.
+ */
+static int lwmi_gz_profile_set(struct device *dev,
+			       enum platform_profile_option profile)
+{
+	struct lwmi_gz_priv *priv = dev_get_drvdata(dev);
+	struct wmi_method_args_32 args;
+	enum thermal_mode mode;
+	int ret;
+
+	switch (profile) {
+	case PLATFORM_PROFILE_LOW_POWER:
+		mode = LWMI_GZ_THERMAL_MODE_QUIET;
+		break;
+	case PLATFORM_PROFILE_BALANCED:
+		mode = LWMI_GZ_THERMAL_MODE_BALANCED;
+		break;
+	case PLATFORM_PROFILE_BALANCED_PERFORMANCE:
+		mode = LWMI_GZ_THERMAL_MODE_PERFORMANCE;
+		break;
+	case PLATFORM_PROFILE_PERFORMANCE:
+		if (priv->extreme_supported) {
+			mode = LWMI_GZ_THERMAL_MODE_EXTREME;
+			break;
+		}
+		mode = LWMI_GZ_THERMAL_MODE_PERFORMANCE;
+		break;
+	case PLATFORM_PROFILE_CUSTOM:
+		mode = LWMI_GZ_THERMAL_MODE_CUSTOM;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	args.arg0 = mode;
+
+	ret = lwmi_dev_evaluate_int(priv->wdev, 0x0,
+				    LWMI_GZ_METHOD_ID_SMARTFAN_SET,
+				    (u8 *)&args, sizeof(args), NULL);
+	if (ret)
+		return ret;
+
+	guard(spinlock)(&gz_mode_lock);
+	priv->current_mode = mode;
+
+	return 0;
+}
+
+static const struct dmi_system_id fwbug_list[] = {
+	{
+		.ident = "Legion Go 8APU1",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "Legion Go 8APU1"),
+		},
+		.driver_data = &quirk_no_extreme_bug,
+	},
+	{
+		.ident = "Legion Go S 8APU1",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "Legion Go S 8APU1"),
+		},
+		.driver_data = &quirk_no_extreme_bug,
+	},
+	{
+		.ident = "Legion Go S 8ARP1",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "Legion Go S 8ARP1"),
+		},
+		.driver_data = &quirk_no_extreme_bug,
+	},
+	{},
+
+};
+
+/**
+ * lwmi_gz_extreme_supported() - Evaluate if a device supports extreme thermal mode.
+ * @profile_support_ver: Version of the WMI interface.
+ *
+ * Determine if the extreme thermal mode is supported by the hardware.
+ * Anything version 5 or lower does not. For devices wuth a version 6 or
+ * greater do a DMI check, as some devices report a version that supports
+ * extreme mode but have an incomplete entry in the BIOS. To ensure this
+ * cannot be set, quirk them to prevent assignment.
+ *
+ * Return: int.
+ */
+static int lwmi_gz_extreme_supported(int profile_support_ver)
+{
+	const struct dmi_system_id *dmi_id;
+	struct quirk_entry *quirks;
+
+	if (profile_support_ver < 6)
+		return false;
+
+	dmi_id = dmi_first_match(fwbug_list);
+	if (!dmi_id)
+		return true;
+
+	quirks = dmi_id->driver_data;
+	return quirks->extreme_supported;
+}
+
+/**
+ * lwmi_gz_platform_profile_probe - Enable and set up the platform profile
+ * device.
+ * @drvdata: Driver data for the interface.
+ * @choices: Container for enabled platform profiles.
+ *
+ * Determine if thermal mode is supported, and if so to what feature level.
+ * Then enable all supported platform profiles.
+ *
+ * Return: 0 on success, or an error code.
+ */
+static int lwmi_gz_platform_profile_probe(void *drvdata, unsigned long *choices)
+{
+	struct lwmi_gz_priv *priv = drvdata;
+	int profile_support_ver;
+	int ret;
+
+	ret = lwmi_gz_thermal_mode_supported(priv->wdev, &profile_support_ver);
+	if (ret)
+		return ret;
+
+	if (profile_support_ver < 1)
+		return -ENODEV;
+
+	priv->extreme_supported = lwmi_gz_extreme_supported(profile_support_ver);
+
+	set_bit(PLATFORM_PROFILE_LOW_POWER, choices);
+	set_bit(PLATFORM_PROFILE_BALANCED, choices);
+	set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
+	set_bit(PLATFORM_PROFILE_CUSTOM, choices);
+
+	if (priv->extreme_supported)
+		set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE, choices);
+
+	return 0;
+}
+
+static const struct platform_profile_ops lwmi_gz_platform_profile_ops = {
+	.probe = lwmi_gz_platform_profile_probe,
+	.profile_get = lwmi_gz_profile_get,
+	.profile_set = lwmi_gz_profile_set,
+};
+
+static int lwmi_gz_probe(struct wmi_device *wdev, const void *context)
+{
+	struct lwmi_gz_priv *priv;
+	int ret;
+
+	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->wdev = wdev;
+	dev_set_drvdata(&wdev->dev, priv);
+
+	priv->ppdev = platform_profile_register(&wdev->dev,
+						"lenovo-wmi-gamezone", priv,
+						&lwmi_gz_platform_profile_ops);
+
+	if (IS_ERR(priv->ppdev))
+		return -ENODEV;
+
+	ret = lwmi_gz_thermal_mode_get(wdev, &priv->current_mode);
+	if (ret)
+		return ret;
+
+	priv->event_nb.notifier_call = lwmi_gz_event_call;
+	ret = devm_lwmi_events_register_notifier(&wdev->dev, &priv->event_nb);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static const struct wmi_device_id lwmi_gz_id_table[] = {
+	{ LENOVO_GAMEZONE_GUID, NULL },
+	{}
+};
+
+static struct wmi_driver lwmi_gz_driver = {
+	.driver = {
+		.name = "lenovo_wmi_gamezone",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+	},
+	.id_table = lwmi_gz_id_table,
+	.probe = lwmi_gz_probe,
+	.no_singleton = true,
+};
+
+module_wmi_driver(lwmi_gz_driver);
+
+MODULE_IMPORT_NS("LENOVO_WMI_EVENTS");
+MODULE_IMPORT_NS("LENOVO_WMI_HELPERS");
+MODULE_DEVICE_TABLE(wmi, lwmi_gz_id_table);
+MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
+MODULE_DESCRIPTION("Lenovo GameZone WMI Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/platform/x86/lenovo-wmi-gamezone.h b/drivers/platform/x86/lenovo-wmi-gamezone.h
new file mode 100644
index 000000000000..75ef16bf0798
--- /dev/null
+++ b/drivers/platform/x86/lenovo-wmi-gamezone.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+/* Copyright(C) 2025 Derek J. Clark <derekjohn.clark@gmail.com> */
+
+#ifndef _LENOVO_WMI_GAMEZONE_H_
+#define _LENOVO_WMI_GAMEZONE_H_
+
+enum gamezone_events_type {
+	LWMI_GZ_GET_THERMAL_MODE = 1,
+};
+
+enum thermal_mode {
+	LWMI_GZ_THERMAL_MODE_QUIET =	   0x01,
+	LWMI_GZ_THERMAL_MODE_BALANCED =	   0x02,
+	LWMI_GZ_THERMAL_MODE_PERFORMANCE = 0x03,
+	LWMI_GZ_THERMAL_MODE_EXTREME =	   0xE0, /* Ver 6+ */
+	LWMI_GZ_THERMAL_MODE_CUSTOM =	   0xFF,
+};
+
+#endif /* !_LENOVO_WMI_GAMEZONE_H_ */
-- 
2.49.0

