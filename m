Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B22B16DEB1
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 04:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738817058; cv=none; b=iphGbyM/za8UZTTmnw0fKLv1KAhiAy3jDFN7mrsjzyt9boPX1IuweDUMQ53XyfMHl0PuDXRs2z6kXFcKzNBjMEN8rED5onni86rSfeST5pPOzVBK530XVDPZH4T8azWsJ8NZhv+4N6dN7mq9QBXpKGhsnIbPwttSmWkVDL3c8FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738817058; c=relaxed/simple;
	bh=UWRgJbG9w6fnHaTkliwHPJ1B+bT6SVScjpGW+fA/f0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mCq0HLd/W3wKOZdMnaMv6lRQ3qiO/VHqv8j15EdZD0s5xvaizLoZSkDwo8R8/eXWIUU5hAQmfEdvICZDAglrDfi0pHNQwrbp4RZ27HExrzv9fm5uBMipBH4Whc8uPSDwZH/bHCTp9LLkCuHdwvmNXGw7gFaIMmac/ZX+sCJkhFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=shelob.surriel.com; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shelob.surriel.com
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@shelob.surriel.com>)
	id 1tftjw-000000004tQ-1w6p;
	Wed, 05 Feb 2025 23:43:48 -0500
From: Rik van Riel <riel@surriel.com>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	bp@alien8.de,
	peterz@infradead.org,
	dave.hansen@linux.intel.com,
	zhengqi.arch@bytedance.com,
	nadav.amit@gmail.com,
	thomas.lendacky@amd.com,
	kernel-team@meta.com,
	linux-mm@kvack.org,
	akpm@linux-foundation.org,
	jannh@google.com,
	mhklinux@outlook.com,
	andrew.cooper3@citrix.com,
	Rik van Riel <riel@surriel.com>,
	Dave Hansen <dave.hansen@intel.com>
Subject: [PATCH v9 03/12] x86/mm: consolidate full flush threshold decision
Date: Wed,  5 Feb 2025 23:43:22 -0500
Message-ID: <20250206044346.3810242-4-riel@surriel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250206044346.3810242-1-riel@surriel.com>
References: <20250206044346.3810242-1-riel@surriel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: riel@surriel.com

Reduce code duplication by consolidating the decision point
for whether to do individual invalidations or a full flush
inside get_flush_tlb_info.

Signed-off-by: Rik van Riel <riel@surriel.com>
Suggested-by: Dave Hansen <dave.hansen@intel.com>
---
 arch/x86/mm/tlb.c | 56 ++++++++++++++++++++++++++---------------------
 1 file changed, 31 insertions(+), 25 deletions(-)

diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index 6cf881a942bb..36939b104561 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -1000,8 +1000,13 @@ static struct flush_tlb_info *get_flush_tlb_info(struct mm_struct *mm,
 	BUG_ON(this_cpu_inc_return(flush_tlb_info_idx) != 1);
 #endif
 
-	info->start		= start;
-	info->end		= end;
+	/*
+	 * Round the start and end addresses to the page size specified
+	 * by the stride shift. This ensures partial pages at the end of
+	 * a range get fully invalidated.
+	 */
+	info->start		= round_down(start, 1 << stride_shift);
+	info->end		= round_up(end, 1 << stride_shift);
 	info->mm		= mm;
 	info->stride_shift	= stride_shift;
 	info->freed_tables	= freed_tables;
@@ -1009,6 +1014,19 @@ static struct flush_tlb_info *get_flush_tlb_info(struct mm_struct *mm,
 	info->initiating_cpu	= smp_processor_id();
 	info->trim_cpumask	= 0;
 
+	WARN_ONCE(start != info->start || end != info->end,
+		  "TLB flush not stride %x aligned. Start %lx, end %lx\n",
+		  1 << stride_shift, start, end);
+
+	/*
+	 * If the number of flushes is so large that a full flush
+	 * would be faster, do a full flush.
+	 */
+	if ((end - start) >> stride_shift > tlb_single_page_flush_ceiling) {
+		info->start = 0;
+		info->end = TLB_FLUSH_ALL;
+	}
+
 	return info;
 }
 
@@ -1026,17 +1044,8 @@ void flush_tlb_mm_range(struct mm_struct *mm, unsigned long start,
 				bool freed_tables)
 {
 	struct flush_tlb_info *info;
+	int cpu = get_cpu();
 	u64 new_tlb_gen;
-	int cpu;
-
-	cpu = get_cpu();
-
-	/* Should we flush just the requested range? */
-	if ((end == TLB_FLUSH_ALL) ||
-	    ((end - start) >> stride_shift) > tlb_single_page_flush_ceiling) {
-		start = 0;
-		end = TLB_FLUSH_ALL;
-	}
 
 	/* This is also a barrier that synchronizes with switch_mm(). */
 	new_tlb_gen = inc_mm_tlb_gen(mm);
@@ -1089,22 +1098,19 @@ static void do_kernel_range_flush(void *info)
 
 void flush_tlb_kernel_range(unsigned long start, unsigned long end)
 {
-	/* Balance as user space task's flush, a bit conservative */
-	if (end == TLB_FLUSH_ALL ||
-	    (end - start) > tlb_single_page_flush_ceiling << PAGE_SHIFT) {
-		on_each_cpu(do_flush_tlb_all, NULL, 1);
-	} else {
-		struct flush_tlb_info *info;
+	struct flush_tlb_info *info;
 
-		preempt_disable();
-		info = get_flush_tlb_info(NULL, start, end, 0, false,
-					  TLB_GENERATION_INVALID);
+	guard(preempt)();
+
+	info = get_flush_tlb_info(NULL, start, end, PAGE_SHIFT, false,
+				  TLB_GENERATION_INVALID);
 
+	if (info->end == TLB_FLUSH_ALL)
+		on_each_cpu(do_flush_tlb_all, NULL, 1);
+	else
 		on_each_cpu(do_kernel_range_flush, info, 1);
 
-		put_flush_tlb_info();
-		preempt_enable();
-	}
+	put_flush_tlb_info();
 }
 
 /*
@@ -1276,7 +1282,7 @@ void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
 
 	int cpu = get_cpu();
 
-	info = get_flush_tlb_info(NULL, 0, TLB_FLUSH_ALL, 0, false,
+	info = get_flush_tlb_info(NULL, 0, TLB_FLUSH_ALL, PAGE_SHIFT, false,
 				  TLB_GENERATION_INVALID);
 	/*
 	 * flush_tlb_multi() is not optimized for the common case in which only
-- 
2.47.1

