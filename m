Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF31928DB58
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 14:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751294548; cv=none; b=icoNUKyhq882mMIb+uMu/zvrYPTBrx3EU2uO9rSRV9RPuHDChAIjE53i5E6cDqTaR2R89FEtO5zZq6LSf5svQLI6TJ0Ck7ZogUzipLogECii2ItVzhpVOKBR13LG33nDPWm8iHEiPiH84LTDZF8AwnjddQJ/pW5wpaYhjfMO3vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751294548; c=relaxed/simple;
	bh=gxQmOOof0otsKlpt20PyNg5TbDDZsnanmCIdzr3GZmk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k01UfJH1ec5XK1KowvzyhEtfpyCqPEkhT5DnbDcwuZxpuGdJJxyvuLLN0l+56EKUl0JYZ5NhOnh1/ohHzvnJKAV2yOHppDdKD3utkSQmuAjCEXBdRLVxj0v5Q5Xa5tVitVK7OPnXCkjLBx2e9abcAyCQQFlH3TWf64kqJTbEivU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fNw2Cazx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rdJ1dDrX; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fNw2Cazx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rdJ1dDrX; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fNw2Cazx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rdJ1dDrX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fNw2Cazx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rdJ1dDrX"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BC94A1F393;
	Mon, 30 Jun 2025 14:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751294538; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lswS/npHHg2FpDwDpRgpwsvZxZdHN4e8MQowvC+BDOQ=;
	b=fNw2CazxDou2e5Lf3A6ZpxG208/WtbJYxDUzNf/EmvLIOgHbGYNuPbMbFnGGoXzcc8KbqJ
	TCcwNkI1krvkJ0Y9wBqNCvhAEPZ57ed397g9O8o5IzrU5jPxFEgYuQ8Wirhicq+8ZOvGM6
	waztCYLASagVbGBicUFfrf6loAKUWOw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751294538;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lswS/npHHg2FpDwDpRgpwsvZxZdHN4e8MQowvC+BDOQ=;
	b=rdJ1dDrXteqCeY+23etpuh5UTIjzLFA3F0g9luhVSs3raT3CwR8xP9Ucfx5ctWcSh9UPhg
	n6GhkTkAZBXbbLAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751294538; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lswS/npHHg2FpDwDpRgpwsvZxZdHN4e8MQowvC+BDOQ=;
	b=fNw2CazxDou2e5Lf3A6ZpxG208/WtbJYxDUzNf/EmvLIOgHbGYNuPbMbFnGGoXzcc8KbqJ
	TCcwNkI1krvkJ0Y9wBqNCvhAEPZ57ed397g9O8o5IzrU5jPxFEgYuQ8Wirhicq+8ZOvGM6
	waztCYLASagVbGBicUFfrf6loAKUWOw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751294538;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lswS/npHHg2FpDwDpRgpwsvZxZdHN4e8MQowvC+BDOQ=;
	b=rdJ1dDrXteqCeY+23etpuh5UTIjzLFA3F0g9luhVSs3raT3CwR8xP9Ucfx5ctWcSh9UPhg
	n6GhkTkAZBXbbLAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 46BB11399F;
	Mon, 30 Jun 2025 14:42:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2LmWDkqiYmjqdAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Mon, 30 Jun 2025 14:42:18 +0000
From: Oscar Salvador <osalvador@suse.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>,
	Muchun Song <muchun.song@linux.dev>,
	Peter Xu <peterx@redhat.com>,
	Gavin Guo <gavinguo@igalia.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Oscar Salvador <osalvador@suse.de>
Subject: [PATCH v4 4/5] mm,hugetlb: drop obsolete comment about non-present pte and second faults
Date: Mon, 30 Jun 2025 16:42:11 +0200
Message-ID: <20250630144212.156938-5-osalvador@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250630144212.156938-1-osalvador@suse.de>
References: <20250630144212.156938-1-osalvador@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,linux.dev:email,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 

There is a comment in hugetlb_fault() that does not hold anymore.  This
one:

 /*
  * vmf.orig_pte could be a migration/hwpoison vmf.orig_pte at this
  * point, so this check prevents the kernel from going below assuming
  * that we have an active hugepage in pagecache. This goto expects
  * the 2nd page fault, and is_hugetlb_entry_(migration|hwpoisoned)
  * check will properly handle it.
  */

This was written because back in the day we used to do:

 hugetlb_fault () {
  ptep = huge_pte_offset(...)
  if (ptep) {
    entry = huge_ptep_get(ptep)
    if (unlikely(is_hugetlb_entry_migration(entry))
        ...
    else if (unlikely(is_hugetlb_entry_hwpoisoned(entry)))
        ...
  }

  ...
  ...

  /*
   * entry could be a migration/hwpoison entry at this point, so this
   * check prevents the kernel from going below assuming that we have
   * a active hugepage in pagecache. This goto expects the 2nd page fault,
   * and is_hugetlb_entry_(migration|hwpoisoned) check will properly
   * handle it.
   */
  if (!pte_present(entry))
          goto out_mutex;
  ...
 }

The code was designed to check for hwpoisoned/migration entries upfront,
and then bail out if further down the pte was not present anymore, relying
on the second fault to properly handle migration/hwpoison entries that
time around.

The way we handle this is different nowadays, so drop the misleading
comment.

Link: https://lkml.kernel.org/r/20250627102904.107202-5-osalvador@suse.de
Signed-off-by: Oscar Salvador <osalvador@suse.de>
Cc: David Hildenbrand <david@redhat.com>
Cc: Gavin Guo <gavinguo@igalia.com>
Cc: Muchun Song <muchun.song@linux.dev>
Cc: Peter Xu <peterx@redhat.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---
 mm/hugetlb.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 67f3c9c16348..ba078aa1cb96 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -6745,13 +6745,7 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
 
 	ret = 0;
 
-	/*
-	 * vmf.orig_pte could be a migration/hwpoison vmf.orig_pte at this
-	 * point, so this check prevents the kernel from going below assuming
-	 * that we have an active hugepage in pagecache. This goto expects
-	 * the 2nd page fault, and is_hugetlb_entry_(migration|hwpoisoned)
-	 * check will properly handle it.
-	 */
+	/* Not present, either a migration or a hwpoisoned entry */
 	if (!pte_present(vmf.orig_pte)) {
 		if (unlikely(is_hugetlb_entry_migration(vmf.orig_pte))) {
 			/*
-- 
2.50.0

