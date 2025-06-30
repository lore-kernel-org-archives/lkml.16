Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F9A28C5C1
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 14:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751294541; cv=none; b=R57hrrM3eaKgDcOdbd4ymE6sfY9NZFKO32JyAFPvugzYcXABcNo5czcGqoJ4Q2e9Ql9/FJKumlE7dPgBJWDCGUvSTHqM+18Ei/grZHebFJ4RDmafh5bvbFwW7SPcTxFNpKGdKBwadobuLazPS7fHHEMCeJaad4MImi+Bm2yeNLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751294541; c=relaxed/simple;
	bh=cEDBDTe2bFk8houKUMpD4iH7aUyOLvYuMbNzg7Pzd7s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tvYHrdpo6fPL+Qtzdirtl8KS0coOTxDUf6SzVdejWyHECvvCW7hqfYy0ihHrWxxNUeoE5Gag//DPuyTuP4x09a/P2rwLRmvVK+pH4f77QghUUBEeGWOQ0/vOT1G7GNTr66jic8v6rTmq8/h/wp1xlMVz/h9/KZv3XzAnkz1EN6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZMJScKrT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QtkyIMBV; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZMJScKrT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QtkyIMBV; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZMJScKrT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QtkyIMBV";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZMJScKrT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QtkyIMBV"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3486A1F397;
	Mon, 30 Jun 2025 14:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751294538; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gsLGeQz2/SShAFkpABjfAB43POxq1/nuiPdGozgEwRs=;
	b=ZMJScKrT8yorsK3Vj9zd64X+typK2lYc7GQW8OLO7nYZhPyW2/wD2wi9tGeCXVdarZ2o1u
	PIVIcuoF9nQwXOJgkeevzLaCcrmP9+Nr3cvtxn31ws2l5r15NDkeDkozpggFTWzJUyOl7a
	yZNYpaDQNEHQvHBkZVhB4UvQiUT/XFg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751294538;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gsLGeQz2/SShAFkpABjfAB43POxq1/nuiPdGozgEwRs=;
	b=QtkyIMBVLmCC4OsJ6FIpnFovcR/ThV82z9Wsq+vnqW5os+8C2p5B7/WDbKKVGlBW94ZPCi
	zYlnneRRBv5lDIBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ZMJScKrT;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=QtkyIMBV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751294538; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gsLGeQz2/SShAFkpABjfAB43POxq1/nuiPdGozgEwRs=;
	b=ZMJScKrT8yorsK3Vj9zd64X+typK2lYc7GQW8OLO7nYZhPyW2/wD2wi9tGeCXVdarZ2o1u
	PIVIcuoF9nQwXOJgkeevzLaCcrmP9+Nr3cvtxn31ws2l5r15NDkeDkozpggFTWzJUyOl7a
	yZNYpaDQNEHQvHBkZVhB4UvQiUT/XFg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751294538;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gsLGeQz2/SShAFkpABjfAB43POxq1/nuiPdGozgEwRs=;
	b=QtkyIMBVLmCC4OsJ6FIpnFovcR/ThV82z9Wsq+vnqW5os+8C2p5B7/WDbKKVGlBW94ZPCi
	zYlnneRRBv5lDIBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AFDCD13A24;
	Mon, 30 Jun 2025 14:42:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4M0uKEmiYmjqdAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Mon, 30 Jun 2025 14:42:17 +0000
From: Oscar Salvador <osalvador@suse.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>,
	Muchun Song <muchun.song@linux.dev>,
	Peter Xu <peterx@redhat.com>,
	Gavin Guo <gavinguo@igalia.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Oscar Salvador <osalvador@suse.de>
Subject: [PATCH v4 3/5] mm,hugetlb: rename anon_rmap to new_anon_folio and make it boolean
Date: Mon, 30 Jun 2025 16:42:10 +0200
Message-ID: <20250630144212.156938-4-osalvador@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250630144212.156938-1-osalvador@suse.de>
References: <20250630144212.156938-1-osalvador@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-5.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_RATELIMIT(0.00)[to_ip_from(RLfw9wkb71jz54yo3bnq4aib6i)];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,linux.dev:email]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 3486A1F397
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -5.01

anon_rmap is used to determine whether the new allocated folio is
anonymous.  Rename it to something more meaningul like new_anon_folio and
make it boolean, as we use it like that.

While we are at it, drop 'new_pagecache_folio' as 'new_anon_folio' is
enough to check whether we need to restore the consumed reservation.

Link: https://lkml.kernel.org/r/20250627102904.107202-4-osalvador@suse.de
Signed-off-by: Oscar Salvador <osalvador@suse.de>
Cc: David Hildenbrand <david@redhat.com>
Cc: Gavin Guo <gavinguo@igalia.com>
Cc: Muchun Song <muchun.song@linux.dev>
Cc: Peter Xu <peterx@redhat.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---
 mm/hugetlb.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 31d39e2a0879..67f3c9c16348 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -6424,17 +6424,16 @@ static bool hugetlb_pte_stable(struct hstate *h, struct mm_struct *mm, unsigned
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
@@ -6533,10 +6532,9 @@ static vm_fault_t hugetlb_no_page(struct address_space *mapping,
 				ret = VM_FAULT_SIGBUS;
 				goto out;
 			}
-			new_pagecache_folio = true;
 		} else {
+			new_anon_folio = true;
 			folio_lock(folio);
-			anon_rmap = 1;
 		}
 	} else {
 		/*
@@ -6585,7 +6583,7 @@ static vm_fault_t hugetlb_no_page(struct address_space *mapping,
 	if (!pte_same(huge_ptep_get(mm, vmf->address, vmf->pte), vmf->orig_pte))
 		goto backout;
 
-	if (anon_rmap)
+	if (new_anon_folio)
 		hugetlb_add_new_anon_rmap(folio, vma, vmf->address);
 	else
 		hugetlb_add_file_rmap(folio);
@@ -6604,7 +6602,7 @@ static vm_fault_t hugetlb_no_page(struct address_space *mapping,
 		 * No need to keep file folios locked. See comment in
 		 * hugetlb_fault().
 		 */
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
+	if (new_anon_folio)
 		restore_reserve_on_error(h, vma, vmf->address, folio);
 
 	folio_unlock(folio);
-- 
2.50.0

