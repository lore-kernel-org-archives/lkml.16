Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9582822D9F1
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 11:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748948958; cv=none; b=XLNaIH0hi17dieMBOoPMccYwyndIyQBUcPWcktg0EmTQN6pD4BetQsSitif3zZ7lF2hE10bfiYrxAty6xd2TS3AweEArTEv+JPdm47M+Rt14YiR1cxdkwSyQvSde6rVqL2dsH96ZzDJuFN5uM9EJ5H/hNYQjq1ZroyQMBms8MmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748948958; c=relaxed/simple;
	bh=buHSvr3SJjP/IDoqKDinDq6rJGx85GeS9D1U4mhW/jc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rToThGz/rB4aIVRGCp96LqZIT+olTCMAkdvCVqWy4hjrHrrA1edSnOyumQvqV6UH0VUk5ikfYA9hjrvW1G3K6Aq8vuP54gUE56NFhnzFCcExO+jhIUr0wzpe0MVGUhpm183Ve1liLlVKfwCdnueigzsiQmybTAeI7TDCGTHc7cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vBGVjXWJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9wiJFXcB; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vBGVjXWJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9wiJFXcB; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vBGVjXWJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9wiJFXcB";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vBGVjXWJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9wiJFXcB"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id ABD552121E;
	Tue,  3 Jun 2025 11:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1748948947; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h9lLXBPHpjntW3bu3j8Kanh/vpDrE8MClx6/HSKJxk0=;
	b=vBGVjXWJCeXfjowToPkgXWRgy+3Fh0sbDR2npeA3gftH+kLisQaeDqg19j7ZVMeTOr3WBI
	yPyY+w32oU413G9xbwtgubNmfGhriv977wzdXXBfCu7q6Q++ynAY3TJPmJu06q+wpVkrzO
	1wina6zswB2SloR52uWUs1zGCPpXJyA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1748948947;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h9lLXBPHpjntW3bu3j8Kanh/vpDrE8MClx6/HSKJxk0=;
	b=9wiJFXcBow+QfhZayIao20LOfKwid2Fu34kktQRpk3geXhfD/qyBzFEX4SQPzd7Ftka3ld
	1A8ntXwhTBopQcDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1748948947; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h9lLXBPHpjntW3bu3j8Kanh/vpDrE8MClx6/HSKJxk0=;
	b=vBGVjXWJCeXfjowToPkgXWRgy+3Fh0sbDR2npeA3gftH+kLisQaeDqg19j7ZVMeTOr3WBI
	yPyY+w32oU413G9xbwtgubNmfGhriv977wzdXXBfCu7q6Q++ynAY3TJPmJu06q+wpVkrzO
	1wina6zswB2SloR52uWUs1zGCPpXJyA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1748948947;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h9lLXBPHpjntW3bu3j8Kanh/vpDrE8MClx6/HSKJxk0=;
	b=9wiJFXcBow+QfhZayIao20LOfKwid2Fu34kktQRpk3geXhfD/qyBzFEX4SQPzd7Ftka3ld
	1A8ntXwhTBopQcDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1859913A1D;
	Tue,  3 Jun 2025 11:09:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mMcVA9PXPmjfXQAAD6G6ig
	(envelope-from <osalvador@suse.de>); Tue, 03 Jun 2025 11:09:07 +0000
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
Subject: [PATCH v4 2/3] mm,memory_hotplug: Implement numa node notifier
Date: Tue,  3 Jun 2025 13:08:49 +0200
Message-ID: <20250603110850.192912-3-osalvador@suse.de>
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
X-Spam-Flag: NO
X-Spam-Score: -5.30
X-Spamd-Result: default: False [-5.30 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,suse.cz,huawei.com,oracle.com,sk.com,gmail.com,kvack.org,vger.kernel.org,suse.de];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo,oracle.com:email];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Level: 

There are at least six consumers of hotplug_memory_notifier that what they
really are interested in is whether any numa node changed its state, e.g: going
from being memory aware to becoming memoryless and vice versa.

Implement a specific notifier for numa nodes when their state gets changed,
and have those consumers that only care about numa node state changes use it.

Signed-off-by: Oscar Salvador <osalvador@suse.de>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
---
 drivers/acpi/numa/hmat.c  |   6 +-
 drivers/base/node.c       |  21 +++++
 drivers/cxl/core/region.c |  14 ++--
 drivers/cxl/cxl.h         |   4 +-
 include/linux/memory.h    |  38 ++++++++-
 kernel/cgroup/cpuset.c    |   2 +-
 mm/memory-tiers.c         |   8 +-
 mm/memory_hotplug.c       | 161 +++++++++++++++++---------------------
 mm/mempolicy.c            |   8 +-
 mm/slub.c                 |  13 ++-
 10 files changed, 155 insertions(+), 120 deletions(-)

diff --git a/drivers/acpi/numa/hmat.c b/drivers/acpi/numa/hmat.c
index 9d9052258e92..9ac82a767daf 100644
--- a/drivers/acpi/numa/hmat.c
+++ b/drivers/acpi/numa/hmat.c
@@ -962,10 +962,10 @@ static int hmat_callback(struct notifier_block *self,
 			 unsigned long action, void *arg)
 {
 	struct memory_target *target;
-	struct memory_notify *mnb = arg;
+	struct node_notify *mnb = arg;
 	int pxm, nid = mnb->status_change_nid;
 
-	if (nid == NUMA_NO_NODE || action != MEM_ONLINE)
+	if (nid == NUMA_NO_NODE || action != NODE_BECAME_MEM_AWARE)
 		return NOTIFY_OK;
 
 	pxm = node_to_pxm(nid);
@@ -1118,7 +1118,7 @@ static __init int hmat_init(void)
 	hmat_register_targets();
 
 	/* Keep the table and structures if the notifier may use them */
-	if (hotplug_memory_notifier(hmat_callback, HMAT_CALLBACK_PRI))
+	if (hotplug_node_notifier(hmat_callback, HMAT_CALLBACK_PRI))
 		goto out_put;
 
 	if (!hmat_set_default_dram_perf())
diff --git a/drivers/base/node.c b/drivers/base/node.c
index 25ab9ec14eb8..c5b0859d846d 100644
--- a/drivers/base/node.c
+++ b/drivers/base/node.c
@@ -111,6 +111,27 @@ static const struct attribute_group *node_access_node_groups[] = {
 	NULL,
 };
 
+#ifdef CONFIG_MEMORY_HOTPLUG
+static BLOCKING_NOTIFIER_HEAD(node_chain);
+
+int register_node_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_register(&node_chain, nb);
+}
+EXPORT_SYMBOL(register_node_notifier);
+
+void unregister_node_notifier(struct notifier_block *nb)
+{
+	blocking_notifier_chain_unregister(&node_chain, nb);
+}
+EXPORT_SYMBOL(unregister_node_notifier);
+
+int node_notify(unsigned long val, void *v)
+{
+	return blocking_notifier_call_chain(&node_chain, val, v);
+}
+#endif
+
 static void node_remove_accesses(struct node *node)
 {
 	struct node_access_nodes *c, *cnext;
diff --git a/drivers/cxl/core/region.c b/drivers/cxl/core/region.c
index c3f4dc244df7..c43770d6834c 100644
--- a/drivers/cxl/core/region.c
+++ b/drivers/cxl/core/region.c
@@ -2432,12 +2432,12 @@ static int cxl_region_perf_attrs_callback(struct notifier_block *nb,
 					  unsigned long action, void *arg)
 {
 	struct cxl_region *cxlr = container_of(nb, struct cxl_region,
-					       memory_notifier);
-	struct memory_notify *mnb = arg;
+					       node_notifier);
+	struct node_notify *mnb = arg;
 	int nid = mnb->status_change_nid;
 	int region_nid;
 
-	if (nid == NUMA_NO_NODE || action != MEM_ONLINE)
+	if (nid == NUMA_NO_NODE || action != NODE_BECAME_MEM_AWARE)
 		return NOTIFY_DONE;
 
 	/*
@@ -3484,7 +3484,7 @@ static void shutdown_notifiers(void *_cxlr)
 {
 	struct cxl_region *cxlr = _cxlr;
 
-	unregister_memory_notifier(&cxlr->memory_notifier);
+	unregister_node_notifier(&cxlr->node_notifier);
 	unregister_mt_adistance_algorithm(&cxlr->adist_notifier);
 }
 
@@ -3523,9 +3523,9 @@ static int cxl_region_probe(struct device *dev)
 	if (rc)
 		return rc;
 
-	cxlr->memory_notifier.notifier_call = cxl_region_perf_attrs_callback;
-	cxlr->memory_notifier.priority = CXL_CALLBACK_PRI;
-	register_memory_notifier(&cxlr->memory_notifier);
+	cxlr->node_notifier.notifier_call = cxl_region_perf_attrs_callback;
+	cxlr->node_notifier.priority = CXL_CALLBACK_PRI;
+	register_node_notifier(&cxlr->node_notifier);
 
 	cxlr->adist_notifier.notifier_call = cxl_region_calculate_adistance;
 	cxlr->adist_notifier.priority = 100;
diff --git a/drivers/cxl/cxl.h b/drivers/cxl/cxl.h
index a9ab46eb0610..48ac02dee881 100644
--- a/drivers/cxl/cxl.h
+++ b/drivers/cxl/cxl.h
@@ -513,7 +513,7 @@ enum cxl_partition_mode {
  * @flags: Region state flags
  * @params: active + config params for the region
  * @coord: QoS access coordinates for the region
- * @memory_notifier: notifier for setting the access coordinates to node
+ * @node_notifier: notifier for setting the access coordinates to node
  * @adist_notifier: notifier for calculating the abstract distance of node
  */
 struct cxl_region {
@@ -526,7 +526,7 @@ struct cxl_region {
 	unsigned long flags;
 	struct cxl_region_params params;
 	struct access_coordinate coord[ACCESS_COORDINATE_MAX];
-	struct notifier_block memory_notifier;
+	struct notifier_block node_notifier;
 	struct notifier_block adist_notifier;
 };
 
diff --git a/include/linux/memory.h b/include/linux/memory.h
index 5ec4e6d209b9..8c5c88eaffb3 100644
--- a/include/linux/memory.h
+++ b/include/linux/memory.h
@@ -99,6 +99,14 @@ int set_memory_block_size_order(unsigned int order);
 #define	MEM_PREPARE_ONLINE	(1<<6)
 #define	MEM_FINISH_OFFLINE	(1<<7)
 
+/* These states are used for numa node notifiers */
+#define NODE_BECOMING_MEM_AWARE		(1<<0)
+#define NODE_BECAME_MEM_AWARE		(1<<1)
+#define NODE_BECOMING_MEMORYLESS	(1<<2)
+#define NODE_BECAME_MEMORYLESS		(1<<3)
+#define NODE_CANCEL_MEM_AWARE		(1<<4)
+#define NODE_CANCEL_MEMORYLESS		(1<<5)
+
 struct memory_notify {
 	/*
 	 * The altmap_start_pfn and altmap_nr_pages fields are designated for
@@ -109,7 +117,10 @@ struct memory_notify {
 	unsigned long altmap_nr_pages;
 	unsigned long start_pfn;
 	unsigned long nr_pages;
-	int status_change_nid_normal;
+	int status_change_nid;
+};
+
+struct node_notify {
 	int status_change_nid;
 };
 
@@ -157,15 +168,34 @@ static inline unsigned long memory_block_advised_max_size(void)
 {
 	return 0;
 }
+
+static inline int register_node_notifier(struct notifier_block *nb)
+{
+	return 0;
+}
+static inline void unregister_node_notifier(struct notifier_block *nb)
+{
+}
+static inline int node_notify(unsigned long val, void *v)
+{
+	return 0;
+}
+static inline int hotplug_node_notifier(notifier_fn_t fn, int pri)
+{
+	return 0;
+}
 #else /* CONFIG_MEMORY_HOTPLUG */
 extern int register_memory_notifier(struct notifier_block *nb);
+extern int register_node_notifier(struct notifier_block *nb);
 extern void unregister_memory_notifier(struct notifier_block *nb);
+extern void unregister_node_notifier(struct notifier_block *nb);
 int create_memory_block_devices(unsigned long start, unsigned long size,
 				struct vmem_altmap *altmap,
 				struct memory_group *group);
 void remove_memory_block_devices(unsigned long start, unsigned long size);
 extern void memory_dev_init(void);
 extern int memory_notify(unsigned long val, void *v);
+extern int node_notify(unsigned long val, void *v);
 extern struct memory_block *find_memory_block(unsigned long section_nr);
 typedef int (*walk_memory_blocks_func_t)(struct memory_block *, void *);
 extern int walk_memory_blocks(unsigned long start, unsigned long size,
@@ -185,6 +215,12 @@ int walk_dynamic_memory_groups(int nid, walk_memory_groups_func_t func,
 	register_memory_notifier(&fn##_mem_nb);			\
 })
 
+#define hotplug_node_notifier(fn, pri) ({		\
+	static __meminitdata struct notifier_block fn##_node_nb =\
+		{ .notifier_call = fn, .priority = pri };\
+	register_node_notifier(&fn##_node_nb);			\
+})
+
 #ifdef CONFIG_NUMA
 void memory_block_add_nid(struct memory_block *mem, int nid,
 			  enum meminit_context context);
diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index 83639a12883d..66c84024f217 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -4013,7 +4013,7 @@ void __init cpuset_init_smp(void)
 	cpumask_copy(top_cpuset.effective_cpus, cpu_active_mask);
 	top_cpuset.effective_mems = node_states[N_MEMORY];
 
-	hotplug_memory_notifier(cpuset_track_online_nodes, CPUSET_CALLBACK_PRI);
+	hotplug_node_notifier(cpuset_track_online_nodes, CPUSET_CALLBACK_PRI);
 
 	cpuset_migrate_mm_wq = alloc_ordered_workqueue("cpuset_migrate_mm", 0);
 	BUG_ON(!cpuset_migrate_mm_wq);
diff --git a/mm/memory-tiers.c b/mm/memory-tiers.c
index fc14fe53e9b7..dfe6c28c8352 100644
--- a/mm/memory-tiers.c
+++ b/mm/memory-tiers.c
@@ -872,7 +872,7 @@ static int __meminit memtier_hotplug_callback(struct notifier_block *self,
 					      unsigned long action, void *_arg)
 {
 	struct memory_tier *memtier;
-	struct memory_notify *arg = _arg;
+	struct node_notify *arg = _arg;
 
 	/*
 	 * Only update the node migration order when a node is
@@ -882,13 +882,13 @@ static int __meminit memtier_hotplug_callback(struct notifier_block *self,
 		return notifier_from_errno(0);
 
 	switch (action) {
-	case MEM_OFFLINE:
+	case NODE_BECAME_MEMORYLESS:
 		mutex_lock(&memory_tier_lock);
 		if (clear_node_memory_tier(arg->status_change_nid))
 			establish_demotion_targets();
 		mutex_unlock(&memory_tier_lock);
 		break;
-	case MEM_ONLINE:
+	case NODE_BECAME_MEM_AWARE:
 		mutex_lock(&memory_tier_lock);
 		memtier = set_node_memory_tier(arg->status_change_nid);
 		if (!IS_ERR(memtier))
@@ -929,7 +929,7 @@ static int __init memory_tier_init(void)
 	nodes_and(default_dram_nodes, node_states[N_MEMORY],
 		  node_states[N_CPU]);
 
-	hotplug_memory_notifier(memtier_hotplug_callback, MEMTIER_HOTPLUG_PRI);
+	hotplug_node_notifier(memtier_hotplug_callback, MEMTIER_HOTPLUG_PRI);
 	return 0;
 }
 subsys_initcall(memory_tier_init);
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index b1caedbade5b..777c81cd2943 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -699,30 +699,6 @@ static void online_pages_range(unsigned long start_pfn, unsigned long nr_pages)
 	online_mem_sections(start_pfn, end_pfn);
 }
 
-/* check which state of node_states will be changed when online memory */
-static void node_states_check_changes_online(unsigned long nr_pages,
-	struct zone *zone, struct memory_notify *arg)
-{
-	int nid = zone_to_nid(zone);
-
-	arg->status_change_nid = NUMA_NO_NODE;
-	arg->status_change_nid_normal = NUMA_NO_NODE;
-
-	if (!node_state(nid, N_MEMORY))
-		arg->status_change_nid = nid;
-	if (zone_idx(zone) <= ZONE_NORMAL && !node_state(nid, N_NORMAL_MEMORY))
-		arg->status_change_nid_normal = nid;
-}
-
-static void node_states_set_node(int node, struct memory_notify *arg)
-{
-	if (arg->status_change_nid_normal >= 0)
-		node_set_state(node, N_NORMAL_MEMORY);
-
-	if (arg->status_change_nid >= 0)
-		node_set_state(node, N_MEMORY);
-}
-
 static void __meminit resize_zone_range(struct zone *zone, unsigned long start_pfn,
 		unsigned long nr_pages)
 {
@@ -1177,7 +1153,9 @@ int online_pages(unsigned long pfn, unsigned long nr_pages,
 	int need_zonelists_rebuild = 0;
 	const int nid = zone_to_nid(zone);
 	int ret;
-	struct memory_notify arg;
+	struct memory_notify mem_arg;
+	struct node_notify node_arg;
+	bool cancel_mem_notifier_on_err = false, cancel_node_notifier_on_err = false;
 
 	/*
 	 * {on,off}lining is constrained to full memory sections (or more
@@ -1194,11 +1172,22 @@ int online_pages(unsigned long pfn, unsigned long nr_pages,
 	/* associate pfn range with the zone */
 	move_pfn_range_to_zone(zone, pfn, nr_pages, NULL, MIGRATE_ISOLATE);
 
-	arg.start_pfn = pfn;
-	arg.nr_pages = nr_pages;
-	node_states_check_changes_online(nr_pages, zone, &arg);
+	node_arg.status_change_nid = NUMA_NO_NODE;
+	if (!node_state(nid, N_MEMORY)) {
+		/* Node is becoming memory aware. Notify consumers */
+		cancel_node_notifier_on_err = true;
+		node_arg.status_change_nid = nid;
+		ret = node_notify(NODE_BECOMING_MEM_AWARE, &node_arg);
+		ret = notifier_to_errno(ret);
+		if (ret)
+			goto failed_addition;
+	}
 
-	ret = memory_notify(MEM_GOING_ONLINE, &arg);
+	cancel_mem_notifier_on_err = true;
+	mem_arg.start_pfn = pfn;
+	mem_arg.nr_pages = nr_pages;
+	mem_arg.status_change_nid = node_arg.status_change_nid;
+	ret = memory_notify(MEM_GOING_ONLINE, &mem_arg);
 	ret = notifier_to_errno(ret);
 	if (ret)
 		goto failed_addition;
@@ -1224,7 +1213,8 @@ int online_pages(unsigned long pfn, unsigned long nr_pages,
 	online_pages_range(pfn, nr_pages);
 	adjust_present_page_count(pfn_to_page(pfn), group, nr_pages);
 
-	node_states_set_node(nid, &arg);
+	if (node_arg.status_change_nid >= 0)
+		node_set_state(nid, N_MEMORY);
 	if (need_zonelists_rebuild)
 		build_all_zonelists(NULL);
 
@@ -1245,16 +1235,26 @@ int online_pages(unsigned long pfn, unsigned long nr_pages,
 	kswapd_run(nid);
 	kcompactd_run(nid);
 
+	if (node_arg.status_change_nid >= 0)
+		/*
+		 * Node went from memoryless to having memory. Notify interested
+		 * consumers
+		 */
+		node_notify(NODE_BECAME_MEM_AWARE, &node_arg);
+
 	writeback_set_ratelimit();
 
-	memory_notify(MEM_ONLINE, &arg);
+	memory_notify(MEM_ONLINE, &mem_arg);
 	return 0;
 
 failed_addition:
 	pr_debug("online_pages [mem %#010llx-%#010llx] failed\n",
 		 (unsigned long long) pfn << PAGE_SHIFT,
 		 (((unsigned long long) pfn + nr_pages) << PAGE_SHIFT) - 1);
-	memory_notify(MEM_CANCEL_ONLINE, &arg);
+	if (cancel_mem_notifier_on_err)
+		memory_notify(MEM_CANCEL_ONLINE, &mem_arg);
+	if (cancel_node_notifier_on_err)
+		node_notify(NODE_CANCEL_MEM_AWARE, &node_arg);
 	remove_pfn_range_from_zone(zone, pfn, nr_pages);
 	return ret;
 }
@@ -1886,54 +1886,6 @@ static int __init cmdline_parse_movable_node(char *p)
 }
 early_param("movable_node", cmdline_parse_movable_node);
 
-/* check which state of node_states will be changed when offline memory */
-static void node_states_check_changes_offline(unsigned long nr_pages,
-		struct zone *zone, struct memory_notify *arg)
-{
-	struct pglist_data *pgdat = zone->zone_pgdat;
-	unsigned long present_pages = 0;
-	enum zone_type zt;
-
-	arg->status_change_nid = NUMA_NO_NODE;
-	arg->status_change_nid_normal = NUMA_NO_NODE;
-
-	/*
-	 * Check whether node_states[N_NORMAL_MEMORY] will be changed.
-	 * If the memory to be offline is within the range
-	 * [0..ZONE_NORMAL], and it is the last present memory there,
-	 * the zones in that range will become empty after the offlining,
-	 * thus we can determine that we need to clear the node from
-	 * node_states[N_NORMAL_MEMORY].
-	 */
-	for (zt = 0; zt <= ZONE_NORMAL; zt++)
-		present_pages += pgdat->node_zones[zt].present_pages;
-	if (zone_idx(zone) <= ZONE_NORMAL && nr_pages >= present_pages)
-		arg->status_change_nid_normal = zone_to_nid(zone);
-
-	/*
-	 * We have accounted the pages from [0..ZONE_NORMAL); ZONE_HIGHMEM
-	 * does not apply as we don't support 32bit.
-	 * Here we count the possible pages from ZONE_MOVABLE.
-	 * If after having accounted all the pages, we see that the nr_pages
-	 * to be offlined is over or equal to the accounted pages,
-	 * we know that the node will become empty, and so, we can clear
-	 * it for N_MEMORY as well.
-	 */
-	present_pages += pgdat->node_zones[ZONE_MOVABLE].present_pages;
-
-	if (nr_pages >= present_pages)
-		arg->status_change_nid = zone_to_nid(zone);
-}
-
-static void node_states_clear_node(int node, struct memory_notify *arg)
-{
-	if (arg->status_change_nid_normal >= 0)
-		node_clear_state(node, N_NORMAL_MEMORY);
-
-	if (arg->status_change_nid >= 0)
-		node_clear_state(node, N_MEMORY);
-}
-
 static int count_system_ram_pages_cb(unsigned long start_pfn,
 				     unsigned long nr_pages, void *data)
 {
@@ -1950,10 +1902,14 @@ int offline_pages(unsigned long start_pfn, unsigned long nr_pages,
 			struct zone *zone, struct memory_group *group)
 {
 	const unsigned long end_pfn = start_pfn + nr_pages;
-	unsigned long pfn, managed_pages, system_ram_pages = 0;
+	unsigned long pfn, managed_pages, system_ram_pages = 0, present_pages = 0;
 	const int node = zone_to_nid(zone);
+	struct pglist_data *pgdat = zone->zone_pgdat;
 	unsigned long flags;
-	struct memory_notify arg;
+	struct memory_notify mem_arg;
+	struct node_notify node_arg;
+	bool cancel_mem_notifier_on_err = false, cancel_node_notifier_on_err = false;
+	enum zone_type zt;
 	char *reason;
 	int ret;
 
@@ -2012,11 +1968,30 @@ int offline_pages(unsigned long start_pfn, unsigned long nr_pages,
 		goto failed_removal_pcplists_disabled;
 	}
 
-	arg.start_pfn = start_pfn;
-	arg.nr_pages = nr_pages;
-	node_states_check_changes_offline(nr_pages, zone, &arg);
+	/*
+	 * Here we count the possible pages within the range [0..ZONE_MOVABLE].
+	 * If after having accounted all the pages, we see that the nr_pages to
+	 * be offlined is greater or equal to the accounted pages, we know that the
+	 * node will become empty, and so, we can clear it for N_MEMORY.
+	 */
+	node_arg.status_change_nid = NUMA_NO_NODE;
+	for (zt = 0; zt <= ZONE_MOVABLE; zt++)
+		present_pages += pgdat->node_zones[zt].present_pages;
+	if (nr_pages >= present_pages)
+		node_arg.status_change_nid = node;
+	if (node_arg.status_change_nid >= 0) {
+		cancel_node_notifier_on_err = true;
+		ret = node_notify(NODE_BECOMING_MEMORYLESS, &node_arg);
+		ret = notifier_to_errno(ret);
+		if (ret)
+			goto failed_removal_isolated;
+	}
 
-	ret = memory_notify(MEM_GOING_OFFLINE, &arg);
+	cancel_mem_notifier_on_err = true;
+	mem_arg.start_pfn = start_pfn;
+	mem_arg.nr_pages = nr_pages;
+	mem_arg.status_change_nid = node_arg.status_change_nid;
+	ret = memory_notify(MEM_GOING_OFFLINE, &mem_arg);
 	ret = notifier_to_errno(ret);
 	if (ret) {
 		reason = "notifier failure";
@@ -2096,27 +2071,33 @@ int offline_pages(unsigned long start_pfn, unsigned long nr_pages,
 	 * Make sure to mark the node as memory-less before rebuilding the zone
 	 * list. Otherwise this node would still appear in the fallback lists.
 	 */
-	node_states_clear_node(node, &arg);
+	if (node_arg.status_change_nid >= 0)
+		node_clear_state(node, N_MEMORY);
 	if (!populated_zone(zone)) {
 		zone_pcp_reset(zone);
 		build_all_zonelists(NULL);
 	}
 
-	if (arg.status_change_nid >= 0) {
+	if (node_arg.status_change_nid >= 0) {
 		kcompactd_stop(node);
 		kswapd_stop(node);
+		/* Node went memoryless. Notify interested consumers */
+		node_notify(NODE_BECAME_MEMORYLESS, &node_arg);
 	}
 
 	writeback_set_ratelimit();
 
-	memory_notify(MEM_OFFLINE, &arg);
+	memory_notify(MEM_OFFLINE, &mem_arg);
 	remove_pfn_range_from_zone(zone, start_pfn, nr_pages);
 	return 0;
 
 failed_removal_isolated:
 	/* pushback to free area */
 	undo_isolate_page_range(start_pfn, end_pfn, MIGRATE_MOVABLE);
-	memory_notify(MEM_CANCEL_OFFLINE, &arg);
+	if (cancel_mem_notifier_on_err)
+		memory_notify(MEM_CANCEL_OFFLINE, &mem_arg);
+	if (cancel_node_notifier_on_err)
+		node_notify(NODE_CANCEL_MEMORYLESS, &node_arg);
 failed_removal_pcplists_disabled:
 	lru_cache_enable();
 	zone_pcp_enable(zone);
diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index 72fd72e156b1..3a7717e09506 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -3793,20 +3793,20 @@ static int wi_node_notifier(struct notifier_block *nb,
 			       unsigned long action, void *data)
 {
 	int err;
-	struct memory_notify *arg = data;
+	struct node_notify *arg = data;
 	int nid = arg->status_change_nid;
 
 	if (nid < 0)
 		return NOTIFY_OK;
 
 	switch (action) {
-	case MEM_ONLINE:
+	case NODE_BECAME_MEM_AWARE:
 		err = sysfs_wi_node_add(nid);
 		if (err)
 			pr_err("failed to add sysfs for node%d during hotplug: %d\n",
 			       nid, err);
 		break;
-	case MEM_OFFLINE:
+	case NODE_BECAME_MEMORYLESS:
 		sysfs_wi_node_delete(nid);
 		break;
 	}
@@ -3845,7 +3845,7 @@ static int __init add_weighted_interleave_group(struct kobject *mempolicy_kobj)
 		}
 	}
 
-	hotplug_memory_notifier(wi_node_notifier, DEFAULT_CALLBACK_PRI);
+	hotplug_node_notifier(wi_node_notifier, DEFAULT_CALLBACK_PRI);
 	return 0;
 
 err_cleanup_kobj:
diff --git a/mm/slub.c b/mm/slub.c
index f92b43d36adc..78a70f31de8f 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -6164,8 +6164,8 @@ static int slab_mem_going_online_callback(void *arg)
 {
 	struct kmem_cache_node *n;
 	struct kmem_cache *s;
-	struct memory_notify *marg = arg;
-	int nid = marg->status_change_nid;
+	struct node_notify *narg = arg;
+	int nid = narg->status_change_nid;
 	int ret = 0;
 
 	/*
@@ -6217,15 +6217,12 @@ static int slab_memory_callback(struct notifier_block *self,
 	int ret = 0;
 
 	switch (action) {
-	case MEM_GOING_ONLINE:
+	case NODE_BECOMING_MEM_AWARE:
 		ret = slab_mem_going_online_callback(arg);
 		break;
-	case MEM_GOING_OFFLINE:
+	case NODE_BECOMING_MEMORYLESS:
 		ret = slab_mem_going_offline_callback(arg);
 		break;
-	case MEM_ONLINE:
-	case MEM_CANCEL_OFFLINE:
-		break;
 	}
 	if (ret)
 		ret = notifier_from_errno(ret);
@@ -6300,7 +6297,7 @@ void __init kmem_cache_init(void)
 			sizeof(struct kmem_cache_node),
 			SLAB_HWCACHE_ALIGN | SLAB_NO_OBJ_EXT, 0, 0);
 
-	hotplug_memory_notifier(slab_memory_callback, SLAB_CALLBACK_PRI);
+	hotplug_node_notifier(slab_memory_callback, SLAB_CALLBACK_PRI);
 
 	/* Able to allocate the per node structures */
 	slab_state = PARTIAL;
-- 
2.49.0

