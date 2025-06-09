Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B908721D59F;
	Mon,  9 Jun 2025 18:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749495044; cv=none; b=mcPiTfny3BjIpSL9SZeoDX5pQqhl1jTNsQn5HXpml7H6xi/s+UUcKMst0P1y+8rcnw/DCH7qMltitmyHdpgMpIgV32/PsyHBztvvWODtWFK6Kzm8xgGRr3XSsdOZIoa5AYRxz2k+fwoEBgrmQPaQV4HIEOwPLh3jSalEbski/4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749495044; c=relaxed/simple;
	bh=u+/CyxkUL3IAvAwY5LdmiQ40voTD+M44r85jes/2Ds4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R8kz96TEoQcKYlTwdNGzz5+V0lGRR9TPvBzkfE+duGeNJ+GO3rHo1wMaoIE0m26gTcJU+ZhUEDBon+JQINOvjFZyoGq9I/bowwwzg+6Y5eJEcMw2H2lznkerAvADvHMFNCNg+fa0R6mXIwb+/5GDz9QfnmMI2Yxi+NLvpCxeQP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RGWINMR6; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RGWINMR6"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7426c44e014so3986786b3a.3;
        Mon, 09 Jun 2025 11:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749495042; x=1750099842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c9FfnHIFBA2MD94nLdUWuXohjn0JjUIknhsKae+9ojc=;
        b=RGWINMR692XaKzUSeds7W29ezPWbn+rNq1ZlLOhmclKT3C26weOYfz6M0Mz9I1O/fP
         LxH6v1DEyHGOAm+RVdxTz+/FkqC9XO/erokR1g5WEwLO/RIp7X7Xk6GZAezRBl4207a7
         Cv5qft40eZZx93ZmmspP6DTDJhoXDdAK9ZGik4jJyAww1y+FJXmHryRttY9CxEUN9N28
         ExWOnsw7YCdKq2yp8xGPl0Jxde5Hf9WV561xmHa3gynsLtNBMw1xCOkf3L7KBcpNbImb
         /xULMBa2Twnbssb6j4eRTYhWs2YvXoIP2pVfgEs4tuMuYUIVvvtUZvcZqQ/iZsUdbWYt
         S9zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749495042; x=1750099842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c9FfnHIFBA2MD94nLdUWuXohjn0JjUIknhsKae+9ojc=;
        b=CkKaE4nmaBfev9BWdl0SBUC9sIdNyWwyveeJUbi1wNqD3v6aZ0hxSGOYTj0koMrlA0
         ANKYPObiUSDCI9dmOQiUl+ZZLr9GJjnW3ZlGhIJ5yTIzKirfWet6t234m9n1klPbacBX
         9dJeqgncjHkDydLS0PwW1j1t0kaa6eA0j2EcdOwJrWaUJrVvzxWP8iksaXzU91tb5umP
         4AaFNaNaA6wVEV2Ba0TO5hkbn5WyrVTd2hhIW1/pkd/s6hIg28nikJ/yFt99p6oFEYwq
         SsZp/3wDsX6jb/YvVRF1fLTT2nfQaOcruLb7eMspZRDK/VMTHI9/kEqeiA26hrPuHQv3
         Ygfw==
X-Forwarded-Encrypted: i=1; AJvYcCW7cQthxQEKD4JHcB8doQoNatEDl0/Scy46jfVyE2lVvdLVlV6pPirFuZO76G2aQ5aNE7FlRKgynJYfxL67@vger.kernel.org, AJvYcCWZXqFFM79/XO/pW4NiY76ZFqja8fCvI3/wX2aecC/gV5ro6GreKyUa30k/hCJpYyDdD7iwx3U2iFNUQfnrY6S+20q22g==@vger.kernel.org, AJvYcCXnXjBRO29nNZlLetEAZLueUeuWpqVwCkMOtwZr5Jc0IAqBHMefPjdGlL5WkUKkmHBFnOlzQomWv+I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2Vc/LCgw39EjgjPfJy8Upx8aejckyUL85yHanQ1pfvy/8r4xf
	vuSCtY7sdon4m9P5hfMPq4egB+Gz2RhEmLJQetOi8JC3CJ2WRE8S70H3
X-Gm-Gg: ASbGncvtIOt7tlPCEYrM2QyyJwx7jQa8hLp8TsfMF/nHji52KubGD48kT7uT+9YBlZq
	h5X/Ncyi5z6eyD0FaltR9ldnVhCZNTjay3DxWKRtyLbZukxsdRk1YbRM+HHovvKfnFKWweEIE37
	OIC6Xe2RTRpI9Np0wxBBUvVm1VypyRTjleMZRP3lYJ/6OsWefSSa4ycXSBqSz3MWXGxZRyL6okb
	bkBXVH2u+nUx0RCx9fVtuQQguNdhCmapJOoTuv7wEnlZKF3b6UWlpqZ+TQzbFLfaJO4K7vA1TtC
	t4Jbj0AEKNDJ7KpUuPwCF+Mkly6ZyBv10wMpJtGfa085v7j4tymN2X45YJyxePhkJZaqxd4fbDA
	WIwUG16k+0r3R7XI2hXV1MsWiyyCNtTbvHqt6LeIRRc/HDuQ3WdXBreZBCuYu
X-Google-Smtp-Source: AGHT+IEE5wpuvnsZnRK7wySnTyfpNn69kEFecxU3Jae2ufbcuCmJCyMn7c4E2mZeIDzLw0qCIRPrAg==
X-Received: by 2002:a05:6a20:a12c:b0:218:bcd3:6d2e with SMTP id adf61e73a8af0-21ee68a40e9mr25562018637.36.1749495041860;
        Mon, 09 Jun 2025 11:50:41 -0700 (PDT)
Received: from localhost.localdomain (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5ed58e9bsm5625461a12.10.2025.06.09.11.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 11:50:41 -0700 (PDT)
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
Subject: [PATCH v12 2/6] platform/x86: Add lenovo-wmi-helpers
Date: Mon,  9 Jun 2025 11:50:23 -0700
Message-ID: <20250609185027.7378-3-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609185027.7378-1-derekjohn.clark@gmail.com>
References: <20250609185027.7378-1-derekjohn.clark@gmail.com>
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
v12: No change
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
index 36bd0fb5d982..e4079b02ec19 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13453,6 +13453,7 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	Documentation/wmi/devices/lenovo-wmi-gamezone.rst
 F:	Documentation/wmi/devices/lenovo-wmi-other.rst
+F:	drivers/platform/x86/lenovo-wmi-helpers.*
 
 LENOVO WMI HOTKEY UTILITIES DRIVER
 M:	Jackie Dong <xy-jackie@139.com>
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index e5cbd58a99f3..8446cbed34bb 100644
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
index abbc2644ff6d..ec6bc941091d 100644
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

