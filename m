Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0893224226
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 20:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744230613; cv=none; b=KwBTWep/euh7vqsvAJ5ZHBH+QTfe64ShDWWnzCya7LYcjx9ihVkM57M4/ojGKQ+Dy5AAIXifWrQLAStxSNTLfPObKbaOPmH0NXePF20iObJ0qWk8dA3DFJPHfATyI5vQFKqiFN6+o/uLZiD4PXvnQ8KBSjJ6ti7xmJA1OFN9omY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744230613; c=relaxed/simple;
	bh=m5FIuNpEhvUheZmDV7e/Z0nF4WB7HKD23CG9Octb7qw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZCXW/p5iztUiDlsv3Ka30Ng0yRdm3p2SdOyAFGPD1gq7pd9vpG8jnmZ7um5/U2rO8YRyzXqScCZ+JgPeMepUT7g1AexdSR5EDITv7822c3Hz/RB889gtSB+2mhaRx2E2VknT2L/psBis7Wnk9uzhe8mLcipo5EWQ6KpNPVwCBeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E1Kq7HgI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E1Kq7HgI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D727C4CEE2;
	Wed,  9 Apr 2025 20:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744230612;
	bh=m5FIuNpEhvUheZmDV7e/Z0nF4WB7HKD23CG9Octb7qw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E1Kq7HgIeQUFjaoNNY3X8nrXvTAtCtR9T4IX7Zb6a2NEZhFm7Q19Sl1c9bgP0w70k
	 j87fUoBvTqhHPtmPawjItfd4PNDviiV7TsGuetKQdAd65dyT4ttLQWbiSOOddyugi9
	 vpro8WzX3IHQJrKbpwIz+HmdzB/TqOHLt2gECz+VMptNmWPh++XwFGxjdX7Ru0YJxP
	 XJFqqF0YkZ7uHQ4Bccl7TQvbl7Xidb50L4i53Oo7/fjnMdpglmOp52y/fmmNxpnOsi
	 8XBM40mnm9fBae7rxMS92VH0dmPbvtmlpUARL65iDPzUntv84xb8TAti5pJJHpYEzU
	 kXJ8R7dH6cfAQ==
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
Subject: [PATCH 20/20] x86/msr: Rename 'wrmsrl_cstar()' to 'wrmsrq_cstar()'
Date: Wed,  9 Apr 2025 22:29:07 +0200
Message-ID: <20250409202907.3419480-21-mingo@kernel.org>
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

Suggested-by: "H. Peter Anvin" <hpa@zytor.com>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Juergen Gross <jgross@suse.com>
Cc: Dave Hansen <dave.hansen@intel.com>
Cc: Xin Li <xin@zytor.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
---
 arch/x86/kernel/cpu/common.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index bb986ba8b90c..079ded4eeb86 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -2091,7 +2091,7 @@ DEFINE_PER_CPU_CACHE_HOT(unsigned long, cpu_current_top_of_stack) = TOP_OF_INIT_
 DEFINE_PER_CPU_CACHE_HOT(u64, __x86_call_depth);
 EXPORT_PER_CPU_SYMBOL(__x86_call_depth);
 
-static void wrmsrl_cstar(unsigned long val)
+static void wrmsrq_cstar(unsigned long val)
 {
 	/*
 	 * Intel CPUs do not support 32-bit SYSCALL. Writing to MSR_CSTAR
@@ -2107,7 +2107,7 @@ static inline void idt_syscall_init(void)
 	wrmsrq(MSR_LSTAR, (unsigned long)entry_SYSCALL_64);
 
 	if (ia32_enabled()) {
-		wrmsrl_cstar((unsigned long)entry_SYSCALL_compat);
+		wrmsrq_cstar((unsigned long)entry_SYSCALL_compat);
 		/*
 		 * This only works on Intel CPUs.
 		 * On AMD CPUs these MSRs are 32-bit, CPU truncates MSR_IA32_SYSENTER_EIP.
@@ -2119,7 +2119,7 @@ static inline void idt_syscall_init(void)
 			    (unsigned long)(cpu_entry_stack(smp_processor_id()) + 1));
 		wrmsrq_safe(MSR_IA32_SYSENTER_EIP, (u64)entry_SYSENTER_compat);
 	} else {
-		wrmsrl_cstar((unsigned long)entry_SYSCALL32_ignore);
+		wrmsrq_cstar((unsigned long)entry_SYSCALL32_ignore);
 		wrmsrq_safe(MSR_IA32_SYSENTER_CS, (u64)GDT_ENTRY_INVALID_SEG);
 		wrmsrq_safe(MSR_IA32_SYSENTER_ESP, 0ULL);
 		wrmsrq_safe(MSR_IA32_SYSENTER_EIP, 0ULL);
-- 
2.45.2

