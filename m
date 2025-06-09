Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43FF253F2C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 09:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749460965; cv=none; b=i4EkpqRSrN6589GhAGwwOIYNqGmQbQYNzYja8OTz6+ROq5qktggSVBXcSsBeDumUKZJmvvf5R4ICJP0v/EdDjjgseXJVb3mwoI9wk69y2Xy5zX8MluMH8gaEEpKgKPsNTrRKZsw8OszAYttBZSk1FPwGDOG5qAWIoX9tqb16SbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749460965; c=relaxed/simple;
	bh=J1+gGEeeE9KitfkkSyltY+/ZrkiVQMtIQHRHRyL7z0M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MvSd8t0Ui1JptdzyZUT0sCbbDjqAyw1Oe1xTZQ0CXHDO1t63QyDnCdbWnP3yGJXzy8eajnAI1SWNUaA86O4Z5RBtSaIv0DgojXwY7k6F+J+CPIAGN0wxjrD+z5RiAKBr1KbT8lrUlFgQjoQ5cz1fLNeAK+3oUsajIEUv7xuokts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=E60tKUfh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qjVXVAXy; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VrR889nr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pxuYSGGU; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="E60tKUfh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qjVXVAXy";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VrR889nr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pxuYSGGU"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E0363211A9;
	Mon,  9 Jun 2025 09:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749460927; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EAVH0lK/4ND0+AXwQ8LiSeiTpje2qfsWzgpZuqg1LVs=;
	b=E60tKUfh9Bwz8z97ryv5iKBMm3NS0CXwrwoMu4yRAgqyjP5NxsqGZZVMjgcG41MfNRovnY
	2bFZ9cWLb0x5Pz4gZv/Hl0Gxfj2JfyfaRp4voSkFkcJVNvVbN/Qhdvx8bGSV/NzyQT1aLB
	YAMm1zPsUWhV9Kw/ArVXhlUgAbzSUUQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749460927;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EAVH0lK/4ND0+AXwQ8LiSeiTpje2qfsWzgpZuqg1LVs=;
	b=qjVXVAXyCoEPNU+qec0jkD+m3FhlcDanYfXqMP2TUMsMZQDcra92xRf8XXm0aRSg17rRUf
	kizaSUYs/2SleTCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749460926; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EAVH0lK/4ND0+AXwQ8LiSeiTpje2qfsWzgpZuqg1LVs=;
	b=VrR889nrUAQ5XEsAyA7MNPRN5QieD9lArWEGNqx7j+rOnzF/svjjR5dsZsu6ArclTjK2zX
	r3zuBpd9gIiquQ+fAp3idATvc7U2YmyixKBRIRcJKhxLvSDcO3W60pP6R7/DFakxKdizeq
	Em30On8gwRxuATW/77gZrn6ev7bI0+4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749460926;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EAVH0lK/4ND0+AXwQ8LiSeiTpje2qfsWzgpZuqg1LVs=;
	b=pxuYSGGUXXs0KvIyAFQOmB5tordyLYrWK7AqcJH6a2D6Z/etFIXFAoY8pTnwYFzNuY4iS9
	9kCQgoWBFPBmCeCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 404B113A85;
	Mon,  9 Jun 2025 09:22:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MD3lDL6nRmjJGAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Mon, 09 Jun 2025 09:22:06 +0000
From: Oscar Salvador <osalvador@suse.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Harry Yoo <harry.yoo@oracle.com>,
	Rakie Kim <rakie.kim@sk.com>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Oscar Salvador <osalvador@suse.de>
Subject: [PATCH v6 09/10] mm,mempolicy: Use node-notifier instead of memory-notifier
Date: Mon,  9 Jun 2025 11:21:46 +0200
Message-ID: <20250609092149.312114-10-osalvador@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609092149.312114-1-osalvador@suse.de>
References: <20250609092149.312114-1-osalvador@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -1.30
X-Spamd-Result: default: False [-1.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,suse.cz,huawei.com,oracle.com,sk.com,gmail.com,kvack.org,vger.kernel.org,suse.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo,suse.cz:email];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	R_RATELIMIT(0.00)[to_ip_from(RLsc83pr41xu6y1i6mw9yajrf5)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Level: 

mempolicy is only concerned when a numa node changes its memory state,
because it needs to take this node into account for the auto-weighted
memory policy system.
So stop using the memory notifier and use the new numa node notifer
instead.

Signed-off-by: Oscar Salvador <osalvador@suse.de>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
Reviewed-by: Rakie Kim <rakie.kim@sk.com>
---
 mm/mempolicy.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index 72fd72e156b1..693319c2652d 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -3793,20 +3793,17 @@ static int wi_node_notifier(struct notifier_block *nb,
 			       unsigned long action, void *data)
 {
 	int err;
-	struct memory_notify *arg = data;
-	int nid = arg->status_change_nid;
-
-	if (nid < 0)
-		return NOTIFY_OK;
+	struct node_notify *nn = data;
+	int nid = nn->nid;
 
 	switch (action) {
-	case MEM_ONLINE:
+	case NODE_ADDED_FIRST_MEMORY:
 		err = sysfs_wi_node_add(nid);
 		if (err)
 			pr_err("failed to add sysfs for node%d during hotplug: %d\n",
 			       nid, err);
 		break;
-	case MEM_OFFLINE:
+	case NODE_REMOVED_LAST_MEMORY:
 		sysfs_wi_node_delete(nid);
 		break;
 	}
@@ -3845,7 +3842,7 @@ static int __init add_weighted_interleave_group(struct kobject *mempolicy_kobj)
 		}
 	}
 
-	hotplug_memory_notifier(wi_node_notifier, DEFAULT_CALLBACK_PRI);
+	hotplug_node_notifier(wi_node_notifier, DEFAULT_CALLBACK_PRI);
 	return 0;
 
 err_cleanup_kobj:
-- 
2.49.0

