Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA4E2BF018
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 13:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750081957; cv=none; b=Jh/QdpGJDr3xC0OR5dgg4cdymFP8BSsT71KPn8iE162y8OfNsXCnEGc5YO/a/2iZiO2JNeitGMg8QMKBB1pj1LPYJssp+W+7e2XvEw7wc9CsbwcBSU+fE4f8WDedS3KfYZKAagHmjaokqmnlZVxhxX831xMHqLQKWsva5CQOm8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750081957; c=relaxed/simple;
	bh=McIBe5rjHEh6+UlWK5PHMkSkm0ITwlqwRONiJNK4ryM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HINyiFuEZwCLcZ0ADUPCPvfAEYEaBmtprS39dxY+v2KKzCfZwMT522Go/C7knHAOzh2oNyITp61qR0hZOPe+3yct4mS0WrUNUi1n0+MFjj/XJ0MNB7Pnx7RURyOozkqPi0h3g8SvpHXsScJrOUInitwD9QOWywlMTBtP0UTf8NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Puinu84S; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/qjERsN/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NIsw3b2K; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jc9ioTjv; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Puinu84S";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/qjERsN/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NIsw3b2K";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jc9ioTjv"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 47D06211F2;
	Mon, 16 Jun 2025 13:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750081943; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GQkEClDP0wrzDDOsHwrNIl3nI8G2kqil/mCtolIEaQ0=;
	b=Puinu84S/THIZbGL7+grRK744YM9p6O4ydy1pE0hF2kEXSD7j3mcy9ooHSkaoYcN8mLVZN
	80lkpZ6U3l1HzZR7B8eL5RGzxXGbbFl8BK23etYsEYUspcX1PpGm2z0GekHyR5XDNY8dtC
	ipuOMn8LuEX8AAcvNxWNAQo+yeadd80=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750081943;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GQkEClDP0wrzDDOsHwrNIl3nI8G2kqil/mCtolIEaQ0=;
	b=/qjERsN/mZ0gWixnZ83sE71OKrJ7AZtgl2SZbwGgbt8mWavPABsx3fJ0iwSmSxF2XT83aH
	hKqBT+j5mEA5heAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750081942; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GQkEClDP0wrzDDOsHwrNIl3nI8G2kqil/mCtolIEaQ0=;
	b=NIsw3b2KjfLPUUkgQidAn5l/vz39+xC2PHf2jP4fMjRzJ8uzljqfaGZnyQOaVbjGed5JVn
	rgW/oqB2lAZrVFvZDyWlweFtNNMy6yPmUQmKqHSx68cCNhfaboR7XXtQhyokCYA7GYSgeZ
	eJvdfswxczmqPXjv/dpVmdguFpLms24=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750081942;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GQkEClDP0wrzDDOsHwrNIl3nI8G2kqil/mCtolIEaQ0=;
	b=jc9ioTjvdemVgFrh1TRaIapA4LQI50s9MqUVY9CogW5h5ScxvWRBl8ZTP1G49bCuq5ufW+
	o6ZP7h9Goa9gQCAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A1F5D13AEF;
	Mon, 16 Jun 2025 13:52:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oB3wJJAhUGhHLwAAD6G6ig
	(envelope-from <osalvador@suse.de>); Mon, 16 Jun 2025 13:52:16 +0000
From: Oscar Salvador <osalvador@suse.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Harry Yoo <harry.yoo@oracle.com>,
	Rakie Kim <rakie.kim@sk.com>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Oscar Salvador <osalvador@suse.de>
Subject: [PATCH v7 10/11] mm,page_ext: Derive the node from the pfn
Date: Mon, 16 Jun 2025 15:51:53 +0200
Message-ID: <20250616135158.450136-11-osalvador@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250616135158.450136-1-osalvador@suse.de>
References: <20250616135158.450136-1-osalvador@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[suse.cz:query timed out,oracle.com:query timed out];
	FREEMAIL_CC(0.00)[redhat.com,suse.cz,huawei.com,oracle.com,sk.com,gmail.com,kvack.org,vger.kernel.org,suse.de];
	RCVD_TLS_ALL(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLsc83pr41xu6y1i6mw9yajrf5)];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:email,imap1.dmz-prg2.suse.org:helo,suse.cz:email,suse.de:email,suse.de:mid];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -1.30

page_ext is the only user of 'status_change_nid', which is set in
online/offline operations, to know to which node we are
adding/removing memory.

Prior to call any notifiers, the memmap is initialized via, which among
other things, sets the node the pages belong to, to all corresponging pages.
This means that there is no need to keep using 'status_change_nid' since
we can derive the node from the pfn.
This will allow us to finally drop 'status_change_nid' from the memory_notify
struct.

Suggested-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Oscar Salvador <osalvador@suse.de>
Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
Acked-by: David Hildenbrand <david@redhat.com>
---
 mm/page_ext.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/mm/page_ext.c b/mm/page_ext.c
index c351fdfe9e9a..d7396a8970e5 100644
--- a/mm/page_ext.c
+++ b/mm/page_ext.c
@@ -369,25 +369,15 @@ static void __invalidate_page_ext(unsigned long pfn)
 }
 
 static int __meminit online_page_ext(unsigned long start_pfn,
-				unsigned long nr_pages,
-				int nid)
+				unsigned long nr_pages)
 {
+	int nid = pfn_to_nid(start_pfn);
 	unsigned long start, end, pfn;
 	int fail = 0;
 
 	start = SECTION_ALIGN_DOWN(start_pfn);
 	end = SECTION_ALIGN_UP(start_pfn + nr_pages);
 
-	if (nid == NUMA_NO_NODE) {
-		/*
-		 * In this case, "nid" already exists and contains valid memory.
-		 * "start_pfn" passed to us is a pfn which is an arg for
-		 * online__pages(), and start_pfn should exist.
-		 */
-		nid = pfn_to_nid(start_pfn);
-		VM_BUG_ON(!node_online(nid));
-	}
-
 	for (pfn = start; !fail && pfn < end; pfn += PAGES_PER_SECTION)
 		fail = init_section_page_ext(pfn, nid);
 	if (!fail)
@@ -435,8 +425,7 @@ static int __meminit page_ext_callback(struct notifier_block *self,
 
 	switch (action) {
 	case MEM_GOING_ONLINE:
-		ret = online_page_ext(mn->start_pfn,
-				   mn->nr_pages, mn->status_change_nid);
+		ret = online_page_ext(mn->start_pfn, mn->nr_pages);
 		break;
 	case MEM_OFFLINE:
 		offline_page_ext(mn->start_pfn,
-- 
2.49.0

