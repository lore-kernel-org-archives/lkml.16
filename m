Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9109C22B8D5
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 08:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746175015; cv=none; b=Ya5YAfdE45GbXDhn3nfK4Rty6NdXIDzxB38LwJCzNexA2eir0bTqctOtwUj9V3xzdorvAEjg9ZvsKLCkIG2dhXrzOGFlMUC70xQ5v4WvFF7EPkPmZ9LalSDBOS4CjltP4WY5C4eVgiN4C8dPp8JD0PcmXr1SHoLVsAvtVTlW4r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746175015; c=relaxed/simple;
	bh=0UTWqwOTYd8MnaGhf5vFiZKCrivphaJiJeYZpOO16U0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DNeADoxKVSBFOs0OdcERbZSQv59hcIGjpWpytnrWQkVvVsmis3tz3wwDPTjLLARxeQRCFvLBXfsVTelfPE5mBCjk1xEuSbrAPs8+ToEeTDXqbwyAVIJ3YepJVB5Ulq530cfgvqfvCbbxG78sLF8DrEu2SCqaZet0QdLuT9mAXUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=deBg1re9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bOAu/k21; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=deBg1re9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bOAu/k21; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="deBg1re9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bOAu/k21";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="deBg1re9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bOAu/k21"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0B3C31F7C0;
	Fri,  2 May 2025 08:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746175006; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RF1txh0lNcRcIYqklkvU0lHaUfn+UjfmEi23eEsi2hA=;
	b=deBg1re90BTlCw/LOGhobMySte4pi+vUlEaRLRgKTmjAoW0F8ryPlqD/qYdprzNm5lKaWE
	u0ORpqvtyXhcdBWrcs5cPS1t3L9xoJu3CH7GL+dIgSUB67t7xsScn7MojWuKm1WH/U28KG
	aFLA+qFOJbyVymGGtOtS7oni/OEdnrs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746175006;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RF1txh0lNcRcIYqklkvU0lHaUfn+UjfmEi23eEsi2hA=;
	b=bOAu/k21P5OEVOt0pUdj6RnAyEnnkmn16GdP/3/zuVfGzFiDdcy4L3zkvJAoJHj+eCQ2fk
	9/s0EIbSEpfCIXAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746175006; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RF1txh0lNcRcIYqklkvU0lHaUfn+UjfmEi23eEsi2hA=;
	b=deBg1re90BTlCw/LOGhobMySte4pi+vUlEaRLRgKTmjAoW0F8ryPlqD/qYdprzNm5lKaWE
	u0ORpqvtyXhcdBWrcs5cPS1t3L9xoJu3CH7GL+dIgSUB67t7xsScn7MojWuKm1WH/U28KG
	aFLA+qFOJbyVymGGtOtS7oni/OEdnrs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746175006;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RF1txh0lNcRcIYqklkvU0lHaUfn+UjfmEi23eEsi2hA=;
	b=bOAu/k21P5OEVOt0pUdj6RnAyEnnkmn16GdP/3/zuVfGzFiDdcy4L3zkvJAoJHj+eCQ2fk
	9/s0EIbSEpfCIXAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7EDD91399F;
	Fri,  2 May 2025 08:36:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WDQ5HB2EFGhVSwAAD6G6ig
	(envelope-from <osalvador@suse.de>); Fri, 02 May 2025 08:36:45 +0000
From: Oscar Salvador <osalvador@suse.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Vlastimil Babka <vbabka@suse.cz>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Rakie Kim <rakie.kim@sk.com>,
	Oscar Salvador <osalvador@suse.de>
Subject: [PATCH v3 1/3] mm,slub: Do not special case N_NORMAL nodes for slab_nodes
Date: Fri,  2 May 2025 10:36:22 +0200
Message-ID: <20250502083624.49849-2-osalvador@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250502083624.49849-1-osalvador@suse.de>
References: <20250502083624.49849-1-osalvador@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-1.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
	FREEMAIL_CC(0.00)[redhat.com,kvack.org,vger.kernel.org,suse.cz,gmail.com,huawei.com,sk.com,suse.de];
	TAGGED_RCPT(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -1.30
X-Spam-Flag: NO

Currently, slab_mem_going_going_callback() checks whether the node has
N_NORMAL memory in order to be set in slab_nodes.
While it is true that gettind rid of that enforcing would mean
ending up with movables nodes in slab_nodes, the memory waste that comes
with that is negligible.

So stop checking for status_change_nid_normal and just use status_change_nid
instead which works for both types of memory.

Also, once we allocate the kmem_cache_node cache  for the node in
slab_mem_online_callback(), we never deallocate it in
slab_mem_off_callback() when the node goes memoryless, so we can just
get rid of it.

The only side effect is that we will stop clearing the node from slab_nodes.

Suggested-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Oscar Salvador <osalvador@suse.de>
---
 mm/slub.c | 34 +++-------------------------------
 1 file changed, 3 insertions(+), 31 deletions(-)

diff --git a/mm/slub.c b/mm/slub.c
index dc9e729e1d26..236d679e6a1d 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -447,7 +447,7 @@ static inline struct kmem_cache_node *get_node(struct kmem_cache *s, int node)
 
 /*
  * Tracks for which NUMA nodes we have kmem_cache_nodes allocated.
- * Corresponds to node_state[N_NORMAL_MEMORY], but can temporarily
+ * Corresponds to node_state[N_MEMORY], but can temporarily
  * differ during memory hotplug/hotremove operations.
  * Protected by slab_mutex.
  */
@@ -6174,36 +6174,12 @@ static int slab_mem_going_offline_callback(void *arg)
 	return 0;
 }
 
-static void slab_mem_offline_callback(void *arg)
-{
-	struct memory_notify *marg = arg;
-	int offline_node;
-
-	offline_node = marg->status_change_nid_normal;
-
-	/*
-	 * If the node still has available memory. we need kmem_cache_node
-	 * for it yet.
-	 */
-	if (offline_node < 0)
-		return;
-
-	mutex_lock(&slab_mutex);
-	node_clear(offline_node, slab_nodes);
-	/*
-	 * We no longer free kmem_cache_node structures here, as it would be
-	 * racy with all get_node() users, and infeasible to protect them with
-	 * slab_mutex.
-	 */
-	mutex_unlock(&slab_mutex);
-}
-
 static int slab_mem_going_online_callback(void *arg)
 {
 	struct kmem_cache_node *n;
 	struct kmem_cache *s;
 	struct memory_notify *marg = arg;
-	int nid = marg->status_change_nid_normal;
+	int nid = marg->status_change_nid;
 	int ret = 0;
 
 	/*
@@ -6261,10 +6237,6 @@ static int slab_memory_callback(struct notifier_block *self,
 	case MEM_GOING_OFFLINE:
 		ret = slab_mem_going_offline_callback(arg);
 		break;
-	case MEM_OFFLINE:
-	case MEM_CANCEL_ONLINE:
-		slab_mem_offline_callback(arg);
-		break;
 	case MEM_ONLINE:
 	case MEM_CANCEL_OFFLINE:
 		break;
@@ -6335,7 +6307,7 @@ void __init kmem_cache_init(void)
 	 * Initialize the nodemask for which we will allocate per node
 	 * structures. Here we don't need taking slab_mutex yet.
 	 */
-	for_each_node_state(node, N_NORMAL_MEMORY)
+	for_each_node_state(node, N_MEMORY)
 		node_set(node, slab_nodes);
 
 	create_boot_cache(kmem_cache_node, "kmem_cache_node",
-- 
2.49.0

