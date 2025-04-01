Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16BB1EF0B1
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 09:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743499665; cv=none; b=I2bPc0pdCY93jG9rXJ/8dNkBF9+qNc4xLxRm1r2YiuBg29aUyrEIb765f8TwTSU30tw4vxjnO8ziREadHgUYOXzJYXc8nb7ZethoFOhD8E+g5KK5Gvz5Rh3CyVh0MqsBzT3YgZZzb1fWsJ2dfhJklRl2ET9f9z4L1NVWUNMANr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743499665; c=relaxed/simple;
	bh=6sHvaKhEiMzck8YhRZwbUktP2VvUflF+Mtoy5zKtl9g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lDVPdVXIptd+P3CWMCP9yqnL1zZha1WEdnABkm8c1LrDafRmAy7QNMuwlR+AXJiomvhXpJFClMpPghjVZg9CcNxRCfMRJ/AxSkTGcts9HQRGLalNt+W+KZjton/kQDntfA3eo1VUTmFO8xSQRZxSe8PKa6cyo+FjGFTBWiQk3XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xN6VL7l3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7blGqOUv; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xN6VL7l3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7blGqOUv; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xN6VL7l3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7blGqOUv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xN6VL7l3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7blGqOUv"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C1CD621189;
	Tue,  1 Apr 2025 09:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743499657; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=czY8Ikj4+P6N/A2ZD53YGUbiampkq/ZY/cKANaTlIWY=;
	b=xN6VL7l3V3TkZcNeC+qr2aF9Q1Fw86ZFgXHRkB7zMNDvwZ7FiDpy4fYzdOZMmBCPVS2BwQ
	y3tbkJWe3h4G9B2v3ATsl2hE3KWeXkNWWZ61ssPYaDiTGozuyjWcJekkfXtKPVHny/STpL
	+xIOOub6kALuQBHxZGqghUltzGqb76w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743499657;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=czY8Ikj4+P6N/A2ZD53YGUbiampkq/ZY/cKANaTlIWY=;
	b=7blGqOUv+NwFyNdBkk73FxHbPAYT6RO3YZitrGczsryyfceUqylqic29t2MxzoLWMv8QC7
	0a4wk1oer25v6pCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743499657; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=czY8Ikj4+P6N/A2ZD53YGUbiampkq/ZY/cKANaTlIWY=;
	b=xN6VL7l3V3TkZcNeC+qr2aF9Q1Fw86ZFgXHRkB7zMNDvwZ7FiDpy4fYzdOZMmBCPVS2BwQ
	y3tbkJWe3h4G9B2v3ATsl2hE3KWeXkNWWZ61ssPYaDiTGozuyjWcJekkfXtKPVHny/STpL
	+xIOOub6kALuQBHxZGqghUltzGqb76w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743499657;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=czY8Ikj4+P6N/A2ZD53YGUbiampkq/ZY/cKANaTlIWY=;
	b=7blGqOUv+NwFyNdBkk73FxHbPAYT6RO3YZitrGczsryyfceUqylqic29t2MxzoLWMv8QC7
	0a4wk1oer25v6pCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 33DAD13691;
	Tue,  1 Apr 2025 09:27:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kFHxCYmx62cnfwAAD6G6ig
	(envelope-from <osalvador@suse.de>); Tue, 01 Apr 2025 09:27:37 +0000
From: Oscar Salvador <osalvador@suse.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Vlastimil Babka <vbabka@suse.cz>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>,
	mkoutny@suse.com,
	Dan Williams <dan.j.williams@intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Oscar Salvador <osalvador@suse.de>
Subject: [PATCH 2/2] mm,memory_hotplug: Replace status_change_nid parameter in memory_notify
Date: Tue,  1 Apr 2025 11:27:16 +0200
Message-ID: <20250401092716.537512-3-osalvador@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250401092716.537512-1-osalvador@suse.de>
References: <20250401092716.537512-1-osalvador@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.30
X-Spamd-Result: default: False [-1.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email];
	FREEMAIL_CC(0.00)[redhat.com,kvack.org,vger.kernel.org,suse.cz,gmail.com,suse.com,intel.com,huawei.com,suse.de];
	TAGGED_RCPT(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Level: 

memory notify consumers are only interested in which node the memory we
are adding belongs to, so replace current status_change_nid{_normal} fields
with only one that specifies the node.

Signed-off-by: Oscar Salvador <osalvador@suse.de>
---
 include/linux/memory.h |  3 +--
 mm/memory_hotplug.c    |  6 ++----
 mm/page_ext.c          | 12 +-----------
 3 files changed, 4 insertions(+), 17 deletions(-)

diff --git a/include/linux/memory.h b/include/linux/memory.h
index 1d814dfbb8a8..4d8884578a1a 100644
--- a/include/linux/memory.h
+++ b/include/linux/memory.h
@@ -117,8 +117,7 @@ struct memory_notify {
 	unsigned long altmap_nr_pages;
 	unsigned long start_pfn;
 	unsigned long nr_pages;
-	int status_change_nid_normal;
-	int status_change_nid;
+	int nid;
 };
 
 struct node_notify {
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 4bb9ff282ec9..185d799c79e2 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1198,6 +1198,7 @@ int online_pages(unsigned long pfn, unsigned long nr_pages,
 
 	mem_arg.start_pfn = pfn;
 	mem_arg.nr_pages = nr_pages;
+	mem_arg.nid = nid;
 	node_states_check_changes_online(nr_pages, zone, &node_arg);
 
 	if (node_arg.status_change_nid >= 0) {
@@ -1210,8 +1211,6 @@ int online_pages(unsigned long pfn, unsigned long nr_pages,
 	}
 
 	cancel_mem_notifier_on_err = true;
-	mem_arg.status_change_nid = node_arg.status_change_nid;
-	mem_arg.status_change_nid_normal = node_arg.status_change_nid_normal;
 	ret = memory_notify(MEM_GOING_ONLINE, &mem_arg);
 	ret = notifier_to_errno(ret);
 	if (ret)
@@ -2050,6 +2049,7 @@ int offline_pages(unsigned long start_pfn, unsigned long nr_pages,
 
 	mem_arg.start_pfn = start_pfn;
 	mem_arg.nr_pages = nr_pages;
+	mem_arg.nid = node;
 	node_states_check_changes_offline(nr_pages, zone, &node_arg);
 
 	if (node_arg.status_change_nid >= 0) {
@@ -2061,8 +2061,6 @@ int offline_pages(unsigned long start_pfn, unsigned long nr_pages,
 	}
 
 	cancel_mem_notifier_on_err = true;
-	mem_arg.status_change_nid = node_arg.status_change_nid;
-	mem_arg.status_change_nid_normal = node_arg.status_change_nid_normal;
 	ret = memory_notify(MEM_GOING_OFFLINE, &mem_arg);
 	ret = notifier_to_errno(ret);
 	if (ret) {
diff --git a/mm/page_ext.c b/mm/page_ext.c
index c351fdfe9e9a..477e6f24b7ab 100644
--- a/mm/page_ext.c
+++ b/mm/page_ext.c
@@ -378,16 +378,6 @@ static int __meminit online_page_ext(unsigned long start_pfn,
 	start = SECTION_ALIGN_DOWN(start_pfn);
 	end = SECTION_ALIGN_UP(start_pfn + nr_pages);
 
-	if (nid == NUMA_NO_NODE) {
-		/*
-		 * In this case, "nid" already exists and contains valid memory.
-		 * "start_pfn" passed to us is a pfn which is an arg for
-		 * online__pages(), and start_pfn should exist.
-		 */
-		nid = pfn_to_nid(start_pfn);
-		VM_BUG_ON(!node_online(nid));
-	}
-
 	for (pfn = start; !fail && pfn < end; pfn += PAGES_PER_SECTION)
 		fail = init_section_page_ext(pfn, nid);
 	if (!fail)
@@ -436,7 +426,7 @@ static int __meminit page_ext_callback(struct notifier_block *self,
 	switch (action) {
 	case MEM_GOING_ONLINE:
 		ret = online_page_ext(mn->start_pfn,
-				   mn->nr_pages, mn->status_change_nid);
+				   mn->nr_pages, mn->nid);
 		break;
 	case MEM_OFFLINE:
 		offline_page_ext(mn->start_pfn,
-- 
2.49.0

