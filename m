Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1185E13C914;
	Mon, 28 Apr 2025 01:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745803242; cv=none; b=OH0hLXQEgyW/Ki8fhQC7OaMW0qENDGQcmyezKD2stMlO66q0g7F2EznK+Q2E86mBQDTb5EGR819968WqX8Z65fSji5ZaSvQCURI9Z4jfF95Kukvm9a09BWPGFOV25Ddzd/qLANHxMbymZxs6C0OXjd0d6HkDIOQs3S1H0Tw+X7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745803242; c=relaxed/simple;
	bh=OElKVrbjNApLjrvSJZYK7EM7/jcb59Lls1mo+d6+r1k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vov+WVjxrfzZrD4I6XomeSIGtATxZ8uBflzDWKp/AwcujoYKaPKrzCZ7le3WN+2ANf7us6t2nN9Dbv9jIwOT9RyitUcnboGJI3DIVLZwDCaSXH3PRQXZlJWs8TPlsOwDOmg/v25c3GbIzog7Eh/tI4DN5t12euztGFTUv36jGvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jvkXXBDF; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jvkXXBDF"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2240b4de12bso64355925ad.2;
        Sun, 27 Apr 2025 18:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745803240; x=1746408040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o+R04MbNw40dD3PQcvCyJoVzJoiYmuTJx0mrnHgQXTc=;
        b=jvkXXBDF8UgtgsL+ipUdOSZkQD0U1liS0EkM7iM74P1CwImEiaEytFDy0pFRIsohGy
         JsRe335hOVNQNJjVxzfQ9CgBxrITHEYjNp1p2ELlz15edVn+ky27dnGcpj9p9vyPcGaC
         TPAziUwGCOQ7agh8p27h2R6U82NRvNd2pruI5PZiLpOaWdp2aJ88uPZyerVFIXx2Bm2n
         cGNYVwW2MOcwngCltzxkWotANq6rwqUdCL9b0sDd3zSPq90ZFvfZJJnazPrOS2128D3c
         gBW+kkYkRKjYYlifNpGbmjwVscCal27oh70hxgtkODudW4AqKYVSHkdUI2l0TbZu/W9t
         DhEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745803240; x=1746408040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o+R04MbNw40dD3PQcvCyJoVzJoiYmuTJx0mrnHgQXTc=;
        b=wKILlGyvu8FNKYXGVjcgWKaPXxhoFVsmd/FeV2308DgcUKz2o5Pi5v7O4mGWNxyfcu
         FqWFv8MTH72T56SHTs1ob0bfCr756WwJgZhS+Zpd8SPS2gMxdxBA++oRQiJTXzXMr7mt
         Ighj50Zn0Mhk7dm+DhN6RmTfCekr1eLzdUqQbVlBTOMEshDkr6ZB0QjqEMSZItkmAaWD
         gjUAPs/B/8ZsUAqnQrZzYln6xd+6cPU1/sjQHs8tGVTj1Y5ijkNkm3Lb18ycpUuJZhXZ
         FTTlrih9Yg2+yVVR/o/Rm2r8/PB9LJIFMrBscKOGrLBQfTyT/AIj29Jy59KcaDFOrkc1
         UCvA==
X-Forwarded-Encrypted: i=1; AJvYcCVPv4qFyZwduIXxB2HJ2pZncw37qcBSXAZG88+TS2JCI3NYeZHIgNlZ/blxonImw/E8sDW3ZKl5TFZjVks5@vger.kernel.org, AJvYcCVTxTE8UrI41rbvmIQg1zhz1zjMsy2TjjGXAFFvFElOa3msa7M7OUG93xube+9poiWtwQRXWU+O2Vqrrai9uSASv1ZaLQ==@vger.kernel.org, AJvYcCX33KbEEphWaa/gcKbsIwfmCn9drOminEEopkawliMC6L50puJtW8VBXLIjTpUMdlfbtC44EmxuOuE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx779aRfsE7wAS5bESd/u9HAXED1MCCiFKzRc+vecLxRXtiiC5
	0Tn4K62iBkDLqADeYJF32N4MYfxFHP0XkqX0bwsXYwT9AS81KJuY
X-Gm-Gg: ASbGncsvMDNcaXCWErhqiOOVxGavCUUZvn99EkT+Cc3En3nAltX5XEr7WNXzo6tVhlB
	i+Po1aAkr+IoK4Nj574wwDLM+Bqtn+RYRybwygQZ6aGoTgx9M6sv11F3UuSdXLT3f7ClGtXvvag
	CPaX6tGkN23OGWOWBQNwP+U4/OcqIvLmAecLfTIoCYdECZt/6JAXypkeWlzlJtGpPT3d3buQpEK
	fJOy6qdR30UVlz/8eWBa4xHFXAqpAFcA+j4Y6L0C2U0T+8ZZ9XCrARtd/oJVOId+Bu86vqVOS7Z
	JWXkYdWDn+pSq0one23BPPWUnNCNjImA8Jj8mTYjdsZTx3ysaYmzbC0xUIlPL3Keqr/dAwXM4pg
	7yyFrIr5iCqc6Nct9J4fLRUxHEuqEV/G6M/ciZLc=
X-Google-Smtp-Source: AGHT+IEeD6HYkDnv5qRclvPxg57THmgDskYlVYP95NowCl/47yIJFMOuFpHVTC2FnoOnX/eeDaP58Q==
X-Received: by 2002:a17:903:2405:b0:21f:85ee:f2df with SMTP id d9443c01a7336-22dc6a0474dmr115853765ad.15.1745803240121;
        Sun, 27 Apr 2025 18:20:40 -0700 (PDT)
Received: from localhost.localdomain (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5216ba5sm70334725ad.222.2025.04.27.18.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 18:20:39 -0700 (PDT)
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
Subject: [PATCH v6 2/6] platform/x86: Add Lenovo WMI Helpers
Date: Sun, 27 Apr 2025 18:18:02 -0700
Message-ID: <20250428012029.970017-3-derekjohn.clark@gmail.com>
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

Adds lenovo-wmi-helpers, which provides a common wrapper function for
wmidev_evaluate_method that does data validation and error handling.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
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
index 000000000000..2df0408e2a9c
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

