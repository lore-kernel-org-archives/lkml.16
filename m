Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604E4199EAD
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 13:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744118213; cv=none; b=teuUbQntQG+yh5XtADNMP5yMwtYY6w9xv19YAzD7MxcyllnNkWa6drmHV8Qk4VrOEWFODp9Mi4A9ponBWlsmHc5m8SqkDB647nr8s8XdSYKv32GiJ3MahLaJBacFVltjqVQtcZx/um2JYKasmJSRyjTWl4waQJTPrG66dRmd1+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744118213; c=relaxed/simple;
	bh=Gy22dPoukqMVHzQau6W1LhQ39A20AwlkAu0qtozXxGs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Up9emHU4NP/85ceoQSnoT7mEwVTbi4RSYsAM1jC0lV7tfmysuWNwERvpZ24VrfY2ZiekgHWkmziW42hls1is7jzmUWu8CsXZdRtt3SqLwE0QT4OEt3Fif4GWGebHtB6C73jMAgcsM0rofzwvjcn+CG5+8IYiZ/7jTp+a1cDohY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=QE/j5ULT; arc=none smtp.client-ip=115.124.30.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="QE/j5ULT"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1744118202; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=V2Se/BLxZ964m2iPoAIaOM44L2WT/X+H4B3BvY/RXls=;
	b=QE/j5ULTjtZe8e8ZnDayvFYLLVsUG/nZuXXfmxPtoczE64fE5FNRZZfpb49NAiEvuCKkvoibv9LvPvudT/l4950jVin9EsX2RY5s+J0DOXNovzW7VGe7isZnM2vZTHO5fi1NKHnLFkl2PbFliMSZH+fq0TSq8wOaVbB5rxwrk7I=
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WWFZiPw_1744118201 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 08 Apr 2025 21:16:41 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: akpm@linux-foundation.org
Cc: willy@infradead.org,
	david@redhat.com,
	21cnbao@gmail.com,
	ryan.roberts@arm.com,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH] mm: huge_memory: add folio_mark_accessed() when zapping file THP
Date: Tue,  8 Apr 2025 21:16:35 +0800
Message-ID: <34bab7a60930472377afbfeefe05b980d0512aa4.1744118089.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When investigating performance issues during file folio unmap, I noticed some
behavioral differences in handling non-PMD-sized folios and PMD-sized folios.
For non-PMD-sized file folios, it will call folio_mark_accessed() to mark the
folio as having seen activity, but this is not done for PMD-sized folios.

This might not cause obvious issues, but a potential problem could be that,
it might lead to more frequent refaults of PMD-sized file folios under memory
pressure. Therefore, I am unsure whether the folio_mark_accessed() should be
added for PMD-sized file folios?

Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 mm/huge_memory.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 6ac6d468af0d..b3ade7ac5bbf 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -2262,6 +2262,10 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
 				zap_deposited_table(tlb->mm, pmd);
 			add_mm_counter(tlb->mm, mm_counter_file(folio),
 				       -HPAGE_PMD_NR);
+
+			if (flush_needed && pmd_young(orig_pmd) &&
+			    likely(vma_has_recency(vma)))
+				folio_mark_accessed(folio);
 		}
 
 		spin_unlock(ptl);
-- 
2.43.5

