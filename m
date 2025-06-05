Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A301A275
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 14:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749133405; cv=none; b=X6XzfkP9o0gEmYVGhST2UyeQK4UHpS8jxs4t73PCf8oYOntUH9h/zZoFtTcnxtWf2IxhVhWVdga5cyd/fM2u36z3fxpGhN/Z7/tIqnUqzKWNqkG57Q4xunz5POHR2QLVmXOHLRMoHTffDrk0V9bJyT0X1dzt/OC/rpN6fJlbptM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749133405; c=relaxed/simple;
	bh=nishEo9TFyl0gqR6Lnhz9QHfE3lo9HH8FfAyXE3iFJA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ph8evY7fTjvxi2WOLGiWoPEOuIPPc3gJLmwDyXO7sPepNk5y9RFrIkr6O3wzeF7w/vvT45doBQ/UJiqW0bNwqb0OGXf4p5YEWvnYuGVWGbzrOoNqOtNmd5Mq9Jg3MJo+v47CgKEnyglvXmkdsrAee64K0sjqKVyvzgUbqNi8a+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 610021F898;
	Thu,  5 Jun 2025 14:23:18 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C4E69137FE;
	Thu,  5 Jun 2025 14:23:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cPVELVWoQWipRwAAD6G6ig
	(envelope-from <osalvador@suse.de>); Thu, 05 Jun 2025 14:23:17 +0000
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
Subject: [PATCH v5 05/10] mm,memory-tiers: Use node-notifier instead of memory-notifier
Date: Thu,  5 Jun 2025 16:22:56 +0200
Message-ID: <20250605142305.244465-6-osalvador@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605142305.244465-1-osalvador@suse.de>
References: <20250605142305.244465-1-osalvador@suse.de>
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
	TAGGED_RCPT(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU]
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 610021F898
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Score: -4.00

memory-tier is only concerned when a numa node changes its memory state,
because it then needs to re-create the demotion list.
So stop using the memory notifier and use the new numa node notifer
instead.

Signed-off-by: Oscar Salvador <osalvador@suse.de>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
---
 mm/memory-tiers.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/mm/memory-tiers.c b/mm/memory-tiers.c
index fc14fe53e9b7..67f06e6264a1 100644
--- a/mm/memory-tiers.c
+++ b/mm/memory-tiers.c
@@ -872,25 +872,25 @@ static int __meminit memtier_hotplug_callback(struct notifier_block *self,
 					      unsigned long action, void *_arg)
 {
 	struct memory_tier *memtier;
-	struct memory_notify *arg = _arg;
+	struct node_notify *narg = _arg;
 
 	/*
 	 * Only update the node migration order when a node is
 	 * changing status, like online->offline.
 	 */
-	if (arg->status_change_nid < 0)
+	if (narg->nid < 0)
 		return notifier_from_errno(0);
 
 	switch (action) {
-	case MEM_OFFLINE:
+	case NODE_REMOVED_LAST_MEMORY:
 		mutex_lock(&memory_tier_lock);
-		if (clear_node_memory_tier(arg->status_change_nid))
+		if (clear_node_memory_tier(narg->nid))
 			establish_demotion_targets();
 		mutex_unlock(&memory_tier_lock);
 		break;
-	case MEM_ONLINE:
+	case NODE_ADDED_FIRST_MEMORY:
 		mutex_lock(&memory_tier_lock);
-		memtier = set_node_memory_tier(arg->status_change_nid);
+		memtier = set_node_memory_tier(narg->nid);
 		if (!IS_ERR(memtier))
 			establish_demotion_targets();
 		mutex_unlock(&memory_tier_lock);
@@ -929,7 +929,7 @@ static int __init memory_tier_init(void)
 	nodes_and(default_dram_nodes, node_states[N_MEMORY],
 		  node_states[N_CPU]);
 
-	hotplug_memory_notifier(memtier_hotplug_callback, MEMTIER_HOTPLUG_PRI);
+	hotplug_node_notifier(memtier_hotplug_callback, MEMTIER_HOTPLUG_PRI);
 	return 0;
 }
 subsys_initcall(memory_tier_init);
-- 
2.49.0

