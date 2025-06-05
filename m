Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69911DE2CF
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 14:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749133424; cv=none; b=YcC/5E1AdOGZWHONPj4AfCptnyL/TsstmNRZ3q62Glhue9pwoYsL1/HKuyV+fPObQ3BLz+fTjBJBAPdQj+Qty33pZHzxTAJ0hwarUns8U2eV4mNeWyo0WUPQY4NWq1KIHvFnNmGupOzejoM5C4UOvHnrTHPz8QoEO7n49DcAu08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749133424; c=relaxed/simple;
	bh=NjrFzsmMMVDfSK30eUWfJlAavtEqL6V+GN78HLu9+eU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ja/vY3uy3/yXZoSNvuWDxNg1X7irXepCxf7BMGQO10QfeRh7aXjafmpjqmrTXGtsVIEOdeVpjNVV86vGVvZZyDEI2mi73fOIHw3CpB0Okbt0GpVA7bpzSBtNzrE6eV85IpTUexu9Qexv6jO2/7X27+xu+AOLF67K9OVhpwLrvu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1090E1FCFD;
	Thu,  5 Jun 2025 14:23:21 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 72A5B137FE;
	Thu,  5 Jun 2025 14:23:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CEI9GVioQWipRwAAD6G6ig
	(envelope-from <osalvador@suse.de>); Thu, 05 Jun 2025 14:23:20 +0000
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
Subject: [PATCH v5 09/10] mm,mempolicy: Use node-notifier instead of memory-notifier
Date: Thu,  5 Jun 2025 16:23:00 +0200
Message-ID: <20250605142305.244465-10-osalvador@suse.de>
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
X-Rspamd-Queue-Id: 1090E1FCFD
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Score: -4.00

mempolicy is only concerned when a numa node changes its memory state,
because it needs to take this node into account for the auto-weighted
memory policy system.
So stop using the memory notifier and use the new numa node notifer
instead.

Signed-off-by: Oscar Salvador <osalvador@suse.de>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
---
 mm/mempolicy.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index 72fd72e156b1..1b87628f3cfc 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -3793,20 +3793,20 @@ static int wi_node_notifier(struct notifier_block *nb,
 			       unsigned long action, void *data)
 {
 	int err;
-	struct memory_notify *arg = data;
-	int nid = arg->status_change_nid;
+	struct node_notify *arg = data;
+	int nid = arg->nid;
 
 	if (nid < 0)
 		return NOTIFY_OK;
 
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
@@ -3845,7 +3845,7 @@ static int __init add_weighted_interleave_group(struct kobject *mempolicy_kobj)
 		}
 	}
 
-	hotplug_memory_notifier(wi_node_notifier, DEFAULT_CALLBACK_PRI);
+	hotplug_node_notifier(wi_node_notifier, DEFAULT_CALLBACK_PRI);
 	return 0;
 
 err_cleanup_kobj:
-- 
2.49.0

