Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C69EF1B86F7
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 11:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739272457; cv=none; b=sN92ctePNF4l+QJqiThFr3bEq0iLfuhbHWRxUUeRwmnGM2dxcXDyL10NWWDhQg1OQkEhJ4og2Sq5pX6MHu5JTU3wYCwQCmnq457rz/fzs9oYguoX4C5+qMqb854PkKLQ5WU55pNMurmfRakEXctdfevbaMhTLpAE42z7flymTEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739272457; c=relaxed/simple;
	bh=n2OUYq4x9pVNwaL+7Sz7Igqpu0iQoNzw8pLK5Jma/xw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iyACe+/9h2Y7nYNgYuU6Vf73z5kSDV+qQMwOHepgqHRbwmHUp5iqxG6239f2JMZCEY7y4rsLi4k+dONamFwNSC/Ed7fqmz5ci27gQc48k/jiscBvwvrUJwZSY46Vc3EtuFjSsN7SmwjT4myaItR3OiAF8MK/TE0GUhhvQlVHQ5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7D2761477;
	Tue, 11 Feb 2025 03:14:36 -0800 (PST)
Received: from K4MQJ0H1H2.emea.arm.com (K4MQJ0H1H2.blr.arm.com [10.162.40.80])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 61B503F5A1;
	Tue, 11 Feb 2025 03:14:05 -0800 (PST)
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
Subject: [PATCH v2 03/17] khugepaged: Generalize __collapse_huge_page_swapin()
Date: Tue, 11 Feb 2025 16:43:12 +0530
Message-Id: <20250211111326.14295-4-dev.jain@arm.com>
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

If any PTE in our scan range is a swap entry, then use do_swap_page() to swap-in
the corresponding folio.

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 mm/khugepaged.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 3d105cacf855..221823c0d95f 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -999,17 +999,17 @@ static int check_pmd_still_valid(struct mm_struct *mm,
  */
 static int __collapse_huge_page_swapin(struct mm_struct *mm,
 				       struct vm_area_struct *vma,
-				       unsigned long haddr, pmd_t *pmd,
-				       int referenced)
+				       unsigned long addr, pmd_t *pmd,
+				       int referenced, int order)
 {
 	int swapped_in = 0;
 	vm_fault_t ret = 0;
-	unsigned long address, end = haddr + (HPAGE_PMD_NR * PAGE_SIZE);
+	unsigned long address, end = addr + (PAGE_SIZE << order);
 	int result;
 	pte_t *pte = NULL;
 	spinlock_t *ptl;
 
-	for (address = haddr; address < end; address += PAGE_SIZE) {
+	for (address = addr; address < end; address += PAGE_SIZE) {
 		struct vm_fault vmf = {
 			.vma = vma,
 			.address = address,
@@ -1154,7 +1154,7 @@ static int collapse_huge_page(struct mm_struct *mm, unsigned long address,
 		 * that case.  Continuing to collapse causes inconsistency.
 		 */
 		result = __collapse_huge_page_swapin(mm, vma, address, pmd,
-						     referenced);
+						     referenced, HPAGE_PMD_ORDER);
 		if (result != SCAN_SUCCEED)
 			goto out_nolock;
 	}
-- 
2.30.2

