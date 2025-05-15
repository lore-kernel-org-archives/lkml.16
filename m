Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85BE925CC6C;
	Thu, 15 May 2025 18:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747333370; cv=none; b=Tmy6a2NF1q/QC0tnw/NnaoKpQ6tkG+/l0Rm6JrSSBrGTuUsQKbQMerzkdS/O7R0vIiX78spx0DbaF0W51UN9sX8hqraLhtcf2PWU031Io2/4f1f/xPc0kWF6/dF/PPzRL/PoQGfxDTuZyxyr8POVfFhBJkk/zapQ/WZ3lOtgsj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747333370; c=relaxed/simple;
	bh=tXgKTBn/892rZ2tMjM9+3EwtIYNK+rOqoBg7SiiCNsM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mx67XEV0zNLtmED3tJCf6H4TbyxJjj+UfaWESC6dn+Gb/8v1b1BoDpT/XBzGUV6I6S5dQm+g2Xf2zhmR9Xqqd0jfDA+stt0aMXj7/NKaZqjZKJ9ZMGiYXcgb37toJh1AbX2GAf0Nhy2D8lQZS/ydmhs6B9hGk81soIcvcjo8q1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jz8NVkky; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jz8NVkky"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-231d4679580so1392045ad.1;
        Thu, 15 May 2025 11:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747333368; x=1747938168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MFqMciSe9CHC7te8WAwVbhn13jNyc4r7EUqpVmXXsuE=;
        b=Jz8NVkkyumpS3SJx/5v9/tLO/YIQLS+2owqd7lbs6QCeKZIndCPG4Y68H3SzbYzPnQ
         kLPoSu10TQVEzPwNxcflwQbabuszxgQrafMcOJtSKP7epHs8P88WMgwithuV6k0p2SPM
         GoUjdE3JlrpOCL6dY5VlY7qFa+zaBf2gAQxGX9X8Zq7ccCGVfP/pkBuT3EQgnXiSDZP9
         XkOC+3veOcHDt7qnSQbRrlnlEosXbiZhoC7xRF45lRl6N90MMo93hj+VPxMnG8iLMzpa
         /DeXkIZ6/WassKBydKCsbek+sN+HHHXMYhxHcBbVBYrWgy2QqnMmTpgS4g3buKZJNiiX
         f/2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747333368; x=1747938168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MFqMciSe9CHC7te8WAwVbhn13jNyc4r7EUqpVmXXsuE=;
        b=rP8nYUiiKJd4L6tt9vBeEQJUQWUHAHbK5PBN6+/naFiv99bNdTkGYJD9soBlfs7Kfo
         +O/3o7JdAftSZ3Pw2PGPX0w9Fhp0KagegLLUxQryvmDrtXcqtSuBwtlxkHirRkO+iH7v
         5nDncNqmv10duNAn+s7Xz4aG05N0lJMb/Mxf5NfmKeLjH7io8MfJHntQgtOLqAJFo7ig
         p1eh+wJ7yP6R7iZJhvwrkYKevLBo0il5wlblGYJmwPVuPeBgKjruPevmPIPM7NTiVwnz
         M/iNSqswz9Mkbg2cIADRSk1BGeUlQi2tThgFlhwOWuMv4ZojZErxbgrEZWQswQSibn4e
         9XYg==
X-Forwarded-Encrypted: i=1; AJvYcCWuwUAswvYUbUp7xfG/trNRDeD8A+AitDCM22SohhwFbcKyFp0kkBBHIUGUfspxFvFyF7AmFca01OJw129u0nLqwzPPoQ==@vger.kernel.org, AJvYcCXkNZpqe+Jr9ccj1kTYkoLrhsiDnaFEnF+hEC0iW0xrfFl2Mk5tWfOb0HMnt34nscNpHOnLLFzouA0=@vger.kernel.org, AJvYcCXvqUP/f/e4HyXkYzWtH+poHgRZZ3/UlRPl4KDokrWcsxwjDN49+/M5nIvka6/iC60D3Ju1TUjGlFQLAm0f@vger.kernel.org
X-Gm-Message-State: AOJu0YzhipJn+soyriYeuzdUZT4T7AU15NWIVYUVIcrN26Cbj3qSTlxn
	MX3Yt5qDg4EKpyy+sLLEB+ZpKyqR7Zza41EZGqjngVuoGFnZRXg2EbmS
X-Gm-Gg: ASbGnctImNS98F7OMU/DlGJQCobTnm8N4g0tO7d6c2pHKyCIKoLSI7b1ZH4zkQuPKzB
	ZkpK1uPyZeQJnHwBnGLPkVKjNGaBwRYJ5W+PF3dAHYgS6IJjF9AhwP9zGzgMkQ4qWRaOUyNUSYI
	ghkk9pT0xN6RLIuO/09SMtr1npK3XOb353G2dwmLJTe88fsuNPlJ4ltN8EJO5wGg67k//eQ1VwR
	Q9kyrCZTfs3+wzHJNj6xs9hNyWLK2rrvbtbQLkCfjCjMWFnW0EgfepzOznm1p+d6aIBE9I5KSN2
	nf+57tbUwMbtHnbVSJIanyp+5LRniVWZE7R+uMkcrL7H3KQCixl/mzqFEzmYIQ2a5Rck+7zRUAg
	0sDa4Y00FUqA29r0wbD4y8O2Dn71X7JVfGE8UWo2S8sYdBGNqAA5nZKK99zyh
X-Google-Smtp-Source: AGHT+IHN9vV3YhX9SCAA1kaH/pPnn0nCSeHWXj+8LQ3dDS3QmNEK1/uXjKI2CXeVNvMTP7coDl4jRw==
X-Received: by 2002:a17:902:ccc5:b0:22e:4d64:821f with SMTP id d9443c01a7336-231d4519057mr4867225ad.20.1747333367574;
        Thu, 15 May 2025 11:22:47 -0700 (PDT)
Received: from localhost.localdomain (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e978adsm826955ad.119.2025.05.15.11.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 11:22:47 -0700 (PDT)
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
Subject: [PATCH v10 2/6] platform/x86: Add lenovo-wmi-helpers
Date: Thu, 15 May 2025 11:22:20 -0700
Message-ID: <20250515182224.8277-3-derekjohn.clark@gmail.com>
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

Adds lenovo-wmi-helpers, which provides a common wrapper function for
wmidev_evaluate_method that does data validation and error handling.

Reviewed-by: Alok Tiwari <alok.a.tiwari@oracle.com>
Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
v10: No change
v9: Fix missing newline before return in lwmi_dev_evaluate_int
v8: No change
v7:
 - Fix typos
v6:
 - Fix typos and rewordings from v5 review.
v5:
 - Fixes from v4 review.
 - Combine all previous methods into a single function that takes a
   buffer for the wmi method arguments.
v4:
 - Changed namespace to LENOVO_WMI_HELPERS from LENOVO_WMI.
 - Changed filenames to lenovo-wmi-helpers from lenovo-wmi.
 - Removed structs and functions implemented by other drivers.
---
 MAINTAINERS                               |  1 +
 drivers/platform/x86/Kconfig              |  4 ++
 drivers/platform/x86/Makefile             |  1 +
 drivers/platform/x86/lenovo-wmi-helpers.c | 75 +++++++++++++++++++++++
 drivers/platform/x86/lenovo-wmi-helpers.h | 20 ++++++
 5 files changed, 101 insertions(+)
 create mode 100644 drivers/platform/x86/lenovo-wmi-helpers.c
 create mode 100644 drivers/platform/x86/lenovo-wmi-helpers.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 675f4b26426d..aab59a777693 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13164,6 +13164,7 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	Documentation/wmi/devices/lenovo-wmi-gamezone.rst
 F:	Documentation/wmi/devices/lenovo-wmi-other.rst
+F:	drivers/platform/x86/lenovo-wmi-helpers.*
 
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
index 000000000000..2ed4fdf48d0b
--- /dev/null
+++ b/drivers/platform/x86/lenovo-wmi-helpers.c
@@ -0,0 +1,75 @@
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
+ * Copyright (C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
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
+ * Calls wmidev_evaluate_method for Lenovo WMI devices that return an ACPI
+ * integer. Validates the return value type and assigns the value to the
+ * retval pointer.
+ *
+ * Return: 0 on success, or an error code.
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
+
+	return 0;
+};
+EXPORT_SYMBOL_NS_GPL(lwmi_dev_evaluate_int, "LENOVO_WMI_HELPERS");
+
+MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
+MODULE_DESCRIPTION("Lenovo WMI Helpers Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/platform/x86/lenovo-wmi-helpers.h b/drivers/platform/x86/lenovo-wmi-helpers.h
new file mode 100644
index 000000000000..20fd21749803
--- /dev/null
+++ b/drivers/platform/x86/lenovo-wmi-helpers.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+/* Copyright (C) 2025 Derek J. Clark <derekjohn.clark@gmail.com> */
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

