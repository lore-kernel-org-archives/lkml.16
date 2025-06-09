Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35C22512D1
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 09:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749460938; cv=none; b=JgVcJuIGMLLaenOF/eNW1wDBP0nsggQvECFpbjKNYN2nbnWjINCPMZgs6GiQ6msKUhKlM5fGzmAO2WSVUxmzOI499y7x56dcBpZ/WZbLZElKxcxq8kBhhJUbAhJmKxvzK19kislsPIhYUal9pMody57uO7mqpHNmXypC9/SibmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749460938; c=relaxed/simple;
	bh=NpeCk/V7ZJT9DnClrRCw74KEKLlav5Whx9GB8qZR4Yg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nPLrOzKZj2PsyQujBC4ThtyteDJoQkVD0S4WJcZAdKpvNsj8G/H9kYT1+qTQld+0BI7nMp3d+jyYiPbpw5nfrQXcV42NSWVefChbVV1G2bdYP4V3CXc+uxIiC5qAKIJ5S/FF05Pq3Yojtw29+hUgfKBpTxkdW53SKZCJiQCYNcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FI5xKMr1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=f2xe4kLd; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FI5xKMr1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=f2xe4kLd; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FI5xKMr1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="f2xe4kLd";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FI5xKMr1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="f2xe4kLd"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 633BC1F458;
	Mon,  9 Jun 2025 09:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749460925; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Wb8BVZ4TFRrjZdkLso+L1NavvczMsY6uusB63S+JT0=;
	b=FI5xKMr1xYLxgE4S1BTNS6vMqN3WLmHt2i0nrMNQuxnk59HdB6WvgJBjX9uI58jIcztpOP
	dyTiWbUIoa2zaBEM4HJjhty2dD2D8xTQ61aH22M+aO7/1MMvcqNfq69oTAMsap8lXBfk0f
	4g7WkX8p+8gpz/FMOnMMTBUBbQ80N88=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749460925;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Wb8BVZ4TFRrjZdkLso+L1NavvczMsY6uusB63S+JT0=;
	b=f2xe4kLdUWQkjPO8c/xeO3qboObVxciI+KZG3raozSNzrqZ5p6IsLPki2srVbdivkut8Jm
	djLYh8jepCiJEOCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749460925; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Wb8BVZ4TFRrjZdkLso+L1NavvczMsY6uusB63S+JT0=;
	b=FI5xKMr1xYLxgE4S1BTNS6vMqN3WLmHt2i0nrMNQuxnk59HdB6WvgJBjX9uI58jIcztpOP
	dyTiWbUIoa2zaBEM4HJjhty2dD2D8xTQ61aH22M+aO7/1MMvcqNfq69oTAMsap8lXBfk0f
	4g7WkX8p+8gpz/FMOnMMTBUBbQ80N88=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749460925;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Wb8BVZ4TFRrjZdkLso+L1NavvczMsY6uusB63S+JT0=;
	b=f2xe4kLdUWQkjPO8c/xeO3qboObVxciI+KZG3raozSNzrqZ5p6IsLPki2srVbdivkut8Jm
	djLYh8jepCiJEOCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BF96213A85;
	Mon,  9 Jun 2025 09:22:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8HgBLLynRmjJGAAAD6G6ig
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
Subject: [PATCH v6 07/10] drivers,hmat: Use node-notifier instead of memory-notifier
Date: Mon,  9 Jun 2025 11:21:44 +0200
Message-ID: <20250609092149.312114-8-osalvador@suse.de>
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
X-Spam-Flag: NO
X-Spam-Score: -1.30
X-Spamd-Result: default: False [-1.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,suse.cz,huawei.com,oracle.com,sk.com,gmail.com,kvack.org,vger.kernel.org,suse.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	R_RATELIMIT(0.00)[to_ip_from(RLsc83pr41xu6y1i6mw9yajrf5)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Level: 

hmat driver is only concerned when a numa node changes its memory state,
specifically when a numa node with memory comes into play for the first
time, because it will register the memory_targets belonging to that numa
node.
So stop using the memory notifier and use the new numa node notifer
instead.

Signed-off-by: Oscar Salvador <osalvador@suse.de>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
---
 drivers/acpi/numa/hmat.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/acpi/numa/hmat.c b/drivers/acpi/numa/hmat.c
index 9d9052258e92..4958301f5417 100644
--- a/drivers/acpi/numa/hmat.c
+++ b/drivers/acpi/numa/hmat.c
@@ -962,10 +962,10 @@ static int hmat_callback(struct notifier_block *self,
 			 unsigned long action, void *arg)
 {
 	struct memory_target *target;
-	struct memory_notify *mnb = arg;
-	int pxm, nid = mnb->status_change_nid;
+	struct node_notify *nn = arg;
+	int pxm, nid = nn->nid;
 
-	if (nid == NUMA_NO_NODE || action != MEM_ONLINE)
+	if (action != NODE_ADDED_FIRST_MEMORY)
 		return NOTIFY_OK;
 
 	pxm = node_to_pxm(nid);
@@ -1118,7 +1118,7 @@ static __init int hmat_init(void)
 	hmat_register_targets();
 
 	/* Keep the table and structures if the notifier may use them */
-	if (hotplug_memory_notifier(hmat_callback, HMAT_CALLBACK_PRI))
+	if (hotplug_node_notifier(hmat_callback, HMAT_CALLBACK_PRI))
 		goto out_put;
 
 	if (!hmat_set_default_dram_perf())
-- 
2.49.0

