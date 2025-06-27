Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8349619066B
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 10:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751020160; cv=none; b=rdMxxTArK3hOsr2zbOGBZcPjKK2WWcb/Z0pfjL0K5jHVqeXfRTStGWaqfr6Pth5VsDN2aiadVJtkpaBYaF/5UW5fp3h8rDnNTIoMRb4MGdRL/WYg5wn7nlKPU6Ow7qlMB5RnUfwPHbtbtMrJjRvsE13FEAWYr5+zhFAVD5xBLDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751020160; c=relaxed/simple;
	bh=lzTDc05wRZkn4HQKdEu7ZLT84f2VoFsN2PT4tF+PlEc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XWf+3g3rfJzAQmVcArWCDYJxJG1t80jf9Fxte59BcokknHYA9yIiGw7HTeDZBK8rkdUWg+o4sIaVu/49RR2m3DxXoK0jzhACDUMNdGoU8U5TVRsX6ZbtSMg4yblzjyjQ4IJad7j+DJjWdTGO1xHqU5vkVvyV+TVMa2QTTYwCsu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0HuLtnqg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ezmsx4Ov; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0HuLtnqg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ezmsx4Ov; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0HuLtnqg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ezmsx4Ov";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0HuLtnqg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ezmsx4Ov"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 82DCD21175;
	Fri, 27 Jun 2025 10:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751020155; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=/Nz3rHqrUjYxoZ53w69TmDEbWGJFOtlq8zBUlOUNVng=;
	b=0HuLtnqgKgmZWI3glmjKdrtfPTIVZjsuYbYquWvxBGYqFSQc1Vo5V/pgN5Pme2VKXH2HLc
	apo8856e15DCQNBnT7dN1LZRWdP+SH6kdbiKHOkaisKviPaAfMTw27XSqv8TdvUC0vweMj
	BptZg/u1RLiqwrGZEOuIunGI0b4tAzI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751020155;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=/Nz3rHqrUjYxoZ53w69TmDEbWGJFOtlq8zBUlOUNVng=;
	b=Ezmsx4Ovj24Sqxs7XFDLhVDrfkSvFAf383fN1K2tkSz9PXk66rrJ378vKkPWjefyvze0nx
	+zRBRk6sd7qlzoBQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=0HuLtnqg;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Ezmsx4Ov
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751020155; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=/Nz3rHqrUjYxoZ53w69TmDEbWGJFOtlq8zBUlOUNVng=;
	b=0HuLtnqgKgmZWI3glmjKdrtfPTIVZjsuYbYquWvxBGYqFSQc1Vo5V/pgN5Pme2VKXH2HLc
	apo8856e15DCQNBnT7dN1LZRWdP+SH6kdbiKHOkaisKviPaAfMTw27XSqv8TdvUC0vweMj
	BptZg/u1RLiqwrGZEOuIunGI0b4tAzI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751020155;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=/Nz3rHqrUjYxoZ53w69TmDEbWGJFOtlq8zBUlOUNVng=;
	b=Ezmsx4Ovj24Sqxs7XFDLhVDrfkSvFAf383fN1K2tkSz9PXk66rrJ378vKkPWjefyvze0nx
	+zRBRk6sd7qlzoBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0D03113786;
	Fri, 27 Jun 2025 10:29:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mCwjAHtyXmgIAgAAD6G6ig
	(envelope-from <osalvador@suse.de>); Fri, 27 Jun 2025 10:29:15 +0000
From: Oscar Salvador <osalvador@suse.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>,
	Muchun Song <muchun.song@linux.dev>,
	Peter Xu <peterx@redhat.com>,
	Gavin Guo <gavinguo@igalia.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Oscar Salvador <osalvador@suse.de>
Subject: [PATCH v3 0/5] Misc rework on hugetlb faulting path
Date: Fri, 27 Jun 2025 12:28:59 +0200
Message-ID: <20250627102904.107202-1-osalvador@suse.de>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 82DCD21175
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01
X-Spam-Level: 

 v1 -> v2:
   - Addressed issue folio_lock when holding spinlock (per David)
   - Simplify new_anon_folio (per David)
   - Slightly rework patch#2 to make it simpler

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

 mm/hugetlb.c | 132 ++++++++++++++++++++++-----------------------------
 1 file changed, 56 insertions(+), 76 deletions(-)

-- 
2.50.0

