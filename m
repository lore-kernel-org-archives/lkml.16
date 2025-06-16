Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08492E4252
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 13:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750081975; cv=none; b=tufOM1B5HBhG/eOJUBeq/4ghE6j2ABirgC1DUIkqXc0pHrrHklNtNyMMv2rMGedkaycomizCG+/rusu+EeoczGlgSeIH/RdDOrM0CM5nzUeaf0LyXavSP8bHaEMpIhSjVgZCNGC6we7mc1WzQ0nwD21Y0U4EwKxEvl/irt3St+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750081975; c=relaxed/simple;
	bh=kTIgeJwBHcA+TYgIEmJHB28Qv++Tv+rlMxf8bOb+d7I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bHClEjVkn/TSFHXR41sbHBxnTCD6p5ecqEYtBvoQEcI7zpIVgjWrt0gmHNlCJZ1H+iKY6IeqDkM42kV5AKwWwhA1AbxgL/3L42nOeWH1GHr3Obdfg4mCuODKRDrqN39UBf3CLfF+aSWkBHAl41++jeOBBlJzqB40s/EH3wEQl3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QFt+mI3v; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PhCsFBJI; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tn19BeKV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=aILlNkjg; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QFt+mI3v";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PhCsFBJI";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tn19BeKV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="aILlNkjg"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4459B1F79A;
	Mon, 16 Jun 2025 13:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750081947; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kvQ93fpE+S5r7kCRZqpZhmVWGTpofUKn8LF66RwQceA=;
	b=QFt+mI3vXjn6x8BZL3La4acdV780kVqsi1tUP+Sk96R1YvH9Tx6rhGlzKcRMGm4U/ueVRJ
	8Sl+DT+SgBlN6fszzfoq4fhPEMIcZavIVTEcJViE/PlF+IEF01FEjuBrm4Jb1H9JlfDuPW
	cXK5F8BKt+YhW/PF6+DGS/aQuBx2/l4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750081947;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kvQ93fpE+S5r7kCRZqpZhmVWGTpofUKn8LF66RwQceA=;
	b=PhCsFBJI68RCCn7UtN2M56Zw41nMFf2duu6CZpPthmZoRHIW4JDRwkLDNsFqan22vkwSSr
	XcEyyTuy/rGvFCAA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=tn19BeKV;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=aILlNkjg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750081942; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kvQ93fpE+S5r7kCRZqpZhmVWGTpofUKn8LF66RwQceA=;
	b=tn19BeKVQq/FmlR5L8u+gGv60Jeypk4uB1aIsa+JXjkzNfjHbU8fY89BRu7Vffo+/GseRz
	WTougCEQgABCVJQIY610ksLIg7cL1QLNQ1DqjVi9yWvzRC6G9+SOpnP1CdgGG5mz9bs7RZ
	gK3Zy7Iutgjnyl1NYT8oOdAND0xnASk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750081942;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kvQ93fpE+S5r7kCRZqpZhmVWGTpofUKn8LF66RwQceA=;
	b=aILlNkjgUfKOfj0+MeDYbSzMCMmR8DyarjRJ8Ps0kOcIvLI3EQ8eQMEgHo0zf7SbmPnQAZ
	kTZSmtOSbdy+NDAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 096C113AEE;
	Mon, 16 Jun 2025 13:52:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IC8vO48hUGhHLwAAD6G6ig
	(envelope-from <osalvador@suse.de>); Mon, 16 Jun 2025 13:52:15 +0000
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
Subject: [PATCH v7 09/11] mm,mempolicy: Use node-notifier instead of memory-notifier
Date: Mon, 16 Jun 2025 15:51:52 +0200
Message-ID: <20250616135158.450136-10-osalvador@suse.de>
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
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 4459B1F79A
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-1.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[oracle.com:query timed out,sk.com:query timed out];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,suse.cz:email,huawei.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,oracle.com:email];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,suse.cz,huawei.com,oracle.com,sk.com,gmail.com,kvack.org,vger.kernel.org,suse.de];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	TAGGED_RCPT(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RL13d73xi3shrbuzu7ftfs459h)];
	RSPAMD_EMAILBL_FAIL(0.00)[jonathan.cameron.huawei.com:server fail,harry.yoo.oracle.com:query timed out,david.redhat.com:query timed out,vbabka.suse.cz:query timed out,osalvador.suse.de:query timed out,rakie.kim.sk.com:query timed out];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -1.51
X-Spam-Level: 

mempolicy is only concerned when a numa node changes its memory state,
because it needs to take this node into account for the auto-weighted
memory policy system.
So stop using the memory notifier and use the new numa node notifer
instead.

Signed-off-by: Oscar Salvador <osalvador@suse.de>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
Reviewed-by: Rakie Kim <rakie.kim@sk.com>
Acked-by: David Hildenbrand <david@redhat.com>
---
 mm/mempolicy.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index 72fd72e156b1..693319c2652d 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -3793,20 +3793,17 @@ static int wi_node_notifier(struct notifier_block *nb,
 			       unsigned long action, void *data)
 {
 	int err;
-	struct memory_notify *arg = data;
-	int nid = arg->status_change_nid;
-
-	if (nid < 0)
-		return NOTIFY_OK;
+	struct node_notify *nn = data;
+	int nid = nn->nid;
 
 	switch (action) {
-	case MEM_ONLINE:
+	case NODE_ADDED_FIRST_MEMORY:
 		err = sysfs_wi_node_add(nid);
 		if (err)
 			pr_err("failed to add sysfs for node%d during hotplug: %d\n",
 			       nid, err);
 		break;
-	case MEM_OFFLINE:
+	case NODE_REMOVED_LAST_MEMORY:
 		sysfs_wi_node_delete(nid);
 		break;
 	}
@@ -3845,7 +3842,7 @@ static int __init add_weighted_interleave_group(struct kobject *mempolicy_kobj)
 		}
 	}
 
-	hotplug_memory_notifier(wi_node_notifier, DEFAULT_CALLBACK_PRI);
+	hotplug_node_notifier(wi_node_notifier, DEFAULT_CALLBACK_PRI);
 	return 0;
 
 err_cleanup_kobj:
-- 
2.49.0

