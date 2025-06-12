Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133702550CF
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 14:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749737195; cv=none; b=FH0LUlYC6gMmII3f3LPZgfSKllEvGy9VTjSKkjcH/LVQ8h7WY2l2A95pccvGBH3JiWJtUZjdEk7ert7IeXXYwfgLNEEJKAL7rBghNQmu3iE1e3tljpvft1+787qI0hHOZSgtNRhVrb4PSrzyMlRojbThIaGaXcnNzjMICmreyQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749737195; c=relaxed/simple;
	bh=mfWezHqZ69SfrMRD9+de+DgrTfr/1i5Qvkh6dDttL+I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hMOHcHnhl1r8bzmbNyzkknE2FXpP7gbacd05KbnoVMyzJnhRJcRJzErpgvfuHiMzc0vgzJDSKlLpFhZ6mzfyhXHAGokKILLZqnSM9xbrD2s/FvFcFt5jk5vWT8gvCjRs3rcefGM/4RWlSMMSlfGBjVWy31JMalumK5ppql02B3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=S9yiF8Zm; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="S9yiF8Zm"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-450dd065828so7516155e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 07:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1749737191; x=1750341991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nsMoW2eyc6a3dPmw9zfy6oyivDeMhJp2ZnclpV72Dfk=;
        b=S9yiF8ZmO68jt2ln9biGzweQfOB3gpuQBAG1hKm5/JaovHYy7DyrffsHfUwzkN8fS4
         SkGrjSEkdUKiYEGCAtInPU844ri5zL+kmP03LhtaT6UQISKb+JjgCYFZTiogHMlpAAzg
         oj2ePfglBhpHNvO8LFbO7k+4jdRQgUfKzV9hfdE/7uvDMrBJ1JAzcAKWtjb8UG2lOiWY
         XCs0QMkKP8vPEhIHMogSZUQMnKn6ojQYb2KQMaZJmK0hy2PnrrCUqgh5ZNMwFd4tvqnN
         kN+CWNxjEWKsfz1Jhtf8508eP+mX0GUFyUN+rWPP+qYyltCRwP3raTDno/yXLqX4Jz00
         q3+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749737191; x=1750341991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nsMoW2eyc6a3dPmw9zfy6oyivDeMhJp2ZnclpV72Dfk=;
        b=ke852lfzxq5Ms6QFayQG9DcxEWnkwvCVO+M0fVIXOv1X+RAroz77tfLjen6USAW6FN
         xAgGo6+FL/UQdhjb43mjOS546ZYGbcRH5mB97J0jXqdpYz9nu+xhdJGybQe9RH2Vi/5d
         55s+5jm0wHi3YH2ADIiCwhF5HIe+Nnf1ww7vj+7epBZ19PEQ6Zf7gIyuC6vbEybDrI/B
         aWRQE7EVBYBRw3qHt1KMrmW8mpqok+qa4HwsEJTp7a3xJHxWHkLsNht9SgGo/EEzd0PZ
         /iVmG0BKR/wuUGC1QW/nr0i7rRnz0jsdXjUcIXbx1k9QMBNnawVrBXHF7qv3fMTfCWOk
         3KFg==
X-Forwarded-Encrypted: i=1; AJvYcCXu8O33ekqFaDtiqd0wXjryvOlOs2oI/wuQWdZYpG2qi/AVMQS7BuSNmStqyWaDIdEIEruHkRFE4GDlEcA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywicui1x73Uwjk11KWLl9fGysXmugvhGJrUzukVXFgXXiw05syl
	Zc+d9626J4jhhwy84IoFUsxB48Q/834efol7w8qABMsGXKTtW6V6L7UJvMYiR5QpRzd0sGG7NAo
	9QyY=
X-Gm-Gg: ASbGncvqoNbZ+LH9qd5hcHmb00irfDYed7N1wBY5+HCGS/udaY/stujnqHZWSI4Y4tG
	rCPbEVXL7yCEi11e14ZgukbZAnf4/jyJLp3lJmLuhkr/zzgIxXgUOlv7ikGkPuuc9EL/EIsLhdB
	ZvWBLiiD27e1ji1V1xouRc9MhijGWNOOwDIocVpCkMJGam/lZ/f1WX/p3S/ChPzUXdLhzfEQaG7
	XhPFl9UDv6AzFBj5u+S2ue8R1fFNttp1WCF+sQL+bX7sN8Kw95hGOATLdyg3d3FVAGxx938hNkQ
	J8RWwZN8TxVXjS/qJltourcKZNaMMBq2yMXhJBO7mCYsgt4JYduvE6lZpIDsyPAFyOUbvRv29Q6
	RXWpfj7GemdlikfRryHrXy1LAerUyeBsLW6GrXE/0ebo7qj6LNSXPDyko8nf+DA==
X-Google-Smtp-Source: AGHT+IG8ouQoHyDeWwxF+RL7pMIKnoWtdpgcswyByWeVsUi4jLrRHNAd3ICgXR5CNqkwv/IXbinJdw==
X-Received: by 2002:a05:6000:2c13:b0:3a4:e665:ca5 with SMTP id ffacd0b85a97d-3a5606e6c8amr3196568f8f.23.1749737190796;
        Thu, 12 Jun 2025 07:06:30 -0700 (PDT)
Received: from cyber-t14sg4.sec.9e.network (ip-078-094-000-050.um19.pools.vodafone-ip.de. [78.94.0.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a561a3ce6bsm2078875f8f.49.2025.06.12.07.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 07:06:30 -0700 (PDT)
From: Michal Gorlas <michal.gorlas@9elements.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Julius Werner <jwerner@chromium.org>
Cc: marcello.bauer@9elements.com,
	Michal Gorlas <michal.gorlas@9elements.com>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/3] firmware: coreboot: Linux-owned SMI handler to be loaded by coreboot
Date: Thu, 12 Jun 2025 16:05:50 +0200
Message-ID: <410d4d62b031d0e751e1933cf746540d5cb1682c.1749734094.git.michal.gorlas@9elements.com>
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

Compiled in similar fashion to the realmode trampolines for x86. Currently
supported are two SMIs: ACPI enable and disable. After being placed in SMRAM,
this handler takes over handling of the supported SMIs from coreboot.

Signed-off-by: Michal Gorlas <michal.gorlas@9elements.com>
---
 drivers/firmware/google/mm_handler/Makefile   |  51 ++
 .../firmware/google/mm_handler/handler.lds.S  |  46 ++
 .../firmware/google/mm_handler/mm_handler.S   | 510 ++++++++++++++++++
 .../firmware/google/mm_handler/mm_handler.h   |  21 +
 .../firmware/google/mm_handler/mm_header.S    |  19 +
 5 files changed, 647 insertions(+)
 create mode 100644 drivers/firmware/google/mm_handler/Makefile
 create mode 100644 drivers/firmware/google/mm_handler/handler.lds.S
 create mode 100644 drivers/firmware/google/mm_handler/mm_handler.S
 create mode 100644 drivers/firmware/google/mm_handler/mm_handler.h
 create mode 100644 drivers/firmware/google/mm_handler/mm_header.S

diff --git a/drivers/firmware/google/mm_handler/Makefile b/drivers/firmware/google/mm_handler/Makefile
new file mode 100644
index 000000000000..c0069e88f51d
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
index 000000000000..c92c9f2fbd62
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
index 000000000000..19322010a423
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
index 000000000000..4f32f84371d5
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
index 000000000000..342cd60492f8
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

