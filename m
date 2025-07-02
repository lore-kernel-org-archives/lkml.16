Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F681E1A3F;
	Wed,  2 Jul 2025 03:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751427519; cv=none; b=DpDalSSP/b37+7C+jPw9SJDwTgRS50LNlFzlRSMnmUbDwJkwSM2PJZh+ICxCsR6JsiPGaCThScB3+6iQvi9tXtNnwtt+o6AChkGRX2ViNKU/fJ8Hi/yufNU8maxKrN2OXU4/1Y1bBlGg/dTULiH4ADjSOqEjo/XAUsz4SJm3FWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751427519; c=relaxed/simple;
	bh=63UON5GugYnD9F7uv9G3HzmUPI0ms53w9qGWfOkbheg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MLmqBpmFPJ0Z+F4BPWRJvnqWDLhOGTvqX8I0kFrUDcPZTJvn7cF/WRPpYtYEod2IMc7Aa54svn88SGPGyCnZPwkkbMY1LIy6l16jHxu3U41mV1yFzDlmD47F9QnDGRFwb2CneSNTTnD3DGLkjGdRkKuF+ukk3a7yC/uG3DFOBHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VLuxGrzv; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VLuxGrzv"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b34c068faf8so6793486a12.2;
        Tue, 01 Jul 2025 20:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751427517; x=1752032317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2oGoFKImDQInj564O85YMs7uWiNJR0eE35Kph48sqUI=;
        b=VLuxGrzvA0RSP1GXh0r/QwpeFMLTcyPUnWBNMXg9EfGLhm2HEQ78DGV19qeN7Hm6I/
         CChnR99sGTDEej691v6+NZP3uM3u3JRf3OEw1YW9SqgKfabhM9/aCf95Y9WuX8NzxIsl
         2e86lPuPIgHDGQvoI6hAs9NW/liODkjXyiswnuygesMii+VH12HfDF6+T94bsiBVoq4U
         7q3rFtb84gorHbjy9inffnE59cpJUZYOarnghI1ykOnssZBVbJGT0FznaBA5UqQmmmXo
         La8UG4LyTa321Rr+cg0/7llgFh+jGFopDZ2yxFvhr1//74eP5yDssTrnUNEnSo4sTksW
         mr0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751427517; x=1752032317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2oGoFKImDQInj564O85YMs7uWiNJR0eE35Kph48sqUI=;
        b=uH59Ye1PnfL8C8eIfoufaCDfe7i1O7IEO5JGJFsP6SLkK4nEovIxICUpX+pQsGXxks
         VrclkyGssxK2sDTlwZuQl9t7Bmf4sFzJ2bel+62nwVEoZ+1N1+hdug8ecI0ZWRcneQX6
         6b1z0f2VhJnZB/32bG4nwHs/Bdw17KPyiLWN1N7V45fk3a6Y4VgroVwshcECsSDfbHO6
         ONTp65cA7iuBRsLvvrnGK06oea/MlEaHZPPhhcHDHEsnWqOSMPl4PlB+Hsa05hRlCsm1
         QajugbUqOitRWx1O4bYoqfFz2t5r7CDEPZY/bM0vgVXNTL6InNPIr63q7c9tFmCkhly6
         Eq3A==
X-Forwarded-Encrypted: i=1; AJvYcCUTbmNH4Rk3YXIJEL5FQT9cATklqhlGpA98RE7pPg1IY2pEYXeiQ791kHQ3DuCZUueQdQknvfJeTduPCI1I2kNi0FXceA==@vger.kernel.org, AJvYcCVP/ZA49kIarAj2L8UkEMPs2/DPDUz9i0lH/k8zm4L32kCSfG8kZCXwv+0zGltnv0fXKbukqPppTtS7hCjl@vger.kernel.org, AJvYcCWuvSPhCJ2+Diw6zp7uM4d/VYEP/kFQNRq7ffCYVB5gy0xKDcam1XZtHUpiLNJpQ9qHVO+/99I5NVc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxfivs/fVyKb1eumGLT6+Wf2K7LLT/N6AmrLXJhWLBN+PvDXcqz
	cphQcM6XWqvUGuObO2Qr/G+cE+cK6RNOyX8bBG9SuEv5qa4Q4WraqHHO
X-Gm-Gg: ASbGncu87fMLdlSLF1mROBJ5jTKeCp2+Tq/k4F82kynMGG/W1aUZydByyjyzdqqwv3n
	xIy2cu06gMgNIYq4yWrbGsM3z6IwuYX5Ffx1rvWp0f7l3uwaSyuTLg5ihmYdpzNsXJq0x44ZlPd
	uKsfsM8deXscGlrjqQu/hh/nFQVn0qOVBc3E6L2SO6p36pNkmAx0aIx0hje8PfocHAUPoRsNbzX
	rt26L/WFHeKMFVZmbFHcy5eWUBIHMz2S910Y6mJ52q7plfEl/CY8A8Nyc+gwySNtnxDVzYoqqdn
	l1NVwUvQG/WjRxLdmKIyUFZL9iS9AoxyLIfsomp4NEFV4wwN70UKZp0JxWR9s5fwcyk7sFWNqeb
	4oJ6qLdEOGdluwCqT9j/UCDchJHZrKnaXuExHRlmxvnkPODLsFXpX
X-Google-Smtp-Source: AGHT+IG1yzpagLY74dilDv7Hf7tH64Cu9QFNDcbolbKAf/QwzdnPMC6IcRvUG/5L1j0Ga7Zq5kd/kw==
X-Received: by 2002:a05:6a21:2d8a:b0:222:d71e:d35f with SMTP id adf61e73a8af0-222d7e856damr2735564637.21.1751427517347;
        Tue, 01 Jul 2025 20:38:37 -0700 (PDT)
Received: from bliptop (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e301d64fsm11783008a12.19.2025.07.01.20.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 20:38:37 -0700 (PDT)
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
Subject: [PATCH v13 3/6] platform/x86: Add Lenovo WMI Events Driver
Date: Tue,  1 Jul 2025 20:38:23 -0700
Message-ID: <20250702033826.1057762-4-derekjohn.clark@gmail.com>
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
v13:
 - Move to new lenovo folder
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
---
 drivers/platform/x86/lenovo/Kconfig      |   4 +
 drivers/platform/x86/lenovo/Makefile     |   1 +
 drivers/platform/x86/lenovo/wmi-events.c | 196 +++++++++++++++++++++++
 drivers/platform/x86/lenovo/wmi-events.h |  20 +++
 4 files changed, 221 insertions(+)
 create mode 100644 drivers/platform/x86/lenovo/wmi-events.c
 create mode 100644 drivers/platform/x86/lenovo/wmi-events.h

diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x86/lenovo/Kconfig
index abb488889834..95dce00f257e 100644
--- a/drivers/platform/x86/lenovo/Kconfig
+++ b/drivers/platform/x86/lenovo/Kconfig
@@ -233,6 +233,10 @@ config YT2_1380
 	  To compile this driver as a module, choose M here: the module will
 	  be called lenovo-yogabook.
 
+config LENOVO_WMI_EVENTS
+	tristate
+	depends on ACPI_WMI
+
 config LENOVO_WMI_HELPERS
 	tristate
 	depends on ACPI_WMI
diff --git a/drivers/platform/x86/lenovo/Makefile b/drivers/platform/x86/lenovo/Makefile
index a347d657d235..814c4ba9bdbe 100644
--- a/drivers/platform/x86/lenovo/Makefile
+++ b/drivers/platform/x86/lenovo/Makefile
@@ -12,6 +12,7 @@ lenovo-target-$(CONFIG_LENOVO_YMC)	+= ymc.o
 lenovo-target-$(CONFIG_YOGABOOK)	+= yogabook.o
 lenovo-target-$(CONFIG_YT2_1380)	+= yoga-tab2-pro-1380-fastcharger.o
 lenovo-target-$(CONFIG_LENOVO_WMI_CAMERA)	+= wmi-camera.o
+lenovo-target-$(CONFIG_LENOVO_WMI_EVENTS)	+= wmi-events.o
 lenovo-target-$(CONFIG_LENOVO_WMI_HELPERS)	+= wmi-helpers.o
 
 # Add 'lenovo' prefix to each module listed in lenovo-target-*
diff --git a/drivers/platform/x86/lenovo/wmi-events.c b/drivers/platform/x86/lenovo/wmi-events.c
new file mode 100644
index 000000000000..0994cd7dd504
--- /dev/null
+++ b/drivers/platform/x86/lenovo/wmi-events.c
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
+#include "wmi-events.h"
+#include "wmi-gamezone.h"
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
diff --git a/drivers/platform/x86/lenovo/wmi-events.h b/drivers/platform/x86/lenovo/wmi-events.h
new file mode 100644
index 000000000000..cd34e886912c
--- /dev/null
+++ b/drivers/platform/x86/lenovo/wmi-events.h
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
2.50.0

