Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4697E155335;
	Mon, 28 Apr 2025 01:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745803247; cv=none; b=LVuIfb7PHZwJp/xbTRIxJ1s91HNowLSpYTo9X+XbDnWYQ29eim8/bee1ngXZjBxqwxcHmpvQ9qmWgS+C9yTQ1z0B5T7/XL0gwkBqEkCUUE8IviGK3+0CHydZR7C/EmhVii9ViaIKwEgNYhIZD88b9TkpVTE/RiPIkQIvFeFaC3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745803247; c=relaxed/simple;
	bh=Bi1wuSx1uFudP9DB+z8/5Am3XFCBTM/HBRbwpSOx35g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NS+tlPM4f/U5eOnEwJl9TAtZqyjFj6HN300BgTuSlP+AaiqoxbK49upm11WZkmlWAgLFV4pgkoGwI2cmOZz2M139iuE+EdENqtE7R1W1d1wRDi8IELqPxHA4tR+43kppo3HlLD3qjTMnEl6R2bI2hP6rvRRF8qhQamVgabS7BgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fgw7Kht0; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fgw7Kht0"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-225df540edcso52231215ad.0;
        Sun, 27 Apr 2025 18:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745803244; x=1746408044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dje7lHomTyj2d5X1J2U83zfYkJnGhzWItlqtyFeCwn8=;
        b=Fgw7Kht0H1H0ZSyk9boPZ25NYRkTJBm7zbX2o3eor/IHEgqRxhpYRBa0K/jhv6MVgX
         0aksj+QiXg9UfFuCL0raG+x7zKzISv6DszsapPYmOkOgf813KxyPzALaCPDsIAnj5LJG
         VJic4uCHEzbUj0kJBT3s9NM9PW84f34kT1g8AHBVl6ETMNiCqC1FBQLr+4g+6wFO07vR
         0kn2FmR7CeK/J4tXQJjWCNia7hxBy9NLL9wwmIFkpd4xnE0qkJV/TMe2TAWubKnR17Jm
         LddptU48BvzzAFaRvkUMETSSd6gOziLPpvixZxja6q0fgWbQq34hniEgxCxvAQIgzT1h
         15YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745803244; x=1746408044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dje7lHomTyj2d5X1J2U83zfYkJnGhzWItlqtyFeCwn8=;
        b=T11rtHtLNVHBCemLTHTE2qtPu1IidyElAzAEI5vJT0287dkkJ+hueq9MqAUpvbuQ40
         9tY+nfdFhF3qiev78HYgRW9MM35FY/stYbcZBnYUwUPrUqKI3l6WnZ8HS6LQi5A1iF4e
         HG6GY0S0iFAYM5soABgGunl9xQVGfgsh7/Vq7UygFx3CA/qaPFtJcWOCTE4+V7Uit6bY
         zEFhpXm2YaUbFTeiZwG3b5dlXawMoQ1PNXk78Z2bhOCJEYNEMYwc62lSpGMeVUHLhxsN
         cJ5cBqZe9JGXWR0pqm6WA47K/Uv7c2D4jVtDkX9QMTtB0VAhH+s3e1eg+QDW21CE1BX4
         3cKw==
X-Forwarded-Encrypted: i=1; AJvYcCU7Ysgt+N/svHh/HAaz1xMWgziLhBbUpVus4/PYWN5QzhIsHeqCV4Y2a0T7i7mCpKECrMwucHSMaMemxUYTmo1EM6uveA==@vger.kernel.org, AJvYcCV5ZWk0y0frWcLuFWjhEgv18FNPNFQt/X7HMLAi5RByRTigDJY6hx4npbNCHqz3BXp9tNH9reC3VU7MSzhS@vger.kernel.org, AJvYcCWe8GGm0ncClIrBJwizRvhtP0N20Om35KCmu7+4LtfStjyICr61otUqB/q7vcOg7iBM5jMngJQu2sQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YycOBiQZ5b9C9vW3RBgIAh1OwufE2k557FHyKHZTwFXu4ZUEWuD
	w3+MgL7bcqY/r3EHTBpPcPgK8vJxnl/pCZgD1nsjLlNmBGX+MG7B
X-Gm-Gg: ASbGncvyf0IQYCaN+PsO5lfvAjHKYH0YK0OOOUOSJqLsfEGH2O5jWgTDK8G3XId+5RC
	3IeSXwSuk+LgEZhgnk8ufdXNdiGX9feqH6olT/82f0taIEJfaGtKYPIIbEpqarC/s1Ns6/MEAPv
	57ElP0e+4jOGoEhbB+hTgA7J60/slcjvCVD7PW+EEZvz0Xa/QTRCkovSnXnORlyZ08CDZ3TOWNy
	OOZMuC33v1K6Kmmn7+xbjEkGvjXOpwJosHV5rzh5KwJ0jw7OVDWwJ1Nv4pMLW0INpsVC6LDZCX+
	ahF4c14ISozYqwhHxLUjYcomYxw1Cn5TtShrsT28GdWd4DBkpQsz00UlgW46f3jWcbsK1F+TjTK
	R6DLspFRQx9JJSNYWPFR1hm6Jvnnwqg6Yc27rCGI=
X-Google-Smtp-Source: AGHT+IGygUanceHdIQbGoadlmMwcSPgOU3DY6jYM28awNzN/xvhJzxQbwFZgXBq0BVJVovwZJ/vBHg==
X-Received: by 2002:a17:902:eb83:b0:224:3d:2ffd with SMTP id d9443c01a7336-22db49832ddmr176896065ad.17.1745803244356;
        Sun, 27 Apr 2025 18:20:44 -0700 (PDT)
Received: from localhost.localdomain (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5216ba5sm70334725ad.222.2025.04.27.18.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 18:20:44 -0700 (PDT)
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
Subject: [PATCH v6 4/6] platform/x86: Add Lenovo WMI Capability Data 01 Driver
Date: Sun, 27 Apr 2025 18:18:04 -0700
Message-ID: <20250428012029.970017-5-derekjohn.clark@gmail.com>
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

Adds lenovo-wmi-capdata01 driver which provides the
LENOVO_CAPABILITY_DATA_01 WMI data block that comes on "Other Mode"
enabled hardware. Provides an interface for querying if a given
attribute is supported by the hardware, as well as its default_value,
max_value, min_value, and step increment.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
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
 MAINTAINERS                                 |   1 +
 drivers/platform/x86/Kconfig                |   4 +
 drivers/platform/x86/Makefile               |   1 +
 drivers/platform/x86/lenovo-wmi-capdata01.c | 272 ++++++++++++++++++++
 drivers/platform/x86/lenovo-wmi-capdata01.h |  29 +++
 5 files changed, 307 insertions(+)
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
index 000000000000..841d4a37249b
--- /dev/null
+++ b/drivers/platform/x86/lenovo-wmi-capdata01.c
@@ -0,0 +1,272 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Lenovo Capability Data 01 WMI Data Block driver.
+ *
+ * Lenovo Capability Data 01 provides information on tunable attributes used by
+ * the "Other Mode" WMI interface. The data includes if the attribute is
+ * supported by the hardware, the default_value, max_value, min_value, and step
+ * increment. Each attibute has multiple pages, one for each of the thermal
+ * modes managed by the Gamezone interface.
+ *
+ * Copyright(C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
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
+#include <linux/notifier.h>
+#include <linux/overflow.h>
+#include <linux/types.h>
+#include <linux/wmi.h>
+
+#include "lenovo-wmi-capdata01.h"
+
+#define LENOVO_CAPABILITY_DATA_01_GUID "7A8F5407-CB67-4D6E-B547-39B3BE018154"
+
+#define ACPI_AC_NOTIFY_STATUS 0x80
+
+static DEFINE_MUTEX(list_mutex);
+
+struct lwmi_cd01_priv {
+	struct notifier_block acpi_nb; /* ACPI events */
+	struct wmi_device *wdev;
+	struct cd01_list *list;
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
+:* Return: 0 on success, or an error code.
+ */
+static int lwmi_cd01_component_bind(struct device *cd01_dev,
+				    struct device *om_dev, void *data)
+{
+	struct lwmi_cd01_priv *priv = dev_get_drvdata(cd01_dev);
+	struct cd01_list **cd01_list = data;
+
+	if (!priv->list)
+		return -ENODEV;
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
+ * @tunable_attr: The attribute to be populated.
+ *
+ * Retrieves the capability data 01 struct pointer for the given
+ * attribute for its specified thermal mode.
+ *
+ * Return: Either a pointer to capability data, or NULL.
+ */
+struct capdata01 *lwmi_cd01_get_data(struct cd01_list *list, u32 attribute_id)
+{
+	u8 idx;
+
+	guard(mutex)(&list_mutex);
+	for (idx = 0; idx < list->count; idx++) {
+		if (list->data[idx].id != attribute_id)
+			continue;
+		return &list->data[idx];
+	}
+	return NULL;
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
+	guard(mutex)(&list_mutex);
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
+	int count;
+
+	count = wmidev_instance_count(priv->wdev);
+	list_size = struct_size(list, data, count);
+
+	guard(mutex)(&list_mutex);
+	list = devm_kzalloc(&priv->wdev->dev, list_size, GFP_KERNEL);
+	if (!list)
+		return -ENOMEM;
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
+	struct acpi_bus_event *event = (struct acpi_bus_event *)data;
+	struct lwmi_cd01_priv *priv;
+	int ret;
+
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
+	register_acpi_notifier(&priv->acpi_nb);
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
index 000000000000..ed4f3d86464d
--- /dev/null
+++ b/drivers/platform/x86/lenovo-wmi-capdata01.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+/* Copyright(C) 2025 Derek J. Clark <derekjohn.clark@gmail.com> */
+
+#ifndef _LENOVO_WMI_CAPDATA01_H_
+#define _LENOVO_WMI_CAPDATA01_H_
+
+#include <linux/types.h>
+
+struct device;
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
+struct cd01_list {
+	u8 count;
+	struct capdata01 data[];
+};
+
+struct capdata01 *lwmi_cd01_get_data(struct cd01_list *list, u32 attribute_id);
+int lwmi_cd01_match(struct device *dev, void *data);
+
+#endif /* !_LENOVO_WMI_CAPDATA01_H_ */
-- 
2.49.0

