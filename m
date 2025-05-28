Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CC01DED4C
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 20:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748464253; cv=none; b=P21It51KSk5JEB3w5dWAU/H6Q40DKYG7fooWbi5iPEM193/oYgC5VN+T3SIlcBVst3ghQJc6vz1REDdpsB5XMawRtSADIFoQZzhoXo/gifLnzuYu4w2havUtTFqZdkvNUtSPCbpF0vl76VCoj/7dm2KCloRwfwVATzl6HNz82pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748464253; c=relaxed/simple;
	bh=K3wSpQSAlquUmzWD4KKnCoFCek1BZ89eqpX1JdY+UdQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=RQgAtN3pbrl+15EYNqIwaAtsB3IOWUCZrrRWMdMOdqzMYrA3s5BRFbqNrJu6uktVDSNBSZZVc9fyXK6fx2k1eqqlknQLl85zceXMwMA2LAEU/CM64EABmoLcUjVRphFefJZdraq+3Prfuct/shV9xlW0Hhlqp8W0xMpusr1Wj7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=F/3klPMc; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="F/3klPMc"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-443d4bff5dfso3425e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 13:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748464250; x=1749069050; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YcyfVdlq9WV/erYYjl14s2tEh37ryQwi/k+tSn20SwQ=;
        b=F/3klPMcCQze4GXW1ZGpMbKLNbu5BpRe+zuuUvA7otkbyFY2bRYIRlG7QU0+WFba3S
         EEbr03mRSnCLnnmaTbLKGDd+8+Tdm65MClKnkF9qsXsGNiKx+W4ONf4Q8ELvDxpy8zV0
         hV1UOXR+rMbpWfATVZuW79gPyRJadBJTTKYii18mDKvqk6Ycm+RnyglLwT3PIM/qaNIY
         LlWCOgRLBbRBOZTXbYWO2rGok4ZbsKmEgQlcQ+M98BsMk5Lv79hoO3mkMbUgLuoa+AAD
         zvNnLJ2wvZjUOkul9nA9VlaOwS3tpelgg/1tDpm205JFnTa0fQaivd51sa6RB8cdvXbr
         VF2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748464250; x=1749069050;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YcyfVdlq9WV/erYYjl14s2tEh37ryQwi/k+tSn20SwQ=;
        b=HeAQuDwq/5ylDwRGhNWUpJAB0vT1P5+nf6TxxLhO6DVPkF/PmcpAdPzcuYvLSN1j0I
         FluwUkAlvnS2fx0+zafDQ6wLwZUx1Cg7/cnpKzD9d4zaWyrn7tJ1Mw5MIYhkgDd6TMYE
         k4jWT5SqkqjXHMb7SqQDgyZD9nN/m54lHne/G30izDosWS9sz7/Syh1mrLn22zJwFuA3
         XenCnaVBQXdV19IXflN3RVleuqZO7vSAmzgcDFPGBMv1xCFrtEd94X0+domgRbjgchWX
         VvZAAy4AEfECcQ1W7jvRQR8Gn9aBpCZoD3WbueiqSSD7rDQy3P8cS1Ai1RgWYBOU8j4x
         NVMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXK6zoE3XiU+rN38efaPPEKOtvxhiTN4vRtQMHVfybaFOMttORpZv3g5wVh9Qh/vqmo12h13ixm8t54qPw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCasr/D1wbOtaDffYhlJq5/u+wUAPqWii3TuqiKs3drdtz4KMX
	Azi4YrvWw0lqRLj9n1JOVjTdHilGpiD0D3vXp0oKWMAN/+qapMHvGtCkxAQfectDT6Wj8qBnV4j
	gQ6le5pds
X-Gm-Gg: ASbGncu/YyMG6/xCYbXWcu928k4VmaF0u5t01TdwF2QHyyIqXYWPEBNZr1gA32HjjjU
	+lLjvJtEwyGRG+l55MHzH5Smx2hRxkLTtSRHCNlzqiilaWb5BxgtoEp+d61xCyj9uwO7UWOvoW4
	JKqRHi/GSPVRISZoxQF3ivfmpHiMrUks13oxhMVl10Bg81esCAWsDflYG9/Bsw+KaLV+AyhlgjQ
	mPY8UiHluFJmL9Rthd9FK68V5Btr/y95kt4kXqA/VuVUk7CvWX324zMmenrpUfNuxOj8AiTmGWY
	J+eoArfj66wPU3mOMRWlfY1hHGjKQxS5KkmecRQ0r/EykTtX/Q==
X-Google-Smtp-Source: AGHT+IFqhlF0VTg6IWiksSiMoRyALLlwo7XBHc4J7Ft9f2DbhSi1BHjDFm9gnxcDI891tqLECRlnFA==
X-Received: by 2002:a7b:c3da:0:b0:439:961d:fc7d with SMTP id 5b1f17b1804b1-450cf335ea3mr289205e9.6.1748464249605;
        Wed, 28 May 2025 13:30:49 -0700 (PDT)
Received: from localhost ([2a00:79e0:9d:4:badf:6b4:8f13:cb30])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-450cfc51585sm1098995e9.23.2025.05.28.13.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 13:30:49 -0700 (PDT)
From: Jann Horn <jannh@google.com>
Date: Wed, 28 May 2025 22:30:27 +0200
Subject: [PATCH] x86/mm: Fix paging-structure cache flush on kernel table
 freeing
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-x86-fix-vmap-pt-del-flush-v1-1-e250899ed160@google.com>
X-B4-Tracking: v=1; b=H4sIAGNyN2gC/x2MSQqAMAwAvyI5G9C6Vb8iHoomGnAprUpB/LvF4
 8DMPODJCXnokgcc3eLl2CPkaQLjYvaZUKbIoDJVZZXSGHSNLAHvzVi0J060Iq+XX5BbNiUr3Yx
 tAbG3jqL4v/vhfT9FKR7zawAAAA==
X-Change-ID: 20250528-x86-fix-vmap-pt-del-flush-f9fa4f287c93
To: Dave Hansen <dave.hansen@linux.intel.com>, 
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Cc: Rik van Riel <riel@surriel.com>, Toshi Kani <toshi.kani@hpe.com>, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Jann Horn <jannh@google.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748464245; l=6612;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=K3wSpQSAlquUmzWD4KKnCoFCek1BZ89eqpX1JdY+UdQ=;
 b=03u+DvgqZJMLdJObp7ioKN9pW+AaQ2iK6kURB092/Zrvwa8LhlYFetXYwJxwLzsgF0jBk0D86
 jP7MvVRDBiuBJHBLkXIirCoVXi8u3ThzsyMpUzy14SFUmQKjKjXYNmq
X-Developer-Key: i=jannh@google.com; a=ed25519;
 pk=AljNtGOzXeF6khBXDJVVvwSEkVDGnnZZYqfWhP1V+C8=

There are several issues in pud_free_pmd_page() and pmd_free_pte_page(),
which are used by vmalloc:

1. flush_tlb_kernel_range() does not flush paging-structure caches for
   inactive PCIDs, but we're using it when freeing kernel page tables.
2. flush_tlb_kernel_range() only flushes paging-structure cache entries
   that intersect with the flush range, and pud_free_pmd_page() passes in
   the first PAGE_SIZE bytes of the area covered by the PMD table; but
   pud_free_pmd_page() is actually designed to also remove PTE tables that
   were installed in the PMD table, so we need to also flush those.
3. [theoretical issue] invlpgb_kernel_range_flush() expects an exclusive
   range, it does: `nr = (info->end - addr) >> PAGE_SHIFT;`
   But pmd_free_pte_page() and pud_free_pmd_page() provide inclusive
   ranges (`addr, addr + PAGE_SIZE-1`).

To fix it:

1. Add a new helper flush_tlb_kernel_pgtable_range() for flushing paging
   structure caches for kernel page tables, and use that.
2. Flush PUD_SIZE instead of PAGE_SIZE in pud_free_pmd_page().
3. Remove `-1` in end address calculations.

Note that since I'm not touching invlpgb_kernel_range_flush() or
invlpgb_flush_addr_nosync() in this patch, the flush on PMD table deletion
with INVLPGB might be a bit slow due to using PTE_STRIDE instead of
PMD_STRIDE. I don't think that matters.

Backport notes:
Kernels before 6.16 don't have invlpgb_kernel_range_flush(); for them,
kernel_tlb_flush_pgtable() should just unconditionally call
flush_tlb_all().
I am marking this as fixing commit 28ee90fe6048 ("x86/mm: implement free
pmd/pte page interfaces"); that is technically incorrect, since back then
no paging-structure cache invalidations were performed at all, but probably
makes the most sense here.

Cc: stable@vger.kernel.org
Fixes: 28ee90fe6048 ("x86/mm: implement free pmd/pte page interfaces")
Signed-off-by: Jann Horn <jannh@google.com>
---
 arch/x86/include/asm/tlb.h      |  4 ++++
 arch/x86/include/asm/tlbflush.h |  1 +
 arch/x86/mm/pgtable.c           | 13 +++++++++----
 arch/x86/mm/tlb.c               | 37 +++++++++++++++++++++++++++++++++++++
 4 files changed, 51 insertions(+), 4 deletions(-)

diff --git a/arch/x86/include/asm/tlb.h b/arch/x86/include/asm/tlb.h
index 866ea78ba156..56a4b93a0742 100644
--- a/arch/x86/include/asm/tlb.h
+++ b/arch/x86/include/asm/tlb.h
@@ -153,6 +153,10 @@ static inline void invlpgb_flush_all(void)
 /* Flush addr, including globals, for all PCIDs. */
 static inline void invlpgb_flush_addr_nosync(unsigned long addr, u16 nr)
 {
+	/*
+	 * Don't set INVLPGB_FLAG_FINAL_ONLY here without adjusting
+	 * kernel_tlb_flush_pgtable().
+	 */
 	__invlpgb(0, 0, addr, nr, PTE_STRIDE, INVLPGB_FLAG_INCLUDE_GLOBAL);
 }
 
diff --git a/arch/x86/include/asm/tlbflush.h b/arch/x86/include/asm/tlbflush.h
index e9b81876ebe4..06a4a2b7a9f5 100644
--- a/arch/x86/include/asm/tlbflush.h
+++ b/arch/x86/include/asm/tlbflush.h
@@ -318,6 +318,7 @@ extern void flush_tlb_mm_range(struct mm_struct *mm, unsigned long start,
 				unsigned long end, unsigned int stride_shift,
 				bool freed_tables);
 extern void flush_tlb_kernel_range(unsigned long start, unsigned long end);
+void flush_tlb_kernel_pgtable_range(unsigned long start, unsigned long end);
 
 static inline void flush_tlb_page(struct vm_area_struct *vma, unsigned long a)
 {
diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
index 62777ba4de1a..0779ed02226c 100644
--- a/arch/x86/mm/pgtable.c
+++ b/arch/x86/mm/pgtable.c
@@ -745,8 +745,13 @@ int pud_free_pmd_page(pud_t *pud, unsigned long addr)
 
 	pud_clear(pud);
 
-	/* INVLPG to clear all paging-structure caches */
-	flush_tlb_kernel_range(addr, addr + PAGE_SIZE-1);
+	/*
+	 * Clear paging-structure caches.
+	 * Note that since this function can remove a PMD table together with the
+	 * PTE tables it points to, we can't just flush the first PAGE_SIZE, we
+	 * must flush PUD_SIZE!
+	 */
+	flush_tlb_kernel_pgtable_range(addr, addr + PUD_SIZE);
 
 	for (i = 0; i < PTRS_PER_PMD; i++) {
 		if (!pmd_none(pmd_sv[i])) {
@@ -778,8 +783,8 @@ int pmd_free_pte_page(pmd_t *pmd, unsigned long addr)
 	pte = (pte_t *)pmd_page_vaddr(*pmd);
 	pmd_clear(pmd);
 
-	/* INVLPG to clear all paging-structure caches */
-	flush_tlb_kernel_range(addr, addr + PAGE_SIZE-1);
+	/* clear paging-structure caches */
+	flush_tlb_kernel_pgtable_range(addr, addr + PAGE_SIZE);
 
 	free_page((unsigned long)pte);
 
diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index 39f80111e6f1..26b78451a7ed 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -1525,6 +1525,22 @@ static void kernel_tlb_flush_range(struct flush_tlb_info *info)
 		on_each_cpu(do_kernel_range_flush, info, 1);
 }
 
+static void kernel_tlb_flush_pgtable(struct flush_tlb_info *info)
+{
+	/*
+	 * The special thing about removing kernel page tables is that we can't
+	 * use a flush that just removes global TLB entries; we need one that
+	 * flushes paging structure caches across all PCIDs.
+	 * With INVLPGB, that's explicitly supported.
+	 * Otherwise, there's no good way (INVLPG and INVPCID can't specifically
+	 * target one address across all PCIDs), just throw everything away.
+	 */
+	if (cpu_feature_enabled(X86_FEATURE_INVLPGB))
+		invlpgb_kernel_range_flush(info);
+	else
+		flush_tlb_all();
+}
+
 void flush_tlb_kernel_range(unsigned long start, unsigned long end)
 {
 	struct flush_tlb_info *info;
@@ -1542,6 +1558,27 @@ void flush_tlb_kernel_range(unsigned long start, unsigned long end)
 	put_flush_tlb_info();
 }
 
+/*
+ * Flush paging-structure cache entries for page tables covering the specified
+ * range and synchronize with concurrent hardware page table walks, in
+ * preparation for freeing page tables in the region.
+ * This must not be used for flushing translations to data pages.
+ */
+void flush_tlb_kernel_pgtable_range(unsigned long start, unsigned long end)
+{
+	struct flush_tlb_info *info;
+
+	/* We don't synchronize against GUP-fast. */
+	VM_WARN_ON(start < TASK_SIZE_MAX);
+
+	guard(preempt)();
+
+	info = get_flush_tlb_info(NULL, start, end, PMD_SHIFT, true,
+				  TLB_GENERATION_INVALID);
+	kernel_tlb_flush_pgtable(info);
+	put_flush_tlb_info();
+}
+
 /*
  * This can be used from process context to figure out what the value of
  * CR3 is without needing to do a (slow) __read_cr3().

---
base-commit: b1456f6dc167f7f101746e495bede2bac3d0e19f
change-id: 20250528-x86-fix-vmap-pt-del-flush-f9fa4f287c93

-- 
Jann Horn <jannh@google.com>

