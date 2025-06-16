Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656862BEFE3
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 13:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750081944; cv=none; b=jHnQt16KTEOE/+DSLM442eU96+wo6PKvdj6UlRv+dej2sX2FjJ8SLMLX9Iyk1zkWdVUGzeisoNIh8mb0lUytN6ieCI0Eu3hyFAWSaQzCznZRYgJvZI4DAvJ21TZFDOr6wZQrhMOJ0B5i/J7Qg32I4w8X8e8z+vTUVqqYDxsPdjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750081944; c=relaxed/simple;
	bh=4KH99VIBsnsLVdTqZJ7pNJiCkM3l4vKyK80kN9yLpF8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lG/5W57K7bQ5dWncerUTmaZ09fEaZTAxDPW2y1Im3H36cFkOn2Pq0Zm4XMM4TU2+7oTl8vkB/FDHSsgmRMmTK9tcmAuqBCUZUp/SxeAK4yUwbUNLL0Vorn8JbccpsVTpDQCHUvL2wnbBnpaA8nbnYgnprQEnCQGYS+lscaZVGik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2SqeeJ2E; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Km2htEXh; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RefMszHG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=L6gyUo74; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2SqeeJ2E";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Km2htEXh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RefMszHG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="L6gyUo74"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EA1D81F79E;
	Mon, 16 Jun 2025 13:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750081940; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=0H5sJEQTNH6pdHCRC2W0QAK3qcWeEKODSAn2wH3RU9E=;
	b=2SqeeJ2EgPnER3E56SO5DMf3jGJhX4GHIWrUr5tbCqvK1EJGiaazkziFwKYSbddd+b02hn
	1IfyzNkDv71BsuNxAe/00CKptnzx3H9Sh6Upax6MHtRfGL1G/d/g3mS9PBLTSdJ0AuWBz+
	TFugFQkNDUsqaHKaDcTqqWOXKItT0Pw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750081940;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=0H5sJEQTNH6pdHCRC2W0QAK3qcWeEKODSAn2wH3RU9E=;
	b=Km2htEXhDoywK6f0n0u/x6/hsR9cygDivSNDKXkpm3i7oxSVPxfUjjMWSfDO2CMWnRUI+c
	OwHxtI2+VakfAlAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=RefMszHG;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=L6gyUo74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750081935; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=0H5sJEQTNH6pdHCRC2W0QAK3qcWeEKODSAn2wH3RU9E=;
	b=RefMszHGaMUpdON/ea1sHe08UwrQi5I8v7vO0mSYpz1OwPDDY75reMSdm30PWPLS5hrEX/
	+EFOrzDrAja2CsgbnPYm8Bsl04ag8vhb2hXT2XckgNVW/Xd972sst9bvi6YNyInfhFRNpy
	+wKGY1dYMxhJs9uc0zCiGqntNUB9OU8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750081935;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=0H5sJEQTNH6pdHCRC2W0QAK3qcWeEKODSAn2wH3RU9E=;
	b=L6gyUo74f4jDZ6TvNi0XHJVFbtrrqJ6a1W+274fPkWCG0gZDxxteMRk3nozRloobWGJ9CH
	O6zVJnclZa9a6/Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5EE4713A6B;
	Mon, 16 Jun 2025 13:52:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kwwZFIohUGhHLwAAD6G6ig
	(envelope-from <osalvador@suse.de>); Mon, 16 Jun 2025 13:52:10 +0000
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
Subject: [PATCH v7 00/11] Implement numa node notifier
Date: Mon, 16 Jun 2025 15:51:43 +0200
Message-ID: <20250616135158.450136-1-osalvador@suse.de>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: EA1D81F79E
X-Rspamd-Action: no action
X-Spam-Flag: NO
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
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,suse.cz,huawei.com,oracle.com,sk.com,gmail.com,kvack.org,vger.kernel.org,suse.de];
	RCVD_COUNT_TWO(0.00)[2];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -1.51
X-Spam-Level: 

 v6 -> v7:
   - Split previous patch#10 in two, one for page_ext
     and the other to drop status_change_nid (per David)
   - Implement feedback on simplifying previous cancel_on_*
     notifiers and better document the fact that we consumers
     can get called on _CANCEL_* actions before having been called
     for previous actions (per David)
   - Add Acks-by

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

Oscar Salvador (11):
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
  mm,page_ext: Derive the node from the pfn
  mm,memory_hotplug: Drop status_change_nid parameter from memory_notify

 Documentation/core-api/memory-hotplug.rst     |  91 +++++++++--
 .../zh_CN/core-api/memory-hotplug.rst         |   3 -
 drivers/acpi/numa/hmat.c                      |   8 +-
 drivers/base/node.c                           |  21 +++
 drivers/cxl/core/region.c                     |  16 +-
 drivers/cxl/cxl.h                             |   4 +-
 include/linux/memory.h                        |   2 -
 include/linux/node.h                          |  40 +++++
 kernel/cgroup/cpuset.c                        |   2 +-
 mm/memory-tiers.c                             |  19 +--
 mm/memory_hotplug.c                           | 152 +++++++-----------
 mm/mempolicy.c                                |  13 +-
 mm/page_ext.c                                 |  17 +-
 mm/slub.c                                     |  60 ++-----
 14 files changed, 243 insertions(+), 205 deletions(-)

-- 
2.49.0

