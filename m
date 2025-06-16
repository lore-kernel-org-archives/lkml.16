Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068622E06D3
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 13:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750081969; cv=none; b=NKXVRZr3jx32M0GKJuzUOV42ArzhDdn+FXdn4hSwyiE+kx3+SxrPP2+WY/qANYvJFh+knR9VcWJ5tHnMoS7NiVYdw8QdySquoApghqOqnBN8UKNMrz8trNJbZHGe/nxJNWRDqt8wYVSEc0n2gUP3mdApBGZR274JcFwEAJkE74U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750081969; c=relaxed/simple;
	bh=W0dlmMdcZZMKB393CxN/p2Hhdv/r/O+84i/CH8RZ8XE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pvOb1/3O6SJn4VwivcGnKzWtGp7mZMnsdCO3urAljntUwIs+fkKUtqa0gxpcydAASteoodtO8l7vpykp6oe9oPB+NNYxKSR3JEqGN13h8BR+Wbhkqz3aIgwZEt/Pdc3F3d5nJyTAJxJnY14hHohBxZD2GawLW/BvU+/VcBUCu1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uWPq5lR/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zicGrzhX; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OMTLI/J+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CDZtJo7q; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uWPq5lR/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zicGrzhX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OMTLI/J+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CDZtJo7q"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A085B1F795;
	Mon, 16 Jun 2025 13:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750081945; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MMNHuzJzJyLgWzan34Wy5D6D68B1qu0nQ6rptGO5Izg=;
	b=uWPq5lR/MqJgsqJ9Xy1C42kaxyPBOZexy5GaOuLHvV2ZITdZRuCB+yuVS2w2lebJsEXoQO
	pe9/d9cGp76ek9gNZ7epVBeBY/Fot5w+h2pdwyP8WsLyBpgzD6v2Jn/6zzX3pzdfCNJUbw
	wpO07FJ+l6VDMJWFFNTMte5icaR+8p8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750081945;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MMNHuzJzJyLgWzan34Wy5D6D68B1qu0nQ6rptGO5Izg=;
	b=zicGrzhXg35a5TMjMYSfxrwqsc4YBXuWRWqH4LeiQBuDPNh/SHRJwqutXBU0/5dFSbeLkC
	/cncPPPaJirN1XAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750081940; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MMNHuzJzJyLgWzan34Wy5D6D68B1qu0nQ6rptGO5Izg=;
	b=OMTLI/J+HvudeExzLCThCmv/z1Smeqcq6K2h19mA4GoZifmmjyYpFOfL+S8Nwhn5NM1BZw
	RVkQkRgRU82pkkgsWvLnMaqeIDG5WVbfTUdq6R2DJ8AU8i0eU8rg1WmuTQ8rWiwmkkwUPa
	5k1CicByJs12LHZX+tv4j2Sa81QuJ/s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750081940;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MMNHuzJzJyLgWzan34Wy5D6D68B1qu0nQ6rptGO5Izg=;
	b=CDZtJo7qiCAidLzaZ+PMRDTJQ3kJdIx5Yq/TkvVNhbNLBpasjfMdVoPDhc06tbvN+q4BHf
	h/DZSOvUm4l/vFDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 85E8613AE1;
	Mon, 16 Jun 2025 13:52:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QEUWHo0hUGhHLwAAD6G6ig
	(envelope-from <osalvador@suse.de>); Mon, 16 Jun 2025 13:52:13 +0000
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
Subject: [PATCH v7 05/11] mm,memory-tiers: Use node-notifier instead of memory-notifier
Date: Mon, 16 Jun 2025 15:51:48 +0200
Message-ID: <20250616135158.450136-6-osalvador@suse.de>
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
	TAGGED_RCPT(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[suse.cz:query timed out,oracle.com:query timed out];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,suse.cz,huawei.com,oracle.com,sk.com,gmail.com,kvack.org,vger.kernel.org,suse.de];
	R_RATELIMIT(0.00)[to_ip_from(RLsc83pr41xu6y1i6mw9yajrf5)];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:email,oracle.com:email,imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid,suse.cz:email];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -1.30

memory-tier is only concerned when a numa node changes its memory state,
because it then needs to re-create the demotion list.
So stop using the memory notifier and use the new numa node notifer
instead.

Signed-off-by: Oscar Salvador <osalvador@suse.de>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
Acked-by: David Hildenbrand <david@redhat.com>
---
 mm/memory-tiers.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/mm/memory-tiers.c b/mm/memory-tiers.c
index fc14fe53e9b7..0382b6942b8b 100644
--- a/mm/memory-tiers.c
+++ b/mm/memory-tiers.c
@@ -872,25 +872,18 @@ static int __meminit memtier_hotplug_callback(struct notifier_block *self,
 					      unsigned long action, void *_arg)
 {
 	struct memory_tier *memtier;
-	struct memory_notify *arg = _arg;
-
-	/*
-	 * Only update the node migration order when a node is
-	 * changing status, like online->offline.
-	 */
-	if (arg->status_change_nid < 0)
-		return notifier_from_errno(0);
+	struct node_notify *nn = _arg;
 
 	switch (action) {
-	case MEM_OFFLINE:
+	case NODE_REMOVED_LAST_MEMORY:
 		mutex_lock(&memory_tier_lock);
-		if (clear_node_memory_tier(arg->status_change_nid))
+		if (clear_node_memory_tier(nn->nid))
 			establish_demotion_targets();
 		mutex_unlock(&memory_tier_lock);
 		break;
-	case MEM_ONLINE:
+	case NODE_ADDED_FIRST_MEMORY:
 		mutex_lock(&memory_tier_lock);
-		memtier = set_node_memory_tier(arg->status_change_nid);
+		memtier = set_node_memory_tier(nn->nid);
 		if (!IS_ERR(memtier))
 			establish_demotion_targets();
 		mutex_unlock(&memory_tier_lock);
@@ -929,7 +922,7 @@ static int __init memory_tier_init(void)
 	nodes_and(default_dram_nodes, node_states[N_MEMORY],
 		  node_states[N_CPU]);
 
-	hotplug_memory_notifier(memtier_hotplug_callback, MEMTIER_HOTPLUG_PRI);
+	hotplug_node_notifier(memtier_hotplug_callback, MEMTIER_HOTPLUG_PRI);
 	return 0;
 }
 subsys_initcall(memory_tier_init);
-- 
2.49.0

