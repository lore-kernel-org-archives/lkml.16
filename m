Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67F31E521E;
	Wed,  2 Jul 2025 03:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751427521; cv=none; b=CjHVa8EONJ/EeNBia8nl1i4fzM1gZzxENAb8xICGrNITFCkKQ6B0QptUSDQF7UwBvjVwfBPGTjKsZkzeqvEzP9yFYxFsQyNjX5/LY4ZJ+VyONRjtf1Hu6j3eUrmmOyzXZYn3DATKWXB/S/IExmbbbBis30aP9ZaeVRWdDWPvW1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751427521; c=relaxed/simple;
	bh=UXyFGMczY2vnUK1fHDakNnTifLrkOwkeZqOUHwQKick=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NOywsKl+6aE6GqF50yYxgQ22Er2V5bk2FflUT1nzszbKEzBrAMI+6kbafs25tA5R1fi+5MdhEXXQHJjae2Ifj3PoR6ccQNQaMlhWVyKqRKIppLQE/SSR7eLDcVVQoCO5+/xzieKKXlA9uEDTuW8Ba5a1KuCbrdQJTFUSXpySnYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I3mLJayc; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I3mLJayc"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7490acf57b9so3064779b3a.2;
        Tue, 01 Jul 2025 20:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751427519; x=1752032319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7HAs6coMNCNUbXXVPUcvfTbpVoqKAThZUcEDvY+zXVY=;
        b=I3mLJaycjJ/JU/PYXzdWE02wia4qbuQXA/Drf0Q50rfWzhdWhr+tE/JEZnFtJhGVpt
         kG9NDnxlBIKI9YZt5Gs2O/gwH6W+EUx1cb9KCJMS5o+VuAvzy1sSLFAe+ZkNfEUVTJMo
         lTPLOaN6bEKFrIbcTMk0VA2nJGAxEGHW3l8ShxWTxqfx8SOz/vAf9vISTFL046qFE/KL
         jM41O6aN5nD5Ghkjn6/oGElX38uAIlFo5H4BSeVGtVz3GOCH1gEa5bCRMrcUBTJbXZpG
         x1abUiruataH/05W89FmLrt9M0ejIkDcgwkLZHZ0eiXO7H3a5ZRDr6NLzsIsvGPgPaWm
         nQnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751427519; x=1752032319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7HAs6coMNCNUbXXVPUcvfTbpVoqKAThZUcEDvY+zXVY=;
        b=bH73Y+TqcRqwiFiLadgThjqf8C+6IM6JH/i3uZ+4fiLF/u6GYODrZQvApEDaSxLL6m
         uCn+H+ptNDYjCHxwcx3ykILrcfr9/2mFYddlovQPjvp8A+E0ocKI2mgEXxbv90+wxeIC
         YbqQQ5uO7ePrePS6xB/ogq1TQX6XFrjqQ8ifMdDXbbNPwhfRD/GRG/xGItEhurMT5Vvr
         tgfusMa+sHYMtukOaU7ddc6l8t7LLA4BHiaYGvby61Ch60+RfQfreO+4E+5CV6YsYm0d
         p7hIKcFN3uS/kRBqe+2AeJ/hxuX3z7+CwZzGYfIVQ5jyPTHUzcMYPk76y7Qw0MHo4rA2
         NRPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWwULYsu4HBc5QU5qRNsK9VQEMsYWkVF+Kt9Q83CoXjyyEKhXQTS2atZlmdA5j5vVIjUxYINNqDZ9OzfWfcBUjTsDzbw==@vger.kernel.org, AJvYcCVVIGbYtYgPFVOSYd/xwEtx8ggSRuToiBtIOnqFVIzMgjZ33bdaOFJFcWt6eujYfwgepCmQ73Y5xIRAoKv2@vger.kernel.org, AJvYcCWux6/qU2Cg8K8A6COKs96iojh4Rqs7PLez4vMXN97sydbRUgK70f/V+oODDqkhFCiGPqeC6VVvEmE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJWOLl389ZUkO87iyzvgAH6vd3dCsV/4LAwglYA5Dc0ePc4xFS
	VM8muIoqMT8KlUYPvXh4EodxrbnwR7NMD0L7+/aOFHD6hjcwDpEvxyHR
X-Gm-Gg: ASbGnct2fvbRKqXnZ0H4d5WycqheJpu7PW2WOiwtnT9M/wwPZCCTDe2qNQ/ycJN7Yb9
	X0EU1zL2/4PyUYnTZhQgdkFAYZGVd/wOX9k2r1BX6+Mkkmtd1FP+vQC02eR3dteEaGTADu67Aco
	DuJ8Hu5MDUBiJaEKcv/mbu2/K3mskNyPTSOlPF9EgQfAwFwE7JHOyiB4JdBUsiQEgVogDBYxo2W
	5/7t0qeyBGTVepDjXb/75TtBQ5hb0ecdxCRP4CNCw2L1XfHlQRv+n3pZcSQayWK8h7OWJdkwCRZ
	6Az2/Ewsl0gvlQek/QFsstFFbv9biKPIGEjQdSGxD7+3C6u3DhubL2P7pt2lJsOSoscqDmHyBpG
	Kry2bdrd8oVzt459VKxmTgFj6t3+TzUE9SlzIqq8H5Q==
X-Google-Smtp-Source: AGHT+IGGe4M4U7OBfA9psOAzVGhGgbU5Kj/0jTjp0mRTd8Eqj7keOjO1bfoBIMFURw++Qz+CsfCWVg==
X-Received: by 2002:a05:6a21:7a47:b0:21a:eabb:ab93 with SMTP id adf61e73a8af0-222d7dc4670mr2816095637.6.1751427518963;
        Tue, 01 Jul 2025 20:38:38 -0700 (PDT)
Received: from bliptop (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e301d64fsm11783008a12.19.2025.07.01.20.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 20:38:38 -0700 (PDT)
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
Subject: [PATCH v13 4/6] platform/x86: Add Lenovo Capability Data 01 WMI Driver
Date: Tue,  1 Jul 2025 20:38:24 -0700
Message-ID: <20250702033826.1057762-5-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702033826.1057762-1-derekjohn.clark@gmail.com>
References: <20250702033826.1057762-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds lenovo-wmi-capdata01 driver which provides the
LENOVO_CAPABILITY_DATA_01 WMI data block that comes on "Other Mode"
enabled hardware. Provides an interface for querying if a given
attribute is supported by the hardware, as well as its default_value,
max_value, min_value, and step increment.

Reviewed-by: Alok Tiwari <alok.a.tiwari@oracle.com>
Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
v13:
 - Move to new lenovo folder
v12:
 - Fix warnings from make W=1
v11:
 - Formatting
v10: No change
v9:
 - Check result of devm_mutex_init.
v8:
 - Use devm_mutex_init() instead of mutex_init().
 - Check return of devm_add_action_or_reset during probe.
 - Don't check if cd01 list exists in bind as the driver will bail if
   there is a malloc/populating issue prior to bind.
 - Fix typos.
v7:
 - Do memcpy instead of returning pointer in lwmi_cd01_get_data.
 - Put list mutex inside lwmi_cd01_priv struct.
 - Unregister from acpi events on dev remove.
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
---
 drivers/platform/x86/lenovo/Kconfig         |   4 +
 drivers/platform/x86/lenovo/Makefile        |   1 +
 drivers/platform/x86/lenovo/wmi-capdata01.c | 302 ++++++++++++++++++++
 drivers/platform/x86/lenovo/wmi-capdata01.h |  25 ++
 4 files changed, 332 insertions(+)
 create mode 100644 drivers/platform/x86/lenovo/wmi-capdata01.c
 create mode 100644 drivers/platform/x86/lenovo/wmi-capdata01.h

diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x86/lenovo/Kconfig
index 95dce00f257e..1943e3a24f43 100644
--- a/drivers/platform/x86/lenovo/Kconfig
+++ b/drivers/platform/x86/lenovo/Kconfig
@@ -233,6 +233,10 @@ config YT2_1380
 	  To compile this driver as a module, choose M here: the module will
 	  be called lenovo-yogabook.
 
+config LENOVO_WMI_DATA01
+	tristate
+	depends on ACPI_WMI
+
 config LENOVO_WMI_EVENTS
 	tristate
 	depends on ACPI_WMI
diff --git a/drivers/platform/x86/lenovo/Makefile b/drivers/platform/x86/lenovo/Makefile
index 814c4ba9bdbe..1ce970e4ddb8 100644
--- a/drivers/platform/x86/lenovo/Makefile
+++ b/drivers/platform/x86/lenovo/Makefile
@@ -12,6 +12,7 @@ lenovo-target-$(CONFIG_LENOVO_YMC)	+= ymc.o
 lenovo-target-$(CONFIG_YOGABOOK)	+= yogabook.o
 lenovo-target-$(CONFIG_YT2_1380)	+= yoga-tab2-pro-1380-fastcharger.o
 lenovo-target-$(CONFIG_LENOVO_WMI_CAMERA)	+= wmi-camera.o
+lenovo-target-$(CONFIG_LENOVO_WMI_DATA01)	+= wmi-capdata01.o
 lenovo-target-$(CONFIG_LENOVO_WMI_EVENTS)	+= wmi-events.o
 lenovo-target-$(CONFIG_LENOVO_WMI_HELPERS)	+= wmi-helpers.o
 
diff --git a/drivers/platform/x86/lenovo/wmi-capdata01.c b/drivers/platform/x86/lenovo/wmi-capdata01.c
new file mode 100644
index 000000000000..c922680b3cba
--- /dev/null
+++ b/drivers/platform/x86/lenovo/wmi-capdata01.c
@@ -0,0 +1,302 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Lenovo Capability Data 01 WMI Data Block driver.
+ *
+ * Lenovo Capability Data 01 provides information on tunable attributes used by
+ * the "Other Mode" WMI interface. The data includes if the attribute is
+ * supported by the hardware, the default_value, max_value, min_value, and step
+ * increment. Each attribute has multiple pages, one for each of the thermal
+ * modes managed by the Gamezone interface.
+ *
+ * Copyright (C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
+ */
+
+#include <linux/acpi.h>
+#include <linux/cleanup.h>
+#include <linux/component.h>
+#include <linux/container_of.h>
+#include <linux/device.h>
+#include <linux/export.h>
+#include <linux/gfp_types.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/mutex_types.h>
+#include <linux/notifier.h>
+#include <linux/overflow.h>
+#include <linux/types.h>
+#include <linux/wmi.h>
+
+#include "wmi-capdata01.h"
+
+#define LENOVO_CAPABILITY_DATA_01_GUID "7A8F5407-CB67-4D6E-B547-39B3BE018154"
+
+#define ACPI_AC_CLASS "ac_adapter"
+#define ACPI_AC_NOTIFY_STATUS 0x80
+
+struct lwmi_cd01_priv {
+	struct notifier_block acpi_nb; /* ACPI events */
+	struct wmi_device *wdev;
+	struct cd01_list *list;
+};
+
+struct cd01_list {
+	struct mutex list_mutex; /* list R/W mutex */
+	u8 count;
+	struct capdata01 data[];
+};
+
+/**
+ * lwmi_cd01_component_bind() - Bind component to master device.
+ * @cd01_dev: Pointer to the lenovo-wmi-capdata01 driver parent device.
+ * @om_dev: Pointer to the lenovo-wmi-other driver parent device.
+ * @data: capdata01_list object pointer used to return the capability data.
+ *
+ * On lenovo-wmi-other's master bind, provide a pointer to the local capdata01
+ * list. This is used to call lwmi_cd01_get_data to look up attribute data
+ * from the lenovo-wmi-other driver.
+ *
+ * Return: 0
+ */
+static int lwmi_cd01_component_bind(struct device *cd01_dev,
+				    struct device *om_dev, void *data)
+{
+	struct lwmi_cd01_priv *priv = dev_get_drvdata(cd01_dev);
+	struct cd01_list **cd01_list = data;
+
+	*cd01_list = priv->list;
+
+	return 0;
+}
+
+static const struct component_ops lwmi_cd01_component_ops = {
+	.bind = lwmi_cd01_component_bind,
+};
+
+/**
+ * lwmi_cd01_get_data - Get the data of the specified attribute
+ * @list: The lenovo-wmi-capdata01 pointer to its cd01_list struct.
+ * @attribute_id: The capdata attribute ID to be found.
+ * @output: Pointer to a capdata01 struct to return the data.
+ *
+ * Retrieves the capability data 01 struct pointer for the given
+ * attribute for its specified thermal mode.
+ *
+ * Return: 0 on success, or -EINVAL.
+ */
+int lwmi_cd01_get_data(struct cd01_list *list, u32 attribute_id, struct capdata01 *output)
+{
+	u8 idx;
+
+	guard(mutex)(&list->list_mutex);
+	for (idx = 0; idx < list->count; idx++) {
+		if (list->data[idx].id != attribute_id)
+			continue;
+		memcpy(output, &list->data[idx], sizeof(list->data[idx]));
+		return 0;
+	};
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_NS_GPL(lwmi_cd01_get_data, "LENOVO_WMI_CD01");
+
+/**
+ * lwmi_cd01_cache() - Cache all WMI data block information
+ * @priv: lenovo-wmi-capdata01 driver data.
+ *
+ * Loop through each WMI data block and cache the data.
+ *
+ * Return: 0 on success, or an error.
+ */
+static int lwmi_cd01_cache(struct lwmi_cd01_priv *priv)
+{
+	int idx;
+
+	guard(mutex)(&priv->list->list_mutex);
+	for (idx = 0; idx < priv->list->count; idx++) {
+		union acpi_object *ret_obj __free(kfree) = NULL;
+
+		ret_obj = wmidev_block_query(priv->wdev, idx);
+		if (!ret_obj)
+			return -ENODEV;
+
+		if (ret_obj->type != ACPI_TYPE_BUFFER ||
+		    ret_obj->buffer.length < sizeof(priv->list->data[idx]))
+			continue;
+
+		memcpy(&priv->list->data[idx], ret_obj->buffer.pointer,
+		       ret_obj->buffer.length);
+	}
+
+	return 0;
+}
+
+/**
+ * lwmi_cd01_alloc() - Allocate a cd01_list struct in drvdata
+ * @priv: lenovo-wmi-capdata01 driver data.
+ *
+ * Allocate a cd01_list struct large enough to contain data from all WMI data
+ * blocks provided by the interface.
+ *
+ * Return: 0 on success, or an error.
+ */
+static int lwmi_cd01_alloc(struct lwmi_cd01_priv *priv)
+{
+	struct cd01_list *list;
+	size_t list_size;
+	int count, ret;
+
+	count = wmidev_instance_count(priv->wdev);
+	list_size = struct_size(list, data, count);
+
+	list = devm_kzalloc(&priv->wdev->dev, list_size, GFP_KERNEL);
+	if (!list)
+		return -ENOMEM;
+
+	ret = devm_mutex_init(&priv->wdev->dev, &list->list_mutex);
+	if (ret)
+		return ret;
+
+	list->count = count;
+	priv->list = list;
+
+	return 0;
+}
+
+/**
+ * lwmi_cd01_setup() - Cache all WMI data block information
+ * @priv: lenovo-wmi-capdata01 driver data.
+ *
+ * Allocate a cd01_list struct large enough to contain data from all WMI data
+ * blocks provided by the interface. Then loop through each data block and
+ * cache the data.
+ *
+ * Return: 0 on success, or an error code.
+ */
+static int lwmi_cd01_setup(struct lwmi_cd01_priv *priv)
+{
+	int ret;
+
+	ret = lwmi_cd01_alloc(priv);
+	if (ret)
+		return ret;
+
+	return lwmi_cd01_cache(priv);
+}
+
+/**
+ * lwmi_cd01_notifier_call() - Call method for lenovo-wmi-capdata01 driver notifier.
+ * block call chain.
+ * @nb: The notifier_block registered to lenovo-wmi-events driver.
+ * @action: Unused.
+ * @data: The ACPI event.
+ *
+ * For LWMI_EVENT_THERMAL_MODE, set current_mode and notify platform_profile
+ * of a change.
+ *
+ * Return: notifier_block status.
+ */
+static int lwmi_cd01_notifier_call(struct notifier_block *nb, unsigned long action,
+				   void *data)
+{
+	struct acpi_bus_event *event = data;
+	struct lwmi_cd01_priv *priv;
+	int ret;
+
+	if (strcmp(event->device_class, ACPI_AC_CLASS) != 0)
+		return NOTIFY_DONE;
+
+	priv = container_of(nb, struct lwmi_cd01_priv, acpi_nb);
+
+	switch (event->type) {
+	case ACPI_AC_NOTIFY_STATUS:
+		ret = lwmi_cd01_cache(priv);
+		if (ret)
+			return NOTIFY_BAD;
+
+		return NOTIFY_OK;
+	default:
+		return NOTIFY_DONE;
+	}
+}
+
+/**
+ * lwmi_cd01_unregister() - Unregister the cd01 ACPI notifier_block.
+ * @data: The ACPI event notifier_block to unregister.
+ */
+static void lwmi_cd01_unregister(void *data)
+{
+	struct notifier_block *acpi_nb = data;
+
+	unregister_acpi_notifier(acpi_nb);
+}
+
+static int lwmi_cd01_probe(struct wmi_device *wdev, const void *context)
+
+{
+	struct lwmi_cd01_priv *priv;
+	int ret;
+
+	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->wdev = wdev;
+	dev_set_drvdata(&wdev->dev, priv);
+
+	ret = lwmi_cd01_setup(priv);
+	if (ret)
+		return ret;
+
+	priv->acpi_nb.notifier_call = lwmi_cd01_notifier_call;
+
+	ret = register_acpi_notifier(&priv->acpi_nb);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(&wdev->dev, lwmi_cd01_unregister, &priv->acpi_nb);
+	if (ret)
+		return ret;
+
+	return component_add(&wdev->dev, &lwmi_cd01_component_ops);
+}
+
+static void lwmi_cd01_remove(struct wmi_device *wdev)
+{
+	component_del(&wdev->dev, &lwmi_cd01_component_ops);
+}
+
+static const struct wmi_device_id lwmi_cd01_id_table[] = {
+	{ LENOVO_CAPABILITY_DATA_01_GUID, NULL },
+	{}
+};
+
+static struct wmi_driver lwmi_cd01_driver = {
+	.driver = {
+		.name = "lenovo_wmi_cd01",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+	},
+	.id_table = lwmi_cd01_id_table,
+	.probe = lwmi_cd01_probe,
+	.remove = lwmi_cd01_remove,
+	.no_singleton = true,
+};
+
+/**
+ * lwmi_cd01_match() - Match rule for the master driver.
+ * @dev: Pointer to the capability data 01 parent device.
+ * @data: Unused void pointer for passing match criteria.
+ *
+ * Return: int.
+ */
+int lwmi_cd01_match(struct device *dev, void *data)
+{
+	return dev->driver == &lwmi_cd01_driver.driver;
+}
+EXPORT_SYMBOL_NS_GPL(lwmi_cd01_match, "LENOVO_WMI_CD01");
+
+module_wmi_driver(lwmi_cd01_driver);
+
+MODULE_DEVICE_TABLE(wmi, lwmi_cd01_id_table);
+MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
+MODULE_DESCRIPTION("Lenovo Capability Data 01 WMI Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/platform/x86/lenovo/wmi-capdata01.h b/drivers/platform/x86/lenovo/wmi-capdata01.h
new file mode 100644
index 000000000000..bd06c5751f68
--- /dev/null
+++ b/drivers/platform/x86/lenovo/wmi-capdata01.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+/* Copyright (C) 2025 Derek J. Clark <derekjohn.clark@gmail.com> */
+
+#ifndef _LENOVO_WMI_CAPDATA01_H_
+#define _LENOVO_WMI_CAPDATA01_H_
+
+#include <linux/types.h>
+
+struct device;
+struct cd01_list;
+
+struct capdata01 {
+	u32 id;
+	u32 supported;
+	u32 default_value;
+	u32 step;
+	u32 min_value;
+	u32 max_value;
+};
+
+int lwmi_cd01_get_data(struct cd01_list *list, u32 attribute_id, struct capdata01 *output);
+int lwmi_cd01_match(struct device *dev, void *data);
+
+#endif /* !_LENOVO_WMI_CAPDATA01_H_ */
-- 
2.50.0

