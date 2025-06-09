Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F61D220F55;
	Mon,  9 Jun 2025 18:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749495051; cv=none; b=kOPMuyETBxiBrnEvXTrZuNF+bAlI+dG+EzrfWL3KCYFTrTZg1Idf/ZmBzZlg8REsgh9aNi/UCzObvWVTD5p/xxo91Gh7evJIVWAqqgGkdRWeydx1y+rLdJTGspbmxtgbSG1jDTpkbJQAvCVeeZXj3j2dZhLdIiUkTlmFE9cS80A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749495051; c=relaxed/simple;
	bh=Nj8y0xGvLwOji5rbBuwip4PAsYQ7CNogmQRs3AWfzmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qFBmp1saHK66EdEgc85Nb/5KPEl3BQSh7gH3mxin1z1/SfVyWW7s5lfXjuniMsV31suxmrqarXOwXxi1IWDryW51zOaNfoeQbbz857WSNPV9iCTMcwCJISdq46LyTNOi5ogDnEfxOEs+sHHzg2st+7N8ThQGs+q8I6v8NXby4OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P2gGCZUJ; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P2gGCZUJ"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-747fc7506d4so4458266b3a.0;
        Mon, 09 Jun 2025 11:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749495048; x=1750099848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jl7AqjTeqw5KwR+U52A48lfejXxRfjIaWIWbqLK8jN4=;
        b=P2gGCZUJJnRXXzam84XCChEYX5X0bx9By6N1A1GF1OKxNrBbGKFYdTpoc2MIvw2syO
         +hBSkcZYviOxNwGJD3MoQMaj6/m5ZbuMlOXc2k4kAw9Ln4bBbqtwPRKasoLc1JUV0WQ1
         jkFj7KPXWwb4OVsNIXalT71Er26Ud1aNBvNThBHdCusF+ZRIuuM/m0bHGSIcM1i8Wg9U
         CKVxzMRgSiGigrPJgXTZDPOLtTo/cF8JAuQrCixCfMJI6YdVMR5di8Omw7LsyUGXLsTE
         xUfV+TS4dVK1yWoRVqok8ehiJvJYdqRaZK29Nf7yVgDt3Zrf1Cpme3+5E1J3Y83j05UI
         tLDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749495048; x=1750099848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jl7AqjTeqw5KwR+U52A48lfejXxRfjIaWIWbqLK8jN4=;
        b=wU3YUZwHoznasbuLiZH+3lvbftMO4yEbA6GtcszvA9plpa9ElK8+7CjbW+S2Zi/ZnF
         QDBZTeuy/e/huKi+UO62z29gZeP9JdMjXr2bNzyvkK2v1cFXo+ek8/6IdGaA/FfjHDdX
         KdJu1MX3LRdd0FG/c2DI2iNjRnXBMC2T9rhVIP3344tiBpyJ/uOP+FfC/r9bvaUhz6WD
         nBQkTvEyTto6EGFfOUNLH3Wpkw2GRWbDAKAxaP1T2wOYFXOqR1jmfMVnNxqH0vEF/yrg
         WZtMSXwX3jZpdJyYErRSRRg97o2zVF5uyrvTMnAT0w4XgITW6CLQLu8sw4j02mDJa5oO
         oLWA==
X-Forwarded-Encrypted: i=1; AJvYcCURpes/IeNeGPfKVoy54Ei04xVbwEN5edzpLBEO3RzuARMdfKpkcELR+x2zeKw+G4YsOKbFH4fy6Qw=@vger.kernel.org, AJvYcCVXZDxHjBIEbWN6pREFu/eNllYT2IW5IHHzKPRKDoKbLFToniLKkGNHPJjSNN6uMSS6WL8zqcHHirde11bWk9q9z4avAg==@vger.kernel.org, AJvYcCX4t+XLd068nJ7+4sIUMsaouDaDoku7gqFgaRtMcxoPHQ8lQSfGk6jg+KZ3pm17Np4nuuITrXMDjlA+QuNZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzrqEiKQzawxI4lGAZPJ3s9eR12ZsNBp5Xuqwlf+texQURcYdEF
	+ubmd2mmlOz7i+eMrHeG8s/4E1rn27TEb2E0FQ7DqVOMQkwToVpk9lyu
X-Gm-Gg: ASbGncsOCKEqLVFFxzjCFqyFbnCifSBeihNGDKunuf+UERQ9TocS+dLI3KH5qfnbYAT
	KR8VoX44RwOtE+8DW39RjuygS6fbXakNYswyPaUj0rPKtDlK2E1M2jzmNlZGEAqyIFvU3puzzfh
	a5weLzD0zPIarnyonsuxXhqhrTwNA1nIwJimz2TdlGMODbIOnb5APIVMeTXuWCkUc0rcJU101qK
	OVT9dtQenLgQKGte0qz4qurnoKdNi+znD1h7KF4BP4hYcp1SjM4PXrYZ9P0NcyCw2UkLWE7Z+9V
	u0Zc0fQHmKZbCV50SzBnHuo9OPEs5miDb/iUN7+0oEynAiFTikM0iZUGgUkVIdgUkR0U/PHeUX6
	e7mG5vmS7ks4mYXpieysI+XYMMbzfg4MEMqRi3NEsXEwluJ2HzNvjuioBfvi/
X-Google-Smtp-Source: AGHT+IFUY/zY+nD0pP4YOdTee0QEhff1cHAQt+CWNoBsr3QXmOOx7y7KDXeKYThL7u8Kd/ok3ymZNw==
X-Received: by 2002:a05:6a20:d817:b0:216:6108:788f with SMTP id adf61e73a8af0-21ee25f4afbmr22321519637.35.1749495048305;
        Mon, 09 Jun 2025 11:50:48 -0700 (PDT)
Received: from localhost.localdomain (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5ed58e9bsm5625461a12.10.2025.06.09.11.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 11:50:47 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Alok Tiwari <alok.a.tiwari@oracle.com>
Subject: [PATCH v12 6/6] platform/x86: Add Lenovo Other Mode WMI Driver
Date: Mon,  9 Jun 2025 11:50:27 -0700
Message-ID: <20250609185027.7378-7-derekjohn.clark@gmail.com>
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

Adds lenovo-wmi-other driver which provides the Lenovo "Other Mode" WMI
interface that comes on some Lenovo "Gaming Series" hardware. Provides a
firmware-attributes class which enables the use of tunable knobs for SPL,
SPPT, and FPPT.

Reviewed-by: Alok Tiwari <alok.a.tiwari@oracle.com>
Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
v12:
 - Fix warnings from make W=1
v11:
 - Formatting
v10:
 - include kdev_t to fix build error.
v9:
 - Make tunable_attr_01 declarations static & adjust formatting.
v8:
 - Remove dead code.
 - use struct cd01_list pointer instead of void pointer in
   lwmi_cd01_priv.
v7:
 - Use stach allocated capdata01 stuct instead of getting a pointer from
   lenovo-wmi-capdata01.
 - Fix typos.
v6:
- Pass locally stored pointer to cd01_list back to lenovo-wmi-capdata01
  instead of itterating over the list locally. Due to ACPI event handing
  the list is now mutexed.
- Fix typos and rewordings from v5 review.
v5:
- Switch from locally storing capability data list to storing a pointer
  from the capability data interface.
- Add portion of Gamezone driver that relies on the exported functions
  of this driver.
- Properly initialize IDA and use it for naming the firmware-attributes
  path.
- Rename most defines to clearly indicate they are from this driver.
- Misc fixes from v4 review.
v4:
- Treat Other Mode as a notifier chain head, use the notifier chain to
  get the current mode from Gamezone.
- Add header file for Other Mode specific structs and finctions.
- Use component master bind to cache the capdata01 array locally.
- Drop all reference to external driver private data structs.
- Various fixes from review.
v3:
- Add notifier block and store result for getting the Gamezone interface
  profile changes.
- Add driver as master component of capdata01 driver.
- Use FIELD_PREP where appropriate.
- Move macros and associated functions out of lemovo-wmi.h that are only
  used by this driver.
v2:
- Use devm_kmalloc to ensure driver can be instanced, remove global
  reference.
- Ensure reverse Christmas tree for all variable declarations.
- Remove extra whitespace.
- Use guard(mutex) in all mutex instances, global mutex.
- Use pr_fmt instead of adding the driver name to each pr_err.
- Remove noisy pr_info usage.
- Rename other_method_wmi to lenovo_wmi_om_priv and om_wmi to priv.
- Use list to get the lenovo_wmi_om_priv instance in some macro
  called functions as the data provided by the macros that use it
  doesn't pass a member of the struct for use in container_of.
- Do not rely on GameZone interface to grab the current fan mode.
---
 MAINTAINERS                                |   1 +
 drivers/platform/x86/Kconfig               |  15 +
 drivers/platform/x86/Makefile              |   1 +
 drivers/platform/x86/lenovo-wmi-gamezone.c |   8 +-
 drivers/platform/x86/lenovo-wmi-other.c    | 665 +++++++++++++++++++++
 drivers/platform/x86/lenovo-wmi-other.h    |  16 +
 6 files changed, 705 insertions(+), 1 deletion(-)
 create mode 100644 drivers/platform/x86/lenovo-wmi-other.c
 create mode 100644 drivers/platform/x86/lenovo-wmi-other.h

diff --git a/MAINTAINERS b/MAINTAINERS
index c45013cec5ad..e04312a14dea 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13457,6 +13457,7 @@ F:	drivers/platform/x86/lenovo-wmi-capdata01.*
 F:	drivers/platform/x86/lenovo-wmi-events.*
 F:	drivers/platform/x86/lenovo-wmi-gamezone.*
 F:	drivers/platform/x86/lenovo-wmi-helpers.*
+F:	drivers/platform/x86/lenovo-wmi-other.*
 
 LENOVO WMI HOTKEY UTILITIES DRIVER
 M:	Jackie Dong <xy-jackie@139.com>
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index c6ecfa5f024c..45ef08449b14 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -485,6 +485,21 @@ config LENOVO_WMI_DATA01
 	tristate
 	depends on ACPI_WMI
 
+config LENOVO_WMI_TUNING
+	tristate "Lenovo Other Mode WMI Driver"
+	depends on ACPI_WMI
+	select FW_ATTR_CLASS
+	select LENOVO_WMI_DATA01
+	select LENOVO_WMI_EVENTS
+	select LENOVO_WMI_HELPERS
+	help
+	  Say Y here if you have a WMI aware Lenovo Legion device and would like to use the
+	  firmware_attributes API to control various tunable settings typically exposed by
+	  Lenovo software in Windows.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called lenovo-wmi-other.
+
 config IDEAPAD_LAPTOP
 	tristate "Lenovo IdeaPad Laptop Extras"
 	depends on ACPI
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index d05630a315f7..47a03056b795 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -73,6 +73,7 @@ obj-$(CONFIG_LENOVO_WMI_DATA01)	+= lenovo-wmi-capdata01.o
 obj-$(CONFIG_LENOVO_WMI_EVENTS)	+= lenovo-wmi-events.o
 obj-$(CONFIG_LENOVO_WMI_GAMEZONE)	+= lenovo-wmi-gamezone.o
 obj-$(CONFIG_LENOVO_WMI_HELPERS)	+= lenovo-wmi-helpers.o
+obj-$(CONFIG_LENOVO_WMI_TUNING)	+= lenovo-wmi-other.o
 
 # Intel
 obj-y				+= intel/
diff --git a/drivers/platform/x86/lenovo-wmi-gamezone.c b/drivers/platform/x86/lenovo-wmi-gamezone.c
index f172d8ed711d..261284de22b6 100644
--- a/drivers/platform/x86/lenovo-wmi-gamezone.c
+++ b/drivers/platform/x86/lenovo-wmi-gamezone.c
@@ -373,7 +373,12 @@ static int lwmi_gz_probe(struct wmi_device *wdev, const void *context)
 		return ret;
 
 	priv->event_nb.notifier_call = lwmi_gz_event_call;
-	return devm_lwmi_events_register_notifier(&wdev->dev, &priv->event_nb);
+	ret = devm_lwmi_events_register_notifier(&wdev->dev, &priv->event_nb);
+	if (ret)
+		return ret;
+
+	priv->mode_nb.notifier_call = lwmi_gz_mode_call;
+	return devm_lwmi_om_register_notifier(&wdev->dev, &priv->mode_nb);
 }
 
 static const struct wmi_device_id lwmi_gz_id_table[] = {
@@ -395,6 +400,7 @@ module_wmi_driver(lwmi_gz_driver);
 
 MODULE_IMPORT_NS("LENOVO_WMI_EVENTS");
 MODULE_IMPORT_NS("LENOVO_WMI_HELPERS");
+MODULE_IMPORT_NS("LENOVO_WMI_OTHER");
 MODULE_DEVICE_TABLE(wmi, lwmi_gz_id_table);
 MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
 MODULE_DESCRIPTION("Lenovo GameZone WMI Driver");
diff --git a/drivers/platform/x86/lenovo-wmi-other.c b/drivers/platform/x86/lenovo-wmi-other.c
new file mode 100644
index 000000000000..299fc87189ec
--- /dev/null
+++ b/drivers/platform/x86/lenovo-wmi-other.c
@@ -0,0 +1,665 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Lenovo Other Mode WMI interface driver.
+ *
+ * This driver uses the fw_attributes class to expose the various WMI functions
+ * provided by the "Other Mode" WMI interface. This enables CPU and GPU power
+ * limit as well as various other attributes for devices that fall under the
+ * "Gaming Series" of Lenovo laptop devices. Each attribute exposed by the
+ * "Other Mode" interface has a corresponding Capability Data struct that
+ * allows the driver to probe details about the attribute such as if it is
+ * supported by the hardware, the default_value, max_value, min_value, and step
+ * increment.
+ *
+ * These attributes typically don't fit anywhere else in the sysfs and are set
+ * in Windows using one of Lenovo's multiple user applications.
+ *
+ * Copyright (C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
+ */
+
+#include <linux/acpi.h>
+#include <linux/bitfield.h>
+#include <linux/cleanup.h>
+#include <linux/component.h>
+#include <linux/container_of.h>
+#include <linux/device.h>
+#include <linux/export.h>
+#include <linux/gfp_types.h>
+#include <linux/idr.h>
+#include <linux/kdev_t.h>
+#include <linux/kobject.h>
+#include <linux/module.h>
+#include <linux/notifier.h>
+#include <linux/platform_profile.h>
+#include <linux/types.h>
+#include <linux/wmi.h>
+
+#include "lenovo-wmi-capdata01.h"
+#include "lenovo-wmi-events.h"
+#include "lenovo-wmi-gamezone.h"
+#include "lenovo-wmi-helpers.h"
+#include "lenovo-wmi-other.h"
+#include "firmware_attributes_class.h"
+
+#define LENOVO_OTHER_MODE_GUID "DC2A8805-3A8C-41BA-A6F7-092E0089CD3B"
+
+#define LWMI_DEVICE_ID_CPU 0x01
+
+#define LWMI_FEATURE_ID_CPU_SPPT 0x01
+#define LWMI_FEATURE_ID_CPU_SPL 0x02
+#define LWMI_FEATURE_ID_CPU_FPPT 0x03
+
+#define LWMI_TYPE_ID_NONE 0x00
+
+#define LWMI_FEATURE_VALUE_GET 17
+#define LWMI_FEATURE_VALUE_SET 18
+
+#define LWMI_ATTR_DEV_ID_MASK GENMASK(31, 24)
+#define LWMI_ATTR_FEAT_ID_MASK GENMASK(23, 16)
+#define LWMI_ATTR_MODE_ID_MASK GENMASK(15, 8)
+#define LWMI_ATTR_TYPE_ID_MASK GENMASK(7, 0)
+
+#define LWMI_OM_FW_ATTR_BASE_PATH "lenovo-wmi-other"
+
+static BLOCKING_NOTIFIER_HEAD(om_chain_head);
+static DEFINE_IDA(lwmi_om_ida);
+
+enum attribute_property {
+	DEFAULT_VAL,
+	MAX_VAL,
+	MIN_VAL,
+	STEP_VAL,
+	SUPPORTED,
+};
+
+struct lwmi_om_priv {
+	struct component_master_ops *ops;
+	struct cd01_list *cd01_list; /* only valid after capdata01 bind */
+	struct device *fw_attr_dev;
+	struct kset *fw_attr_kset;
+	struct notifier_block nb;
+	struct wmi_device *wdev;
+	int ida_id;
+};
+
+struct tunable_attr_01 {
+	struct capdata01 *capdata;
+	struct device *dev;
+	u32 feature_id;
+	u32 device_id;
+	u32 type_id;
+};
+
+static struct tunable_attr_01 ppt_pl1_spl = {
+	.device_id = LWMI_DEVICE_ID_CPU,
+	.feature_id = LWMI_FEATURE_ID_CPU_SPL,
+	.type_id = LWMI_TYPE_ID_NONE,
+};
+
+static struct tunable_attr_01 ppt_pl2_sppt = {
+	.device_id = LWMI_DEVICE_ID_CPU,
+	.feature_id = LWMI_FEATURE_ID_CPU_SPPT,
+	.type_id = LWMI_TYPE_ID_NONE,
+};
+
+static struct tunable_attr_01 ppt_pl3_fppt = {
+	.device_id = LWMI_DEVICE_ID_CPU,
+	.feature_id = LWMI_FEATURE_ID_CPU_FPPT,
+	.type_id = LWMI_TYPE_ID_NONE,
+};
+
+struct capdata01_attr_group {
+	const struct attribute_group *attr_group;
+	struct tunable_attr_01 *tunable_attr;
+};
+
+/**
+ * lwmi_om_register_notifier() - Add a notifier to the blocking notifier chain
+ * @nb: The notifier_block struct to register
+ *
+ * Call blocking_notifier_chain_register to register the notifier block to the
+ * lenovo-wmi-other driver notifier chain.
+ *
+ * Return: 0 on success, %-EEXIST on error.
+ */
+int lwmi_om_register_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_register(&om_chain_head, nb);
+}
+EXPORT_SYMBOL_NS_GPL(lwmi_om_register_notifier, "LENOVO_WMI_OTHER");
+
+/**
+ * lwmi_om_unregister_notifier() - Remove a notifier from the blocking notifier
+ * chain.
+ * @nb: The notifier_block struct to register
+ *
+ * Call blocking_notifier_chain_unregister to unregister the notifier block from the
+ * lenovo-wmi-other driver notifier chain.
+ *
+ * Return: 0 on success, %-ENOENT on error.
+ */
+int lwmi_om_unregister_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_unregister(&om_chain_head, nb);
+}
+EXPORT_SYMBOL_NS_GPL(lwmi_om_unregister_notifier, "LENOVO_WMI_OTHER");
+
+/**
+ * devm_lwmi_om_unregister_notifier() - Remove a notifier from the blocking
+ * notifier chain.
+ * @data: Void pointer to the notifier_block struct to register.
+ *
+ * Call lwmi_om_unregister_notifier to unregister the notifier block from the
+ * lenovo-wmi-other driver notifier chain.
+ *
+ * Return: 0 on success, %-ENOENT on error.
+ */
+static void devm_lwmi_om_unregister_notifier(void *data)
+{
+	struct notifier_block *nb = data;
+
+	lwmi_om_unregister_notifier(nb);
+}
+
+/**
+ * devm_lwmi_om_register_notifier() - Add a notifier to the blocking notifier
+ * chain.
+ * @dev: The parent device of the notifier_block struct.
+ * @nb: The notifier_block struct to register
+ *
+ * Call lwmi_om_register_notifier to register the notifier block to the
+ * lenovo-wmi-other driver notifier chain. Then add devm_lwmi_om_unregister_notifier
+ * as a device managed action to automatically unregister the notifier block
+ * upon parent device removal.
+ *
+ * Return: 0 on success, or an error code.
+ */
+int devm_lwmi_om_register_notifier(struct device *dev,
+				   struct notifier_block *nb)
+{
+	int ret;
+
+	ret = lwmi_om_register_notifier(nb);
+	if (ret < 0)
+		return ret;
+
+	return devm_add_action_or_reset(dev, devm_lwmi_om_unregister_notifier,
+					nb);
+}
+EXPORT_SYMBOL_NS_GPL(devm_lwmi_om_register_notifier, "LENOVO_WMI_OTHER");
+
+/**
+ * lwmi_om_notifier_call() - Call functions for the notifier call chain.
+ * @mode: Pointer to a thermal mode enum to retrieve the data from.
+ *
+ * Call blocking_notifier_call_chain to retrieve the thermal mode from the
+ * lenovo-wmi-gamezone driver.
+ *
+ * Return: 0 on success, or an error code.
+ */
+static int lwmi_om_notifier_call(enum thermal_mode *mode)
+{
+	int ret;
+
+	ret = blocking_notifier_call_chain(&om_chain_head,
+					   LWMI_GZ_GET_THERMAL_MODE, &mode);
+	if ((ret & ~NOTIFY_STOP_MASK) != NOTIFY_OK)
+		return -EINVAL;
+
+	return 0;
+}
+
+/* Attribute Methods */
+
+/**
+ * int_type_show() - Emit the data type for an integer attribute
+ * @kobj: Pointer to the driver object.
+ * @kattr: Pointer to the attribute calling this function.
+ * @buf: The buffer to write to.
+ *
+ * Return: Number of characters written to buf.
+ */
+static ssize_t int_type_show(struct kobject *kobj, struct kobj_attribute *kattr,
+			     char *buf)
+{
+	return sysfs_emit(buf, "integer\n");
+}
+
+/**
+ * attr_capdata01_show() - Get the value of the specified attribute property
+ *
+ * @kobj: Pointer to the driver object.
+ * @kattr: Pointer to the attribute calling this function.
+ * @buf: The buffer to write to.
+ * @tunable_attr: The attribute to be read.
+ * @prop: The property of this attribute to be read.
+ *
+ * Retrieves the given property from the capability data 01 struct for the
+ * specified attribute's "custom" thermal mode. This function is intended
+ * to be generic so it can be called from any integer attributes "_show"
+ * function.
+ *
+ * If the WMI is success the sysfs attribute is notified.
+ *
+ * Return: Either number of characters written to buf, or an error code.
+ */
+static ssize_t attr_capdata01_show(struct kobject *kobj,
+				   struct kobj_attribute *kattr, char *buf,
+				   struct tunable_attr_01 *tunable_attr,
+				   enum attribute_property prop)
+{
+	struct lwmi_om_priv *priv = dev_get_drvdata(tunable_attr->dev);
+	struct capdata01 capdata;
+	u32 attribute_id;
+	int value, ret;
+
+	attribute_id =
+		FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id) |
+		FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
+		FIELD_PREP(LWMI_ATTR_MODE_ID_MASK,
+			   LWMI_GZ_THERMAL_MODE_CUSTOM) |
+		FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
+
+	ret = lwmi_cd01_get_data(priv->cd01_list, attribute_id, &capdata);
+	if (ret)
+		return ret;
+
+	switch (prop) {
+	case DEFAULT_VAL:
+		value = capdata.default_value;
+		break;
+	case MAX_VAL:
+		value = capdata.max_value;
+		break;
+	case MIN_VAL:
+		value = capdata.min_value;
+		break;
+	case STEP_VAL:
+		value = capdata.step;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return sysfs_emit(buf, "%d\n", value);
+}
+
+/**
+ * attr_current_value_store() - Set the current value of the given attribute
+ * @kobj: Pointer to the driver object.
+ * @kattr: Pointer to the attribute calling this function.
+ * @buf: The buffer to read from, this is parsed to `int` type.
+ * @count: Required by sysfs attribute macros, pass in from the callee attr.
+ * @tunable_attr: The attribute to be stored.
+ *
+ * Sets the value of the given attribute when operating under the "custom"
+ * smartfan profile. The current smartfan profile is retrieved from the
+ * lenovo-wmi-gamezone driver and error is returned if the result is not
+ * "custom". This function is intended to be generic so it can be called from
+ * any integer attribute's "_store" function. The integer to be sent to the WMI
+ * method is range checked and an error code is returned if out of range.
+ *
+ * If the value is valid and WMI is success, then the sysfs attribute is
+ * notified.
+ *
+ * Return: Either count, or an error code.
+ */
+static ssize_t attr_current_value_store(struct kobject *kobj,
+					struct kobj_attribute *kattr,
+					const char *buf, size_t count,
+					struct tunable_attr_01 *tunable_attr)
+{
+	struct lwmi_om_priv *priv = dev_get_drvdata(tunable_attr->dev);
+	struct wmi_method_args_32 args;
+	struct capdata01 capdata;
+	enum thermal_mode mode;
+	u32 attribute_id;
+	u32 value;
+	int ret;
+
+	ret = lwmi_om_notifier_call(&mode);
+	if (ret)
+		return ret;
+
+	if (mode != LWMI_GZ_THERMAL_MODE_CUSTOM)
+		return -EBUSY;
+
+	attribute_id =
+		FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id) |
+		FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
+		FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, mode) |
+		FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
+
+	ret = lwmi_cd01_get_data(priv->cd01_list, attribute_id, &capdata);
+	if (ret)
+		return ret;
+
+	ret = kstrtouint(buf, 10, &value);
+	if (ret)
+		return ret;
+
+	if (value < capdata.min_value || value > capdata.max_value)
+		return -EINVAL;
+
+	args.arg0 = attribute_id;
+	args.arg1 = value;
+
+	ret = lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_SET,
+				    (unsigned char *)&args, sizeof(args), NULL);
+	if (ret)
+		return ret;
+
+	return count;
+};
+
+/**
+ * attr_current_value_show() - Get the current value of the given attribute
+ * @kobj: Pointer to the driver object.
+ * @kattr: Pointer to the attribute calling this function.
+ * @buf: The buffer to write to.
+ * @tunable_attr: The attribute to be read.
+ *
+ * Retrieves the value of the given attribute for the current smartfan profile.
+ * The current smartfan profile is retrieved from the lenovo-wmi-gamezone driver.
+ * This function is intended to be generic so it can be called from any integer
+ * attribute's "_show" function.
+ *
+ * If the WMI is success the sysfs attribute is notified.
+ *
+ * Return: Either number of characters written to buf, or an error code.
+ */
+static ssize_t attr_current_value_show(struct kobject *kobj,
+				       struct kobj_attribute *kattr, char *buf,
+				       struct tunable_attr_01 *tunable_attr)
+{
+	struct lwmi_om_priv *priv = dev_get_drvdata(tunable_attr->dev);
+	struct wmi_method_args_32 args;
+	enum thermal_mode mode;
+	u32 attribute_id;
+	int retval;
+	int ret;
+
+	ret = lwmi_om_notifier_call(&mode);
+	if (ret)
+		return ret;
+
+	attribute_id =
+		FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id) |
+		FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
+		FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, mode) |
+		FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
+
+	args.arg0 = attribute_id;
+
+	ret = lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_GET,
+				    (unsigned char *)&args, sizeof(args),
+				    &retval);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%d\n", retval);
+}
+
+/* Lenovo WMI Other Mode Attribute macros */
+#define __LWMI_ATTR_RO(_func, _name)                                  \
+	{                                                             \
+		.attr = { .name = __stringify(_name), .mode = 0444 }, \
+		.show = _func##_##_name##_show,                       \
+	}
+
+#define __LWMI_ATTR_RO_AS(_name, _show)                               \
+	{                                                             \
+		.attr = { .name = __stringify(_name), .mode = 0444 }, \
+		.show = _show,                                        \
+	}
+
+#define __LWMI_ATTR_RW(_func, _name) \
+	__ATTR(_name, 0644, _func##_##_name##_show, _func##_##_name##_store)
+
+/* Shows a formatted static variable */
+#define __LWMI_ATTR_SHOW_FMT(_prop, _attrname, _fmt, _val)                     \
+	static ssize_t _attrname##_##_prop##_show(                             \
+		struct kobject *kobj, struct kobj_attribute *kattr, char *buf) \
+	{                                                                      \
+		return sysfs_emit(buf, _fmt, _val);                            \
+	}                                                                      \
+	static struct kobj_attribute attr_##_attrname##_##_prop =              \
+		__LWMI_ATTR_RO(_attrname, _prop)
+
+/* Attribute current value read/write */
+#define __LWMI_TUNABLE_CURRENT_VALUE_CAP01(_attrname)                          \
+	static ssize_t _attrname##_current_value_store(                        \
+		struct kobject *kobj, struct kobj_attribute *kattr,            \
+		const char *buf, size_t count)                                 \
+	{                                                                      \
+		return attr_current_value_store(kobj, kattr, buf, count,       \
+						&_attrname);                   \
+	}                                                                      \
+	static ssize_t _attrname##_current_value_show(                         \
+		struct kobject *kobj, struct kobj_attribute *kattr, char *buf) \
+	{                                                                      \
+		return attr_current_value_show(kobj, kattr, buf, &_attrname);  \
+	}                                                                      \
+	static struct kobj_attribute attr_##_attrname##_current_value =        \
+		__LWMI_ATTR_RW(_attrname, current_value)
+
+/* Attribute property read only */
+#define __LWMI_TUNABLE_RO_CAP01(_prop, _attrname, _prop_type)                  \
+	static ssize_t _attrname##_##_prop##_show(                             \
+		struct kobject *kobj, struct kobj_attribute *kattr, char *buf) \
+	{                                                                      \
+		return attr_capdata01_show(kobj, kattr, buf, &_attrname,       \
+					   _prop_type);                        \
+	}                                                                      \
+	static struct kobj_attribute attr_##_attrname##_##_prop =              \
+		__LWMI_ATTR_RO(_attrname, _prop)
+
+#define LWMI_ATTR_GROUP_TUNABLE_CAP01(_attrname, _fsname, _dispname)      \
+	__LWMI_TUNABLE_CURRENT_VALUE_CAP01(_attrname);                    \
+	__LWMI_TUNABLE_RO_CAP01(default_value, _attrname, DEFAULT_VAL);   \
+	__LWMI_ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispname); \
+	__LWMI_TUNABLE_RO_CAP01(max_value, _attrname, MAX_VAL);           \
+	__LWMI_TUNABLE_RO_CAP01(min_value, _attrname, MIN_VAL);           \
+	__LWMI_TUNABLE_RO_CAP01(scalar_increment, _attrname, STEP_VAL);   \
+	static struct kobj_attribute attr_##_attrname##_type =            \
+		__LWMI_ATTR_RO_AS(type, int_type_show);                   \
+	static struct attribute *_attrname##_attrs[] = {                  \
+		&attr_##_attrname##_current_value.attr,                   \
+		&attr_##_attrname##_default_value.attr,                   \
+		&attr_##_attrname##_display_name.attr,                    \
+		&attr_##_attrname##_max_value.attr,                       \
+		&attr_##_attrname##_min_value.attr,                       \
+		&attr_##_attrname##_scalar_increment.attr,                \
+		&attr_##_attrname##_type.attr,                            \
+		NULL,                                                     \
+	};                                                                \
+	static const struct attribute_group _attrname##_attr_group = {    \
+		.name = _fsname, .attrs = _attrname##_attrs               \
+	}
+
+LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl1_spl, "ppt_pl1_spl",
+			      "Set the CPU sustained power limit");
+LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl2_sppt, "ppt_pl2_sppt",
+			      "Set the CPU slow package power tracking limit");
+LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl3_fppt, "ppt_pl3_fppt",
+			      "Set the CPU fast package power tracking limit");
+
+static struct capdata01_attr_group cd01_attr_groups[] = {
+	{ &ppt_pl1_spl_attr_group, &ppt_pl1_spl },
+	{ &ppt_pl2_sppt_attr_group, &ppt_pl2_sppt },
+	{ &ppt_pl3_fppt_attr_group, &ppt_pl3_fppt },
+	{},
+};
+
+/**
+ * lwmi_om_fw_attr_add() - Register all firmware_attributes_class members
+ * @priv: The Other Mode driver data.
+ *
+ * Return: Either 0, or an error code.
+ */
+static int lwmi_om_fw_attr_add(struct lwmi_om_priv *priv)
+{
+	unsigned int i;
+	int err;
+
+	priv->ida_id = ida_alloc(&lwmi_om_ida, GFP_KERNEL);
+	if (priv->ida_id < 0)
+		return priv->ida_id;
+
+	priv->fw_attr_dev = device_create(&firmware_attributes_class, NULL,
+					  MKDEV(0, 0), NULL, "%s-%u",
+					  LWMI_OM_FW_ATTR_BASE_PATH,
+					  priv->ida_id);
+	if (IS_ERR(priv->fw_attr_dev)) {
+		err = PTR_ERR(priv->fw_attr_dev);
+		goto err_free_ida;
+	}
+
+	priv->fw_attr_kset = kset_create_and_add("attributes", NULL,
+						 &priv->fw_attr_dev->kobj);
+	if (!priv->fw_attr_kset) {
+		err = -ENOMEM;
+		goto err_destroy_classdev;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(cd01_attr_groups) - 1; i++) {
+		err = sysfs_create_group(&priv->fw_attr_kset->kobj,
+					 cd01_attr_groups[i].attr_group);
+		if (err)
+			goto err_remove_groups;
+
+		cd01_attr_groups[i].tunable_attr->dev = &priv->wdev->dev;
+	}
+	return 0;
+
+err_remove_groups:
+	while (i--)
+		sysfs_remove_group(&priv->fw_attr_kset->kobj,
+				   cd01_attr_groups[i].attr_group);
+
+	kset_unregister(priv->fw_attr_kset);
+
+err_destroy_classdev:
+	device_unregister(priv->fw_attr_dev);
+
+err_free_ida:
+	ida_free(&lwmi_om_ida, priv->ida_id);
+	return err;
+}
+
+/**
+ * lwmi_om_fw_attr_remove() - Unregister all capability data attribute groups
+ * @priv: the lenovo-wmi-other driver data.
+ */
+static void lwmi_om_fw_attr_remove(struct lwmi_om_priv *priv)
+{
+	for (unsigned int i = 0; i < ARRAY_SIZE(cd01_attr_groups) - 1; i++)
+		sysfs_remove_group(&priv->fw_attr_kset->kobj,
+				   cd01_attr_groups[i].attr_group);
+
+	kset_unregister(priv->fw_attr_kset);
+	device_unregister(priv->fw_attr_dev);
+}
+
+/**
+ * lwmi_om_master_bind() - Bind all components of the other mode driver
+ * @dev: The lenovo-wmi-other driver basic device.
+ *
+ * Call component_bind_all to bind the lenovo-wmi-capdata01 driver to the
+ * lenovo-wmi-other master driver. On success, assign the capability data 01
+ * list pointer to the driver data struct for later access. This pointer
+ * is only valid while the capdata01 interface exists. Finally, register all
+ * firmware attribute groups.
+ *
+ * Return: 0 on success, or an error code.
+ */
+static int lwmi_om_master_bind(struct device *dev)
+{
+	struct lwmi_om_priv *priv = dev_get_drvdata(dev);
+	struct cd01_list *tmp_list;
+	int ret;
+
+	ret = component_bind_all(dev, &tmp_list);
+	if (ret)
+		return ret;
+
+	priv->cd01_list = tmp_list;
+	if (!priv->cd01_list)
+		return -ENODEV;
+
+	return lwmi_om_fw_attr_add(priv);
+}
+
+/**
+ * lwmi_om_master_unbind() - Unbind all components of the other mode driver
+ * @dev: The lenovo-wmi-other driver basic device
+ *
+ * Unregister all capability data attribute groups. Then call
+ * component_unbind_all to unbind the lenovo-wmi-capdata01 driver from the
+ * lenovo-wmi-other master driver. Finally, free the IDA for this device.
+ */
+static void lwmi_om_master_unbind(struct device *dev)
+{
+	struct lwmi_om_priv *priv = dev_get_drvdata(dev);
+
+	lwmi_om_fw_attr_remove(priv);
+	component_unbind_all(dev, NULL);
+}
+
+static const struct component_master_ops lwmi_om_master_ops = {
+	.bind = lwmi_om_master_bind,
+	.unbind = lwmi_om_master_unbind,
+};
+
+static int lwmi_other_probe(struct wmi_device *wdev, const void *context)
+{
+	struct component_match *master_match = NULL;
+	struct lwmi_om_priv *priv;
+
+	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->wdev = wdev;
+	dev_set_drvdata(&wdev->dev, priv);
+
+	component_match_add(&wdev->dev, &master_match, lwmi_cd01_match, NULL);
+	if (IS_ERR(master_match))
+		return PTR_ERR(master_match);
+
+	return component_master_add_with_match(&wdev->dev, &lwmi_om_master_ops,
+					       master_match);
+}
+
+static void lwmi_other_remove(struct wmi_device *wdev)
+{
+	struct lwmi_om_priv *priv = dev_get_drvdata(&wdev->dev);
+
+	component_master_del(&wdev->dev, &lwmi_om_master_ops);
+	ida_free(&lwmi_om_ida, priv->ida_id);
+}
+
+static const struct wmi_device_id lwmi_other_id_table[] = {
+	{ LENOVO_OTHER_MODE_GUID, NULL },
+	{}
+};
+
+static struct wmi_driver lwmi_other_driver = {
+	.driver = {
+		.name = "lenovo_wmi_other",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+	},
+	.id_table = lwmi_other_id_table,
+	.probe = lwmi_other_probe,
+	.remove = lwmi_other_remove,
+	.no_singleton = true,
+};
+
+module_wmi_driver(lwmi_other_driver);
+
+MODULE_IMPORT_NS("LENOVO_WMI_CD01");
+MODULE_IMPORT_NS("LENOVO_WMI_HELPERS");
+MODULE_DEVICE_TABLE(wmi, lwmi_other_id_table);
+MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
+MODULE_DESCRIPTION("Lenovo Other Mode WMI Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/platform/x86/lenovo-wmi-other.h b/drivers/platform/x86/lenovo-wmi-other.h
new file mode 100644
index 000000000000..8ebf5602bb99
--- /dev/null
+++ b/drivers/platform/x86/lenovo-wmi-other.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+/* Copyright (C) 2025 Derek J. Clark <derekjohn.clark@gmail.com> */
+
+#ifndef _LENOVO_WMI_OTHER_H_
+#define _LENOVO_WMI_OTHER_H_
+
+struct device;
+struct notifier_block;
+
+int lwmi_om_register_notifier(struct notifier_block *nb);
+int lwmi_om_unregister_notifier(struct notifier_block *nb);
+int devm_lwmi_om_register_notifier(struct device *dev,
+				   struct notifier_block *nb);
+
+#endif /* !_LENOVO_WMI_OTHER_H_ */
-- 
2.49.0

