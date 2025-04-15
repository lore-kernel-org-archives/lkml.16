Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A930F28A1DE
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 12:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744719656; cv=none; b=jlXLaj27+g0PLi8Z73zw4qrMb0xJp6C6IspQ2S953UGCcwciclAEQiej90F6KY1y9hohIkIw2qFkZqHqSNRV3yIHa5E3+OHux9Wb7Ep79Hq7GwoBoeqA/vUqLj7dMGtdoJJBtrgSvQtSMRLCFYGvwDdw3O0euBpSPahnWvWEr4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744719656; c=relaxed/simple;
	bh=XjFSlnP3mZ7ucy8HCfasCICWH2BlmsJJDcC4GxYYFw4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uZduTLqOeDpD4x3L2OwE44zJpJaj0nzUZAxgfkHAs0xpqtNtTX7dyebT+LsBimeHJjm/cuUicKCTYODR5Wfc3TWJkKa00WSHyKwe2jNHcT6xYvKZUTXCIBJ4HNwG0xslqzu8bC3nxbgVkEPtnsEfTFHeJf1nKZL5AnAERezyxmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Lj1x0WL3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yZcjFgy/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Lj1x0WL3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yZcjFgy/; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Lj1x0WL3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yZcjFgy/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Lj1x0WL3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yZcjFgy/"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AE76021164;
	Tue, 15 Apr 2025 12:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744719652; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ScWbKkMiyTdcG4zwvDzcd9drTM2WJl0dxMBhM6X1TEY=;
	b=Lj1x0WL397POmKjNMVxqV1yjeYn6RWA1iR4Zbi28457S7S/9WQnWmgbwsSyFbnAOfmdK+H
	J7rE8h8kgAOyKcyM44nFIpyURa5wUF4kePeLGK9LlCip0U7x8dis+PGsuy3Z7RiC30h2rw
	gRfVzOr2EGLQHa/kvep8bDKSYWAscXI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744719652;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ScWbKkMiyTdcG4zwvDzcd9drTM2WJl0dxMBhM6X1TEY=;
	b=yZcjFgy/JoX8SFAHCxNf0a4HDHKNboFDzAMubaFgp3j63abYa6E2cYuDn+CW+lRVc57k5I
	pxdTLmM2MQjJUcAA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Lj1x0WL3;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="yZcjFgy/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744719652; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ScWbKkMiyTdcG4zwvDzcd9drTM2WJl0dxMBhM6X1TEY=;
	b=Lj1x0WL397POmKjNMVxqV1yjeYn6RWA1iR4Zbi28457S7S/9WQnWmgbwsSyFbnAOfmdK+H
	J7rE8h8kgAOyKcyM44nFIpyURa5wUF4kePeLGK9LlCip0U7x8dis+PGsuy3Z7RiC30h2rw
	gRfVzOr2EGLQHa/kvep8bDKSYWAscXI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744719652;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ScWbKkMiyTdcG4zwvDzcd9drTM2WJl0dxMBhM6X1TEY=;
	b=yZcjFgy/JoX8SFAHCxNf0a4HDHKNboFDzAMubaFgp3j63abYa6E2cYuDn+CW+lRVc57k5I
	pxdTLmM2MQjJUcAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4411B139A1;
	Tue, 15 Apr 2025 12:20:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id BRnvDSRP/mecEAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Tue, 15 Apr 2025 12:20:52 +0000
From: Oscar Salvador <osalvador@suse.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Muchun Song <muchun.song@linux.dev>,
	David Hildenbrand <david@redhat.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Vlastimil Babka <vbabka@suse.cz>,
	Oscar Salvador <osalvador@suse.de>
Subject: [PATCH] mm, hugetlb: Avoid passing a null nodemask when there is mbind policy
Date: Tue, 15 Apr 2025 14:15:03 +0200
Message-ID: <20250415121503.376811-1-osalvador@suse.de>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: AE76021164
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

Before trying to allocate a page, gather_surplus_pages() sets up a nodemask
for the nodes we can allocate from, but instead of passing the nodemask
down the road to the page allocator, it iterates over the nodes within that
nodemask right there, meaning that the page allocator will receive a preferred_nid
and a null nodemask.

This is a problem when using a memory policy, because it might be that
the page allocator ends up using a node as a fallback which is not
represented in the policy.

Avoid that by passing the nodemask directly to the page allocator, so it can
filter out fallback nodes that are not part of the nodemask.

Signed-off-by: Oscar Salvador <osalvador@suse.de>
---
 mm/hugetlb.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index ccc4f08f8481..5e1cba0f835f 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -2419,7 +2419,6 @@ static int gather_surplus_pages(struct hstate *h, long delta)
 	long i;
 	long needed, allocated;
 	bool alloc_ok = true;
-	int node;
 	nodemask_t *mbind_nodemask, alloc_nodemask;
 
 	mbind_nodemask = policy_mbind_nodemask(htlb_alloc_mask(h));
@@ -2443,21 +2442,12 @@ static int gather_surplus_pages(struct hstate *h, long delta)
 	for (i = 0; i < needed; i++) {
 		folio = NULL;
 
-		/* Prioritize current node */
-		if (node_isset(numa_mem_id(), alloc_nodemask))
-			folio = alloc_surplus_hugetlb_folio(h, htlb_alloc_mask(h),
-					numa_mem_id(), NULL);
-
-		if (!folio) {
-			for_each_node_mask(node, alloc_nodemask) {
-				if (node == numa_mem_id())
-					continue;
-				folio = alloc_surplus_hugetlb_folio(h, htlb_alloc_mask(h),
-						node, NULL);
-				if (folio)
-					break;
-			}
-		}
+		/*
+		 * It is okay to use NUMA_NO_NODE because we use numa_mem_id()
+		 * down the road to pick the current node if that is the case.
+		 */
+		folio = alloc_surplus_hugetlb_folio(h, htlb_alloc_mask(h),
+						    NUMA_NO_NODE, &alloc_nodemask);
 		if (!folio) {
 			alloc_ok = false;
 			break;
-- 
2.49.0

