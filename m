Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8ACEACD;
	Sat,  3 May 2025 00:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746230513; cv=none; b=nsFuD0oD7L1b/UivCVw5pC1E4MENGwmaRtilUah5PbX2Hg6OSKa8GF1wLBDARjAGHCWLokOZF46STAHz+cuvRY/k7ukCtIf+8c0N5q8+qptuW+cbHctgWUq+OgN+mmxhjzMPCUTGx72N9O77Lblcpp0SPFgbsbfwPl2bYBGb5WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746230513; c=relaxed/simple;
	bh=MvjZVThMV/e6WUSn9X+KdxZGY8xRWy08ycK2qkhOdww=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B82fN1iFEuSHH/wXseIACG+guBLSfpQgLwxmhdrM45cwk7UjTzaWQnmxqUIYp9pAukzTfL3zwzJGhU/CMU+Eb0QZcibMjtKwrRcFfLmOfbGd0YOZQ70/aaZvvzD6uUp20PsPJ1yBBZVZpkiDH+tU6oB0JfxoumOboGG2lMWwUMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gv4rsybK; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gv4rsybK"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-72d3b48d2ffso3020549b3a.2;
        Fri, 02 May 2025 17:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746230511; x=1746835311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DvRC90+rBYT7GqUkjZjsDX+hMAgWVfBhe/ELy/1c/9c=;
        b=gv4rsybKlb71rETJ1mqRyXQexL45v6WFJi/pQws33Xoia/PEi7VXS1490S3mvPSdT5
         Jw9amcTkR+6VlyJdJwHjgRP/NcTXAtv3GD3UxJxQ+x7ZQIpK1mYFHsyazckteldGOewy
         kFC7X2MDKRLuZBzQIwQ19ArZ++sRqLst6ZQ+I5zW3cYQW/kdlDHQ3Hj31VE8HDVBT/EM
         kUQdfcLMXNvqRKOVdRdz0GHbWohTDs5mLZrw1bMEbPHXVfZ6PF2sb71weHFYeCrMrmvg
         jF9KBHQAcZw24vVtAdpxa46XLUL8Gwm4+s0sdnqfvWKYUuQWbj2dAov5TUEZIR1nDoC1
         xptg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746230511; x=1746835311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DvRC90+rBYT7GqUkjZjsDX+hMAgWVfBhe/ELy/1c/9c=;
        b=L6PBtKYW5BPl9vzllqTHQWjPlKqHrgu05Fhyiih0MeKcy9kGc+hHb7hc8HsflFpAEA
         U6X9yky2LWZAIGUeyWCgotx9OiRhMKwOPjXaSO0i9HA/rcX/8KBtV7PtCKYO7/OTmwRs
         pWXpAXP655CoZ85Ew1ozR9+e/R7nPps6rZYcuQg+xCgbR6VrgHIjLUYoJr55zMj0hv8F
         mWEko+3l2O3v/GEbr4vlFNZmysz9Tn+Fglthi4Iy+8uBuh8DD5S5zOcGwZ2BpWiEbXVa
         oWNEC1qmCphWSRZBUnX/DX11fo+ZD70Yq+9aEitElTTSUihNG2b7iF6IWiJ9hqpK0+uL
         FcUg==
X-Forwarded-Encrypted: i=1; AJvYcCUUxNg/7BSzdGKhhGP6I+FG1sY4GSgNB6ksfVMFp/+LZTDfFsR7qYavnoq3BUZkZYr+qQ6SC2Gqf3KAwM7l0khtVTrFTw==@vger.kernel.org, AJvYcCVOuPd/NhzR9IjpGaHwKI7xt1NdK6+jLAjgPXbCm/W5VMq3BygS95NAb1Bm+utmCoX0hyE4vYWoGRs=@vger.kernel.org, AJvYcCXVXmZSYk5UF+8CgoCllNRIksAxuIwgS5lmp9uPMoBdaOXeTaBR7MoyB8GAuJC03Vq6o+sifJZEHvrdoK51@vger.kernel.org
X-Gm-Message-State: AOJu0YzzGDcQ4UjQBf45Ps8K5rNjie2wpmGFIR7pyc8k8g64uQ4JHkoi
	os2oHT9qQgFARBoUdAMM3yg1fQG7N3dxsrlwd0D4CyZq/2/CE2Bt
X-Gm-Gg: ASbGncugtp+oq3txVxpK3IKozQbnAX+YrQM7leLdOppMX34TcHLzZ1OG1qhKmtJOhzl
	S2WyQC4XwYB0QvaP3NM/a5dDAMlMKpUjrAVGypudGBC2uZ/i9MndcxaqcGjXG/GmwBs4QxkiGgE
	wBzJG5uPk2RxtrfgOhKf1vTKS1Iz17x0tXsyPQXQpX+daPZUQV87EgDu1KUrkhZxrMNqujP8n6J
	bZ9hx+pTkMacQqxKDl8+RmbYo1NjdqcosnDxgEB8qdO7YI9l2PKKJCjtidFTVmciJnhpuboZ/rW
	gRAV+N2bI0qVijAnaguZv5nA77mT0blKcVU7L99ZUBc8BAOGhu2uM7tKs/Kdb/ykk4Ll6AY3/iz
	J/M3dDcHC10p/fEeykEO0uo0WelVKzvmJQtH02/hJfHhc10LxSg==
X-Google-Smtp-Source: AGHT+IGFYLawVK/WXysSuyUqRjeSjzFy5Ddf3h1k4vANXAVSQAwswiu8eS1CrtaB65U2Ti8alTzlrw==
X-Received: by 2002:a05:6a00:4c14:b0:73e:1566:5960 with SMTP id d2e1a72fcca58-74058b0aaa8mr6886607b3a.19.1746230510664;
        Fri, 02 May 2025 17:01:50 -0700 (PDT)
Received: from localhost.localdomain (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058dbb0b5sm2206680b3a.41.2025.05.02.17.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 17:01:50 -0700 (PDT)
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
Subject: [PATCH v7 2/6] platform/x86: Add lenovo-wmi-helpers
Date: Fri,  2 May 2025 17:01:38 -0700
Message-ID: <20250503000142.1190354-3-derekjohn.clark@gmail.com>
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

Adds lenovo-wmi-helpers, which provides a common wrapper function for
wmidev_evaluate_method that does data validation and error handling.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
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
index 000000000000..93aded3d24e9
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

