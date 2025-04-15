Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02372957CD
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 11:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744715955; cv=none; b=TLDJBf65PJQSj7Qon6ibNgm1zRYKPdBW+tLpNMWQ5auYwZVwOdEgvqXPPeeZBz3MS9yIlLCBClin7XR60l4dZPqO0ybXpO27840P4nYMoSHsC2rq8E5LjAuMiQK7aKdLkiofSLxTLIIiIH1E65XxwtcvyhVOjT4xufp1DnNm2zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744715955; c=relaxed/simple;
	bh=o88/OolMElgWSR8SJDk87YXyFNQ8PpMtws8gwn/nr0I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E0izeprd0IdykXGbCd4ftX/+yciMq4rxqBduVx85XZBryvKH/65Ep2zhfv0ZkXFtACDNjl9wILsQJ2HHHmvu9cfU7azCUk8xhclzSWtyZtWa03BG5ygZ4TNBxN3Hr/5dQfCX8nGiKK+gGP17HBLxtlv7JhDL6ns/UQDTMSkRb8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LGVWtH98; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=febXkoSZ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LGVWtH98; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=febXkoSZ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LGVWtH98";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="febXkoSZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LGVWtH98";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="febXkoSZ"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DDE931F385;
	Tue, 15 Apr 2025 11:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744715951; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=2tkYgBN93De44ZUzQ+u2SMXn56k/+Th3v9B5mugI918=;
	b=LGVWtH989xPiwP8zqKoBX3bYue6AZmt3bqCzdRB/dSU3pIlIKYnSQZK63L/CuPgDjgOVpv
	gUK58QjZqRjUuWcS2+OTfVBiL0wih43w//6Cue30f7FlFaUqWGhWx4QnDLK3hyAkGdq0sw
	XW7QXiouBwzSTFrzwilRea+XcOfb5Do=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744715951;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=2tkYgBN93De44ZUzQ+u2SMXn56k/+Th3v9B5mugI918=;
	b=febXkoSZ+3CTR0yy0FFWj5hJ/EHVkLUE/YQXJwalZx72TGin1+mlpqdE/38g3THbEmMPdX
	nOv8yqgAsJwbL3BA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=LGVWtH98;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=febXkoSZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744715951; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=2tkYgBN93De44ZUzQ+u2SMXn56k/+Th3v9B5mugI918=;
	b=LGVWtH989xPiwP8zqKoBX3bYue6AZmt3bqCzdRB/dSU3pIlIKYnSQZK63L/CuPgDjgOVpv
	gUK58QjZqRjUuWcS2+OTfVBiL0wih43w//6Cue30f7FlFaUqWGhWx4QnDLK3hyAkGdq0sw
	XW7QXiouBwzSTFrzwilRea+XcOfb5Do=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744715951;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=2tkYgBN93De44ZUzQ+u2SMXn56k/+Th3v9B5mugI918=;
	b=febXkoSZ+3CTR0yy0FFWj5hJ/EHVkLUE/YQXJwalZx72TGin1+mlpqdE/38g3THbEmMPdX
	nOv8yqgAsJwbL3BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7FCAE137A5;
	Tue, 15 Apr 2025 11:19:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id vVx2HK9A/mdvegAAD6G6ig
	(envelope-from <osalvador@suse.de>); Tue, 15 Apr 2025 11:19:11 +0000
From: Oscar Salvador <osalvador@suse.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Muchun Song <muchun.song@linux.dev>,
	David Hildenbrand <david@redhat.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Oscar Salvador <osalvador@suse.de>
Subject: [PATCH] mm, hugetlb: Increment the number of pages to be reset on HVO
Date: Tue, 15 Apr 2025 13:18:59 +0200
Message-ID: <20250415111859.376302-1-osalvador@suse.de>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: DDE931F385
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
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

commit 4eeec8c89a0c ("mm: move hugetlb specific things in folio to page[3]")
shifted hugetlb specific stuff, and now mapping overlaps _hugetlb_cgroup field.

Upon restoring the vmemmap for HVO, only the first two tail pages are reset, and
this causes the check in free_tail_page_prepare() to fail as it finds
an unexpected mapping value in some tails.

Increment the number of pages to be reset to 4 (head + 3 tail pages)

Fixes: 4eeec8c89a0c ("mm: move hugetlb specific things in folio to page[3]")
Suggested-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Oscar Salvador <osalvador@suse.de>
---
 mm/hugetlb_vmemmap.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 9a99dfa3c495..27245e86df25 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -238,11 +238,11 @@ static void vmemmap_remap_pte(pte_t *pte, unsigned long addr,
  * struct page, the special metadata (e.g. page->flags or page->mapping)
  * cannot copy to the tail struct page structs. The invalid value will be
  * checked in the free_tail_page_prepare(). In order to avoid the message
- * of "corrupted mapping in tail page". We need to reset at least 3 (one
- * head struct page struct and two tail struct page structs) struct page
+ * of "corrupted mapping in tail page". We need to reset at least 4 (one
+ * head struct page struct and three tail struct page structs) struct page
  * structs.
  */
-#define NR_RESET_STRUCT_PAGE		3
+#define NR_RESET_STRUCT_PAGE		4
 
 static inline void reset_struct_pages(struct page *start)
 {
-- 
2.49.0

