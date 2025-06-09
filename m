Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7362517A4
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 09:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749460936; cv=none; b=DqJD7Rdu1yhu30tqDYwrjCUhUe+h7YyUCXuGfAE/k4T1mx2jgWRlWq4ba8yaxng1dDyb609bN4IAPP6J0Vb2TVlQgMa9Hljxgbo7d1b1cjwLbSNsiW0QFwtpHHwe3zun3G78y5iPi+StwXkp39lYkzr4JwsnGu+25A94vOe4SjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749460936; c=relaxed/simple;
	bh=s3YzOzWaTjYxXpa3cQyEUcIg3S8CrnR96BeKw02Caq4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pyx6tV74bUr+bu57aYyVaQuyq8AwWdKP5yHjg/M8pEGGd09IzkOmrQW/Dc3fuI/5GyfWiaZt4GV0zp08I7pzp9zE4hDaT44zkIp9gqR+IivFPUtTd5MiVWymHotRXk4dzEzBgH9WeVwX1reEtkb0y+4KUhK6oy/d2AYA4pH6lkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DWA2Ps0M; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dg1Zauj7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DWA2Ps0M; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dg1Zauj7; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DWA2Ps0M";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dg1Zauj7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DWA2Ps0M";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dg1Zauj7"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DEB25211A5;
	Mon,  9 Jun 2025 09:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749460921; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9ORTOaEJ/0V7ulfpgFNty+PVV14XRbqmPaznEqXnqKg=;
	b=DWA2Ps0Mq8BHtX7URDH0Z1wbj95rxQNYtJVncjbijp4F+PZzn7PCwshiB1MoNSuOVBzJtE
	kvmRLLDO+zSKOPI531hZwQzvXNbhl59QVUaIoigchEBA0zxHdzqy4SKAbQaMFVxmSed7e6
	Sc/KY35fM+aMOk4j/lvjGevjHwAnPUc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749460921;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9ORTOaEJ/0V7ulfpgFNty+PVV14XRbqmPaznEqXnqKg=;
	b=dg1Zauj7HdRyKBqj4WGzVEEunEzKtEMOpU5/c/Xl1eONnYeKbuPmU1ipeJUEhl/n13jBhM
	OqCNauLzmw0vTVBQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=DWA2Ps0M;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=dg1Zauj7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749460921; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9ORTOaEJ/0V7ulfpgFNty+PVV14XRbqmPaznEqXnqKg=;
	b=DWA2Ps0Mq8BHtX7URDH0Z1wbj95rxQNYtJVncjbijp4F+PZzn7PCwshiB1MoNSuOVBzJtE
	kvmRLLDO+zSKOPI531hZwQzvXNbhl59QVUaIoigchEBA0zxHdzqy4SKAbQaMFVxmSed7e6
	Sc/KY35fM+aMOk4j/lvjGevjHwAnPUc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749460921;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9ORTOaEJ/0V7ulfpgFNty+PVV14XRbqmPaznEqXnqKg=;
	b=dg1Zauj7HdRyKBqj4WGzVEEunEzKtEMOpU5/c/Xl1eONnYeKbuPmU1ipeJUEhl/n13jBhM
	OqCNauLzmw0vTVBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 43A16137FE;
	Mon,  9 Jun 2025 09:22:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uPLEDbmnRmjJGAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Mon, 09 Jun 2025 09:22:01 +0000
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
Subject: [PATCH v6 02/10] mm,memory_hotplug: Remove status_change_nid_normal and update documentation
Date: Mon,  9 Jun 2025 11:21:39 +0200
Message-ID: <20250609092149.312114-3-osalvador@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609092149.312114-1-osalvador@suse.de>
References: <20250609092149.312114-1-osalvador@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[redhat.com,suse.cz,huawei.com,oracle.com,sk.com,gmail.com,kvack.org,vger.kernel.org,suse.de];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid,suse.de:email]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: DEB25211A5
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -2.01

Now that the last user of status_change_nid_normal is gone, we can remove it.
Update documentation accordingly.

Signed-off-by: Oscar Salvador <osalvador@suse.de>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
Acked-by: David Hildenbrand <david@redhat.com>
---
 Documentation/core-api/memory-hotplug.rst            |  3 ---
 .../translations/zh_CN/core-api/memory-hotplug.rst   |  3 ---
 include/linux/memory.h                               |  1 -
 mm/memory_hotplug.c                                  | 12 ------------
 4 files changed, 19 deletions(-)

diff --git a/Documentation/core-api/memory-hotplug.rst b/Documentation/core-api/memory-hotplug.rst
index 682259ee633a..d1b8eb9add8a 100644
--- a/Documentation/core-api/memory-hotplug.rst
+++ b/Documentation/core-api/memory-hotplug.rst
@@ -56,14 +56,11 @@ The third argument (arg) passes a pointer of struct memory_notify::
 	struct memory_notify {
 		unsigned long start_pfn;
 		unsigned long nr_pages;
-		int status_change_nid_normal;
 		int status_change_nid;
 	}
 
 - start_pfn is start_pfn of online/offline memory.
 - nr_pages is # of pages of online/offline memory.
-- status_change_nid_normal is set node id when N_NORMAL_MEMORY of nodemask
-  is (will be) set/clear, if this is -1, then nodemask status is not changed.
 - status_change_nid is set node id when N_MEMORY of nodemask is (will be)
   set/clear. It means a new(memoryless) node gets new memory by online and a
   node loses all memory. If this is -1, then nodemask status is not changed.
diff --git a/Documentation/translations/zh_CN/core-api/memory-hotplug.rst b/Documentation/translations/zh_CN/core-api/memory-hotplug.rst
index 9b2841fb9a5f..c2a4122ae221 100644
--- a/Documentation/translations/zh_CN/core-api/memory-hotplug.rst
+++ b/Documentation/translations/zh_CN/core-api/memory-hotplug.rst
@@ -62,7 +62,6 @@ memory_notify结构体的指针::
 	struct memory_notify {
 		unsigned long start_pfn;
 		unsigned long nr_pages;
-		int status_change_nid_normal;
 		int status_change_nid;
 	}
 
@@ -70,8 +69,6 @@ memory_notify结构体的指针::
 
 - nr_pages是在线/离线内存的页数。
 
-- status_change_nid_normal是当nodemask的N_NORMAL_MEMORY被设置/清除时设置节
-  点id，如果是-1，则nodemask状态不改变。
 
 - status_change_nid是当nodemask的N_MEMORY被（将）设置/清除时设置的节点id。这
   意味着一个新的（没上线的）节点通过联机获得新的内存，而一个节点失去了所有的内
diff --git a/include/linux/memory.h b/include/linux/memory.h
index 5ec4e6d209b9..a9ccd6579422 100644
--- a/include/linux/memory.h
+++ b/include/linux/memory.h
@@ -109,7 +109,6 @@ struct memory_notify {
 	unsigned long altmap_nr_pages;
 	unsigned long start_pfn;
 	unsigned long nr_pages;
-	int status_change_nid_normal;
 	int status_change_nid;
 };
 
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index b1caedbade5b..94ae0ca37021 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -706,19 +706,13 @@ static void node_states_check_changes_online(unsigned long nr_pages,
 	int nid = zone_to_nid(zone);
 
 	arg->status_change_nid = NUMA_NO_NODE;
-	arg->status_change_nid_normal = NUMA_NO_NODE;
 
 	if (!node_state(nid, N_MEMORY))
 		arg->status_change_nid = nid;
-	if (zone_idx(zone) <= ZONE_NORMAL && !node_state(nid, N_NORMAL_MEMORY))
-		arg->status_change_nid_normal = nid;
 }
 
 static void node_states_set_node(int node, struct memory_notify *arg)
 {
-	if (arg->status_change_nid_normal >= 0)
-		node_set_state(node, N_NORMAL_MEMORY);
-
 	if (arg->status_change_nid >= 0)
 		node_set_state(node, N_MEMORY);
 }
@@ -1895,7 +1889,6 @@ static void node_states_check_changes_offline(unsigned long nr_pages,
 	enum zone_type zt;
 
 	arg->status_change_nid = NUMA_NO_NODE;
-	arg->status_change_nid_normal = NUMA_NO_NODE;
 
 	/*
 	 * Check whether node_states[N_NORMAL_MEMORY] will be changed.
@@ -1907,8 +1900,6 @@ static void node_states_check_changes_offline(unsigned long nr_pages,
 	 */
 	for (zt = 0; zt <= ZONE_NORMAL; zt++)
 		present_pages += pgdat->node_zones[zt].present_pages;
-	if (zone_idx(zone) <= ZONE_NORMAL && nr_pages >= present_pages)
-		arg->status_change_nid_normal = zone_to_nid(zone);
 
 	/*
 	 * We have accounted the pages from [0..ZONE_NORMAL); ZONE_HIGHMEM
@@ -1927,9 +1918,6 @@ static void node_states_check_changes_offline(unsigned long nr_pages,
 
 static void node_states_clear_node(int node, struct memory_notify *arg)
 {
-	if (arg->status_change_nid_normal >= 0)
-		node_clear_state(node, N_NORMAL_MEMORY);
-
 	if (arg->status_change_nid >= 0)
 		node_clear_state(node, N_MEMORY);
 }
-- 
2.49.0

