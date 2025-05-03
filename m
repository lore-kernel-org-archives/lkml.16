Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3B527456;
	Sat,  3 May 2025 00:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746230514; cv=none; b=MzxzPi9Reep9Z8KNO6lDxNrF+dNU+e3xWNfMxnxRLDtTxHMa4GQvDnjtGtS1/jaNV4SMWPNKruOGPUduLPCaEFLudvWZuuPtYhlBjU0vj6c39DKyc3Kx4OiYO5dElv3p3vHJ02oxSmDwtj8M0C7q3aC2MNkJrIt5heWgR7SdQ9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746230514; c=relaxed/simple;
	bh=8PWZbyJdibNXoPcQeYfz1yqDA5fAtwajI1jMjhTrPYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E7mtnBbHJCIJuwaYt/cbKDIpj34vBrX77/Ey4byTvj6Oa/vMHCr1gE59oh5igMZu2G3qXfDMyh5/dLjIU/p/QDcw/MCmteXKN7epEpyJT5QLt4GwKefRHYc70oSj1NBV/cnK0GTSBYKo/4yxkrxy+pBCTDf+o/31nw6CzCO+wLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gwf1TeOS; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gwf1TeOS"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7398d65476eso2224310b3a.1;
        Fri, 02 May 2025 17:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746230512; x=1746835312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HIAPKbG2KweKpaTjgQGk47y2o8PNhWDLuIW0dMTHzko=;
        b=Gwf1TeOSzk7dVkTnkHpL9FXU8sqktA3YpnEiUUNepBh3G7f5EqpjG02eFiBDSg8c9A
         zKavXldW1K9o0ARIzWaoN/9JiPR6JUIAo8K1aBWPJf0T8zrerPorgG47y3ZueLO5kdMW
         gknAbM7vOQBAQXmfxlCobhhLIF7AM7+UI5n8YPp0pWNlGYlxfwazyNw+IJ58TLe8lG2a
         6sphIFFTRMtzKjD3+i0uaearB44f0fCjMxStEgil45FIxIBZLtq0V6ReWRs3Lbmh7qiL
         mqYjRqwb+czVPYGP3dh0ZLOngue42+w4VxWw1IEGeuoVJF766t8q2NWeE1/jjV5WruR0
         J9iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746230512; x=1746835312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HIAPKbG2KweKpaTjgQGk47y2o8PNhWDLuIW0dMTHzko=;
        b=div/cqPJ3Q1lodUStgKtj8ZGPx7Z3xLpLGFOuYIEQcx+NOMdYRKZfSVe9eb/6yZ+m3
         y8I1JrGOp9XR9o4OWY67ASq88muIaNd34khrPY0Tl7knZZuch4zST8UhSP7FGG7bpajR
         P0sDl+vfZwLQ2opAabwF/YTTJS0sZI6u4I25hMDf7gHYAF+DS2SOSYFIa7rG1MYRsDuz
         qjyt9RZsGaypvUWXG+bcrTzz30KiwCuUOgdXdICuytqJ9hJGfmMZFT0IdCLmOviwGswU
         YeI1WZ0SXY1bwdGclPxjpHARsupXDyAcn0eH+3NGeK4Is1Gly7eWkbpJiuw97upiSDRn
         aHug==
X-Forwarded-Encrypted: i=1; AJvYcCVbLXbUUOWQGvqmtmnXcCWYc0FSEplRjoLSPgW+MwJyWZ5jDFu1rs1iMoSZm+AuD6VksLH2r/qv2l8=@vger.kernel.org, AJvYcCX6ETR5IXbFIriwJfdfzaj6t1BZY6OjiXSBIMZgjct6iIm5EkP7AfhFsJsq2DiNuc+2NxnCY7RyAMSc9QIk@vger.kernel.org, AJvYcCXzvSorDM00tepNRE/dU50LqDp4T7jd3mEvRiDygB5Yx8zlMxXAGluZFqcC5XHsSSvyj091YrVqpYL1xVCK8KNzJf6VVw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPblfXAFUmzoeNI3ZnXdjkVkSe31xt98spTSmufXy0D2uqF+3G
	tPO0gCj3g07xMXc+qSHJSbfMR6wbnVnd7YLZNk8qVaexaEJpPs00
X-Gm-Gg: ASbGnctXK52CNNrc4uN78mPQWGcnOLwL5gnKdJVnCGZtsJiLkI64hfWzq09FmOB3tJw
	IOo8eNk0z260RMw40wUO3F5sMKeGAzwhBOTSjBiqEeGHphQKDfd1lxOO1q7KU5JSrG1y8k6CGot
	CXuRJrTKdODfWpAPkkkKPq5h5PUzQ19jWvHY5T8oQwWQpxCn9hQ5yo2x85WwAeN/764oTK2aVFI
	ZLTvHAuj+VjZ8/9tW1QJCUrX7biZmiBEldIWDLqUWOg75fgtyQMdblNp8FFR+kL+eRycnGlkGxs
	i0XrzCChskU69qQ7a4slKuT8Vy1u/NqVmrH62CpcR9qexXvlsmAVQSyExXfLMCY8eCVayw44fiP
	6B4JoZ3NNb9+t/2LaLdGGWbycmkxap8bgi+FI5Pg=
X-Google-Smtp-Source: AGHT+IGFtpyYs2Fga+MYTX/LWLviFW3cM+AqPNHfrRH7gGTtObajIa1vG3GfaCDGatNZ0DDctAL6KQ==
X-Received: by 2002:a05:6a00:1902:b0:736:aea8:c9b7 with SMTP id d2e1a72fcca58-74049171694mr14388252b3a.2.1746230512095;
        Fri, 02 May 2025 17:01:52 -0700 (PDT)
Received: from localhost.localdomain (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058dbb0b5sm2206680b3a.41.2025.05.02.17.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 17:01:51 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH v7 3/6] platform/x86: Add Lenovo WMI Events Driver
Date: Fri,  2 May 2025 17:01:39 -0700
Message-ID: <20250503000142.1190354-4-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250503000142.1190354-1-derekjohn.clark@gmail.com>
References: <20250503000142.1190354-1-derekjohn.clark@gmail.com>
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
---
v7:
 - Fix typos
v6:
 - Fix typos and rewordings to ensure consistancy in function description
   text.
v5:
 - Fixes from v4 review.
v4:
  - Remove the Thermal Mode Event GUID from Gamezone and add this driver.
Suggested-by: Armin Wolf <W_Armin@gmx.de>
Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
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

