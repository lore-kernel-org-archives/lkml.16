Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980C725F97B;
	Tue,  8 Apr 2025 01:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744075723; cv=none; b=OkiwwJO61DCyly7974xgXhYo7lVZiSaBwUCZJxr2F5neb2q5Ma1rsaORgYjJqIMJjta5urg9oFaCV1sdky1S/bRXLs2dX9lGYi/E2WyHmkAuwbyMdFi6r40aYsqPxPoSbHgcsp554z+raMaabChSSsX47FKq0zRSPxXAqLyivTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744075723; c=relaxed/simple;
	bh=9juF4lZrN7JBNwB7jjS7ZSUaApDUwXco2RVAurT10vY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yg2oUY0/iaWB9q65zauTMG611kv4jbGATMDM2EimN9YS/gwb10i9uBmw9LyIYmrWZYai1m2nVcJn4dClum6nzZ0ZNS4dBvTIvaz5k+HkGmdYuGA/RPBybAZ61OLGmxt+iV9PZ+JEv9nqyyPoaUuKt42oh7cVmcG7wT2c2Tush3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PLIUAtkW; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PLIUAtkW"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22401f4d35aso54763895ad.2;
        Mon, 07 Apr 2025 18:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744075720; x=1744680520; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=68H7RgwF7/UMwJhmeugghcmSTp58xHToh8gjGlxH1Ec=;
        b=PLIUAtkWsyEM8VwXmtq8pwommtZg7WP4SsWz4l3ffblKWefWEqDuWmlEaeMoZJyFGS
         BSLNJxVprVwZLGe75k4gvW0kmMZPx9EvlzoOmAIGoiFIUigw6buhKzroHkx0ALYQeJiL
         WfvSJ7I/E96v/htJ44aTf+zqUQx+fjDkwYEIP92yLrNb+OwcRKaVwWdW08k9cliQjDr2
         hbvOruaTZ7UQqTdsoC33AW3izcvjROAT6+kU8rUFH2IQGrwFJ0mZ1oHvBSHhXi1biXdf
         kubbTcigRoQCkfUZafJqLiqIadp6janBdxjegzhtPKwv7OuE/vikiPDrVuOokHjIPX2g
         L0Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744075720; x=1744680520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=68H7RgwF7/UMwJhmeugghcmSTp58xHToh8gjGlxH1Ec=;
        b=IQXmUX5FCU+56/9PSCP6oIW9KzgMZsUHvodCN9wGINorP7PRhSM7WaZANpgxAOWA8h
         0ZOZ9wIkSQa9FWDltZw+SzXft2wn2jETu49IHqlwfEXSBygr+zeDEZ5me9kMfCC3pO5E
         hs7/oCVTo7U3TzWP351ym4Mvg3YHl6OdJ4T//QClt7QhPDXAElGBDsbN0kbzGPQpCwTo
         Zn4Ol3iivmJvCFzxxBbAlUeQGTFNRISwedro0NUaDc5q/yaIfD56N6s4trXxCWAYI8+n
         v6xNEMHUhvk0ELndweav1bxAbB7iVrFs0D3CKcz/MVCiwsvAKFByPFr0Z+UIyJYYZ7JD
         SdJA==
X-Forwarded-Encrypted: i=1; AJvYcCWW8H8Pz8tgQHs+hYQKQ2YvRSt3GRYM2NxwMF6Xjcvb/qSaRnxI1BpNIf5+3PBkKKREI8pAvGkE5kpjv9jWaL8MoCXuxA==@vger.kernel.org, AJvYcCWzFNVs1IyyigojXLyuaqbjkSUIgtXYdJXf6P1wvwiK2v/vuWuvDo1Z7I1WXmedQLW0rqOjmvACuWM=@vger.kernel.org, AJvYcCXVn5w58pbNn869PEkVZxPMFjNUx/S7KqZQgL2TpvaSZw/b2UyXzuidp3R4Fg1TfKlk5qRkJbiDSc0PDSsW@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/M8GAzVMy3mx4wrT5qwkcS4OnsaVK+e4H8wRkq0TsECq8a8sL
	pHbf2lDwLZjQ9u4tVOFHj4avibzRXkT7cKS16xVXLQAJPMweicO5
X-Gm-Gg: ASbGncsqU6kPz23NJqNrJ7+BlmjOQz+cu6jDdfK9TaFLGXIpV/MAqE5gV/IFhO1vfPT
	G0++8iXmejtvHyq1t+7ftK6yEJKhW2ck5CgSSegVDXf1baKszXlbn7qyiwm77pZHeai5agy9x5Z
	29xupYkvilA8GTpwmWIO7AGyr8iM1oBYNIg02tRscCC0P5aee1pw9UaDh/dgy/rJYv2R55iZTP8
	8BnPyk47r4HALvPXV+zyHSEtk0+vCVo3k+Y96egZ6n85WfUxFKTHDx6Bg6i4twjnNn+gBJCWZZL
	gzFbmE+cboVeWH2smNCZ0QMaHYQaWiAGP0oc/hoCsoXd0Xbo5kIb0V3LF3jcszR13WE4rmVXF3D
	sjADfaYZEls4zzLD05AlW+ggxZ4gY5MESGZa99rNcLTI=
X-Google-Smtp-Source: AGHT+IH2cNAGg4KGJeXG7zxMy6losG6w52gpvx87f3gx+GzfR2e1GaaZbm3YkNEuoSWWxpIOrXFJvw==
X-Received: by 2002:a17:903:2383:b0:223:4d7e:e52c with SMTP id d9443c01a7336-22a95514117mr166895705ad.5.1744075719542;
        Mon, 07 Apr 2025 18:28:39 -0700 (PDT)
Received: from localhost.localdomain (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785c39c1sm87901255ad.85.2025.04.07.18.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 18:28:39 -0700 (PDT)
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
Subject: [PATCH v5 6/6] platform/x86: Add Lenovo Other Mode WMI Driver
Date: Mon,  7 Apr 2025 18:28:15 -0700
Message-ID: <20250408012815.1032357-7-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250408012815.1032357-1-derekjohn.clark@gmail.com>
References: <20250408012815.1032357-1-derekjohn.clark@gmail.com>
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

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
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
 MAINTAINERS                                |   2 +
 drivers/platform/x86/Kconfig               |  15 +
 drivers/platform/x86/Makefile              |   1 +
 drivers/platform/x86/lenovo-wmi-gamezone.c |  35 ++
 drivers/platform/x86/lenovo-wmi-other.c    | 677 +++++++++++++++++++++
 drivers/platform/x86/lenovo-wmi-other.h    |  16 +
 6 files changed, 746 insertions(+)
 create mode 100644 drivers/platform/x86/lenovo-wmi-other.c
 create mode 100644 drivers/platform/x86/lenovo-wmi-other.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 49deb8ea4ea7..0416afd997a0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13172,6 +13172,8 @@ F:	drivers/platform/x86/lenovo-wmi-gamezone.c
 F:	drivers/platform/x86/lenovo-wmi-gamezone.h
 F:	drivers/platform/x86/lenovo-wmi-helpers.c
 F:	drivers/platform/x86/lenovo-wmi-helpers.h
+F:	drivers/platform/x86/lenovo-wmi-other.c
+F:	drivers/platform/x86/lenovo-wmi-other.h
 
 LENOVO WMI HOTKEY UTILITIES DRIVER
 M:	Jackie Dong <xy-jackie@139.com>
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index aaa1a69c10ca..be5ab24960b5 100644
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
index 60058b547de2..f3e64926a96b 100644
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
index 2e6d5e7faadf..9c80561f931c 100644
--- a/drivers/platform/x86/lenovo-wmi-gamezone.c
+++ b/drivers/platform/x86/lenovo-wmi-gamezone.c
@@ -22,6 +22,7 @@
 #include "lenovo-wmi-events.h"
 #include "lenovo-wmi-gamezone.h"
 #include "lenovo-wmi-helpers.h"
+#include "lenovo-wmi-other.h"
 
 #define LENOVO_GAMEZONE_GUID "887B54E3-DDDC-4B2C-8B88-68A26A8835D0"
 
@@ -49,6 +50,34 @@ static struct quirk_entry quirk_no_extreme_bug = {
 	.extreme_supported = false,
 };
 
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
+		**mode = priv->current_mode;
+		return NOTIFY_STOP;
+	default:
+		return NOTIFY_DONE;
+	}
+}
+
 /**
  * lwmi_gz_event_call() - Call method for lenovo-wmi-events driver notifier.
  * block call chain.
@@ -347,6 +376,11 @@ static int lwmi_gz_probe(struct wmi_device *wdev, const void *context)
 	if (ret)
 		return ret;
 
+	priv->mode_nb.notifier_call = lwmi_gz_mode_call;
+	ret = devm_lwmi_om_register_notifier(&wdev->dev, &priv->mode_nb);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 
@@ -369,6 +403,7 @@ module_wmi_driver(lwmi_gz_driver);
 
 MODULE_IMPORT_NS("LENOVO_WMI_EVENTS");
 MODULE_IMPORT_NS("LENOVO_WMI_HELPERS");
+MODULE_IMPORT_NS("LENOVO_WMI_OTHER");
 MODULE_DEVICE_TABLE(wmi, lwmi_gz_id_table);
 MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
 MODULE_DESCRIPTION("Lenovo GameZone WMI Driver");
diff --git a/drivers/platform/x86/lenovo-wmi-other.c b/drivers/platform/x86/lenovo-wmi-other.c
new file mode 100644
index 000000000000..342883a90270
--- /dev/null
+++ b/drivers/platform/x86/lenovo-wmi-other.c
@@ -0,0 +1,677 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Lenovo Other Mode WMI interface driver.
+ *
+ * This driver uses the fw_attributes class to expose the various WMI functions
+ * provided by the "Other Mode" WMI interface. This enables CPU and GPU power
+ * limit as well as various other attributes for devices that fall under the
+ * "Gaming Series" of Lenovo laptop devices. Each attribute exposed by the
+ * "Other Mode"" interface has a corresponding Capability Data struct that
+ * allows the driver to probe details about the attribute such as if it is
+ * supported by the hardware, the default_value, max_value, min_value, and step
+ * increment.
+ *
+ * These attributes typically don't fit anywhere else in the sysfs and are set
+ * in Windows using one of Lenovo's multiple user applications.
+ *
+ * Copyright(C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
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
+	/* *cd01_list is only valid after master bind and while capdata01 exists */
+	struct cd01_list *cd01_list;
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
+struct tunable_attr_01 ppt_pl1_spl = { .device_id = LWMI_DEVICE_ID_CPU,
+				       .feature_id = LWMI_FEATURE_ID_CPU_SPL,
+				       .type_id = LWMI_TYPE_ID_NONE };
+struct tunable_attr_01 ppt_pl2_sppt = { .device_id = LWMI_DEVICE_ID_CPU,
+					.feature_id = LWMI_FEATURE_ID_CPU_SPPT,
+					.type_id = LWMI_TYPE_ID_NONE };
+struct tunable_attr_01 ppt_pl3_fppt = { .device_id = LWMI_DEVICE_ID_CPU,
+					.feature_id = LWMI_FEATURE_ID_CPU_FPPT,
+					.type_id = LWMI_TYPE_ID_NONE };
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
+ * lenovo-wmi-other driver notifer chain.
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
+ * lenovo-wmi-other driver notifer chain.
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
+ * lenovo-wmi-other driver notifer chain.
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
+ * lenovo-wmi-other driver notifer chain. Then add devm_lwmi_om_unregister_notifier
+ * as a device managed ation to automatically unregister the notifier block
+ * upon parent device removal.
+ *
+ * Return: 0 on success, or on error.
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
+ * Return: 0 on success, or on error.
+ */
+static int lwmi_om_notifier_call(enum thermal_mode *mode)
+{
+	int ret;
+
+	ret = blocking_notifier_call_chain(&om_chain_head, LWMI_GZ_GET_THERMAL_MODE, &mode);
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
+ * @kobj_attribute: Pointer to the attribute calling this function.
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
+ * attr_capdata01_get - Get the data of the specified attribute
+ * @tunable_attr: The attribute to be populated.
+ *
+ * Retrieves the capability data 01 struct pointer for the given
+ * attribute for its specified thermal mode.
+ *
+ * Return: Either a pointer to capability data, or NULL.
+ */
+static struct capdata01 *attr_capdata01_get_data(struct lwmi_om_priv *priv,
+						 u32 attribute_id)
+{
+	int idx;
+
+	for (idx = 0; idx < priv->cd01_list->count; idx++) {
+		if (priv->cd01_list->data[idx].id != attribute_id)
+			continue;
+		return &priv->cd01_list->data[idx];
+	}
+	return NULL;
+}
+
+/**
+ * attr_capdata01_show() - Get the value of the specified attribute property
+ *
+ * @kobj: Pointer to the driver object.
+ * @kobj_attribute: Pointer to the attribute calling this function.
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
+ * Return: Either number of characters written to buf, or an error.
+ */
+static ssize_t attr_capdata01_show(struct kobject *kobj,
+				   struct kobj_attribute *kattr, char *buf,
+				   struct tunable_attr_01 *tunable_attr,
+				   enum attribute_property prop)
+{
+	struct lwmi_om_priv *priv = dev_get_drvdata(tunable_attr->dev);
+	struct capdata01 *capdata;
+	u32 attribute_id;
+	int value;
+
+	attribute_id =
+		FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id) |
+		FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
+		FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, LWMI_GZ_THERMAL_MODE_CUSTOM) |
+		FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
+
+	capdata = attr_capdata01_get_data(priv, attribute_id);
+
+	if (!capdata)
+		return -ENODEV;
+
+	switch (prop) {
+	case DEFAULT_VAL:
+		value = capdata->default_value;
+		break;
+	case MAX_VAL:
+		value = capdata->max_value;
+		break;
+	case MIN_VAL:
+		value = capdata->min_value;
+		break;
+	case STEP_VAL:
+		value = capdata->step;
+		break;
+	default:
+		return -EINVAL;
+	}
+	return sysfs_emit(buf, "%d\n", value);
+}
+
+/**
+ * att_current_value_store() - Set the current value of the given attribute
+ * @kobj: Pointer to the driver object.
+ * @kobj_attribute: Pointer to the attribute calling this function.
+ * @buf: The buffer to read from, this is parsed to `int` type.
+ * @count: Required by sysfs attribute macros, pass in from the callee attr.
+ * @tunable_attr: The attribute to be stored.
+ *
+ * Sets the value of the given attribute when operating under the "custom"
+ * smartfan profile. The current smartfan profile is retrieved from the
+ * lenovo-wmi-gamezone driver and error is returned if the result is not
+ * "custom". This function is intended to be generic so it can be called from
+ * any integer attribute's "_store" function. The integer to be sent to the WMI
+ * method is range checked and an error is returned if out of range.
+ *
+ * If the value is valid and WMI is success, then the sysfs attribute is
+ * notified.
+ *
+ * Return: Either count, or an error.
+ */
+static ssize_t attr_current_value_store(struct kobject *kobj,
+					struct kobj_attribute *kattr,
+					const char *buf, size_t count,
+					struct tunable_attr_01 *tunable_attr)
+{
+	struct lwmi_om_priv *priv = dev_get_drvdata(tunable_attr->dev);
+	struct wmi_method_args_32 args;
+	struct capdata01 *capdata;
+	enum thermal_mode mode;
+	u32 attribute_id;
+	u32 value;
+	int err;
+
+	err = lwmi_om_notifier_call(&mode);
+	if (err)
+		return err;
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
+	capdata = attr_capdata01_get_data(priv, attribute_id);
+
+	if (!capdata)
+		return -ENODEV;
+
+	err = kstrtouint(buf, 10, &value);
+	if (err)
+		return err;
+
+	if (value < capdata->min_value || value > capdata->max_value)
+		return -EINVAL;
+
+	args.arg0 = attribute_id;
+	args.arg1 = value;
+
+	err = lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_SET,
+				    (unsigned char *)&args, sizeof(args), NULL);
+
+	if (err)
+		return err;
+
+	return count;
+};
+
+/**
+ * attr_current_value_show() - Get the current value of the given attribute
+ * @kobj: Pointer to the driver object.
+ * @kobj_attribute: Pointer to the attribute calling this function.
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
+ * Return: Either number of characters written to buf, or an error.
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
+	int err;
+
+	err = lwmi_om_notifier_call(&mode);
+	if (err)
+		return err;
+
+	attribute_id =
+		FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id) |
+		FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
+		FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, mode) |
+		FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
+
+	args.arg0 = attribute_id;
+
+	err = lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_GET,
+				    (unsigned char *)&args, sizeof(args),
+				    &retval);
+
+	if (err)
+		return err;
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
+ * Return: Either 0, or an error.
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
+	priv->fw_attr_kset = kset_create_and_add("attributes", NULL, &priv->fw_attr_dev->kobj);
+	if (!priv->fw_attr_kset) {
+		err = -ENOMEM;
+		goto err_destroy_classdev;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(cd01_attr_groups) - 1; i++) {
+		err = sysfs_create_group(&priv->fw_attr_kset->kobj, cd01_attr_groups[i].attr_group);
+		if (err)
+			goto err_remove_groups;
+
+		cd01_attr_groups[i].tunable_attr->dev = &priv->wdev->dev;
+	}
+	return 0;
+
+err_remove_groups:
+	while (i--)
+		sysfs_remove_group(&priv->fw_attr_kset->kobj, cd01_attr_groups[i].attr_group);
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
+		sysfs_remove_group(&priv->fw_attr_kset->kobj, cd01_attr_groups[i].attr_group);
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
+ * Return: 0 on success, or an error.
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
+
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
index 000000000000..49bc3521e184
--- /dev/null
+++ b/drivers/platform/x86/lenovo-wmi-other.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+/* Copyright(C) 2025 Derek J. Clark <derekjohn.clark@gmail.com> */
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

