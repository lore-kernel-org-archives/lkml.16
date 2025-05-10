Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9041545038
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 06:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746856964; cv=none; b=gUa4L26ja4VhvdjNOPpjkLwYORRciG9iGpxoxz/Rl3RZuGiZTaoDTmeXikrgXlOCwRiJah055J5vtAFhjTFvBxgu/+6m3XUSwjQS4GzsPzPlabKWFrX3SVfgf9HE7E5gyn7AnR1ol4fJ/WubG6U1ZyUorstjGGMdrmOLBYRZBPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746856964; c=relaxed/simple;
	bh=9oF1QhbHCrUP+nOX0q5huIbc3K657Rizofqx0DN1r+0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qG3U+FjSxDu5aAk2B7BNh0XlVHtQ+C0fDNqwlrAveTjPa1Uvm4xlbIcGX/j169TIiy7qogTmDNkWSsosrD2uAVsqURAsPg5WPro6qvikkQlhVh0L14l9+DCzCjj+LRQcf0b/rixTmP0t54SOgDNFf34B5YyQ+t5KyxAEEYSZDBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=B0yilAF3; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=B0yilAF3; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="B0yilAF3";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="B0yilAF3"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 857641F397;
	Sat, 10 May 2025 06:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1746856960; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=5x0FrLrT9arD78nhtjUiXkm3MxmtAVjf5jKghGKlN54=;
	b=B0yilAF3iYnqGKxHn3iBP5eDc7zGo5ks3Fq6A7wtKy09l/DrrFLRmEunhCyEadEbkuh/ZE
	hqwRBLuuYfLVKiESDAoPmzocev/mYt97xsXIj1cw02maWwsvxlJ3iOJ7KgHwfWdp4Th54H
	MvoqfcdJsYfQH90L+SgJj3Ca4WzDnUg=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=B0yilAF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1746856960; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=5x0FrLrT9arD78nhtjUiXkm3MxmtAVjf5jKghGKlN54=;
	b=B0yilAF3iYnqGKxHn3iBP5eDc7zGo5ks3Fq6A7wtKy09l/DrrFLRmEunhCyEadEbkuh/ZE
	hqwRBLuuYfLVKiESDAoPmzocev/mYt97xsXIj1cw02maWwsvxlJ3iOJ7KgHwfWdp4Th54H
	MvoqfcdJsYfQH90L+SgJj3Ca4WzDnUg=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4F8A1136A5;
	Sat, 10 May 2025 06:02:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id PQZQEQDsHmjhMgAAD6G6ig
	(envelope-from <jgross@suse.com>); Sat, 10 May 2025 06:02:40 +0000
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	sstabellini@kernel.org
Subject: [GIT PULL] xen: branch for v6.15-rc6
Date: Sat, 10 May 2025 08:02:39 +0200
Message-ID: <20250510060239.18894-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 857641F397
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:mid,suse.com:dkim];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Action: no action

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.15a-rc6-tag

xen: branch for v6.15-rc6

It contains the following patches:

- A fix for the xenbus driver allowing to use a PVH Dom0 with Xenstore
  running in another domain.

- A fix for the xenbus driver addressing a rare race condition resulting
  in NULL dereferences and other problems.

- A fix for the xen-swiotlb driver fixing a problem seen on Arm platforms.

Thanks.

Juergen

 drivers/xen/swiotlb-xen.c                |  1 +
 drivers/xen/xenbus/xenbus.h              |  2 ++
 drivers/xen/xenbus/xenbus_comms.c        |  9 ++++-----
 drivers/xen/xenbus/xenbus_dev_frontend.c |  2 +-
 drivers/xen/xenbus/xenbus_probe.c        | 14 ++++++++------
 drivers/xen/xenbus/xenbus_xs.c           | 18 ++++++++++++++++--
 6 files changed, 32 insertions(+), 14 deletions(-)

Jason Andryuk (2):
      xenbus: Allow PVH dom0 a non-local xenstore
      xenbus: Use kref to track req lifetime

John Ernberg (1):
      xen: swiotlb: Use swiotlb bouncing if kmalloc allocation demands it
