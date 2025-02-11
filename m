Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 445EE1FCF7C
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 11:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739272538; cv=none; b=Mg3UlaJNb144W7tLV7ATha495KzewQx/1+/F5AHV0f+O5YWXB1zgGO0yfy4pxl/x0S9zIKaZki+LetYAeKll1roTIUeiB4b/5R9qkx/8J8I2Cv8g2y0EH9yQSY3Luwz6N+R3GOyIt6XDMTrHZFZt4KTdKUphucGcGFRqVTgKVBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739272538; c=relaxed/simple;
	bh=iFV0hhjYpSnTo4OcMNtFrIBSyTfyrCAVrzjqHeN3Gxo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KbvUZq4gR74xz98Zz7mAHovrLKsnVUTTsO4qgNchj4+ntjJJywy2ff2sFY6QTBe8H8tvTgbeJzGVFAcfcIa421oreT1LatJX2setY9z7YlmGxAAe1rJG8OnrDamUbhK7WXo9EeIslSg+FE4T0NJwVNaUkvfSth3a0MyBaziP61A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 03FCF13D5;
	Tue, 11 Feb 2025 03:15:58 -0800 (PST)
Received: from K4MQJ0H1H2.emea.arm.com (K4MQJ0H1H2.blr.arm.com [10.162.40.80])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3600B3F5A1;
	Tue, 11 Feb 2025 03:15:25 -0800 (PST)
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
Subject: [PATCH v2 11/17] khugepaged: Enable sysfs to control order of collapse
Date: Tue, 11 Feb 2025 16:43:20 +0530
Message-Id: <20250211111326.14295-12-dev.jain@arm.com>
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

Activate khugepaged for anonymous collapse even if a single order is activated.
This condition will be updated upon by subsequent patches.

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 mm/khugepaged.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index baa5b44968ac..37cfa7beba3d 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -415,24 +415,20 @@ static inline int hpage_collapse_test_exit_or_disable(struct mm_struct *mm)
 	       test_bit(MMF_DISABLE_THP, &mm->flags);
 }
 
-static bool hugepage_pmd_enabled(void)
+static bool thp_enabled(void)
 {
 	/*
 	 * We cover the anon, shmem and the file-backed case here; file-backed
 	 * hugepages, when configured in, are determined by the global control.
-	 * Anon pmd-sized hugepages are determined by the pmd-size control.
+	 * Anon mTHPs are determined by the per-size control.
 	 * Shmem pmd-sized hugepages are also determined by its pmd-size control,
 	 * except when the global shmem_huge is set to SHMEM_HUGE_DENY.
 	 */
 	if (IS_ENABLED(CONFIG_READ_ONLY_THP_FOR_FS) &&
 	    hugepage_global_enabled())
 		return true;
-	if (test_bit(PMD_ORDER, &huge_anon_orders_always))
-		return true;
-	if (test_bit(PMD_ORDER, &huge_anon_orders_madvise))
-		return true;
-	if (test_bit(PMD_ORDER, &huge_anon_orders_inherit) &&
-	    hugepage_global_enabled())
+	if (huge_anon_orders_always || huge_anon_orders_madvise ||
+	    (huge_anon_orders_inherit && hugepage_global_enabled()))
 		return true;
 	if (IS_ENABLED(CONFIG_SHMEM) && shmem_hpage_pmd_enabled())
 		return true;
@@ -475,9 +471,9 @@ void khugepaged_enter_vma(struct vm_area_struct *vma,
 			  unsigned long vm_flags)
 {
 	if (!test_bit(MMF_VM_HUGEPAGE, &vma->vm_mm->flags) &&
-	    hugepage_pmd_enabled()) {
-		if (thp_vma_allowable_order(vma, vm_flags, TVA_ENFORCE_SYSFS,
-					    PMD_ORDER))
+	    thp_enabled()) {
+		if (thp_vma_allowable_orders(vma, vm_flags, TVA_ENFORCE_SYSFS,
+					     THP_ORDERS_ALL_ANON))
 			__khugepaged_enter(vma->vm_mm);
 	}
 }
@@ -2679,8 +2675,8 @@ static unsigned int khugepaged_scan_mm_slot(unsigned int pages, int *result,
 			progress++;
 			break;
 		}
-		if (!thp_vma_allowable_order(vma, vma->vm_flags,
-					TVA_ENFORCE_SYSFS, PMD_ORDER)) {
+		if (!thp_vma_allowable_orders(vma, vma->vm_flags,
+					TVA_ENFORCE_SYSFS, THP_ORDERS_ALL_ANON)) {
 skip:
 			progress++;
 			continue;
@@ -2704,6 +2700,10 @@ static unsigned int khugepaged_scan_mm_slot(unsigned int pages, int *result,
 				  khugepaged_scan.address + HPAGE_PMD_SIZE >
 				  hend);
 			if (IS_ENABLED(CONFIG_SHMEM) && !vma_is_anonymous(vma)) {
+				if (!thp_vma_allowable_order(vma, vma->vm_flags,
+				    TVA_ENFORCE_SYSFS, PMD_ORDER))
+					break;
+
 				struct file *file = get_file(vma->vm_file);
 				pgoff_t pgoff = linear_page_index(vma,
 						khugepaged_scan.address);
@@ -2782,7 +2782,7 @@ static unsigned int khugepaged_scan_mm_slot(unsigned int pages, int *result,
 
 static int khugepaged_has_work(void)
 {
-	return !list_empty(&khugepaged_scan.mm_head) && hugepage_pmd_enabled();
+	return !list_empty(&khugepaged_scan.mm_head) && thp_enabled();
 }
 
 static int khugepaged_wait_event(void)
@@ -2855,7 +2855,7 @@ static void khugepaged_wait_work(void)
 		return;
 	}
 
-	if (hugepage_pmd_enabled())
+	if (thp_enabled())
 		wait_event_freezable(khugepaged_wait, khugepaged_wait_event());
 }
 
@@ -2886,7 +2886,7 @@ static void set_recommended_min_free_kbytes(void)
 	int nr_zones = 0;
 	unsigned long recommended_min;
 
-	if (!hugepage_pmd_enabled()) {
+	if (!thp_enabled()) {
 		calculate_min_free_kbytes();
 		goto update_wmarks;
 	}
@@ -2936,7 +2936,7 @@ int start_stop_khugepaged(void)
 	int err = 0;
 
 	mutex_lock(&khugepaged_mutex);
-	if (hugepage_pmd_enabled()) {
+	if (thp_enabled()) {
 		if (!khugepaged_thread)
 			khugepaged_thread = kthread_run(khugepaged, NULL,
 							"khugepaged");
@@ -2962,7 +2962,7 @@ int start_stop_khugepaged(void)
 void khugepaged_min_free_kbytes_update(void)
 {
 	mutex_lock(&khugepaged_mutex);
-	if (hugepage_pmd_enabled() && khugepaged_thread)
+	if (thp_enabled() && khugepaged_thread)
 		set_recommended_min_free_kbytes();
 	mutex_unlock(&khugepaged_mutex);
 }
-- 
2.30.2

