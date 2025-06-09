Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5332505CE
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 09:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749460972; cv=none; b=YUoeawmQBqdNj8lg3QZSMd8kiq2vfphTeZoeBrKIXFMfYzqR/FZM2bABk0TM6yNflfWbcykiiX5aFeur1QX6llwMZ805+ljuObhsSRjvbxdRbNHqS/Yzh1lt9Lz3mJM+g41FWqZYdGaDS0O6xYQudZ0kiVMZjxZiVThqzAwyA1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749460972; c=relaxed/simple;
	bh=rCnI36XdPxyKeIkHutEl1n+fr6A8Q+YRwwDPWUv/qWY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HKEVutMiKJeRIMwjvR+YyPp8kk5P67fFBnmMRb7D2aexzk7gjlMJ+OXiCTF6RlMuzFLyHvkv5Az2cxgmqQ285FSl7gl86RTGCKW+q39pGUL+l93hSOAze02HFt4pqa1oSimPCV7uO8tB5DMa/JsvDWbpqTduN3Vp+KelidH/qQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=N5REsE0V; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bt0mh6xx; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=N5REsE0V; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bt0mh6xx; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="N5REsE0V";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bt0mh6xx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="N5REsE0V";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bt0mh6xx"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9A0CF211AA;
	Mon,  9 Jun 2025 09:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749460927; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sv3IrfTkUH21zkbZkzycuFTk5KiQqrt00dQluV1en5c=;
	b=N5REsE0VlDmSF69f4yuagNbSUjfoxGziPRWs66Hdn5LE2xzyk+jdecvzh1cRLi9I/5i3pU
	3S5mv9Yg2vyEYCi/Xcmr/0U+dYURmSPIFnzwbOzyjGcJ1lVy/D+HSCA+M22mtvEEup27TV
	ytIYvWl+IUixVm7JCxdxM3XvPbLo5is=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749460927;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sv3IrfTkUH21zkbZkzycuFTk5KiQqrt00dQluV1en5c=;
	b=bt0mh6xxGVgV14xowow5pGvbWt2oouPfTXG9QIDckmdEbrTa7T0rPF5wJOb4IJEZutjJi0
	Ltuwc3rWIdM2PyDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749460927; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sv3IrfTkUH21zkbZkzycuFTk5KiQqrt00dQluV1en5c=;
	b=N5REsE0VlDmSF69f4yuagNbSUjfoxGziPRWs66Hdn5LE2xzyk+jdecvzh1cRLi9I/5i3pU
	3S5mv9Yg2vyEYCi/Xcmr/0U+dYURmSPIFnzwbOzyjGcJ1lVy/D+HSCA+M22mtvEEup27TV
	ytIYvWl+IUixVm7JCxdxM3XvPbLo5is=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749460927;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sv3IrfTkUH21zkbZkzycuFTk5KiQqrt00dQluV1en5c=;
	b=bt0mh6xxGVgV14xowow5pGvbWt2oouPfTXG9QIDckmdEbrTa7T0rPF5wJOb4IJEZutjJi0
	Ltuwc3rWIdM2PyDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F3F6F137FE;
	Mon,  9 Jun 2025 09:22:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6DHGOL6nRmjJGAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Mon, 09 Jun 2025 09:22:06 +0000
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
Subject: [PATCH v6 10/10] mm,memory_hotplug: Drop status_change_nid parameter from memory_notify
Date: Mon,  9 Jun 2025 11:21:47 +0200
Message-ID: <20250609092149.312114-11-osalvador@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email,suse.cz:email];
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

The 'status_change_nid' field was used to track changes in the memory
state of a numa node, but that funcionality has been decoupled from
memory_notify and moved to node_notify.
Current consumers of memory_notify are only interested in which node the
memory we are adding belongs to, but we can derive the nid from the pfn
because we call move_pfn_range_to_zone(), which sets the node in the page
via __init_single_page(), before calling in any memory notifier.

Drop the 'status_change_nid' parameter from 'memory_notify' struct and update documentation
accordingly.

Suggested-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
Signed-off-by: Oscar Salvador <osalvador@suse.de>
---
 Documentation/core-api/memory-hotplug.rst |  7 -------
 include/linux/memory.h                    |  1 -
 mm/memory_hotplug.c                       |  2 --
 mm/page_ext.c                             | 16 +++-------------
 4 files changed, 3 insertions(+), 23 deletions(-)

diff --git a/Documentation/core-api/memory-hotplug.rst b/Documentation/core-api/memory-hotplug.rst
index b19c3be7437d..74897713c4f8 100644
--- a/Documentation/core-api/memory-hotplug.rst
+++ b/Documentation/core-api/memory-hotplug.rst
@@ -59,17 +59,10 @@ The third argument (arg) passes a pointer of struct memory_notify::
 	struct memory_notify {
 		unsigned long start_pfn;
 		unsigned long nr_pages;
-		int status_change_nid;
 	}
 
 - start_pfn is start_pfn of online/offline memory.
 - nr_pages is # of pages of online/offline memory.
-- status_change_nid is set node id when N_MEMORY of nodemask is (will be)
-  set/clear. It means a new(memoryless) node gets new memory by online and a
-  node loses all memory. If this is -1, then nodemask status is not changed.
-
-  If status_changed_nid* >= 0, callback should create/discard structures for the
-  node if necessary.
 
 The callback routine shall return one of the values
 NOTIFY_DONE, NOTIFY_OK, NOTIFY_BAD, NOTIFY_STOP
diff --git a/include/linux/memory.h b/include/linux/memory.h
index a9ccd6579422..de8b898ada3f 100644
--- a/include/linux/memory.h
+++ b/include/linux/memory.h
@@ -109,7 +109,6 @@ struct memory_notify {
 	unsigned long altmap_nr_pages;
 	unsigned long start_pfn;
 	unsigned long nr_pages;
-	int status_change_nid;
 };
 
 struct notifier_block;
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 0550f3061fc4..07d7bdb65761 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1186,7 +1186,6 @@ int online_pages(unsigned long pfn, unsigned long nr_pages,
 
 	mem_arg.start_pfn = pfn;
 	mem_arg.nr_pages = nr_pages;
-	mem_arg.status_change_nid = node_arg.nid;
 	cancel_mem_notifier_on_err = true;
 	ret = memory_notify(MEM_GOING_ONLINE, &mem_arg);
 	ret = notifier_to_errno(ret);
@@ -1987,7 +1986,6 @@ int offline_pages(unsigned long start_pfn, unsigned long nr_pages,
 
 	mem_arg.start_pfn = start_pfn;
 	mem_arg.nr_pages = nr_pages;
-	mem_arg.status_change_nid = node_arg.nid;
 	cancel_mem_notifier_on_err = true;
 	ret = memory_notify(MEM_GOING_OFFLINE, &mem_arg);
 	ret = notifier_to_errno(ret);
diff --git a/mm/page_ext.c b/mm/page_ext.c
index c351fdfe9e9a..f08353802fa6 100644
--- a/mm/page_ext.c
+++ b/mm/page_ext.c
@@ -369,25 +369,15 @@ static void __invalidate_page_ext(unsigned long pfn)
 }
 
 static int __meminit online_page_ext(unsigned long start_pfn,
-				unsigned long nr_pages,
-				int nid)
+				unsigned long nr_pages)
 {
 	unsigned long start, end, pfn;
 	int fail = 0;
+	int nid = pfn_to_nid(start_pfn);
 
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
+				   mn->nr_pages);
 		break;
 	case MEM_OFFLINE:
 		offline_page_ext(mn->start_pfn,
-- 
2.49.0

