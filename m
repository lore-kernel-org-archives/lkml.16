Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1ED02512D1
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 09:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749460932; cv=none; b=ULvncBNx9DpfWALqL81nQ4IMJQyiekgnDj8c7YVJg30Uo38iDWIjG+LcNHEWy3LWE8JvuNGp/Lw9RfSY0PoJeGdnqopkkuf4YWE1xt3Gf++fRy+894T3WoLpLBkNh7yjV7RcVtk0XIAscTzAk6jJRPniLvHUxHwhKdInHDx/66U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749460932; c=relaxed/simple;
	bh=cepLLA9V/eKUdQ5oFYy+GbfJXQhJAD5AJfXwR4xhWHo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aPTWuHdfDx+2yXQAcMtWAfT8qtbuXbNCfwgJT3RXR6hr2Rn9LSG2jf1B/KVKteatRA4T1ff/GxyhXOjo99F7E9Vjq6j8ENSIvZ7A4XrTH+6AWIrR8qet1OKixzu4OVk+8T62t3IXg/c0j7mTxS1TtHWGLaU++EH35SKv9bhL4E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=voDCebsQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=l7qut5CJ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=voDCebsQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=l7qut5CJ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="voDCebsQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="l7qut5CJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="voDCebsQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="l7qut5CJ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4F4871F457;
	Mon,  9 Jun 2025 09:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749460923; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=al9lpScRBg6NZANPePBHCzwADr9FENuYSudRl+0/NRI=;
	b=voDCebsQVBJ9serr8A6ZRvKK+GmQ1QmUEUtgc5zAwkIP8QCGksl/ZaE2r5ShahxNfs60c7
	/rFYrBzyE70rzGdlkcKhuZyF12dzrBG/rmYjUiWF91ru7S3e1uaGvAFIpSYpmSia+wTT7N
	+569d2aR/kM4bNb6lWPfoQWJWFI+xJ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749460923;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=al9lpScRBg6NZANPePBHCzwADr9FENuYSudRl+0/NRI=;
	b=l7qut5CJpAohLgrErJM2KCz49mNYUkdlyAW6Oj1JH2PMA8/quec42tWxsn6Bq3vh7N942Y
	K+yhOC1LVuuZT5Cg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749460923; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=al9lpScRBg6NZANPePBHCzwADr9FENuYSudRl+0/NRI=;
	b=voDCebsQVBJ9serr8A6ZRvKK+GmQ1QmUEUtgc5zAwkIP8QCGksl/ZaE2r5ShahxNfs60c7
	/rFYrBzyE70rzGdlkcKhuZyF12dzrBG/rmYjUiWF91ru7S3e1uaGvAFIpSYpmSia+wTT7N
	+569d2aR/kM4bNb6lWPfoQWJWFI+xJ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749460923;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=al9lpScRBg6NZANPePBHCzwADr9FENuYSudRl+0/NRI=;
	b=l7qut5CJpAohLgrErJM2KCz49mNYUkdlyAW6Oj1JH2PMA8/quec42tWxsn6Bq3vh7N942Y
	K+yhOC1LVuuZT5Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A9E37137FE;
	Mon,  9 Jun 2025 09:22:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WKi6JrqnRmjJGAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Mon, 09 Jun 2025 09:22:02 +0000
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
Subject: [PATCH v6 04/10] mm,slub: Use node-notifier instead of memory-notifier
Date: Mon,  9 Jun 2025 11:21:41 +0200
Message-ID: <20250609092149.312114-5-osalvador@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo,suse.cz:email];
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
X-Spam-Flag: NO
X-Spam-Score: -1.30

slub is only concerned when a numa node changes its memory state,
so stop using the memory notifier and use the new numa node notifer
instead.

Signed-off-by: Oscar Salvador <osalvador@suse.de>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
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

