Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1DA148830
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 14:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749133412; cv=none; b=X8CeY2GWFvnzw8IlRcpPTeDz7fPtKGBgd2WgyE3QevnoAtYj9Ocvv2qdJzhyI3Ld8ivKPG1UqoAutXh6rq3QXkr4s7UZZEG4oO0HiSjiBmbsqmXTSIguQoZq6p23LE/mTI58nQV0MtEl9m3uNEzqVK/ogatkhymq5c4/q4kRwrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749133412; c=relaxed/simple;
	bh=TAzrt6nhy8E8EUa5WhmeMI7II9eV2j9n/Aq2emSKi0A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GseGb9Tuc2O9MsHkzm2ONbkz4F4TDr8z39iQ7RlXSnnbEpMLnZWKUFVXPYVNrbTdNjl2dzuWudU0IJdjcsTgaM229m7oQxMznush+JFChdhPa7F4LlMOzA4PwxXSuqM+AwrBjlQnJ25UnHKQdIVUzsxPKNk1OJCdAmdssolR7ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 110081FB40;
	Thu,  5 Jun 2025 14:23:19 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 73F1B137FE;
	Thu,  5 Jun 2025 14:23:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WBmOGVaoQWipRwAAD6G6ig
	(envelope-from <osalvador@suse.de>); Thu, 05 Jun 2025 14:23:18 +0000
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
Subject: [PATCH v5 06/10] drivers,cxl: Use node-notifier instead of memory-notifier
Date: Thu,  5 Jun 2025 16:22:57 +0200
Message-ID: <20250605142305.244465-7-osalvador@suse.de>
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
X-Rspamd-Queue-Id: 110081FB40
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Score: -4.00

memory-tier is only concerned when a numa node changes its memory state,
specifically when a numa node with memory comes into play for the first
time, because it needs to get its performance attributes to build a proper
demotion chain.
So stop using the memory notifier and use the new numa node notifer
instead.

Signed-off-by: Oscar Salvador <osalvador@suse.de>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
---
 drivers/cxl/core/region.c | 16 ++++++++--------
 drivers/cxl/cxl.h         |  4 ++--
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/cxl/core/region.c b/drivers/cxl/core/region.c
index c3f4dc244df7..a8477a3e175c 100644
--- a/drivers/cxl/core/region.c
+++ b/drivers/cxl/core/region.c
@@ -2432,12 +2432,12 @@ static int cxl_region_perf_attrs_callback(struct notifier_block *nb,
 					  unsigned long action, void *arg)
 {
 	struct cxl_region *cxlr = container_of(nb, struct cxl_region,
-					       memory_notifier);
-	struct memory_notify *mnb = arg;
-	int nid = mnb->status_change_nid;
+					       node_notifier);
+	struct node_notify *mnb = arg;
+	int nid = mnb->nid;
 	int region_nid;
 
-	if (nid == NUMA_NO_NODE || action != MEM_ONLINE)
+	if (nid == NUMA_NO_NODE || action != NODE_ADDED_FIRST_MEMORY)
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
 
-- 
2.49.0

