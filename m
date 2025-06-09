Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 944F81714B7
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 10:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749465108; cv=none; b=me7asMyBNu2SJZMSrQq8YGfFCPJL1g/jBfEJomwhu1xNi9b/qQQ4z7pduomFhE1Vr1m7EN7VH19tQh6r68SW95C0VBGyeb21BgAZ9/uMubT+WAs8h18diXrgbRaA7puXp18lduzNSPUueXF3GjhvdhIrcx1IXu0vGxi0t7RmLXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749465108; c=relaxed/simple;
	bh=4erjn9BtGTOtEhtxONVIB4Jf/vnltMy0Y4kyJZqUE2c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PuE6k2tIJoGvjo4aSUlFgbSdiE6wZ7GnrsgS5SE+s9bzdqg+9xkb72STak0rsaz2zT8RmHJFfS+39YLyOksX2Q9mYpF4BaModTkAXVkcwJsZlW45heGgIWQwGNccZcEn3CoJ9htubf7aftY+LYMyiv9PT7ce7zg8F6pvf1tuJEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 065B3150C;
	Mon,  9 Jun 2025 03:31:27 -0700 (PDT)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B872F3F673;
	Mon,  9 Jun 2025 03:31:42 -0700 (PDT)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Rik van Riel <riel@surriel.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Harry Yoo <harry.yoo@oracle.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-mm@kvack.org
Subject: [PATCH v1] mm: Remove arch_flush_tlb_batched_pending() arch helper
Date: Mon,  9 Jun 2025 11:31:30 +0100
Message-ID: <20250609103132.447370-1-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 4b634918384c ("arm64/mm: Close theoretical race where stale
TLB entry remains valid"), all arches that use tlbbatch for reclaim
(arm64, riscv, x86) implement arch_flush_tlb_batched_pending() with a
flush_tlb_mm().

So let's simplify by removing the unnecessary abstraction and doing the
flush_tlb_mm() directly in flush_tlb_batched_pending(). This effectively
reverts commit db6c1f6f236d ("mm/tlbbatch: introduce
arch_flush_tlb_batched_pending()").

Suggested-by: Will Deacon <will@kernel.org>
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/arm64/include/asm/tlbflush.h | 11 -----------
 arch/riscv/include/asm/tlbflush.h |  1 -
 arch/riscv/mm/tlbflush.c          |  5 -----
 arch/x86/include/asm/tlbflush.h   |  5 -----
 mm/rmap.c                         |  2 +-
 5 files changed, 1 insertion(+), 23 deletions(-)

diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index aa9efee17277..18a5dc0c9a54 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -322,17 +322,6 @@ static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
 	return true;
 }

-/*
- * If mprotect/munmap/etc occurs during TLB batched flushing, we need to ensure
- * all the previously issued TLBIs targeting mm have completed. But since we
- * can be executing on a remote CPU, a DSB cannot guarantee this like it can
- * for arch_tlbbatch_flush(). Our only option is to flush the entire mm.
- */
-static inline void arch_flush_tlb_batched_pending(struct mm_struct *mm)
-{
-	flush_tlb_mm(mm);
-}
-
 /*
  * To support TLB batched flush for multiple pages unmapping, we only send
  * the TLBI for each page in arch_tlbbatch_add_pending() and wait for the
diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
index 1a20dd746a49..eed0abc40514 100644
--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -63,7 +63,6 @@ void flush_pud_tlb_range(struct vm_area_struct *vma, unsigned long start,
 bool arch_tlbbatch_should_defer(struct mm_struct *mm);
 void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
 		struct mm_struct *mm, unsigned long start, unsigned long end);
-void arch_flush_tlb_batched_pending(struct mm_struct *mm);
 void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch);

 extern unsigned long tlb_flush_all_threshold;
diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index e737ba7949b1..8404530ec00f 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -234,11 +234,6 @@ void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
 	mmu_notifier_arch_invalidate_secondary_tlbs(mm, start, end);
 }

-void arch_flush_tlb_batched_pending(struct mm_struct *mm)
-{
-	flush_tlb_mm(mm);
-}
-
 void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
 {
 	__flush_tlb_range(NULL, &batch->cpumask,
diff --git a/arch/x86/include/asm/tlbflush.h b/arch/x86/include/asm/tlbflush.h
index e9b81876ebe4..00daedfefc1b 100644
--- a/arch/x86/include/asm/tlbflush.h
+++ b/arch/x86/include/asm/tlbflush.h
@@ -356,11 +356,6 @@ static inline void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *b
 	mmu_notifier_arch_invalidate_secondary_tlbs(mm, 0, -1UL);
 }

-static inline void arch_flush_tlb_batched_pending(struct mm_struct *mm)
-{
-	flush_tlb_mm(mm);
-}
-
 extern void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch);

 static inline bool pte_flags_need_flush(unsigned long oldflags,
diff --git a/mm/rmap.c b/mm/rmap.c
index fb63d9256f09..fd160ddaa980 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -746,7 +746,7 @@ void flush_tlb_batched_pending(struct mm_struct *mm)
 	int flushed = batch >> TLB_FLUSH_BATCH_FLUSHED_SHIFT;

 	if (pending != flushed) {
-		arch_flush_tlb_batched_pending(mm);
+		flush_tlb_mm(mm);
 		/*
 		 * If the new TLB flushing is pending during flushing, leave
 		 * mm->tlb_flush_batched as is, to avoid losing flushing.
--
2.43.0

