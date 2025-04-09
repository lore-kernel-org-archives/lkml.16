Received: from out30-111.freemail.mail.aliyun.com (out30-111.freemail.mail.aliyun.com [115.124.30.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563FC26ACD
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 09:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744191558; cv=none; b=h5GbJgtTEqwL6AXM20KtXed4CooIXPB93yKsXYTvRZ+MIfx8M76Kavz1JvYb/EF1n0XJN5Q06CIBO4B1ms2fVEGUsPVuaMC0u7wcesXgkJUVYt/8lUKnfkb4quIlYDKLwms6Kfhnx5bgzrDrV/z57WUqNqEfGYl+KHD4SUynVSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744191558; c=relaxed/simple;
	bh=bL86pMjv61t/RXJtUwElR5rFFhqfg2s5AHtb+7ocKa8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YGB8apDVBtwS7MC2X69pJk47Cc7TBUoIoX8GrSoBCbvYzI0Il/ot0p8TiJjAv0IcjVturqrEXKZcOsKi+mQ+5ubpNFYMQXxFo8CcuGK9xJwjdQOTpZXYD/Nt1Lix5QHH8KJONF+8M4O25lF+RXDvPMN05kkdyADvR7Ak6q+CH3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=cRle58JH; arc=none smtp.client-ip=115.124.30.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="cRle58JH"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1744191552; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=qXgmXI91rfrc093sRbBRSsEyn4YoZ8rNV1XRh41K/Yc=;
	b=cRle58JH3btf+IT6IJwdyHUomOETWq6RcPvChrLD76G3cKY7xTuVDiOpIlrFQZXSwcBJLQ1jmETwSjf0m7YIA0nYg/w1Z6UXbtbvAUVNmXqeF2a9skjQPy7aZPJBKlkqmwiH1aSYFdaHE0XwAUfmFwvOqDxllolf5FCBrMOiTf8=
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WWJihu5_1744191551 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 09 Apr 2025 17:39:11 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: akpm@linux-foundation.org
Cc: willy@infradead.org,
	david@redhat.com,
	hannes@cmpxchg.org,
	21cnbao@gmail.com,
	ryan.roberts@arm.com,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mm: huge_memory: add folio_mark_accessed() when zapping file THP
Date: Wed,  9 Apr 2025 17:38:58 +0800
Message-ID: <fc117f60d7b686f87067f36a0ef7cdbc3a78109c.1744190345.git.baolin.wang@linux.alibaba.com>
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
it might lead to reclaim hot file folios under memory pressure, as quoted
from Johannes:

"
Sometimes file contents are only accessed through relatively short-lived
mappings. But they can nevertheless be accessed a lot and be hot. It's
important to not lose that information on unmap, and end up kicking out a
frequently used cache page.
"

Therefore, we should also add folio_mark_accessed() for PMD-sized file
folios when unmapping.

Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Acked-by: Johannes Weiner <hannes@cmpxchg.org>
Acked-by: Zi Yan <ziy@nvidia.com>
---
Changes from RFC:
 - Update the commit message, per Johannes.
 - Collect Acked tags from Johannes and Zi. Thanks.
---
 mm/huge_memory.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 2a47682d1ab7..955781b4e946 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -2260,6 +2260,10 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
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

