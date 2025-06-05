Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E701BF33F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 14:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749133418; cv=none; b=KUt/e/LTh3gslLs1tvgD0yMqNVIxai2nkDzWM0OdesudaNsLy7z1x7afsvXvHyqoJ4sjDWREh6bM/ZSASbxE8Bf1jFC6/i3DoUhGd2hQw9w16EY10UAE58qiWjnMfQE8Ii1zaW5/9xTs/79Oi6fhCjp2OcXaXQqc2cuSHEKEBW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749133418; c=relaxed/simple;
	bh=MD3aMlFOHJvpDZqHB+YncJLnt3iOZYjJ0u3p2gY2aNg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qq4Cp6SY+HIA5IeLHsqD/Bnq3oJppEuTINX487SisJbZ4/k82o8nbdZZzkadnhRjQ1FsMnlrjSnhk4F460qbUOHj24chvJFf3tFicCUEUsrYM5OX7x77k+wGjyrREWNhU4vZBp0vo9taw6kVXw0cYLTIvkO2YPBNxyaBvbNRP5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B2602336C3;
	Thu,  5 Jun 2025 14:23:17 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 20D5D137FE;
	Thu,  5 Jun 2025 14:23:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UF9GBVWoQWipRwAAD6G6ig
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
Subject: [PATCH v5 04/10] mm,slub: Use node-notifier instead of memory-notifier
Date: Thu,  5 Jun 2025 16:22:55 +0200
Message-ID: <20250605142305.244465-5-osalvador@suse.de>
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
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[];
	TAGGED_RCPT(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU]
X-Rspamd-Queue-Id: B2602336C3
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -4.00

slub is only concerned when a numa node changes its memory state,
so stop using the memory notifier and use the new numa node notifer
instead.

Signed-off-by: Oscar Salvador <osalvador@suse.de>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
---
 mm/slub.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/mm/slub.c b/mm/slub.c
index f92b43d36adc..b8b5b81bfd1a 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -6164,8 +6164,8 @@ static int slab_mem_going_online_callback(void *arg)
 {
 	struct kmem_cache_node *n;
 	struct kmem_cache *s;
-	struct memory_notify *marg = arg;
-	int nid = marg->status_change_nid;
+	struct node_notify *narg = arg;
+	int nid = narg->nid;
 	int ret = 0;
 
 	/*
@@ -6217,15 +6217,12 @@ static int slab_memory_callback(struct notifier_block *self,
 	int ret = 0;
 
 	switch (action) {
-	case MEM_GOING_ONLINE:
+	case NODE_ADDING_FIRST_MEMORY:
 		ret = slab_mem_going_online_callback(arg);
 		break;
-	case MEM_GOING_OFFLINE:
+	case NODE_REMOVING_LAST_MEMORY:
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

