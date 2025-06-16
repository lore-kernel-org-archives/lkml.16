Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A83155757
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 14:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750082498; cv=none; b=qci3tgs8Bn8tl9ojoop39thF4Zygody40DIBDnUidQ4Ek9Sw/8tRbzG9FRTaJXND+MwF0vUCGfDBVT5b4oZVv/XYl3Xlmy5KobKiI3tpdLWpkQe33+kwgpySscnxDvqM15Zo/F1AErFTh4JZyvLTQP6lRR82zbgbLqoqFibOkQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750082498; c=relaxed/simple;
	bh=OhggePA2qD54ZdQYLz05ZiyKeW54A4tsVShnOXPiUAo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ENPl4rpiBN5ggUDTgP+Ci6slGvv8Ij741PlWl80cVP+UAGbfa9LcWjuZWKsEDnYeSpJPydikHV+TZp1ABu1EuG9LC+OoNkgrr/eFHbeOyPwWdebojttGykaqiO1Ma3j6Af8k/UsWmXj/uJiqMjIKb9JbsQKJpiGEDRVjGM9+Peg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=TJxc64ZY; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="TJxc64ZY"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a57c8e247cso1243911f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 07:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1750082495; x=1750687295; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZqHIgPku1G85131t+riL0hFm9G+EHIU6siJ5JIT1N8w=;
        b=TJxc64ZYfLTH5+7usBTt7e/zQS4yDkydAQ2q1PsKx/VTiZXHyVygp6HZpD3Y6Dle4d
         ZRlWGI656UnXPzCwhMOOqNTg/3qPZ5UA25s3qhMtPPjWozTKTwZLx+gVa7/ZXNBS9zfu
         Zk5BtunOCIqxdU6bWncT9kU9t6TMUN2lxsd7DvESntYdEwxgxVvbY02hZioANrETX5WO
         SCYHd+2ju7UQboU2P5MptkmqOZnJXKXtzUKfocsOFVD4koCVwSVDpKXzSgwdvmwje7jX
         7Pe6FehwOBUUMUowBpANkQuI+w1LR5fQM3OK36LPMsX6VFmrzB6vWfhgU07Hs/q1z4mq
         njpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750082495; x=1750687295;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZqHIgPku1G85131t+riL0hFm9G+EHIU6siJ5JIT1N8w=;
        b=HdWSGFi39RIm8vR2RjXPQ5pJBitVWWXKA0zkehnEbj0jNbKI4f2YRZQHQ8BDCx3eJr
         zGNasmfQM9NtoyEgn6FfTKO9AvaUXAC/+nRLhonPQrJjDoitTZK4YkRPx4PQ+7sWgLOZ
         IGW8qHbv0q+FEaZDXhN3/wfSl4QCEeNnnoY/Zkxm44z7muEo7pKDY0JqMbSvxS/pUyQx
         5Il/50+pw8Qq7+OZPNplSrGnHCmebIPgUiq9QnqqZ9w4HVMm5VpXTq28TeyROjFR/JlA
         jyji1xwH6r7A3Khyhg0eW/3mEn8J8eBctB4t8X1Mql0AUNzj2cY+C96xlHdkJXYCIAq5
         JVhg==
X-Gm-Message-State: AOJu0YzPQxhnv7AqBObP9zbx6xM4mnBegKmNaoNMOBHdPkUZeTgkxIOn
	HVhP2o9jJ+tZFLf149SC+g4BYe2WAlpUyatHbsx8ipTrf0IoejBsV823bwCu72brIQ==
X-Gm-Gg: ASbGncuebJJ8aq/o6AOrGwsWVsL0vjIm2CgtzzSdeoiT6Lo72MQoLy0qOLGqKAfppm0
	53XhKV0nXCM0Y2bfhJsABJ6gHjB6pLyZ+vY00aXXUyeknhDag99wGr161QsjBMBzHez8EG1k/nS
	+u/alUdbnXm4s0WuMuiAvFQQ5YmqU9Kx8XfrRqoQpvyWzYjOdywfvWsb6WA6PpFmHrhv5b5a4h3
	655zK0pzxRwJV4xxFJnc/mwFnyLBPJfpUsI9GfWUP2e4212/WiywLK55MUBMI56NdAdD7r/r5Vi
	QHtKJsKIhs3QdYyq3gL6pJ3JLzH7nw8bU9hNoFOGAptuT+NdfuGzAKveDjpcWOzINdSZL/nDu1N
	1kiGHh4Xeg9wlNCKVA63hCvh1aOuiXWwBk1Vm6GFHQWlSjA==
X-Google-Smtp-Source: AGHT+IEqzW6rWVyZvdSqgOpGvjP+J66yzSAmrNNffA5lK6o88XtZtTA1LzRJx5Y9U19X1fvqy4PYwg==
X-Received: by 2002:a05:6000:4308:b0:3a4:d6ed:8e00 with SMTP id ffacd0b85a97d-3a572e6bc57mr8249307f8f.33.1750082494204;
        Mon, 16 Jun 2025 07:01:34 -0700 (PDT)
Received: from [10.93.128.132] (ip-078-094-000-050.um19.pools.vodafone-ip.de. [78.94.0.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a7e51esm11057004f8f.40.2025.06.16.07.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 07:01:33 -0700 (PDT)
From: Michal Gorlas <michal.gorlas@9elements.com>
Date: Mon, 16 Jun 2025 16:01:14 +0200
Subject: [PATCH v2 3/3] firmware: coreboot: Linux-owned SMI handler to be
 loaded by coreboot
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-coreboot-payload-mm-v2-3-5d679b682e13@9elements.com>
References: <20250616-coreboot-payload-mm-v2-0-5d679b682e13@9elements.com>
In-Reply-To: <20250616-coreboot-payload-mm-v2-0-5d679b682e13@9elements.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>, 
 Brian Norris <briannorris@chromium.org>, 
 Julius Werner <jwerner@chromium.org>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
 Marcello Sylvester Bauer <marcello.bauer@9elements.com>, 
 Michal Gorlas <michal.gorlas@9elements.com>
X-Mailer: b4 0.14.2

Compiled in similar fashion to the realmode trampolines for x86. Currently
supported are two SMIs: ACPI enable and disable. After being placed in SMRAM,
this handler takes over handling of the supported SMIs from coreboot.

Signed-off-by: Michal Gorlas <michal.gorlas@9elements.com>
---
 drivers/firmware/google/mm_handler/.gitignore    |   4 +
 drivers/firmware/google/mm_handler/Makefile      |  51 +++
 drivers/firmware/google/mm_handler/handler.lds.S |  46 ++
 drivers/firmware/google/mm_handler/mm_handler.S  | 510 +++++++++++++++++++++++
 drivers/firmware/google/mm_handler/mm_handler.h  |  21 +
 drivers/firmware/google/mm_handler/mm_header.S   |  19 +
 6 files changed, 651 insertions(+)

diff --git a/drivers/firmware/google/mm_handler/.gitignore b/drivers/firmware/google/mm_handler/.gitignore
new file mode 100644
index 0000000000000000000000000000000000000000..662f71dca9ce9dceeaf526746a6f323044296439
--- /dev/null
+++ b/drivers/firmware/google/mm_handler/.gitignore
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-only
+pasyms.h
+handler.lds
+handler.relocs
diff --git a/drivers/firmware/google/mm_handler/Makefile b/drivers/firmware/google/mm_handler/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..c0069e88f51dc536878429c8e1504e9376932c04
--- /dev/null
+++ b/drivers/firmware/google/mm_handler/Makefile
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: GPL-2.0
+
+## Based on realmode/rm/Makefile
+
+always-y := handler.bin handler.relocs
+
+handler-y			+= mm_header.o
+handler-y			+= mm_handler.o
+
+targets	+= $(handler-y)
+
+REALMODE_OBJS = $(addprefix $(obj)/,$(handler-y))
+
+sed-pasyms := -n -r -e 's/^([0-9a-fA-F]+) [ABCDGRSTVW] (.+)$$/pa_\2 = \2;/p'
+
+quiet_cmd_pasyms = PASYMS  $@
+      cmd_pasyms = $(NM) $(real-prereqs) | sed $(sed-pasyms) | sort | uniq > $@
+
+targets += pasyms.h
+$(obj)/pasyms.h: $(REALMODE_OBJS) FORCE
+	$(call if_changed,pasyms)
+
+targets += handler.lds
+$(obj)/handler.lds: $(obj)/pasyms.h
+
+LDFLAGS_handler.elf := -m elf_i386 --emit-relocs -T
+CPPFLAGS_handler.lds += -P -C -I$(objtree)/$(obj)
+
+targets += handler.elf
+$(obj)/handler.elf: $(obj)/handler.lds $(REALMODE_OBJS) FORCE
+	$(call if_changed,ld)
+
+OBJCOPYFLAGS_handler.bin := -O binary
+
+targets += handler.bin
+$(obj)/handler.bin: $(obj)/handler.elf $(obj)/handler.relocs FORCE
+	$(call if_changed,objcopy)
+
+quiet_cmd_relocs = RELOCS  $@
+      cmd_relocs = arch/x86/tools/relocs --realmode $< > $@
+
+targets += handler.relocs
+$(obj)/handler.relocs: $(obj)/handler.elf FORCE
+	$(call if_changed,relocs)
+
+# ---------------------------------------------------------------------------
+
+KBUILD_CFLAGS	:= $(REALMODE_CFLAGS) -D_SETUP -D_WAKEUP \
+		   -I$(srctree)/arch/x86/boot
+KBUILD_AFLAGS	:= $(KBUILD_CFLAGS) -D__ASSEMBLY__
+KBUILD_CFLAGS	+= -fno-asynchronous-unwind-tables
diff --git a/drivers/firmware/google/mm_handler/handler.lds.S b/drivers/firmware/google/mm_handler/handler.lds.S
new file mode 100644
index 0000000000000000000000000000000000000000..c92c9f2fbd624d0d988be0bd0215f70c3e4284e0
--- /dev/null
+++ b/drivers/firmware/google/mm_handler/handler.lds.S
@@ -0,0 +1,46 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * blob.lds.S
+ *
+ * Linker script for the MM handler. Based on realmode.lds.S
+ */
+
+#include <asm/page_types.h>
+
+#undef i386
+
+OUTPUT_FORMAT("elf32-i386")
+OUTPUT_ARCH(i386)
+ENTRY(pa_text_start)
+
+SECTIONS
+{
+	. = 0;
+	.header : {
+		*(.header)
+	}
+
+	pa_text_start = .;
+	.text32 : {
+		*(.text32)
+		*(.text32.*)
+	}
+
+	.text64 : {
+		*(.text64)
+		*(.text64.*)
+	}
+
+	. = ALIGN(128);
+	.bss : {
+		*(.bss*)
+	}
+
+	/DISCARD/ : {
+		*(.data*)
+		*(.note*)
+		*(.debug*)
+	}
+
+#include "pasyms.h"
+}
diff --git a/drivers/firmware/google/mm_handler/mm_handler.S b/drivers/firmware/google/mm_handler/mm_handler.S
new file mode 100644
index 0000000000000000000000000000000000000000..19322010a4231cbd7d9c0aac5605a56eac098789
--- /dev/null
+++ b/drivers/firmware/google/mm_handler/mm_handler.S
@@ -0,0 +1,510 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ *	Payload owned SMI handler that is placed in SMRAM (mm_loader.c) and called
+ *	by coreboot's SMI handler
+ *
+ *	Also the general comment in arch/x86/realmode/rm/trampoline_64.S is relevant
+ *	here as well.
+ */
+
+#include <linux/linkage.h>
+#include <asm/pgtable_types.h>
+#include <asm/page_types.h>
+#include <asm/msr.h>
+#include <asm/segment.h>
+#include <asm/processor-flags.h>
+#include <asm/realmode.h>
+
+#include "mm_handler.h"
+
+	.section ".text32","ax"
+	.code32
+	.balign 4
+SYM_CODE_START(mm_entry_32)
+	mov	$0x3f8, %dx
+	mov	$'L', %al
+	out	%al, (%dx)
+	mov	$'i', %al
+	out	%al, (%dx)
+	mov	$'n', %al
+	out	%al, (%dx)
+	mov	$'u', %al
+	out	%al, (%dx)
+	mov	$'x', %al
+	out	%al, (%dx)
+	mov	$' ', %al
+	out	%al, (%dx)
+	mov	$'S', %al
+	out	%al, (%dx)
+	mov	$'M', %al
+	out	%al, (%dx)
+	mov	$'I', %al
+	out	%al, (%dx)
+	mov	$' ', %al
+	out	%al, (%dx)
+	mov	$'h', %al
+	out	%al, (%dx)
+	mov	$'a', %al
+	out	%al, (%dx)
+	mov	$'n', %al
+	out	%al, (%dx)
+	mov	$'d', %al
+	out	%al, (%dx)
+	mov	$'l', %al
+	out	%al, (%dx)
+	mov	$'e', %al
+	out	%al, (%dx)
+	mov	$'r', %al
+	out	%al, (%dx)
+	mov	$' ', %al
+	out	%al, (%dx)
+	mov	$'s', %al
+	out	%al, (%dx)
+	mov	$'t', %al
+	out	%al, (%dx)
+	mov	$'a', %al
+	out	%al, (%dx)
+	mov	$'r', %al
+	out	%al, (%dx)
+	mov	$'t', %al
+	out	%al, (%dx)
+	mov	$'i', %al
+	out	%al, (%dx)
+	mov	$'n', %al
+	out	%al, (%dx)
+	mov	$'g', %al
+	out	%al, (%dx)
+	mov	$'\n', %al
+	out	%al, (%dx)
+
+	push	%esp
+	// ebx, esi, edi and ebp are going to be preserved
+	// (see comment in smm_stub.S if target is x86_64)
+	push	%ebx
+	push	%esi
+	push	%edi
+	push	%ebp
+	push	%eax
+
+	/*
+	 * Switch-case to jump to appropriate section for given functionality.
+	 * Macros are defined in mm_handler.h.
+	 * Short explaination of where does the magic n(%esp) came from.
+	 * Calling mm_entry_32 from coreboot pushes lb_entry_context
+	 * (see include/payload_mm_interface.h) to stack and
+	 * increments esp by 4, so now our stack looks like this:
+	 * | third arg |
+	 * | second arg |
+	 * | first arg |
+	 * | return address |
+	 * | stack pointer | <- esp
+	 * Then we push all the registers (see above) and hence our stack looks like this now:
+	 * | third arg |
+	 * | second arg |
+	 * | first arg |
+	 * | return address |
+	 * | esp |
+	 * | ebx |
+	 * | esi |
+	 * | edi |
+	 * | ebp |
+	 * | eax |
+	 * | stack pointer | <- esp
+	 * So, now to get the entry we need, we do (9 * 4)(%esp) to get third
+	 * argument (ACPI base address), (8 * 4)(%esp) to get second argument
+	 * (PM1_CNT byte), and (7 * 4) to get the command.
+	 */
+
+	cmpl $MM_ACPI_ENABLE, 28(%esp)
+	je acpi_enable32
+
+	cmpl $MM_ACPI_DISABLE, 28(%esp)
+	je acpi_disable32
+
+	cmpl $MM_STORE, 28(%esp)
+	je mm_store32
+
+	jmp restore_cb_state
+
+acpi_enable32:
+	mov	$0x3f8, %dx
+	mov	$'E', %al
+	out	%al, (%dx)
+	mov	$'n', %al
+	out	%al, (%dx)
+	mov	$'a', %al
+	out	%al, (%dx)
+	mov	$'b', %al
+	out	%al, (%dx)
+	mov	$'l', %al
+	out	%al, (%dx)
+	mov	$'i', %al
+	out	%al, (%dx)
+	mov	$'n', %al
+	out	%al, (%dx)
+	mov	$'g', %al
+	out	%al, (%dx)
+	mov	$' ', %al
+	out	%al, (%dx)
+	mov	$'A', %al
+	out	%al, (%dx)
+	mov	$'C', %al
+	out	%al, (%dx)
+	mov	$'P', %al
+	out	%al, (%dx)
+	mov	$'I', %al
+	out	%al, (%dx)
+	mov	$'\n', %al
+	out	%al, (%dx)
+
+	// PM1_CNT & ~SCI_EN
+	mov	32(%esp), %ax
+	add	$MM_ACPI_ENABLE, %ax
+
+	// ACPI_BASE_ADDR
+	mov	36(%esp), %dx
+
+	out	%ax, %dx
+
+	jmp	restore_cb_state
+
+acpi_disable32:
+	mov	$0x3f8, %dx
+	mov	$'D', %al
+	out	%al, (%dx)
+	mov	$'i', %al
+	out	%al, (%dx)
+	mov	$'s', %al
+	out	%al, (%dx)
+	mov	$'a', %al
+	out	%al, (%dx)
+	mov	$'b', %al
+	out	%al, (%dx)
+	mov	$'l', %al
+	out	%al, (%dx)
+	mov	$'i', %al
+	out	%al, (%dx)
+	mov	$'n', %al
+	out	%al, (%dx)
+	mov	$'g', %al
+	out	%al, (%dx)
+	mov	$' ', %al
+	out	%al, (%dx)
+	mov	$'A', %al
+	out	%al, (%dx)
+	mov	$'C', %al
+	out	%al, (%dx)
+	mov	$'P', %al
+	out	%al, (%dx)
+	mov	$'I', %al
+	out	%al, (%dx)
+	mov	$'\n', %al
+	out	%al, (%dx)
+
+	// PM1_CNT | SCI_EN
+	mov	32(%esp), %ax
+	add	$MM_ACPI_DISABLE, %ax
+
+	// ACPI_BASE_ADDR
+	mov	36(%esp), %dx
+
+	out	%ax, %dx
+
+	jmp	restore_cb_state
+
+mm_store32:
+	// Not implemented yet. Probably would be better to do that in C.
+
+restore_cb_state:
+	mov	$0x3f8, %dx
+	mov	$'M', %al
+	out	%al, (%dx)
+	mov	$'M', %al
+	out	%al, (%dx)
+	mov	$' ', %al
+	out	%al, (%dx)
+	mov	$'r', %al
+	out	%al, (%dx)
+	mov	$'e', %al
+	out	%al, (%dx)
+	mov	$'t', %al
+	out	%al, (%dx)
+	mov	$'u', %al
+	out	%al, (%dx)
+	mov	$'r', %al
+	out	%al, (%dx)
+	mov	$'n', %al
+	out	%al, (%dx)
+	mov	$'s', %al
+	out	%al, (%dx)
+	mov	$'\n', %al
+	out	%al, (%dx)
+
+	pop	%eax
+	pop	%ebp
+	pop	%edi
+	pop	%esi
+	pop	%ebx
+	pop	%esp
+
+	ret
+SYM_CODE_END(mm_entry_32)
+
+
+	.section ".text64","ax"
+	.code64
+	.balign 4
+SYM_CODE_START(mm_entry_64)
+	mov	$0x3f8, %dx
+	mov	$'L', %al
+	out	%al, (%dx)
+	mov	$'i', %al
+	out	%al, (%dx)
+	mov	$'n', %al
+	out	%al, (%dx)
+	mov	$'u', %al
+	out	%al, (%dx)
+	mov	$'x', %al
+	out	%al, (%dx)
+	mov	$' ', %al
+	out	%al, (%dx)
+	mov	$'S', %al
+	out	%al, (%dx)
+	mov	$'M', %al
+	out	%al, (%dx)
+	mov	$'I', %al
+	out	%al, (%dx)
+	mov	$' ', %al
+	out	%al, (%dx)
+	mov	$'h', %al
+	out	%al, (%dx)
+	mov	$'a', %al
+	out	%al, (%dx)
+	mov	$'n', %al
+	out	%al, (%dx)
+	mov	$'d', %al
+	out	%al, (%dx)
+	mov	$'l', %al
+	out	%al, (%dx)
+	mov	$'e', %al
+	out	%al, (%dx)
+	mov	$'r', %al
+	out	%al, (%dx)
+	mov	$' ', %al
+	out	%al, (%dx)
+	mov	$'s', %al
+	out	%al, (%dx)
+	mov	$'t', %al
+	out	%al, (%dx)
+	mov	$'a', %al
+	out	%al, (%dx)
+	mov	$'r', %al
+	out	%al, (%dx)
+	mov	$'t', %al
+	out	%al, (%dx)
+	mov	$'i', %al
+	out	%al, (%dx)
+	mov	$'n', %al
+	out	%al, (%dx)
+	mov	$'g', %al
+	out	%al, (%dx)
+	mov	$'\n', %al
+	out	%al, (%dx)
+
+	pushq	%rsp
+
+	pushq	%rbp
+	pushq	%rbx
+	pushq	%r12
+	pushq	%r13
+	pushq	%r14
+	pushq	%r15
+
+	movq	%cr3, %rax
+	pushq	%rax
+
+	movq	%cr4, %rbx
+	pushq	%rbx
+	or	$0x640, %rbx
+
+	movq	%rbx, %cr4
+
+	movq	%cr0, %rbx
+	pushq	%rbx
+	or	$0x22, %rbx
+
+	mov	%rbx, %cr0
+
+	movq	%rsp, %r12
+	andq	$~0xF, %rsp
+
+	subq	$0x200, %rsp
+	fxsave64 (%rsp)
+
+	/*
+	 * All the macros we compare (r)di to are defined in mm_handler.h
+	 * This differs a bit from what we do above, as ABI calling convention
+	 * is not the same for protected and long mode. First two elements of
+	 * the struct fits rdi. Command is in the first byte of the rdi,
+	 * so we can just read of di.
+	 */
+	cmp $MM_ACPI_DISABLE, %di
+	je acpi_disable
+
+	cmp $MM_ACPI_ENABLE, %di
+	je acpi_enable
+
+	cmp $MM_STORE, %di
+	je mm_store
+
+	jmp restore_cb_state64
+
+acpi_enable:
+	mov	$0x3f8, %dx
+	mov	$'E', %al
+	out	%al, (%dx)
+	mov	$'n', %al
+	out	%al, (%dx)
+	mov	$'a', %al
+	out	%al, (%dx)
+	mov	$'b', %al
+	out	%al, (%dx)
+	mov	$'l', %al
+	out	%al, (%dx)
+	mov	$'i', %al
+	out	%al, (%dx)
+	mov	$'n', %al
+	out	%al, (%dx)
+	mov	$'g', %al
+	out	%al, (%dx)
+	mov	$' ', %al
+	out	%al, (%dx)
+	mov	$'A', %al
+	out	%al, (%dx)
+	mov	$'C', %al
+	out	%al, (%dx)
+	mov	$'P', %al
+	out	%al, (%dx)
+	mov	$'I', %al
+	out	%al, (%dx)
+	mov	$'\n', %al
+	out	%al, (%dx)
+
+	// Stash the command from rdi.
+	shr	$32, %rdi
+	// PM1_CNT & ~SCI_EN
+	mov	%di, %ax
+	add	$MM_ACPI_ENABLE, %ax
+	// si contains ACPI_BASE_ADDR
+	mov	%si, %dx
+
+	out	%ax, %dx
+
+	jmp	restore_cb_state64
+
+acpi_disable:
+	mov	$0x3f8, %dx
+	mov	$'D', %al
+	out	%al, (%dx)
+	mov	$'i', %al
+	out	%al, (%dx)
+	mov	$'s', %al
+	out	%al, (%dx)
+	mov	$'a', %al
+	out	%al, (%dx)
+	mov	$'b', %al
+	out	%al, (%dx)
+	mov	$'l', %al
+	out	%al, (%dx)
+	mov	$'i', %al
+	out	%al, (%dx)
+	mov	$'n', %al
+	out	%al, (%dx)
+	mov	$'g', %al
+	out	%al, (%dx)
+	mov	$' ', %al
+	out	%al, (%dx)
+	mov	$'A', %al
+	out	%al, (%dx)
+	mov	$'C', %al
+	out	%al, (%dx)
+	mov	$'P', %al
+	out	%al, (%dx)
+	mov	$'I', %al
+	out	%al, (%dx)
+	mov	$'\n', %al
+	out	%al, (%dx)
+
+	// Stash command
+	shr	$32, %rdi
+	// PM1_CNT | SCI_EN
+	mov	%di, %ax
+	add	$MM_ACPI_DISABLE, %ax
+	// si contains ACPI_BASE_ADDR
+	mov	%si, %dx
+
+	out	%ax, %dx
+
+	jmp	restore_cb_state64
+
+mm_store:
+	// see comment above in mm_store32
+
+restore_cb_state64:
+	mov	$0x3f8, %dx
+	mov	$'M', %al
+	out	%al, (%dx)
+	mov	$'M', %al
+	out	%al, (%dx)
+	mov	$'6', %al
+	out	%al, (%dx)
+	mov	$'4', %al
+	out	%al, (%dx)
+	mov	$' ', %al
+	out	%al, (%dx)
+	mov	$'r', %al
+	out	%al, (%dx)
+	mov	$'e', %al
+	out	%al, (%dx)
+	mov	$'t', %al
+	out	%al, (%dx)
+	mov	$'u', %al
+	out	%al, (%dx)
+	mov	$'r', %al
+	out	%al, (%dx)
+	mov	$'n', %al
+	out	%al, (%dx)
+	mov	$'s', %al
+	out	%al, (%dx)
+	mov	$'\n', %al
+	out	%al, (%dx)
+
+	fxrstor64 (%rsp)
+	addq	$0x200, %rsp
+	movq	%r12, %rsp
+
+	popq	%rbx
+	movq	%rbx, %cr0
+
+	popq	%rbx
+	movq	%rbx, %cr4
+
+	popq	%rax
+	movq	%rax, %cr3
+
+	popq	%r15
+	popq	%r14
+	popq	%r13
+	popq	%r12
+	popq	%rbx
+	popq	%rbp
+	popq	%rsp
+	ret
+SYM_CODE_END(mm_entry_64)
+
+	.bss
+	.balign	4
+SYM_DATA(mm_signature,		.space 4)
+SYM_DATA(mm_blob_size,		.space 2)
+SYM_DATA(mm_entry_32_offset,	.space 4)
+SYM_DATA(mm_entry_64_offset,	.space 4)
diff --git a/drivers/firmware/google/mm_handler/mm_handler.h b/drivers/firmware/google/mm_handler/mm_handler.h
new file mode 100644
index 0000000000000000000000000000000000000000..4f32f84371d5cff3fcf6c9d1c1c33a2d2b50118e
--- /dev/null
+++ b/drivers/firmware/google/mm_handler/mm_handler.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Derived from arch/x86/include/realmode.h
+ */
+
+#ifndef _MM_HANDLER_H
+#define _MM_HANDLER_H
+
+#define REALMODE_END_SIGNATURE	0x65a22c82
+
+/*
+ * These macros correspond to the arguments
+ * passed by coreboot's SMI handler. Depending
+ * on which one is passed in rdi or esp + x, handler
+ * will jump to the appropriate section.
+ */
+#define MM_ACPI_ENABLE		1
+#define MM_ACPI_DISABLE		0
+#define MM_STORE		2
+
+#endif /* _MM_HANDLER_H */
diff --git a/drivers/firmware/google/mm_handler/mm_header.S b/drivers/firmware/google/mm_handler/mm_header.S
new file mode 100644
index 0000000000000000000000000000000000000000..342cd60492f89f8bea8d7051650365d1eaad4c2e
--- /dev/null
+++ b/drivers/firmware/google/mm_handler/mm_header.S
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * MM blob header; this should match mm_payload.h
+ */
+
+#include <linux/linkage.h>
+#include <asm/page_types.h>
+#include <asm/segment.h>
+
+	.section ".header", "a"
+
+	.balign	16
+SYM_DATA_START(mm_header)
+	.long	pa_text_start
+	.long	pa_mm_entry_32
+	.long	pa_mm_entry_64
+	.long	pa_mm_signature
+	.long	pa_mm_blob_size
+SYM_DATA_END(mm_header)

-- 
2.49.0

