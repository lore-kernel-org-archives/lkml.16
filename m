Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A96721F91E3
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 11:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739272559; cv=none; b=s1RbFL1+/HW8CSqGOGF4RsxDs/swWH1NBVe6tMAl8zqXW3frSEWqX8oMHHLBoCebYRX0/xkREgpZDerum+IkyekDBxAB4Nw4sG4qTtvs9KwJHQdECCue5+X+fZ0ad0YezK2YqHNZ94mAcyvr84KQMrV+zFfIP3WRBj4/CyIHBYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739272559; c=relaxed/simple;
	bh=3rnEd+xOAij9uQi20VgzYmdGJrX4pH4MSDprwMZkyBQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iFb+cFRjG+sBkx0a5Ou5KZIGnKZR2tkx8QyHmucZh97wNSyjLrCnW5ECYLrLbtiQb3IWWuEF34dP4G3prjsxrB099CiJFU1qHMK5ZW69y3Zifzerd3pl3BbDAFsJIS5ghFMrYMBy9z1yuogXVso40YMgK112ONv9UDseU+1IebA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 68D7913D5;
	Tue, 11 Feb 2025 03:16:18 -0800 (PST)
Received: from K4MQJ0H1H2.emea.arm.com (K4MQJ0H1H2.blr.arm.com [10.162.40.80])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9313B3F5A1;
	Tue, 11 Feb 2025 03:15:46 -0800 (PST)
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
Subject: [PATCH v2 13/17] khugepaged: Lock all VMAs mapping the PTE table
Date: Tue, 11 Feb 2025 16:43:22 +0530
Message-Id: <20250211111326.14295-14-dev.jain@arm.com>
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

After enabling khugepaged to handle VMAs of any size, it may happen that
the process faults on a VMA other than the VMA under collapse, and both
these VMAs span the same PTE table. As a result, the fault handler will
install a new PTE table after khugepaged isolates the PTE table. Therefore,
scan the PTE table, retrieve all VMAs, and write lock them. Note that,
rmap can still reach the PTE table from folios not under collapse; this is
fine since it does not interfere with the PTEs under collapse, nor the folios
under collapse, nor can rmap fill the PMD.

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 mm/khugepaged.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 048f990d8507..e1c2c5b89f6d 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -1139,6 +1139,23 @@ static int alloc_charge_folio(struct folio **foliop, struct mm_struct *mm,
 	return SCAN_SUCCEED;
 }
 
+static void take_vma_locks_per_pte(struct mm_struct *mm, unsigned long haddress)
+{
+	struct vm_area_struct *vma;
+	unsigned long start = haddress;
+	unsigned long end = haddress + HPAGE_PMD_SIZE;
+
+	while (start < end) {
+		vma = vma_lookup(mm, start);
+		if (!vma) {
+			start += PAGE_SIZE;
+			continue;
+		}
+		vma_start_write(vma);
+		start = vma->vm_end;
+	}
+}
+
 static int vma_collapse_anon_folio_pmd(struct mm_struct *mm, unsigned long address,
 		struct vm_area_struct *vma, struct collapse_control *cc, pmd_t *pmd,
 		struct folio *folio)
@@ -1270,7 +1287,9 @@ static int vma_collapse_anon_folio(struct mm_struct *mm, unsigned long address,
 	if (result != SCAN_SUCCEED)
 		goto out;
 
-	vma_start_write(vma);
+	/* Faulting may fill the PMD after flush; lock all VMAs mapping this PTE */
+	take_vma_locks_per_pte(mm, haddress);
+
 	anon_vma_lock_write(vma->anon_vma);
 
 	mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, mm, haddress,
-- 
2.30.2

