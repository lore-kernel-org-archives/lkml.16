Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89E8188734
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 14:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749133430; cv=none; b=t8wIgLzdcWqpJWz+w3qmwzhpGXAPF86Oza6LjWmmO0Ch13hwTy2cXzFVBibmVF2OY2RNq6/jM2X9NS6bzbFBvrk1zR4xBpkUyVci3uigeBJc23Z/a0rkSsrQKvDsAAVO7sDPhmenHCfR/hM6Bdq8ZXceH757kOu7EgqH3nTDPEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749133430; c=relaxed/simple;
	bh=8JcmyBEdd4dZW0ykXLCuOpg53uPa5lB0AReWtq+k78Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n4p68tp+WCeabQ9t71RSmW1fdckjky8wJMiMV7OLwiZvU7Qeie056gPHs8RWQpmlNkl8xFdDQDsyrpe2gsSf7QR82oste5FwYEa5hBW5TDj4IcuLY7mgvJ9lJ/26/+6mZ91RrT2DOccheNCStHXI0nVSAkI0BxBYThOaTgOrH08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wMJQdNQe; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=M2tk8Jzw; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wMJQdNQe; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=M2tk8Jzw; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wMJQdNQe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="M2tk8Jzw";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wMJQdNQe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="M2tk8Jzw"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BCEC41FDC9;
	Thu,  5 Jun 2025 14:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749133401; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SmSyjhZyv9opvDAxMx9rc8iOlerhOsuhbkuJ00p6FnE=;
	b=wMJQdNQe2CHkW3QhzHzBnRYpS6r79wY6Pzjenus1EwRVLCfJUnO6VIwHrNUhU5LymiO4Fg
	Ym85LVtpiJdusifKnEB8uQPfGD/x80AcyEEsrMZCOsgg0EUiRCEwLjJNCOHFeRewkORAiQ
	shAxpREEx6LV5r+wEWl7OoeM80agUvI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749133401;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SmSyjhZyv9opvDAxMx9rc8iOlerhOsuhbkuJ00p6FnE=;
	b=M2tk8Jzw7FwcP9Zi/OpZUDNmqXkw0odqrNWc7yDoFQWfFTjqFZjCwPRTGUglVS4LU/mTJt
	Y5ah8jcpV+DTVCAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749133401; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SmSyjhZyv9opvDAxMx9rc8iOlerhOsuhbkuJ00p6FnE=;
	b=wMJQdNQe2CHkW3QhzHzBnRYpS6r79wY6Pzjenus1EwRVLCfJUnO6VIwHrNUhU5LymiO4Fg
	Ym85LVtpiJdusifKnEB8uQPfGD/x80AcyEEsrMZCOsgg0EUiRCEwLjJNCOHFeRewkORAiQ
	shAxpREEx6LV5r+wEWl7OoeM80agUvI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749133401;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SmSyjhZyv9opvDAxMx9rc8iOlerhOsuhbkuJ00p6FnE=;
	b=M2tk8Jzw7FwcP9Zi/OpZUDNmqXkw0odqrNWc7yDoFQWfFTjqFZjCwPRTGUglVS4LU/mTJt
	Y5ah8jcpV+DTVCAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 23A81137FE;
	Thu,  5 Jun 2025 14:23:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gPv7BVmoQWipRwAAD6G6ig
	(envelope-from <osalvador@suse.de>); Thu, 05 Jun 2025 14:23:21 +0000
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
Subject: [PATCH v5 10/10] mm,memory_hotplug: Rename status_change_nid parameter in memory_notify
Date: Thu,  5 Jun 2025 16:23:01 +0200
Message-ID: <20250605142305.244465-11-osalvador@suse.de>
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
X-Spamd-Result: default: False [-5.30 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,suse.cz,huawei.com,oracle.com,sk.com,gmail.com,kvack.org,vger.kernel.org,suse.de];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,suse.cz:email,imap1.dmz-prg2.suse.org:helo,oracle.com:email];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_RATELIMIT(0.00)[to_ip_from(RLsc83pr41xu6y1i6mw9yajrf5)];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -5.30

The 'status_change_nid' field was used to track changes in the memory
state of a numa node, but that funcionality has been decoupled from
memory_notify and moved to node_notify.
Current consumers of memory_notify are only interested in which node the
memory we are adding belongs to, so rename current 'status_change_nid'
to 'nid'.

Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
Signed-off-by: Oscar Salvador <osalvador@suse.de>
---
 Documentation/core-api/memory-hotplug.rst |  9 ++-------
 include/linux/memory.h                    |  2 +-
 mm/memory_hotplug.c                       |  4 ++--
 mm/page_ext.c                             | 12 +-----------
 4 files changed, 6 insertions(+), 21 deletions(-)

diff --git a/Documentation/core-api/memory-hotplug.rst b/Documentation/core-api/memory-hotplug.rst
index b19c3be7437d..97efb7b651ac 100644
--- a/Documentation/core-api/memory-hotplug.rst
+++ b/Documentation/core-api/memory-hotplug.rst
@@ -59,17 +59,12 @@ The third argument (arg) passes a pointer of struct memory_notify::
 	struct memory_notify {
 		unsigned long start_pfn;
 		unsigned long nr_pages;
-		int status_change_nid;
+		int nid;
 	}
 
 - start_pfn is start_pfn of online/offline memory.
 - nr_pages is # of pages of online/offline memory.
-- status_change_nid is set node id when N_MEMORY of nodemask is (will be)
-  set/clear. It means a new(memoryless) node gets new memory by online and a
-  node loses all memory. If this is -1, then nodemask status is not changed.
-
-  If status_changed_nid* >= 0, callback should create/discard structures for the
-  node if necessary.
+- nid is set to the node id, where the memory we are adding or removing belongs to.
 
 The callback routine shall return one of the values
 NOTIFY_DONE, NOTIFY_OK, NOTIFY_BAD, NOTIFY_STOP
diff --git a/include/linux/memory.h b/include/linux/memory.h
index a9ccd6579422..918c65ecf299 100644
--- a/include/linux/memory.h
+++ b/include/linux/memory.h
@@ -109,7 +109,7 @@ struct memory_notify {
 	unsigned long altmap_nr_pages;
 	unsigned long start_pfn;
 	unsigned long nr_pages;
-	int status_change_nid;
+	int nid;
 };
 
 struct notifier_block;
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 0550f3061fc4..bccbc02ed122 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1186,7 +1186,7 @@ int online_pages(unsigned long pfn, unsigned long nr_pages,
 
 	mem_arg.start_pfn = pfn;
 	mem_arg.nr_pages = nr_pages;
-	mem_arg.status_change_nid = node_arg.nid;
+	mem_arg.nid = node_arg.nid;
 	cancel_mem_notifier_on_err = true;
 	ret = memory_notify(MEM_GOING_ONLINE, &mem_arg);
 	ret = notifier_to_errno(ret);
@@ -1987,7 +1987,7 @@ int offline_pages(unsigned long start_pfn, unsigned long nr_pages,
 
 	mem_arg.start_pfn = start_pfn;
 	mem_arg.nr_pages = nr_pages;
-	mem_arg.status_change_nid = node_arg.nid;
+	mem_arg.nid = node_arg.nid;
 	cancel_mem_notifier_on_err = true;
 	ret = memory_notify(MEM_GOING_OFFLINE, &mem_arg);
 	ret = notifier_to_errno(ret);
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

