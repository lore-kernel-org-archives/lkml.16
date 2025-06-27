Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6585F29B8CE
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 10:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751020167; cv=none; b=BBEhBaWdv/VTdcvi/ZLetXnQYPe2OPQNjMFsMOTae2jVE8dKLo5ZRbqbwQbv2LrAlG+I4crxD9kD53w8Z99PhyPEVUMmHS50JOo9d19NPxm881zi5U1XSoDdPOmyo844rVqh2/9Oivtc2rIVLjmITMs0TtciOVq4VU+1vZd3BBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751020167; c=relaxed/simple;
	bh=tMSZrM567WGrFzyhrwSKI8dZCdOlHInFkR86DKCo15s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L02HgyQfaunU+67iGl4lrnIzy72kiqgwx9Pbb+7sW61Gh6RgrIl5Yh7kOa6l8qkosHDupXFOcFnK4mL75xau51m4JJvPALHmXB/f5n5rl9yWrpysPkYY71vHjWD2WZWxrsjmJXOT3IUEbbGQAirnG4hl0iMhiQn8fAe/ECf50iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qiwJZJ4s; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dN15uj3R; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qiwJZJ4s; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dN15uj3R; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qiwJZJ4s";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dN15uj3R";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qiwJZJ4s";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dN15uj3R"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9FBCB21179;
	Fri, 27 Jun 2025 10:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751020156; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=evbYQwrIEyoGBUi3yWxrK/P56VGnTwRekMGyPPYLQ0g=;
	b=qiwJZJ4sWMmcSOenzHf0FWdaqjM06zZLCXLq/ixq5a5Bd4jTDZoeESblyYJXTcwhVmSBHb
	zgXXzO2c6DYJqkiCM+moSdUjCILUqsWZxDBNeIuTgeu4wTlja3heogQBeuQyOOb3bNgT3n
	0RM/slNyD1GJ0BAtRef9h+9WVTcGXk8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751020156;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=evbYQwrIEyoGBUi3yWxrK/P56VGnTwRekMGyPPYLQ0g=;
	b=dN15uj3R3/olVSArz5UrBVfaq59DnLPe9+T6lSTGP+9aCrJF18kYtaQwp8HiwrCfGdFd2O
	N9x1K9XTZNBtNvCA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=qiwJZJ4s;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=dN15uj3R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751020156; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=evbYQwrIEyoGBUi3yWxrK/P56VGnTwRekMGyPPYLQ0g=;
	b=qiwJZJ4sWMmcSOenzHf0FWdaqjM06zZLCXLq/ixq5a5Bd4jTDZoeESblyYJXTcwhVmSBHb
	zgXXzO2c6DYJqkiCM+moSdUjCILUqsWZxDBNeIuTgeu4wTlja3heogQBeuQyOOb3bNgT3n
	0RM/slNyD1GJ0BAtRef9h+9WVTcGXk8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751020156;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=evbYQwrIEyoGBUi3yWxrK/P56VGnTwRekMGyPPYLQ0g=;
	b=dN15uj3R3/olVSArz5UrBVfaq59DnLPe9+T6lSTGP+9aCrJF18kYtaQwp8HiwrCfGdFd2O
	N9x1K9XTZNBtNvCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 26C3F13786;
	Fri, 27 Jun 2025 10:29:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YLC2BnxyXmgIAgAAD6G6ig
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
Subject: [PATCH v3 2/5] mm,hugetlb: Sort out folio locking in the faulting path
Date: Fri, 27 Jun 2025 12:29:01 +0200
Message-ID: <20250627102904.107202-3-osalvador@suse.de>
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
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 9FBCB21179
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01
X-Spam-Level: 

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
 mm/hugetlb.c | 33 +++++++++++++++++++++++++++------
 1 file changed, 27 insertions(+), 6 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 87f2d8acdc8a..15113345babb 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -6437,6 +6437,7 @@ static vm_fault_t hugetlb_no_page(struct address_space *mapping,
 	pte_t new_pte;
 	bool new_folio, new_pagecache_folio = false;
 	u32 hash = hugetlb_fault_mutex_hash(mapping, vmf->pgoff);
+	bool folio_locked = true;
 
 	/*
 	 * Currently, we are forced to kill the process in the event the
@@ -6602,6 +6603,14 @@ static vm_fault_t hugetlb_no_page(struct address_space *mapping,
 
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
@@ -6616,7 +6625,8 @@ static vm_fault_t hugetlb_no_page(struct address_space *mapping,
 	if (new_folio)
 		folio_set_hugetlb_migratable(folio);
 
-	folio_unlock(folio);
+	if (folio_locked)
+		folio_unlock(folio);
 out:
 	hugetlb_vma_unlock_read(vma);
 
@@ -6803,16 +6813,27 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
 
 	if (flags & (FAULT_FLAG_WRITE|FAULT_FLAG_UNSHARE)) {
 		if (!huge_pte_write(vmf.orig_pte)) {
-			/* hugetlb_wp() requires page locks of pte_page(vmf.orig_pte) */
+			/*
+			 * Anonymous folios need to be lock since hugetlb_wp()
+			 * checks whether we can re-use the folio exclusively
+			 * for us in case we are the only user of it.
+			 */
 			folio = page_folio(pte_page(vmf.orig_pte));
 			folio_get(folio);
+			if (!folio_test_anon(folio))
+				goto lock_unneeded;
+
 			spin_unlock(vmf.ptl);
 			folio_lock(folio);
 			spin_lock(vmf.ptl);
-			if (likely(pte_same(vmf.orig_pte,
-				      huge_ptep_get(mm, vmf.address, vmf.pte))))
-				ret = hugetlb_wp(&vmf);
-			folio_unlock(folio);
+			if (unlikely(!pte_same(vmf.orig_pte, huge_ptep_get(mm,
+					       vmf.address, vmf.pte))))
+				goto unlock_folio;
+lock_unneeded:
+			ret = hugetlb_wp(&vmf);
+unlock_folio:
+			if (folio_test_anon(folio))
+				folio_unlock(folio);
 			folio_put(folio);
 			goto out_ptl;
 		} else if (likely(flags & FAULT_FLAG_WRITE)) {
-- 
2.50.0

