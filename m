Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70F02BF018
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 13:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750081951; cv=none; b=k78dgQ3/PzapE0aLGeeeqoZhyE7VJ3HeE8CWoBDTk62nQa9woZ048ZLJQpr+HEHNM8EmY9aTnpGBR0/jSjyoYe1sFWQy1tge8p0ZIH8vgft3mkMUP2Snz91CeMfvd7x6wwULPTBzRGO84sEctBOF/drHsWLPmgJDxQjHytAU7SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750081951; c=relaxed/simple;
	bh=NuvAG5Ic7stlgpTDpW1Ft+SUtgwCL1O/JOF3GB6Clf0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T84n8feMrIlFOuqKmX8IBwmn10g7cEV97NX8VVnUP5+q2BifEcQgz+8dL8wfy/Lu78lUXHhbNzf5XCpqHHnWvMpSxBZFCeIWOVWtInDn+i4/5+iPhNC8v8fcNKhNIupPVctcHwtruJS9fIcJnPR3lnHpE9DFmsbwjplUXJbVDjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RbZwnZZz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=c7ga4orI; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RbZwnZZz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=c7ga4orI; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RbZwnZZz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="c7ga4orI";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RbZwnZZz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="c7ga4orI"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 82C51211E8;
	Mon, 16 Jun 2025 13:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750081943; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QwIgB06OxaspRxHAY+9bd+ehKx+2dZwQV4n7zKbdfq8=;
	b=RbZwnZZzNxkdmyLx+iPMvU+wPqlL8I9WR+GrFYz3KH2F5G98PiQhcRzc1BBIq0p8fxNgQQ
	9Un/o6oOx+znwKumCcAcuZg70yuR8fyD5U8HsYMvhUgUVncy4uNz2Ie77r6wLH0thQjwpw
	NfEwVl+qwBqo+TgkkUQaBAW5Q+nhbCM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750081943;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QwIgB06OxaspRxHAY+9bd+ehKx+2dZwQV4n7zKbdfq8=;
	b=c7ga4orIVC00MD6dDsTpwW45tgdPIc7C2BBRF+sr7zCmBipwX/EhJPJbUcUdjyqXB+FuUf
	xGudF2PXBL62RtBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750081943; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QwIgB06OxaspRxHAY+9bd+ehKx+2dZwQV4n7zKbdfq8=;
	b=RbZwnZZzNxkdmyLx+iPMvU+wPqlL8I9WR+GrFYz3KH2F5G98PiQhcRzc1BBIq0p8fxNgQQ
	9Un/o6oOx+znwKumCcAcuZg70yuR8fyD5U8HsYMvhUgUVncy4uNz2Ie77r6wLH0thQjwpw
	NfEwVl+qwBqo+TgkkUQaBAW5Q+nhbCM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750081943;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QwIgB06OxaspRxHAY+9bd+ehKx+2dZwQV4n7zKbdfq8=;
	b=c7ga4orIVC00MD6dDsTpwW45tgdPIc7C2BBRF+sr7zCmBipwX/EhJPJbUcUdjyqXB+FuUf
	xGudF2PXBL62RtBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 47F1E13AF1;
	Mon, 16 Jun 2025 13:52:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ePvhDpEhUGhHLwAAD6G6ig
	(envelope-from <osalvador@suse.de>); Mon, 16 Jun 2025 13:52:17 +0000
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
Subject: [PATCH v7 11/11] mm,memory_hotplug: Drop status_change_nid parameter from memory_notify
Date: Mon, 16 Jun 2025 15:51:54 +0200
Message-ID: <20250616135158.450136-12-osalvador@suse.de>
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
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,suse.cz,huawei.com,oracle.com,sk.com,gmail.com,kvack.org,vger.kernel.org,suse.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	R_RATELIMIT(0.00)[to_ip_from(RLsc83pr41xu6y1i6mw9yajrf5)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -1.30

There no users left of status_change_nid, so drop it from memory_notify
struct.

Suggested-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Oscar Salvador <osalvador@suse.de>
Acked-by: David Hildenbrand <david@redhat.com>
---
 Documentation/core-api/memory-hotplug.rst | 7 -------
 include/linux/memory.h                    | 1 -
 mm/memory_hotplug.c                       | 4 ----
 3 files changed, 12 deletions(-)

diff --git a/Documentation/core-api/memory-hotplug.rst b/Documentation/core-api/memory-hotplug.rst
index fb84e78968b2..8fc97c2379de 100644
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
 
 It is possible to get notified for MEM_CANCEL_ONLINE without having been notified
 for MEM_GOING_ONLINE, and the same applies to MEM_CANCEL_OFFLINE and
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
index e8ccfe4cada2..bfaa570c0685 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1153,7 +1153,6 @@ int online_pages(unsigned long pfn, unsigned long nr_pages,
 	struct memory_notify mem_arg = {
 		.start_pfn = pfn,
 		.nr_pages = nr_pages,
-		.status_change_nid = NUMA_NO_NODE,
 	};
 	struct node_notify node_arg = {
 		.nid = NUMA_NO_NODE,
@@ -1181,7 +1180,6 @@ int online_pages(unsigned long pfn, unsigned long nr_pages,
 	if (!node_state(nid, N_MEMORY)) {
 		/* Adding memory to the node for the first time */
 		node_arg.nid = nid;
-		mem_arg.status_change_nid = nid;
 		ret = node_notify(NODE_ADDING_FIRST_MEMORY, &node_arg);
 		ret = notifier_to_errno(ret);
 		if (ret)
@@ -1905,7 +1903,6 @@ int offline_pages(unsigned long start_pfn, unsigned long nr_pages,
 	struct memory_notify mem_arg = {
 		.start_pfn = start_pfn,
 		.nr_pages = nr_pages,
-		.status_change_nid = NUMA_NO_NODE,
 	};
 	struct node_notify node_arg = {
 		.nid = NUMA_NO_NODE,
@@ -1976,7 +1973,6 @@ int offline_pages(unsigned long start_pfn, unsigned long nr_pages,
 	 */
 	if (nr_pages >= pgdat->node_present_pages) {
 		node_arg.nid = node;
-		mem_arg.status_change_nid = node;
 		ret = node_notify(NODE_REMOVING_LAST_MEMORY, &node_arg);
 		ret = notifier_to_errno(ret);
 		if (ret)
-- 
2.49.0

