Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68ACC149C41
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 11:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748948950; cv=none; b=u1oA7+jqPeSWCIPsV+8fFJPjsDHacr/64EVxH6eyT1uKhRXams/0yc3w3bvYiqSYX0LDdxGZU8i3yRZiKxZhNuerJoGIZm6bl1RVRCy6d81S67JB4NOCxQAx5L/xOo3gI+RDOBy4YgP11eMxamGlVKCxm3eeZH4jEnL1BbRHB4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748948950; c=relaxed/simple;
	bh=c0NfcGQI3YdzRzejJ2J6uQc6SVuX7+vKyBeHinOs4VE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cEiBi2F4WgfGTvqQlNsRDr+vmdAn1wYAVKKod0ppDTdQ6CFISzfAkqy3W3yvOZJgvE4/FLj0JiGDfDEOrWOkba6eqRmweZzZnVZyGPbPGIwG/4fD+knEq+4LCuBbkwpaSMXJN4zdBg7KWTk88fx8gLaxaxg+vBSN8SdLpC6PQXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=q00qrUcP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/FRv0yT/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=q00qrUcP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/FRv0yT/; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="q00qrUcP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/FRv0yT/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="q00qrUcP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/FRv0yT/"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 641301F390;
	Tue,  3 Jun 2025 11:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1748948946; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=W2PAkAFBMrtlD/VBlqumySTAnFS0VB9Jsjpk3GplglU=;
	b=q00qrUcPrSuTERJxwW/vxCjP6XHI71NMOpsNjsZ7ezGTX3q1+Fb6LeCtxL5rIG7vApoweV
	0CzAIom9+PnNa98ZWDh38MBzjDu0r+mFNgwApfYNYapZP7R9FZlroa2X3bPbLx81R0XZoL
	QCZ/xYRgx56nitZzqdw+N4uDlcpsB4s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1748948946;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=W2PAkAFBMrtlD/VBlqumySTAnFS0VB9Jsjpk3GplglU=;
	b=/FRv0yT/jWujG0dUsPZ0fV54vscg6iyvhxcZ1HKHL7WZ4Oreo2GuzN6X8z3BO/QK/9BQXi
	QtzQjzOIRXxiSRAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1748948946; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=W2PAkAFBMrtlD/VBlqumySTAnFS0VB9Jsjpk3GplglU=;
	b=q00qrUcPrSuTERJxwW/vxCjP6XHI71NMOpsNjsZ7ezGTX3q1+Fb6LeCtxL5rIG7vApoweV
	0CzAIom9+PnNa98ZWDh38MBzjDu0r+mFNgwApfYNYapZP7R9FZlroa2X3bPbLx81R0XZoL
	QCZ/xYRgx56nitZzqdw+N4uDlcpsB4s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1748948946;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=W2PAkAFBMrtlD/VBlqumySTAnFS0VB9Jsjpk3GplglU=;
	b=/FRv0yT/jWujG0dUsPZ0fV54vscg6iyvhxcZ1HKHL7WZ4Oreo2GuzN6X8z3BO/QK/9BQXi
	QtzQjzOIRXxiSRAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C2A1A13A1D;
	Tue,  3 Jun 2025 11:09:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gtqMLNHXPmjfXQAAD6G6ig
	(envelope-from <osalvador@suse.de>); Tue, 03 Jun 2025 11:09:05 +0000
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
Subject: [PATCH v4 0/3] Implement numa node notifier
Date: Tue,  3 Jun 2025 13:08:47 +0200
Message-ID: <20250603110850.192912-1-osalvador@suse.de>
X-Mailer: git-send-email 2.49.0
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
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	FREEMAIL_CC(0.00)[redhat.com,suse.cz,huawei.com,oracle.com,sk.com,gmail.com,kvack.org,vger.kernel.org,suse.de];
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
X-Spam-Level: 

A break from hugetlbfs :-)

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

Oscar Salvador (3):
  mm,slub: Do not special case N_NORMAL nodes for slab_nodes
  mm,memory_hotplug: Implement numa node notifier
  mm,memory_hotplug: Rename status_change_nid parameter in memory_notify

 drivers/acpi/numa/hmat.c  |   6 +-
 drivers/base/node.c       |  21 +++++
 drivers/cxl/core/region.c |  14 ++--
 drivers/cxl/cxl.h         |   4 +-
 include/linux/memory.h    |  38 ++++++++-
 kernel/cgroup/cpuset.c    |   2 +-
 mm/memory-tiers.c         |   8 +-
 mm/memory_hotplug.c       | 161 +++++++++++++++++---------------------
 mm/mempolicy.c            |   8 +-
 mm/page_ext.c             |  12 +--
 mm/slub.c                 |  45 ++---------
 11 files changed, 158 insertions(+), 161 deletions(-)

-- 
2.49.0

