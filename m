Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B730822DF84;
	Thu,  8 May 2025 23:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746748352; cv=none; b=d7EM+21/ko6i3GcaVWamuY7qCeKzohlZ3XDiGviykfOHAwrrneGW/kPJ56XU/5zQ+qii9VmtJpxmIzR13IraN93NrlrGyxJc5ZbxbDGyozkvDtzwxq5pdipAQmbUkhFWFCpTjo9yB+i3pxH/xlc2qhx2Yyh2z27dGMfUquIRC30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746748352; c=relaxed/simple;
	bh=xLDdaeF+C/fvIzO4EOIuPHu0A16VTJZ76UQusQb0GCM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XltXhdG3yD9l/k+RPUD+LZeyzoe+69OrCujDCEE97cAeuO71CIQ3N37erE6dcMls2A993z16FxK57mMqjJea/c9uCLV4fl/6JfYgraMnOTh8bBrdigDbXDVj3pM8VOyrVm9J2HnrR8RAGTMUMK4EOebVchTpicxROjhuMnD4POQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PqMFbPMM; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PqMFbPMM"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-ae727e87c26so1030659a12.0;
        Thu, 08 May 2025 16:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746748350; x=1747353150; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FPVSHQqK3wmIbl3hwmTywJHVQTbtMCDUP+HsSUj0+gA=;
        b=PqMFbPMMnLiO5vT4HwADMC5gOj80+1NAdp/Ak8pH4zuIB3oFz9DOYBm8SGrbckdC+/
         b8OIcQpO73eW0nPVXYyvLaS5ivqrR04t129Nz8ouv9KPy66wKku1/cQiVN5cCcv2se/L
         RKI7Ju2KYIs00Vlbj1XGwPMa9G/tOz5Tba9HxHj7+eeIRJyGnZC4aVCM9CK/ih+HN9eu
         wdi1FHa0/iXzOis1vRYeG8RMC8Rgs/GZLhTEwP6uV+d24TD6rs/EwMDXNwbPjEXAM948
         SOQTObV7WGg7+9JyL3+LPP5F/hmISn7777Mgom5ihSJdVvKCt8URFX4Wic2Ow2bWKfjh
         rcIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746748350; x=1747353150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FPVSHQqK3wmIbl3hwmTywJHVQTbtMCDUP+HsSUj0+gA=;
        b=m5wyMeuEY42MCr9y42pAUtHXIjZunVRa99guCwyTu9y9TCxClfqePaWpoxYmJgJKYp
         g/D6GLgH7wWs2wglyRxgd8Lgg1UUcNVfFFZa/xr633jQgldRQ0CizoMhFNY89O87df1k
         Jau0h0ABJztvLfeWTJtftNK6E3lgQzIV0FcvIvXx01TcAxdKctSclc1ZHThbDM1huaXM
         lHc8r/i6qrtpd6KnIgKAlLyTdkQqQCSgLcvkTA4ZbOxsrx5rnl1r4mpS4jEGbQCDCOPT
         t7CPplBB2/z6WwIXFWA1+McgnxfHMtLz+ghZPkjD5cZeKN8JGgLWdgrU+pJyLWnJbMJJ
         fVdg==
X-Forwarded-Encrypted: i=1; AJvYcCUR0R988VBFlCXzQn9zJyy6Y9UySy/c940kxxf4VLLCpZjNyfAlN0rokgkD4r3X4AonNz6MqcWYWtEJwAU0@vger.kernel.org, AJvYcCUSEnxrTakL+lV+VcP+XBD6Den9Ddm1ticnocgnYwdQ70LHp+WoZ9QwPeOTOPAOy6Cktsa3s90yHaQ=@vger.kernel.org, AJvYcCXgAaUN32jLpb7O3JyBYfx4oh8xedfew1O6s3922eNPDSb+Gbdc86VCNk+x0msXensquOEEu/jSouUdBq4H5NJK5bXorw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwB/3DM8HjEQf5t/cfD0lui+JadW1E2+9I92tr5yMZHtL2+Pta2
	7E0n9LoCnX1ZRIjKYuL9zsw2ldG+R0a4dS1nUKMDVq2oSOh1qFPK
X-Gm-Gg: ASbGnct0be724nOaOJykXsoiXiejp9L++gRynU4bidLE5XgbWZl5RjE4+DWVp0zArU0
	/3cS1yUobt0sEgUOV89+VNGM/dF3EMALYQcxF2OfXpQZVImSczAHRwBVFfZxNa7FwtwP3CxGi1M
	5mkcd6oAhnxdmok7XOWx5p1RFTP6wIo13pDBSTIXIrHW0JiwwX+tM15fAHN1PmHkEmKGf0omQSz
	L1chNPTv7huz7yTKCzv/zMdO/ukCSBv1oxRS3uxIZBa5hkEfLSTheYvKVUfy93Okuc4kDhqePd4
	jFdaZD4eDOLabkSy0K/GBAk1gjyI5qoA4wsrAS+4Uw8uquHSPXR/DgEQhYglBppgWacQfqdQtCG
	tLabMYdOVehTM13gmdDlACle3c46vLHUe6WiYWlw=
X-Google-Smtp-Source: AGHT+IH+2UFZA/+9VGpV8hi23T7Utwfe7M3DbLm/6Pu9npAXQZaBFytcmbFJ1LvW/zmAnmvEBtbxIw==
X-Received: by 2002:a17:902:ca92:b0:22f:d47e:c6dd with SMTP id d9443c01a7336-22fd47ec93cmr411395ad.13.1746748349820;
        Thu, 08 May 2025 16:52:29 -0700 (PDT)
Received: from localhost.localdomain (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc680515esm5844615ad.0.2025.05.08.16.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 16:52:29 -0700 (PDT)
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
	Kurt Borja <kuurtb@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 5/6] platform/x86: Add Lenovo Gamezone WMI Driver
Date: Thu,  8 May 2025 16:51:38 -0700
Message-ID: <20250508235217.12256-6-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250508235217.12256-1-derekjohn.clark@gmail.com>
References: <20250508235217.12256-1-derekjohn.clark@gmail.com>
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
 drivers/platform/x86/lenovo-wmi-gamezone.c | 402 +++++++++++++++++++++
 drivers/platform/x86/lenovo-wmi-gamezone.h |  20 +
 5 files changed, 438 insertions(+)
 create mode 100644 drivers/platform/x86/lenovo-wmi-gamezone.c
 create mode 100644 drivers/platform/x86/lenovo-wmi-gamezone.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 1b22e41cc730..673535395ae8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13166,6 +13166,7 @@ F:	Documentation/wmi/devices/lenovo-wmi-gamezone.rst
 F:	Documentation/wmi/devices/lenovo-wmi-other.rst
 F:	drivers/platform/x86/lenovo-wmi-capdata01.*
 F:	drivers/platform/x86/lenovo-wmi-events.*
+F:	drivers/platform/x86/lenovo-wmi-gamezone.*
 F:	drivers/platform/x86/lenovo-wmi-helpers.*
 
 LENOVO WMI HOTKEY UTILITIES DRIVER
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
index 000000000000..6f460ddf584a
--- /dev/null
+++ b/drivers/platform/x86/lenovo-wmi-gamezone.c
@@ -0,0 +1,402 @@
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
+	guard(spinlock)(&priv->gz_mode_lock);
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
+	priv->ppdev = devm_platform_profile_register(&wdev->dev, "lenovo-wmi-gamezone",
+						     priv, &lwmi_gz_platform_profile_ops);
+
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

