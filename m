Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3A311F8AC5
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 11:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739272527; cv=none; b=YAlezGqh7lYhIayACT8SBojGdA0+7BScY24CYU0UgQEdWqRe7YnEeEoJYQ2SmVzXpSHShCkL9EbLugjKzjs1QTk0KYpCbsWaIT0XBQugnh/n0BTz/B2KFX9VjnYZiYVKMY0pDSC6PeImyNDDEYl79AyDS3YL3TvTkbMx7mk84xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739272527; c=relaxed/simple;
	bh=jwb7j9VMZE8iyQeZ3Z7Lcyr9jCb164rh8up+L8Wn+K0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=vE/HPi6HNOV4U0eR7t9Tm/cCpnxETg2wuYHszELBD7duVs/MnKWdSJmFrC7FoUxDjmFNP/bSdGnUoVvVrbY8mPDMkNqpcPLzRIyMXwMaBqBCOm+Q4yD/7RUYosRv8FOm5kzxeOzzpFQ36lAZZm04aLUpL21Owk+xdfheg75gs9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 11C3313D5;
	Tue, 11 Feb 2025 03:15:47 -0800 (PST)
Received: from K4MQJ0H1H2.emea.arm.com (K4MQJ0H1H2.blr.arm.com [10.162.40.80])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D8CDC3F5A1;
	Tue, 11 Feb 2025 03:15:15 -0800 (PST)
From: Dev Jain <dev.jain@arm.com>
To: akpm@linux-foundation.org,
	david@redhat.com,
	willy@infradead.org,
	kirill.shutemov@linux.intel.com
Cc: npache@redhat.com,
	ryan.roberts@arm.com,
	anshuman.khandual@arm.com,
	catalin.marinas@arm.com,
	cl@gentwo.org,
	vbabka@suse.cz,
	mhocko@suse.com,
	apopple@nvidia.com,
	dave.hansen@linux.intel.com,
	will@kernel.org,
	baohua@kernel.org,
	jack@suse.cz,
	srivatsa@csail.mit.edu,
	haowenchao22@gmail.com,
	hughd@google.com,
	aneesh.kumar@kernel.org,
	yang@os.amperecomputing.com,
	peterx@redhat.com,
	ioworker0@gmail.com,
	wangkefeng.wang@huawei.com,
	ziy@nvidia.com,
	jglisse@google.com,
	surenb@google.com,
	vishal.moola@gmail.com,
	zokeefe@google.com,
	zhengqi.arch@bytedance.com,
	jhubbard@nvidia.com,
	21cnbao@gmail.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Dev Jain <dev.jain@arm.com>
Subject: [PATCH v2 10/17] khugepaged: Exit early on fully-mapped aligned mTHP
Date: Tue, 11 Feb 2025 16:43:19 +0530
Message-Id: <20250211111326.14295-11-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250211111326.14295-1-dev.jain@arm.com>
References: <20250211111326.14295-1-dev.jain@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since mTHP orders under consideration by khugepaged are also candidates for the
fault handler, the case we hit frequently is that khugepaged scans a region for
order-x, whereas an order-x folio was already installed by the fault handler there.
Therefore, exit early; this prevents a timeout in the khugepaged selftest. Earlier
this was not a problem because a PMD-hugepage will get checked by find_pmd_or_thp_or_none(),
and the previous patch does not solve this problem because it will do the entire PTE
scan to exit.

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 mm/khugepaged.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 0d0d8f415a2e..baa5b44968ac 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -626,6 +626,11 @@ static int __collapse_huge_page_isolate(struct vm_area_struct *vma,
 
 		VM_BUG_ON_FOLIO(!folio_test_anon(folio), folio);
 
+		if (_pte == pte && (order != HPAGE_PMD_ORDER) && (folio_order(folio) == order) &&
+		    test_bit(PG_head, &folio->page.flags) && !folio_test_partially_mapped(folio)) {
+			result = SCAN_PTE_MAPPED_THP;
+			goto out;
+		}
 		/* See hpage_collapse_scan_pmd(). */
 		if (folio_likely_mapped_shared(folio)) {
 			++shared;
@@ -1532,6 +1537,16 @@ static int hpage_collapse_scan_pmd(struct mm_struct *mm,
 			goto out_unmap;
 		}
 
+		/* Exit early: There is high chance of this due to faulting */
+		if (_pte == pte && (order != HPAGE_PMD_ORDER) && (folio_order(folio) == order) &&
+		    test_bit(PG_head, &folio->page.flags) && !folio_test_partially_mapped(folio)) {
+			pte_unmap_unlock(pte, ptl);
+			_address = address + (PAGE_SIZE << order);
+			_pte = pte + (1UL << order);
+			result = SCAN_PTE_MAPPED_THP;
+			goto decide_order;
+		}
+
 		/*
 		 * We treat a single page as shared if any part of the THP
 		 * is shared. "False negatives" from
-- 
2.30.2

