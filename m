Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26AB0211A05
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 20:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744230560; cv=none; b=JI8MofJXNZGBI9ccSIlN/j5O9UQhzDPn7lm2TV4auNK9Yr7K+rMhH+yGnqXzhfj70HBz//B+G/cRcMExD+ZpCI6fx5aP2qpYU9kxnQyUdH71TumsvKAcnyB1kwM9NWyyGYgnGywSNHyNq05nFoAyewoZKGollxws9UYP9dDgnCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744230560; c=relaxed/simple;
	bh=76PMERY/M9kw8GHMax2Z4NoIwjnF36Dur8GMSF7xWLc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TC7b+J8XHBSeoqVZilU0v30bJ+tm4Fi++9rQjtGCda1/mc+v28+ncgYcqJOVcJelZbPZcgwOuxo9h/hdXA7lBif7x9CkJS4tGNSbqiodGX+xndg/e7eBnwMHTVi5iCyfWxnlNh9qHpQApmzJLLO1F8wqx/M0jW6IAe6kfUbb5dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SfUokMKo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SfUokMKo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FAF8C4CEEA;
	Wed,  9 Apr 2025 20:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744230559;
	bh=76PMERY/M9kw8GHMax2Z4NoIwjnF36Dur8GMSF7xWLc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SfUokMKoeE/ksGyYuErQnE3r2i+2njftMLSwaQbwt7FXJDvBzNA/15Gi4txiCM42H
	 l94+KVXGGA7C731V3uiXUg9XaNvFS3dBy4iRIdphA7J2Rzz20eRKGs+rUplHqY5uQJ
	 LCVXQnK9ruHvsKz8gPic6dtS72rM0bQR20KhpsVihRnmHJkVucV8JFRTYMc1x/4jQL
	 FEmuIFaFsfONWPlyty5d18MC4S2ncCWD3TmpfQRu2jogv2AyZhvpaAIEzV9Oh6Jhcp
	 th2YwSLmWq1d2NZB9dhklZq8+tO0s61rJ1yPuuk+5DVtPiuXrW+tIQ7YBzOcZrmw/9
	 GkTgQOZCEvBCg==
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
Subject: [PATCH 01/20] x86/msr: Standardize on u64 in <asm/msr.h>
Date: Wed,  9 Apr 2025 22:28:48 +0200
Message-ID: <20250409202907.3419480-2-mingo@kernel.org>
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

There's 9 uses of 'unsigned long long' in <asm/msr.h>, which is
really the same as 'u64', which is used 34 times.

Standardize on u64.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Juergen Gross <jgross@suse.com>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Dave Hansen <dave.hansen@intel.com>
Cc: Xin Li <xin@zytor.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
---
 arch/x86/include/asm/msr.h | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/x86/include/asm/msr.h b/arch/x86/include/asm/msr.h
index 9397a319d165..8ee6fc633476 100644
--- a/arch/x86/include/asm/msr.h
+++ b/arch/x86/include/asm/msr.h
@@ -48,7 +48,7 @@ struct saved_msrs {
 #define EAX_EDX_VAL(val, low, high)	((low) | (high) << 32)
 #define EAX_EDX_RET(val, low, high)	"=a" (low), "=d" (high)
 #else
-#define DECLARE_ARGS(val, low, high)	unsigned long long val
+#define DECLARE_ARGS(val, low, high)	u64 val
 #define EAX_EDX_VAL(val, low, high)	(val)
 #define EAX_EDX_RET(val, low, high)	"=A" (val)
 #endif
@@ -79,7 +79,7 @@ static inline void do_trace_rdpmc(unsigned int msr, u64 val, int failed) {}
  * think of extending them - you will be slapped with a stinking trout or a frozen
  * shark will reach you, wherever you are! You've been warned.
  */
-static __always_inline unsigned long long __rdmsr(unsigned int msr)
+static __always_inline u64 __rdmsr(unsigned int msr)
 {
 	DECLARE_ARGS(val, low, high);
 
@@ -113,9 +113,9 @@ do {							\
 	__wrmsr((msr), (u32)((u64)(val)),		\
 		       (u32)((u64)(val) >> 32))
 
-static inline unsigned long long native_read_msr(unsigned int msr)
+static inline u64 native_read_msr(unsigned int msr)
 {
-	unsigned long long val;
+	u64 val;
 
 	val = __rdmsr(msr);
 
@@ -125,7 +125,7 @@ static inline unsigned long long native_read_msr(unsigned int msr)
 	return val;
 }
 
-static inline unsigned long long native_read_msr_safe(unsigned int msr,
+static inline u64 native_read_msr_safe(unsigned int msr,
 						      int *err)
 {
 	DECLARE_ARGS(val, low, high);
@@ -179,7 +179,7 @@ extern int wrmsr_safe_regs(u32 regs[8]);
  * CPU can and will speculatively execute that RDTSC, though, so the
  * results can be non-monotonic if compared on different CPUs.
  */
-static __always_inline unsigned long long rdtsc(void)
+static __always_inline u64 rdtsc(void)
 {
 	DECLARE_ARGS(val, low, high);
 
@@ -196,7 +196,7 @@ static __always_inline unsigned long long rdtsc(void)
  * be impossible to observe non-monotonic rdtsc_unordered() behavior
  * across multiple CPUs as long as the TSC is synced.
  */
-static __always_inline unsigned long long rdtsc_ordered(void)
+static __always_inline u64 rdtsc_ordered(void)
 {
 	DECLARE_ARGS(val, low, high);
 
@@ -224,7 +224,7 @@ static __always_inline unsigned long long rdtsc_ordered(void)
 	return EAX_EDX_VAL(val, low, high);
 }
 
-static inline unsigned long long native_read_pmc(int counter)
+static inline u64 native_read_pmc(int counter)
 {
 	DECLARE_ARGS(val, low, high);
 
@@ -280,7 +280,7 @@ static inline int wrmsr_safe(unsigned int msr, u32 low, u32 high)
 	__err;							\
 })
 
-static inline int rdmsrl_safe(unsigned int msr, unsigned long long *p)
+static inline int rdmsrl_safe(unsigned int msr, u64 *p)
 {
 	int err;
 
-- 
2.45.2

