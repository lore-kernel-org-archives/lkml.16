Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1D7220F24;
	Mon,  9 Jun 2025 18:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749495049; cv=none; b=Hlt/xBJhQESkIoJdXvWDwN9btpp8quOt5lrAZD23Ud1TDv04ZfqWdGPegLDNjt9ZH7OgNh/ZJYHZ6i8rTyDcc8RQJWQB3z8qIU/F7kbhun+GNz5pyE3vwzrOlXrQiWOr2uciI0IyI4Br950f4Dfax6sWnQIidKOCnMRH+FiVeeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749495049; c=relaxed/simple;
	bh=VZSpeBBHOKdkfcf8eiO7CsqFa58s7oN5hmKcY+oUpeM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f/D0JCOXP0diqo6nvg85A2SKykfs+Pe/lcZxB6leyCsAy9Q6ygjV2ySFJMiiqaBIzmuKX5NIU8PfNUfy2Mud0Mgt03BHOJYAV+RwrKpDVQnemCskSwTKdAMeshcWy8LNVMTuVacwTWOoGisgGJOjgoj44vIGU9+3zyCSEBYNZL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bAIDl2XB; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bAIDl2XB"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso4042104b3a.0;
        Mon, 09 Jun 2025 11:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749495047; x=1750099847; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mL92FKimmmTkrH4zSkvm3+h9PBvr14B4Vffjanxc/0M=;
        b=bAIDl2XB6jn7GGwooGZwMLkSX2t0IjKi8QTr8QPMzF/kFJQ4wMHAzkXxDG66Haem2S
         +5IQSONPAtOMnbTMK7irwLQp2pUOC8tRtjQnkoGPgax9vw5cRMOQN/JYwS0Qm7veYolg
         IsPhkS3p7n+kno6gBkkfxiOPIbkJK4H9IkEpHZk+DMkDn5o2v0p3RruMlM5kOk6TEOYn
         C5og1jPEBXD2bIiXyVmIkkTAOQ961x52++wP0AxP7ERI9QG2R6qHWAnxU3zMEr5FkEcG
         Ix4YILPnySRFIDYS0ZN4ubVtSKzuDdep0MFsmWHTxl9/dRkpHMXkQrUK8ZvDECt0Zezg
         XEMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749495047; x=1750099847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mL92FKimmmTkrH4zSkvm3+h9PBvr14B4Vffjanxc/0M=;
        b=OJ3O3376XSuWNzmwd+up7Lzgb7U2Csd/ia92zOn6jedYPSrqUXsyJY1ZBARFdPp9IU
         7BrUaindgU4TnqyYPhcCkVq93kyNsq2o+iRcc6FlMT+RkF6vHSLXV9mofnn9akbogglP
         HsTqVkzSdSvE7pb2J+Y713lMNNmCMVzREf1YsHm1tikiI6oavzIaPSGnn3hHhpILKCcB
         CFdIYwLveVBNVQYY0k7x+lUrivUduWHYXlNviBu5sZOzaocZZKNuGEXbSVn9ecgDfBel
         rAcFyuuyGMI9ts3E5CUw6M7DZ2du/S5LuyP15jMdp5clik3/dr99zybSKUz7DcS62pAo
         4G3w==
X-Forwarded-Encrypted: i=1; AJvYcCUrhEqHP1Ju95vviLUx6D1T74UJlMWK3IaCipnfThqIIfGZJkkkeDtiFaMykoEeJJYRq59r6Vf8x06we+lNB+0LwZu9yg==@vger.kernel.org, AJvYcCVgRG2UnnzPMoSxcR5I7W+XIrPQKv1zaql69FWfP6EZ4uygsD2hpBMW3w+floW8lMKERiZFOWicn/j97dv4@vger.kernel.org, AJvYcCVoIJc7eaaQ9EmxgnBu7Hu5kTp0IKXK3KmoyAH/70lux8S8K/m9EMJxtDqQhOx2sS6J2+UKT0+pTWU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+R9FafjgWQlKbm1518xE0a+6+hYw5mw6yHXtwzhd6/tUpZT6/
	d+zf6pOgCtDyzqHQxnYny9zGPF5Sq3gecYRNZgdWx02TC5jQMtD5E5n6
X-Gm-Gg: ASbGncviPRWuWsfc1+WNjJ1H2+n3hIxvfuTGedpO6mAJBXxLhvucQwAf/qDhRM1wEaX
	o3NiWnrObmk//ciEFUERqWGW9kPIE7DC3kjCuMoqRjiT1bvbtXAEJzpjEsRTLK4mJC4FK39KnDt
	N+i54PivaFBntPTVh2lRWq6LOJb+k1fISA5J6DDHPdZ+9XdkBdvx0iBu1tgleJpEsB7rUTUWDXI
	NN4hBbNIG+PXTNH7Uax6RvJZQ7YQusRh8lLAIaT06ITuQHAS2YHYPXuSwyx46avpypblMmSQZcH
	kosT0xdC3EFv3puCVZMUQi1WCykZtB3x/g2P+RSpLwLJGA84fIyw+mP19JmB+P8yqAJYYlrgz1B
	x5vt5CZyIRFtbDdGb2xZI+K/SFBrNHYpNBdi3QGJzp3p7hy0kKZoR5AIrw2eR
X-Google-Smtp-Source: AGHT+IGa1aZ3nTQWFC7MIIaYHo/6kDUhddFEEyMN7xwecvw5kWT1GBdvE4b5oKikYaMpWX3LUvdNlw==
X-Received: by 2002:a05:6a20:9189:b0:21f:5c9d:4994 with SMTP id adf61e73a8af0-21f5c9d5de6mr9127508637.25.1749495046622;
        Mon, 09 Jun 2025 11:50:46 -0700 (PDT)
Received: from localhost.localdomain (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5ed58e9bsm5625461a12.10.2025.06.09.11.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 11:50:46 -0700 (PDT)
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
	"Cody T . H . Chiu" <codyit@gmail.com>,
	John Martens <johnfanv2@gmail.com>,
	Kurt Borja <kuurtb@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v12 5/6] platform/x86: Add Lenovo Gamezone WMI Driver
Date: Mon,  9 Jun 2025 11:50:26 -0700
Message-ID: <20250609185027.7378-6-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609185027.7378-1-derekjohn.clark@gmail.com>
References: <20250609185027.7378-1-derekjohn.clark@gmail.com>
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

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
v12: No change
v11:
 - Formatting.
v10: No change
v9:
 - Pass NULL instead of 0 in lwmi_dev_evaluate_int where no args buffer
   was used.
v8:
 - Remove RW from lock comment.
v7:
 - Move spinlock into lwmi_gz_priv.
 - Add scoped_guard at missing location.
 - Move adding lwmi_gz_mode_call up in the series. While its only used
   by lenovo-wmi-other, it doesn't depend on it.
 - Return instead of assigning ret at end of probe.
 - Fix typos.
v6:
 - Recache capabiltiy data on ACPI AC events to ensure accutare
   max_value.
 - Fix typos and rewordings from v5 review.
v5:
 - Return to cache at device initialization. On component bind, pass a
   pointer to lenovo-wmi-other.
 - Fixes from v4 review.
v4:
 - Make driver data a private struct, remove references from Other Mode
   driver.
 - Don't cache data at device initialization. Instead, on component bind,
   cache the data on a member variable of the Other Mode driver data
   passed as a void pointer.
 - Add header file for capdata01 structs.
 - Add new struct to pass capdata01 array data and array length to Other
   Mode.
v3:
- Add as component to lenovo-wmi-other driver.
v2:
- Use devm_kmalloc to ensure driver can be instanced, remove global
  reference.
- Ensure reverse Christmas tree for all variable declarations.
- Remove extra whitespace.
- Use guard(mutex) in all mutex instances, global mutex.
- Use pr_fmt instead of adding the driver name to each pr_err.
- Remove noisy pr_info usage.
- Rename capdata_wmi to lenovo_wmi_cd01_priv and cd01_wmi to priv.
- Use list to get the lenovo_wmi_cd01_priv instance in
  lenovo_wmi_capdata01_get as none of the data provided by the macros
  that will use it can pass a member of the struct for use in
  container_of.
---
 MAINTAINERS                                |   1 +
 drivers/platform/x86/Kconfig               |  14 +
 drivers/platform/x86/Makefile              |   1 +
 drivers/platform/x86/lenovo-wmi-gamezone.c | 401 +++++++++++++++++++++
 drivers/platform/x86/lenovo-wmi-gamezone.h |  20 +
 5 files changed, 437 insertions(+)
 create mode 100644 drivers/platform/x86/lenovo-wmi-gamezone.c
 create mode 100644 drivers/platform/x86/lenovo-wmi-gamezone.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 8af1756f39d8..c45013cec5ad 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13455,6 +13455,7 @@ F:	Documentation/wmi/devices/lenovo-wmi-gamezone.rst
 F:	Documentation/wmi/devices/lenovo-wmi-other.rst
 F:	drivers/platform/x86/lenovo-wmi-capdata01.*
 F:	drivers/platform/x86/lenovo-wmi-events.*
+F:	drivers/platform/x86/lenovo-wmi-gamezone.*
 F:	drivers/platform/x86/lenovo-wmi-helpers.*
 
 LENOVO WMI HOTKEY UTILITIES DRIVER
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 248384489d36..c6ecfa5f024c 100644
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
index 32e72b8b7a6e..d05630a315f7 100644
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
index 000000000000..f172d8ed711d
--- /dev/null
+++ b/drivers/platform/x86/lenovo-wmi-gamezone.c
@@ -0,0 +1,401 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Lenovo GameZone WMI interface driver.
+ *
+ * The GameZone WMI interface provides platform profile and fan curve settings
+ * for devices that fall under the "Gaming Series" of Lenovo Legion devices.
+ *
+ * Copyright (C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
+ */
+
+#include <linux/acpi.h>
+#include <linux/dmi.h>
+#include <linux/export.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/notifier.h>
+#include <linux/platform_profile.h>
+#include <linux/spinlock.h>
+#include <linux/spinlock_types.h>
+#include <linux/types.h>
+#include <linux/wmi.h>
+
+#include "lenovo-wmi-events.h"
+#include "lenovo-wmi-gamezone.h"
+#include "lenovo-wmi-helpers.h"
+#include "lenovo-wmi-other.h"
+
+#define LENOVO_GAMEZONE_GUID "887B54E3-DDDC-4B2C-8B88-68A26A8835D0"
+
+#define LWMI_GZ_METHOD_ID_SMARTFAN_SUP 43
+#define LWMI_GZ_METHOD_ID_SMARTFAN_SET 44
+#define LWMI_GZ_METHOD_ID_SMARTFAN_GET 45
+
+static BLOCKING_NOTIFIER_HEAD(gz_chain_head);
+
+struct lwmi_gz_priv {
+	enum thermal_mode current_mode;
+	struct notifier_block event_nb;
+	struct notifier_block mode_nb;
+	spinlock_t gz_mode_lock; /* current_mode lock */
+	struct wmi_device *wdev;
+	int extreme_supported;
+	struct device *ppdev;
+};
+
+struct quirk_entry {
+	bool extreme_supported;
+};
+
+static struct quirk_entry quirk_no_extreme_bug = {
+	.extreme_supported = false,
+};
+
+/**
+ * lwmi_gz_mode_call() - Call method for lenovo-wmi-other driver notifier.
+ *
+ * @nb: The notifier_block registered to lenovo-wmi-other driver.
+ * @cmd: The event type.
+ * @data: Thermal mode enum pointer pointer for returning the thermal mode.
+ *
+ * For LWMI_GZ_GET_THERMAL_MODE, retrieve the current thermal mode.
+ *
+ * Return: Notifier_block status.
+ */
+static int lwmi_gz_mode_call(struct notifier_block *nb, unsigned long cmd,
+			     void *data)
+{
+	enum thermal_mode **mode = data;
+	struct lwmi_gz_priv *priv;
+
+	priv = container_of(nb, struct lwmi_gz_priv, mode_nb);
+
+	switch (cmd) {
+	case LWMI_GZ_GET_THERMAL_MODE:
+		scoped_guard(spinlock, &priv->gz_mode_lock) {
+			**mode = priv->current_mode;
+		}
+		return NOTIFY_OK;
+	default:
+		return NOTIFY_DONE;
+	}
+}
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
+		scoped_guard(spinlock, &priv->gz_mode_lock) {
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
+				     NULL, 0, supported);
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
+				     NULL, 0, mode);
+}
+
+/**
+ * lwmi_gz_profile_get() - Get the current platform profile.
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
+	guard(spinlock)(&priv->gz_mode_lock);
+	priv->current_mode = mode;
+
+	return 0;
+}
+
+/**
+ * lwmi_gz_profile_set() - Set the current platform profile.
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
+	guard(spinlock)(&priv->gz_mode_lock);
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
+ * Anything version 5 or lower does not. For devices with a version 6 or
+ * greater do a DMI check, as some devices report a version that supports
+ * extreme mode but have an incomplete entry in the BIOS. To ensure this
+ * cannot be set, quirk them to prevent assignment.
+ *
+ * Return: bool.
+ */
+static bool lwmi_gz_extreme_supported(int profile_support_ver)
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
+
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
+	set_bit(PLATFORM_PROFILE_LOW_POWER, choices);
+	set_bit(PLATFORM_PROFILE_BALANCED, choices);
+	set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
+	set_bit(PLATFORM_PROFILE_CUSTOM, choices);
+
+	priv->extreme_supported = lwmi_gz_extreme_supported(profile_support_ver);
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
+	priv->ppdev = devm_platform_profile_register(&wdev->dev, "lenovo-wmi-gamezone",
+						     priv, &lwmi_gz_platform_profile_ops);
+	if (IS_ERR(priv->ppdev))
+		return -ENODEV;
+
+	spin_lock_init(&priv->gz_mode_lock);
+
+	ret = lwmi_gz_thermal_mode_get(wdev, &priv->current_mode);
+	if (ret)
+		return ret;
+
+	priv->event_nb.notifier_call = lwmi_gz_event_call;
+	return devm_lwmi_events_register_notifier(&wdev->dev, &priv->event_nb);
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
index 000000000000..6b163a5eeb95
--- /dev/null
+++ b/drivers/platform/x86/lenovo-wmi-gamezone.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+/* Copyright (C) 2025 Derek J. Clark <derekjohn.clark@gmail.com> */
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

