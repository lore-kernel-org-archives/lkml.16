Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F1525D902;
	Thu, 15 May 2025 18:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747333372; cv=none; b=TQo+ztlDNJYLhRMoeoYLXPGOyrUBgqA05NLh8DHPcEt7qrAdm2MHG3pIaRpQR6HEN8SrK1cnjUPeUyMAF4MuLHEHI3INqvO0ZeE0dGiCfwRIwk2yFnFye7UUGTdF0GMrHmXkrdM2/nTU6Bfe3hlHPCCpWbT6JxJQ3r4KEK/f+5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747333372; c=relaxed/simple;
	bh=w64cUplTGlSMfoowHr4EI6FF4JJVsBgz+pefDd5tNJs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uo9Y0i/eqNUH6hF48gd/CjtghC99ArHlTW3H2vDHbRp5UZFbAZkvkQW2oZJfXCbdyg9FUcw9oad1nkdv7ioHgbTwg6bCa0nh7xGolhirikD822mxE0QbIbDIVNuud30kzQLf9+pr7MpzkNAm9jt9ZmCDHyvo7YQM5sEayQf9fWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H1VC1NMS; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H1VC1NMS"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-22e331215dbso18066065ad.1;
        Thu, 15 May 2025 11:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747333369; x=1747938169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bVSbppLtIp5lac6LYr/+h21HSHcShV89QDbXsrjAMpE=;
        b=H1VC1NMSWtLXLOrJ+ANxX1vE0Wpy9XEBjep0xRJKCW7CqwmQFu4fo3EdbxhU8D+AdM
         2FSALgoMx9rWOB0pe9kyoP4+Wsq1J/J0GM67ZXhJprDvKuMhCAsKAb2L3xdbmHeca2PS
         SgssaxKSY0BzP66k3sjI0zIVzg/zxG9Meh559yUz/V+BWGPwGVkBy9QQ1731ZXtaHIro
         lp+HlcS9aFV8dxnLnuPD/SrSo4yZJ9YrC2U/THpNQh7aFJXiI0Gm6miAHrUyBehss1lF
         ymge+vhL1sWqgfj9Z1FUMEFhRnowIo+Lf8OIavvKm9TVTAQqXEC5Iiaa/Ucq/6bSHQzX
         8tEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747333369; x=1747938169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bVSbppLtIp5lac6LYr/+h21HSHcShV89QDbXsrjAMpE=;
        b=YuGB5VCzkaOWULuHGSscWW/0W/VctSxUFiCjRfREUv0jKwUK3qOMCqBB8yMoOEA8V7
         8YxLnLbZCg892J8uuih9JCkkIsRXWt9Sib2EXDoWBrQ9sxQMY1H+ctisQBVONMiqbQQN
         Q+pR2ENQnIbwyhgmG/9gxbZHo09W7PXRuvtJMiQ8RWG4hlN/mdylooBpIGkOl8jnAB8E
         MEwTZlUQjbV9OHF9yOZL2NBX+q4SwYDwNeJx4UfvsGJ2sXiZXq87/epaxgOxqpm+bDUe
         imyJBbLGHcd/eZX8EFOAe+xdVnuMZq4pRgHlkUCzxaEgigFqYSCkvClSCVHbiIbA/Jij
         7Ocg==
X-Forwarded-Encrypted: i=1; AJvYcCVnZVMxWaTykhohZ95mDsszIaUQ1kw1p8wlWuypEHXZJGaekJkhj8A0Y6aZh6gHYOPN8qlj2lrP6j0=@vger.kernel.org, AJvYcCWMZfihUNdDUr50klOz/yf5EqxMsl02vIIMQVwNkmOoFfZqVFPgMIz/f9N8IEkXg3lyQlpHNr4s8zyPbxNpq60wqU9eiA==@vger.kernel.org, AJvYcCWpr/Oyf+n4oDp79piqo3o5lAT2g+zkwl5wL4elLM38dGXxdHRlAbiZvH0hovsjztrhF9X72TQ0Z3dGOQ1S@vger.kernel.org
X-Gm-Message-State: AOJu0YybFhLkCuOE+tct128xNdmxpCO2dsEcJ84p/bbmEZyp0mBLT3sd
	yiBVA73+kxDMojY9Hdm8MN6iGb6bphWqPErJ3DYLnSFO6S8EKF76W42O
X-Gm-Gg: ASbGncufu+qotEsf/Nrvqb46b4MvffWAaSwv1wY4moAmtILkjBxhMJHww35YXWJCcV5
	g7MIwzVmZv9aXythzHNxUBfLYIlr7Jqxkqa9SHXHiBfSvX2npWw42pccc0S/lP6PbZsDw3hMuq+
	wQ8OQDiZ9NgtOjrcM89js+jLvGwbRULuv1DaZnrcbhso0P67cMae5DU3ps18nsCTVSM6MccWap0
	BNVCWSuJS6DiySn6L4517dOw6I+AStfd4m2eQBzFOlhANjo7oXHgkLNviHKSe59xGeGiuRTe2FK
	z+Jj0vZNf/JnxXX6GYWxViW4tE2INdXaR3eGlpisc3rf//RRFin0UBHT7sszB1iSNka5o81f2Cv
	sYXCCGM5bTLTrBsxBVRSLBjT35dKBg4a8g9COzTMrFfv8gXgs1A==
X-Google-Smtp-Source: AGHT+IEPgYpk4dy7hTU1WsNZ0bplpebWCv7NNjkqnojtA261tVybgnPIGxOP/4dePdTPwYT1u72nuQ==
X-Received: by 2002:a17:903:3d10:b0:22e:23c1:d711 with SMTP id d9443c01a7336-231d4e5087cmr4214405ad.16.1747333369482;
        Thu, 15 May 2025 11:22:49 -0700 (PDT)
Received: from localhost.localdomain (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e978adsm826955ad.119.2025.05.15.11.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 11:22:49 -0700 (PDT)
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
	Alok Tiwari <alok.a.tiwari@oracle.com>,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH v10 3/6] platform/x86: Add Lenovo WMI Events Driver
Date: Thu, 15 May 2025 11:22:21 -0700
Message-ID: <20250515182224.8277-4-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515182224.8277-1-derekjohn.clark@gmail.com>
References: <20250515182224.8277-1-derekjohn.clark@gmail.com>
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
index aab59a777693..2b4b06e81192 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13164,6 +13164,7 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	Documentation/wmi/devices/lenovo-wmi-gamezone.rst
 F:	Documentation/wmi/devices/lenovo-wmi-other.rst
+F:	drivers/platform/x86/lenovo-wmi-events.*
 F:	drivers/platform/x86/lenovo-wmi-helpers.*
 
 LENOVO WMI HOTKEY UTILITIES DRIVER
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index bece1ba61417..13b8f4ac5dc5 100644
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
index 5a9f4e94f78b..fc039839286a 100644
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
index 000000000000..51ebdebac340
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
+
+	dev_set_drvdata(&wdev->dev, priv);
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

