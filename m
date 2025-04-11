Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C246ADDC3
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 13:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744377864; cv=none; b=nCMJDkGVu6Nl9lSsef/jrdHW3i0acSQgMI48kPgD2FXsoQQhat4E49kxwhll0PZnx2oqBELFMYZJLfBlUhrur12B8OzuGGZqSvo7vQWk7JflcWI32rX0Dq4cu9rF86Y3J9ALVXSxxgx2rK7FGX+OtMmrCVesiJfrbYpTxiZE56k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744377864; c=relaxed/simple;
	bh=lYj/Pe1oADwnUjQSd3EWepgFXBHgHSr+s/wlntAbkxg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dmTpJKhBai4Xj9xut3eAvGF8PnbSQnwu4UcoOV8VbqRfJKkIY24s0ltAVrA65P6JaJnZqjrkOX4vL+fwyzsUbq1RKGU0wxdX3jsyxCTPOY4xF+DvP4b3A6j6McFFntVEu5f2sRngyKrRtPPQWYaiVmea+OcTaTft8zdDO/kjU2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ISL5ezpp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FS+2gLcY; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TuEcIBvW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3a1WGECd; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ISL5ezpp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FS+2gLcY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TuEcIBvW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3a1WGECd"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E5EC11F453;
	Fri, 11 Apr 2025 13:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744377855; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=4AMEw1tWZpURru036L+e2j7ZovNefda2/24QrSQM4TU=;
	b=ISL5ezppAjuwjng05fVYTszbIsf/IItvX5srUYRw93FAHy72h5AILSAO/jhQHktE5+YFPJ
	YUwGE58NEiLqh98IpO2kOxnUF9VRlE8Uff/XZtoVcquoaRxA3qn7rHAfOfgsH0oUmKql8B
	0v23fjTHRAVuHl3F0MKb6N2dPGWYifg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744377855;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=4AMEw1tWZpURru036L+e2j7ZovNefda2/24QrSQM4TU=;
	b=FS+2gLcYFUkbEJf/5ayjE23HdLcmwwuGTsAwhDeCrHlcgxvDKdzf+5+GjJJWETbGiCWiVb
	B8RQ6YwgtxDtNYAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744377854; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=4AMEw1tWZpURru036L+e2j7ZovNefda2/24QrSQM4TU=;
	b=TuEcIBvW1b8CdMZgqur/Ycx6N0J21Ru5O73HkCnldRTMHgw8VXNKTgugLblybzo58SWolf
	OVTRfVb+HEvi4hRG2hk18LNpXMRexDg75Ppc+8eXPSdPy520hOPD5II0eJunN5mMy6OA6i
	fBS6kahSXneioirDuRqyPckO3Z5jlsQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744377854;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=4AMEw1tWZpURru036L+e2j7ZovNefda2/24QrSQM4TU=;
	b=3a1WGECdhHO6F4dypJ0m2MAn+N9+hGr4ino+iXpIkYJ14Kl8P5nGBP88+uz0Aq2RX28ipS
	DgQxSkvmLMy05XCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 680F413886;
	Fri, 11 Apr 2025 13:24:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 1lGwFv4X+WcLdQAAD6G6ig
	(envelope-from <osalvador@suse.de>); Fri, 11 Apr 2025 13:24:14 +0000
From: Oscar Salvador <osalvador@suse.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Muchun Song <muchun.song@linux.dev>,
	David Hildenbrand <david@redhat.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Vlastimil Babka <vbabka@suse.cz>,
	Matthew Wilcox <willy@infradead.org>,
	Oscar Salvador <osalvador@suse.de>
Subject: [PATCH] mm,hugetlb: Allocate frozen pages in alloc_buddy_hugetlb_folio
Date: Fri, 11 Apr 2025 15:23:59 +0200
Message-ID: <20250411132359.312708-1-osalvador@suse.de>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email]
X-Spam-Flag: NO
X-Spam-Level: 

alloc_buddy_hugetlb_folio() allocates a rmappable folio, then strips the
rmappable part and freezes it.
We can simplify all that by allocating frozen pages directly.

Suggested-by: Vlastimil Babka <vbabka@suse.cz>
Signed-off-by: Oscar Salvador <osalvador@suse.de>
---
 mm/hugetlb.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index e3e6ac991b9c..83fa2b9f6fc4 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -1950,7 +1950,6 @@ static struct folio *alloc_buddy_hugetlb_folio(struct hstate *h,
 	int order = huge_page_order(h);
 	struct folio *folio;
 	bool alloc_try_hard = true;
-	bool retry = true;
 
 	/*
 	 * By default we always try hard to allocate the folio with
@@ -1965,22 +1964,8 @@ static struct folio *alloc_buddy_hugetlb_folio(struct hstate *h,
 		gfp_mask |= __GFP_RETRY_MAYFAIL;
 	if (nid == NUMA_NO_NODE)
 		nid = numa_mem_id();
-retry:
-	folio = __folio_alloc(gfp_mask, order, nid, nmask);
-	/* Ensure hugetlb folio won't have large_rmappable flag set. */
-	if (folio)
-		folio_clear_large_rmappable(folio);
 
-	if (folio && !folio_ref_freeze(folio, 1)) {
-		folio_put(folio);
-		if (retry) {	/* retry once */
-			retry = false;
-			goto retry;
-		}
-		/* WOW!  twice in a row. */
-		pr_warn("HugeTLB unexpected inflated folio ref count\n");
-		folio = NULL;
-	}
+	folio = (struct folio *)__alloc_frozen_pages(gfp_mask, order, nid, nmask);
 
 	/*
 	 * If we did not specify __GFP_RETRY_MAYFAIL, but still got a
-- 
2.49.0

