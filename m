Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CA922B8D0
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 11:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748948950; cv=none; b=lJAgLmE/jBQCHwBPjco8CrgJi9wpIajsE8dGnwk0goKeV05loBhCmxGyQqDtNtaXs4N8x45Y9Bj1nCIptoz3bJBspMdaQnX7UJTlAadA42YRalJdj0/24C2938tNbrhtYXlRzdtSzwj7iJUbFpngn12kOmeDimypQBlW/m4QM4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748948950; c=relaxed/simple;
	bh=L5h4hpSRdlmDM9lqgnn7VIpuhmBKhIQB6y6dM5/PEJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cR0paw3m4U4MtzTONdnjKKTSXhTFCZJb7hn4tVvvS1FZux4Rp/5DjQozl6TTd0MpP2/E3UH4gMtk8ZQGLjhufZZANMjSIH8qoY4Svs4wro8BRnfcnulkJpuvTtV+vnRaFEneRqKM1RkOULaFTPB//U5C1g0+97tw3hL/whdEVW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 055082121C;
	Tue,  3 Jun 2025 11:09:07 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6E9C213AAD;
	Tue,  3 Jun 2025 11:09:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oEXkF9LXPmjfXQAAD6G6ig
	(envelope-from <osalvador@suse.de>); Tue, 03 Jun 2025 11:09:06 +0000
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
Subject: [PATCH v4 1/3] mm,slub: Do not special case N_NORMAL nodes for slab_nodes
Date: Tue,  3 Jun 2025 13:08:48 +0200
Message-ID: <20250603110850.192912-2-osalvador@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250603110850.192912-1-osalvador@suse.de>
References: <20250603110850.192912-1-osalvador@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[];
	TAGGED_RCPT(0.00)[]
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 055082121C
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Score: -4.00

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

The side effects are that we will stop clearing the node from slab_nodes,
and also that newly created kmem caches after node hotremove will now allocate
their kmem_cache_node for the node(s) that was hotremoved, but these
should be negligible.

Suggested-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Oscar Salvador <osalvador@suse.de>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
---
 mm/slub.c | 34 +++-------------------------------
 1 file changed, 3 insertions(+), 31 deletions(-)

diff --git a/mm/slub.c b/mm/slub.c
index be8b09e09d30..f92b43d36adc 100644
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
@@ -6160,36 +6160,12 @@ static int slab_mem_going_offline_callback(void *arg)
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
@@ -6247,10 +6223,6 @@ static int slab_memory_callback(struct notifier_block *self,
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
@@ -6321,7 +6293,7 @@ void __init kmem_cache_init(void)
 	 * Initialize the nodemask for which we will allocate per node
 	 * structures. Here we don't need taking slab_mutex yet.
 	 */
-	for_each_node_state(node, N_NORMAL_MEMORY)
+	for_each_node_state(node, N_MEMORY)
 		node_set(node, slab_nodes);
 
 	create_boot_cache(kmem_cache_node, "kmem_cache_node",
-- 
2.49.0

