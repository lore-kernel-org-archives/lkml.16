Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E05825486E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 14:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749737194; cv=none; b=dBOgSpjL2khDNuWC8++tY8jr2KoxVk45sctIUedK0QTrX9Gv/m0jp8pV+lssvoV/wXmzHNBmRNNkHlWH4HZps7Z5XIyLQzoMqpwWRcTzixsoh+c2gy2zcwGdSyg4Qa3UKTWzzxT9WDpwbJgvA3aGhFcu7lTMQJSzbw90q8eUHAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749737194; c=relaxed/simple;
	bh=ISjEXdBvNbTD5hi9yBqTGZRlg/doEfn4IjaexdEVwoU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oqM63eQ0aAKUT+cpAp2TnOtmmp2lZJ7TbSAQJv/fjsGDM3S2SinE3dqWb8ImmqMoBCNK1Hx6aIKFV+gTu9npw2Xe7QPp5WEHTJQUNhXFALGpVWuB/N9+9bE3yS9hrGisQ9rSB2uyJVWHcwPNTKXR+KygNGe1/K2hUUVjJ1dw+Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=bLGQeiel; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="bLGQeiel"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a5257748e1so827130f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 07:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1749737190; x=1750341990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KUgqA1Jc2xYoZNZTuzlLkXS4uHvCEdWe1k/c6jbnK/M=;
        b=bLGQeielRAZQuCSkRfcO/xn7d/5dXDC+ehwgRz1xPN+5JKzp5z9oMJR5cietlIXNV4
         bkcwahyA2CwyfyP7aWP8xS0i24ZiZC3M2JaRMhbIhx31WGa0wcOygfnYq3Ib1uEE3jlj
         v+Hm6kzy5cdnXnzewM4XoHyf2HBwI4JnajS0Ft90AJiZHCW5xyMwKieTv7Wl65ke/l7C
         l6AlP6qWJPfnDy5lv3XVLCNRR1FTSG9ih329+qy5odW7ODurwrseR5mIQjBO4up+fWjg
         2JQjUEPucVJbJaGE9wFVDvJHqz7y8H8JXwCHVEvM68S+QGajc9n1AE7qMpDE/dnpbIW9
         Paww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749737190; x=1750341990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KUgqA1Jc2xYoZNZTuzlLkXS4uHvCEdWe1k/c6jbnK/M=;
        b=X978Vk5I5/LAxe1ET4Sf1G8gIw/4+3P9q2j2mWcILDywNBQQN9h4V7zngy8wPXic/c
         40wKCJTL4bc6/iTuQQhtQ2A5dwFiNCaBNsIOJiS+0/sS4C+7DsvWTVz0FeJIdkOq8Zbb
         VoRkwNLUpty0FOrOHgaMJdKCD3hzRx2pymk8UH57iGCwDAMRHqmCEKgFujYZ8wmQ61lo
         KVuDAGU7ZAiKrjeuvcahWwfd9hLQbIMGRskfdvNVOn45act6rVGeO/f9gUw6DYv5AcN+
         2/o86VOjxZ9N6gC2wv81HLrDiuWSdf4Bw8OSmoEgSnuFexTcCtHGBhhP2Lxa+JY8W2Uk
         v9tA==
X-Forwarded-Encrypted: i=1; AJvYcCUjyLxxAXiob5YdHsWe03MxedBgxbkpqMAWfY98iB8BFAgcqDlNtQ2jjSCfIJkyg0HgcjlA8vc9acsZNAo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJf/Za44m9LWDnEMZjK3VtG4NATnKZIW8xrykcyEXUrKWskB6f
	sD5vClUbtGUlC0GjlrjSFADT6I2eTmzpoBh7igoorFk0R8E1kqmid3xtjcHwO6LmSg==
X-Gm-Gg: ASbGncuSybgZOPrypBWh41cGWDkDTmnLqXOf0vRGkOTavEnshAsxRkY2AehGj2POfkS
	a6yglm7hQ1kttGppGUuDDcLR3xgrUjiPbFxpcan5auuHagy20JfYvhaQK/Mv2AiL/9TmMm7u2rF
	YIDy0OwvhLycjIjENApqfm0M2LsmtPJsxcekN4n9c5TiCU+2J0XuEcv0ToW/0QqE+lsGLuZUPlC
	V0rxF/78vRjsbMstveQxyvZJj9FENTdx5LZCO7ldbnuORz/wz82oR8UL6LGD6xwob1iMEq8arXu
	2PQPd09/i6LFpATYgWpOtDpu/uOOWwbBTjq98RuPXIyvAixbD4gI8ZQZIEaH/58U03/BKTSuNvx
	X7Ep/LtIntvqUNvRI4/5/ZJH8WGZjHrkpU+pgLFJiXh2pRAUKGsmq2PO64UxtGpwFwD0TVnKR
X-Google-Smtp-Source: AGHT+IEMmU+OYqOh2rsuirqXNprzlh+QwHNDiMIm/ZI5vCsQSWsOSemy/DSfB7Z5oVT8jFgyb+HdDw==
X-Received: by 2002:a05:6000:250e:b0:3a4:f66a:9d31 with SMTP id ffacd0b85a97d-3a56798747fmr45030f8f.16.1749737189462;
        Thu, 12 Jun 2025 07:06:29 -0700 (PDT)
Received: from cyber-t14sg4.sec.9e.network (ip-078-094-000-050.um19.pools.vodafone-ip.de. [78.94.0.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a561a3ce6bsm2078875f8f.49.2025.06.12.07.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 07:06:29 -0700 (PDT)
From: Michal Gorlas <michal.gorlas@9elements.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Julius Werner <jwerner@chromium.org>
Cc: marcello.bauer@9elements.com,
	Michal Gorlas <michal.gorlas@9elements.com>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/3] firmware: coreboot: loader for Linux-owned SMI handler
Date: Thu, 12 Jun 2025 16:05:49 +0200
Message-ID: <6cfb5bae79c153c54da298c396adb8a28b5e785a.1749734094.git.michal.gorlas@9elements.com>
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

Places a blob with Linux-owned SMI handler in the lower 4GB of memory, calculates
entry points for the it and triggers SMI to coreboot's SMI handler
informing it where to look for Linux-owned SMI handler.

Signed-off-by: Michal Gorlas <michal.gorlas@9elements.com>
---
 drivers/firmware/google/Makefile    |   9 ++
 drivers/firmware/google/mm_blob.S   |  20 +++
 drivers/firmware/google/mm_loader.c | 186 ++++++++++++++++++++++++++++
 3 files changed, 215 insertions(+)
 create mode 100644 drivers/firmware/google/mm_blob.S
 create mode 100644 drivers/firmware/google/mm_loader.c

diff --git a/drivers/firmware/google/Makefile b/drivers/firmware/google/Makefile
index d2a690e8379d..eab5a62d7500 100644
--- a/drivers/firmware/google/Makefile
+++ b/drivers/firmware/google/Makefile
@@ -15,3 +15,12 @@ obj-$(CONFIG_GOOGLE_VPD)		+= vpd-sysfs.o
 
 # LinuxBootSMM related.
 obj-$(CONFIG_COREBOOT_PAYLOAD_MM)		+= mm_info.o
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
index 000000000000..87557d67c47b
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
+	.section ".init.data","aw"
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
index 000000000000..51fbfd07f525
--- /dev/null
+++ b/drivers/firmware/google/mm_loader.c
@@ -0,0 +1,186 @@
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
+
+#include "mm_payload.h"
+
+#define DRIVER_NAME "mm_loader"
+
+struct mm_header *mm_header;
+
+static void *shared_buffer;
+static size_t blob_size;
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
+	asm volatile("movq	%[cmd],  %%rax\n\t"
+		     "movq   %%rax,	%%rcx\n\t"
+		     "movq	%[arg],  %%rbx\n\t"
+		     "movq   %[retry],  %%r8\n\t"
+		     ".trigger:\n\t"
+		     "mov	%[apmc_port], %%dx\n\t"
+		     "outb	%%al, %%dx\n\t"
+		     "cmpq	%%rcx, %%rax\n\t"
+		     "jne .return_changed\n\t"
+		     "pushq  %%rcx\n\t"
+		     "movq   $10000, %%rcx\n\t"
+		     "rep    nop\n\t"
+		     "popq   %%rcx\n\t"
+		     "cmpq   $0, %%r8\n\t"
+		     "je     .return_not_changed\n\t"
+		     "decq   %%r8\n\t"
+		     "jmp    .trigger\n\t"
+		     ".return_changed:\n\t"
+		     "movq	%%rax, %[status]\n\t"
+		     "jmp	.end\n\t"
+		     ".return_not_changed:"
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
+static int register_entry_point(struct mm_info *data, uint32_t entry_point)
+{
+	u64 cmd;
+	u8 status;
+
+	cmd = data->register_mm_entry_command |
+	      (PAYLOAD_MM_REGISTER_ENTRY << 8);
+	status = trigger_smi(cmd, entry_point, 5);
+	pr_info(DRIVER_NAME ": %s: SMI returned %x\n", __func__, status);
+
+	return status;
+}
+
+static u32 __init place_handler(void)
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
+	shared_buffer = (void *)__get_free_pages(GFP_DMA32, get_order(blob_size));
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
+	/* At this point relocations are done and we can do some cool
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
+static int __init mm_loader_init(void)
+{
+	u32 entry_point;
+
+	if (!mm_info)
+		return -ENOMEM;
+
+	entry_point = place_handler();
+
+	if (register_entry_point(mm_info, entry_point)) {
+		pr_warn(DRIVER_NAME ": registering entry point for MM payload failed.\n");
+		kfree(mm_info);
+		mm_info = NULL;
+		free_pages((unsigned long)shared_buffer, get_order(blob_size));
+		return -1;
+	}
+
+	mdelay(100);
+
+	kfree(mm_info);
+	mm_info = NULL;
+	free_pages((unsigned long)shared_buffer, get_order(blob_size));
+
+	return 0;
+}
+
+static void __exit mm_loader_exit(void)
+{
+	pr_info(DRIVER_NAME ": DONE\n");
+}
+
+module_init(mm_loader_init);
+module_exit(mm_loader_exit);
+
+MODULE_AUTHOR("Michal Gorlas <michal.gorlas@9elements.com>");
+MODULE_DESCRIPTION("MM Payload loader - installs Linux-owned SMI handler");
+MODULE_LICENSE("GPL v2");
-- 
2.49.0

