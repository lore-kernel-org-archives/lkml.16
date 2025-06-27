Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5AEF265621
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 10:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751020167; cv=none; b=XdV5QxPBwGD9ZRoDb35g8sOjvjKG/P3rNBQ9WMK0T6BOxz4oavz357Ip9r0x3l2OM3gWR2f3yeIzZb5RxzR7bRI6qxxevJSdAQdoUGO1HbjtvN8+9qWKX8lD1NMidnbY4Tdq2pZY86r9POUSKWhORDTF76NH8ZpJgR70ekPPDwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751020167; c=relaxed/simple;
	bh=vseYA1og9Dzm9Um8QPlJ2K5kCj40A+SZNuPIon+KCLg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iD7xGlvWJ90aq7IA4MYlrIPDJC5FSFKt2B+54uncOtLuPoVoH9ELZwmBh2bNg07bbBx/ONySAoduGizfNOaHh/YR8QFmkq/v/JKBHfOySMaAJp4i60hIIATy6I6W39Tn3R9w/Mq80MXMf3B5vs2urimloOKAcFRS3mKe8Bwlep0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=aZxfJg82; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0CrZMoCS; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=aZxfJg82; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0CrZMoCS; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aZxfJg82";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0CrZMoCS";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aZxfJg82";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0CrZMoCS"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D8E201F394;
	Fri, 27 Jun 2025 10:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751020157; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HjkIsGEVefVATIO9BVUjIgRSloD/rqP2CC47WtBUxBA=;
	b=aZxfJg82NIVKvrEb5EaNKaVuop99Uu1oF3AmtCsTMayBk9eQYSyHe3X8PrTdeMEs0xcHnD
	jbafH1L0qhPtbwyEAlo4kyCFAX35pUNPDOlTarlGxCvH7cUn97iM1ctm7HOWWtMWICOEsC
	GHqeopw7Z/SM0aBhQ3KNC1vC/vf3c7I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751020157;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HjkIsGEVefVATIO9BVUjIgRSloD/rqP2CC47WtBUxBA=;
	b=0CrZMoCS/wke7+RyuQps0mLylKefoh66HLsouh/NIo21VdYsDqDgP0wuiX/y2NVa6OGbXB
	A8k95XQKu9EDEwAw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=aZxfJg82;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=0CrZMoCS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751020157; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HjkIsGEVefVATIO9BVUjIgRSloD/rqP2CC47WtBUxBA=;
	b=aZxfJg82NIVKvrEb5EaNKaVuop99Uu1oF3AmtCsTMayBk9eQYSyHe3X8PrTdeMEs0xcHnD
	jbafH1L0qhPtbwyEAlo4kyCFAX35pUNPDOlTarlGxCvH7cUn97iM1ctm7HOWWtMWICOEsC
	GHqeopw7Z/SM0aBhQ3KNC1vC/vf3c7I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751020157;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HjkIsGEVefVATIO9BVUjIgRSloD/rqP2CC47WtBUxBA=;
	b=0CrZMoCS/wke7+RyuQps0mLylKefoh66HLsouh/NIo21VdYsDqDgP0wuiX/y2NVa6OGbXB
	A8k95XQKu9EDEwAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 46F8F13A9C;
	Fri, 27 Jun 2025 10:29:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6HFqDn1yXmgIAgAAD6G6ig
	(envelope-from <osalvador@suse.de>); Fri, 27 Jun 2025 10:29:17 +0000
From: Oscar Salvador <osalvador@suse.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>,
	Muchun Song <muchun.song@linux.dev>,
	Peter Xu <peterx@redhat.com>,
	Gavin Guo <gavinguo@igalia.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Oscar Salvador <osalvador@suse.de>
Subject: [PATCH v3 4/5] mm,hugetlb: Drop obsolete comment about non-present pte and second faults
Date: Fri, 27 Jun 2025 12:29:03 +0200
Message-ID: <20250627102904.107202-5-osalvador@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250627102904.107202-1-osalvador@suse.de>
References: <20250627102904.107202-1-osalvador@suse.de>
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
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLfw9wkb71jz54yo3bnq4aib6i)];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: D8E201F394
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
index b110394d8d6e..0a6a519fabe5 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -6747,13 +6747,7 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
 
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

