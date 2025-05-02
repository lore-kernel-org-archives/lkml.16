Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7533822AE7B
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 08:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746175022; cv=none; b=hvDprIm85mH+3+YznI9VltYF8Hip4ZbW1O3ANkbXLt2oyREi3IJ+RllwqnPRZd1Q8qZ9KiGiZ1EA7VowFTkf+6mtAmX1YAzOqD9NLrV9b3k0yfyQ7E5kac526BV3dXMhf4+DdiG6d9ExsyGTtQAJMlfa70gIOh7+NqqL7xaa4oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746175022; c=relaxed/simple;
	bh=zNUe0Pj5dkyMuxu1Q6WqSp1fT4n1YqCD8YdUazcTFgE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B3nHFgL+pBD9rECDANbdGA/jCBFK/j5Euu7KqeHXlPslKI7pNPVGnmfxZwBgeA6s7jvypMkWEIhh0gmk4flU/74le9mlBBjBybO0MAIOExpPBB0Der0GaziXt0bJTX3zcjmqxra1+TTgkVjmqSwX+iO2KoLEPshnmK7CGTSME2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=E407EIsB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dhTksgVL; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=E407EIsB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dhTksgVL; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="E407EIsB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dhTksgVL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="E407EIsB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dhTksgVL"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 569E01F385;
	Fri,  2 May 2025 08:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746175007; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UDf9u3uKTejLxqlFBo+30RhKdS2KOtzyesZwbietrzs=;
	b=E407EIsBUWip8Z6Cwmgh3Wl2kaa0j7sxZ1hltythl7SUS6D2WT96YDDh9+c9fr40WfOVyo
	3IGv7Q+d7ayql4Zq5GYndUiti11mNpddW0MPMCBf3lMF6orjC2otMELnZ7Msq+IKyMa5SU
	6F5Hhwp0/n40OrGI/Es6L7RP18hYzCM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746175007;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UDf9u3uKTejLxqlFBo+30RhKdS2KOtzyesZwbietrzs=;
	b=dhTksgVL5QO8F9XwJ2/P1tItL1hidLjb2ESMRXIkrtbHg+lsCLhNb5i9aiWrFbrUI2Hj1/
	5BRmW3lq2kX19PCQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=E407EIsB;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=dhTksgVL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746175007; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UDf9u3uKTejLxqlFBo+30RhKdS2KOtzyesZwbietrzs=;
	b=E407EIsBUWip8Z6Cwmgh3Wl2kaa0j7sxZ1hltythl7SUS6D2WT96YDDh9+c9fr40WfOVyo
	3IGv7Q+d7ayql4Zq5GYndUiti11mNpddW0MPMCBf3lMF6orjC2otMELnZ7Msq+IKyMa5SU
	6F5Hhwp0/n40OrGI/Es6L7RP18hYzCM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746175007;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UDf9u3uKTejLxqlFBo+30RhKdS2KOtzyesZwbietrzs=;
	b=dhTksgVL5QO8F9XwJ2/P1tItL1hidLjb2ESMRXIkrtbHg+lsCLhNb5i9aiWrFbrUI2Hj1/
	5BRmW3lq2kX19PCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BF50F1399F;
	Fri,  2 May 2025 08:36:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cJTyKx6EFGhVSwAAD6G6ig
	(envelope-from <osalvador@suse.de>); Fri, 02 May 2025 08:36:46 +0000
From: Oscar Salvador <osalvador@suse.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Vlastimil Babka <vbabka@suse.cz>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Rakie Kim <rakie.kim@sk.com>,
	Oscar Salvador <osalvador@suse.de>,
	Harry Yoo <harry.yoo@oracle.com>
Subject: [PATCH v3 3/3] mm,memory_hotplug: Rename status_change_nid parameter in memory_notify
Date: Fri,  2 May 2025 10:36:24 +0200
Message-ID: <20250502083624.49849-4-osalvador@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250502083624.49849-1-osalvador@suse.de>
References: <20250502083624.49849-1-osalvador@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 569E01F385
X-Spam-Level: 
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
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_CC(0.00)[redhat.com,kvack.org,vger.kernel.org,suse.cz,gmail.com,huawei.com,sk.com,suse.de,oracle.com];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:email,suse.de:email,suse.de:dkim,suse.de:mid,suse.cz:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -1.51
X-Spam-Flag: NO

The 'status_change_nid' field was used to track changes in the memory
state of a numa node, but that funcionality has been decoupled from
memory_notify and moved to node_notify.
Current consumers of memory_notify are only interested in which node the
memory we are adding belongs to, so rename current 'status_change_nid'
to 'nid'.

Signed-off-by: Oscar Salvador <osalvador@suse.de>
Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
---
 include/linux/memory.h |  2 +-
 mm/memory_hotplug.c    |  4 ++--
 mm/page_ext.c          | 12 +-----------
 3 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/include/linux/memory.h b/include/linux/memory.h
index 8c5c88eaffb3..3c482f189d14 100644
--- a/include/linux/memory.h
+++ b/include/linux/memory.h
@@ -117,7 +117,7 @@ struct memory_notify {
 	unsigned long altmap_nr_pages;
 	unsigned long start_pfn;
 	unsigned long nr_pages;
-	int status_change_nid;
+	int nid;
 };
 
 struct node_notify {
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 777f98326908..9b57b58e88bc 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1192,6 +1192,7 @@ int online_pages(unsigned long pfn, unsigned long nr_pages,
 
 	mem_arg.start_pfn = pfn;
 	mem_arg.nr_pages = nr_pages;
+	mem_arg.nid = nid;
 	node_states_check_changes_online(nr_pages, zone, &node_arg);
 
 	if (node_arg.status_change_nid >= 0) {
@@ -1204,7 +1205,6 @@ int online_pages(unsigned long pfn, unsigned long nr_pages,
 	}
 
 	cancel_mem_notifier_on_err = true;
-	mem_arg.status_change_nid = node_arg.status_change_nid;
 	ret = memory_notify(MEM_GOING_ONLINE, &mem_arg);
 	ret = notifier_to_errno(ret);
 	if (ret)
@@ -2014,6 +2014,7 @@ int offline_pages(unsigned long start_pfn, unsigned long nr_pages,
 
 	mem_arg.start_pfn = start_pfn;
 	mem_arg.nr_pages = nr_pages;
+	mem_arg.nid = node;
 	node_states_check_changes_offline(nr_pages, zone, &node_arg);
 
 	if (node_arg.status_change_nid >= 0) {
@@ -2025,7 +2026,6 @@ int offline_pages(unsigned long start_pfn, unsigned long nr_pages,
 	}
 
 	cancel_mem_notifier_on_err = true;
-	mem_arg.status_change_nid = node_arg.status_change_nid;
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

