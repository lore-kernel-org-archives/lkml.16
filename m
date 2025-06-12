Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7110E24DCE2
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 13:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749736059; cv=none; b=Uz43E6xCYZw0w2Z67rvehBVcZzW5QrcsWkOoOHR73Zgq2NnQUhEQYQl9oIIlPD7uMZSnuT8CUch19m/ZIdNzf0pTVXJs2SXV5dZzywjFsZtSrtIfN2dXBITzTa8OqlisFr8GmeTJTHWVjsKgD9ghTNBau6gZo/b09xLztVeanrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749736059; c=relaxed/simple;
	bh=Dx4F4kRLv6WKbLr8ZOEav4L6SeKUI6GtppIcl6bTmWI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IQiDLdQo9NsnJO/16uqH3PIoGtBboRJnjZD/ev2GkObOWKd/jM334DfVa5OPKljIFzvpykd8r7N6XZn4UQ5d+BaAgnJEl7egPVwhli9HFqN0Yuk20Sg0wovdhErR6WxpLfHUXRm9nUH8xaLNb7qWE/qZx8OnJ4OiU4Gs6M3AO9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NDU1ewJH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ldl6zGXA; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NDU1ewJH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ldl6zGXA; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NDU1ewJH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ldl6zGXA";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NDU1ewJH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ldl6zGXA"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0418321986;
	Thu, 12 Jun 2025 13:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749736039; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N8oNzaGUW5qLujz6KN4jF5cE4+hRczq1P7iZs6uKvYo=;
	b=NDU1ewJHuBxYRllt+TaN9nMUngGutNhrt90DaRyImP86NuxFgs9h1gouiXhfE4kzn6SV4x
	EzF/7BPM4VP6Z0Uwsnti6mCZwHxMmCMaDHmSYlTmvUfnUuO5Q3W0ve0vtzRqV9RK8Dy66X
	ZdXJDUkmCv67B5qQsQYNXEHlzOHgWkA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749736039;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N8oNzaGUW5qLujz6KN4jF5cE4+hRczq1P7iZs6uKvYo=;
	b=Ldl6zGXAuCxWWfrJeMN/RWS+oyQKET0q4r8Fmi32QBKRYrPJ0VqDbRg4NcFFAa5aLQQIMx
	WGPnyaHqB+A91+CA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=NDU1ewJH;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Ldl6zGXA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749736039; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N8oNzaGUW5qLujz6KN4jF5cE4+hRczq1P7iZs6uKvYo=;
	b=NDU1ewJHuBxYRllt+TaN9nMUngGutNhrt90DaRyImP86NuxFgs9h1gouiXhfE4kzn6SV4x
	EzF/7BPM4VP6Z0Uwsnti6mCZwHxMmCMaDHmSYlTmvUfnUuO5Q3W0ve0vtzRqV9RK8Dy66X
	ZdXJDUkmCv67B5qQsQYNXEHlzOHgWkA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749736039;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N8oNzaGUW5qLujz6KN4jF5cE4+hRczq1P7iZs6uKvYo=;
	b=Ldl6zGXAuCxWWfrJeMN/RWS+oyQKET0q4r8Fmi32QBKRYrPJ0VqDbRg4NcFFAa5aLQQIMx
	WGPnyaHqB+A91+CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7B66D132D8;
	Thu, 12 Jun 2025 13:47:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GACBG2baSmhJEAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Thu, 12 Jun 2025 13:47:18 +0000
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
Subject: [PATCH 4/5] mm,hugetlb: Drop obsolete comment about non-present pte and second faults
Date: Thu, 12 Jun 2025 15:47:00 +0200
Message-ID: <20250612134701.377855-5-osalvador@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612134701.377855-1-osalvador@suse.de>
References: <20250612134701.377855-1-osalvador@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	R_RATELIMIT(0.00)[to_ip_from(RL9xiirkf5437rzygec8i7198k)];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 0418321986
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.01

There is a comment in hugetlb_fault() that does not hold anymore.
This one:

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
and then bail out if further down the pte was not present anymore,
relying on the second fault to properly handle migration/hwpoison entries that
time around.

The way we handle this is different nowadays, so drop the misleading comment.

Signed-off-by: Oscar Salvador <osalvador@suse.de>
---
 mm/hugetlb.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 62bc3808f99e..ad377e24b7d0 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -6742,13 +6742,7 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
 
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
2.49.0

