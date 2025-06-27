Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3A62BD025
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 10:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751020174; cv=none; b=NkehR12wiD53NgBKtnU/toTzHbjT83F3Xo6lJTrWGR+UwSVEf8hriWtrL8Dvexjhg6ICvkmVgWvREm6ftwdRBBxPzDnTj8k9nvXOCxF2P9TVyLmN+Cs9dFInfm2GmbQ2SbxYClWzdYvm19rj/OxXa/PORjVH9UJ1kDPOJvptbI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751020174; c=relaxed/simple;
	bh=RCT98MJcqLy0wcaKO6p8gPLlDe7Vs074FWtfs+//G7k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dt2jqbHk+Wvshn++6Btc4wnmNvva2Dd+U0SGdpeQl+coWJoYyEFC2ao9df/N86OMGKccubkVVFOy45pUTTyqKxFzC42E3bYJdGC2KibYFtcYyBvszsG+BbPQZdXBIxYIqKOGDdWgxeVuQlKYv621790H1NHa4QkWnBBgz3IWcsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0d8TrslY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3UGXTVzu; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0d8TrslY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3UGXTVzu; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0d8TrslY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3UGXTVzu";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0d8TrslY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3UGXTVzu"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 39E4F21185;
	Fri, 27 Jun 2025 10:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751020157; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bq9/EYkAwYHFk8gdnXIfLxkomiePmXJvIrEAfONGHY8=;
	b=0d8TrslYkmmCf0STyidG7hJQg4vCw9sjE+xqYEd3ATPU/OG8OkIm2WmeuIvWYT5ex9lajL
	+/FsIMstxncNk4/yGWfp4BQYNb4O8B9PyNOyeEIWU3ho2lpuu3hryKo7aEbNNnT4dpTMUa
	529Ea97vJVRF7eRA2V2sw5rBqx/9AiM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751020157;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bq9/EYkAwYHFk8gdnXIfLxkomiePmXJvIrEAfONGHY8=;
	b=3UGXTVzuc9vmjmW+IYe1gALsOuUWEoOTiCsYmTLYvLqORrccCIeZjl9wag/nM352BS6R3C
	HH4anUCWN4mwrvDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751020157; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bq9/EYkAwYHFk8gdnXIfLxkomiePmXJvIrEAfONGHY8=;
	b=0d8TrslYkmmCf0STyidG7hJQg4vCw9sjE+xqYEd3ATPU/OG8OkIm2WmeuIvWYT5ex9lajL
	+/FsIMstxncNk4/yGWfp4BQYNb4O8B9PyNOyeEIWU3ho2lpuu3hryKo7aEbNNnT4dpTMUa
	529Ea97vJVRF7eRA2V2sw5rBqx/9AiM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751020157;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bq9/EYkAwYHFk8gdnXIfLxkomiePmXJvIrEAfONGHY8=;
	b=3UGXTVzuc9vmjmW+IYe1gALsOuUWEoOTiCsYmTLYvLqORrccCIeZjl9wag/nM352BS6R3C
	HH4anUCWN4mwrvDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B1A0613A8E;
	Fri, 27 Jun 2025 10:29:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SIGuKHxyXmgIAgAAD6G6ig
	(envelope-from <osalvador@suse.de>); Fri, 27 Jun 2025 10:29:16 +0000
From: Oscar Salvador <osalvador@suse.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>,
	Muchun Song <muchun.song@linux.dev>,
	Peter Xu <peterx@redhat.com>,
	Gavin Guo <gavinguo@igalia.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Oscar Salvador <osalvador@suse.de>
Subject: [PATCH v3 3/5] mm,hugetlb: Rename anon_rmap to new_anon_folio and make it boolean
Date: Fri, 27 Jun 2025 12:29:02 +0200
Message-ID: <20250627102904.107202-4-osalvador@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250627102904.107202-1-osalvador@suse.de>
References: <20250627102904.107202-1-osalvador@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
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
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.80

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
index 15113345babb..b110394d8d6e 100644
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
@@ -6536,10 +6535,9 @@ static vm_fault_t hugetlb_no_page(struct address_space *mapping,
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
@@ -6588,7 +6586,7 @@ static vm_fault_t hugetlb_no_page(struct address_space *mapping,
 	if (!pte_same(huge_ptep_get(mm, vmf->address, vmf->pte), vmf->orig_pte))
 		goto backout;
 
-	if (anon_rmap)
+	if (new_anon_folio)
 		hugetlb_add_new_anon_rmap(folio, vma, vmf->address);
 	else
 		hugetlb_add_file_rmap(folio);
@@ -6607,7 +6605,7 @@ static vm_fault_t hugetlb_no_page(struct address_space *mapping,
 		 * No need to keep file folios locked. See comment in
 		 * hugetlb_fault().
 		 */
-		if (!anon_rmap) {
+		if (!new_anon_folio) {
 			folio_locked = false;
 			folio_unlock(folio);
 		}
@@ -6643,7 +6641,8 @@ static vm_fault_t hugetlb_no_page(struct address_space *mapping,
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

