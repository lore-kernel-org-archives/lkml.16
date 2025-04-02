Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80443236451
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 09:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743587170; cv=none; b=o/dm8bsT4I1B9jsuB7IzzB9hF2xz7ayqzftTrcxpSk2WZGqtAqCYwbhz3JdDn6KDkgIBETW8aXFTWqQRUkkv8+AZqanMiR70Q1j1/V7osFsua7ML9qL6XNdYPlx9MFh2M2zbEd/b0aA3YeUG8PtiRTvdEDpfddcAN5LAhE1acDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743587170; c=relaxed/simple;
	bh=UbElSkoimXQH4iUna5xDzRePb/1/vdvyt0zK786CFo0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tZD1UZKkzu/Zcvs7IXD/pOelNIDrO7S7RzHXLSLFD2CiLye21DQq85Wr5zUkSfaVnyyScNFW2KoIKPhMQX1hiSwMXEX6zbkrPYSviajB1v3zhOtRsS6lkJbHATgWljWZZ+WFfjL2WLfxYSVZQEszmk4c71ulaTEr0i4bK5Hwxw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mo+/bj6n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mo+/bj6n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00D43C4CEEA;
	Wed,  2 Apr 2025 09:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743587170;
	bh=UbElSkoimXQH4iUna5xDzRePb/1/vdvyt0zK786CFo0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mo+/bj6nPuhgxDlIcgZZJEC+ckYy9CRWg51vk7//cnJ26TTJ2rPjlsFY58XA/rvGs
	 92ziJaMmQk4+d4Wg8cf95pDVqEgnFyAz0REf4WOKBhMwOXUdWdTJ06HHHSdMG7pA4w
	 zwVHU7twTCCCYh746oqeJhMCJjfOaCLlumdCulSvw/w+xj2pV2wnX/IpUmuW+h/pk8
	 rGHS17v/8p3BcKKktP+QsKgtx0NdyYB36Fxn/yXRsdh69igxKprwk8Tl9AWJFHLoUp
	 9ekA0m0ovkYoOiGfG7lksoUr5iD3iRkBzfnMogZVL0zgAA+6uzqtrvkO8BAg4IDTwr
	 eY4txXnG1v1fw==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Andy Lutomirski <luto@kernel.org>,
	Rik van Riel <riel@surriel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 4/7] x86/mm: Remove 'mm' argument from unuse_temporary_mm() again
Date: Wed,  2 Apr 2025 11:45:37 +0200
Message-ID: <20250402094540.3586683-5-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250402094540.3586683-1-mingo@kernel.org>
References: <20250402094540.3586683-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peter Zijlstra <peterz@infradead.org>

Now that unuse_temporary_mm() lives in tlb.c it can access
cpu_tlbstate.loaded_mm.

[ mingo: Merged it on top of x86/alternatives ]

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Rik van Riel <riel@surriel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Link: https://lore.kernel.org/r/20241119163035.648739178@infradead.org
---
 arch/x86/include/asm/mmu_context.h | 2 +-
 arch/x86/kernel/alternative.c      | 2 +-
 arch/x86/mm/tlb.c                  | 8 ++++----
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/x86/include/asm/mmu_context.h b/arch/x86/include/asm/mmu_context.h
index b103e1709a67..988c11792634 100644
--- a/arch/x86/include/asm/mmu_context.h
+++ b/arch/x86/include/asm/mmu_context.h
@@ -273,6 +273,6 @@ unsigned long __get_current_cr3_fast(void);
 #include <asm-generic/mmu_context.h>
 
 extern struct mm_struct *use_temporary_mm(struct mm_struct *temp_mm);
-extern void unuse_temporary_mm(struct mm_struct *mm, struct mm_struct *prev_mm);
+extern void unuse_temporary_mm(struct mm_struct *prev_mm);
 
 #endif /* _ASM_X86_MMU_CONTEXT_H */
diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 25abadaf8751..964a2eb0071a 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2211,7 +2211,7 @@ static void *__text_poke(text_poke_f func, void *addr, const void *src, size_t l
 	 * instruction that already allows the core to see the updated version.
 	 * Xen-PV is assumed to serialize execution in a similar manner.
 	 */
-	unuse_temporary_mm(text_poke_mm, prev_mm);
+	unuse_temporary_mm(prev_mm);
 
 	/*
 	 * Flushing the TLB might involve IPIs, which would require enabled
diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index 06a1ad39be74..e672508ca158 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -1019,14 +1019,14 @@ struct mm_struct *use_temporary_mm(struct mm_struct *temp_mm)
 	return prev_mm;
 }
 
-void unuse_temporary_mm(struct mm_struct *mm, struct mm_struct *prev_mm)
+void unuse_temporary_mm(struct mm_struct *prev_mm)
 {
 	lockdep_assert_irqs_disabled();
 
-	switch_mm_irqs_off(NULL, prev_mm, current);
-
 	/* Clear the cpumask, to indicate no TLB flushing is needed anywhere */
-	cpumask_clear_cpu(raw_smp_processor_id(), mm_cpumask(mm));
+	cpumask_clear_cpu(smp_processor_id(), mm_cpumask(this_cpu_read(cpu_tlbstate.loaded_mm)));
+
+	switch_mm_irqs_off(NULL, prev_mm, current);
 
 	/*
 	 * Restore the breakpoints if they were disabled before the temporary mm
-- 
2.45.2

