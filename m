Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C4828DF3A
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 14:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751294554; cv=none; b=qWyxEePiG6+ieRFyInWknxgfAqHVIV+xxV4IapCwVDCUjL0PzN+mOT3XCvenV19iDK6g46mseju04yVk4KPKw0R8gu31/eN46OUCYn+jFBMN1nY9aJ99bu5UXoz8MHolFIUaqEN4tRNV+N1f4mPx37tVTjXZqKloNxwVWlgLZLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751294554; c=relaxed/simple;
	bh=3nimWEP4TU2hazlO9B3yM6uHoocXP+e13BqLuWR+t6U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BisDToRzKC4Kf+2lu/Wr/0KYkSprkoExsYiGFUXTdc3T4XArn2HnUr/H1krTP8H+PvgEfbR22PHKv8AU0yn65aCdsLOvpHPLM97u12FhMEbuJAcbApXDcVrEbdm1QYelqTQQG+7TScf15yFlMGFttVaUt13Z/3dh1K/r3J/tze4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vT5nk7U2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pGILP/Nw; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vT5nk7U2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pGILP/Nw; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vT5nk7U2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pGILP/Nw";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vT5nk7U2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pGILP/Nw"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9D7F021166;
	Mon, 30 Jun 2025 14:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751294537; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2K/Grp0pf+YGAmhL32U2P7mtv8DTunlS/1iRZeZXLDU=;
	b=vT5nk7U2x5sYGl1gHXXtdT1TZ/nzdJ/nN9pctW1RRt3saa9YMiBLhcPSNg2xCgcFGm7QL3
	Cjv36Jg1cL/tyKTZlwQTjbVdFJ6zUNcTlj6aV0QL14TnppRVC5q4/tSFPbpy8aaL5NWSWB
	i69yoxhkaqV2NFH/pL/HugKoHzA/ER0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751294537;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2K/Grp0pf+YGAmhL32U2P7mtv8DTunlS/1iRZeZXLDU=;
	b=pGILP/NwSeRJXhT9aK+GyG6qi3045fMfm8doOLh8QXNYLyYVDRM1rWFJpcsJsgGv4QtKrI
	cdJxjiFxsCJHFpBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=vT5nk7U2;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="pGILP/Nw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751294537; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2K/Grp0pf+YGAmhL32U2P7mtv8DTunlS/1iRZeZXLDU=;
	b=vT5nk7U2x5sYGl1gHXXtdT1TZ/nzdJ/nN9pctW1RRt3saa9YMiBLhcPSNg2xCgcFGm7QL3
	Cjv36Jg1cL/tyKTZlwQTjbVdFJ6zUNcTlj6aV0QL14TnppRVC5q4/tSFPbpy8aaL5NWSWB
	i69yoxhkaqV2NFH/pL/HugKoHzA/ER0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751294537;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2K/Grp0pf+YGAmhL32U2P7mtv8DTunlS/1iRZeZXLDU=;
	b=pGILP/NwSeRJXhT9aK+GyG6qi3045fMfm8doOLh8QXNYLyYVDRM1rWFJpcsJsgGv4QtKrI
	cdJxjiFxsCJHFpBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1E6F41399F;
	Mon, 30 Jun 2025 14:42:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MJCfBEmiYmjqdAAAD6G6ig
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
Subject: [PATCH v4 2/5] mm,hugetlb: sort out folio locking in the faulting path
Date: Mon, 30 Jun 2025 16:42:09 +0200
Message-ID: <20250630144212.156938-3-osalvador@suse.de>
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
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,linux.dev:email];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 9D7F021166
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -5.01

Recent conversations showed that there was a misunderstanding about why we
were locking the folio prior to call in hugetlb_wp().  In fact, as soon as
we have the folio mapped into the pagetables, we no longer need to hold it
locked, because we know that no concurrent truncation could have happened.

There is only one case where the folio needs to be locked, and that is
when we are handling an anonymous folio, because hugetlb_wp() will check
whether it can re-use it exclusively for the process that is faulting it
in.

So, pass the folio locked to hugetlb_wp() when that is the case.

Link: https://lkml.kernel.org/r/20250627102904.107202-3-osalvador@suse.de
Signed-off-by: Oscar Salvador <osalvador@suse.de>
Suggested-by: David Hildenbrand <david@redhat.com>
Cc: Gavin Guo <gavinguo@igalia.com>
Cc: Muchun Song <muchun.song@linux.dev>
Cc: Peter Xu <peterx@redhat.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---
 mm/hugetlb.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 14274a02dd14..31d39e2a0879 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -6434,6 +6434,7 @@ static vm_fault_t hugetlb_no_page(struct address_space *mapping,
 	pte_t new_pte;
 	bool new_folio, new_pagecache_folio = false;
 	u32 hash = hugetlb_fault_mutex_hash(mapping, vmf->pgoff);
+	bool folio_locked = true;
 
 	/*
 	 * Currently, we are forced to kill the process in the event the
@@ -6599,6 +6600,14 @@ static vm_fault_t hugetlb_no_page(struct address_space *mapping,
 
 	hugetlb_count_add(pages_per_huge_page(h), mm);
 	if ((vmf->flags & FAULT_FLAG_WRITE) && !(vma->vm_flags & VM_SHARED)) {
+		/*
+		 * No need to keep file folios locked. See comment in
+		 * hugetlb_fault().
+		 */
+		if (!anon_rmap) {
+			folio_locked = false;
+			folio_unlock(folio);
+		}
 		/* Optimization, do the COW without a second fault */
 		ret = hugetlb_wp(vmf);
 	}
@@ -6613,7 +6622,8 @@ static vm_fault_t hugetlb_no_page(struct address_space *mapping,
 	if (new_folio)
 		folio_set_hugetlb_migratable(folio);
 
-	folio_unlock(folio);
+	if (folio_locked)
+		folio_unlock(folio);
 out:
 	hugetlb_vma_unlock_read(vma);
 
@@ -6801,15 +6811,20 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
 
 	if (flags & (FAULT_FLAG_WRITE|FAULT_FLAG_UNSHARE)) {
 		if (!huge_pte_write(vmf.orig_pte)) {
-			/* hugetlb_wp() requires page locks of pte_page(vmf.orig_pte) */
+			/*
+			 * Anonymous folios need to be lock since hugetlb_wp()
+			 * checks whether we can re-use the folio exclusively
+			 * for us in case we are the only user of it.
+			 */
 			folio = page_folio(pte_page(vmf.orig_pte));
-			if (!folio_trylock(folio)) {
+			if (folio_test_anon(folio) && !folio_trylock(folio)) {
 				need_wait_lock = true;
 				goto out_ptl;
 			}
 			folio_get(folio);
 			ret = hugetlb_wp(&vmf);
-			folio_unlock(folio);
+			if (folio_test_anon(folio))
+				folio_unlock(folio);
 			folio_put(folio);
 			goto out_ptl;
 		} else if (likely(flags & FAULT_FLAG_WRITE)) {
-- 
2.50.0

