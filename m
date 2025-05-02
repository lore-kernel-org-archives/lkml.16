Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB938828
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 08:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746175009; cv=none; b=jyaBgOB3wFahTURFDSRnjZQIpeTloasDUwz4jafJIZEK0g9AGVcIIYbNFCRAX7aUIFti+ac8ToYNKfX2ZBnWyiLxjknI68ihJVwPMmVFpfifrYsb/tK+3fiGbgSlynyMCOy00akXcxn1/0s85twDGbbqgHI7q/+fQt1L8PtrQiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746175009; c=relaxed/simple;
	bh=Eby6Ixd7Sqr+f64ZRlid2zaQNkag4H366Ovb7GyEdVM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WqHW/8Bx2GmOxAIF7ipkbqm0AI/2zZYL2FrrrX3d3PCe+UpmbfX26x6czMvPymRUdq1vS/XVueBZ8uraT20XxFIcwK9NRUg/cbpWBugikKN+YzzxkYbopK8PyyIyi/FVY9UW5CNwn5OxGYAmnUzYDVPQIwd2oWnH+aiV7hO47aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qfpvADb5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=296wPOAA; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qfpvADb5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=296wPOAA; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qfpvADb5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="296wPOAA";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qfpvADb5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="296wPOAA"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6C3291F792;
	Fri,  2 May 2025 08:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746175005; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=7c1sgaTvleI1TMZ//trb2GsMEWDtTJkR2GRbK/NkDi0=;
	b=qfpvADb5mA/IpvqWzkKrAAuPkhnOvww63jqtKhPNBU3WcSP7y4CW289kSfK+KrLaY/Y7iz
	xkQmUuJ2N13whlpY2j4V/UfIYvMZX8zvpe7DSbx2yO6PfX2p6DREMmxrVSuPq5s1LW+PIk
	K2LzSUPqUdHE0QM+N+dzQsBjaLSYoFg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746175005;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=7c1sgaTvleI1TMZ//trb2GsMEWDtTJkR2GRbK/NkDi0=;
	b=296wPOAAi8sGe228c67BqB1aFUinH1qllCOLf+pOKvqjG5e8Bn0kpTaiQYnfyYcF4qyv3r
	b6wYBm8KLM4w39Dg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=qfpvADb5;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=296wPOAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746175005; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=7c1sgaTvleI1TMZ//trb2GsMEWDtTJkR2GRbK/NkDi0=;
	b=qfpvADb5mA/IpvqWzkKrAAuPkhnOvww63jqtKhPNBU3WcSP7y4CW289kSfK+KrLaY/Y7iz
	xkQmUuJ2N13whlpY2j4V/UfIYvMZX8zvpe7DSbx2yO6PfX2p6DREMmxrVSuPq5s1LW+PIk
	K2LzSUPqUdHE0QM+N+dzQsBjaLSYoFg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746175005;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=7c1sgaTvleI1TMZ//trb2GsMEWDtTJkR2GRbK/NkDi0=;
	b=296wPOAAi8sGe228c67BqB1aFUinH1qllCOLf+pOKvqjG5e8Bn0kpTaiQYnfyYcF4qyv3r
	b6wYBm8KLM4w39Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D4AAD13687;
	Fri,  2 May 2025 08:36:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Hm4tMRyEFGhVSwAAD6G6ig
	(envelope-from <osalvador@suse.de>); Fri, 02 May 2025 08:36:44 +0000
From: Oscar Salvador <osalvador@suse.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Vlastimil Babka <vbabka@suse.cz>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Rakie Kim <rakie.kim@sk.com>,
	Oscar Salvador <osalvador@suse.de>
Subject: [PATCH v3 0/3] Implement numa node notifier
Date: Fri,  2 May 2025 10:36:21 +0200
Message-ID: <20250502083624.49849-1-osalvador@suse.de>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 6C3291F792
X-Spam-Score: -1.51
X-Rspamd-Action: no action
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
	FREEMAIL_CC(0.00)[redhat.com,kvack.org,vger.kernel.org,suse.cz,gmail.com,huawei.com,sk.com,suse.de];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

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
 drivers/base/node.c       |  21 +++++++
 drivers/cxl/core/region.c |  14 ++---
 drivers/cxl/cxl.h         |   4 +-
 include/linux/memory.h    |  38 ++++++++++++-
 kernel/cgroup/cpuset.c    |   2 +-
 mm/memory-tiers.c         |   8 +--
 mm/memory_hotplug.c       | 117 +++++++++++++++++++++-----------------
 mm/mempolicy.c            |   8 +--
 mm/page_ext.c             |  12 +---
 mm/slub.c                 |  45 +++------------
 11 files changed, 153 insertions(+), 122 deletions(-)

-- 
2.49.0

