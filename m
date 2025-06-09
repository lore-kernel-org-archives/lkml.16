Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512C021FF24;
	Mon,  9 Jun 2025 18:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749495046; cv=none; b=SgeY3xEUvu8oXoXI//h6MrdvL0k2Bjt5V+APHrxt1217Hz/J7YoNc6GfOUd+lUh2XWAKbEtiWTOx5IFTU4y0hG0Mt3AI4oM8NjMW9OZnJOs6A4brhQkA8vtJ5ihW/+2n4+3m749GcVLMpmAt7YKP0Sc29EqdaRS0xMdAN3Nwi2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749495046; c=relaxed/simple;
	bh=BTIx4Jcpy7dYEgin5o5y5Z+RwC0+/yks5F2CT1j/sEo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Aoj5uU0PI+ra/9mGZ0eQrLYjDPvN3XA7upGYAe8kAjXvxkJfGmFixHQz7btxTmaiZ2BCJ2P9z80N4toqUUYyGX2sFToBO4bnMti93fkXBDyNSlb6Y9F2G/utcuUPBb3K6XL3WujULV4MZLnpTv5sHipe7U4yfmn1YXnU74s1LIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RYqcqBwq; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RYqcqBwq"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-747e41d5469so5121312b3a.3;
        Mon, 09 Jun 2025 11:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749495043; x=1750099843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zt9VphN+GLyxr70pepfMRT8MTqhCJKxLVytbI3CanGc=;
        b=RYqcqBwqUgjaIWTcuY+Fv+xVUL0svZPy95M3k6N5SCEciPPNYqtZt79u4rbE+OV8zB
         VYF5xBRM1s3EfoqlWLQ2SaT8T0auRRcXBxq5bg/mkloPUTEIGPfS5Q2TWuMyT5kki0w8
         DogVp3gC7l0HEFOTKfvL0pPsDna61a05fDhFOgl5thgbcD383oWzVvQYqXD3TQ4jBVgY
         J9x5jdE/Q/tz3ZJSUu5DgZ0glyFJ3oJFyk1+vPe4mlj2sp1svjghIRYiMnAkO/Af2een
         MVH/2qZ11UOQu+6ra4WdkBEjFGJHym+e7v/xM9ALkOV/xnCVjq8Yk1r7f5/EvxaUONtu
         O+rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749495043; x=1750099843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zt9VphN+GLyxr70pepfMRT8MTqhCJKxLVytbI3CanGc=;
        b=lVUsjTEIgScx8ilarquYWoJXLoBKWPHnbQLfu2gq6otscQ13Wc+L6/nvMZEP03prr8
         rDfK4rqD0Oj31PSFgIQeKi+gd3KWSiVgiw01xqxMmoBJqoSpACAhwvbICiXpIuw5+U53
         tCbIapkBxF7yQ0mIrGx2QM34VqwEnue8WOd9lPESAZyIG98kPzYcwCNiCP9tnKk71TVL
         iGSoGlLz+XvcxzrhunxmITgWIcr1M9hYwxbja+TT4DFuIN6WT90WbgxNmM46c+KIKk4h
         4mg81qRF/8l11vyDF4Z4u1FutaLtNnHFBwm8g7KmPQXN1ZpndNuRxXXIoVUCqGjLi/ZS
         n3Xg==
X-Forwarded-Encrypted: i=1; AJvYcCW56qIRZ4VoNoN1SoE6ck3yTOkgHg00eU12pFJIj681zZDZqZtugCYVpaojv+llH1CypG8sqO7N4cA=@vger.kernel.org, AJvYcCX8XkU8nNVkoeaQbEzTPTySXZHhxPt6rhH1gheJ83tl9IEpWJDedF1cDpVv0/ADibXA5E8yRU8NLlmeDKmWJ+uvuGucXQ==@vger.kernel.org, AJvYcCXJ8jBK7gylY2Vnddq30FWli/RkEFe8R86XVDr4gVrSEBCK0rsQHqTnjtO+XB2DyPdsI8h6BDkyuvzifeGl@vger.kernel.org
X-Gm-Message-State: AOJu0YwUfzXEOKgkmpvI641qltAsEujojCbTrCC6oIVVLicq+s3Dl8kN
	cKammx0UnRY6SlN6R62WIWS1VKnd88oqsWDluE5ddiNSjvyO+PftmcCu
X-Gm-Gg: ASbGncuFncpA6Ca3BPtEzaihh9W0vvsiqSOVfP9LnH7d4xfc02+StDzXKZYTBu9A7pP
	z0XeJVAl/JlK0d2Qosa4nqW8IJUq0xznR3HvuoFF9a5bilT+3YIiSUf0sl3aaEIiM7ChFY/Lw4f
	RsjMHrXx8eT6kiGBcojb4M+yLK2orGgHpf+QvhJNDfnVUwQqS6PKhmyHv7J7YXiFur8lJCGrRDN
	fBhBRPEzgubR+ehJnNjSdG/frkdfwBwMRBDOR/tm8LFp0sP7h+wUFQWKvk4I1zG3ztGihthx679
	qiqEPoGsKt+Ysr+Beo1sqf/j3xLtI/uwPNW3QM0ak8GxNbdFDkzwHZfS2Qs6dXu2fmKfMlRc4kB
	SCovam/E2kBnXkIxEhHRl2++jIitNcwNzv9Jwq9rmfjZmIYl9d7pw9WTpzEQj
X-Google-Smtp-Source: AGHT+IGyTkDWIXknOr9JyBg5ksF35qo3kahibt16KmcjxyVyrTVueDndpL6VVoAETuRvwQhyzVoDdA==
X-Received: by 2002:a05:6a20:1593:b0:20a:41b9:cb2f with SMTP id adf61e73a8af0-21ee6893e5cmr21102974637.29.1749495043426;
        Mon, 09 Jun 2025 11:50:43 -0700 (PDT)
Received: from localhost.localdomain (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5ed58e9bsm5625461a12.10.2025.06.09.11.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 11:50:43 -0700 (PDT)
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
	Alok Tiwari <alok.a.tiwari@oracle.com>,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH v12 3/6] platform/x86: Add Lenovo WMI Events Driver
Date: Mon,  9 Jun 2025 11:50:24 -0700
Message-ID: <20250609185027.7378-4-derekjohn.clark@gmail.com>
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

Adds lenovo-wmi-events driver. The events driver is designed as a
general entrypoint for all Lenovo WMI Events. It acts as a notification
chain head that will process event data and pass it on to registered
drivers so they can react to the events.

Currently only the Gamezone interface Thermal Mode Event GUID is
implemented in this driver. It is documented in the Gamezone
documentation.

Suggested-by: Armin Wolf <W_Armin@gmx.de>
Reviewed-by: Alok Tiwari <alok.a.tiwari@oracle.com>
Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
v12: No change
v11:
 - Formatting
v10: No change
v9: No change
v8: No change
v7:
 - Fix typos
v6:
 - Fix typos and rewordings to ensure consistancy in function description
   text.
v5:
 - Fixes from v4 review.
v4:
  - Remove the Thermal Mode Event GUID from Gamezone and add this driver.
---
 MAINTAINERS                              |   1 +
 drivers/platform/x86/Kconfig             |   4 +
 drivers/platform/x86/Makefile            |   1 +
 drivers/platform/x86/lenovo-wmi-events.c | 196 +++++++++++++++++++++++
 drivers/platform/x86/lenovo-wmi-events.h |  20 +++
 5 files changed, 222 insertions(+)
 create mode 100644 drivers/platform/x86/lenovo-wmi-events.c
 create mode 100644 drivers/platform/x86/lenovo-wmi-events.h

diff --git a/MAINTAINERS b/MAINTAINERS
index e4079b02ec19..f1df9a07e258 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13453,6 +13453,7 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	Documentation/wmi/devices/lenovo-wmi-gamezone.rst
 F:	Documentation/wmi/devices/lenovo-wmi-other.rst
+F:	drivers/platform/x86/lenovo-wmi-events.*
 F:	drivers/platform/x86/lenovo-wmi-helpers.*
 
 LENOVO WMI HOTKEY UTILITIES DRIVER
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 8446cbed34bb..27881cf00ebf 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -459,6 +459,10 @@ config IBM_RTL
 	 state = 0 (BIOS SMIs on)
 	 state = 1 (BIOS SMIs off)
 
+config LENOVO_WMI_EVENTS
+	tristate
+	depends on ACPI_WMI
+
 config LENOVO_WMI_HELPERS
 	tristate
 	depends on ACPI_WMI
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index ec6bc941091d..9effb1e3852c 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -69,6 +69,7 @@ obj-$(CONFIG_THINKPAD_LMI)	+= think-lmi.o
 obj-$(CONFIG_YOGABOOK)		+= lenovo-yogabook.o
 obj-$(CONFIG_YT2_1380)		+= lenovo-yoga-tab2-pro-1380-fastcharger.o
 obj-$(CONFIG_LENOVO_WMI_CAMERA)	+= lenovo-wmi-camera.o
+obj-$(CONFIG_LENOVO_WMI_EVENTS)	+= lenovo-wmi-events.o
 obj-$(CONFIG_LENOVO_WMI_HELPERS)	+= lenovo-wmi-helpers.o
 
 # Intel
diff --git a/drivers/platform/x86/lenovo-wmi-events.c b/drivers/platform/x86/lenovo-wmi-events.c
new file mode 100644
index 000000000000..2e0bbda5b976
--- /dev/null
+++ b/drivers/platform/x86/lenovo-wmi-events.c
@@ -0,0 +1,196 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Lenovo WMI Events driver. Lenovo WMI interfaces provide various
+ * hardware triggered events that many drivers need to have propagated.
+ * This driver provides a uniform entrypoint for these events so that
+ * any driver that needs to respond to these events can subscribe to a
+ * notifier chain.
+ *
+ * Copyright (C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
+ */
+
+#include <linux/acpi.h>
+#include <linux/export.h>
+#include <linux/module.h>
+#include <linux/notifier.h>
+#include <linux/types.h>
+#include <linux/wmi.h>
+
+#include "lenovo-wmi-events.h"
+#include "lenovo-wmi-gamezone.h"
+
+#define THERMAL_MODE_EVENT_GUID "D320289E-8FEA-41E0-86F9-911D83151B5F"
+
+#define LWMI_EVENT_DEVICE(guid, type)                        \
+	.guid_string = (guid), .context = &(enum lwmi_events_type) \
+	{                                                          \
+		type                                               \
+	}
+
+static BLOCKING_NOTIFIER_HEAD(events_chain_head);
+
+struct lwmi_events_priv {
+	struct wmi_device *wdev;
+	enum lwmi_events_type type;
+};
+
+/**
+ * lwmi_events_register_notifier() - Add a notifier to the notifier chain.
+ * @nb: The notifier_block struct to register
+ *
+ * Call blocking_notifier_chain_register to register the notifier block to the
+ * lenovo-wmi-events driver blocking notifier chain.
+ *
+ * Return: 0 on success, %-EEXIST on error.
+ */
+int lwmi_events_register_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_register(&events_chain_head, nb);
+}
+EXPORT_SYMBOL_NS_GPL(lwmi_events_register_notifier, "LENOVO_WMI_EVENTS");
+
+/**
+ * lwmi_events_unregister_notifier() - Remove a notifier from the notifier
+ * chain.
+ * @nb: The notifier_block struct to unregister
+ *
+ * Call blocking_notifier_chain_unregister to unregister the notifier block
+ * from the lenovo-wmi-events driver blocking notifier chain.
+ *
+ * Return: 0 on success, %-ENOENT on error.
+ */
+int lwmi_events_unregister_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_unregister(&events_chain_head, nb);
+}
+EXPORT_SYMBOL_NS_GPL(lwmi_events_unregister_notifier, "LENOVO_WMI_EVENTS");
+
+/**
+ * devm_lwmi_events_unregister_notifier() - Remove a notifier from the notifier
+ * chain.
+ * @data: Void pointer to the notifier_block struct to unregister.
+ *
+ * Call lwmi_events_unregister_notifier to unregister the notifier block from
+ * the lenovo-wmi-events driver blocking notifier chain.
+ *
+ * Return: 0 on success, %-ENOENT on error.
+ */
+static void devm_lwmi_events_unregister_notifier(void *data)
+{
+	struct notifier_block *nb = data;
+
+	lwmi_events_unregister_notifier(nb);
+}
+
+/**
+ * devm_lwmi_events_register_notifier() - Add a notifier to the notifier chain.
+ * @dev: The parent device of the notifier_block struct.
+ * @nb: The notifier_block struct to register
+ *
+ * Call lwmi_events_register_notifier to register the notifier block to the
+ * lenovo-wmi-events driver blocking notifier chain. Then add, as a device
+ * managed action, unregister_notifier to automatically unregister the
+ * notifier block upon its parent device removal.
+ *
+ * Return: 0 on success, or an error code.
+ */
+int devm_lwmi_events_register_notifier(struct device *dev,
+				       struct notifier_block *nb)
+{
+	int ret;
+
+	ret = lwmi_events_register_notifier(nb);
+	if (ret < 0)
+		return ret;
+
+	return devm_add_action_or_reset(dev, devm_lwmi_events_unregister_notifier, nb);
+}
+EXPORT_SYMBOL_NS_GPL(devm_lwmi_events_register_notifier, "LENOVO_WMI_EVENTS");
+
+/**
+ * lwmi_events_notify() - Call functions for the notifier call chain.
+ * @wdev: The parent WMI device of the driver.
+ * @obj: ACPI object passed by the registered WMI Event.
+ *
+ * Validate WMI event data and notify all registered drivers of the event and
+ * its output.
+ *
+ * Return: 0 on success, or an error code.
+ */
+static void lwmi_events_notify(struct wmi_device *wdev, union acpi_object *obj)
+{
+	struct lwmi_events_priv *priv = dev_get_drvdata(&wdev->dev);
+	int sel_prof;
+	int ret;
+
+	switch (priv->type) {
+	case LWMI_EVENT_THERMAL_MODE:
+		if (obj->type != ACPI_TYPE_INTEGER)
+			return;
+
+		sel_prof = obj->integer.value;
+
+		switch (sel_prof) {
+		case LWMI_GZ_THERMAL_MODE_QUIET:
+		case LWMI_GZ_THERMAL_MODE_BALANCED:
+		case LWMI_GZ_THERMAL_MODE_PERFORMANCE:
+		case LWMI_GZ_THERMAL_MODE_EXTREME:
+		case LWMI_GZ_THERMAL_MODE_CUSTOM:
+			ret = blocking_notifier_call_chain(&events_chain_head,
+							   LWMI_EVENT_THERMAL_MODE,
+							   &sel_prof);
+			if (ret == NOTIFY_BAD)
+				dev_err(&wdev->dev,
+					"Failed to send notification to call chain for WMI Events\n");
+			return;
+		default:
+			dev_err(&wdev->dev, "Got invalid thermal mode: %x",
+				sel_prof);
+			return;
+		}
+		break;
+	default:
+		return;
+	}
+}
+
+static int lwmi_events_probe(struct wmi_device *wdev, const void *context)
+{
+	struct lwmi_events_priv *priv;
+
+	if (!context)
+		return -EINVAL;
+
+	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->wdev = wdev;
+	priv->type = *(enum lwmi_events_type *)context;
+	dev_set_drvdata(&wdev->dev, priv);
+
+	return 0;
+}
+
+static const struct wmi_device_id lwmi_events_id_table[] = {
+	{ LWMI_EVENT_DEVICE(THERMAL_MODE_EVENT_GUID, LWMI_EVENT_THERMAL_MODE) },
+	{}
+};
+
+static struct wmi_driver lwmi_events_driver = {
+	.driver = {
+		.name = "lenovo_wmi_events",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+	},
+	.id_table = lwmi_events_id_table,
+	.probe = lwmi_events_probe,
+	.notify = lwmi_events_notify,
+	.no_singleton = true,
+};
+
+module_wmi_driver(lwmi_events_driver);
+
+MODULE_DEVICE_TABLE(wmi, lwmi_events_id_table);
+MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
+MODULE_DESCRIPTION("Lenovo WMI Events Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/platform/x86/lenovo-wmi-events.h b/drivers/platform/x86/lenovo-wmi-events.h
new file mode 100644
index 000000000000..cd34e886912c
--- /dev/null
+++ b/drivers/platform/x86/lenovo-wmi-events.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+/* Copyright (C) 2025 Derek J. Clark <derekjohn.clark@gmail.com> */
+
+#ifndef _LENOVO_WMI_EVENTS_H_
+#define _LENOVO_WMI_EVENTS_H_
+
+struct device;
+struct notifier_block;
+
+enum lwmi_events_type {
+	LWMI_EVENT_THERMAL_MODE = 1,
+};
+
+int lwmi_events_register_notifier(struct notifier_block *nb);
+int lwmi_events_unregister_notifier(struct notifier_block *nb);
+int devm_lwmi_events_register_notifier(struct device *dev,
+				       struct notifier_block *nb);
+
+#endif /* !_LENOVO_WMI_EVENTS_H_ */
-- 
2.49.0

