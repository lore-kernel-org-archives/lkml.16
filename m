Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899201BD9D3
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 14:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750082498; cv=none; b=nCW8RVgqW37RzQvXWUt8FmN0/PIohelS0HOSyOty5k296WB595w/APrqdL95M6Bo2RZn50Mv1GgHEQv1WJuVd5vXzORA8b3qVnw0oEltvDLtkcA0LyCttG/AX6+8a8mwXLu39iGEhfOmW555zOFcguVCtGViShXNtoRPHw7F76w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750082498; c=relaxed/simple;
	bh=CwNEm2c1yMybTDi2wpi4phfmWJ/6HSgbF3FZfUxeEzs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QaNni4N2Ssi3IBOUDn8lBV0IBsMQuZrK5vde9uab/bX4OWYxF1TfwY5zVK9pNqA+jZvxb0O9DSgJPdcRgQ5JZJzXIjUns48W5vXSS+r7UTkrtQfiWB+WuYZlCs6UPEWG8Z/cYrHW8UouU/QClNPyqqKr8Y3p13cFIINXPulaMsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=INzmI+uJ; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="INzmI+uJ"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a4f71831abso4166438f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 07:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1750082494; x=1750687294; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kwz4cKrypUvsL9siOm1Ko5J6ezOUtjF4iLnGLibT5ys=;
        b=INzmI+uJ95tFbx/f4TWZvywVBr9BGHcmZ1MuDBK8fBBAhN1aH+w1WBqaTVvOYlvzaF
         X2mlVMfy111DNJXeFIouAWlre1syvxz4/paq66RnYMW90eBsRIv5BswvtlieVEhskYzm
         QcpxFwLQ4HrdiLDojmOEfoEGcW3TqtytXeoQb9eUP+KVJ5Sl8JzJFgJPLdf0BLXPZljN
         grSnZXm2eDj7UKIBIYLH7O4BE4AgicPvTugySkR0vQU2F3XajTd3m1C1UNoJd4fVFUq8
         sszw5lNMzWbqnuTZwmp/BrZFeYbWdj9B7kTEFCnwS1jpbx77f62O8cGZgPm+QMYRFQ2c
         TFeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750082494; x=1750687294;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kwz4cKrypUvsL9siOm1Ko5J6ezOUtjF4iLnGLibT5ys=;
        b=syRHmdxvxbcuibAu9SwKUXyPTIJVrUsAYK2amAvGK4aRPQOhtSB/VzwR5s6baFSsLK
         CpinZnizXlWOon6drgYs8WKkiLB3rrOv7HgnXGvyIIP7IAeDt0BfZh9SGwlQRa8y6IDB
         gM6/jCGbBD0P0+xeY6eFEDU5J3C/LzxBxVOhsYRFTVUmLh80/CYR+a8G/HHfk6SPbiRT
         XX8JR6iOtiOIUZVf2aRtRyy8PqeHEemfFOmQiEA9kXpCb9qaMc923nJfFovypX6iLzUC
         T57hJvlIW1IjaD3jdMT/hMTpv+eJ1lhXsHjKHcXvvBs5YnZlGaJaHrLlPfzXMcAxypG1
         5x9w==
X-Gm-Message-State: AOJu0YxR1mTfIVIBZs4otfsHRdOZ4pfiFe5Zl+HuFxCAxxrKs6eHyZol
	0Gu/64uwqBNWB+IlEVeSNGb3eaN0SNJoM+Em0ZlJvQjzdfukJ2S4qhujVsXJuJbr8g==
X-Gm-Gg: ASbGncswkVfYhXW8h8p1INxIm50zs/jbLjF5iukBPNtbnuMBKwk10N2N31KMs6sOh9X
	6DacmkmJ+zGlMdytATMY57Dh+GPSXouCl9pJRFJ5EUoswQd70Vg3sIFcrDJF6txS5YnbDh/GrG2
	WNRpDqPCuwrM+i0+4gJ1DqwGrMdGvfYWi4aa8T5t1KBCYATsn15dGa9OTGDm/N26IjJdOTKXSjH
	jR8q4owiQHkMfNiDT488X2wzM7wd3SKBlOO4xx4/QGxpFwZoi+p7uQgcXrZTvz9ZoX6zJ4SspIw
	kaahHJeYXk5dp8FCwh9Sg+kwSTU9M67r8P/T/AuJeCZdTucAEM5RuIGAyh7rgW04ciy9sBohFI0
	JffSOwUCBaYX7m8CPhUMHYbqUdfKfWdPeqhqFtBwB99z+xg==
X-Google-Smtp-Source: AGHT+IHfNqlkW+hwIU+9YPGHmtVitHx2ir6qBfj0k/M5cOlwiKyZyZh97IqroGO2vE2tCevQa24dBA==
X-Received: by 2002:a5d:64ee:0:b0:3a4:e1e1:7779 with SMTP id ffacd0b85a97d-3a5723a2be9mr7607298f8f.32.1750082492044;
        Mon, 16 Jun 2025 07:01:32 -0700 (PDT)
Received: from [10.93.128.132] (ip-078-094-000-050.um19.pools.vodafone-ip.de. [78.94.0.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a7e51esm11057004f8f.40.2025.06.16.07.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 07:01:31 -0700 (PDT)
From: Michal Gorlas <michal.gorlas@9elements.com>
Date: Mon, 16 Jun 2025 16:01:12 +0200
Subject: [PATCH v2 1/3] firmware: coreboot: support for parsing SMM related
 informations from coreboot tables
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-coreboot-payload-mm-v2-1-5d679b682e13@9elements.com>
References: <20250616-coreboot-payload-mm-v2-0-5d679b682e13@9elements.com>
In-Reply-To: <20250616-coreboot-payload-mm-v2-0-5d679b682e13@9elements.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>, 
 Brian Norris <briannorris@chromium.org>, 
 Julius Werner <jwerner@chromium.org>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
 Marcello Sylvester Bauer <marcello.bauer@9elements.com>, 
 Michal Gorlas <michal.gorlas@9elements.com>
X-Mailer: b4 0.14.2

coreboot exposes (S)MM related data in the coreboot table. Extends existing interface
with structure corresponding to (S)MM data, and adds COREBOOT_PAYLOAD_MM config used by
follow-up patches.

Signed-off-by: Michal Gorlas <michal.gorlas@9elements.com>
---
 drivers/firmware/google/Kconfig          | 12 +++++++
 drivers/firmware/google/coreboot_table.h | 11 ++++++
 drivers/firmware/google/mm_payload.h     | 58 ++++++++++++++++++++++++++++++++
 3 files changed, 81 insertions(+)

diff --git a/drivers/firmware/google/Kconfig b/drivers/firmware/google/Kconfig
index 41b78f5cb7351e512cbaeb6443634a4b97bf6255..ff443f0c4a9a990052d83903fb0f0b0795cc76bd 100644
--- a/drivers/firmware/google/Kconfig
+++ b/drivers/firmware/google/Kconfig
@@ -81,4 +81,16 @@ config GOOGLE_VPD
 	  This option enables the kernel to expose the content of Google VPD
 	  under /sys/firmware/vpd.
 
+config COREBOOT_PAYLOAD_MM
+	tristate "SMI handling in Linux (LinuxBootSMM)"
+	depends on X86 && GOOGLE_COREBOOT_TABLE
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
diff --git a/drivers/firmware/google/coreboot_table.h b/drivers/firmware/google/coreboot_table.h
index bb6f0f7299b4670d0b1f91bd7a3c038cdb412f7b..8a7934e679903e39ce1d86b4aecbc2b4e89363fd 100644
--- a/drivers/firmware/google/coreboot_table.h
+++ b/drivers/firmware/google/coreboot_table.h
@@ -52,6 +52,16 @@ struct lb_cbmem_entry {
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
@@ -80,6 +90,7 @@ struct coreboot_device {
 		struct lb_cbmem_ref cbmem_ref;
 		struct lb_cbmem_entry cbmem_entry;
 		struct lb_framebuffer framebuffer;
+		struct lb_pld_mm_interface_info mm_info;
 		DECLARE_FLEX_ARRAY(u8, raw);
 	};
 };
diff --git a/drivers/firmware/google/mm_payload.h b/drivers/firmware/google/mm_payload.h
new file mode 100644
index 0000000000000000000000000000000000000000..bb2f55c4f24096dfd526e281a937f100031d5315
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

