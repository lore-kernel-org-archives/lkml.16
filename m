Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752022E06DB
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 13:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750081971; cv=none; b=EjSc2tSQmrv+1uvwgg8Q0ym+R622iTCp+P1KW4AB5D6gyqDAGsaW3E0uR+AZHUkmgnxoPrvX/mtdwQaNY71MAN8r3VcLj3NIy+OrLciJjbTKDUFKaAiq5DddgFQp+8G1bvqI+1S5uIC6/EYziXZS4BED0BFPmaBy6dUF80ART7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750081971; c=relaxed/simple;
	bh=7op++JcYZ0IUdeEcoVaDhrzP5zsEfkcLzWcuVU3pl4E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SOcDOVHkrzjj/qDb5NFK7gMS4U0mSlbR62jeeYUX7DTQwKsxtGLcoWz3at1XIRFrtjl4RuOgwF+XTnld43ux6Z2t21s/jTMO9uZjsukN7vawYmwpVVdDWDTzVvnhdGe5LABxVjSYn8MIBxDPZG4iSxR6/NCI87iK7LIqnTgvmJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=THJuL96n; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=L9akPOcz; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Jj8gWIuO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0Mt4A65e; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="THJuL96n";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="L9akPOcz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Jj8gWIuO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0Mt4A65e"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A53942118F;
	Mon, 16 Jun 2025 13:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750081943; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0GOPVWW/FS6+WFimcJvKcp1cTSYaDvg9IjFzhzn+sIc=;
	b=THJuL96nOYp9/YhhSRxhZrUfRo/uuzICRAAMeyCqM0Ie9dhRytwEzAkdyG5ZEs2omU0NMf
	EwK5e/9JfpT8bk4ac4sY4gTbL5vmBX5ToJflt4UCx5D1Li1FCMNZoPBd1isBKqajhKU3T5
	TWOUtQhp7k1qeUz5h3irRhX/pMkjKQM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750081943;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0GOPVWW/FS6+WFimcJvKcp1cTSYaDvg9IjFzhzn+sIc=;
	b=L9akPOczaDkXWRuSSsdzbHbRqLaWK/uT6UJyPqpahIeBZ//To1StshVyjJKz15C7OiHrRS
	jrzSpTccKaLVejDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750081940; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0GOPVWW/FS6+WFimcJvKcp1cTSYaDvg9IjFzhzn+sIc=;
	b=Jj8gWIuOVbMvge7/vXRbgL0+2Mv2wGG90e0FRIVkhyxn7PptfLW9Si4vnZ70T26K8E6Ez+
	COb2aL/kJPsANMiEDAkFSaVp6IZIME9nbq2fSDY2WcoDW5iX72HEU7lKUPlL/SvhDGlb4M
	Dt1sCnYyn2/BbXAX2Y5gF7w30e/ptOw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750081940;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0GOPVWW/FS6+WFimcJvKcp1cTSYaDvg9IjFzhzn+sIc=;
	b=0Mt4A65eB8zEM5T92Ncmr2Ji3P+Lm4RSvnVLN/qpulsCdrk4S+0C5O3yaT6xzafG8C6zDh
	oOHe8mWYBPgyEXDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2838913AE2;
	Mon, 16 Jun 2025 13:52:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wKYyB44hUGhHLwAAD6G6ig
	(envelope-from <osalvador@suse.de>); Mon, 16 Jun 2025 13:52:14 +0000
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
Subject: [PATCH v7 06/11] drivers,cxl: Use node-notifier instead of memory-notifier
Date: Mon, 16 Jun 2025 15:51:49 +0200
Message-ID: <20250616135158.450136-7-osalvador@suse.de>
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
X-Spam-Flag: NO
X-Spam-Score: -1.30
X-Spamd-Result: default: False [-1.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RSPAMD_URIBL_FAIL(0.00)[huawei.com:server fail,oracle.com:query timed out];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,suse.cz,huawei.com,oracle.com,sk.com,gmail.com,kvack.org,vger.kernel.org,suse.de];
	R_RATELIMIT(0.00)[to_ip_from(RLsc83pr41xu6y1i6mw9yajrf5)];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[harry.yoo.oracle.com:query timed out,david.redhat.com:query timed out,vbabka.suse.cz:query timed out,jonathan.cameron.huawei.com:query timed out,osalvador.suse.de:query timed out];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:email,imap1.dmz-prg2.suse.org:helo,suse.cz:email,suse.de:mid,suse.de:email,huawei.com:email]
X-Spam-Level: 

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
Acked-by: David Hildenbrand <david@redhat.com>
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

