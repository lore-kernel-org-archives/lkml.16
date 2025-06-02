Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D213322B8CF
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 14:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748873792; cv=none; b=KHBsI2JfuSPUPwSmv5wOuLz3QqYvj6DpBdMTFOHIJ9zbZpbMwJy1E2uDYoTNXMz64n8GBRm4vHrsm4cnTCVI4RP6GT0GSaNRbM/HOp6cK7PHhwxSh6n3a/x2kSAKDIx/NrEirFwo7O12GBvxOQwSoeS7eGZwkXze7POxcPY3m6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748873792; c=relaxed/simple;
	bh=u/3v63NaQGUFwOO4PFoAomZMFaW3eVi9NMDzljrXJrs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dk3T2r2wfB39uxG+PCZGnFoC0qF7BxP7s74dTYrNpPrsaO49AS8o0AP4AeHI5JJZCm5Jz6EyuCAUl2dsWFwUFQcJtohHjOrDEkrz/CkuZh2mdEmVyom1sz/lytKs3lqB7qU63brLV2qJcfxJQ+NWfvICi/FZbCuU7tSTDmEQnc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 071AA1F799;
	Mon,  2 Jun 2025 14:16:24 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7856613AE1;
	Mon,  2 Jun 2025 14:16:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sHqmGjeyPWhqVAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Mon, 02 Jun 2025 14:16:23 +0000
From: Oscar Salvador <osalvador@suse.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Muchun Song <muchun.song@linux.dev>,
	David Hildenbrand <david@redhat.com>,
	James Houghton <jthoughton@google.com>,
	Peter Xu <peterx@redhat.com>,
	Gavin Guo <gavinguo@igalia.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Oscar Salvador <osalvador@suse.de>
Subject: [RFC PATCH 2/3] mm, hugetlb: Update comments in hugetlb_fault
Date: Mon,  2 Jun 2025 16:16:09 +0200
Message-ID: <20250602141610.173698-3-osalvador@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250602141610.173698-1-osalvador@suse.de>
References: <20250602141610.173698-1-osalvador@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[];
	ASN(0.00)[asn:9498, ipnet:::/1, country:IN]
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 071AA1F799
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Score: -4.00

There are some comments in the hugetlb faulting path that are not
holding anymore because the code has changed.
Most promiment is this one:

 /*
  * vmf.orig_pte could be a migration/hwpoison vmf.orig_pte at this
  * point, so this check prevents the kernel from going below assuming
  * that we have an active hugepage in pagecache. This goto expects
  * the 2nd page fault, and is_hugetlb_entry_(migration|hwpoisoned)
  * check will properly handle it.
  */

This was written because back in the day we used to do:

 hugetlb_fault
  ptep = huge_pte_offset(...)
  if (ptep) {
    entry = huge_ptep_get(ptep)
    if (unlikely(is_hugetlb_entry_migration(entry))
        ...
    else if (unlikely(is_hugetlb_entry_hwpoisoned(entry)))
        ...

  ...
  ...

 /*
  * entry could be a migration/hwpoison entry at this point, so this
  * check prevents the kernel from going below assuming that we have
  * a active hugepage in pagecache. This goto expects the 2nd page fault,
  * and is_hugetlb_entry_(migration|hwpoisoned) check will properly
  * handle it.
  */
 if (!pte_present(entry))
         goto out_mutex;
 ...

The code was designed to check for hwpoisoned/migration entries upfront,
and then bail out if further down the pte was not present anymore,
relying on taking the second fault so the code from the beginning would
handle it this time for real.

This has changed, so this comment does not hold.
Also, mention in hugetlb_fault() that besides allocation and instantiation,
the mutex also serializes against truncation.

Signed-off-by: Oscar Salvador <osalvador@suse.de>
---
 mm/hugetlb.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index f7bef660ef94..6ef90958839f 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -6715,9 +6715,8 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
 	};
 
 	/*
-	 * Serialize hugepage allocation and instantiation, so that we don't
-	 * get spurious allocation failures if two CPUs race to instantiate
-	 * the same page in the page cache.
+	 * hugetlb_fault_mutex_hash serializes allocation, instantiation and
+	 * truncation.
 	 */
 	mapping = vma->vm_file->f_mapping;
 	hash = hugetlb_fault_mutex_hash(mapping, vmf.pgoff);
@@ -6765,11 +6764,8 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
 	ret = 0;
 
 	/*
-	 * vmf.orig_pte could be a migration/hwpoison vmf.orig_pte at this
-	 * point, so this check prevents the kernel from going below assuming
-	 * that we have an active hugepage in pagecache. This goto expects
-	 * the 2nd page fault, and is_hugetlb_entry_(migration|hwpoisoned)
-	 * check will properly handle it.
+	 * If it is not present, it means we are dealing either with a migration
+	 * or hwpoisoned entry.
 	 */
 	if (!pte_present(vmf.orig_pte)) {
 		if (unlikely(is_hugetlb_entry_migration(vmf.orig_pte))) {
@@ -6793,8 +6789,7 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
 	 * If we are going to COW/unshare the mapping later, we examine the
 	 * pending reservations for this page now. This will ensure that any
 	 * allocations necessary to record that reservation occur outside the
-	 * spinlock. Also lookup the pagecache page now as it is used to
-	 * determine if a reservation has been consumed.
+	 * spinlock.
 	 */
 	if ((flags & (FAULT_FLAG_WRITE|FAULT_FLAG_UNSHARE)) &&
 	    !(vma->vm_flags & VM_MAYSHARE) && !huge_pte_write(vmf.orig_pte)) {
-- 
2.49.0

