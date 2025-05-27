Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.9])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16A9E18A6AE
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 03:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748317047; cv=none; b=j01NBUetclP11ieif/Mklul/nOuWp5AJskhqtkx374t+6bLvxtStQah1duN/UJJNBjYkmGXhjd9fZeT176havtWtpfeiNU75z4eN6SdFb2KG9rrczu/N8FD4Xfz4j4vbmBwV7zDVPTwjoH1AJ4Rq4o18Uv59da2tltSVDqJ2Prw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748317047; c=relaxed/simple;
	bh=CBnlgrzcoC8Po6QdDIdL+GBZN5CfX7ifcx66OpyvJlo=;
	h=From:To:Cc:Subject:Date:Message-Id; b=WfktIeECqvvjSGH7+FOYvRgdybj78dt71dFsoXhcMGnDjkm1FtpZNLFzifBHNkWnH6dTHTgy9h3IafLHzDV3ivkTfHIcFxJDIPqbkSiSu4KccFTitb0onXuRpfyCoCMDBXnRHBsHPUuYpa/c9KBni24q7/FWI0qEHFErhPsQv1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=SvuZOpOV; arc=none smtp.client-ip=220.197.31.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="SvuZOpOV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-Id; bh=OxLrHwRKd6VmF2k
	ibj1apKILaD+MlHJ+P625Hvp6Sc0=; b=SvuZOpOVsEQ8//kWcUaNf4TU/T4nYdm
	kQ6FVkrknEe2Rj2MKcbEa9v2zCHpl01YLYfbgVKf5PUowtS7GIjyTwzuLaxpK0gZ
	fNZZKN/UZKMInWMzE5cT2BijNYHfTSchldy//0Uf9IW8W3ASrhEx6y5quVR2YpFz
	eNUAkrw6Ay0s=
Received: from hg-OptiPlex-7040.hygon.cn (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wDnz2RTMzVoDBO5Ag--.12961S2;
	Tue, 27 May 2025 11:36:52 +0800 (CST)
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
Subject: [PATCH V2] mm/hugetlb: remove unnecessary holding of hugetlb_lock
Date: Tue, 27 May 2025 11:36:50 +0800
Message-Id: <1748317010-16272-1-git-send-email-yangge1116@126.com>
X-Mailer: git-send-email 2.7.4
X-CM-TRANSID:_____wDnz2RTMzVoDBO5Ag--.12961S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3Ary5Xw18Kr48GFykuw45Jrb_yoW7XFW8pF
	W3GrsxtrWkXa4Dur4xAr4kGrn8K34qqryjyFWxKrW3ZF43tw1UKFnrZw18XayrCr9rJFWf
	ZFWjqFWv9F4jy3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRoKZXUUUUU=
X-CM-SenderInfo: 51dqwwjhrrila6rslhhfrp/1tbiOhZaG2g1Me8rCgAAsP
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

From: Ge Yang <yangge1116@126.com>

In the isolate_or_dissolve_huge_folio() function, after acquiring the
hugetlb_lock, it is only for the purpose of obtaining the correct hstate,
which is then passed to the alloc_and_dissolve_hugetlb_folio() function.

The alloc_and_dissolve_hugetlb_folio() function itself also acquires the
hugetlb_lock. We can have the alloc_and_dissolve_hugetlb_folio() function
obtain the hstate by itself, so that the isolate_or_dissolve_huge_folio()
function no longer needs to acquire the hugetlb_lock. In addition, we keep
the folio_test_hugetlb() check within the isolate_or_dissolve_huge_folio()
function. By doing so, we can avoid disrupting the normal path by vainly
holding the hugetlb_lock.

The replace_free_hugepage_folios() function has the same issue, and we
should address it as well.

Suggested-by: Oscar Salvador <osalvador@suse.de>
Signed-off-by: Ge Yang <yangge1116@126.com>
---

V2:
- Add early folio_test_hugetlb() suggested by David
- Change the subject from "mm/hugetlb: remove redundant folio_test_hugetlb" to "mm/hugetlb: reduce unnecessary holding of hugetlb_lock"

 mm/hugetlb.c | 54 +++++++++++++++++-------------------------------------
 1 file changed, 17 insertions(+), 37 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index f0b1d53..b4bc2bd 100644
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
@@ -2874,35 +2880,24 @@ static int alloc_and_dissolve_hugetlb_folio(struct hstate *h,
 
 int isolate_or_dissolve_huge_folio(struct folio *folio, struct list_head *list)
 {
-	struct hstate *h;
 	int ret = -EBUSY;
 
-	/*
-	 * The page might have been dissolved from under our feet, so make sure
-	 * to carefully check the state under the lock.
-	 * Return success when racing as if we dissolved the page ourselves.
-	 */
-	spin_lock_irq(&hugetlb_lock);
-	if (folio_test_hugetlb(folio)) {
-		h = folio_hstate(folio);
-	} else {
-		spin_unlock_irq(&hugetlb_lock);
+	/* Not to disrupt normal path by vainly holding hugetlb_lock */
+	if (!folio_test_hugetlb(folio))
 		return 0;
-	}
-	spin_unlock_irq(&hugetlb_lock);
 
 	/*
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
@@ -2916,7 +2911,6 @@ int isolate_or_dissolve_huge_folio(struct folio *folio, struct list_head *list)
  */
 int replace_free_hugepage_folios(unsigned long start_pfn, unsigned long end_pfn)
 {
-	struct hstate *h;
 	struct folio *folio;
 	int ret = 0;
 
@@ -2925,23 +2919,9 @@ int replace_free_hugepage_folios(unsigned long start_pfn, unsigned long end_pfn)
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
-		if (!folio_ref_count(folio)) {
-			ret = alloc_and_dissolve_hugetlb_folio(h, folio,
-							       &isolate_list);
+		/* Not to disrupt normal path by vainly holding hugetlb_lock */
+		if (folio_test_hugetlb(folio) && !folio_ref_count(folio)) {
+			ret = alloc_and_dissolve_hugetlb_folio(folio, &isolate_list);
 			if (ret)
 				break;
 
-- 
2.7.4

