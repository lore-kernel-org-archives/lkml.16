Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69B628A41E
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 12:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750422645; cv=none; b=u+p+s7nIInXPikt5emrFh7e4F5hY2G5lzVU6MJyozcu1NdNnrnUjMGiba5VQYvSa8Bu7JzmUpaBw9dJ50/oUx+5gGZ1lueOMlnwxOQ8i3ZjfrD/cVUm3d9ArU4qCHkHilLHvzKkPyQ6iZtEs38XqYXTulQIk1kMwmlLALXK1rDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750422645; c=relaxed/simple;
	bh=4C18bo8F6uv6nuTgpqPUCETw/chARsIy06IarRrNeUU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M2q/Mea/lBmjiNcDC3sf9HAK4YtY5Vcbc88q5yXe1BfwTohGDhvW3C/0YDkpjlnJX6MwUaAQeFeEgBHohQ1eG112WgASv8Qe/2cb+7bu41leFel7Ng+emIeAz7ve41sdBOQX8D5usMO4XiHH77K3kKV5I/idvuH3mZ+zzZ7GEgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TDzkiczE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VF4FnFI/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TDzkiczE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VF4FnFI/; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TDzkiczE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VF4FnFI/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TDzkiczE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VF4FnFI/"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C911221247;
	Fri, 20 Jun 2025 12:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750422628; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6u2+gI+8TX69PvGl2xXRzwHfYerMxuqT3jpTWbxs4io=;
	b=TDzkiczET41mkTCZ8P+9YHuEwGuADw2CzQx/o1hn7ns7w7yMTnNbNVgXif+1m/jDTERJqn
	G3GiLN9f8mKKauSQ8/BTgjwf6NFK0RWMKCBrqm1hDego/dqtEjUK2Veimpi3+uJmnx6gVh
	qwVUnB4gui8K52rX8iqbhigQoZanmyY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750422628;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6u2+gI+8TX69PvGl2xXRzwHfYerMxuqT3jpTWbxs4io=;
	b=VF4FnFI/duTAeAi8flp4qiCCCYV7DqbpWOX4wEkg1rPGe9TofoTw9rJkCllRMjGsTe0Frd
	ZTD2YeS7XkEqFrBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750422628; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6u2+gI+8TX69PvGl2xXRzwHfYerMxuqT3jpTWbxs4io=;
	b=TDzkiczET41mkTCZ8P+9YHuEwGuADw2CzQx/o1hn7ns7w7yMTnNbNVgXif+1m/jDTERJqn
	G3GiLN9f8mKKauSQ8/BTgjwf6NFK0RWMKCBrqm1hDego/dqtEjUK2Veimpi3+uJmnx6gVh
	qwVUnB4gui8K52rX8iqbhigQoZanmyY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750422628;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6u2+gI+8TX69PvGl2xXRzwHfYerMxuqT3jpTWbxs4io=;
	b=VF4FnFI/duTAeAi8flp4qiCCCYV7DqbpWOX4wEkg1rPGe9TofoTw9rJkCllRMjGsTe0Frd
	ZTD2YeS7XkEqFrBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 549D4136BA;
	Fri, 20 Jun 2025 12:30:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GLbyEWRUVWjNKAAAD6G6ig
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
Subject: [PATCH v2 2/5] mm,hugetlb: Sort out folio locking in the faulting path
Date: Fri, 20 Jun 2025 14:30:11 +0200
Message-ID: <20250620123014.29748-3-osalvador@suse.de>
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
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -6.80

Recent conversations showed that there was a misunderstanding about why we
were locking the folio prior to call in hugetlb_wp().
In fact, as soon as we have the folio mapped into the pagetables, we no longer
need to hold it locked, because we know that no concurrent truncation could have
happened.
There is only one case where the folio needs to be locked, and that is when we
are handling an anonymous folio, because hugetlb_wp() will check whether it can
re-use it exclusively for the process that is faulting it in.

So, pass the folio locked to hugetlb_wp() when that is the case.

Suggested-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Oscar Salvador <osalvador@suse.de>
---
 mm/hugetlb.c | 43 +++++++++++++++++++++++++++++++++----------
 1 file changed, 33 insertions(+), 10 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 175edafeec67..1a5f713c1e4c 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -6437,6 +6437,7 @@ static vm_fault_t hugetlb_no_page(struct address_space *mapping,
 	pte_t new_pte;
 	bool new_folio, new_pagecache_folio = false;
 	u32 hash = hugetlb_fault_mutex_hash(mapping, vmf->pgoff);
+	bool folio_locked = true;
 
 	/*
 	 * Currently, we are forced to kill the process in the event the
@@ -6602,6 +6603,11 @@ static vm_fault_t hugetlb_no_page(struct address_space *mapping,
 
 	hugetlb_count_add(pages_per_huge_page(h), mm);
 	if ((vmf->flags & FAULT_FLAG_WRITE) && !(vma->vm_flags & VM_SHARED)) {
+		/* No need to lock file folios. See comment in hugetlb_fault() */
+		if (!anon_rmap) {
+			folio_locked = false;
+			folio_unlock(folio);
+		}
 		/* Optimization, do the COW without a second fault */
 		ret = hugetlb_wp(vmf);
 	}
@@ -6616,7 +6622,8 @@ static vm_fault_t hugetlb_no_page(struct address_space *mapping,
 	if (new_folio)
 		folio_set_hugetlb_migratable(folio);
 
-	folio_unlock(folio);
+	if (folio_locked)
+		folio_unlock(folio);
 out:
 	hugetlb_vma_unlock_read(vma);
 
@@ -6636,7 +6643,8 @@ static vm_fault_t hugetlb_no_page(struct address_space *mapping,
 	if (new_folio && !new_pagecache_folio)
 		restore_reserve_on_error(h, vma, vmf->address, folio);
 
-	folio_unlock(folio);
+	if (folio_locked)
+		folio_unlock(folio);
 	folio_put(folio);
 	goto out;
 }
@@ -6670,7 +6678,7 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
 {
 	vm_fault_t ret;
 	u32 hash;
-	struct folio *folio;
+	struct folio *folio = NULL;
 	struct hstate *h = hstate_vma(vma);
 	struct address_space *mapping;
 	struct vm_fault vmf = {
@@ -6687,6 +6695,7 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
 		 * be hard to debug if called functions make assumptions
 		 */
 	};
+	bool folio_locked = false;
 
 	/*
 	 * Serialize hugepage allocation and instantiation, so that we don't
@@ -6801,13 +6810,24 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
 		/* Fallthrough to CoW */
 	}
 
-	/* hugetlb_wp() requires page locks of pte_page(vmf.orig_pte) */
-	folio = page_folio(pte_page(vmf.orig_pte));
-	folio_lock(folio);
-	folio_get(folio);
-
 	if (flags & (FAULT_FLAG_WRITE|FAULT_FLAG_UNSHARE)) {
 		if (!huge_pte_write(vmf.orig_pte)) {
+			/*
+			 * Anonymous folios need to be lock since hugetlb_wp()
+			 * checks whether we can re-use the folio exclusively
+			 * for us in case we are the only user of it.
+			 */
+			folio = page_folio(pte_page(vmf.orig_pte));
+			folio_get(folio);
+			if (folio_test_anon(folio)) {
+				spin_unlock(vmf.ptl);
+				folio_lock(folio);
+				folio_locked = true;
+				spin_lock(vmf.ptl);
+				if (unlikely(!pte_same(vmf.orig_pte, huge_ptep_get(mm,
+						   vmf.address, vmf.pte))))
+					goto out_put_page;
+			}
 			ret = hugetlb_wp(&vmf);
 			goto out_put_page;
 		} else if (likely(flags & FAULT_FLAG_WRITE)) {
@@ -6819,8 +6839,11 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
 						flags & FAULT_FLAG_WRITE))
 		update_mmu_cache(vma, vmf.address, vmf.pte);
 out_put_page:
-	folio_unlock(folio);
-	folio_put(folio);
+	if (folio) {
+		if (folio_locked)
+			folio_unlock(folio);
+		folio_put(folio);
+	}
 out_ptl:
 	spin_unlock(vmf.ptl);
 out_mutex:
-- 
2.50.0

