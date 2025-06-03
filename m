Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964A622E00E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 11:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748948965; cv=none; b=WPWkQpnvZq88vmWiJbiXJpTaMFP1G1HrI101Yfw4wumQjExj1ggL4TExHMBLMS/iSMH1Yl+F+BWHUPrnTm77aKcI6TbiyHRwj1gnXlA2m4XtIfThb3/m9I8GMXzvaAyHOg1ZeWejulZphBnFZHvimwf83+tQ4pGKrPMD7rnE/HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748948965; c=relaxed/simple;
	bh=z8jUsaPzkE4OUtDOmgUC8AEFwLlqKiJRt9HETEWLI2A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ByBlqKwy0+yRCYRNdLzvfqwbYeL0Opy4QrqBTwr2ghAzfu8d7k1tbIKysoDcE7NBcz3lylZdxSLNHeW6w0W+meO/wtoXaK/0R+7AiiLO4TQuccgaVdY6aOTGb7Q1k7dVBZCZMRnM3HaPeQg2AG2cbr0yTlaY3+xf4dfovsqpHPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eRSudXXo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CfcGZjSk; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eRSudXXo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CfcGZjSk; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eRSudXXo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CfcGZjSk";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eRSudXXo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CfcGZjSk"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5685D21256;
	Tue,  3 Jun 2025 11:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1748948948; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v3T6HW81h0XzS8jybn8Y/92YLvaK8uvlq2un4GuekM0=;
	b=eRSudXXoe/KO53hyguG0vF4zfNUdzckyyxsOvJNaKwUzp7eX1wHjP01HpYiAuIzF30XsBx
	+djvCgTFOBh2GdpBIn5yvhFSVpUyd3fPdhFtYsc6XuXIdQ8bTUa7Z8trmXEtoipgldhKUk
	s2GapSM4mY77bafcKMs+egVwhKcr6io=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1748948948;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v3T6HW81h0XzS8jybn8Y/92YLvaK8uvlq2un4GuekM0=;
	b=CfcGZjSkvc8lkzuLOdCdB5dz3ZEHB3H4XpvVMTpxNYfjYIKRCYHnThj9T78txXil2t8B+U
	Q2z0V0La2aFl1cDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1748948948; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v3T6HW81h0XzS8jybn8Y/92YLvaK8uvlq2un4GuekM0=;
	b=eRSudXXoe/KO53hyguG0vF4zfNUdzckyyxsOvJNaKwUzp7eX1wHjP01HpYiAuIzF30XsBx
	+djvCgTFOBh2GdpBIn5yvhFSVpUyd3fPdhFtYsc6XuXIdQ8bTUa7Z8trmXEtoipgldhKUk
	s2GapSM4mY77bafcKMs+egVwhKcr6io=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1748948948;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v3T6HW81h0XzS8jybn8Y/92YLvaK8uvlq2un4GuekM0=;
	b=CfcGZjSkvc8lkzuLOdCdB5dz3ZEHB3H4XpvVMTpxNYfjYIKRCYHnThj9T78txXil2t8B+U
	Q2z0V0La2aFl1cDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BD6A213AAD;
	Tue,  3 Jun 2025 11:09:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KOd+K9PXPmjfXQAAD6G6ig
	(envelope-from <osalvador@suse.de>); Tue, 03 Jun 2025 11:09:07 +0000
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
Subject: [PATCH v4 3/3] mm,memory_hotplug: Rename status_change_nid parameter in memory_notify
Date: Tue,  3 Jun 2025 13:08:50 +0200
Message-ID: <20250603110850.192912-4-osalvador@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250603110850.192912-1-osalvador@suse.de>
References: <20250603110850.192912-1-osalvador@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo,oracle.com:email];
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
index 777c81cd2943..3a62d90d416d 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1186,7 +1186,7 @@ int online_pages(unsigned long pfn, unsigned long nr_pages,
 	cancel_mem_notifier_on_err = true;
 	mem_arg.start_pfn = pfn;
 	mem_arg.nr_pages = nr_pages;
-	mem_arg.status_change_nid = node_arg.status_change_nid;
+	mem_arg.nid = nid;
 	ret = memory_notify(MEM_GOING_ONLINE, &mem_arg);
 	ret = notifier_to_errno(ret);
 	if (ret)
@@ -1990,7 +1990,7 @@ int offline_pages(unsigned long start_pfn, unsigned long nr_pages,
 	cancel_mem_notifier_on_err = true;
 	mem_arg.start_pfn = start_pfn;
 	mem_arg.nr_pages = nr_pages;
-	mem_arg.status_change_nid = node_arg.status_change_nid;
+	mem_arg.nid = node;
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

