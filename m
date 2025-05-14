Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7634B274664
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 10:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747219392; cv=none; b=hNdlLmhRndehEPFu4reqMW6pPUQ/ilqTFETmcyvDLpaxXA7/kQaOdpn8wVV30IvFYkOFbei9RX8P/DMfrTkqMj19jXY/Hp0ZLps9NS8BJfeymWYjbxgyJFxaBJEEVhRJxKfX0eQYDwBaoOhC6HSZWfi1YyLNnVmHH6gIPnACh10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747219392; c=relaxed/simple;
	bh=e/MBru9i0x32CmO404oOZFVYF445BP/6nlpIjIUC0bE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WpWEcfOzO9UOmsXp85Jgj0M+QjoFCbdnZneDl3d1Xg7hD+ut8gJKc35+8m2KZKYXyNZLBq0ZXbuW3DYCKB0RwZKVKkj7y2/loiR5CcRyAJQX2pwudVjM7/9FoigcOq0DwXt7r5yhdg/rcakN64eH5F/9dsFyFqhSMj3mT/819M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u67KQVst; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u67KQVst"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3a0b589a2c6so2381027f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 03:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747219389; x=1747824189; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0VzLG+4jCrLkOaKar5PHuA0l15B/Zk/YdAoRJV8V4Fc=;
        b=u67KQVst2Q1dy21PBaOZBAWxZ5H2l20euVnVKzZWcOPoPE/y5Tg8A+CX2Y7pqLnMxF
         Y2W1e1rs4eHYYaGfhPaVUiTMI+RdfV4+4JCLzimFmZptuM+B0TJHiRNZRehbrVJiMbUa
         /xyvTUKfoHkh13q/A0PbpH3JJga/GD+o4vWjBbGmB2PNPxBAroYL7qA+w5oaZ+agVd8+
         GwZEXQrzVgat6Xr72C9miPcG6ggwcLi8YwgrnKGjsDGtQXkUfYZJ47Bd4CB6gGctbjWf
         uuOKklCuxUuTs+Has8Zh+cl6zYRaN67b70BuErGI5KujBqaSq7dStIcYtf8FZZSUc63n
         bWYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747219389; x=1747824189;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0VzLG+4jCrLkOaKar5PHuA0l15B/Zk/YdAoRJV8V4Fc=;
        b=nrXnBbpoeQ1qF3EdpoVdZF7IID1aw/fi7JIgUy3gn7CmvSbHBseu3SQ+YdGTv8Re9t
         i1SqOnCBb2KdYr+UOnUljN/CPa8FavSRh76BUDOmpNd5k/nGHFbDYqlBmBYz4ZZdD5cc
         niTkGKz8Hnw69NwXl+ejTHRgF/mPTKZRFYrnaYwDrBfhruWPrZoSPlTxZElINl9YR1bU
         00jv7NqYC/MMARVoVH4YtqvUaVGr3fHVPRuZwR6M7RR2uGs4bpxbN446XWlcfdoBsy0b
         yF+QYzhuPxdyML1evBnqUwD0w1y26KbIAqHUCd7rce2vr6iAprurzhDbxO6sjVIT9rnq
         Juqw==
X-Gm-Message-State: AOJu0YzVR5UoRUz3CE0v0sytiMZvnmBzpG0rFuF2XwJDbALB92UNVxbS
	ZYAZCZ2HjAEOMKobYdfjo6yiE8ZsgA7/SMkrJJ8dwGnreFALjpMlcI8pgKht2ji5zhl4hkzDLIq
	IRGKUVHlm/ezBACoDOWAzbvdQZBIoC4GRNL3wZJvJMZF12v+0z9UTByWUTz5eh2SW/sIxYFpIPj
	bvvwusTS2fxESTVm21EZKzIabiE5902w==
X-Google-Smtp-Source: AGHT+IH8fauKfOvfi56CYHzvmseXFVCjYtUpAPd9UQRZNBx+gw+gkPFtrnqib8RaW8T8pocK6W8ylX30
X-Received: from wmbek10.prod.google.com ([2002:a05:600c:3eca:b0:442:c98d:df37])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:2011:b0:3a0:be75:1bb1
 with SMTP id ffacd0b85a97d-3a34991e1d9mr2312697f8f.42.1747219388810; Wed, 14
 May 2025 03:43:08 -0700 (PDT)
Date: Wed, 14 May 2025 12:42:47 +0200
In-Reply-To: <20250514104242.1275040-9-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250514104242.1275040-9-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2969; i=ardb@kernel.org;
 h=from:subject; bh=J+4pNRWP3H+GWumxi+lQpFWOEQDCqKW7T9fIG9bC9eA=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIUOleHm1sEieapNJAse3r5dLr/IedJpymn3JucV+Vj+7s
 gsmp6l1lLIwiHEwyIopsgjM/vtu5+mJUrXOs2Rh5rAygQxh4OIUgIncX8DwVzDXcPM0ydJSz8YP
 wRVs2tdl5/NxnZEp+rJc+lWe39fpbQx/JVarrRdsDPD4/G9zbdAxxQkz5v0tdb+n2r44VdTlyu9 0ZgA=
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250514104242.1275040-13-ardb+git@google.com>
Subject: [PATCH v3 4/7] x86/boot: Set 5-level paging CPU cap before entering C code
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Brian Gerst <brgerst@gmail.com>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

In order for pgtable_l5_enabled() to be reliable wherever it is used and
however early, set the associated CPU capability from asm code before
entering the startup C code.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/include/asm/cpufeature.h | 12 +++++++++---
 arch/x86/kernel/cpu/common.c      |  3 ---
 arch/x86/kernel/head_64.S         | 15 +++++++++++++++
 3 files changed, 24 insertions(+), 6 deletions(-)

diff --git a/arch/x86/include/asm/cpufeature.h b/arch/x86/include/asm/cpufeature.h
index 893cbca37fe9..1b5de40e7bf7 100644
--- a/arch/x86/include/asm/cpufeature.h
+++ b/arch/x86/include/asm/cpufeature.h
@@ -2,10 +2,10 @@
 #ifndef _ASM_X86_CPUFEATURE_H
 #define _ASM_X86_CPUFEATURE_H
 
+#ifdef __KERNEL__
+#ifndef __ASSEMBLER__
 #include <asm/processor.h>
 
-#if defined(__KERNEL__) && !defined(__ASSEMBLER__)
-
 #include <asm/asm.h>
 #include <linux/bitops.h>
 #include <asm/alternative.h>
@@ -137,5 +137,11 @@ static __always_inline bool _static_cpu_has(u16 bit)
 #define CPU_FEATURE_TYPEVAL		boot_cpu_data.x86_vendor, boot_cpu_data.x86, \
 					boot_cpu_data.x86_model
 
-#endif /* defined(__KERNEL__) && !defined(__ASSEMBLER__) */
+#else /* !defined(__ASSEMBLER__) */
+	.macro	setup_force_cpu_cap, cap:req
+	btsl	$\cap % 32, boot_cpu_data+CPUINFO_x86_capability+4*(\cap / 32)(%rip)
+	btsl	$\cap % 32, cpu_caps_set+4*(\cap / 32)(%rip)
+	.endm
+#endif /* !defined(__ASSEMBLER__) */
+#endif /* defined(__KERNEL__) */
 #endif /* _ASM_X86_CPUFEATURE_H */
diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index f6f206743d6a..c8954dc2fb26 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -1752,9 +1752,6 @@ static void __init early_identify_cpu(struct cpuinfo_x86 *c)
 	setup_clear_cpu_cap(X86_FEATURE_PCID);
 #endif
 
-	if (IS_ENABLED(CONFIG_X86_5LEVEL) && (native_read_cr4() & X86_CR4_LA57))
-		setup_force_cpu_cap(X86_FEATURE_5LEVEL_PAGING);
-
 	detect_nopl();
 }
 
diff --git a/arch/x86/kernel/head_64.S b/arch/x86/kernel/head_64.S
index 069420853304..191d5947a762 100644
--- a/arch/x86/kernel/head_64.S
+++ b/arch/x86/kernel/head_64.S
@@ -27,6 +27,7 @@
 #include <asm/fixmap.h>
 #include <asm/smp.h>
 #include <asm/thread_info.h>
+#include <asm/cpufeature.h>
 
 /*
  * We are not able to switch in one step to the final KERNEL ADDRESS SPACE
@@ -58,6 +59,20 @@ SYM_CODE_START_NOALIGN(startup_64)
 	 */
 	mov	%rsi, %r15
 
+#ifdef CONFIG_X86_5LEVEL
+	/*
+	 * Set the X86_FEATURE_5LEVEL_PAGING capability before calling into the
+	 * C code, to give it a consistent view of any global pseudo-constants
+	 * that are derived from pgtable_l5_enabled().
+	 */
+	mov	%cr4, %rax
+	btl	$X86_CR4_LA57_BIT, %eax
+	jnc	0f
+
+	setup_force_cpu_cap X86_FEATURE_5LEVEL_PAGING
+0:
+#endif
+
 	/* Set up the stack for verify_cpu() */
 	leaq	__top_init_kernel_stack(%rip), %rsp
 
-- 
2.49.0.1101.gccaa498523-goog

