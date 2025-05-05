Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE0D18BC3B;
	Mon,  5 May 2025 01:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746407229; cv=none; b=ja5B9m7R8M274d9jrGtL1fULbm0OUbuEQwb0GavD+CjTFeZhbIoDDZZNVk0vZQMyq0ZR43FzqKb6V+soRcWOZIQrBn+f+uw5MaAJYgxcmy1OPw5501WgSk8JktGe/RdV6Cd4VFFRyONv2n4/FyhBMvea05wq41NLopoPOloXdV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746407229; c=relaxed/simple;
	bh=SOAB2a6FaWpq981ZTn3fyDr1Zo8qvhWU8NqAyZ+TCHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pwjFLHk/6H8fSgg0EROnFp5mGV1+Zg1gJvrp5sujnhXsBtKzWhE+65mQpUyrXEUOXu/9v6UQ4UKWK3o8oZng8OBJ/Gh9Csm5UmOguMFETV1glRWsCAWebkMaKdAMl7Ez3iDJ+LK30Yb1nT6wM3YX8aM51fsB7S88fQwctrUO67I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ePMLTcfg; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ePMLTcfg"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-301c4850194so3051009a91.2;
        Sun, 04 May 2025 18:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746407226; x=1747012026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nR0Fta3wnG5bR5CzJEhuf86N2TFG4PU3hm/Xrie7Da0=;
        b=ePMLTcfg2G6iwFno0p4DZoWqdzuRya60IbqmSRW6zS70nJOWpvMFl8SEMoB2he6ttd
         pedRHQza19Sz199Z8Wt6EEpcKX81ATQeic5QZDCydyImgPZNtbOMQYdBt7G9RUw929F4
         C9FA7768coT07Amilr4DH0XGvf9oI4445OPkYaYgSIVdqXylB9/HAbeCsejRDs5yxv/B
         GWb39OVbToRyrOzdtkbgQphAMqOx6lHNBC6sKSO3zMZs8XvLG0ZzyGDGEOWScwTm9MBx
         2ArTLBgJn1jeCBTpGXJR4cqmpIyvLhiYlLwuDTSEXrIV+cnlkmmqPj3dJuMPOE8fEsmS
         /12g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746407226; x=1747012026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nR0Fta3wnG5bR5CzJEhuf86N2TFG4PU3hm/Xrie7Da0=;
        b=KUjBlNT71qSEtCIlsvp/nZOC1RkeQpBgquZlVG1F7manRuligUAKIjRRzQhSvHjl9/
         5J/cMkaDuZcUh7ZgQ7hILUFNtLuUKy06DeS0dHS49ZlgrHxxgMj0eGKexvrM65szHp+t
         wB/EnGXn8rr1dNWeFz4Rr2pltgoORzWUq9DlHfVpUifnpfo4zcUji6xL0KWfCVPFSYOG
         jYksfgi3QmfIbyEPqNhOgbQdVvpMckxm2NT2Gz5fCftnGWGx7eLBqNQ4A4+XBSu1ZzfA
         A4uFVEBbHT16y09qKhXeu6aI+/BtBLVfJeE1xjgvn3zH/WNHSVHBzbvr1KEbur1a15bp
         5D7w==
X-Forwarded-Encrypted: i=1; AJvYcCU22minU6armR2kkg7QE2IDvZV3piFPHQZR7V01rrpvICVjM5d0Ho+7h06/BGOJnOib/q2AExbTJB8=@vger.kernel.org, AJvYcCUBRCLxNAbP40iNc6PqvtiimCMKhFDyNZD//lOPKt5ff3b9ZH15Kh2b6NQk1s6yoyAzjmJwBqmSKzeU95/p@vger.kernel.org, AJvYcCVbrtaxfeA4pkS1bIaFhsPBU/6oo/moaH+EUCd8FrAdXQIma1/dzZbI3SjqGJG11rQEUo+0U3gyyRAIm3/BKJkOQsS23A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz2O64o5xWyagtCNy/Dd2xoacMn31YzZLYeZSOIVli35EidW3+
	YhCmJ2+1NK91x7VCzkn5Hd3Cddked5y2EKed3Yr5EeCwmtoDqOz1
X-Gm-Gg: ASbGncteNUIN11r1tPF6jbsNnstsw5SH9JNTqVTkd4Jtnnl3rPffJGgF6TcV/7B7lQG
	X+PY8TYHhZjd7Pf+GIeweOQUIkqVkrcXnO2h8i1R7HIgOXeM23ZNNMaS0UMfksYkdSOZjm5sHHn
	v66358ohiiYwS37elLhOlHHv5IhokBFMQ8uW6nSzl1mFpR6b7HGBJgxwA7oA9w6OzrvmjOSqXlA
	ryQuz/35khSjzRakSWRC79mSNBwbPW5k9b3qonOV8bSPCl68FxpMeoSYRmAhiSfB8b1EnxguXzi
	NS2NK5XJ+7+EmH6ChXQM1pYsNwMD4Gnrv2jBXHaTEeWAZl9qD9Q/u5/0yNIUn74LbiYetfTnE85
	zCCm4opMAQ3wuKhx4siTHkG/ktH6V9m7w1ARU3GQ=
X-Google-Smtp-Source: AGHT+IHJo7hVvLELWrdme9QIIfjpDxfKRStP0YWu9qL4fb4D1c3zYEeCRPuWMEJIRDvnNt/5Fw+aHg==
X-Received: by 2002:a17:90b:280b:b0:301:98fc:9b51 with SMTP id 98e67ed59e1d1-30a6196ee7emr7017193a91.5.1746407226488;
        Sun, 04 May 2025 18:07:06 -0700 (PDT)
Received: from localhost.localdomain (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a34721015sm10194650a91.6.2025.05.04.18.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 18:07:06 -0700 (PDT)
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
Subject: [PATCH v8 2/6] platform/x86: Add lenovo-wmi-helpers
Date: Sun,  4 May 2025 18:06:55 -0700
Message-ID: <20250505010659.1450984-3-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250505010659.1450984-1-derekjohn.clark@gmail.com>
References: <20250505010659.1450984-1-derekjohn.clark@gmail.com>
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

