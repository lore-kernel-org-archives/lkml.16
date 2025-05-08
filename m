Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A3D231A3F;
	Thu,  8 May 2025 23:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746748347; cv=none; b=g+2nzPfvsUV8mDHUMNbT12TpjDp7ZoN+m0U1Y7HYmSlwa/pxeEJeKL9L+52rwLieu70RBgxHFjpqLviwhUoI46QfxrBPRcrxPB5DpEyAM/7Eah/9GgZ6/Uo+sGaI+BCfCDOBOepFrr3K5Bw7qvq2/fYG9NV/kQO0afySOryfiVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746748347; c=relaxed/simple;
	bh=ZV1ijv+ZYs3dPT5hNoQxLAimGT/1Je2f1IfhfepdcNc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bZgTyvYGuvL+Rt2c1TUhWt8Rp2Mdi8E72ui61jujRjhpHzgEeqjnwFiYlbQFWWQ4nmfSZ3QqLMPBS1WOfjx0B2hgcTw4GTVmnqZEjV5CTZaxFD3/cidfXRkImnl7h4sc/yhsjW7qKbOIkByUnHfSLo/9AHw1oHWTE9mHs3eOM70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gUYkXVto; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gUYkXVto"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22fcf9cf3c2so1503585ad.0;
        Thu, 08 May 2025 16:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746748345; x=1747353145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9FiPmJtwYxQhUFhhbTzr7/TslCsM/ONCaJmIJ1V2F6g=;
        b=gUYkXVtoBHkfX65xsj2GeR9yYC07NQCr/vtJOt4/IIPhYjxHEBZDz1Kt/vm1zxEnXw
         6+25QJpMZcwMOruRjuPOZO0uCmJSFOGJmq0aDyiZURHArEXbiog+hhZ0gXTGSn5WAZwm
         bVCeRDIsK8+MYDUk22u1+o8c+jg+N/JaYCEavuM6XeQ6q3IDJKR+900Hid1TdWv5p3gg
         We6zRO8k4k63MZNWfXhsRpVGNdTOVvDjQbzqNYv7w+Pg7Gw1Few2LVtVCiIUGGG35mab
         zzCXYsFIaFDeQtIxu4Zdpa79YeS6gpgMNwwTvLyAHiVr6Tnykv01wgu/6BVQzRxouKX/
         f1BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746748345; x=1747353145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9FiPmJtwYxQhUFhhbTzr7/TslCsM/ONCaJmIJ1V2F6g=;
        b=AleLto+fDM1jezha4FyVznw50Edt0YaLpu2Aln7A5JPzBYxzlPhTQj41oM5xYntD3E
         2hQL2jt5Mqy6L9CZbp+oxj8/szGd/BvjqnYqhm1MY1h04uYdJvh2yaiz09HfLIw5z2nL
         Tv1v8k/koXDH/+Zj5H35+KdIwnBONHgL0AXXIj4eVa+oze1cz3nJY7MiGObJRcxAzA8M
         QZYFYcnjiTLtCpBVnjO5rU4QL9hO1Zk29cVcH2BRfpPAD05FNDhceo2nTZ+85F9kg+r2
         4jIStz8Sjp/ddRyqcv/nfikUaUj1J08g5vE85KcnHHixkse6l2cliFmfOOyVXcjmreL1
         jR3A==
X-Forwarded-Encrypted: i=1; AJvYcCUNTkPoUrSQ6GxyJsJQ9V2LK9iAE3I+Hy9U+aWRpZ1gTS5h332BoRQjAJbVxSqLsdqt2/ufytsAP0RwY+9LKswz+oXTJA==@vger.kernel.org, AJvYcCUVV0uHi44+K44VuIlPM7ImumkIjvBtfgV4ZTTkCoXgXxOExBFP7sfqEAq2FRyGlkj8Az9C20jb5ijNm9hU@vger.kernel.org, AJvYcCUyOaA2dfkpl1BQFcopNN1BkEbC/LEc0oWLilIpsCyfYnrLG7rqCrY1IRdGN7ypkiDrOiBtntNT160=@vger.kernel.org
X-Gm-Message-State: AOJu0YxX8aMi0PRkQITJeIYz41r7w4jwCY5UZlUy1JQWVbayZmdbmcdP
	Rp7zTYiDZSCloa7KajKRvmzTPAzSp+BdcKqChj8Sq4t8KYC+G4V+
X-Gm-Gg: ASbGncvlq8Y8Ux4dS7quAnp+o84/NIxKJOy5Por+VMid8JJPP2SlwMSsFyvF8P8MOZL
	9oJxB3llCsjDnF+Trg23Wbdv5XpGVkpt56Ac4kjlN7E8ZW/1xzFBWuKr2foLiRTHfvTSky5D850
	goavU8+88VWOscV6CTE/Jq6BmIYGc1YTnTK4kbKXVmgMwupLBmft61S1loGA4029ID1xjoTC0bM
	AEZ01ChF7YjMXMvKNMrjGiWUebh3GdLfxV25cCcQl+YHnrnfJRN6dx3J2lZz4H1QMp4lYAdim66
	5UFdU8qf/wNcWKx6AYdEtt3cmhJEq6EaIGaCwl79FddwJxrwgxJM5naL4txkRb1eeRrCjmIs+SZ
	9Oa83O2aQ37SBf9dBW0B1XSxA5WdohUY6MWDSXEhBW2YWVHZtgg==
X-Google-Smtp-Source: AGHT+IGQtVi9RimefARDRaFCwfGbhOx3PsmbXf+i+5pj5YofwFjXF8MJ0dXY0uxYQAVu1XNYKBqv4g==
X-Received: by 2002:a17:903:22c3:b0:223:6254:b4ba with SMTP id d9443c01a7336-22fc8b60ae3mr15320125ad.13.1746748345014;
        Thu, 08 May 2025 16:52:25 -0700 (PDT)
Received: from localhost.localdomain (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc680515esm5844615ad.0.2025.05.08.16.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 16:52:24 -0700 (PDT)
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
Subject: [PATCH v9 2/6] platform/x86: Add lenovo-wmi-helpers
Date: Thu,  8 May 2025 16:51:35 -0700
Message-ID: <20250508235217.12256-3-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250508235217.12256-1-derekjohn.clark@gmail.com>
References: <20250508235217.12256-1-derekjohn.clark@gmail.com>
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

