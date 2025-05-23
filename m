Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.6])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BAB47DA8C
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 08:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747988522; cv=none; b=TazN17dDgFw8DZ8zKTFVi7tg2PJsxjt3zzmoCdfQiWg+GNrgoj47uWxrCxlLTyhHaBhkDVBqzScKFUOYxO7OF2xzZ9Eko7XoGb6rPtL1zj34Em7X7EQu32BsMQvJuCTzI01NFZzNiib+v9sFR2olf1facr651ACpLH89SzHx6aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747988522; c=relaxed/simple;
	bh=F9eogXVRmQc37DFh25x1QQIVdRcTgtl5Gout+juqN4M=;
	h=From:To:Cc:Subject:Date:Message-Id; b=VJp9FnTSxFrwxj7z//QcKvoX4/t3GtNvDIQHwuCPXZuShOCy6Tj6qFkB3QQSYERrCQ8Ci1ZlQ/2ppXamrW+ZOq2FAqs7GzOKVRG4aorcJvaDwKzha/rrYWRSeslV7u1FWGxB8PouB8DB5bAm0ZjNxO8PK7mkD8bsx3jXuWzRkHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=eK6KCAMD; arc=none smtp.client-ip=117.135.210.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="eK6KCAMD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-Id; bh=rp6Hjx/YmyVFhd+
	IZDZGfGqixxaOhCtM0oD2AcUcjns=; b=eK6KCAMD40HqGN8n0ZYfBa1SW/Wzawb
	x1FcUtyHLSJuXWz3XqVxGtbRGPsvmeq7E6uCiNBt3ave7tM7kuUjS1Zu0zBwmMTB
	sQ4zJMmNWqz0gscWhlB758DQILUiTy4MCm6KHYPc+jXVSdQTLdqFpQ8D2oUfFm0b
	Tfk9nODcBA2k=
Received: from hg-OptiPlex-7040.hygon.cn (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wDXb09qLDBosZMgAg--.61413S2;
	Fri, 23 May 2025 16:06:03 +0800 (CST)
From: yangge1116@126.com
To: akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	21cnbao@gmail.com,
	david@redhat.com,
	baolin.wang@linux.alibaba.com,
	muchun.song@linux.dev,
	osalvador@suse.de,
	liuzixing@hygon.cn,
	Ge Yang <yangge1116@126.com>
Subject: [PATCH] mm/hugetlb: remove redundant folio_test_hugetlb
Date: Fri, 23 May 2025 16:05:59 +0800
Message-Id: <1747987559-23082-1-git-send-email-yangge1116@126.com>
X-Mailer: git-send-email 2.7.4
X-CM-TRANSID:_____wDXb09qLDBosZMgAg--.61413S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGF4rXryfZw4rtrWDGF1kGrg_yoWruryUpF
	W3GrsxtrWkXa4DWr4xAr4kJrn0k34DX34UtFWxKFWavF4aqw1UKF1DZw18XayrCr9rJFWf
	ZF4jqFWv9F4jy3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zNQ6JUUUUUU=
X-CM-SenderInfo: 51dqwwjhrrila6rslhhfrp/1tbidQFWG2gwKKR7KgAAs8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

From: Ge Yang <yangge1116@126.com>

In the isolate_or_dissolve_huge_folio() function, the folio_test_hugetlb()
function is called to determine whether a folio is a hugetlb folio.
However, in the subsequent alloc_and_dissolve_hugetlb_folio() function,
the folio_test_hugetlb() function is called again to make the same
determination about whether the folio is a hugetlb folio. It appears that
the folio_test_hugetlb() check in the isolate_or_dissolve_huge_folio()
function can be removed. Additionally, a similar issue exists in the
replace_free_hugepage_folios() function, and it should be addressed as
well.

Suggested-by: Oscar Salvador <osalvador@suse.de>
Signed-off-by: Ge Yang <yangge1116@126.com>
---
 mm/hugetlb.c | 51 +++++++++++++--------------------------------------
 1 file changed, 13 insertions(+), 38 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 6c2e007..6e46f2f 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -2787,20 +2787,24 @@ void restore_reserve_on_error(struct hstate *h, struct vm_area_struct *vma,
 /*
  * alloc_and_dissolve_hugetlb_folio - Allocate a new folio and dissolve
  * the old one
- * @h: struct hstate old page belongs to
  * @old_folio: Old folio to dissolve
  * @list: List to isolate the page in case we need to
  * Returns 0 on success, otherwise negated error.
  */
-static int alloc_and_dissolve_hugetlb_folio(struct hstate *h,
-			struct folio *old_folio, struct list_head *list)
+static int alloc_and_dissolve_hugetlb_folio(struct folio *old_folio,
+			struct list_head *list)
 {
-	gfp_t gfp_mask = htlb_alloc_mask(h) | __GFP_THISNODE;
+	gfp_t gfp_mask;
+	struct hstate *h;
 	int nid = folio_nid(old_folio);
 	struct folio *new_folio = NULL;
 	int ret = 0;
 
 retry:
+	/*
+	 * The old_folio might have been dissolved from under our feet, so make sure
+	 * to carefully check the state under the lock.
+	 */
 	spin_lock_irq(&hugetlb_lock);
 	if (!folio_test_hugetlb(old_folio)) {
 		/*
@@ -2829,8 +2833,10 @@ static int alloc_and_dissolve_hugetlb_folio(struct hstate *h,
 		cond_resched();
 		goto retry;
 	} else {
+		h = folio_hstate(old_folio);
 		if (!new_folio) {
 			spin_unlock_irq(&hugetlb_lock);
+			gfp_mask = htlb_alloc_mask(h) | __GFP_THISNODE;
 			new_folio = alloc_buddy_hugetlb_folio(h, gfp_mask, nid,
 							      NULL, NULL);
 			if (!new_folio)
@@ -2874,35 +2880,20 @@ static int alloc_and_dissolve_hugetlb_folio(struct hstate *h,
 
 int isolate_or_dissolve_huge_folio(struct folio *folio, struct list_head *list)
 {
-	struct hstate *h;
 	int ret = -EBUSY;
 
 	/*
-	 * The page might have been dissolved from under our feet, so make sure
-	 * to carefully check the state under the lock.
-	 * Return success when racing as if we dissolved the page ourselves.
-	 */
-	spin_lock_irq(&hugetlb_lock);
-	if (folio_test_hugetlb(folio)) {
-		h = folio_hstate(folio);
-	} else {
-		spin_unlock_irq(&hugetlb_lock);
-		return 0;
-	}
-	spin_unlock_irq(&hugetlb_lock);
-
-	/*
 	 * Fence off gigantic pages as there is a cyclic dependency between
 	 * alloc_contig_range and them. Return -ENOMEM as this has the effect
 	 * of bailing out right away without further retrying.
 	 */
-	if (hstate_is_gigantic(h))
+	if (folio_order(folio) > MAX_PAGE_ORDER)
 		return -ENOMEM;
 
 	if (folio_ref_count(folio) && folio_isolate_hugetlb(folio, list))
 		ret = 0;
 	else if (!folio_ref_count(folio))
-		ret = alloc_and_dissolve_hugetlb_folio(h, folio, list);
+		ret = alloc_and_dissolve_hugetlb_folio(folio, list);
 
 	return ret;
 }
@@ -2916,7 +2907,6 @@ int isolate_or_dissolve_huge_folio(struct folio *folio, struct list_head *list)
  */
 int replace_free_hugepage_folios(unsigned long start_pfn, unsigned long end_pfn)
 {
-	struct hstate *h;
 	struct folio *folio;
 	int ret = 0;
 
@@ -2925,23 +2915,8 @@ int replace_free_hugepage_folios(unsigned long start_pfn, unsigned long end_pfn)
 	while (start_pfn < end_pfn) {
 		folio = pfn_folio(start_pfn);
 
-		/*
-		 * The folio might have been dissolved from under our feet, so make sure
-		 * to carefully check the state under the lock.
-		 */
-		spin_lock_irq(&hugetlb_lock);
-		if (folio_test_hugetlb(folio)) {
-			h = folio_hstate(folio);
-		} else {
-			spin_unlock_irq(&hugetlb_lock);
-			start_pfn++;
-			continue;
-		}
-		spin_unlock_irq(&hugetlb_lock);
-
 		if (!folio_ref_count(folio)) {
-			ret = alloc_and_dissolve_hugetlb_folio(h, folio,
-							       &isolate_list);
+			ret = alloc_and_dissolve_hugetlb_folio(folio, &isolate_list);
 			if (ret)
 				break;
 
-- 
2.7.4

