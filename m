Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1AA91EDA3A
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 11:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748862154; cv=none; b=k1vTLdV048EXZbpq2+wmH8bLyjICNwgNrmWyFsn59G7YIJxMB29tlqPxMg/AQzMDxVpFV8n/MH0PZc1K4fEwWrwbkTTDWK/zvl5UJAMIGrgD+ZRQybM51ZgA23794kzFPYWLmY0WK3gxkCdF+jOFmj33sn1BuYl9Rf/OPoEATyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748862154; c=relaxed/simple;
	bh=APcqzwsA9o4EBJdncCezmMHiwyDknfk8GwAUzFwFqPY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KqbA1gXG/6UjK2VFcsPdULjR3FM05IG7yMMbCS3hOPwBkHY1zyiIUPss9JQuGgUu0i9PpAViUkIRVE9IW42RngLqa59jkqx+tzD+vX7+ynZKCW+O6KlxaiCMF4AfF4nJ5718DoO5dBPtOET5NNzHuOSGmUQ7YIoeoSXDsQw7Eg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=O/TPJgsh; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=mZEFNmrg; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=OLd6pquk; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=wmwQ15hB; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="O/TPJgsh";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="mZEFNmrg";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="OLd6pquk";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="wmwQ15hB"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CFC1B219EB;
	Mon,  2 Jun 2025 11:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1748862138; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZztYGn3J3Hw8d9RMjSfh9mOTW5hxG+HFPyUVr4o4Ux0=;
	b=O/TPJgshfUfq1fyDdxPU8Hq2bPUX3ek9sFMZ4FBcOXJ2QTeWj8pMfsGbCTIt6JHowuGDYv
	/J/XUwWDuUjlBbqAQd1ZD7OpeLEBxyKV0qurjjwkX4MJAqaldxz96aBdFUv4WvpbvGaMes
	TrkeW/bTqpKbskxbwflbnU8XQl2obYQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1748862138;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZztYGn3J3Hw8d9RMjSfh9mOTW5hxG+HFPyUVr4o4Ux0=;
	b=mZEFNmrgGtn8H93eZ9a5RDjIvBlqh1ZKnv2zyIf+iwRu+DKMsJKlmxMT1s2ZxDpsIrI1Q5
	scg7maOjd/iq17AQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1748862137; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZztYGn3J3Hw8d9RMjSfh9mOTW5hxG+HFPyUVr4o4Ux0=;
	b=OLd6pqukHonKrFnlRtGUf+A9pMdztBM48Ym20EE7O8iczKWlybdZ27zgoxMR4zZrQHbXF+
	oGQzo5yzGHDG/Xns9kn77vwGyYOQuxvz6ILaUwLGtnJfoVI7vGUHcQ2+I3VLQGwnZOe5sE
	hdiuQ11yh2utQ8lK5RWaNSyPgc/z5Po=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1748862137;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZztYGn3J3Hw8d9RMjSfh9mOTW5hxG+HFPyUVr4o4Ux0=;
	b=wmwQ15hBa42uBZfrPFKqZb0eK7nVeiHs3NC91AfoxBMvpXSuoKbWSf9Y1g523gm+Y/tk79
	b/Pj3M76DNweDJBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BA29A13AE1;
	Mon,  2 Jun 2025 11:02:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KCArLbmEPWggHAAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Mon, 02 Jun 2025 11:02:17 +0000
From: Vlastimil Babka <vbabka@suse.cz>
Date: Mon, 02 Jun 2025 13:02:13 +0200
Subject: [PATCH v2 2/2] mm, slab: use frozen pages for large kmalloc
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250602-frozen-pages-for-large-kmalloc-v2-2-84a21f2c3640@suse.cz>
References: <20250602-frozen-pages-for-large-kmalloc-v2-0-84a21f2c3640@suse.cz>
In-Reply-To: <20250602-frozen-pages-for-large-kmalloc-v2-0-84a21f2c3640@suse.cz>
To: Christoph Lameter <cl@linux.com>, David Rientjes <rientjes@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 Roman Gushchin <roman.gushchin@linux.dev>, Harry Yoo <harry.yoo@oracle.com>, 
 Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>
X-Mailer: b4 0.14.2
X-Spamd-Result: default: False [-8.30 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLww46cwtmo61nf1fa4wzihnqu)];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:email,suse.cz:email,suse.cz:mid]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -8.30

Since slab pages are now frozen, it makes sense to have large kmalloc()
objects behave same as small kmalloc(), as the choice between the two is
an implementation detail depending on allocation size.

Notably, increasing refcount on a slab page containing kmalloc() object
is not possible anymore, so it should be consistent for large kmalloc
pages.

Therefore, change large kmalloc to use the frozen pages API.

Because of some unexpected fallout in the slab pages case (see commit
b9c0e49abfca ("mm: decline to manipulate the refcount on a slab page"),
implement the same kind of checks and warnings as part of this change.

Notably, networking code using sendpage_ok() to determine whether the
page refcount can be manipulated in the network stack should continue
behaving correctly. Before this change, the function returns true for
large kmalloc pages and page refcount can be manipulated. After this
change, the function will return false.

Acked-by: Roman Gushchin <roman.gushchin@linux.dev>
Acked-by: Harry Yoo <harry.yoo@oracle.com>
Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
---
 include/linux/mm.h | 4 +++-
 mm/slub.c          | 6 +++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index bf55206935c467f7508e863332063bb15f904a24..d3eb6adf9fa949fbd611470182a03c743b16aac7 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1549,6 +1549,8 @@ static inline void get_page(struct page *page)
 	struct folio *folio = page_folio(page);
 	if (WARN_ON_ONCE(folio_test_slab(folio)))
 		return;
+	if (WARN_ON_ONCE(folio_test_large_kmalloc(folio)))
+		return;
 	folio_get(folio);
 }
 
@@ -1643,7 +1645,7 @@ static inline void put_page(struct page *page)
 {
 	struct folio *folio = page_folio(page);
 
-	if (folio_test_slab(folio))
+	if (folio_test_slab(folio) || folio_test_large_kmalloc(folio))
 		return;
 
 	folio_put(folio);
diff --git a/mm/slub.c b/mm/slub.c
index 11356c701f9f857a2e8cf40bf963ac3abdb5e010..d87015fad2df65629050d9bcd224facd3d2f4033 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -4284,9 +4284,9 @@ static void *___kmalloc_large_node(size_t size, gfp_t flags, int node)
 	flags |= __GFP_COMP;
 
 	if (node == NUMA_NO_NODE)
-		folio = (struct folio *)alloc_pages_noprof(flags, order);
+		folio = (struct folio *)alloc_frozen_pages_noprof(flags, order);
 	else
-		folio = (struct folio *)__alloc_pages_noprof(flags, order, node, NULL);
+		folio = (struct folio *)__alloc_frozen_pages_noprof(flags, order, node, NULL);
 
 	if (folio) {
 		ptr = folio_address(folio);
@@ -4783,7 +4783,7 @@ static void free_large_kmalloc(struct folio *folio, void *object)
 	lruvec_stat_mod_folio(folio, NR_SLAB_UNRECLAIMABLE_B,
 			      -(PAGE_SIZE << order));
 	__folio_clear_large_kmalloc(folio);
-	folio_put(folio);
+	free_frozen_pages(&folio->page, order);
 }
 
 /*

-- 
2.49.0

