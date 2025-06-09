Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6203E4D8CE
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 09:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749460924; cv=none; b=f0WF+3gM78MtCduQGvVAB2T6F9ZV8mu81aN3AvhDiucWIIFO4D09lejHCLIiMz7ag/mVa8eWN2oJkupjVsj+5GT2p9BACDOjQY4zaDrk7IJXdNqNyx4SOqQi1/6ms7lzMY5wetAkJqqlUFOq0cv3g8I6azUTm9xsHkEOw3T0ZQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749460924; c=relaxed/simple;
	bh=Aq03E66jgE+91MDLt/a1asiri8fsSJtlDxHriBH/PA0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k5LWG/V64z7Ul5loYZUTRQhKeUPyK8WyriDolGNHWsv87U4ebz/C4FJg24H5+5bVozhVaupi5thOVOS/b2UI7YKROU9jLjmSTsirT6OU7ph0bdU1Fj9hVbKYQ0pacxGk3u8qEE8MLzDZ3U/SgRFJK0fHa3iSMvvdvTSIXlcKegU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0Ii7+DoA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4NMfwiIf; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0Ii7+DoA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4NMfwiIf; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0Ii7+DoA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4NMfwiIf";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0Ii7+DoA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4NMfwiIf"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 72E09211A2;
	Mon,  9 Jun 2025 09:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749460920; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=5iPh/zVgzhNT1imKy+Hw6xdYTOZl5DLrhk3qU1VcISY=;
	b=0Ii7+DoAlGCVKSYZbMr0D8sq3Wc2do7tnFW6wPV45jt2nKB6uhx++qLw+jJYORU0f1C82Y
	+Q4vxHUZDVjSxsl7pVIBFGL1nlJFLdpbjBxmFqDgk1vT00IVtHxP2pPQkSuSpFsHC4WILr
	J0ji3pz7p/84DoQDYlpm0KedY8YXlXg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749460920;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=5iPh/zVgzhNT1imKy+Hw6xdYTOZl5DLrhk3qU1VcISY=;
	b=4NMfwiIfpbcv7E0K71XTULE4FkU23pZFyVCGk7A020KCPIX0CoHrauyrYUq2rftvm4Nfdp
	KNloz4HLVDzwMLBQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=0Ii7+DoA;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=4NMfwiIf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749460920; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=5iPh/zVgzhNT1imKy+Hw6xdYTOZl5DLrhk3qU1VcISY=;
	b=0Ii7+DoAlGCVKSYZbMr0D8sq3Wc2do7tnFW6wPV45jt2nKB6uhx++qLw+jJYORU0f1C82Y
	+Q4vxHUZDVjSxsl7pVIBFGL1nlJFLdpbjBxmFqDgk1vT00IVtHxP2pPQkSuSpFsHC4WILr
	J0ji3pz7p/84DoQDYlpm0KedY8YXlXg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749460920;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=5iPh/zVgzhNT1imKy+Hw6xdYTOZl5DLrhk3qU1VcISY=;
	b=4NMfwiIfpbcv7E0K71XTULE4FkU23pZFyVCGk7A020KCPIX0CoHrauyrYUq2rftvm4Nfdp
	KNloz4HLVDzwMLBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C16AD137FE;
	Mon,  9 Jun 2025 09:21:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 3SLcK7enRmjJGAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Mon, 09 Jun 2025 09:21:59 +0000
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
Subject: [PATCH v6 00/10] Implement numa node notifier
Date: Mon,  9 Jun 2025 11:21:37 +0200
Message-ID: <20250609092149.312114-1-osalvador@suse.de>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,suse.cz,huawei.com,oracle.com,sk.com,gmail.com,kvack.org,vger.kernel.org,suse.de];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 72E09211A2
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -1.51

v5 -> v6:
   - Remove redundant checks (per David)
   - Fix build failure
   - Drop 'nid' parameter from memory notify (Per David)
   - Add RB/ACKs-by

v4 -> v5:
   - Split out conversion for different consumers (per David)
   - Renamed node-notifier actions (per David)
   - Added new Documentation for new node-notifier and updated
     the memory-notifier one to reflect the changes
   - Make sure we do not trigger anything when !CONFIG_NUMA (per David)

 v3 -> v4:
   - Fix typos pointed out by Alok Tiwari
   - Further cleanups suggested by Vlastimil
   - Add RBs-by from Vlastimil

 v2 -> v3:
   - Add Suggested-by (David)
   - Replace last N_NORMAL_MEMORY mention in slub (David)
   - Replace the notifier for autoweitght-mempolicy
   - Fix build on !CONFIG_MEMORY_HOTPLUG
 
 v1 -> v2:
   - Remove status_change_nid_normal and the code that
     deals with it (David & Vlastimil)
   - Remove slab_mem_offline_callback (David & Vlastimil)
   - Change the order of canceling the notifiers
     in {online,offline}_pages (Vlastimil)
   - Fix up a couple of whitespaces (Jonathan Cameron)
   - Add RBs-by

Memory notifier is a tool that allow consumers to get notified whenever
memory gets onlined or offlined in the system.
Currently, there are 10 consumers of that, but 5 out of those 10 consumers
are only interested in getting notifications when a numa node changes its
memory state.
That means going from memoryless to memory-aware of vice versa.

Which means that for every {online,offline}_pages operation they get
notified even though the numa node might not have changed its state.
This is suboptimal, and we want to decouple numa node state changes from
memory state changes.

While we are doing this, remove status_change_nid_normal, as the only
current user (slub) does not really need it.
This allows us to further simplify and clean up the code.

The first patch gets rid of status_change_nid_normal in slub.
The second patch implements a numa node notifier that does just that, and have
those consumers register in there, so they get notified only when they are
interested.

The third patch replaces 'status_change_nid{_normal}' fields within
memory_notify with a 'nid', as that is only what we need for memory
notifer and update the only user of it (page_ext).

Consumers that are only interested in numa node states change are:

 - memory-tier
 - slub
 - cpuset
 - hmat
 - cxl
 - autoweight-mempolicy

Oscar Salvador (10):
  mm,slub: Do not special case N_NORMAL nodes for slab_nodes
  mm,memory_hotplug: Remove status_change_nid_normal and update
    documentation
  mm,memory_hotplug: Implement numa node notifier
  mm,slub: Use node-notifier instead of memory-notifier
  mm,memory-tiers: Use node-notifier instead of memory-notifier
  drivers,cxl: Use node-notifier instead of memory-notifier
  drivers,hmat: Use node-notifier instead of memory-notifier
  kernel,cpuset: Use node-notifier instead of memory-notifier
  mm,mempolicy: Use node-notifier instead of memory-notifier
  mm,memory_hotplug: Drop status_change_nid parameter from memory_notify

 Documentation/core-api/memory-hotplug.rst     |  76 ++++++--
 .../zh_CN/core-api/memory-hotplug.rst         |   3 -
 drivers/acpi/numa/hmat.c                      |   8 +-
 drivers/base/node.c                           |  21 +++
 drivers/cxl/core/region.c                     |  16 +-
 drivers/cxl/cxl.h                             |   4 +-
 include/linux/memory.h                        |   2 -
 include/linux/node.h                          |  40 +++++
 kernel/cgroup/cpuset.c                        |   2 +-
 mm/memory-tiers.c                             |  19 +-
 mm/memory_hotplug.c                           | 165 ++++++++----------
 mm/mempolicy.c                                |  13 +-
 mm/page_ext.c                                 |  16 +-
 mm/slub.c                                     |  60 ++-----
 14 files changed, 238 insertions(+), 207 deletions(-)

-- 
2.49.0

