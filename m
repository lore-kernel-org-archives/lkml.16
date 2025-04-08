Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3CA25334F;
	Tue,  8 Apr 2025 01:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744075713; cv=none; b=QXiZjrejM85bJ9g8PjuSd/FxteEw0+x5cf70oKqTYhFk/P3Kj6mj10cywlxUnbKRBu2ImBcmKzSTTIY8u4r24b86qUY5lpFUEvEQXUeNXeOBdcGl0LcO/T4/TktLnzdu1joAqQEprq/DDWVCkL1YTEw9sn1KZ/nhKzRMYIr+nhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744075713; c=relaxed/simple;
	bh=yjj4F3qymz54666aWlkyqY7RjZau59PpxW8HOtfL2Ok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Amsv02bmo76lhMys927/QHSC8koKLzxJ8iBhzWkH1TnsS93AnKCzPOvTBm14poCyz3RhPo/jSEBG7EGFvAjnAJWfxDxt4PbU/O3iZre2gaHBTh8wiCj/bDf1k53o8J7yza6JR0BZwRxT2b9uu3uH+aKjUlc7MOZzOQ9YgOnlUnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SMcCH25u; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SMcCH25u"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22423adf751so49054215ad.2;
        Mon, 07 Apr 2025 18:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744075711; x=1744680511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FYpg105GeycpxusCr6/Txn4m5p+k3kca3L38kTfl1X4=;
        b=SMcCH25u0vwCLPpS/zBAu9NKog7br4dBNIGil3piPpKhS8ARE3sdu7to8CPNfhtRG0
         Bp9KKEey86hQ4d0Ps2o3/3khxSKjFZqIKG53oy6vi2SGgT5s4GEROGcQOn2jHSCxPlaL
         0iOLP/1btfYXh7hO9VeNOiNAY96Wb5KIIUGZhvMCglS03YNPjSU4PyLfcau1+MzBWs3n
         97g0gJfcE/g4eYIoFjCidYcCY9YAyxYkZwNpJr6AmR7FIhCVvLJx8fCJ8qLRU8EhfaiV
         G7QJNUtlZeIw3sSVPPo8gV+vHsHEBiStbVd5++3bRb5FnB1/Wdyx5aD1d7ZTOK++blBY
         H56Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744075711; x=1744680511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FYpg105GeycpxusCr6/Txn4m5p+k3kca3L38kTfl1X4=;
        b=UEtU558B+8aygo+xpT9pEZ4riERwzJC0+vEXL9uNBZqlmrxCXIjuDu2zZvbZv6L55/
         DIKVv1pVpxa248BgwTisid5Z+O9qBqTwPs7JpdOEgjEWnrHs/f8lAWjpIvJKzGjzNGKy
         cq7xvf060FC6e+X9JTwN7fTV5EQQXL+Y6N9J9ERG4f1L2GyVm80xCdgLAOCbueqWU9ig
         E3NGWVDcVxmTAVbBIMR2tkaIyZj1b6cUOJoazSde6NZ+pj1SReg5o2AjV+T//WVpRXiJ
         4GNMtvE++5//qtthrep5BweCWiJT3kyCf8WbnIWROSnUBMbvZE+bpET7dUTpvnlQSRkm
         IcgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOnVcYwKlum6FFZ/CoC60GgzpF0F6KeulORGoKAVZsk+6PHQkUDDCEsHsmw9y4SfSCArzSu6eMqp4=@vger.kernel.org, AJvYcCWv7ybCsJ2AwN4gf8O5BaEp4Eno8cjiyuMfXVN34msahtRZ5T5laIAc/+H3SnUXHsCz593idcqqoJudFq8M@vger.kernel.org, AJvYcCXOB/LYJs7rxpKiWxM2ELCka0Ob8FpM1pVXvSBEhrVgbnWeiPOn40GMIP/zyYRNbfWcVv3BI9n5oPwhgqS2nFmw/Np1SQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8zEl3Ykg7CB4Vdc2SI3wG3X2y3oQo63XVDL4Mw7rHaO7NIuvR
	9zxTj58mP+/fNro9zBIr81kaC1ayfQfFWQdGdlLYgsQITZ4xQu1Z
X-Gm-Gg: ASbGncs0GOHicUC4GlhMlairwKZiDVJnAiRa5duyRSipT/OjJVqDp2Fj3BCJTnQ+EFX
	jz43u/Rvbvo05dXPiu3iIhWPzeYTg4yp7x682vqjw5UPoXSCodsGl7jyWVs8xT5lIXGJ2Bxwl/5
	rCnFwrDqqfRLL1wJRUmUth/BooQbQagHzeHqAVbEsZpdnKoMxTjkxYyhYsPm6gu2uNMOS61YyED
	epbZ+HShWxZ+Ud90t9+URuuzWoi7hlSV+xtmJ+jqS2Q6h7TO55h2bM0V9QKLNlFPbSSooZFBJ1o
	OU5NEciliqWgQUD2Iuydt1ECGLds+yd4Z3LxWzgItBvQ4XWY0pf0GhHKYIcDYIQ9MjLVjDT5Bak
	0SVqMC5wyJTbFZcwVRbwON0Pmxym8FSG4u1vhVpF3XYo=
X-Google-Smtp-Source: AGHT+IG7FIIfKCWbLkd8DJ833APCv8WVrlIT6hMkKB2C12gUO7Z2y/xJzAQlVarQlFJQXS/pV8eEEQ==
X-Received: by 2002:a17:902:ef0b:b0:21a:8300:b9ce with SMTP id d9443c01a7336-22a8a0b59fbmr204800055ad.49.1744075711081;
        Mon, 07 Apr 2025 18:28:31 -0700 (PDT)
Received: from localhost.localdomain (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785c39c1sm87901255ad.85.2025.04.07.18.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 18:28:30 -0700 (PDT)
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
Subject: [PATCH v5 2/6] platform/x86: Add lenovo-wmi-helpers
Date: Mon,  7 Apr 2025 18:28:11 -0700
Message-ID: <20250408012815.1032357-3-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250408012815.1032357-1-derekjohn.clark@gmail.com>
References: <20250408012815.1032357-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds lenovo-wmi-helpers, which provides a common wrapper function for
wmidev_evaluate_method that does data validation and error handling.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
v5:
 - Fixes from v4 review.
 - Combine all previous methods into a single function that takes a
   buffer for the wmi method arguments.
v4:
 - Changed namespace to LENOVO_WMI_HELPERS from LENOVO_WMI.
 - Changed filenames to lenovo-wmi-helpers from lenovo-wmi.
 - Removed structs and functions implemented by other drivers.
---
 MAINTAINERS                               |  2 +
 drivers/platform/x86/Kconfig              |  4 ++
 drivers/platform/x86/Makefile             |  1 +
 drivers/platform/x86/lenovo-wmi-helpers.c | 74 +++++++++++++++++++++++
 drivers/platform/x86/lenovo-wmi-helpers.h | 20 ++++++
 5 files changed, 101 insertions(+)
 create mode 100644 drivers/platform/x86/lenovo-wmi-helpers.c
 create mode 100644 drivers/platform/x86/lenovo-wmi-helpers.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 675f4b26426d..3a370a18b806 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13164,6 +13164,8 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	Documentation/wmi/devices/lenovo-wmi-gamezone.rst
 F:	Documentation/wmi/devices/lenovo-wmi-other.rst
+F:	drivers/platform/x86/lenovo-wmi-helpers.c
+F:	drivers/platform/x86/lenovo-wmi-helpers.h
 
 LENOVO WMI HOTKEY UTILITIES DRIVER
 M:	Jackie Dong <xy-jackie@139.com>
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 43407e76476b..bece1ba61417 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -459,6 +459,10 @@ config IBM_RTL
 	 state = 0 (BIOS SMIs on)
 	 state = 1 (BIOS SMIs off)
 
+config LENOVO_WMI_HELPERS
+	tristate
+	depends on ACPI_WMI
+
 config IDEAPAD_LAPTOP
 	tristate "Lenovo IdeaPad Laptop Extras"
 	depends on ACPI
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 650dfbebb6c8..5a9f4e94f78b 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -69,6 +69,7 @@ obj-$(CONFIG_THINKPAD_LMI)	+= think-lmi.o
 obj-$(CONFIG_YOGABOOK)		+= lenovo-yogabook.o
 obj-$(CONFIG_YT2_1380)		+= lenovo-yoga-tab2-pro-1380-fastcharger.o
 obj-$(CONFIG_LENOVO_WMI_CAMERA)	+= lenovo-wmi-camera.o
+obj-$(CONFIG_LENOVO_WMI_HELPERS)	+= lenovo-wmi-helpers.o
 
 # Intel
 obj-y				+= intel/
diff --git a/drivers/platform/x86/lenovo-wmi-helpers.c b/drivers/platform/x86/lenovo-wmi-helpers.c
new file mode 100644
index 000000000000..166e87fef156
--- /dev/null
+++ b/drivers/platform/x86/lenovo-wmi-helpers.c
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Lenovo Legion WMI helpers driver.
+ *
+ * The Lenovo Legion WMI interface is broken up into multiple GUID interfaces
+ * that require cross-references between GUID's for some functionality. The
+ * "Custom Mode" interface is a legacy interface for managing and displaying
+ * CPU & GPU power and hwmon settings and readings. The "Other Mode" interface
+ * is a modern interface that replaces or extends the "Custom Mode" interface
+ * methods. The "Gamezone" interface adds advanced features such as fan
+ * profiles and overclocking. The "Lighting" interface adds control of various
+ * status lights related to different hardware components. Each of these
+ * drivers uses a common procedure to get data from the WMI interface,
+ * enumerated here.
+ *
+ * Copyright(C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
+ */
+
+#include <linux/acpi.h>
+#include <linux/cleanup.h>
+#include <linux/errno.h>
+#include <linux/export.h>
+#include <linux/module.h>
+#include <linux/wmi.h>
+
+#include "lenovo-wmi-helpers.h"
+
+/**
+ * lwmi_dev_evaluate_int() - Helper function for calling WMI methods that
+ * return an integer.
+ * @wdev: Pointer to the WMI device to be called.
+ * @instance: Instance of the called method.
+ * @method_id: WMI Method ID for the method to be called.
+ * @buf: Buffer of all arguments for the given method_id.
+ * @size: Length of the buffer.
+ * @retval: Pointer for the return value to be assigned.
+ *
+ * Calls wmidev_valuate_method for Lenovo WMI devices that return an ACPI
+ * integer. Validates the return value type and assigns the value to the
+ * retval pointer.
+ *
+ * Return: 0 on success, or on error.
+ */
+int lwmi_dev_evaluate_int(struct wmi_device *wdev, u8 instance, u32 method_id,
+			  unsigned char *buf, size_t size, u32 *retval)
+{
+	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
+	union acpi_object *ret_obj __free(kfree) = NULL;
+	struct acpi_buffer input = { size, buf };
+	acpi_status status;
+
+	status = wmidev_evaluate_method(wdev, instance, method_id, &input,
+					&output);
+
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	if (retval) {
+		ret_obj = output.pointer;
+		if (!ret_obj)
+			return -ENODATA;
+
+		if (ret_obj->type != ACPI_TYPE_INTEGER)
+			return -ENXIO;
+
+		*retval = (u32)ret_obj->integer.value;
+	}
+	return 0;
+};
+EXPORT_SYMBOL_NS_GPL(lwmi_dev_evaluate_int, "LENOVO_WMI_HELPERS");
+
+MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
+MODULE_DESCRIPTION("Lenovo WMI Helpers Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/platform/x86/lenovo-wmi-helpers.h b/drivers/platform/x86/lenovo-wmi-helpers.h
new file mode 100644
index 000000000000..b76633603dcc
--- /dev/null
+++ b/drivers/platform/x86/lenovo-wmi-helpers.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+/* Copyright(C) 2025 Derek J. Clark <derekjohn.clark@gmail.com> */
+
+#ifndef _LENOVO_WMI_HELPERS_H_
+#define _LENOVO_WMI_HELPERS_H_
+
+#include <linux/types.h>
+
+struct wmi_device;
+
+struct wmi_method_args_32 {
+	u32 arg0;
+	u32 arg1;
+};
+
+int lwmi_dev_evaluate_int(struct wmi_device *wdev, u8 instance, u32 method_id,
+			  unsigned char *buf, size_t size, u32 *retval);
+
+#endif /* !_LENOVO_WMI_HELPERS_H_ */
-- 
2.49.0

