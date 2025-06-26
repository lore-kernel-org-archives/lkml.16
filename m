Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5613C2E8DFF
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 13:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750945343; cv=none; b=tGew2A41oJxbNjWv2BUAMa4kxU8ytOud5Wo56pi+3c2JfMfMnjcEFCKQhhmoyP3BU9HmGQTpqOTx/Pbj4jJp1tJzd0UfQMgqmZL08MWo+wYLxLcDwxBPqw3w6j97TvK77OqDs+laHk5sNfFNpWqgN3c1tJrtbEe/GzCQ4W93PKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750945343; c=relaxed/simple;
	bh=SDpsO4zpal7cMoZ+kn3wHZTLrwHqGZDZWdZpzGWZ7dU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=L/3bVOS9yp+sZ2NM1Z5BSYoA5SMdL2GAy9PjdE9QfrYG0LFh+pd7qZ56f4JxwyYyvL+zA61St3+HEbBFIImkVLJ6y/wl52X0PF4tQdXM2KjayaZU+buFtpR+1ggNdSUPdpKapjTRQ2os4EtKiTbJdewFNT6XDOQwl3SD5l+gL1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--glider.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Nc86VJV2; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--glider.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Nc86VJV2"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3a6d90929d6so431652f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 06:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750945339; x=1751550139; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yNvNdo60faam5nFnHvZbzCMJ04X3V7FkkVfM1Z/F4Ac=;
        b=Nc86VJV2FWb0JBdNhjcgmjESTerRASNbo4hfO6Dj0LxJ5O6uqJ4TzriIe+WoreXtvB
         78+R2lkuwMrj3gD3QhQvEMPBp49KwtCIwRH7PLe9VE2G1/6a7nNV8+peCrnOzxo0P1ok
         pknFowM8GNBm7ux5uVwaFCDrXrgom5BhFndY9v8FMhWMXOXNH0e6PYIf9FH/Y9EBMH/J
         pWa6EZxSpkU5nCxVX74LKn1akE19qOnj3wiDOiivMoVYtWaViNNlOErqdVtSyjPS4Dc5
         u4Zomko2vaEHoQoP0gnq/btmcVm1/B4EypVrjpTW2X9p643KHk+IMGoem2HJSNTCNyq2
         esyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750945339; x=1751550139;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yNvNdo60faam5nFnHvZbzCMJ04X3V7FkkVfM1Z/F4Ac=;
        b=VHk5Fxtz9JSMxxAHxDU8pk7A3d9BE05/NYr4gOgC53ioHUmcgHcxNbntb2tOKYs7/v
         MCxzSCCfbr/rzDed5FHUkJjk73UeZXhCbjxQDZ9UFs6SULH8uSYmpipyTCCdfZInSCnl
         Vn2JC4MtoB37q59ihkDjmlbtxgkURDn+UNxwNkFGhLBE+j9ZxA3w2lbuQM/xwp43CDg9
         sSn1uZOtkLyDW2/b4YPmiLfMh6oXZdS93t9IpnrfQSdQ1f+pnThhp9qj9rUXYuqpr0rp
         +TWwUAK0U7Ie1ldEMN3EZCQVWNiEf+HNuL++DV3gqDJvBlpibeBV615IK19Ft8KLAjM0
         uv4g==
X-Forwarded-Encrypted: i=1; AJvYcCVOWRUHS7XTafg2v+QwHTIIVXDE5e7JJxXo4WU9dhzwH0fADXxXnOpx5lKV0mqT0Vj4C6A87W+2gQqgZUU=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe/BDdQDs5hEYc15ghBL0Quur8pc+nSRNt/t2siGiA/xiRUz1Z
	R+BfmVi6SvDT3Xkuls+U6cWCHKtpm28OWyoCKD97D2AoB5JGw9pLRXSMdryrYJij8rKt/yu6nbS
	KzUiQhw==
X-Google-Smtp-Source: AGHT+IFAobGVtIvf5Sucv9bQxprDVPwYKV9MHra8e/AYUMvHjoSyNF4V37vPeQ82J11RVjy8CWXJLi61tZo=
X-Received: from wmbfs5.prod.google.com ([2002:a05:600c:3f85:b0:450:41ed:d20e])
 (user=glider job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:2011:b0:3a4:e54c:adf2
 with SMTP id ffacd0b85a97d-3a6ed61a12cmr5925433f8f.5.1750945339545; Thu, 26
 Jun 2025 06:42:19 -0700 (PDT)
Date: Thu, 26 Jun 2025 15:41:53 +0200
In-Reply-To: <20250626134158.3385080-1-glider@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250626134158.3385080-1-glider@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250626134158.3385080-7-glider@google.com>
Subject: [PATCH v2 06/11] kcov: x86: introduce CONFIG_KCOV_UNIQUE
From: Alexander Potapenko <glider@google.com>
To: glider@google.com
Cc: quic_jiangenj@quicinc.com, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, x86@kernel.org, 
	Aleksandr Nogikh <nogikh@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Ingo Molnar <mingo@redhat.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Marco Elver <elver@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"

The new config switches coverage instrumentation to using
  __sanitizer_cov_trace_pc_guard(u32 *guard)
instead of
  __sanitizer_cov_trace_pc(void)

This relies on Clang's -fsanitize-coverage=trace-pc-guard flag [1].

Each callback receives a unique 32-bit guard variable residing in the
__sancov_guards section. Those guards can be used by kcov to deduplicate
the coverage on the fly.

As a first step, we make the new instrumentation mode 1:1 compatible
with the old one.

[1] https://clang.llvm.org/docs/SanitizerCoverage.html#tracing-pcs-with-guards

Cc: x86@kernel.org
Signed-off-by: Alexander Potapenko <glider@google.com>

---
Change-Id: Iacb1e71fd061a82c2acadf2347bba4863b9aec39

v2:
 - Address comments by Dmitry Vyukov
   - rename CONFIG_KCOV_ENABLE_GUARDS to CONFIG_KCOV_UNIQUE
   - update commit description and config description
 - Address comments by Marco Elver
   - rename sanitizer_cov_write_subsequent() to kcov_append_to_buffer()
   - make config depend on X86_64 (via ARCH_HAS_KCOV_UNIQUE)
   - swap #ifdef branches
   - tweak config description
   - remove redundant check for CONFIG_CC_HAS_SANCOV_TRACE_PC_GUARD
---
 arch/x86/Kconfig                  |  1 +
 arch/x86/kernel/vmlinux.lds.S     |  1 +
 include/asm-generic/vmlinux.lds.h | 14 ++++++-
 include/linux/kcov.h              |  2 +
 kernel/kcov.c                     | 61 +++++++++++++++++++++----------
 lib/Kconfig.debug                 | 24 ++++++++++++
 scripts/Makefile.kcov             |  4 ++
 scripts/module.lds.S              | 23 ++++++++++++
 tools/objtool/check.c             |  1 +
 9 files changed, 110 insertions(+), 21 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index e21cca404943e..d104c5a193bdf 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -93,6 +93,7 @@ config X86
 	select ARCH_HAS_FORTIFY_SOURCE
 	select ARCH_HAS_GCOV_PROFILE_ALL
 	select ARCH_HAS_KCOV			if X86_64
+	select ARCH_HAS_KCOV_UNIQUE		if X86_64
 	select ARCH_HAS_KERNEL_FPU_SUPPORT
 	select ARCH_HAS_MEM_ENCRYPT
 	select ARCH_HAS_MEMBARRIER_SYNC_CORE
diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
index cda5f8362e9da..8076e8953fddc 100644
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -372,6 +372,7 @@ SECTIONS
 		. = ALIGN(PAGE_SIZE);
 		__bss_stop = .;
 	}
+	SANCOV_GUARDS_BSS
 
 	/*
 	 * The memory occupied from _text to here, __end_of_kernel_reserve, is
diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index 58a635a6d5bdf..875c4deb66208 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -102,7 +102,8 @@
  * sections to be brought in with rodata.
  */
 #if defined(CONFIG_LD_DEAD_CODE_DATA_ELIMINATION) || defined(CONFIG_LTO_CLANG) || \
-defined(CONFIG_AUTOFDO_CLANG) || defined(CONFIG_PROPELLER_CLANG)
+	defined(CONFIG_AUTOFDO_CLANG) || defined(CONFIG_PROPELLER_CLANG) || \
+	defined(CONFIG_KCOV_UNIQUE)
 #define TEXT_MAIN .text .text.[0-9a-zA-Z_]*
 #else
 #define TEXT_MAIN .text
@@ -121,6 +122,17 @@ defined(CONFIG_AUTOFDO_CLANG) || defined(CONFIG_PROPELLER_CLANG)
 #define SBSS_MAIN .sbss
 #endif
 
+#if defined(CONFIG_KCOV_UNIQUE)
+#define SANCOV_GUARDS_BSS			\
+	__sancov_guards(NOLOAD) : {		\
+		__start___sancov_guards = .;	\
+		*(__sancov_guards);		\
+		__stop___sancov_guards = .;	\
+	}
+#else
+#define SANCOV_GUARDS_BSS
+#endif
+
 /*
  * GCC 4.5 and later have a 32 bytes section alignment for structures.
  * Except GCC 4.9, that feels the need to align on 64 bytes.
diff --git a/include/linux/kcov.h b/include/linux/kcov.h
index 0e425c3524b86..dd8bbee6fe274 100644
--- a/include/linux/kcov.h
+++ b/include/linux/kcov.h
@@ -107,6 +107,8 @@ typedef unsigned long long kcov_u64;
 #endif
 
 void __sanitizer_cov_trace_pc(void);
+void __sanitizer_cov_trace_pc_guard(u32 *guard);
+void __sanitizer_cov_trace_pc_guard_init(uint32_t *start, uint32_t *stop);
 void __sanitizer_cov_trace_cmp1(u8 arg1, u8 arg2);
 void __sanitizer_cov_trace_cmp2(u16 arg1, u16 arg2);
 void __sanitizer_cov_trace_cmp4(u32 arg1, u32 arg2);
diff --git a/kernel/kcov.c b/kernel/kcov.c
index ff7f118644f49..8e98ca8d52743 100644
--- a/kernel/kcov.c
+++ b/kernel/kcov.c
@@ -195,27 +195,15 @@ static notrace unsigned long canonicalize_ip(unsigned long ip)
 	return ip;
 }
 
-/*
- * Entry point from instrumented code.
- * This is called once per basic-block/edge.
- */
-void notrace __sanitizer_cov_trace_pc(void)
+static notrace void kcov_append_to_buffer(unsigned long *area, int size,
+					  unsigned long ip)
 {
-	struct task_struct *t;
-	unsigned long *area;
-	unsigned long ip = canonicalize_ip(_RET_IP_);
-	unsigned long pos;
-
-	t = current;
-	if (!check_kcov_mode(KCOV_MODE_TRACE_PC, t))
-		return;
-
-	area = t->kcov_state.area;
 	/* The first 64-bit word is the number of subsequent PCs. */
-	pos = READ_ONCE(area[0]) + 1;
-	if (likely(pos < t->kcov_state.size)) {
-		/* Previously we write pc before updating pos. However, some
-		 * early interrupt code could bypass check_kcov_mode() check
+	unsigned long pos = READ_ONCE(area[0]) + 1;
+
+	if (likely(pos < size)) {
+		/*
+		 * Some early interrupt code could bypass check_kcov_mode() check
 		 * and invoke __sanitizer_cov_trace_pc(). If such interrupt is
 		 * raised between writing pc and updating pos, the pc could be
 		 * overitten by the recursive __sanitizer_cov_trace_pc().
@@ -226,7 +214,40 @@ void notrace __sanitizer_cov_trace_pc(void)
 		area[pos] = ip;
 	}
 }
+
+/*
+ * Entry point from instrumented code.
+ * This is called once per basic-block/edge.
+ */
+#ifdef CONFIG_KCOV_UNIQUE
+void notrace __sanitizer_cov_trace_pc_guard(u32 *guard)
+{
+	if (!check_kcov_mode(KCOV_MODE_TRACE_PC, current))
+		return;
+
+	kcov_append_to_buffer(current->kcov_state.area,
+			      current->kcov_state.size,
+			      canonicalize_ip(_RET_IP_));
+}
+EXPORT_SYMBOL(__sanitizer_cov_trace_pc_guard);
+
+void notrace __sanitizer_cov_trace_pc_guard_init(uint32_t *start,
+						 uint32_t *stop)
+{
+}
+EXPORT_SYMBOL(__sanitizer_cov_trace_pc_guard_init);
+#else /* !CONFIG_KCOV_UNIQUE */
+void notrace __sanitizer_cov_trace_pc(void)
+{
+	if (!check_kcov_mode(KCOV_MODE_TRACE_PC, current))
+		return;
+
+	kcov_append_to_buffer(current->kcov_state.area,
+			      current->kcov_state.size,
+			      canonicalize_ip(_RET_IP_));
+}
 EXPORT_SYMBOL(__sanitizer_cov_trace_pc);
+#endif
 
 #ifdef CONFIG_KCOV_ENABLE_COMPARISONS
 static void notrace write_comp_data(u64 type, u64 arg1, u64 arg2, u64 ip)
@@ -254,7 +275,7 @@ static void notrace write_comp_data(u64 type, u64 arg1, u64 arg2, u64 ip)
 	start_index = 1 + count * KCOV_WORDS_PER_CMP;
 	end_pos = (start_index + KCOV_WORDS_PER_CMP) * sizeof(u64);
 	if (likely(end_pos <= max_pos)) {
-		/* See comment in __sanitizer_cov_trace_pc(). */
+		/* See comment in kcov_append_to_buffer(). */
 		WRITE_ONCE(area[0], count + 1);
 		barrier();
 		area[start_index] = type;
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index f9051ab610d54..24dcb721dbb0b 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2156,6 +2156,8 @@ config ARCH_HAS_KCOV
 config CC_HAS_SANCOV_TRACE_PC
 	def_bool $(cc-option,-fsanitize-coverage=trace-pc)
 
+config CC_HAS_SANCOV_TRACE_PC_GUARD
+	def_bool $(cc-option,-fsanitize-coverage=trace-pc-guard)
 
 config KCOV
 	bool "Code coverage for fuzzing"
@@ -2172,6 +2174,28 @@ config KCOV
 
 	  For more details, see Documentation/dev-tools/kcov.rst.
 
+config ARCH_HAS_KCOV_UNIQUE
+	bool
+	help
+	  An architecture should select this when it can successfully
+	  build and run with CONFIG_KCOV_UNIQUE.
+
+config KCOV_UNIQUE
+	depends on KCOV
+	depends on CC_HAS_SANCOV_TRACE_PC_GUARD && ARCH_HAS_KCOV_UNIQUE
+	bool "Use coverage guards for KCOV"
+	help
+	  Use coverage guards instrumentation for KCOV, passing
+	  -fsanitize-coverage=trace-pc-guard to the compiler.
+
+	  Every coverage callback is associated with a global variable that
+	  allows to efficiently deduplicate coverage at collection time.
+	  This drastically reduces the buffer size required for coverage
+	  collection.
+
+	  This config comes at a cost of increased binary size (4 bytes of .bss
+	  plus 1-2 instructions to pass an extra parameter, per basic block).
+
 config KCOV_ENABLE_COMPARISONS
 	bool "Enable comparison operands collection by KCOV"
 	depends on KCOV
diff --git a/scripts/Makefile.kcov b/scripts/Makefile.kcov
index 67e8cfe3474b7..0b17533ef35f6 100644
--- a/scripts/Makefile.kcov
+++ b/scripts/Makefile.kcov
@@ -1,5 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0-only
+ifeq ($(CONFIG_KCOV_UNIQUE),y)
+kcov-flags-y					+= -fsanitize-coverage=trace-pc-guard
+else
 kcov-flags-$(CONFIG_CC_HAS_SANCOV_TRACE_PC)	+= -fsanitize-coverage=trace-pc
+endif
 kcov-flags-$(CONFIG_KCOV_ENABLE_COMPARISONS)	+= -fsanitize-coverage=trace-cmp
 kcov-flags-$(CONFIG_GCC_PLUGIN_SANCOV)		+= -fplugin=$(objtree)/scripts/gcc-plugins/sancov_plugin.so
 
diff --git a/scripts/module.lds.S b/scripts/module.lds.S
index 450f1088d5fd3..314b56680ea1a 100644
--- a/scripts/module.lds.S
+++ b/scripts/module.lds.S
@@ -64,6 +64,29 @@ SECTIONS {
 		MOD_CODETAG_SECTIONS()
 	}
 #endif
+
+#ifdef CONFIG_KCOV_UNIQUE
+	__sancov_guards(NOLOAD) : {
+		__start___sancov_guards = .;
+		*(__sancov_guards);
+		__stop___sancov_guards = .;
+	}
+
+	.text : {
+		*(.text .text.[0-9a-zA-Z_]*)
+		*(.text..L*)
+	}
+
+	.init.text : {
+		*(.init.text .init.text.[0-9a-zA-Z_]*)
+		*(.init.text..L*)
+	}
+	.exit.text : {
+		*(.exit.text .exit.text.[0-9a-zA-Z_]*)
+		*(.exit.text..L*)
+	}
+#endif
+
 	MOD_SEPARATE_CODETAG_SECTIONS()
 }
 
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index b21b12ec88d96..62fbe9b2aa077 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -1154,6 +1154,7 @@ static const char *uaccess_safe_builtin[] = {
 	"write_comp_data",
 	"check_kcov_mode",
 	"__sanitizer_cov_trace_pc",
+	"__sanitizer_cov_trace_pc_guard",
 	"__sanitizer_cov_trace_const_cmp1",
 	"__sanitizer_cov_trace_const_cmp2",
 	"__sanitizer_cov_trace_const_cmp4",
-- 
2.50.0.727.gbf7dc18ff4-goog

