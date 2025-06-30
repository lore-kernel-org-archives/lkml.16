Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824C528C5CC
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 14:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751292781; cv=none; b=cbJvUsDh42JW/p4As3V0EHFXXKlDh4Ew07jgmKt8mb4hRQvPNxfyQ6tUeoJxGVpgGBLhGApENlWY2hle4uRdQBv4MY796NXTgGEmTuaKJIKh3Mdqxxhdd2WEcx2VNGRLUwrfgJ78xk+/RXy4mfD4/7DWolACJrRWvbuUdiQd6GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751292781; c=relaxed/simple;
	bh=fbFWhcTlNTRdWyl21dI+mXVR7oyksRyANGkxIYDmUH4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PjWsP1uox2Uu6JulIpRLeDswJz5kVsw7YAG9br0BmHucNbfk80XRQjYZdtdI572HdWYFmKsa9MH5lG+82jiUFBVJ29GKdkCFnx2X+ha6XPv2l3613d/bfT3fa3ZjhTnlaE4TfFPJ7asPhWX1NQ6+UhzJR3PPQHYM/AZLwJmqSec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Nw6qpG6H; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Nw6qpG6H"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-607cf70b00aso9145229a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 07:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751292778; x=1751897578; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zsuVofM4iWQWBL1t5ktFAF3YZKmCFx1yd4aN3Oe9hqM=;
        b=Nw6qpG6H0m0w36R2VyUFp1rMCvoZbXPQpzoXfb0hP2DOLOmRTAi5JQEdefIJZ2cKGK
         76rqvPd9068PomcY4r8yvNhMXGqL12Wa+U9dk7tI5f/WdK1EsQzrLHaRs9BFL2D/I0k5
         P5aa0F7M3dzZ2OENhfDwQiiOWV8SkV4BDi4j0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751292778; x=1751897578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zsuVofM4iWQWBL1t5ktFAF3YZKmCFx1yd4aN3Oe9hqM=;
        b=oD6B7V7ubuya6hORDseAeIFT3BAd6wmaT/pnWFts2gFwlARETIHCZnVSZhieFeV51d
         RSmEEqsO8eC1Rxut3YvyHthtgPhzcsSDw2NLMSpxgQL53L2PerTNZJklax1EZHPVcdZ2
         F3jRj0AKrTlXMhSqeQc6dEfyMSOtUjMf+/41zMmM4Mua7d8wRrf9Mhbr+vyuY03HmDn7
         UGikMwZm7kvnokM39xaDBMUPjt8ZcWW6h7UmLcm5Wfzag5EM26HnQGUdynqOy1I/VzKV
         wZQT21HQgK7Gqnria1bkVJ0IqGjaWbRYzwK+G4bfhRM8U7FIAmtZNod2jTOCbNqFuZLg
         7KhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUw8nWHMMIR5YhN2FRLEUVU6VsSgVGNshdAJDfokAWqHZVoBW3nM7ai23TCRi/3zFEHM4KaH+amNKK3ANo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzX1nOnjtk0Da7O7l8+szAfclMyY4vcd/vC+CRPd2Qt19LC2wsR
	9boxiQC3OE5jv5HiI0IgGPPrkObTeClSgXjRK8sKx7OabT5+egxdce7IudBKOmUhzA==
X-Gm-Gg: ASbGncsfORpxZRFeArp6eaZJ/RbNiUWGTudgWmWX1mNcqO5pfpXnODTX6pwdEvx/7Xx
	wzRCmxt1Pb11ZnQygtd5wCTrGzKmUHD83Nu09YP8JdC9Sxv3XzMLNu8wDJQvfu2CkbpCZZYrtOm
	M+dXMKcTJioAYMxS5eje8UT1Im3eagAkyawQAP7t1ViBlQPANH6WIH/nLPr5veLusfsVO6gDXvP
	rSc2t4vHGoe6omVgrLD8v/9Sa+BoS0hDN7Mr6V7usaUneHkuiCc3CpF1ruyR1m3i8ZgXRvpZCGA
	fsaUG6zl4/mbXcuHahbT65dlEnPdVCrt6HjEWoI0DjzIRWUH3oS3pey+YO/e0vvNVkDz405sqXE
	66xDI4ZzzIlQ1scqCVB9Bm8Wu1JMlTDPANv+04a6pZ9lx6aUT/YX6
X-Google-Smtp-Source: AGHT+IFng48vS8GwHtMSOPA8+nACXUmszhIUqjqoOz2PD+r5leUDPaXGLvaPuVpVb/IEbJD9uKO2Ow==
X-Received: by 2002:a17:907:e885:b0:ade:4121:8d52 with SMTP id a640c23a62f3a-ae34fd6c415mr1272248866b.16.1751292777693;
        Mon, 30 Jun 2025 07:12:57 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (72.144.91.34.bc.googleusercontent.com. [34.91.144.72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b416sm670643866b.28.2025.06.30.07.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 07:12:56 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v2 04/10] usb: typec: Expose mode priorities via sysfs
Date: Mon, 30 Jun 2025 14:12:33 +0000
Message-ID: <20250630141239.3174390-5-akuchynski@chromium.org>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
In-Reply-To: <20250630141239.3174390-1-akuchynski@chromium.org>
References: <20250630141239.3174390-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This sysfs attribute specifies the preferred order for enabling
DisplayPort, Thunderbolt alternate modes, and USB4 mode.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 Documentation/ABI/testing/sysfs-class-typec |  16 +++
 drivers/usb/typec/Makefile                  |   2 +-
 drivers/usb/typec/class.c                   |  28 ++++-
 drivers/usb/typec/class.h                   |   4 +
 drivers/usb/typec/mode_selection.c          | 116 ++++++++++++++++++++
 drivers/usb/typec/mode_selection.h          |  19 ++++
 include/linux/usb/typec_altmode.h           |   7 ++
 7 files changed, 190 insertions(+), 2 deletions(-)
 create mode 100644 drivers/usb/typec/mode_selection.c
 create mode 100644 drivers/usb/typec/mode_selection.h

diff --git a/Documentation/ABI/testing/sysfs-class-typec b/Documentation/ABI/testing/sysfs-class-typec
index 38e101c17a00..ff3296ee8e1c 100644
--- a/Documentation/ABI/testing/sysfs-class-typec
+++ b/Documentation/ABI/testing/sysfs-class-typec
@@ -162,6 +162,22 @@ Description:	Lists the supported USB Modes. The default USB mode that is used
 		- usb3 (USB 3.2)
 		- usb4 (USB4)
 
+What:		/sys/class/typec/<port>/mode_priorities
+Date:		June 2025
+Contact:	Andrei Kuchynski <akuchynski@chromium.org>
+Description:	Lists the modes supported by the port, ordered by their
+		activation priority. It defines the preferred sequence for activating
+		modes such as Displayport alt-mode, Thunderbolt alt-mode and USB4 mode.
+		The default order can be modified by writing a new sequence to this
+		attribute. Any modes omitted from a user-provided list will be
+		automatically placed at the end of the list.
+
+		Example values:
+		- "USB4 TBT DP": default priority order
+		- "USB4 DP TBT": modified priority order after writing "USB4 DP TBT" or
+			"USB4 DP"
+		- "DP": the port only supports Displayport alt-mode
+
 USB Type-C partner devices (eg. /sys/class/typec/port0-partner/)
 
 What:		/sys/class/typec/<port>-partner/accessory_mode
diff --git a/drivers/usb/typec/Makefile b/drivers/usb/typec/Makefile
index 7a368fea61bc..8a6a1c663eb6 100644
--- a/drivers/usb/typec/Makefile
+++ b/drivers/usb/typec/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_TYPEC)		+= typec.o
-typec-y				:= class.o mux.o bus.o pd.o retimer.o
+typec-y				:= class.o mux.o bus.o pd.o retimer.o mode_selection.o
 typec-$(CONFIG_ACPI)		+= port-mapper.o
 obj-$(CONFIG_TYPEC)		+= altmodes/
 obj-$(CONFIG_TYPEC_TCPM)	+= tcpm/
diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index a72325ff099a..93eadbcdd4c0 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -19,6 +19,7 @@
 #include "bus.h"
 #include "class.h"
 #include "pd.h"
+#include "mode_selection.h"
 
 static DEFINE_IDA(typec_index_ida);
 
@@ -540,7 +541,7 @@ static void typec_altmode_release(struct device *dev)
 }
 
 const struct device_type typec_altmode_dev_type = {
-	.name = "typec_alternate_mode",
+	.name = ALTERNATE_MODE_DEVICE_TYPE_NAME,
 	.groups = typec_altmode_groups,
 	.release = typec_altmode_release,
 };
@@ -1942,6 +1943,25 @@ static ssize_t orientation_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(orientation);
 
+static ssize_t mode_priorities_store(struct device *dev,
+			       struct device_attribute *attr,
+			       const char *buf, size_t size)
+{
+	struct typec_port *port = to_typec_port(dev);
+	int ret = typec_mode_priorities_set(port, buf);
+
+	return ret ? : size;
+}
+
+static ssize_t mode_priorities_show(struct device *dev,
+			      struct device_attribute *attr, char *buf)
+{
+	struct typec_port *port = to_typec_port(dev);
+
+	return typec_mode_priorities_get(port, buf);
+}
+static DEVICE_ATTR_RW(mode_priorities);
+
 static struct attribute *typec_attrs[] = {
 	&dev_attr_data_role.attr,
 	&dev_attr_power_operation_mode.attr,
@@ -1954,6 +1974,7 @@ static struct attribute *typec_attrs[] = {
 	&dev_attr_port_type.attr,
 	&dev_attr_orientation.attr,
 	&dev_attr_usb_capability.attr,
+	&dev_attr_mode_priorities.attr,
 	NULL,
 };
 
@@ -1992,6 +2013,9 @@ static umode_t typec_attr_is_visible(struct kobject *kobj,
 			return 0;
 		if (!port->ops || !port->ops->default_usb_mode_set)
 			return 0444;
+	} else if (attr == &dev_attr_mode_priorities.attr) {
+		if (!port->alt_mode_override)
+			return 0;
 	}
 
 	return attr->mode;
@@ -2652,6 +2676,8 @@ struct typec_port *typec_register_port(struct device *parent,
 	else if (cap->usb_capability & USB_CAPABILITY_USB2)
 		port->usb_mode = USB_MODE_USB2;
 
+	typec_mode_priorities_set(port, "");
+
 	device_initialize(&port->dev);
 	port->dev.class = &typec_class;
 	port->dev.parent = parent;
diff --git a/drivers/usb/typec/class.h b/drivers/usb/typec/class.h
index f05d9201c233..28b3c19a0632 100644
--- a/drivers/usb/typec/class.h
+++ b/drivers/usb/typec/class.h
@@ -5,6 +5,7 @@
 
 #include <linux/device.h>
 #include <linux/usb/typec.h>
+#include <linux/usb/typec_altmode.h>
 
 struct typec_mux;
 struct typec_switch;
@@ -82,6 +83,7 @@ struct typec_port {
 	struct device			*usb3_dev;
 
 	bool				alt_mode_override;
+	int				mode_priority_list[TYPEC_MODE_MAX];
 };
 
 #define to_typec_port(_dev_) container_of(_dev_, struct typec_port, dev)
@@ -111,4 +113,6 @@ static inline int typec_link_ports(struct typec_port *connector) { return 0; }
 static inline void typec_unlink_ports(struct typec_port *connector) { }
 #endif
 
+#define ALTERNATE_MODE_DEVICE_TYPE_NAME "typec_alternate_mode"
+
 #endif /* __USB_TYPEC_CLASS__ */
diff --git a/drivers/usb/typec/mode_selection.c b/drivers/usb/typec/mode_selection.c
new file mode 100644
index 000000000000..cb7ddf679037
--- /dev/null
+++ b/drivers/usb/typec/mode_selection.c
@@ -0,0 +1,116 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2025 Google LLC.
+ */
+
+#include <linux/usb/typec_altmode.h>
+#include <linux/vmalloc.h>
+#include "mode_selection.h"
+#include "class.h"
+
+static const char * const mode_names[] = {
+	[TYPEC_DP_ALTMODE] = "DP",
+	[TYPEC_TBT_ALTMODE] = "TBT",
+	[TYPEC_USB4_MODE] = "USB4",
+};
+static const char * const default_priorities = "USB4 TBT DP";
+
+/* -------------------------------------------------------------------------- */
+/* port 'mode_priorities' attribute */
+static int typec_mode_parse_priority_string(const char *str, int *list)
+{
+	const bool user_settings = list[0] == TYPEC_MODE_MAX;
+	char *buf, *ptr;
+	char *token;
+	int ret = 0;
+
+	buf = vmalloc(strlen(str) + 1);
+	if (!buf)
+		return -ENOMEM;
+	for (int i = 0; i <= strlen(str); i++)
+		buf[i] = (str[i] == '\n') ? '\0' : str[i];
+	ptr = buf;
+
+	while ((token = strsep(&ptr, " ")) && !ret) {
+		if (strlen(token)) {
+			int mode = 0;
+
+			while ((mode < TYPEC_MODE_MAX) &&
+				strcmp(token, mode_names[mode]))
+				mode++;
+			if (mode == TYPEC_MODE_MAX) {
+				ret = -EINVAL;
+				continue;
+			}
+
+			for (int i = 0; i < TYPEC_MODE_MAX; i++) {
+				if (list[i] == TYPEC_MODE_MAX) {
+					list[i] = mode;
+					break;
+				}
+				if (list[i] == mode) {
+					if (user_settings)
+						ret = -EINVAL;
+					break;
+				}
+			}
+		}
+	}
+	vfree(buf);
+
+	return ret;
+}
+
+int typec_mode_priorities_set(struct typec_port *port,
+		const char *user_priorities)
+{
+	int list[TYPEC_MODE_MAX];
+	int ret;
+
+	for (int i = 0; i < TYPEC_MODE_MAX; i++)
+		list[i] = TYPEC_MODE_MAX;
+
+	ret = typec_mode_parse_priority_string(user_priorities, list);
+	if (!ret)
+		ret = typec_mode_parse_priority_string(default_priorities, list);
+
+	if (!ret)
+		for (int i = 0; i < TYPEC_MODE_MAX; i++)
+			port->mode_priority_list[i] = list[i];
+
+	return ret;
+}
+
+static int port_altmode_supported(struct device *dev, void *data)
+{
+	if (!strcmp(dev->type->name, ALTERNATE_MODE_DEVICE_TYPE_NAME)) {
+		struct typec_altmode *alt = to_typec_altmode(dev);
+
+		if (*(int *)data == typec_svid_to_altmode(alt->svid))
+			return 1;
+	}
+	return 0;
+}
+
+static bool port_mode_supported(struct typec_port *port, int mode)
+{
+	if (mode >= TYPEC_MODE_MAX)
+		return false;
+	if (mode == TYPEC_USB4_MODE)
+		return !!(port->cap->usb_capability & USB_CAPABILITY_USB4);
+	return device_for_each_child(&port->dev, &mode, port_altmode_supported);
+}
+
+int typec_mode_priorities_get(struct typec_port *port, char *buf)
+{
+	ssize_t count = 0;
+
+	for (int i = 0; i < TYPEC_MODE_MAX; i++) {
+		int mode = port->mode_priority_list[i];
+
+		if (port_mode_supported(port, mode))
+			count += sysfs_emit_at(buf, count, "%s ", mode_names[mode]);
+	}
+
+	return count + sysfs_emit_at(buf, count, "\n");
+}
diff --git a/drivers/usb/typec/mode_selection.h b/drivers/usb/typec/mode_selection.h
new file mode 100644
index 000000000000..c595c84e26a4
--- /dev/null
+++ b/drivers/usb/typec/mode_selection.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#include <linux/usb/typec_dp.h>
+#include <linux/usb/typec_tbt.h>
+
+static inline int typec_svid_to_altmode(const u16 svid)
+{
+	switch (svid) {
+	case USB_TYPEC_DP_SID:
+		return TYPEC_DP_ALTMODE;
+	case USB_TYPEC_TBT_SID:
+		return TYPEC_TBT_ALTMODE;
+	}
+	return TYPEC_MODE_MAX;
+}
+
+int typec_mode_priorities_set(struct typec_port *port,
+		const char *user_priorities);
+int typec_mode_priorities_get(struct typec_port *port, char *buf);
diff --git a/include/linux/usb/typec_altmode.h b/include/linux/usb/typec_altmode.h
index b3c0866ea70f..4f05c5f5c91d 100644
--- a/include/linux/usb/typec_altmode.h
+++ b/include/linux/usb/typec_altmode.h
@@ -145,6 +145,13 @@ enum {
 
 #define TYPEC_MODAL_STATE(_state_)	((_state_) + TYPEC_STATE_MODAL)
 
+enum {
+	TYPEC_DP_ALTMODE = 0,
+	TYPEC_TBT_ALTMODE,
+	TYPEC_USB4_MODE,
+	TYPEC_MODE_MAX,
+};
+
 struct typec_altmode *typec_altmode_get_plug(struct typec_altmode *altmode,
 					     enum typec_plug_index index);
 void typec_altmode_put_plug(struct typec_altmode *plug);
-- 
2.50.0.727.gbf7dc18ff4-goog

