Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA263B1AB
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 14:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750082524; cv=none; b=X/y8SYkbcjQCTT3H08tqJP/wtz4/3WKS6xqFDBay3A824bd3Cz/28wm32kDHSr4PoPN2GJq6nrxyunYDPqL4NmS+0MjE5r9nJvmlqNJTKjocj5ImPB+R4C1ZCejSFM2b4LzFEFlkZ4XrCB+zXivw1/iWwsORkITYgv3xv0E8m7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750082524; c=relaxed/simple;
	bh=E1lMEmXHYqWR16HGHgK71pxfATPvgHdLWabskmqDZ3s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u7sC3fwuYGgRMbJJ4UrGhf5MHl0BDkCjjcKoyQP5Cj55tzvVrf76in3PzIYX2m1AqWD80FjHhTwmLjNsW/QACMVK9XWVanJajPkOzlZZg8JWRRKxlAgx6BvXeU134C3qbhlQR1xLXMSXFSFB9XI+iGhjk6+2qijGyVv1ykjoObg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=d3bJP6p0; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="d3bJP6p0"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-acbb85ce788so782874966b.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 07:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1750082521; x=1750687321; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6P9A3l5UWjJDESY0tSbb8ggTIngSP/ZE/hVIpMK6C8k=;
        b=d3bJP6p0+CzLWvDanWxS9SXaIl+WbhsmFfBSulBvPzHtEtNojgEHHXIIIlQADATj1F
         GOOxbEhWM99JE9EZk5rBgsQUL+ALYOtY4k/+V7CK4svU6Dal+sl7TdAUNX32Ql91MPnH
         m3ZMdvWVhXzf9/F8lONcPb8sfCEdnfRBD4XpIyFIM2VWewUhG3sucZbZyG8aOGfUvOgr
         alyE3QsuFxxZ5qrwEkqJbPVVFbSej2z5IzEdbdJFkCqHmDsDf1WYWPZ2hc7G8vrioiO/
         m4JVvQI0qFUUj0R8ltTCA6u96RXbQbyakfDh9IinyZmU4sCKdVhj/WvJ9PwaYCqipAHL
         FjOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750082521; x=1750687321;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6P9A3l5UWjJDESY0tSbb8ggTIngSP/ZE/hVIpMK6C8k=;
        b=FUn1X+k6SMan7QGUkYCXVPQ1zVQAYkNcJsb85ur/xTBB2ONaRKOGAcO3XLM9Je6nrJ
         OyUyYbEVOeJIO6f+BtLrXel8X1k0bAxJgSLevvaAlwwLOD3V+AMDLXVvFGgN+7PNC0Hz
         z0A3XGIvXH+eXNE+jguX+dSoQVshcMmKjfvc3QH5HDcRFek/1lEAtKsjWmqi7uzjIUCp
         76tC5txzyUu9FWHVuMzTiU/ojncgQQFu2VLceEEEKfsPogXxi9+6bskNKW2m+nigw1WB
         PyGxTtqDamxDVK1osnC6yk8Pi+ZSaukYkCIBdwGPJEIw/aWF+n3f25dybbk3FDw2Fs82
         /0gw==
X-Gm-Message-State: AOJu0Yx29CmMxl1wzX7gZ/rmEaLgVnb2uoScYlLQLVfZj7+bpqP0oU8+
	uxeQrZuTaBeDaKZgsMck0ha6aB3++UzHebKWXkK2jzLOTXeUZt/V6HJ+qAIQ6aDMs+CDk8Ja6bQ
	304Q=
X-Gm-Gg: ASbGncsZO77pI1oFwcedTL33d1WDwv3/ZTLfu7dyM3b83DYv2t2Np3QoTXpkMUZOCaB
	e+9pYJN1EyiBtSDK/sUprSCMYGI/9fJQDkxSLzFjdAq9vco0vIkkbmXX+Q3f54tWuW3gnFx3zZm
	OCL1b/55pFl5vakNLhxmmnxxnEYn2PNTgFKBlQxyXHqp8S+Q27kvoz7EH8pYfJWCsXu5NtiyQoV
	ySbyreUSqEn7UVpiuuLW/f8u59Poj+Pvs2V4znFrWbgceEhJ8kwU5K8YjHcpAb7gyd+x25sQ2mm
	XQtwyH40TUgzswOUe60o6rVJKf8R34/k+XHxhraKmrgO+qZTu4bPWNZ9nMIhkMOg1XJyxnbPVUi
	hBCMNunuU9MPcNgEuTY4bWEr6Mo0v/wCGVT5BOUHrHTjfSg==
X-Google-Smtp-Source: AGHT+IHrmc6WZkO3wEmVEWS5L0vg6fGaHIZopbN3UHbqnc1YDJ1YB7IdQ1JmwlzRYpTjrZr8LVY0gQ==
X-Received: by 2002:a05:6000:708:b0:3a4:e002:5f97 with SMTP id ffacd0b85a97d-3a57236756cmr7252807f8f.1.1750082493122;
        Mon, 16 Jun 2025 07:01:33 -0700 (PDT)
Received: from [10.93.128.132] (ip-078-094-000-050.um19.pools.vodafone-ip.de. [78.94.0.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a7e51esm11057004f8f.40.2025.06.16.07.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 07:01:32 -0700 (PDT)
From: Michal Gorlas <michal.gorlas@9elements.com>
Date: Mon, 16 Jun 2025 16:01:13 +0200
Subject: [PATCH v2 2/3] firmware: coreboot: loader for Linux-owned SMI
 handler
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-coreboot-payload-mm-v2-2-5d679b682e13@9elements.com>
References: <20250616-coreboot-payload-mm-v2-0-5d679b682e13@9elements.com>
In-Reply-To: <20250616-coreboot-payload-mm-v2-0-5d679b682e13@9elements.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>, 
 Brian Norris <briannorris@chromium.org>, 
 Julius Werner <jwerner@chromium.org>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
 Marcello Sylvester Bauer <marcello.bauer@9elements.com>, 
 Michal Gorlas <michal.gorlas@9elements.com>
X-Mailer: b4 0.14.2

Places a blob with Linux-owned SMI handler in the lower 4GB of memory, calculates
entry points for the it and triggers SMI to coreboot's SMI handler
informing it where to look for Linux-owned SMI handler.

Signed-off-by: Michal Gorlas <michal.gorlas@9elements.com>
---
 drivers/firmware/google/Makefile    |  11 ++
 drivers/firmware/google/mm_blob.S   |  20 ++++
 drivers/firmware/google/mm_loader.c | 215 ++++++++++++++++++++++++++++++++++++
 3 files changed, 246 insertions(+)

diff --git a/drivers/firmware/google/Makefile b/drivers/firmware/google/Makefile
index 8151e323cc434673b0fe56f1df1cec2fb7873295..bcac8dd1509ed251e3739b5905d6267ac097379d 100644
--- a/drivers/firmware/google/Makefile
+++ b/drivers/firmware/google/Makefile
@@ -12,3 +12,14 @@ obj-$(CONFIG_GOOGLE_CBMEM)		+= cbmem.o
 
 vpd-sysfs-y := vpd.o vpd_decode.o
 obj-$(CONFIG_GOOGLE_VPD)		+= vpd-sysfs.o
+
+# LinuxBootSMM related.
+payload-mm-$(CONFIG_COREBOOT_PAYLOAD_MM)	:= mm_loader.o mm_blob.o
+
+subdir-						:= mm_handler
+obj-$(CONFIG_COREBOOT_PAYLOAD_MM)		+= payload-mm.o
+
+$(obj)/mm_blob.o: $(obj)/mm_handler/handler.bin
+
+$(obj)/mm_handler/handler.bin: FORCE
+	$(Q)$(MAKE) $(build)=$(obj)/mm_handler $@
diff --git a/drivers/firmware/google/mm_blob.S b/drivers/firmware/google/mm_blob.S
new file mode 100644
index 0000000000000000000000000000000000000000..d45ff661d74ab85fbb283704df7ceeee475dcbc5
--- /dev/null
+++ b/drivers/firmware/google/mm_blob.S
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Derived from rmpiggy.S.
+ *
+ * Wrapper script for the MM payload binary as a transport object
+ * before copying to SMRAM memory.
+ */
+#include <linux/linkage.h>
+#include <asm/page_types.h>
+
+	.section ".data","aw"
+
+	.balign PAGE_SIZE
+
+SYM_DATA_START(mm_blob)
+	.incbin	"drivers/firmware/google/mm_handler/handler.bin"
+SYM_DATA_END_LABEL(mm_blob, SYM_L_GLOBAL, mm_blob_end)
+
+SYM_DATA_START(mm_relocs)
+	.incbin	"drivers/firmware/google/mm_handler/handler.relocs"
+SYM_DATA_END(mm_relocs)
diff --git a/drivers/firmware/google/mm_loader.c b/drivers/firmware/google/mm_loader.c
new file mode 100644
index 0000000000000000000000000000000000000000..2e823b5d0677cf9a8a27f11c7e3f196cddc8a664
--- /dev/null
+++ b/drivers/firmware/google/mm_loader.c
@@ -0,0 +1,215 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for installing Linux-owned SMI handler
+ *
+ * Copyright (c) 2025 9elements GmbH
+ *
+ * Author: Michal Gorlas <michal.gorlas@9elements.com>
+ */
+
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/cpu.h>
+#include <linux/delay.h>
+#include <linux/gfp.h>
+#include <linux/mm.h>
+#include <linux/slab.h>
+#include <linux/device.h>
+
+#include "coreboot_table.h"
+#include "mm_payload.h"
+
+struct mm_header *mm_header;
+static void *shared_buffer;
+static size_t blob_size;
+static struct lb_pld_mm_interface_info *mm_cbtable_info;
+struct mm_info *mm_info;
+
+/*
+ * This is x86_64 specific, assuming that we want this to also work on i386,
+ * we either need to have "trigger_smi32" bounded by preprocessor guards(?)
+ * or mm_loader32 and then mm_loader$(BITS) in Makefile(?).
+ */
+static int trigger_smi(u64 cmd, u64 arg, u64 retry)
+{
+	u64 status;
+	u16 apmc_port = 0xb2;
+
+	asm volatile("movq	%[cmd], %%rax\n\t"
+		     "movq	%%rax, %%rcx\n\t"
+		     "movq	%[arg], %%rbx\n\t"
+		     "movq	%[retry], %%r8\n\t"
+		     ".trigger:\n\t"
+		     "mov	%[apmc_port], %%dx\n\t"
+		     "outb	%%al, %%dx\n\t"
+		     "cmpq	%%rcx, %%rax\n\t"
+		     "jne	.return_changed\n\t"
+		     "pushq	%%rcx\n\t"
+		     "movq	$10000, %%rcx\n\t"
+		     "rep	nop\n\t"
+		     "popq	%%rcx\n\t"
+		     "cmpq	$0, %%r8\n\t"
+		     "je	.return_not_changed\n\t"
+		     "decq	%%r8\n\t"
+		     "jmp	.trigger\n\t"
+		     ".return_changed:\n\t"
+		     "movq	%%rax, %[status]\n\t"
+		     "jmp	.end\n\t"
+		     ".return_not_changed:\n\t"
+		     "movq	%%rcx, %[status]\n\t"
+		     ".end:\n\t"
+		     : [status] "=r"(status)
+		     : [cmd] "r"(cmd), [arg] "r"(arg), [retry] "r"(retry),
+		       [apmc_port] "r"(apmc_port)
+		     : "%rax", "%rbx", "%rdx", "%rcx", "%r8");
+
+	if (status == cmd || status == PAYLOAD_MM_RET_FAILURE)
+		status = PAYLOAD_MM_RET_FAILURE;
+	else
+		status = PAYLOAD_MM_RET_SUCCESS;
+
+	return status;
+}
+
+static int register_entry_point(struct device *dev, struct mm_info *data, uint32_t entry_point)
+{
+	u64 cmd;
+	u8 status;
+
+	cmd = data->register_mm_entry_command |
+	      (PAYLOAD_MM_REGISTER_ENTRY << 8);
+	status = trigger_smi(cmd, entry_point, 5);
+	dev_dbg(dev, ": %s: SMI returned %x\n", __func__, status);
+
+	return status;
+}
+
+static u32 place_handler(struct device *dev)
+{
+	/*
+	 * The handler (aka MM blob) has to be placed in low 4GB of the memory.
+	 * This is because we can not assume that coreboot will be in long mode
+	 * while trying to copy the blob to SMRAM. Even if so, (can be checked by
+	 * reading cb_data->mm_info.requires_long_mode_call), it would make our life
+	 * way too complicated (e.g. no need for shared page table).
+	 */
+	size_t entry32_offset;
+	size_t entry64_offset;
+	u16 real_mode_seg;
+	const u32 *rel;
+	u32 count;
+	unsigned long phys_base;
+
+	blob_size = mm_payload_size_needed();
+	shared_buffer = (void *)devm_get_free_pages(dev, GFP_DMA32, get_order(blob_size));
+	if (!shared_buffer)
+		return -ENOMEM;
+
+	memcpy(shared_buffer, mm_blob, blob_size);
+	wbinvd();
+
+	/*
+	 * Based on arch/x86/realmode/init.c
+	 * The sole purpose of doing relocations is to be able to calculate the offsets
+	 * for entry points. While the absolute addresses are not valid anymore after the
+	 * blob is copied to SMRAM, the distances between sections stay the same, so we
+	 * can still calculate the correct entry point based on coreboot's bitness.
+	 */
+	phys_base = __pa(shared_buffer);
+	real_mode_seg = phys_base >> 4;
+	rel = (u32 *)mm_relocs;
+
+	/* 16-bit segment relocations. */
+	count = *rel++;
+	while (count--) {
+		u16 *seg = (u16 *)(shared_buffer + *rel++);
+		*seg = real_mode_seg;
+	}
+
+	/* 32-bit linear relocations. */
+	count = *rel++;
+	while (count--) {
+		u32 *ptr = (u32 *)(shared_buffer + *rel++);
+		*ptr += phys_base;
+	}
+
+	mm_header =  (struct mm_header *)shared_buffer;
+
+	mm_header->mm_signature = REALMODE_END_SIGNATURE;
+	mm_header->mm_blob_size = mm_payload_size_needed();
+
+	/*
+	 * At this point relocations are done and we can do some cool
+	 * pointer arithmetics to help coreboot determine correct entry
+	 * point based on offsets.
+	 */
+	entry32_offset = mm_header->mm_entry_32 - (unsigned long)shared_buffer;
+	entry64_offset = mm_header->mm_entry_64 - (unsigned long)shared_buffer;
+
+	mm_header->mm_entry_32 = entry32_offset;
+	mm_header->mm_entry_64 = entry64_offset;
+
+	return (unsigned long)shared_buffer;
+}
+
+static int get_mm_info(struct coreboot_device *dev)
+{
+	mm_cbtable_info = &dev->mm_info;
+	if (mm_cbtable_info->tag != LB_TAG_PLD_MM_INTERFACE_INFO)
+		return -ENXIO;
+
+	mm_info = devm_kzalloc(&dev->dev, sizeof(*mm_info), GFP_KERNEL);
+	if (!mm_info)
+		return -ENOMEM;
+
+	mm_info->revision = mm_cbtable_info->revision;
+	mm_info->requires_long_mode_call =
+		mm_cbtable_info->requires_long_mode_call;
+	mm_info->register_mm_entry_command =
+		mm_cbtable_info->register_mm_entry_command;
+	return 0;
+}
+
+static int mm_loader_probe(struct coreboot_device *dev)
+{
+	if (get_mm_info(dev))
+		return -ENOMEM;
+
+	u32 entry_point;
+
+	entry_point = place_handler(&dev->dev);
+
+	if (register_entry_point(&dev->dev, mm_info, entry_point)) {
+		dev_warn(&dev->dev, ": registering entry point for MM payload failed.\n");
+		return -1;
+	}
+
+	/*
+	 * Gives SMI some time in case it takes longer than expected.
+	 * Only useful on real hardware (tested on RaptorLake), not needed on emulation.
+	 */
+	mdelay(100);
+
+	return 0;
+}
+
+static const struct coreboot_device_id mm_loader_ids[] = {
+	{ .tag = LB_TAG_PLD_MM_INTERFACE_INFO },
+	{ /* sentinel */ }
+};
+
+MODULE_DEVICE_TABLE(coreboot, mm_loader_ids);
+
+static struct coreboot_driver mm_loader = {
+	.probe = mm_loader_probe,
+	.drv = {
+		.name = "mm_loader",
+	},
+	.id_table = mm_loader_ids,
+};
+
+module_coreboot_driver(mm_loader);
+
+MODULE_AUTHOR("Michal Gorlas <michal.gorlas@9elements.com>");
+MODULE_DESCRIPTION("MM Payload loader - installs Linux-owned SMI handler");
+MODULE_LICENSE("GPL v2");

-- 
2.49.0

