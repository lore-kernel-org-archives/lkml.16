Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE6B1DA3D
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 12:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750422632; cv=none; b=gvp0TSJehrVMzT4GszZgiH7mNYQapUonI8yd/G5xnbHjCP50WYsi7EMYHgC5K6iS+Q6n93xm25zkqjzqJoNSt2CCN2T/d7lEZqpVFeDkKZswf5pIRR/eL2xa/A29akMzzQnM0rZ9jKbBKB3YnuduV7iWKr2Iu/SOQp2Ce1ZMGTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750422632; c=relaxed/simple;
	bh=S8ywCHIrPv1TFxfhggKzpeG1YWigLuz2M8Wv8Ahtddo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TWRwXsYJgbdyz1bmEYcV+lJIHC8AwhAANJcqrlyckm1z8NJLeh0YfPcWTzqZQqAotuXn016PhwdGtviBE/MNVreLWKyaqt5vDPqmg7KZGq4RhWLjTd4wq2QI35lna+t+xkrlOIOB+35ICYG+zxe+BQbul8UkQyBDX1J2R2vsbnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 665F31F7CF;
	Fri, 20 Jun 2025 12:30:29 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DE45513A99;
	Fri, 20 Jun 2025 12:30:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id eH2VM2RUVWjNKAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Fri, 20 Jun 2025 12:30:28 +0000
From: Oscar Salvador <osalvador@suse.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>,
	Muchun Song <muchun.song@linux.dev>,
	Peter Xu <peterx@redhat.com>,
	Gavin Guo <gavinguo@igalia.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Oscar Salvador <osalvador@suse.de>
Subject: [PATCH v2 3/5] mm,hugetlb: Rename anon_rmap to new_anon_folio and make it boolean
Date: Fri, 20 Jun 2025 14:30:12 +0200
Message-ID: <20250620123014.29748-4-osalvador@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620123014.29748-1-osalvador@suse.de>
References: <20250620123014.29748-1-osalvador@suse.de>
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
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 665F31F7CF
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Score: -4.00

anon_rmap is used to determine whether the new allocated folio is anonymous.
Rename it to something more meaningul like new_anon_folio and make it boolean,
as we use it like that.
While we are at it, drop 'new_pagecache_folio' as 'new_anon_folio' is enough to
check whether we need to restore the consumed reservation.

Signed-off-by: Oscar Salvador <osalvador@suse.de>
---
 mm/hugetlb.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 1a5f713c1e4c..57bb8b2dce21 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -6427,17 +6427,16 @@ static bool hugetlb_pte_stable(struct hstate *h, struct mm_struct *mm, unsigned
 static vm_fault_t hugetlb_no_page(struct address_space *mapping,
 			struct vm_fault *vmf)
 {
+	u32 hash = hugetlb_fault_mutex_hash(mapping, vmf->pgoff);
+	bool new_folio, new_anon_folio = false;
 	struct vm_area_struct *vma = vmf->vma;
 	struct mm_struct *mm = vma->vm_mm;
 	struct hstate *h = hstate_vma(vma);
 	vm_fault_t ret = VM_FAULT_SIGBUS;
-	int anon_rmap = 0;
-	unsigned long size;
+	bool folio_locked = true;
 	struct folio *folio;
+	unsigned long size;
 	pte_t new_pte;
-	bool new_folio, new_pagecache_folio = false;
-	u32 hash = hugetlb_fault_mutex_hash(mapping, vmf->pgoff);
-	bool folio_locked = true;
 
 	/*
 	 * Currently, we are forced to kill the process in the event the
@@ -6518,6 +6517,7 @@ static vm_fault_t hugetlb_no_page(struct address_space *mapping,
 		folio_zero_user(folio, vmf->real_address);
 		__folio_mark_uptodate(folio);
 		new_folio = true;
+		new_anon_folio = !(vma->vm_flags & VM_MAYSHARE);
 
 		if (vma->vm_flags & VM_MAYSHARE) {
 			int err = hugetlb_add_to_page_cache(folio, mapping,
@@ -6536,10 +6536,8 @@ static vm_fault_t hugetlb_no_page(struct address_space *mapping,
 				ret = VM_FAULT_SIGBUS;
 				goto out;
 			}
-			new_pagecache_folio = true;
 		} else {
 			folio_lock(folio);
-			anon_rmap = 1;
 		}
 	} else {
 		/*
@@ -6588,7 +6586,7 @@ static vm_fault_t hugetlb_no_page(struct address_space *mapping,
 	if (!pte_same(huge_ptep_get(mm, vmf->address, vmf->pte), vmf->orig_pte))
 		goto backout;
 
-	if (anon_rmap)
+	if (new_anon_folio)
 		hugetlb_add_new_anon_rmap(folio, vma, vmf->address);
 	else
 		hugetlb_add_file_rmap(folio);
@@ -6604,7 +6602,7 @@ static vm_fault_t hugetlb_no_page(struct address_space *mapping,
 	hugetlb_count_add(pages_per_huge_page(h), mm);
 	if ((vmf->flags & FAULT_FLAG_WRITE) && !(vma->vm_flags & VM_SHARED)) {
 		/* No need to lock file folios. See comment in hugetlb_fault() */
-		if (!anon_rmap) {
+		if (!new_anon_folio) {
 			folio_locked = false;
 			folio_unlock(folio);
 		}
@@ -6640,7 +6638,8 @@ static vm_fault_t hugetlb_no_page(struct address_space *mapping,
 backout:
 	spin_unlock(vmf->ptl);
 backout_unlocked:
-	if (new_folio && !new_pagecache_folio)
+	/* We only need to restore reservations for private mappings */
+	if (new_folio && new_anon_folio)
 		restore_reserve_on_error(h, vma, vmf->address, folio);
 
 	if (folio_locked)
-- 
2.50.0

