Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907AD27CB34;
	Sun, 15 Jun 2025 18:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750010427; cv=none; b=bRlBesCjZcFEdmwgZcS+qF17LFeis+h6roiAYFFZsVGORMzGHvQDxlU+WFIS0D9rc19RBUtn0yUqSY15H8pUEgDaHwUAKNb5F7MxNHRnXrQPRoHyrYr6GgQ43zoGcdhEIRBfvzw3Zv+8Kkldln5rghYI5CGxTmWJh9UOuFkRwfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750010427; c=relaxed/simple;
	bh=NolHWbALg3zLTKBRVQrJRfmueZ379LRJLk7yYnSPC7s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=e+Fbj2b1kA8Td5JbLuBKytlphNH6Ht2TW5TPjsGxmJrGCRhA5kBHecaisWAM4xoM5gG33EF+4MAcQbDm4olHRHNKuSbnGOTKZwOQy7x70BjnywK3hQ9LEbLxoisNmOXbhq8e/WGrMK+Pp4krVMzcOvPYWrZ4jh0mQDDkbBM7+0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=O24iTfzZ; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="O24iTfzZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1750010412; x=1750615212; i=w_armin@gmx.de;
	bh=rY1SZR0SXcbDi7r/Xq4aVGkeUAfIaJwwf2n+V38AgEo=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=O24iTfzZIPkZBf1Wt9J6SLdHZN26dZxExRofHprZIKoxhjCUiPKHS03m0iNuHSyC
	 9QbIwb0zVD7r03tCAd6NcoFe1eEDxquJNw0tHIuMf7RW73DSEpUvWipmwhIjjOoOL
	 /l8ZTZ2D9BLddWKiIN2rRB5oHRsg1I7qyScvPj/dXE7Yxt+u+aIdykoSEqExAATVg
	 0u45XIJAshWLmzY+k2BNm2j3p/PEYfmCCPsqOCC/3aZFcsbuX2Nd2Vwc4SRpJ4/2l
	 ygW84CvBKLpCr57ydNSAfmwbhLt08urwjSxpZ2YjLwPqjeJ2jBuVPRoXfxNx8UFmQ
	 DqYElFJTX9m+D007MQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([87.177.78.219]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MPXhA-1uDCQ52OKg-00OEi2; Sun, 15 Jun 2025 20:00:11 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: ilpo.jarvinen@linux.intel.com,
	hdegoede@redhat.com,
	chumuzero@gmail.com,
	corbet@lwn.net,
	cs@tuxedo.de,
	wse@tuxedocomputers.com,
	ggo@tuxedocomputers.com
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [RFC PATCH 1/3] platform/x86: Add Uniwill WMI driver
Date: Sun, 15 Jun 2025 19:59:55 +0200
Message-Id: <20250615175957.9781-2-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250615175957.9781-1-W_Armin@gmx.de>
References: <20250615175957.9781-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:am2M34eNJIROjDY67Y9N8kNCSXKkqyIX9ZXh8CKYSBBkNrXraz3
 7xknbm+vl487S22ZSWEm8FpzTSvo/hxHf9Tp40uLnWSfeSoL7p9oHQuZfcH9QAXyhDGlaY6
 crsx949gDr8UFFxZGtQ7VeSs3HzNsfdZJloJF7NLW7lkJNKS/j9om8rqJ7sUgHYvuqt+Uli
 30FduTAEF4JtgHLj4iKAA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:mtE439L3U4U=;RqDUGKbjWZC5oDP+sD7aaxS55Ic
 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
 FJlJeVx9gGWFN7Oe

Add a new driver for handling WMI events on Uniwill laptops.
The driver sadly cannot use the WMI GUID for autoloading since Uniwill
just copied it from the Windows driver example.

The driver is reverse-engineered based on the following information:
- https://github.com/pobrn/qc71_laptop
- https://github.com/tuxedocomputers/tuxedo-drivers
- various OEM software

Reported-by: cyear <chumuzero@gmail.com>
Closes: https://github.com/lm-sensors/lm-sensors/issues/508
Closes: https://github.com/Wer-Wolf/uniwill-laptop/issues/3
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 Documentation/wmi/devices/uniwill-wmi.rst  |  52 ++++++
 MAINTAINERS                                |   8 +
 drivers/platform/x86/Kconfig               |   2 +
 drivers/platform/x86/Makefile              |   3 +
 drivers/platform/x86/uniwill/Kconfig       |  32 ++++
 drivers/platform/x86/uniwill/Makefile      |   7 +
 drivers/platform/x86/uniwill/uniwill-wmi.c | 177 +++++++++++++++++++++
 drivers/platform/x86/uniwill/uniwill-wmi.h | 122 ++++++++++++++
 8 files changed, 403 insertions(+)
 create mode 100644 Documentation/wmi/devices/uniwill-wmi.rst
 create mode 100644 drivers/platform/x86/uniwill/Kconfig
 create mode 100644 drivers/platform/x86/uniwill/Makefile
 create mode 100644 drivers/platform/x86/uniwill/uniwill-wmi.c
 create mode 100644 drivers/platform/x86/uniwill/uniwill-wmi.h

diff --git a/Documentation/wmi/devices/uniwill-wmi.rst b/Documentation/wmi=
/devices/uniwill-wmi.rst
new file mode 100644
index 000000000000..232fa8349611
=2D-- /dev/null
+++ b/Documentation/wmi/devices/uniwill-wmi.rst
@@ -0,0 +1,52 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+Uniwill WMI event driver (uniwill-wmi)
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Introduction
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Many notebooks manufactured by Uniwill (either directly or as ODM) provid=
e an WMI-based
+event interface for various platform events like hotkeys. This interface =
is used by the
+``uniwill-wmi`` driver to react to hotkey presses.
+
+WMI interface description
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
+
+The WMI interface description can be decoded from the embedded binary MOF=
 (bmof)
+data using the `bmfdec <https://github.com/pali/bmfdec>`_ utility:
+
+::
+
+  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"),
+   Description("Class containing event generated ULong data"),
+   guid("{ABBC0F72-8EA1-11d1-00A0-C90629100000}")]
+  class AcpiTest_EventULong : WmiEvent {
+    [key, read] string InstanceName;
+    [read] boolean Active;
+
+    [WmiDataId(1), read, write, Description("ULong Data")] uint32 ULong;
+  };
+
+Most of the WMI-related code was copied from the Windows driver samples, =
which unfortunately means
+that the WMI-GUID is not unique. This makes the WMI-GUID unusable for aut=
oloading.
+
+WMI event data
+--------------
+
+The WMI event data contains a single 32-bit value which is used to indica=
te various platform events.
+Many non-hotkey events are not directly consumed by the driver itself, bu=
t are instead handled by
+the ``uniwill-laptop`` driver.
+
+Reverse-Engineering the Uniwill WMI event interface
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
+
+The driver logs debug messages when receiving a WMI event. Thus enabling =
debug messages will be
+useful for finding unknown event codes.
+
+Special thanks go to github user `pobrn` which developed the
+`qc71_laptop <https://github.com/pobrn/qc71_laptop>`_ driver on which thi=
s driver is partly based.
+The same is true for Tuxedo Computers, which developed the
+`tuxedo-drivers <https://github.com/tuxedocomputers/tuxedo-drivers>`_ pac=
kage which also served as
+a foundation for this driver.
diff --git a/MAINTAINERS b/MAINTAINERS
index c14614613377..53876ec2d111 100644
=2D-- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25496,6 +25496,14 @@ L:	linux-scsi@vger.kernel.org
 S:	Maintained
 F:	drivers/ufs/host/ufs-renesas.c
=20
+UNIWILL WMI DRIVER
+M:	Armin Wolf <W_Armin@gmx.de>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	Documentation/wmi/devices/uniwill-wmi.rst
+F:	drivers/platform/x86/uniwill/uniwill-wmi.c
+F:	drivers/platform/x86/uniwill/uniwill-wmi.h
+
 UNSORTED BLOCK IMAGES (UBI)
 M:	Richard Weinberger <richard@nod.at>
 R:	Zhihao Cheng <chengzhihao1@huawei.com>
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 43055df44827..ba9d65f01332 100644
=2D-- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -65,6 +65,8 @@ config HUAWEI_WMI
 	  To compile this driver as a module, choose M here: the module
 	  will be called huawei-wmi.
=20
+source "drivers/platform/x86/uniwill/Kconfig"
+
 config UV_SYSFS
 	tristate "Sysfs structure for UV systems"
 	depends on X86_UV
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 0530a224bebd..1549c56ced91 100644
=2D-- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -107,6 +107,9 @@ obj-$(CONFIG_TOSHIBA_WMI)	+=3D toshiba-wmi.o
 # before toshiba_acpi initializes
 obj-$(CONFIG_ACPI_TOSHIBA)	+=3D toshiba_acpi.o
=20
+# Uniwill
+obj-y				+=3D uniwill/
+
 # Inspur
 obj-$(CONFIG_INSPUR_PLATFORM_PROFILE)	+=3D inspur_platform_profile.o
=20
diff --git a/drivers/platform/x86/uniwill/Kconfig b/drivers/platform/x86/u=
niwill/Kconfig
new file mode 100644
index 000000000000..5f1ea3e9e72f
=2D-- /dev/null
+++ b/drivers/platform/x86/uniwill/Kconfig
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+#
+# Uniwill X86 Platform Specific Drivers
+#
+
+menuconfig X86_PLATFORM_DRIVERS_UNIWILL
+	bool "Uniwill X86 Platform Specific Device Drivers"
+	depends on X86_PLATFORM_DEVICES
+	help
+	  Say Y here to get to see options for device drivers for various
+	  Uniwill X86 platforms, including many OEM laptops originally
+	  manufactured by Uniwill.
+	  This option alone does not add any kernel code.
+
+	  If you say N, all options in this submenu will be skipped and disabled=
.
+
+if X86_PLATFORM_DRIVERS_UNIWILL
+
+config UNIWILL_WMI
+	tristate "Uniwill WMI Event Driver"
+	default m
+	depends on ACPI_WMI
+	depends on INPUT
+	select INPUT_SPARSEKMAP
+	help
+	  This driver adds support for various hotkey events on Uniwill laptops,
+	  like rfkill and other special buttons. It also supports many OEM lapto=
ps
+	  originally manufactured by Uniwill.
+
+	  If you have such a laptop, say Y or M here.
+
+endif
diff --git a/drivers/platform/x86/uniwill/Makefile b/drivers/platform/x86/=
uniwill/Makefile
new file mode 100644
index 000000000000..a5a300be63f3
=2D-- /dev/null
+++ b/drivers/platform/x86/uniwill/Makefile
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+#
+# Makefile for linux/drivers/platform/x86/uniwill
+# Uniwill X86 Platform Specific Drivers
+#
+
+obj-$(CONFIG_UNIWILL_WMI)	+=3D uniwill-wmi.o
diff --git a/drivers/platform/x86/uniwill/uniwill-wmi.c b/drivers/platform=
/x86/uniwill/uniwill-wmi.c
new file mode 100644
index 000000000000..b95a0d68ce6a
=2D-- /dev/null
+++ b/drivers/platform/x86/uniwill/uniwill-wmi.c
@@ -0,0 +1,177 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Linux hotkey driver for Uniwill notebooks.
+ *
+ * Copyright (C) 2025 Armin Wolf <W_Armin@gmx.de>
+ */
+
+#include <linux/acpi.h>
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/export.h>
+#include <linux/input.h>
+#include <linux/input/sparse-keymap.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/notifier.h>
+#include <linux/printk.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+#include <linux/wmi.h>
+
+#include "uniwill-wmi.h"
+
+#define DRIVER_NAME		"uniwill-wmi"
+#define UNIWILL_EVENT_GUID	"ABBC0F72-8EA1-11D1-00A0-C90629100000"
+
+struct uniwill_wmi_data {
+	struct mutex input_lock;	/* Protects input sequence during notify */
+	struct input_dev *input_device;
+};
+
+static BLOCKING_NOTIFIER_HEAD(uniwill_wmi_chain_head);
+
+static const struct key_entry uniwill_wmi_keymap[] =3D {
+	/* Reported via keyboard controller */
+	{ KE_IGNORE,	UNIWILL_OSD_CAPSLOCK,			{ KEY_CAPSLOCK }},
+	{ KE_IGNORE,	UNIWILL_OSD_NUMLOCK,			{ KEY_NUMLOCK }},
+
+	/* Reported when the user locks/unlocks the super key */
+	{ KE_IGNORE,	UNIWILL_OSD_SUPER_KEY_LOCK_ENABLE,	{ KEY_UNKNOWN }},
+	{ KE_IGNORE,	UNIWILL_OSD_SUPER_KEY_LOCK_DISABLE,	{ KEY_UNKNOWN }},
+
+	/* Reported in manual mode when toggling the airplane mode status */
+	{ KE_KEY,	UNIWILL_OSD_RFKILL,			{ KEY_RFKILL }},
+
+	/* Reported when user wants to cycle the platform profile */
+	{ KE_IGNORE,	UNIWILL_OSD_PERFORMANCE_MODE_TOGGLE,	{ KEY_UNKNOWN }},
+
+	/* Reported when the user wants to toggle the microphone mute status */
+	{ KE_KEY,	UNIWILL_OSD_MIC_MUTE,			{ KEY_MICMUTE }},
+
+	/* Reported when the user locks/unlocks the Fn key */
+	{ KE_IGNORE,	UNIWILL_OSD_FN_LOCK,			{ KEY_FN_ESC }},
+
+	/* Reported when the user wants to toggle the brightness of the keyboard=
 */
+	{ KE_KEY,	UNIWILL_OSD_KBDILLUMTOGGLE,		{ KEY_KBDILLUMTOGGLE }},
+
+	/* FIXME: find out the exact meaning of those events */
+	{ KE_IGNORE,	UNIWILL_OSD_BAT_CHARGE_FULL_24_H,	{ KEY_UNKNOWN }},
+	{ KE_IGNORE,	UNIWILL_OSD_BAT_ERM_UPDATE,		{ KEY_UNKNOWN }},
+
+	/* Reported when the user wants to toggle the benchmark mode status */
+	{ KE_IGNORE,	UNIWILL_OSD_BENCHMARK_MODE_TOGGLE,	{ KEY_UNKNOWN }},
+
+	{ KE_END }
+};
+
+int uniwill_wmi_register_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_register(&uniwill_wmi_chain_head, nb);
+}
+EXPORT_SYMBOL_NS_GPL(uniwill_wmi_register_notifier, "UNIWILL");
+
+int uniwill_wmi_unregister_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_unregister(&uniwill_wmi_chain_head, nb);
+}
+EXPORT_SYMBOL_NS_GPL(uniwill_wmi_unregister_notifier, "UNIWILL");
+
+static void devm_uniwill_wmi_unregister_notifier(void *data)
+{
+	struct notifier_block *nb =3D data;
+
+	uniwill_wmi_unregister_notifier(nb);
+}
+
+int devm_uniwill_wmi_register_notifier(struct device *dev, struct notifie=
r_block *nb)
+{
+	int ret;
+
+	ret =3D uniwill_wmi_register_notifier(nb);
+	if (ret < 0)
+		return ret;
+
+	return devm_add_action_or_reset(dev, devm_uniwill_wmi_unregister_notifie=
r, nb);
+}
+EXPORT_SYMBOL_NS_GPL(devm_uniwill_wmi_register_notifier, "UNIWILL");
+
+static void uniwill_wmi_notify(struct wmi_device *wdev, union acpi_object=
 *obj)
+{
+	struct uniwill_wmi_data *data =3D dev_get_drvdata(&wdev->dev);
+	u32 value;
+	int ret;
+
+	if (obj->type !=3D ACPI_TYPE_INTEGER)
+		return;
+
+	value =3D obj->integer.value;
+
+	dev_dbg(&wdev->dev, "Received WMI event %u\n", value);
+
+	ret =3D blocking_notifier_call_chain(&uniwill_wmi_chain_head, value, NUL=
L);
+	if (ret =3D=3D NOTIFY_BAD)
+		return;
+
+	mutex_lock(&data->input_lock);
+	sparse_keymap_report_event(data->input_device, value, 1, true);
+	mutex_unlock(&data->input_lock);
+}
+
+static int uniwill_wmi_probe(struct wmi_device *wdev, const void *context=
)
+{
+	struct uniwill_wmi_data *data;
+	int ret;
+
+	data =3D devm_kzalloc(&wdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	ret =3D devm_mutex_init(&wdev->dev, &data->input_lock);
+	if (ret < 0)
+		return ret;
+
+	dev_set_drvdata(&wdev->dev, data);
+
+	data->input_device =3D devm_input_allocate_device(&wdev->dev);
+	if (!data->input_device)
+		return -ENOMEM;
+
+	ret =3D sparse_keymap_setup(data->input_device, uniwill_wmi_keymap, NULL=
);
+	if (ret < 0)
+		return ret;
+
+	data->input_device->name =3D "Uniwill WMI hotkeys";
+	data->input_device->phys =3D "wmi/input0";
+	data->input_device->id.bustype =3D BUS_HOST;
+
+	return input_register_device(data->input_device);
+}
+
+/*
+ * We cannot fully trust this GUID since Uniwill just copied the WMI GUID
+ * from the Windows driver example, and others probably did the same.
+ *
+ * Because of this we cannot use this WMI GUID for autoloading.
+ */
+static const struct wmi_device_id uniwill_wmi_id_table[] =3D {
+	{ UNIWILL_EVENT_GUID, NULL },
+	{ }
+};
+
+static struct wmi_driver uniwill_wmi_driver =3D {
+	.driver =3D {
+		.name =3D DRIVER_NAME,
+		.probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
+	},
+	.id_table =3D uniwill_wmi_id_table,
+	.probe =3D uniwill_wmi_probe,
+	.notify =3D uniwill_wmi_notify,
+	.no_singleton =3D true,
+};
+module_wmi_driver(uniwill_wmi_driver);
+
+MODULE_AUTHOR("Armin Wolf <W_Armin@gmx.de>");
+MODULE_DESCRIPTION("Uniwill notebook hotkey driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/platform/x86/uniwill/uniwill-wmi.h b/drivers/platform=
/x86/uniwill/uniwill-wmi.h
new file mode 100644
index 000000000000..41662ece0675
=2D-- /dev/null
+++ b/drivers/platform/x86/uniwill/uniwill-wmi.h
@@ -0,0 +1,122 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Linux hotkey driver for Uniwill notebooks.
+ *
+ * Copyright (C) 2025 Armin Wolf <W_Armin@gmx.de>
+ */
+
+#ifndef UNIWILL_WMI_H
+#define UNIWILL_WMI_H
+
+#define UNIWILL_OSD_CAPSLOCK			0x01
+#define UNIWILL_OSD_NUMLOCK			0x02
+#define UNIWILL_OSD_SCROLLLOCK			0x03
+
+#define UNIWILL_OSD_TOUCHPAD_ON			0x04
+#define UNIWILL_OSD_TOUCHPAD_OFF		0x05
+
+#define UNIWILL_OSD_SILENT_MODE_ON		0x06
+#define UNIWILL_OSD_SILENT_MODE_OFF		0x07
+
+#define UNIWILL_OSD_WLAN_ON			0x08
+#define UNIWILL_OSD_WLAN_OFF			0x09
+
+#define UNIWILL_OSD_WIMAX_ON			0x0A
+#define UNIWILL_OSD_WIMAX_OFF			0x0B
+
+#define UNIWILL_OSD_BLUETOOTH_ON		0x0C
+#define UNIWILL_KEY_BLUETOOTH_OFF		0x0D
+
+#define UNIWILL_OSD_RF_ON			0x0E
+#define UNIWILL_OSD_RF_OFF			0x0F
+
+#define UNIWILL_OSD_3G_ON			0x10
+#define UNIWILL_OSD_3G_OFF			0x11
+
+#define UNIWILL_OSD_WEBCAM_ON			0x12
+#define UNIWILL_OSD_WEBCAM_OFF			0x13
+
+#define UNIWILL_OSD_BRIGHTNESSUP		0x14
+#define UNIWILL_OSD_BRIGHTNESSDOWN		0x15
+
+#define UNIWILL_OSD_RADIOON			0x1A
+#define UNIWILL_OSD_RADIOOFF			0x1B
+
+#define UNIWILL_OSD_POWERSAVE_ON		0x31
+#define UNIWILL_OSD_POWERSAVE_OFF		0x32
+
+#define UNIWILL_OSD_MENU			0x34
+
+#define UNIWILL_OSD_MUTE			0x35
+#define UNIWILL_OSD_VOLUMEDOWN			0x36
+#define UNIWILL_OSD_VOLUMEUP			0x37
+
+#define UNIWILL_OSD_MENU_2			0x38
+
+#define UNIWILL_OSD_LIGHTBAR_ON			0x39
+#define UNIWILL_OSD_LIGHTBAR_OFF		0x3A
+
+#define UNIWILL_OSD_KB_LED_LEVEL0		0x3B
+#define UNIWILL_OSD_KB_LED_LEVEL1		0x3C
+#define UNIWILL_OSD_KB_LED_LEVEL2		0x3D
+#define UNIWILL_OSD_KB_LED_LEVEL3		0x3E
+#define UNIWILL_OSD_KB_LED_LEVEL4		0x3F
+
+#define UNIWILL_OSD_SUPER_KEY_LOCK_ENABLE	0x40
+#define UNIWILL_OSD_SUPER_KEY_LOCK_DISABLE	0x41
+
+#define UNIWILL_OSD_MENU_JP			0x42
+
+#define UNIWILL_OSD_CAMERA_ON			0x90
+#define UNIWILL_OSD_CAMERA_OFF			0x91
+
+#define UNIWILL_OSD_RFKILL			0xA4
+
+#define UNIWILL_OSD_SUPER_KEY_LOCK_CHANGED	0xA5
+
+#define UNIWILL_OSD_LIGHTBAR_STATE_CHANGED	0xA6
+
+#define UNIWILL_OSD_FAN_BOOST_STATE_CHANGED	0xA7
+
+#define UNIWILL_OSD_LCD_SW			0xA9
+
+#define UNIWILL_OSD_FAN_OVERTEMP		0xAA
+
+#define UNIWILL_OSD_DC_ADAPTER_CHANGED		0xAB
+
+#define UNIWILL_OSD_BAT_HP_OFF			0xAC
+
+#define UNIWILL_OSD_FAN_DOWN_TEMP		0xAD
+
+#define UNIWILL_OSD_BATTERY_ALERT		0xAE
+
+#define UNIWILL_OSD_TIMAP_HAIERLB_SW		0xAF
+
+#define UNIWILL_OSD_PERFORMANCE_MODE_TOGGLE	0xB0
+
+#define UNIWILL_OSD_KBDILLUMDOWN		0xB1
+#define UNIWILL_OSD_KBDILLUMUP			0xB2
+
+#define UNIWILL_OSD_BACKLIGHT_LEVEL_CHANGE	0xB3
+#define UNIWILL_OSD_BACKLIGHT_POWER_CHANGE	0xB4
+
+#define UNIWILL_OSD_MIC_MUTE			0xB7
+
+#define UNIWILL_OSD_FN_LOCK			0xB8
+#define UNIWILL_OSD_KBDILLUMTOGGLE		0xB9
+
+#define UNIWILL_OSD_BAT_CHARGE_FULL_24_H	0xBE
+
+#define UNIWILL_OSD_BAT_ERM_UPDATE		0xBF
+
+#define UNIWILL_OSD_BENCHMARK_MODE_TOGGLE	0xC0
+
+#define UNIWILL_OSD_KBD_BACKLIGHT_CHANGED	0xF0
+
+struct notifier_block;
+
+int uniwill_wmi_register_notifier(struct notifier_block *nb);
+int uniwill_wmi_unregister_notifier(struct notifier_block *nb);
+int devm_uniwill_wmi_register_notifier(struct device *dev, struct notifie=
r_block *nb);
+
+#endif /* UNIWILL_WMI_H */
=2D-=20
2.39.5

