Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249D023A58B
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 13:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750770247; cv=none; b=DtAbqiFHnuRHU0wuNxJc4M5rLHuxNO7SB9dLx4bSY29zWPUjZufPJcRWXMvd+SglkCoTEGXB7XhtiQKWeMNnwmJcbfskMGwrQXMQPSBqCn3zHGGrLa+RS7gGRqZ+Wxyv5pPVjDYHZBf3SL4W+DNOQj9nGwJiR522xpM7GXSqgAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750770247; c=relaxed/simple;
	bh=0nbEnE6tIcOZXa6iKx21a6bc5dK4kL2eBnpa9JAjYiI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PT3RUKfyF97ygnxTSREuDn/oCzG+Zq+jjMZFuO5FwCxp16hTL57Q4N4Zj48L/x0mdqy7fiWEN9BcLSRWhmlUH3nWLpTxGsu7bD3X0C4gaTWNruTFCK5D9DXjE142qfeZOrLphHVSHaClsujXhpkEUEmAtRtqAnh3Q0k8foattjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=Bw6Z4/fo; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=mCdfDFYH; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=Bw6Z4/fo; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=mCdfDFYH; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="Bw6Z4/fo";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="mCdfDFYH";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="Bw6Z4/fo";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="mCdfDFYH"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0623F1F745;
	Tue, 24 Jun 2025 13:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1750770238; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tNDnWks3AtRHXbJYHoGSd/9iQiTl/o/ZIhIUACpTbEQ=;
	b=Bw6Z4/foqOpqcl3vv07+xTIwHt6M8R9GT6ULpD2tTt9pitoCJPSU10HywzN/ovc5UWnJDp
	ZYPp3MIZc1tMNei2Y0a41zd7JmMB/2u0Udsy8L6IrDJts7IE+iZmKi8DgQTWti2nurylNl
	GMgZ6EtjdY8a9xCBYMd97FFE/v1/FQo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1750770238;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tNDnWks3AtRHXbJYHoGSd/9iQiTl/o/ZIhIUACpTbEQ=;
	b=mCdfDFYHPSwbOZXNowrIAl7pxltz7cW1uz4OcMqchxW1m5+R+ebwVp9qJ3bZJQ1AgG42yI
	RM8Pw8242ix+XCCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1750770238; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tNDnWks3AtRHXbJYHoGSd/9iQiTl/o/ZIhIUACpTbEQ=;
	b=Bw6Z4/foqOpqcl3vv07+xTIwHt6M8R9GT6ULpD2tTt9pitoCJPSU10HywzN/ovc5UWnJDp
	ZYPp3MIZc1tMNei2Y0a41zd7JmMB/2u0Udsy8L6IrDJts7IE+iZmKi8DgQTWti2nurylNl
	GMgZ6EtjdY8a9xCBYMd97FFE/v1/FQo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1750770238;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tNDnWks3AtRHXbJYHoGSd/9iQiTl/o/ZIhIUACpTbEQ=;
	b=mCdfDFYHPSwbOZXNowrIAl7pxltz7cW1uz4OcMqchxW1m5+R+ebwVp9qJ3bZJQ1AgG42yI
	RM8Pw8242ix+XCCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D943A13A24;
	Tue, 24 Jun 2025 13:03:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CmS3ND2iWmjqYQAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Tue, 24 Jun 2025 13:03:57 +0000
From: Vlastimil Babka <vbabka@suse.cz>
Subject: [PATCH v2 0/4] madvise anon_name cleanups
Date: Tue, 24 Jun 2025 15:03:44 +0200
Message-Id: <20250624-anon_name_cleanup-v2-0-600075462a11@suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADCiWmgC/32NQQ6CMBREr0L+2ppSai2uNG5cunBnCKnlIz/RQ
 lppVMLdbTiAyzeTeTNBQE8YYJdN4DFSoN4lEKsMbGfcHRk1iUFwseFKFMy43tXOPLG2DzRuHBj
 q8qb0lhcaG0i7wWNL78V5hfPhcjxBleKOwqv3n+Up5kv5RxpzxhmXtpSFllyqdh/GgGv7hWqe5
 x8EGoTytwAAAA==
X-Change-ID: 20250623-anon_name_cleanup-e89b687038ed
To: Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 David Hildenbrand <david@redhat.com>, Jann Horn <jannh@google.com>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Colin Cross <ccross@google.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Vlastimil Babka <vbabka@suse.cz>
X-Mailer: b4 0.14.2
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:mid,suse.cz:email]
X-Spam-Level: 

While reviewing Lorenzo's madvise cleanups I've noticed that we can
handle anon_name in madvise code much better, so sending that as patch
1. Initially I wanted to do first move the existing logic from
madvise_vma_behavior() to madvise_update_vma() as a separate patch
before the actual simplification but that would require adding
anon_vma_name_put() in error handling paths only to be removed again, so
it's a single patch to avoid churn.

It's also an opportunity to move some mm code from prctl under mm,
hence patch 2. After code moving preparation in patch 3, also unify
madvise lock handling for madvise_set_anon_name() in patch 4.

Based on mm-new.

Taking the RFC off as concerns from RFC should be addressed, but not
without risk as patches 3+4 are new. Due to rewrite of patch 1 I didn't
keep Suren's R-b (but thanks!).

Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
---
Changes in v2:
- Refactor madvise_update_vma() to select between vma_modify_flags() and
  vma_modify_flags_name() based on Lorenzo's suggestion. This should
  also address Suren's concerns.
- Reduce the code move from kernel/sys.c to code handling
  PR_SET_VMA_ANON_NAME, per Lorenzo.
- Added patches 3, 4 to unify mm locking.
- Link to v1: https://patch.msgid.link/20250623-anon_name_cleanup-v1-0-04c94384046f@suse.cz

---
Vlastimil Babka (4):
      mm, madvise: simplify anon_name handling
      mm, madvise: extract mm code from prctl_set_vma() to mm/madvise.c
      mm, madvise: move madvise_set_anon_name() down the file
      mm, madvise: use standard madvise locking in madvise_set_anon_name()

 include/linux/mm.h |  14 ++---
 kernel/sys.c       |  50 +----------------
 mm/madvise.c       | 154 ++++++++++++++++++++++++++++++++++-------------------
 3 files changed, 106 insertions(+), 112 deletions(-)
---
base-commit: 4216fd45fc9156da0ee33fcb25cc0a5265049e32
change-id: 20250623-anon_name_cleanup-e89b687038ed

Best regards,
-- 
Vlastimil Babka <vbabka@suse.cz>

