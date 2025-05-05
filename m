Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125AD190692;
	Mon,  5 May 2025 01:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746407230; cv=none; b=hFJZmzzv3Bf6K+4YJ1waLRVf7y8vR6JJDJUJQpx4ytBF7E2C3nEW4nQwJ5H+YuvjBUdYoLoR/syb+qlrm6rrztxk0BoTRuq6ba0perdIvs74ItF5HkbaV+q0JMQsz9cSdaxgKcnunkEZdHDdp1d3NcSW/4ili6MKw3sqf4cudGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746407230; c=relaxed/simple;
	bh=Pvxq/FRGxUwyOM3QMRL9CNuVfOPfvb+fFmfSE6Uh7R4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VKSq7MSCb72B3N3JHKJ1Jqyj0aoqvSTq3cpE0kdDfb2vqmKyb2NgukaE8SnXfquad0rkPlFc0nS5k/lPgCcTgGZUruHWNkwu9wxGwhyKeNG3fPS+T5C24qrU+0RSAx5vKEIKGhh5UbhQimY2Bt2FCiEoE+oewIOafccl6kIvUTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=favWVcjx; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="favWVcjx"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-301cda78d48so5123379a91.0;
        Sun, 04 May 2025 18:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746407228; x=1747012028; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9CNeo+1y8HgUu0JvZ5x0mWvcrZdU+4utoV5hj3GZZzo=;
        b=favWVcjxtjWar+HDCos5g4ZY9LqlscXS8FN6p+3aEiQ+QtIegmqOcai3tndz5bMtyL
         TfRoCsMu4JrBElL/XCX96qyveBXSwCt4tx9pwIsRm24A/RGGFNmBSxJjXLo9IDWjTuCV
         yxuOm8WF+KcjRg6aOiapJ0ouOMyVr8919cw5U5TlIRWWIiJn5vM7ExBAAubICUPKSUrf
         UWg5Nqqjl5lU4qWar6d4Fka1nYCsRKKxFjAPXUSNL8VAdk43OXNaPLUe6970hzuwbUs+
         P3n5Sxhp/cabe0oGWGj2KqLyLwyl25beaGQTc6iVQiwQyUkUoUiTAI1I2BCihtoDZKeo
         tiMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746407228; x=1747012028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9CNeo+1y8HgUu0JvZ5x0mWvcrZdU+4utoV5hj3GZZzo=;
        b=M/XTA8ZyPVguUKUJqma3Kaa0XG51acfv8aHmu7YkyWUTuRsnmbOHYkiRfH7jt9jDWU
         AtI0NcGTpO/yr8R/Ga3tSDjfRfpH336ERj55fRsBCKrbFdnvgHLCiFLkgsZDm5Wi8fb7
         7tNye1y9fuwVMHiPCrU6aTO6T0yUnhe1HDewOiwFpJHnNAgAHSydGnlHyEv4DQeXLgc3
         E6w0zeO3qOKhA5JcsCalVBAgBXjd6mjmE477NtX9xsFGLp4AKRyv/jiluHecZuF9936Q
         KlCQkTPtYM53eoVlrP8FnE/C5ldVhCVb5olffd+EUXf4s45GngC3mF0/jzvHHYjjic5f
         ywKw==
X-Forwarded-Encrypted: i=1; AJvYcCUUgO3mWLnEl0GAf1DhmiwCJHaz8UufgYCNBW26Efpg0Y7XxJJ9B6uMMSvQTwCfGOMIJFFd2Zye4/E=@vger.kernel.org, AJvYcCVr9MRQz7Lt+soqzXt4NopJcBZ/L/TdwU3aGDzDwQFbq9aRJYxNz2IHl2+YjQT6mzCIrL/bZZIMWIP/kLaV@vger.kernel.org, AJvYcCWIDNhZRz912ThpDfV6SrAlt2bOkcxnDXiV7h+gXIb1X/mBu77Xdansusyx1PMRfal9i/CFPr42r2rcrWSbnZBLY2D/GA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTTRBVWTul9U4Z9vicOX9Hr9s3qsfDsPXfgXeNXDlPTpOEWB3F
	4ufUXZR+nqHlLs14VRWIZkhy21zOAYsMixnTxWhMwqUMB1WBVcz1oNVplhAp6cQ=
X-Gm-Gg: ASbGnctlIsBQ6w97FLD8zWAwraBQxiFR7KwHVt/C6zmsRdy+s9T1YJkuvu76ytoKAwX
	32UF3QTSfRsgFkEi0xPebtjj2YV7kSyje71qUTMt/2Xu4h2MOmviV6FJHERLi1nMx3k3dJKpEI0
	AncZozHQViixH+O+AGSA+9EYIcbGx66sUjPXFp3QihqTTx/wrB1u5nVXRtMbjUjTYclFZvFf3gQ
	Vuhiqw2tCPeOJzN5MDWSB40FgDQG6RL4yuBPYOZWYKFPbYBVFTOY89IRzLYSdzEFDUrtbWyddkh
	OBgIT79iLN2SARgdJEMAhX/BSfgMB7XFnRmCrb5SiUu/p9uhKGkM16lhN8vPLxVwWMDCDNb4Jli
	Z3Cn6Gx98Rh6iNBeEKZjxdyWcMrkKsAVg5v9j/Fc=
X-Google-Smtp-Source: AGHT+IEPICVMpy4IsZpbw10Mno1g9hHWLtKcibKUWbvzavxOSQyQNvL7S1v0FxTFnSA6prTXloDGpQ==
X-Received: by 2002:a17:90b:58e5:b0:2ee:fa0c:cebc with SMTP id 98e67ed59e1d1-30a619ac8c0mr8209689a91.20.1746407228025;
        Sun, 04 May 2025 18:07:08 -0700 (PDT)
Received: from localhost.localdomain (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a34721015sm10194650a91.6.2025.05.04.18.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 18:07:07 -0700 (PDT)
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
Subject: [PATCH v8 3/6] platform/x86: Add Lenovo WMI Events Driver
Date: Sun,  4 May 2025 18:06:56 -0700
Message-ID: <20250505010659.1450984-4-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250505010659.1450984-1-derekjohn.clark@gmail.com>
References: <20250505010659.1450984-1-derekjohn.clark@gmail.com>
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

