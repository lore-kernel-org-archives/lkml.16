Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4028F235362;
	Thu,  8 May 2025 23:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746748351; cv=none; b=CBYBjHh2KZiNKkYybc/wfwC2RYBd/KnQn+7SRXaJM8DpyQojjICIfY7xu06791OzqJEhyf+VOXMMdSUomWjUCZD4CSbF+i6aoRLjpouSOTvxbeV6raWDSq7A8wnu3uTTBemftF++RZa2VJPvzHyYIQYvcIoxqWjTzceAQf9x+rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746748351; c=relaxed/simple;
	bh=jn7wN2cFGehXcpAJDtBYQ2L0fuBd4a/FXAOAPQbTUdA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xbbp3vLFe03QR5lFNTTDaPEYgmiD9kDbjtontvW712H46jWd2Qxa8W99bwQAmjFUCg+jU00ko6yo/K8EhiGE0nOiXUyaZGc3VasOHPJKEOwJ6/NtYbsB0mYdKmS8153JQqHXzSRfGPnTTHUaFIZ1IeT7j/lYUbTq8LgNRhsFMbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A0Owk5jT; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A0Owk5jT"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b1fcb97d209so2487496a12.1;
        Thu, 08 May 2025 16:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746748348; x=1747353148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O+t2cOOzOSlU1cLHUi9YdMyEKs7aUl+oZ4dlG77Y5LY=;
        b=A0Owk5jThFlHctnjiKYZW4nOGfBOi/60+4I2EpfycUnPQIMyA57Lxb4F2VaxMZnA1W
         kmaS8iaVQMuiqq6zCWBUTeY2mew/4vxWTSId3/0DmQgMO8OdjERxtw0CSiBIMKIyYyNO
         k0lViQZroWus/3Tb/OKuXtlQTcL9nVaGHFUUTPUwCq5x4YocAXQ4g1nQeJML3i18f9K2
         5sALw5GFR9aIXwb4vC3iZ5UZKtvkOsFLcG+k0SsMw1bxQKE5JmDDJBR0wuLdLGcaEWrx
         qnYxq6HmFGywUFaU1A6JmtJQKJi/HjXEDMh/YxOdSqPr40CMtsTxT4xs562SLuqfzqxD
         QL7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746748348; x=1747353148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O+t2cOOzOSlU1cLHUi9YdMyEKs7aUl+oZ4dlG77Y5LY=;
        b=Wuy6+fbA7MH0ILVjPhMbMKHnLKHwnxK6onsQDx9TUFBZvp3+QDJjUOMTC7Mi9S94Yt
         9DsWJun+kC7fQJjkM+YMZQJcnQjZtiU9a1cRCLxF8gZtruu/LZGopJA/TYU/eOeqUNIK
         oGlJ31g8PmN1VfJGNe44L6gDKRpKFqe/gyKSCpcfd1H5WqAkEl/aO6w+kNvJwdutwCb2
         ngU0ymTyEyjFOlMuGPbqWQr1weHGTYIiMMuYokI06OJjOLX/bmaJnAiGtrZI2kz7oFcw
         Ecm2aAa1+7Nnmz8/Iusd5hxhP3vTEfnf3IEUpuNinbw2JWXo2ZjIDWK3s+pDmOz0DA6r
         uxgQ==
X-Forwarded-Encrypted: i=1; AJvYcCURudaG5bL5qRcebPuXWIL//5nHXbJVQvKdY4Bk7+zenNb1mo7H17g/x6WdgBZexXXbcbr0WR/VmVb+wftFA86NGIZ79g==@vger.kernel.org, AJvYcCUeZ1I4UoE4If9DpuU6A7kcH++3hnyw1CxWyyngmPYXVbTNx+BxU+JPtwksXHa4aEXNEBtClwwXfSv5uFC1@vger.kernel.org, AJvYcCXZDl+Yvr/KqVJkaRmn2I+OC2hmMHESt1IQa38u5kX9umKDl61giaiZEd1bZHctmqhhgwSCrFct9Zw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9N0vjVoXlLjXNXVZ4ukklcqVn7Zul7A/CqkbILlIbUlBi6i79
	el7/JiwOG5lLRB5vVsCPxzdZsKvsZx0vv626t68Xnt+Wm+NkzIDd
X-Gm-Gg: ASbGnct37ATtxgRyb79NzAyo0dKGYl0P1dusQWWdZHwMc2tHg/SeuOHoVZ+trLrRrjI
	23TZayit0thmO1K6wn6+rmXRevDDkkax4uYLOg5FYhbXFgbBOBUMEM9by4j7ubs6mcXsD/90Iqk
	x+micIKUCS128oHt44hbnrgN8AuOBMD2z25nQKX7tyevpE2/5JgcLOon9I26dsVgPAeYTOSC3G0
	2zxH1VqzW9EwvvVDxCpv84pgy4tMHeRNfXVpqlAK/Ymgnv1zLxQMAnQna1xw3sDiZZi1C/mSj5A
	0A9peq0m/0CKrGRdI6vbS5z8FmbQ6ZI3Fbk0rG08EIKlS29HA3Ubj5E2Klk9TE0rqThusMyV/gJ
	hXAKZIXyR70ga50OfwGqHO5IAiDLTajrCk20xqcU=
X-Google-Smtp-Source: AGHT+IFhoUB2XOewV5ZiiwJCiam9PyOm7khT54BZAWbEJf6LapFjfYTg+vIO5e5++wc+8g2Ckxm7Cg==
X-Received: by 2002:a17:902:f607:b0:215:9eac:1857 with SMTP id d9443c01a7336-22e846e0394mr78732405ad.5.1746748348325;
        Thu, 08 May 2025 16:52:28 -0700 (PDT)
Received: from localhost.localdomain (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc680515esm5844615ad.0.2025.05.08.16.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 16:52:27 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Alok Tiwari <alok.a.tiwari@oracle.com>
Subject: [PATCH v9 4/6] platform/x86: Add Lenovo Capability Data 01 WMI Driver
Date: Thu,  8 May 2025 16:51:37 -0700
Message-ID: <20250508235217.12256-5-derekjohn.clark@gmail.com>
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

Adds lenovo-wmi-capdata01 driver which provides the
LENOVO_CAPABILITY_DATA_01 WMI data block that comes on "Other Mode"
enabled hardware. Provides an interface for querying if a given
attribute is supported by the hardware, as well as its default_value,
max_value, min_value, and step increment.

Reviewed-by: Alok Tiwari <alok.a.tiwari@oracle.com>
Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
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

capdata
---
 MAINTAINERS                                 |   1 +
 drivers/platform/x86/Kconfig                |   4 +
 drivers/platform/x86/Makefile               |   1 +
 drivers/platform/x86/lenovo-wmi-capdata01.c | 303 ++++++++++++++++++++
 drivers/platform/x86/lenovo-wmi-capdata01.h |  25 ++
 5 files changed, 334 insertions(+)
 create mode 100644 drivers/platform/x86/lenovo-wmi-capdata01.c
 create mode 100644 drivers/platform/x86/lenovo-wmi-capdata01.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 2b4b06e81192..1b22e41cc730 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13164,6 +13164,7 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	Documentation/wmi/devices/lenovo-wmi-gamezone.rst
 F:	Documentation/wmi/devices/lenovo-wmi-other.rst
+F:	drivers/platform/x86/lenovo-wmi-capdata01.*
 F:	drivers/platform/x86/lenovo-wmi-events.*
 F:	drivers/platform/x86/lenovo-wmi-helpers.*
 
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 13b8f4ac5dc5..64663667f0cb 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -467,6 +467,10 @@ config LENOVO_WMI_HELPERS
 	tristate
 	depends on ACPI_WMI
 
+config LENOVO_WMI_DATA01
+	tristate
+	depends on ACPI_WMI
+
 config IDEAPAD_LAPTOP
 	tristate "Lenovo IdeaPad Laptop Extras"
 	depends on ACPI
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index fc039839286a..7a35c77221b7 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -69,6 +69,7 @@ obj-$(CONFIG_THINKPAD_LMI)	+= think-lmi.o
 obj-$(CONFIG_YOGABOOK)		+= lenovo-yogabook.o
 obj-$(CONFIG_YT2_1380)		+= lenovo-yoga-tab2-pro-1380-fastcharger.o
 obj-$(CONFIG_LENOVO_WMI_CAMERA)	+= lenovo-wmi-camera.o
+obj-$(CONFIG_LENOVO_WMI_DATA01)	+= lenovo-wmi-capdata01.o
 obj-$(CONFIG_LENOVO_WMI_EVENTS)	+= lenovo-wmi-events.o
 obj-$(CONFIG_LENOVO_WMI_HELPERS)	+= lenovo-wmi-helpers.o
 
diff --git a/drivers/platform/x86/lenovo-wmi-capdata01.c b/drivers/platform/x86/lenovo-wmi-capdata01.c
new file mode 100644
index 000000000000..9f13d511b390
--- /dev/null
+++ b/drivers/platform/x86/lenovo-wmi-capdata01.c
@@ -0,0 +1,303 @@
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
+#include "linux/printk.h"
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
+#include "lenovo-wmi-capdata01.h"
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
+ * @dev: The lenovo-wmi-capdata01 parent device.
+ * @tunable_attr: The attribute to be found.
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
+ * lwmi_cd01_setup() - Cache all WMI data block information
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
diff --git a/drivers/platform/x86/lenovo-wmi-capdata01.h b/drivers/platform/x86/lenovo-wmi-capdata01.h
new file mode 100644
index 000000000000..bd06c5751f68
--- /dev/null
+++ b/drivers/platform/x86/lenovo-wmi-capdata01.h
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
2.49.0

