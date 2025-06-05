Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2731A275
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 14:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749133399; cv=none; b=OIjDHUo8mkLXBan+OSVFeLzEZuUZY7XXIuRWbu6cli5p8W+YUv2w6R/7K/9LwdyOyPzxwkKeyiYD+lhQTryZSrqa2oNbVA9TWEkvtJPn4KiNrHmZ96dUZgXLPjqplnwxjTFT1g1KvPZ01piKrf7aW7aADYCiyELpyIXnTObkaLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749133399; c=relaxed/simple;
	bh=IfDNeHXqfvXJt/9iMiCpVz8pZRKpwbr601yo68izMzU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uTNl3S1qlFwAvKE7J47uO1Kz1gv4PI5yuzJ4Hvw7A9BQxKj69ixCurvnxK/LU604hmJJKM9AEswJo1LAh2CSMbxzsADIjkzeuU0zyqkzEQMamEixD/8ugdgOIub4+YfUQ+SAe8UDQPT59cyLhtjCu5X41526MwUy9kNGY/U5DMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GoG3zOdO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ghfYnGrY; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nqHwVfsA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=k/V2TP1O; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GoG3zOdO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ghfYnGrY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nqHwVfsA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="k/V2TP1O"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id F14F21F78B;
	Thu,  5 Jun 2025 14:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749133395; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=VGtxkIaHJWSGAzQZ7XrRv13ifuUrPYST8Fb6BTobMyk=;
	b=GoG3zOdOLCwA5kUzZDKLy6zfW/X5CfuFCrdHUq2Q63tc0onmUlVps9dFdmiFcKgwac4v2i
	YeKM7y7P7ayFmB6m+x1bOXH3hL/BbzI4su6UcYe3xW3/YnIMfvMiCsBG2gke+Z+FuNmFp+
	QHod5c9F9OkwEnaAGqD+yPQRK6XnBGA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749133395;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=VGtxkIaHJWSGAzQZ7XrRv13ifuUrPYST8Fb6BTobMyk=;
	b=ghfYnGrY7MbqeK8JLfpVe93QV3+xDiGdDcHhnf7hNqImAZbiqsAvpdsqT3Y850h9FQyFfZ
	IVOPrtyEnhIcA3Ag==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749133394; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=VGtxkIaHJWSGAzQZ7XrRv13ifuUrPYST8Fb6BTobMyk=;
	b=nqHwVfsADekQQemLGP480X+Wm/i1jHgCq8KtJka8xqb9boQp2JlgZY4ALaH9IDgf4D2OK0
	h6iOi3NHmSotWFQCD81SjwNcmbxkDe478N98W/SCARUdU+cm1R6Ux2r2rbb94urYu8JaGJ
	d88LyZ+wkYiea81UJrcqgac7eTTE8xQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749133394;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=VGtxkIaHJWSGAzQZ7XrRv13ifuUrPYST8Fb6BTobMyk=;
	b=k/V2TP1Okkx4dc3x1idqdGt5OiDRCJDfV7PhJEGe1/xLunDSoI8tInJlHMvg8z6MtTPVSA
	5+Goq6CigpS8UMAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 61F1D137FE;
	Thu,  5 Jun 2025 14:23:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id bQ7sFFKoQWipRwAAD6G6ig
	(envelope-from <osalvador@suse.de>); Thu, 05 Jun 2025 14:23:14 +0000
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
Subject: [PATCH v5 00/10] 
Date: Thu,  5 Jun 2025 16:22:51 +0200
Message-ID: <20250605142305.244465-1-osalvador@suse.de>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -0.80
X-Spamd-Result: default: False [-0.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	SUBJECT_ENDS_SPACES(0.50)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,suse.cz,huawei.com,oracle.com,sk.com,gmail.com,kvack.org,vger.kernel.org,suse.de];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[10];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Level: 

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
  mm,memory_hotplug: Rename status_change_nid parameter in memory_notify

 Documentation/core-api/memory-hotplug.rst     |  78 ++++++--
 .../zh_CN/core-api/memory-hotplug.rst         |   3 -
 drivers/acpi/numa/hmat.c                      |   8 +-
 drivers/base/node.c                           |  21 +++
 drivers/cxl/core/region.c                     |  16 +-
 drivers/cxl/cxl.h                             |   4 +-
 include/linux/memory.h                        |   3 +-
 include/linux/node.h                          |  42 +++++
 kernel/cgroup/cpuset.c                        |   2 +-
 mm/memory-tiers.c                             |  14 +-
 mm/memory_hotplug.c                           | 167 ++++++++----------
 mm/mempolicy.c                                |  10 +-
 mm/page_ext.c                                 |  12 +-
 mm/slub.c                                     |  45 +----
 14 files changed, 240 insertions(+), 185 deletions(-)

-- 
2.49.0

