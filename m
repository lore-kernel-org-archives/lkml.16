Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D0C297B7A
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747299478; cv=none; b=U1s+znlqtnuEacrcOM5LsNKJ9h/y9j1dYo0Jc9WtX/Ck68Ywm+3QtnEZdjsp/IvVGPC3e61/YqXoJ8crLW/opt0+rkZVFgcXPlbOQMFHhBpRQWAd5p7NzuUyiQjGdJVLB6g53lVB/B/SkQbObWJLK+BP43bTDowZzIsA7eaEIpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747299478; c=relaxed/simple;
	bh=RgFtzq1KF65fDIuCa5gfr+hBpuL+//UQBKjyfmcX43o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LOkHSXc5upzEJIq1/SBe/yi88NkkHK6VscMJmKLrgXw0PWUAKR42WL4nKGZwgU7j/hc0aWloiBc91haATveQkyPjRG8OzVhdS2iqWknQn1bcjrZcld2Ain80OkpRfxi2dT6t3B/OBztV4dk6YHR7QbclBtqC/Ep3BOSkFqwVypE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XPwM0HW0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XPwM0HW0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DF76C4CEED;
	Thu, 15 May 2025 08:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747299477;
	bh=RgFtzq1KF65fDIuCa5gfr+hBpuL+//UQBKjyfmcX43o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XPwM0HW0p/lyRecLS/eiDPtcX+JVoJefd2IPPf6sRWEPAB2xfRRo7PgGFMbxV9EQp
	 veC2e1sF7Pwcn/qrCr4S4rv+RTjp1oCTN75wvrrOTIc9zYK1/yoDPgSPsmjF5zZSq+
	 LzHNRVEApBz0MU2iIvqpIrqwh84RNxhmO3jko8NKdUks2bOsdjmaVmSpnmk/P75Gru
	 z85hxOWmlMwQpjFh1hkTO4yRrsS1RaZZ2zOTjgbSP5huuSuH2+y4ed9xqdhT0ZVnNX
	 dwoqofY4KE+33wFE1hU+ko1jRxJTMHbztdy2PvKjIO0DQNlZHqevlwSKOY8dHXXc+T
	 7VsDgZLONDssg==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Ingo Molnar <mingo@kernel.org>,
	"Ahmed S . Darwish" <darwi@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	John Ogness <john.ogness@linutronix.de>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 12/15] x86: Remove !CONFIG_X86_TSC code
Date: Thu, 15 May 2025 10:57:02 +0200
Message-ID: <20250515085708.2510123-13-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250515085708.2510123-1-mingo@kernel.org>
References: <20250515085708.2510123-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that the Kconfig space always enables CONFIG_X86_TSC (on x86),
remove !CONFIG_X86_TSC code.

We still keep the Kconfig option to catch any eventual code still
pending in maintainer or non-mainline trees, and it's also still
possible to disable TSC support runtime.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Cc: Ahmed S . Darwish <darwi@linutronix.de>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: H . Peter Anvin <hpa@zytor.com>
Cc: John Ogness <john.ogness@linutronix.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Link: https://lore.kernel.org/r/20250425084216.3913608-13-mingo@kernel.org
---
 arch/x86/include/asm/timex.h       |  3 +--
 arch/x86/include/asm/trace_clock.h |  8 --------
 arch/x86/include/asm/tsc.h         | 13 +------------
 arch/x86/kernel/Makefile           |  4 ++--
 arch/x86/kernel/i8253.c            |  2 +-
 arch/x86/kernel/tsc.c              | 13 -------------
 6 files changed, 5 insertions(+), 38 deletions(-)

diff --git a/arch/x86/include/asm/timex.h b/arch/x86/include/asm/timex.h
index 956e4145311b..6e57e3c0fdd2 100644
--- a/arch/x86/include/asm/timex.h
+++ b/arch/x86/include/asm/timex.h
@@ -7,8 +7,7 @@
 
 static inline unsigned long random_get_entropy(void)
 {
-	if (!IS_ENABLED(CONFIG_X86_TSC) &&
-	    !cpu_feature_enabled(X86_FEATURE_TSC))
+	if (!cpu_feature_enabled(X86_FEATURE_TSC))
 		return random_get_entropy_fallback();
 	return rdtsc();
 }
diff --git a/arch/x86/include/asm/trace_clock.h b/arch/x86/include/asm/trace_clock.h
index 7061a5650969..1efab284c32a 100644
--- a/arch/x86/include/asm/trace_clock.h
+++ b/arch/x86/include/asm/trace_clock.h
@@ -5,17 +5,9 @@
 #include <linux/compiler.h>
 #include <linux/types.h>
 
-#ifdef CONFIG_X86_TSC
-
 extern u64 notrace trace_clock_x86_tsc(void);
 
 # define ARCH_TRACE_CLOCKS \
 	{ trace_clock_x86_tsc,	"x86-tsc",	.in_ns = 0 },
 
-#else /* !CONFIG_X86_TSC */
-
-#define ARCH_TRACE_CLOCKS
-
-#endif
-
 #endif  /* _ASM_X86_TRACE_CLOCK_H */
diff --git a/arch/x86/include/asm/tsc.h b/arch/x86/include/asm/tsc.h
index 4f7f09f50552..4d2d2f21ff06 100644
--- a/arch/x86/include/asm/tsc.h
+++ b/arch/x86/include/asm/tsc.h
@@ -76,8 +76,7 @@ extern void disable_TSC(void);
 
 static inline cycles_t get_cycles(void)
 {
-	if (!IS_ENABLED(CONFIG_X86_TSC) &&
-	    !cpu_feature_enabled(X86_FEATURE_TSC))
+	if (!cpu_feature_enabled(X86_FEATURE_TSC))
 		return 0;
 	return rdtsc();
 }
@@ -94,25 +93,15 @@ extern unsigned long native_calibrate_tsc(void);
 extern unsigned long long native_sched_clock_from_tsc(u64 tsc);
 
 extern int tsc_clocksource_reliable;
-#ifdef CONFIG_X86_TSC
 extern bool tsc_async_resets;
-#else
-# define tsc_async_resets	false
-#endif
 
 /*
  * Boot-time check whether the TSCs are synchronized across
  * all CPUs/cores:
  */
-#ifdef CONFIG_X86_TSC
 extern bool tsc_store_and_check_tsc_adjust(bool bootcpu);
 extern void tsc_verify_tsc_adjust(bool resume);
 extern void check_tsc_sync_target(void);
-#else
-static inline bool tsc_store_and_check_tsc_adjust(bool bootcpu) { return false; }
-static inline void tsc_verify_tsc_adjust(bool resume) { }
-static inline void check_tsc_sync_target(void) { }
-#endif
 
 extern int notsc_setup(char *);
 extern void tsc_save_sched_clock_state(void);
diff --git a/arch/x86/kernel/Makefile b/arch/x86/kernel/Makefile
index 84cfa179802c..abeca47b8225 100644
--- a/arch/x86/kernel/Makefile
+++ b/arch/x86/kernel/Makefile
@@ -94,7 +94,7 @@ apm-y				:= apm_32.o
 obj-$(CONFIG_APM)		+= apm.o
 obj-$(CONFIG_SMP)		+= smp.o
 obj-$(CONFIG_SMP)		+= smpboot.o
-obj-$(CONFIG_X86_TSC)		+= tsc_sync.o
+obj-y				+= tsc_sync.o
 obj-$(CONFIG_SMP)		+= setup_percpu.o
 obj-$(CONFIG_X86_MPPARSE)	+= mpparse.o
 obj-y				+= apic/
@@ -103,7 +103,7 @@ obj-$(CONFIG_DYNAMIC_FTRACE)	+= ftrace.o
 obj-$(CONFIG_FUNCTION_TRACER)	+= ftrace_$(BITS).o
 obj-$(CONFIG_FUNCTION_GRAPH_TRACER) += ftrace.o
 obj-$(CONFIG_FTRACE_SYSCALLS)	+= ftrace.o
-obj-$(CONFIG_X86_TSC)		+= trace_clock.o
+obj-y				+= trace_clock.o
 obj-$(CONFIG_TRACING)		+= trace.o
 obj-$(CONFIG_RETHOOK)		+= rethook.o
 obj-$(CONFIG_VMCORE_INFO)	+= vmcore_info_$(BITS).o
diff --git a/arch/x86/kernel/i8253.c b/arch/x86/kernel/i8253.c
index cb9852ad6098..0b991035f127 100644
--- a/arch/x86/kernel/i8253.c
+++ b/arch/x86/kernel/i8253.c
@@ -31,7 +31,7 @@ struct clock_event_device *global_clock_event;
  */
 static bool __init use_pit(void)
 {
-	if (!IS_ENABLED(CONFIG_X86_TSC) || !boot_cpu_has(X86_FEATURE_TSC))
+	if (!boot_cpu_has(X86_FEATURE_TSC))
 		return true;
 
 	/* This also returns true when APIC is disabled */
diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 5d3a764ba77c..4a7c8b969346 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -296,24 +296,11 @@ int check_tsc_unstable(void)
 }
 EXPORT_SYMBOL_GPL(check_tsc_unstable);
 
-#ifdef CONFIG_X86_TSC
 int __init notsc_setup(char *str)
 {
 	mark_tsc_unstable("boot parameter notsc");
 	return 1;
 }
-#else
-/*
- * disable flag for tsc. Takes effect by clearing the TSC cpu flag
- * in cpu/common.c
- */
-int __init notsc_setup(char *str)
-{
-	setup_clear_cpu_cap(X86_FEATURE_TSC);
-	return 1;
-}
-#endif
-
 __setup("notsc", notsc_setup);
 
 static int no_sched_irq_time;
-- 
2.45.2

