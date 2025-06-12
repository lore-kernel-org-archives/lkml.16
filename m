Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CFD248894
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 13:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749736040; cv=none; b=iwT+LyiF5sGIuonbRjLtaI4ANlx/9yV47GKQSynn4TTu8rvXnjVc7G+L2SDCKlViH0CaoVHzB9Yv0ZLJNjonEFbsjejU5zVm1tFd4ROm3/622tp/ejI7WLgiWKBtda0l789NDdzCQtrhBL7kLsQdNw0sEp2RoMpXgULBmF3MZg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749736040; c=relaxed/simple;
	bh=NFVXDqykMGFFpkpeqpjFqoQQzMQjQLCl0JVe53sPaQc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g8XcAev7e7jU3784sUOKswP/kS29ggZ5zq2ZJp/vkgMeytErF2B/0tR+Zt2GmA3VNPpiTKPup31NSBXrzgZw0Euf+TS+quBua1K1618A9zo1gfUHfZGJuvbB1yuIHN3IZYVRWYR8/HOwvin8j608C9HCadMXsVbRoM4kfTfP36Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=C/TJW6Ah; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nCIoR2gF; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=C/TJW6Ah; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nCIoR2gF; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="C/TJW6Ah";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nCIoR2gF";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="C/TJW6Ah";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nCIoR2gF"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A56CA21982;
	Thu, 12 Jun 2025 13:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749736036; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=9MhSnHEwcuzXs2mq2aCr/RKU5BM1YHtc4oG+0a3jl0s=;
	b=C/TJW6AhHxfBZVw3BB4vtmocSVX+ts96HtVIxs1AzxdP31G/l8N4OgOgVcZLBb0/XyHiP6
	uzpyrxmvPfQWDXxnLfosxUsdx1r1X5exzOXjBYWwgcGPrx2AGuvCGaCAPunU/8XvuDrA62
	lZp4VCkrUOMFby+kPvXRBZKm258axg8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749736036;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=9MhSnHEwcuzXs2mq2aCr/RKU5BM1YHtc4oG+0a3jl0s=;
	b=nCIoR2gF9Jn0YvFZh5L9x041uBNAjpstxW9ormDqVG2n8tGP+VRYpmk4nl6McGh12e/Gbt
	gZckvJnRSXnA7fDg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="C/TJW6Ah";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=nCIoR2gF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749736036; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=9MhSnHEwcuzXs2mq2aCr/RKU5BM1YHtc4oG+0a3jl0s=;
	b=C/TJW6AhHxfBZVw3BB4vtmocSVX+ts96HtVIxs1AzxdP31G/l8N4OgOgVcZLBb0/XyHiP6
	uzpyrxmvPfQWDXxnLfosxUsdx1r1X5exzOXjBYWwgcGPrx2AGuvCGaCAPunU/8XvuDrA62
	lZp4VCkrUOMFby+kPvXRBZKm258axg8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749736036;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=9MhSnHEwcuzXs2mq2aCr/RKU5BM1YHtc4oG+0a3jl0s=;
	b=nCIoR2gF9Jn0YvFZh5L9x041uBNAjpstxW9ormDqVG2n8tGP+VRYpmk4nl6McGh12e/Gbt
	gZckvJnRSXnA7fDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 290D6132D8;
	Thu, 12 Jun 2025 13:47:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qO9eB2TaSmhJEAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Thu, 12 Jun 2025 13:47:16 +0000
From: Oscar Salvador <osalvador@suse.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>,
	Muchun Song <muchun.song@linux.dev>,
	James Houghton <jthoughton@google.com>,
	Peter Xu <peterx@redhat.com>,
	Gavin Guo <gavinguo@igalia.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Oscar Salvador <osalvador@suse.de>
Subject: [PATCH 0/5] Misc rework on hugetlb_fault
Date: Thu, 12 Jun 2025 15:46:56 +0200
Message-ID: <20250612134701.377855-1-osalvador@suse.de>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_COUNT_TWO(0.00)[2];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: A56CA21982
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.01

 RFC -> v1:
  - Stop looking up folio in the pagecache for detecting a COW
    on a private mapping.
  - Document the locks

Hi,

This is a new version of the RFC I sent a couple of weeks ago [1].
It's the conclusion of the discussions that ocurred in that thread.

Patch#1 is the fix for the deadlock.
Patch#2 is to document why we take the lock, so none of us have to spend
time again in figuring that out.
Patch#3-5 are a bit of cleanup (removing obsolete comments etc.)

More detail in every patch.

Oscar Salvador (5):
  mm,hugetlb: Change mechanism to detect a COW on private mapping
  mm,hugetlb: Document the reason to lock the folio in the faulting path
  mm,hugetlb: Conver anon_rmap into boolean
  mm,hugetlb: Drop obsolete comment about non-present pte and second
    faults
  mm,hugetlb: Drop unlikelys from hugetlb_fault

 mm/hugetlb.c | 98 +++++++++++++++++++---------------------------------
 1 file changed, 36 insertions(+), 62 deletions(-)

-- 
2.49.0

