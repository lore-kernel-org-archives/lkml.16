Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34CB22DBF71
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 13:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750081956; cv=none; b=d7zYt7/cdBXa0CAeAnsKkzWTzvww+hJhj9CLtwqzGBQr9Dz1XbldA3qUnRjHuvJU9AN5UZUnZCaD7Tzk2p1B0gCzCg5D40AbbNzG9rRB3hKuFaTCmnV8XxV7q9vc7DP6l8LCOGAlSYHSAuNvcxRep9UMHjCIzR0QZeiNR00WKp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750081956; c=relaxed/simple;
	bh=/8TsCVZKOPE1DhRIUaatqoY0vFG3mdYqkBZFpcFjoEI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f7ha1cYrADXfe6aAHxK2HWwBTHpjFDy0QgqyRvdtJOzQ7ltFQqZIweL2XUG3yG+93ScAnrjvsMgiZbMGdDDbM5vmkQUDZ2q1fQCQt/H68WTAotd0BzGupotHqEDYO6Ruew+l9T0cxmsmgDhdKqbWIz9+0NXy+MGrZaFDy6XGSUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bHV0K0Tc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uFbpwRGD; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZsErYesK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=M5ekM3xO; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bHV0K0Tc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uFbpwRGD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZsErYesK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="M5ekM3xO"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 78A3B1F74D;
	Mon, 16 Jun 2025 13:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750081938; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HTx+hI4xt6iSJJj4xnIqdQLTXs9ciYhDC9ckQWuC4pM=;
	b=bHV0K0Tc2UHrdTB6pmoMJkle/JGx5tAu128OpT0+XaqtCPubWva+09OQjWl+GFTh+0GhtJ
	EbEohU3JIaU55N5+ARi89pWcUPKBY4dVVTQMdgybYQueAkEfAYQzsv4S5d3f9EZ6oWbu0T
	hNfFBNtoLIUR7cLd3zkrDYwPiaYDrbg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750081938;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HTx+hI4xt6iSJJj4xnIqdQLTXs9ciYhDC9ckQWuC4pM=;
	b=uFbpwRGDOh7yrfbDCVIIoTOqURviulPjnhV7eV76YsFj2DyXcHLqMhwnc+ABOnO08Ya+X8
	jS+JSdZlM4BOH/Ag==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750081933; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HTx+hI4xt6iSJJj4xnIqdQLTXs9ciYhDC9ckQWuC4pM=;
	b=ZsErYesKIFG+499bMGk0cTXMjkXliQ+4zpeFmnUnHID/6QJ3GoCuNC1FJ/6Zq311pDnEGP
	QsIu0hEy5BH+E2OEce3KfznYkHC8SGjCNvw+3RcELcP5M7AvvvY1cVsynXTkQ3kc1dEkOJ
	z/9u8YZXOEzXr55eiZfVIwhxP/Al1yE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750081933;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HTx+hI4xt6iSJJj4xnIqdQLTXs9ciYhDC9ckQWuC4pM=;
	b=M5ekM3xO0Kwk4MCEbfDEPURmwlYNpIWho+Y9Ggaw320rayuyJPH0d3YFSLx13olrgxxpGQ
	TG0r3RtPfyqX4oBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E142013ADC;
	Mon, 16 Jun 2025 13:52:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MM5LM4whUGhHLwAAD6G6ig
	(envelope-from <osalvador@suse.de>); Mon, 16 Jun 2025 13:52:12 +0000
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
Subject: [PATCH v7 04/11] mm,slub: Use node-notifier instead of memory-notifier
Date: Mon, 16 Jun 2025 15:51:47 +0200
Message-ID: <20250616135158.450136-5-osalvador@suse.de>
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
	FREEMAIL_CC(0.00)[redhat.com,suse.cz,huawei.com,oracle.com,sk.com,gmail.com,kvack.org,vger.kernel.org,suse.de];
	RSPAMD_URIBL_FAIL(0.00)[oracle.com:server fail,suse.cz:server fail,huawei.com:server fail];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:email,oracle.com:email,suse.de:email,suse.de:mid,suse.cz:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -1.30

slub is only concerned when a numa node changes its memory state,
so stop using the memory notifier and use the new numa node notifer
instead.

Signed-off-by: Oscar Salvador <osalvador@suse.de>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
Acked-by: David Hildenbrand <david@redhat.com>
---
 mm/slub.c | 28 +++++++++-------------------
 1 file changed, 9 insertions(+), 19 deletions(-)

diff --git a/mm/slub.c b/mm/slub.c
index f92b43d36adc..3ff0b94f3eeb 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -6146,7 +6146,7 @@ int __kmem_cache_shrink(struct kmem_cache *s)
 	return __kmem_cache_do_shrink(s);
 }
 
-static int slab_mem_going_offline_callback(void *arg)
+static int slab_mem_going_offline_callback(void)
 {
 	struct kmem_cache *s;
 
@@ -6160,21 +6160,12 @@ static int slab_mem_going_offline_callback(void *arg)
 	return 0;
 }
 
-static int slab_mem_going_online_callback(void *arg)
+static int slab_mem_going_online_callback(int nid)
 {
 	struct kmem_cache_node *n;
 	struct kmem_cache *s;
-	struct memory_notify *marg = arg;
-	int nid = marg->status_change_nid;
 	int ret = 0;
 
-	/*
-	 * If the node's memory is already available, then kmem_cache_node is
-	 * already created. Nothing to do.
-	 */
-	if (nid < 0)
-		return 0;
-
 	/*
 	 * We are bringing a node online. No memory is available yet. We must
 	 * allocate a kmem_cache_node structure in order to bring the node
@@ -6214,17 +6205,16 @@ static int slab_mem_going_online_callback(void *arg)
 static int slab_memory_callback(struct notifier_block *self,
 				unsigned long action, void *arg)
 {
+	struct node_notify *nn = arg;
+	int nid = nn->nid;
 	int ret = 0;
 
 	switch (action) {
-	case MEM_GOING_ONLINE:
-		ret = slab_mem_going_online_callback(arg);
-		break;
-	case MEM_GOING_OFFLINE:
-		ret = slab_mem_going_offline_callback(arg);
+	case NODE_ADDING_FIRST_MEMORY:
+		ret = slab_mem_going_online_callback(nid);
 		break;
-	case MEM_ONLINE:
-	case MEM_CANCEL_OFFLINE:
+	case NODE_REMOVING_LAST_MEMORY:
+		ret = slab_mem_going_offline_callback();
 		break;
 	}
 	if (ret)
@@ -6300,7 +6290,7 @@ void __init kmem_cache_init(void)
 			sizeof(struct kmem_cache_node),
 			SLAB_HWCACHE_ALIGN | SLAB_NO_OBJ_EXT, 0, 0);
 
-	hotplug_memory_notifier(slab_memory_callback, SLAB_CALLBACK_PRI);
+	hotplug_node_notifier(slab_memory_callback, SLAB_CALLBACK_PRI);
 
 	/* Able to allocate the per node structures */
 	slab_state = PARTIAL;
-- 
2.49.0

