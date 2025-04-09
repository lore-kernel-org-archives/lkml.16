Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC82214A95
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 20:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744230574; cv=none; b=lhBb31fbShsilGIMT4BXmS2OnagZkqZTmhvoujkbcBdP/G5udMWU6CZM3Y+q/V7JWzxeKVcuRZ/e90KLvxbZG8BadV8U0UqrBOguM4MonqJuyiI/bn/w/xrjlE+bcZkDmEW5x1Shu+PeLktp0hKVbTA4v7o3nBHJo5HmSHXxJR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744230574; c=relaxed/simple;
	bh=f24bBrNv5jmGRI42xNTldJ8HTpYspuReVpwODs8G9oE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=liuVc/sGDTeUy74m4fvB9VntAWT2NEBkmSwDhlJSjS6rZ4xp3f/2u3p80QBNSR6FTx9lSkNq8ZItLxKGvUwvvTb6DXotPvL+cUg0t3HhYHzqPZiLOSxVRdHMzhR9UYC9HCd7NtqVMTJasLmil1vELL1gyGg43r7TjUa/A6wnaF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K+TXzOgq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K+TXzOgq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 293C5C4CEE9;
	Wed,  9 Apr 2025 20:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744230573;
	bh=f24bBrNv5jmGRI42xNTldJ8HTpYspuReVpwODs8G9oE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K+TXzOgqUYMt5Spc2Kwd6QPMNbxbCNR7198lRz3ghwyhmt41VOaTg1oz4NtOjVzw8
	 jvLJUL1k0hALieDPW0xu//XAZXDTd5PLsJxylCgXgCxzmTnqjxo/8Muuk/H1gF8js3
	 cxyw6bZUnI0RnlXKeNBVeY+Z0PuzDLepWNjdGaAyDy4MYvbxvtmkGZUWfk5ByY85OS
	 F2A62nuFoBUCz67Xo8sHHTbiqxuv2VCowz0sjgx/AOq1TWzlPAjbNOX3sgSemB4UcH
	 fKLRny8WE0JZ+hxuBAb/r0R7M4pDbaaE+xFUAg2oJ/ApocqLKTILeWAk+i2VsQ34CF
	 d9Zmqz8N+ihkg==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Dave Hansen <dave.hansen@intel.com>,
	Xin Li <xin@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 06/20] x86/msr: Standardize on 'u32' MSR indices in <asm/msr.h>
Date: Wed,  9 Apr 2025 22:28:53 +0200
Message-ID: <20250409202907.3419480-7-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250409202907.3419480-1-mingo@kernel.org>
References: <20250409202907.3419480-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is the customary type used for hardware ABIs.

Suggested-by: Xin Li <xin@zytor.com>
Suggested-by: "H. Peter Anvin" <hpa@zytor.com>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Juergen Gross <jgross@suse.com>
Cc: Dave Hansen <dave.hansen@intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
---
 arch/x86/include/asm/msr.h | 29 ++++++++++++++---------------
 arch/x86/lib/msr.c         |  4 ++--
 2 files changed, 16 insertions(+), 17 deletions(-)

diff --git a/arch/x86/include/asm/msr.h b/arch/x86/include/asm/msr.h
index ec5c873a83a1..2f5a661719a4 100644
--- a/arch/x86/include/asm/msr.h
+++ b/arch/x86/include/asm/msr.h
@@ -63,12 +63,12 @@ struct saved_msrs {
 DECLARE_TRACEPOINT(read_msr);
 DECLARE_TRACEPOINT(write_msr);
 DECLARE_TRACEPOINT(rdpmc);
-extern void do_trace_write_msr(unsigned int msr, u64 val, int failed);
-extern void do_trace_read_msr(unsigned int msr, u64 val, int failed);
+extern void do_trace_write_msr(u32 msr, u64 val, int failed);
+extern void do_trace_read_msr(u32 msr, u64 val, int failed);
 extern void do_trace_rdpmc(u32 msr, u64 val, int failed);
 #else
-static inline void do_trace_write_msr(unsigned int msr, u64 val, int failed) {}
-static inline void do_trace_read_msr(unsigned int msr, u64 val, int failed) {}
+static inline void do_trace_write_msr(u32 msr, u64 val, int failed) {}
+static inline void do_trace_read_msr(u32 msr, u64 val, int failed) {}
 static inline void do_trace_rdpmc(u32 msr, u64 val, int failed) {}
 #endif
 
@@ -79,7 +79,7 @@ static inline void do_trace_rdpmc(u32 msr, u64 val, int failed) {}
  * think of extending them - you will be slapped with a stinking trout or a frozen
  * shark will reach you, wherever you are! You've been warned.
  */
-static __always_inline u64 __rdmsr(unsigned int msr)
+static __always_inline u64 __rdmsr(u32 msr)
 {
 	DECLARE_ARGS(val, low, high);
 
@@ -91,7 +91,7 @@ static __always_inline u64 __rdmsr(unsigned int msr)
 	return EAX_EDX_VAL(val, low, high);
 }
 
-static __always_inline void __wrmsr(unsigned int msr, u32 low, u32 high)
+static __always_inline void __wrmsr(u32 msr, u32 low, u32 high)
 {
 	asm volatile("1: wrmsr\n"
 		     "2:\n"
@@ -113,7 +113,7 @@ do {							\
 	__wrmsr((msr), (u32)((u64)(val)),		\
 		       (u32)((u64)(val) >> 32))
 
-static inline u64 native_read_msr(unsigned int msr)
+static inline u64 native_read_msr(u32 msr)
 {
 	u64 val;
 
@@ -125,8 +125,7 @@ static inline u64 native_read_msr(unsigned int msr)
 	return val;
 }
 
-static inline u64 native_read_msr_safe(unsigned int msr,
-						      int *err)
+static inline u64 native_read_msr_safe(u32 msr, int *err)
 {
 	DECLARE_ARGS(val, low, high);
 
@@ -142,7 +141,7 @@ static inline u64 native_read_msr_safe(unsigned int msr,
 
 /* Can be uninlined because referenced by paravirt */
 static inline void notrace
-native_write_msr(unsigned int msr, u32 low, u32 high)
+native_write_msr(u32 msr, u32 low, u32 high)
 {
 	__wrmsr(msr, low, high);
 
@@ -152,7 +151,7 @@ native_write_msr(unsigned int msr, u32 low, u32 high)
 
 /* Can be uninlined because referenced by paravirt */
 static inline int notrace
-native_write_msr_safe(unsigned int msr, u32 low, u32 high)
+native_write_msr_safe(u32 msr, u32 low, u32 high)
 {
 	int err;
 
@@ -251,7 +250,7 @@ do {								\
 	(void)((high) = (u32)(__val >> 32));			\
 } while (0)
 
-static inline void wrmsr(unsigned int msr, u32 low, u32 high)
+static inline void wrmsr(u32 msr, u32 low, u32 high)
 {
 	native_write_msr(msr, low, high);
 }
@@ -259,13 +258,13 @@ static inline void wrmsr(unsigned int msr, u32 low, u32 high)
 #define rdmsrl(msr, val)			\
 	((val) = native_read_msr((msr)))
 
-static inline void wrmsrl(unsigned int msr, u64 val)
+static inline void wrmsrl(u32 msr, u64 val)
 {
 	native_write_msr(msr, (u32)(val & 0xffffffffULL), (u32)(val >> 32));
 }
 
 /* wrmsr with exception handling */
-static inline int wrmsr_safe(unsigned int msr, u32 low, u32 high)
+static inline int wrmsr_safe(u32 msr, u32 low, u32 high)
 {
 	return native_write_msr_safe(msr, low, high);
 }
@@ -280,7 +279,7 @@ static inline int wrmsr_safe(unsigned int msr, u32 low, u32 high)
 	__err;							\
 })
 
-static inline int rdmsrl_safe(unsigned int msr, u64 *p)
+static inline int rdmsrl_safe(u32 msr, u64 *p)
 {
 	int err;
 
diff --git a/arch/x86/lib/msr.c b/arch/x86/lib/msr.c
index 20f5c36e5fde..7b90f547b109 100644
--- a/arch/x86/lib/msr.c
+++ b/arch/x86/lib/msr.c
@@ -122,14 +122,14 @@ int msr_clear_bit(u32 msr, u8 bit)
 EXPORT_SYMBOL_GPL(msr_clear_bit);
 
 #ifdef CONFIG_TRACEPOINTS
-void do_trace_write_msr(unsigned int msr, u64 val, int failed)
+void do_trace_write_msr(u32 msr, u64 val, int failed)
 {
 	trace_write_msr(msr, val, failed);
 }
 EXPORT_SYMBOL(do_trace_write_msr);
 EXPORT_TRACEPOINT_SYMBOL(write_msr);
 
-void do_trace_read_msr(unsigned int msr, u64 val, int failed)
+void do_trace_read_msr(u32 msr, u64 val, int failed)
 {
 	trace_read_msr(msr, val, failed);
 }
-- 
2.45.2

