Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C64B1482F5;
	Mon, 28 Apr 2025 01:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745803244; cv=none; b=Q1HAzsF/j9aoDihthk5UA7UGHebiOo6PCBJKyjvR1QsJaqZqgw4tpFm5TSDGsgpQSt3I6ZBEqQ97tp5kWA/bTsJ0Bi2UmaL1+scR+5E7qWtGGK6+PR2WNwgoHorNoKP+p/R0dAajBv4TfjFCuYM10zSVywPaBfS8rvYLeIFpviQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745803244; c=relaxed/simple;
	bh=i8pbW3PSB9LYdZSd2l7336/pIvwNS6j6GhChZ68OdDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VNVqO7V41X7jnLi3XovBRqGRPhCM9+0cRUjPYJ+xoFEI266crU2HOuup9qdtajRCO1LZ1zoWqm0LkE43ROg/H8L+be30yRnhtnnAvFLfUZTSVHN1ow1jXJ3cDMnn7ASl1PaVmEj92qrtrEeRL1zhMlho0fPHIpdm5Ijt8bhdkSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gOgTn2Pv; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gOgTn2Pv"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-224171d6826so64623395ad.3;
        Sun, 27 Apr 2025 18:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745803242; x=1746408042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=weFFmbWb9x3xnDTN+uMlNy66V1VxjIAndS86MqxBt/k=;
        b=gOgTn2PvxqpdayfbaX3gyYJBv+dw649hwyO/a/GBcAJu/p9XghL0ZWK0cVvdDS5k38
         i/qePIFJLJRK/IKXF59Nq48GJzmFQlD9ek+2quFn0slyxlD3ZvAQH+jZ+te9IIc3RaUn
         5m+lwad318clDUS+AE7Z0RYJSoWzbrURx9tpWy8fuAAKgtHk5ncjw85HFyP52+wh98Yf
         TH0WgUt+a4pbOs2PSdPNkrCXdaJaL9qEIoDU2FXKWBBEPUoNmuw3xp9/sx7Yjhx+2t2S
         ssGnwRQzACpQkL6xwp9OKjupgQbdCPIej6KyTh0nlArdRzVjqMw6a85RGMpbILG0xilt
         RjJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745803242; x=1746408042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=weFFmbWb9x3xnDTN+uMlNy66V1VxjIAndS86MqxBt/k=;
        b=pxu+pOExylEfr0UA62BWQ1kc5FF8RbM6Xx1yeP2auVNoAym/Kh1oTR6i5Cd2XtSXmd
         H/MPcM7vBXFcMypq9BC6YHdcjvLkOKbuqtBeLeKc1OB6X+SzrWEiOwIZgea/s8O+PvT5
         l9RsCiin2UkuXw2Qvlau72vtfGG8B/3GsWvNDkhck8OFmi3mvdfIJASORhhExvHzMGM0
         QGM5UPQMq0hIuuH95MlQfmSYfdiNP6icuy03NzQOgLUyawimPSN4hMloBNH8AB7E//i3
         W78qGWTG46Dz83GUTvTZJt4Ig7jUxL1Ubs5TC6ob9q0P2HNruG3gdw4axs3FW63SC194
         e6EA==
X-Forwarded-Encrypted: i=1; AJvYcCUiK/IYQWhZyr6e28bB/evrUluwtkxy1dFJR6soHD5ZzJ88qYNNJDjvVbyWbHPnHoqjp/bP90KdjRM=@vger.kernel.org, AJvYcCWP60aO3Qw1FQMN9S4TgWBYlWxJha3yTwTUbKPp8iCqYVipZgGGcu0NS0zxM30wJfzlpRF+2+RU2fNdLZso@vger.kernel.org, AJvYcCX8ArgG1Uh0wWsbbsEHCzE9mSCSzhfHX2uAV0/1ryTjqxCAJSPgtjCui6xbM9XHtR8YMUG+v8/0EaGlt8aKSocAqyGdYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpUfUWVtnR9lWjEhyeCKfqUK7M5Gbkx5WAIxSK+cLPtmhhM2rI
	Lfo/H4zxA/dh5iMuWWIxvtkdjGNYH/EgY/bvA+lBBTG9f/1TU/YI
X-Gm-Gg: ASbGncuGGEU8LdugH0sVxqV/kp1MScOrTogYJAGQl3kSER3OPIazYFyQfV+VwjQc1mk
	TxI8uAPwJQkFUwqQAyGEWWEekf+EW8cGl22LUCWX5yAtJVhuJgiBcL1JiEmfjuxRLVJ4dRxPCMC
	pnYpjTSgTWHwD8hJxosV4vuFWSkYciWa52IqQLSh7xEjEFcKWQmL70WA/hp9lhFd/w4IlgpApbm
	pRQ2F1YfLKvSx4x2IDQ/5jE4BDY5zymBm74SL3aRx16uEkM55L0745Poi8u1EGQ38keWo/TUnjL
	YBGBO4TzVNZ+86zdIajMU/C3+EvK0y5Q3wiahkWYpefd8Z+7eubZdsThg9EdeSaWVpj6xkQrWHe
	qtVvM8Nr3Rh14Vx14Ex8GWTnnAJLGn+tj3/Asw87IUtn4bU0LYg==
X-Google-Smtp-Source: AGHT+IFDJXrNdw+LGtYQH0247wviCMRVotpSwsAQ433VTGKGePVeub4pyX55ArV7J1ojlg4b0a0zLA==
X-Received: by 2002:a17:903:1209:b0:21f:7e12:5642 with SMTP id d9443c01a7336-22dc6a04770mr91556655ad.18.1745803242217;
        Sun, 27 Apr 2025 18:20:42 -0700 (PDT)
Received: from localhost.localdomain (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5216ba5sm70334725ad.222.2025.04.27.18.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 18:20:41 -0700 (PDT)
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
Subject: [PATCH v6 3/6] platform/x86: Add Lenovo WMI Events Driver
Date: Sun, 27 Apr 2025 18:18:03 -0700
Message-ID: <20250428012029.970017-4-derekjohn.clark@gmail.com>
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

Adds lenovo-wmi-events driver. The events driver is designed as a
general entrypoint for all Lenovo WMI Events. It acts as a notification
chain head that will process event data and pass it on to registered
drivers so they can react to the events.

Currently only the Gamezone interface Thermal Mode Event GUID is
implemented in this driver. It is documented in the Gamezone
documentation.

Suggested-by: Armin Wolf <W_Armin@gmx.de>
Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
v6:
 - Fix typos and rewordings to ensure consistancy in function description
   text.
v5:
 - Fixes from v4 review.
v4:
  - Remove the Thermal Mode Event GUID from Gamezone and add this driver.
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
index 000000000000..78bcb68b5bc4
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
+ * Copyright(C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
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
+ * lenovo-wmi-events driver blocking notifer chain.
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
+ * @nb: The notifier_block struct to register
+ *
+ * Call blocking_notifier_chain_unregister to unregister the notifier block
+ * from the lenovo-wmi-events driver blocking notifer chain.
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
+ * @data: Void pointer to the notifier_block struct to register.
+ *
+ * Call lwmi_events_unregister_notifier to unregister the notifier block from
+ * the lenovo-wmi-events driver blocking notifer chain.
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
+ * lenovo-wmi-events driver blocking notifer chain. Then add, as a device
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
+	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	if (!context)
+		return -EINVAL;
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
index 000000000000..e4c5459c2f24
--- /dev/null
+++ b/drivers/platform/x86/lenovo-wmi-events.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+/* Copyright(C) 2025 Derek J. Clark <derekjohn.clark@gmail.com> */
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

