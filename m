Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BED54640;
	Thu, 22 May 2025 01:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747878839; cv=none; b=pXsd985KOCb2uhafzTki+Lkq8tRLbOLGT01QX5fiTdDkOLovxNPB6NThvlOF+IIvtyX088aDPgZTe7pp6Hjv+MoSLNlcjDwJddyD2kzL/km3oSfPq90lAID/842uHBChxf06RN78bFcwI0q/TU7MZP80u6+u6WU7yL+EvbCR3Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747878839; c=relaxed/simple;
	bh=LJOMEG1cRga7I33whsr4Tf9Qe27uZ/xJ3bIWGYZLZmU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n0+T/8G13q4tFSk0dqtoYaB9NC2GnjGdI+y8lDmLsQNQyA4LzTl37oIkPw6I3cOilOfDtaEnEHp64ift10b5XNkVG8t7HQjCcWt2epmk3CqTq04+XLsls5jKLAdeopvFWuoFgcipdIzlwYJkmw0AOaXOI8zL4jda+eNA2TJ4j6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lU5p6fdE; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lU5p6fdE"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-af59c920d32so4664176a12.0;
        Wed, 21 May 2025 18:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747878837; x=1748483637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ezv9dCwmSiidD9fm43/jQatMP09jNR75GvJXzpZvLg0=;
        b=lU5p6fdEJzgrSYMSPNI2pjrUK9jS2a5a7pDZhypQ0FeEkLJMwteHvmZOa4hNXiYCtT
         lHpni2W1o0pCeXf1m9THVJvHqpWGpn5G4zIT/oZA+Zo8L7cqzf8aawtFP64khw/mR7O1
         nv21NNubZvM51rfGfy4ZI46Gsa/vUHdKVKUEIZ8Qor7P5bPMKAUfxh2t/l8qpdhiWTGE
         BY1OpuhqyOGaILid4Fr+lveQBCAhkA63o5CJEYeUt2KnoG1IbaEfm2yqPk7NTpJ23mv0
         H5dKU8wt6iqHB9E8SorY+tl2jEnu4Nb0xnBQhoEu/70RCPWloeFLQmZ0IOmg/t2UT0kE
         ng0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747878837; x=1748483637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ezv9dCwmSiidD9fm43/jQatMP09jNR75GvJXzpZvLg0=;
        b=sebl7puNnurlI3NxnfD/TtI2jOFNOMxRr/dAE4ODyHCFts0sVfUWs/Ji7BShTcO9lL
         e7FyGaVVc4E8F1Pz7mkPEHnHdEK+aX5w0nR/JTyY6TT09O1MV+Cb44IXCA7brzG/QEva
         WVHTbyfn+5E3MuVsMQvnSzdA/dlD02nrWDHKVOZXXqwflBOPrm8ZJPdYP2VYAhkOAEuH
         4jbFsCOM3bOu3dM+LAPReHSFcIUtT2MUTz8Mt8hmcgknbht5cGK4KPNpEngJG09pBl7A
         mYWYjrmfI0/TwLkzmUZHWK/5dpj8L4VLMhCzkfmqQs5R6P6g/vWwQJaHpoC6f1fo63sp
         EOCg==
X-Forwarded-Encrypted: i=1; AJvYcCUkTxFMs6YPvLkz/S7fb3RhASr6ISaleW2XrL9m55bTSSokTp5f6dtHCI/x9+eisQSE2wDuF1LClohxJmkzjpW2HPGiBw==@vger.kernel.org, AJvYcCVzlsfdq5xGstANos9s0L7rzfZBH9lLyrwkuyMrFvXEQUS6MayrE90B7gST40Jal6uK1UIm1cSJnY4=@vger.kernel.org, AJvYcCWhkKslEiOSuG3lSFwUhRF3f5SOsa3ey54h+H5wYLj2LLKTg1axmWgMgUHoWwpDEglqNLGO9GYpMFVb6IsW@vger.kernel.org
X-Gm-Message-State: AOJu0YwOOhWWtgiC56b/n+xliQHzMT/ceWPpSbQGTaxp2sb7NBwpvqvw
	LFCLY/ewPAtl97qE7PKXoiD3bWRazxspN4QGo356RDRQJ7utTmLnKGN2cbLnWHrLbHE=
X-Gm-Gg: ASbGncsrZtPVfLImgj+vX9fdam6/1tdF2aZKOtWlSc9WfGmLnemKZvRbcJRYvHNI+Dp
	avSZcfYgK9oPLB1kpJIx1INkfLl8UiKF/hxi2ZASOT6ZSMqJSp/wqErda4OBL6+DMs3qOnZvJ9E
	Bx9RcT6bTJU6nAq3lGn/VQz1y/XUE2Bm8u0aHlEIIOidG2F32SQDG6+f4QNEg+S0hjZVqIfQlDq
	EU50GthvMmt2e9GrVMd61568lQgrOE8jnRUXle2FVb1ZLA1HcgjSMkM5vSsKgmAn8NXJVsb+WVY
	eWSAR+PvJGQyrVrLSHA1x91fbvnP3aSia20wFBC9Lt2ig65rRVHcakG3oBA/vyYMfofS1vcfCwH
	YLHq5nrUWoRdHL/3CjcWJMk3WxsVrQ5kF38M8YWjOMU8BbduYmQ==
X-Google-Smtp-Source: AGHT+IFyQ7diFU5uPnSmMQGvxpDCjF7DuN2RlbXvoVTVsVZENVTyPQaBmituhCG7F48Vvy4Nb4UJGw==
X-Received: by 2002:a17:903:11c3:b0:223:47b4:aaf8 with SMTP id d9443c01a7336-231d45eeeb0mr285083535ad.52.1747878836927;
        Wed, 21 May 2025 18:53:56 -0700 (PDT)
Received: from localhost.localdomain (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e97347sm98878225ad.116.2025.05.21.18.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 18:53:56 -0700 (PDT)
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
Subject: [PATCH v11 2/6] platform/x86: Add lenovo-wmi-helpers
Date: Wed, 21 May 2025 18:53:46 -0700
Message-ID: <20250522015350.471070-3-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250522015350.471070-1-derekjohn.clark@gmail.com>
References: <20250522015350.471070-1-derekjohn.clark@gmail.com>
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
v11:
 - Formatting
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
 drivers/platform/x86/lenovo-wmi-helpers.c | 74 +++++++++++++++++++++++
 drivers/platform/x86/lenovo-wmi-helpers.h | 20 ++++++
 5 files changed, 100 insertions(+)
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
index 000000000000..4a194aad1ed0
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

