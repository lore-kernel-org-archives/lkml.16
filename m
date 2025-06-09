Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C3925178A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 09:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749460959; cv=none; b=sr87Q+4s7EfF4iOnkEw/7rrEJ1Qi7dNP2kgJSeO6so1/QVOCwn+BfH7536jGAegYE1a6weY9/Swv2NLoGFCgGAbG+Q0as8FCPB+qzdIYI12xny7E9rDVGBrFmoYICMyhbOhhefsfrgzPTzJm4sjW54K+UpAyexWA5P2+xyozVNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749460959; c=relaxed/simple;
	bh=aDHZGCoJiHyp3jxl4K0MZaDrD0CZIIq0FYEsnaGQJXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cog54AElAyKODjMpHUVZG8rHzh16/pxuwdjRKGroeDRuOhO0xXPL0cAjjamfPV695L3ZNRbD8Fcw8I8QV8tufBIdisv9DNbinQcIwwEKPxyTKmn4aDVaeYt3elWBTILMIeFcFkwXPeEhB1M81zUM+pIYJC+F3uj1awYr29ZwTTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dphPm5Ve; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1jkqvrzD; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dphPm5Ve; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1jkqvrzD; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dphPm5Ve";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1jkqvrzD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dphPm5Ve";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1jkqvrzD"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id ABB35211A8;
	Mon,  9 Jun 2025 09:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749460924; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=irK4Xm+Xq2AmoeMvzYUf2UTVfjZ7E7Dj7dx6W2eeCT8=;
	b=dphPm5VeHY++2TNbYBnilhg6njbfqa6FHMqbgSg1xpdwBUf7yXnjbPBMp6c1JCyoCAu0O9
	kILPQjcb0x/K9PpyJbvwMpTK5zdfVLklVKyChu3IJEM8SQVWURpiAcq/7ohs0sORb7eU3o
	5oJcsKQEM2TA/UltSrbO4FrFS93ibhM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749460924;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=irK4Xm+Xq2AmoeMvzYUf2UTVfjZ7E7Dj7dx6W2eeCT8=;
	b=1jkqvrzDvuOglOaoFZSqYiU/nILIxh8DCvyJDChiMNgacWNTS+qlI924Pc0b+4SJyEdK6V
	oiHduuIG6MlByoAA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=dphPm5Ve;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=1jkqvrzD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749460924; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=irK4Xm+Xq2AmoeMvzYUf2UTVfjZ7E7Dj7dx6W2eeCT8=;
	b=dphPm5VeHY++2TNbYBnilhg6njbfqa6FHMqbgSg1xpdwBUf7yXnjbPBMp6c1JCyoCAu0O9
	kILPQjcb0x/K9PpyJbvwMpTK5zdfVLklVKyChu3IJEM8SQVWURpiAcq/7ohs0sORb7eU3o
	5oJcsKQEM2TA/UltSrbO4FrFS93ibhM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749460924;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=irK4Xm+Xq2AmoeMvzYUf2UTVfjZ7E7Dj7dx6W2eeCT8=;
	b=1jkqvrzDvuOglOaoFZSqYiU/nILIxh8DCvyJDChiMNgacWNTS+qlI924Pc0b+4SJyEdK6V
	oiHduuIG6MlByoAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 15E26137FE;
	Mon,  9 Jun 2025 09:22:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +OW6ArynRmjJGAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Mon, 09 Jun 2025 09:22:04 +0000
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
Subject: [PATCH v6 06/10] drivers,cxl: Use node-notifier instead of memory-notifier
Date: Mon,  9 Jun 2025 11:21:43 +0200
Message-ID: <20250609092149.312114-7-osalvador@suse.de>
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
X-Spamd-Result: default: False [-1.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,suse.cz,huawei.com,oracle.com,sk.com,gmail.com,kvack.org,vger.kernel.org,suse.de];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,suse.cz:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	R_RATELIMIT(0.00)[to_ip_from(RL13d73xi3shrbuzu7ftfs459h)];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: ABB35211A8
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -1.51

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
index c3f4dc244df7..261e07302ca4 100644
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
+	struct node_notify *nn = arg;
+	int nid = nn->nid;
 	int region_nid;
 
-	if (nid == NUMA_NO_NODE || action != MEM_ONLINE)
+	if (action != NODE_ADDED_FIRST_MEMORY)
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

