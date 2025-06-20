Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569291C5D7B
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 12:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750422630; cv=none; b=Nvb6BuTHK5anFdGW93y1mCf5JtZclkfepocQ4eFZfpcr65H5sf8xVun1VrUF3LHFkF6pJxfynw6EfFEjZuKM+a00iuLse7zNGM8DSTrhuIXNVu/FrqWn/vqRrscTNGQX715XsJ55cug2lcZliZwOHCbflHZIKQQ8ct1DfqY6gCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750422630; c=relaxed/simple;
	bh=OAT2kA2Gp/GliDE9Ae1C1zJswYpBGaBlXGVT1uCDnDs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KqDQYlaEPhJDr2kGpasEc1cQD/VA+lA8Ao2DqQwCazbwYvV3Uh2srxltULN7FOYULo5IUDuQj2nt0WgiaOS2JrcGeXkG+yw3+SfVzSvZnWXrMSAtJaa8lL2edFLvIY5rJ93iTJaCIp0qbE5H0Ui0J87smV1pEQ4RZA3g+rWeAGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xiJ6+53c; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WmcWJ6GX; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xiJ6+53c; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WmcWJ6GX; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xiJ6+53c";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WmcWJ6GX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xiJ6+53c";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WmcWJ6GX"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B11B82121C;
	Fri, 20 Jun 2025 12:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750422627; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=MyPppERCuMEI9DFIqEdgueHGbR+05Ah5b5rn0YRrw4w=;
	b=xiJ6+53cZKxx7bm1WEu8PpgXXC7xVc2/vSQNkqCL1yDRrKKHC+/1hX5BfwFwc4tpSH17WF
	Jmk0HC2oE/93XFNdndWA4nDYNOG19NPvO3PeDg8Cz7yWg14pkX3IseaWOlg//PLlE2qLFU
	7KlssLRFvDtPe9yd+GKxJ/6IUnKjmxI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750422627;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=MyPppERCuMEI9DFIqEdgueHGbR+05Ah5b5rn0YRrw4w=;
	b=WmcWJ6GX8EpCWR3+hcotrFfKuETSAucz3sSQI+e3gc9jbYVxWMR1R2IyICQ14jiHTXQkhR
	B3dCg5aLuMUwPdAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750422627; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=MyPppERCuMEI9DFIqEdgueHGbR+05Ah5b5rn0YRrw4w=;
	b=xiJ6+53cZKxx7bm1WEu8PpgXXC7xVc2/vSQNkqCL1yDRrKKHC+/1hX5BfwFwc4tpSH17WF
	Jmk0HC2oE/93XFNdndWA4nDYNOG19NPvO3PeDg8Cz7yWg14pkX3IseaWOlg//PLlE2qLFU
	7KlssLRFvDtPe9yd+GKxJ/6IUnKjmxI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750422627;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=MyPppERCuMEI9DFIqEdgueHGbR+05Ah5b5rn0YRrw4w=;
	b=WmcWJ6GX8EpCWR3+hcotrFfKuETSAucz3sSQI+e3gc9jbYVxWMR1R2IyICQ14jiHTXQkhR
	B3dCg5aLuMUwPdAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 395E8136BA;
	Fri, 20 Jun 2025 12:30:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IOhUC2NUVWjNKAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Fri, 20 Jun 2025 12:30:27 +0000
From: Oscar Salvador <osalvador@suse.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>,
	Muchun Song <muchun.song@linux.dev>,
	Peter Xu <peterx@redhat.com>,
	Gavin Guo <gavinguo@igalia.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Oscar Salvador <osalvador@suse.de>
Subject: [PATCH v2 0/5] Misc rework on hugetlb faulting path
Date: Fri, 20 Jun 2025 14:30:09 +0200
Message-ID: <20250620123014.29748-1-osalvador@suse.de>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 

 v1 -> v2:
   - Addressed feedback from David
   - Settle ideas wrt. locking in faulting path after
     discussion with David
   - Add Acks-by

 RFC -> v1:
   - Stop looking up folio in the pagecache for detecting a COW
     on a private mapping.
   - Document the locks

This patchset aims to give some love to the hugetlb faulting path, doing so
by removing obsolete comments that are no longer true, sorting out the folio
lock, and changing the mechanism we use to determine whether we are COWing a
private mapping already.

The most important patch of the series is #1, as it fixes a deadlock that
was described in [1], where two processes were holding the same lock
for the folio in the pagecache, and then deadlocked in the mutex.
Looking up and locking the folio in the pagecache was done to check whether
that folio was the same folio we had mapped in our pagetables, meaning that if it
was different we knew that we already mapped that folio privately, so any
further CoW would be made on a private mapping, which lead us to the  question:
 __Was the reservation for that address consumed?__
That is all we care about, because if it was indeed consumed and we are the
owner and we cannot allocate more folios, we need to unmap the folio from the
processes pagetables and make it exclusive for us.

We figured we do not need to look up the folio at all, and it is just enough to
check whether the folio we have mapped is anonymous, which means we mapped it
privately, so the reservation was indeed consumed.

Patch#2 sorts out folio locking in the faulting path, reducing the scope of it
,only taking it when we are dealing with an anonymous folio and document it.
More details in the patch.

Patch#3-5 are cleanups.

[1] https://lore.kernel.org/lkml/20250513093448.592150-1-gavinguo@igalia.com/

Oscar Salvador (5):
  mm,hugetlb: Change mechanism to detect a COW on private mapping
  mm,hugetlb: Sort out folio locking in the faulting path
  mm,hugetlb: Rename anon_rmap to new_anon_folio and make it boolean
  mm,hugetlb: Drop obsolete comment about non-present pte and second
    faults
  mm,hugetlb: Drop unlikelys from hugetlb_fault

 mm/hugetlb.c | 130 ++++++++++++++++++++++-----------------------------
 1 file changed, 55 insertions(+), 75 deletions(-)

-- 
2.50.0

