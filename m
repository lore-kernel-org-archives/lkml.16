Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0D61DEFC5;
	Wed,  2 Jul 2025 03:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751427518; cv=none; b=C4OVoPc8p5SNWVlmBGkT3X/jHPo//lXkdaaG4NG/KCGWx9BwZxSsOVAki38+WDkcux3sPSovcQiT42c7JkX7ONm1DnfoQq7rXHmyCsPmb4rmMpALRMr1DDhdSvj9c7dqqwNsnCv43qPo0hUapgX1jTIkYmV42Qm696wNBsA2EBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751427518; c=relaxed/simple;
	bh=X6dhvs+dX1KYOy99PeAYM3TOgvkDxZ4d9AZJQ0QPVSE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nLf47HwrfOfJ40qLum7CNYH7S/omRjmYTzlFCL078JbvV+zD2LSv+BC9HFkZK78dJJtY61mXP4v41l1l+103laRad4ypv/QqhMqcDXT0SXGDREGiuANhASOLaGoSrcAvcAWjAl1Vj40JJlp57d1BdM3cJ2TvsMA2WQPL/xLO2lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ISji5JSu; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ISji5JSu"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-742c7a52e97so6337517b3a.3;
        Tue, 01 Jul 2025 20:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751427516; x=1752032316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iRC31Hg8+GiKl4jaSDHbF9Mujqfkmw958SdLk6uIIoU=;
        b=ISji5JSuC6hppTh14x7Ph1o8Qts1Ufp6XV/XrMYtB90Y8ArK4YeoyI2yq2ZiIU6f0S
         W0Azo4aUiHX30XTfwgRnSctTCSD6lXbLVLEx32iFqA+O07vGFWV6BHcKFrrv3jZOd8hL
         V4tguUReGEYbUPkhguHdEgn1tYQ/1jL1OVBO2//5Ga7SkJYrOgjHn6ehgVsGSCMD6A0Q
         M6Uk/NYl29LeHtyUqxPdp9WXEidI8ZmeQJ67IYCyxmvtRK3suiAwWO+nVqGRbEzeBXbS
         a60jxXDOodhFrmKmcP3MI+WfPHv0whWBXBSxZnNyrUFRSNQShB/ueoHRKIL2MvWVTAjK
         DauA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751427516; x=1752032316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iRC31Hg8+GiKl4jaSDHbF9Mujqfkmw958SdLk6uIIoU=;
        b=EhxxuFC+agE3+hlHQ9Ky+41B8JanDONg2OncSFCN0ld4bbvj0rY9tEk479n+SaxAyH
         qcZvOq0S3nmzwd8ohUt3sCDdG21SCfFG7fg8vixz7Y+69WUQzUxBybXNto22AG6UpIaq
         /xt6eCI2/VBWAFyHLBcPiAu0QG0J34820ZzaCjUxnV4ZDIZAzBgk6mxTugvHzO28gXy6
         NeIJasLOqj2NhbmzowiEZ5b5uRnBe50KdvckQp+hLc3x6JXUHChe76tPCImaq0yx85Z/
         WGJbR/rjxYf/oCVIDfll/KV3fpMgb7JkUd60h0Blh05rpDPbE32VkXblGyqIdJCS3wYd
         Wxyw==
X-Forwarded-Encrypted: i=1; AJvYcCVUn2ln+Be0Dy88I7nso0jH66kqNUhFtVWJ7wTyLtDD65Wq8uRON83olWBsbwiEMSw9xeY0zSMgW2Dluc4G@vger.kernel.org, AJvYcCXGUXliYhrxpHJ1qR3XYVL37RfxQOgrZbvOhsJ4RfThC0FemFkElRVlx4gMvDqPjyyu3j0zUvQOQM3ZF2L1qythyc/QfQ==@vger.kernel.org, AJvYcCXqUhEsZZxqrnXgKjKHL/0hczXmIvK/QtFrR17Thv/GItOsz9Th87RVcK9SRsi/JRrtO+a0KxAEBlY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeYYWlgnPD6Sp9Fk4uboJg0fPE+lWoRJLpOlk4bvQ1hHRhbvTr
	OD49pTLuADeNZFyQD4ZzmxqMC9wKxN6Qvxmu0yra/tXSl788oiD6fnP8
X-Gm-Gg: ASbGncv3slxJNFOpGp9rzBNPD/ajkXi18fq/nzp4FdaiUrjEkOWJRFm/3q2QftZdF7V
	FXEx+ZpESnfy+8gbADF2Xu5IadyNx1iABS/RhcQXZs7JBWJ+xb3BnPT0zRV3SOyEkdnMc509b1m
	umXgv5oW3nvNWIdJJNbOrtq9cB62vp6Ml8eWPrIdjmMwxObC9puHHMDbz7J8XCqC13CDyt3Xb7s
	2dKHSQS3t750TsY7BTDirAF1ZMIZgn07BUoARBFpSqqRoI1L9ymW2b7Kr+RGNRZUKgpMACPoepH
	WuIOaAOPYNGi+OvsuSee9scT/9FAO2rbJJmg4M4Q+GT+LMpFUX5VZhJA4qV9HvNnRjHJbO3B0IM
	aEeCWWlEaR0hhDMX+NT6/6f1khSj/MACEQ0/vDD9xaTUKORi4PPiN
X-Google-Smtp-Source: AGHT+IGB07kSHarDlzJTOMH9bv1YcCX6mrwnW0FiOczboaS0I3PUoLx0QX5N3Wn5FPgz/IfSWc9B2A==
X-Received: by 2002:a05:6a21:7a82:b0:222:d62f:761a with SMTP id adf61e73a8af0-222d7f309bamr2225853637.42.1751427515731;
        Tue, 01 Jul 2025 20:38:35 -0700 (PDT)
Received: from bliptop (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e301d64fsm11783008a12.19.2025.07.01.20.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 20:38:35 -0700 (PDT)
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
Subject: [PATCH v13 2/6] platform/x86: Add lenovo-wmi-helpers
Date: Tue,  1 Jul 2025 20:38:22 -0700
Message-ID: <20250702033826.1057762-3-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702033826.1057762-1-derekjohn.clark@gmail.com>
References: <20250702033826.1057762-1-derekjohn.clark@gmail.com>
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
v13:
 - Move into new lenovo folder.
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
---
 drivers/platform/x86/lenovo/Kconfig       |  4 ++
 drivers/platform/x86/lenovo/Makefile      |  1 +
 drivers/platform/x86/lenovo/wmi-helpers.c | 74 +++++++++++++++++++++++
 drivers/platform/x86/lenovo/wmi-helpers.h | 20 ++++++
 4 files changed, 99 insertions(+)
 create mode 100644 drivers/platform/x86/lenovo/wmi-helpers.c
 create mode 100644 drivers/platform/x86/lenovo/wmi-helpers.h

diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x86/lenovo/Kconfig
index 05dab29a22f7..abb488889834 100644
--- a/drivers/platform/x86/lenovo/Kconfig
+++ b/drivers/platform/x86/lenovo/Kconfig
@@ -232,3 +232,7 @@ config YT2_1380
 
 	  To compile this driver as a module, choose M here: the module will
 	  be called lenovo-yogabook.
+
+config LENOVO_WMI_HELPERS
+	tristate
+	depends on ACPI_WMI
diff --git a/drivers/platform/x86/lenovo/Makefile b/drivers/platform/x86/lenovo/Makefile
index f1aa2449293b..a347d657d235 100644
--- a/drivers/platform/x86/lenovo/Makefile
+++ b/drivers/platform/x86/lenovo/Makefile
@@ -12,6 +12,7 @@ lenovo-target-$(CONFIG_LENOVO_YMC)	+= ymc.o
 lenovo-target-$(CONFIG_YOGABOOK)	+= yogabook.o
 lenovo-target-$(CONFIG_YT2_1380)	+= yoga-tab2-pro-1380-fastcharger.o
 lenovo-target-$(CONFIG_LENOVO_WMI_CAMERA)	+= wmi-camera.o
+lenovo-target-$(CONFIG_LENOVO_WMI_HELPERS)	+= wmi-helpers.o
 
 # Add 'lenovo' prefix to each module listed in lenovo-target-*
 define LENOVO_OBJ_TARGET
diff --git a/drivers/platform/x86/lenovo/wmi-helpers.c b/drivers/platform/x86/lenovo/wmi-helpers.c
new file mode 100644
index 000000000000..f6fef6296251
--- /dev/null
+++ b/drivers/platform/x86/lenovo/wmi-helpers.c
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
+#include "wmi-helpers.h"
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
diff --git a/drivers/platform/x86/lenovo/wmi-helpers.h b/drivers/platform/x86/lenovo/wmi-helpers.h
new file mode 100644
index 000000000000..20fd21749803
--- /dev/null
+++ b/drivers/platform/x86/lenovo/wmi-helpers.h
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
2.50.0

