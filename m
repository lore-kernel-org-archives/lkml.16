Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6559E24DCE8
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 14:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749737193; cv=none; b=AdOBXcg7KpX5PtJZGi7cTN0HL/nzd+inV21pUQ5dhvedTc3s9ya9DZ7AEbLhFh25IKB7++8HCKnwfNtZwryHOB+4LVCI0NjusxIUeg587JaYC/1xhqS/3y0s1djD4XoqgKIMBaeC0Q7wB3w0DpF2KaKgJgT35B7vEqQ02MM+Wus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749737193; c=relaxed/simple;
	bh=FZoq1YD3TUV43K8H/bkJmTG+zygwAdPDC0bLGs1RiQs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rr5GHwSqtZDmwoG53VNlDCfHXCn4UsFznLBrwlvbG/Ci1Ax31ZGLIpuH5pDZoJA05C9XynTVf8jyiZ1bzCVq3SmSfPOTVtsPl29RuSLs0Ps3BG56ordQZaUvu549vZ3LOj/eZcuW4RO5q4LGOkh/tln6BchN1JOYweyZARQ9y8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=DTR7QY8x; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="DTR7QY8x"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-442f9043f56so5922035e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 07:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1749737188; x=1750341988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NTQZFYiB4NXt/ECryK4Vh1lbcJp1CEfXh3FvCrufPYY=;
        b=DTR7QY8x71NEhR7m7hdTBtYXAAc0woUt3quV+uRjvzBcE5B1E90JYYPkx0vst0rQ5y
         ULzIDOg53gc1ijbP1LnstuRzLFUEMT5LKXl+5x1T+NHCzvmaP2/HYU0P+55YJzmvGPg6
         s4cskxom7+0wfU/0rDn09k0OIeEN5WWDFr67Yx/SgpsPEzu5inAMo7jq+wA+HdybK7sj
         fniT/CImKk/UQortyowWwl2gQ8MvdmIsreaw5s084Dy2HV/cvVqRW5TZyB3RFkep26Ow
         2PJTV8XkU08zuAjgLArMSgXvV0QjXFAjw2UFkd/cG7vK45RFLhhEohVd/3prQGY5a/zF
         DwEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749737188; x=1750341988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NTQZFYiB4NXt/ECryK4Vh1lbcJp1CEfXh3FvCrufPYY=;
        b=BxRfeX6UXO70hgTkx4KPcKc0XrU0UUVFyLfBDktdF9ygatrmjTBoaVlCszwci2p7TF
         aA90s1EsQb3O+UMTYAh5v60jjVex2sSUhqgiEIJpOI4r+Qz9wkiKCOTvCTuDRfvT1Ghb
         oZIkzya7qmzaLTdKrwXepeAeKRshbvhhvy6KWQGS6uq++JBCJ2+h6NCgPbABW9xrCs6E
         IGNVF2DUbLhM4C1nGu++zzJmKjHhWeLOUCKL5Nf9yqv1Dj5dRnjFSfA5SC4ojgdJBMk2
         1T1VIi8Orq1WbcewyxnwPpCYpSSfnyc3K6fQVFQoZQWvZbAT2MvD8ItwVruuFx4UaOdK
         51EQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3gHom6aXwX37ZxRbE9HNOz6i06iW+bTMG1i2uY13UcQhiP3vWXAm86BzjSMW/QxOoes+m6tUZ12RKQhc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5u3bUwFdr6Ini/XZNhgqhXOlkkn8X3dgOOSy7NHY993xoYqLn
	TGiuh2RFOLo/BuWJkmKLd8CBuuH1RcZTVD4+7UkIUMKPLI82q5Pw6soTJCJjE7dh+w==
X-Gm-Gg: ASbGnctDIpPlxloOWYPisNvKCyq2zLGa/jStRkOTYIVK/8RJ0D2HAmNofDi4VnrdiWL
	9s0wo5MUfqRZoIYb6Q0sVLFLYJNWKi29PJ0SGpdNP/L0U0AhA4k31JgwCT81aMpOXle54oQMG/j
	jMvpe8kpjVQL2rgQbj+wL5FLQVWCGoN5N9ipmTrFFRt3GTOp2xSa640JO5/DBuoRW3+HbGzzO29
	hQ/fiRkdlVKED2ebGpdKUC98v3IDXWsrag4ckomsHBsg2eJHWRFhz0Jij8WHCOZT1aT0nYuS4uQ
	7GC0LMBVuvIsERCCajUGmn7epMJIxDfQennLCUv5+WD4owHET9mH2t9/Pde15quDbZDhznw59CW
	hxsUpqgULcaZucm8BWk7Gr1l71z4k4qGleSJ1veXDfdbkZ0xTaejqCmtrR7InBQ==
X-Google-Smtp-Source: AGHT+IGI00Q6YIMHbSANMSDLS5LglERhtsWYB9gZJltWUzVNiYCfyWZ6zBltyt3gAZHRC+E6Vgy1RA==
X-Received: by 2002:a5d:64c8:0:b0:3a4:d0ed:257b with SMTP id ffacd0b85a97d-3a567987728mr33280f8f.22.1749737188086;
        Thu, 12 Jun 2025 07:06:28 -0700 (PDT)
Received: from cyber-t14sg4.sec.9e.network (ip-078-094-000-050.um19.pools.vodafone-ip.de. [78.94.0.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a561a3ce6bsm2078875f8f.49.2025.06.12.07.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 07:06:27 -0700 (PDT)
From: Michal Gorlas <michal.gorlas@9elements.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Julius Werner <jwerner@chromium.org>
Cc: marcello.bauer@9elements.com,
	Michal Gorlas <michal.gorlas@9elements.com>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/3] firmware: coreboot: support for parsing SMM related informations from coreboot tables
Date: Thu, 12 Jun 2025 16:05:48 +0200
Message-ID: <815080fae73a4e879bae4851367ac7c0ad2cd551.1749734094.git.michal.gorlas@9elements.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749734094.git.michal.gorlas@9elements.com>
References: <cover.1749734094.git.michal.gorlas@9elements.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

coreboot exposes (S)MM related data in the coreboot table. Extends existing interface,
with structure corresponding to (S)MM data, and adds parser. Parser exposes this data
to the modules executed later.

Signed-off-by: Michal Gorlas <michal.gorlas@9elements.com>
---
 drivers/firmware/google/Kconfig          | 12 +++++
 drivers/firmware/google/Makefile         |  3 ++
 drivers/firmware/google/coreboot_table.h | 34 ++++++++-----
 drivers/firmware/google/mm_info.c        | 63 ++++++++++++++++++++++++
 drivers/firmware/google/mm_payload.h     | 58 ++++++++++++++++++++++
 5 files changed, 158 insertions(+), 12 deletions(-)
 create mode 100644 drivers/firmware/google/mm_info.c
 create mode 100644 drivers/firmware/google/mm_payload.h

diff --git a/drivers/firmware/google/Kconfig b/drivers/firmware/google/Kconfig
index 41b78f5cb735..5d918c076f25 100644
--- a/drivers/firmware/google/Kconfig
+++ b/drivers/firmware/google/Kconfig
@@ -81,4 +81,16 @@ config GOOGLE_VPD
 	  This option enables the kernel to expose the content of Google VPD
 	  under /sys/firmware/vpd.
 
+config COREBOOT_PAYLOAD_MM
+	tristate "SMI handling in Linux (LinuxBootSMM)"
+	depends on GOOGLE_COREBOOT_TABLE
+	help
+	  Enables support for SMI handling by Linux-owned code.
+	  coreboot reserves region for payload-owned SMI handler, the Linux
+	  driver prepares its SMI handler outside of SMRAM, and lets coreboot
+	  know where the handler is placed by issuing an SMI. On this SMI, the
+	  handler is being placed in SMRAM and all supported SMIs from that point
+	  on are handled by Linux-owned SMI handler.
+	  If in doubt, say N.
+
 endif # GOOGLE_FIRMWARE
diff --git a/drivers/firmware/google/Makefile b/drivers/firmware/google/Makefile
index 8151e323cc43..d2a690e8379d 100644
--- a/drivers/firmware/google/Makefile
+++ b/drivers/firmware/google/Makefile
@@ -12,3 +12,6 @@ obj-$(CONFIG_GOOGLE_CBMEM)		+= cbmem.o
 
 vpd-sysfs-y := vpd.o vpd_decode.o
 obj-$(CONFIG_GOOGLE_VPD)		+= vpd-sysfs.o
+
+# LinuxBootSMM related.
+obj-$(CONFIG_COREBOOT_PAYLOAD_MM)		+= mm_info.o
diff --git a/drivers/firmware/google/coreboot_table.h b/drivers/firmware/google/coreboot_table.h
index bb6f0f7299b4..e0b087933c5a 100644
--- a/drivers/firmware/google/coreboot_table.h
+++ b/drivers/firmware/google/coreboot_table.h
@@ -41,7 +41,6 @@ struct lb_cbmem_ref {
 };
 
 #define LB_TAG_CBMEM_ENTRY 0x31
-
 /* Corresponds to LB_TAG_CBMEM_ENTRY */
 struct lb_cbmem_entry {
 	u32 tag;
@@ -52,6 +51,16 @@ struct lb_cbmem_entry {
 	u32 id;
 };
 
+/* Corresponds to LB_TAG_PLD_MM_INTERFACE_INFO */
+#define LB_TAG_PLD_MM_INTERFACE_INFO 0x3b
+struct lb_pld_mm_interface_info {
+	u32 tag;
+	u32 size;
+	u8 revision;
+	u8 requires_long_mode_call;
+	u8 register_mm_entry_command;
+};
+
 /* Describes framebuffer setup by coreboot */
 struct lb_framebuffer {
 	u32 tag;
@@ -61,15 +70,15 @@ struct lb_framebuffer {
 	u32 x_resolution;
 	u32 y_resolution;
 	u32 bytes_per_line;
-	u8  bits_per_pixel;
-	u8  red_mask_pos;
-	u8  red_mask_size;
-	u8  green_mask_pos;
-	u8  green_mask_size;
-	u8  blue_mask_pos;
-	u8  blue_mask_size;
-	u8  reserved_mask_pos;
-	u8  reserved_mask_size;
+	u8 bits_per_pixel;
+	u8 red_mask_pos;
+	u8 red_mask_size;
+	u8 green_mask_pos;
+	u8 green_mask_size;
+	u8 blue_mask_pos;
+	u8 blue_mask_size;
+	u8 reserved_mask_pos;
+	u8 reserved_mask_size;
 };
 
 /* A device, additionally with information from coreboot. */
@@ -80,6 +89,7 @@ struct coreboot_device {
 		struct lb_cbmem_ref cbmem_ref;
 		struct lb_cbmem_entry cbmem_entry;
 		struct lb_framebuffer framebuffer;
+		struct lb_pld_mm_interface_info mm_info;
 		DECLARE_FLEX_ARRAY(u8, raw);
 	};
 };
@@ -112,8 +122,8 @@ void coreboot_driver_unregister(struct coreboot_driver *driver);
  * boilerplate.  Each module may only use this macro once, and
  * calling it replaces module_init() and module_exit()
  */
-#define module_coreboot_driver(__coreboot_driver) \
+#define module_coreboot_driver(__coreboot_driver)                  \
 	module_driver(__coreboot_driver, coreboot_driver_register, \
-			coreboot_driver_unregister)
+		      coreboot_driver_unregister)
 
 #endif /* __COREBOOT_TABLE_H */
diff --git a/drivers/firmware/google/mm_info.c b/drivers/firmware/google/mm_info.c
new file mode 100644
index 000000000000..55bcdc8b8d53
--- /dev/null
+++ b/drivers/firmware/google/mm_info.c
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * mm_info.c
+ *
+ * Driver for exporting MM payload information from coreboot table.
+ *
+ * Copyright 2025 9elements gmbh
+ * Copyright 2025 Michal Gorlas <michal.gorlas@9elements.com>
+ */
+
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+
+#include "coreboot_table.h"
+#include "mm_payload.h"
+
+static struct lb_pld_mm_interface_info *mm_cbtable_info;
+struct mm_info *mm_info;
+
+static int mm_driver_probe(struct coreboot_device *dev)
+{
+	mm_cbtable_info = &dev->mm_info;
+	if (mm_cbtable_info->tag != LB_TAG_PLD_MM_INTERFACE_INFO)
+		return -ENXIO;
+
+	mm_info = kmalloc(sizeof(*mm_info), GFP_KERNEL);
+	mm_info->revision = mm_cbtable_info->revision;
+	mm_info->requires_long_mode_call =
+		mm_cbtable_info->requires_long_mode_call;
+	mm_info->register_mm_entry_command =
+		mm_cbtable_info->register_mm_entry_command;
+	return 0;
+}
+EXPORT_SYMBOL(mm_info);
+
+static void mm_driver_remove(struct coreboot_device *dev)
+{
+	if (mm_info)
+		kfree(mm_info);
+}
+
+static const struct coreboot_device_id mm_info_ids[] = {
+	{ .tag = LB_TAG_PLD_MM_INTERFACE_INFO },
+	{ /* sentinel */ }
+};
+
+MODULE_DEVICE_TABLE(coreboot, mm_info_ids);
+
+static struct coreboot_driver mm_driver = {
+	.probe = mm_driver_probe,
+	.remove = mm_driver_remove,
+	.drv = {
+		.name = "mm_info",
+	},
+	.id_table = mm_info_ids,
+};
+
+module_coreboot_driver(mm_driver);
+
+MODULE_AUTHOR("Michal Gorlas <michal.gorlas@9elements.com>");
+MODULE_DESCRIPTION("Driver for exporting MM info from coreboot table");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/firmware/google/mm_payload.h b/drivers/firmware/google/mm_payload.h
new file mode 100644
index 000000000000..bb2f55c4f240
--- /dev/null
+++ b/drivers/firmware/google/mm_payload.h
@@ -0,0 +1,58 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * mm_payload.h
+ *
+ * Internal header for MM payload driver.
+ *
+ * Copyright 2025 9elements gmbh
+ * Copyright 2025 Michal Gorlas <michal.gorlas@9elements.com>
+ */
+
+#ifndef __MM_PAYLOAD_H
+#define __MM_PAYLOAD_H
+
+#define PAYLOAD_MM_RET_SUCCESS 0
+#define PAYLOAD_MM_RET_FAILURE 1
+#define PAYLOAD_MM_REGISTER_ENTRY 2
+
+#define REALMODE_END_SIGNATURE	0x65a22c82
+
+struct mm_info {
+	u8 revision;
+	u8 requires_long_mode_call;
+	u8 register_mm_entry_command;
+};
+
+extern struct mm_info *mm_info;
+
+#ifndef __ASSEMBLY__
+
+#include <linux/types.h>
+
+/* This must match data at mm_handler/mm_header.S */
+struct mm_header {
+	u32	text_start;
+	u32	mm_entry_32;
+	u32	mm_entry_64;
+	u32	mm_signature;
+	u32	mm_blob_size;
+};
+
+extern struct mm_header *mm_header;
+extern unsigned char mm_blob_end[];
+
+extern unsigned char mm_blob[];
+extern unsigned char mm_relocs[];
+
+/*
+ * This has to be under 1MB (see tseg_region.c in coreboot source tree).
+ * The actual check for this is made in coreboot after we fill the header
+ * (see above) with the blob size.
+ */
+static inline size_t mm_payload_size_needed(void)
+{
+	return mm_blob_end - mm_blob;
+}
+
+#endif /* __ASSEMBLER__ */
+#endif /* __MM_PAYLOAD_H */
-- 
2.49.0

