Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47691EF399
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 09:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743499657; cv=none; b=XaxkhOfC+RU5ohQiA1Ol17P8ELakwPBKtE2lYK8vYJ4Ni4KM6XGuBCdi+olCmoEhp4O5cOboQfIQjG71jDg0KnCfTCTXrLgrWoXDI5tLuOZqOiM3at4H993zJpE7bWN7hLjBKx3JiOPrnoC/ga/mWHzgi7b2BoaEZ8yYW8pt7bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743499657; c=relaxed/simple;
	bh=hbQWm110j8/k/ysYsfGmwJpPGUdIOviVJeNJUr8pAWo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DadwIdaFxRU0K/ow1aKoo7iaPUlKdmMec658avJdYjLj85d09XwyNaBZT9K5NirITLoK0kJsjoQ8/BIo1O7quNECsneP2IeTI69KqiQ8GpY3Yn3L5tG2qfhSS8jOZC6cjNd3RBxP5vjfM9CgeA777BUZ6ew/Wea9y3YUF9pU93Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lw9JtLdL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uU/H3Vl6; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Enk/N3N5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=K3+rNllT; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lw9JtLdL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uU/H3Vl6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Enk/N3N5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="K3+rNllT"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C42C121187;
	Tue,  1 Apr 2025 09:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743499654; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=840D19WfpFNAZY5QCFfrGDfYI8TO5sKOgbuO23DZ7w4=;
	b=lw9JtLdLIdKvu9i0mG91kZ3D7StKyunFDY8mfWxqJFukjfiAfJXK2tL3pbTSbs+nmtFGQc
	B/Tc7Yi0IySi2ORhjOjKHkUiqsja56d4G3jWGBIg4Z+4gvPS+ijNzflq9+2bHGmwGSLTR1
	OQcyOYRKBt5lT16+z+NFOLifpefh4Jw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743499654;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=840D19WfpFNAZY5QCFfrGDfYI8TO5sKOgbuO23DZ7w4=;
	b=uU/H3Vl6kQPAFn8tP5JBQcCtANPYB41uJO/cbHnsGAZcBn0Gtk7Lb/sRSw/GsCicCQrDzE
	yEUxprmGwGK+0oDg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="Enk/N3N5";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=K3+rNllT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743499653; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=840D19WfpFNAZY5QCFfrGDfYI8TO5sKOgbuO23DZ7w4=;
	b=Enk/N3N5B7L5sgAnWLc2FD5EV7Zlem1E5JuF/R9xdNAcNhDPZt7uvcvGIaqFzmYGVfmy73
	gXTScXLcZg5cLXdwNdqtB2CINqslNgTqA4Y39Hlk1fP2S3uNLYsllRsKWXFeWU53xNR2sR
	q8SVx4yArqSCjnPWcLBawduakp/bu/0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743499653;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=840D19WfpFNAZY5QCFfrGDfYI8TO5sKOgbuO23DZ7w4=;
	b=K3+rNllT+t5vDmbxvkJyU4AmCpQTmTBpsvBZ5HhIy963KKXroSpzeI6cPGBDWRC8lw+1jx
	anmdAqf6giHDYnBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 36E3C13691;
	Tue,  1 Apr 2025 09:27:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Jkm3CoWx62cnfwAAD6G6ig
	(envelope-from <osalvador@suse.de>); Tue, 01 Apr 2025 09:27:33 +0000
From: Oscar Salvador <osalvador@suse.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Vlastimil Babka <vbabka@suse.cz>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>,
	mkoutny@suse.com,
	Dan Williams <dan.j.williams@intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Oscar Salvador <osalvador@suse.de>
Subject: [PATCH 0/2] Implement numa node notifier
Date: Tue,  1 Apr 2025 11:27:14 +0200
Message-ID: <20250401092716.537512-1-osalvador@suse.de>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C42C121187
X-Spam-Score: -1.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_CC(0.00)[redhat.com,kvack.org,vger.kernel.org,suse.cz,gmail.com,suse.com,intel.com,huawei.com,suse.de];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

Memory notifier is a tool that allow consumers to get notified whenever
memory gets onlined or offlined in the system.
Currently, there are 10 consumers of that, but 5 out of those 10 consumers
are only interested in getting notifications when a numa node has changed its
state.
That means going from memoryless to memory-aware of vice versa.

Which means that for every {online,offline}_pages operation they get
notified even though the numa node might not have changed its state.

The first patch implements a numa node notifier that does just that, and have
those consumers register in there, so they get notified only when they are
interested.

The second patch replaces 'status_change_normal{_normal}' fields within
memory_notify with a 'nid', as that is only what we need for memory
notifer and update the only user of it (page_ext).

Consumers that are only interested in numa node states change are:

 - memory-tier
 - slub
 - cpuset
 - hmat
 - cxl


Oscar Salvador (2):
  mm,memory_hotplug: Implement numa node notifier
  mm,memory_hotplug: Replace status_change_nid parameter in
    memory_notify

 drivers/acpi/numa/hmat.c  |  6 +--
 drivers/base/node.c       | 19 +++++++++
 drivers/cxl/core/region.c | 14 +++----
 drivers/cxl/cxl.h         |  4 +-
 include/linux/memory.h    | 37 ++++++++++++++++++
 kernel/cgroup/cpuset.c    |  2 +-
 mm/memory-tiers.c         |  8 ++--
 mm/memory_hotplug.c       | 82 +++++++++++++++++++++++++++++----------
 mm/page_ext.c             | 12 +-----
 mm/slub.c                 | 22 +++++------
 10 files changed, 146 insertions(+), 60 deletions(-)

-- 
2.49.0

