Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF6725486A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 13:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749736047; cv=none; b=WsqfvAM5KMbwUWb0C8oa+ZETia4iOW3giZtt0SuJXBhfzu1w8mf4xeIMMVSN6txoY685w7iFC1ysdU2pkjo+jlXWwo5mfDKH5dUpILkTH4dn+kLRn5INwRfeCUgfMl91yDaXNeWwB5URv9yF12LwP0Ho8NPM1tLHlKkeyW3qosQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749736047; c=relaxed/simple;
	bh=6VxsUa9pp7zu1n0zdDNUqNqWXpP5qoBim9VfuOOJWnY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HaDTmdb+o78x0ucDusF63csG7J+8cMh0FyBMsaNFxQTfT4oQ+t37tJfNvnX3NNzMLRc7+Evc6XyfCYhTme/VInCyJJxnqqWGrYp2T7eBGQbThWXw95lcUUempk1yAfDNKC9vKM1UG72rK//hbFeym4aA6i7eQjpz4NgPFmomF8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NPzjCHIN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RMFn6t//; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NPzjCHIN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RMFn6t//; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NPzjCHIN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RMFn6t//";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NPzjCHIN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RMFn6t//"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 934BA1F850;
	Thu, 12 Jun 2025 13:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749736039; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e+huMrOQB10g9Wu0c3leQPZ840vTa2RdWXsWQX3/xvQ=;
	b=NPzjCHINtoCkkgooLDQVx7y7JRILmxtXH0n2Vc16NPF0Rjd48K9rSJu7Twud7rtT69tKYp
	IKsMNEcR+bWpbB42qppy62Wg8Ft4mJSqqz4wFS9l186aS84Yj0khSxeQNm4QJbadimS5MQ
	HPqRnveuLhhXgAubXWbhrm7ObYNWz0I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749736039;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e+huMrOQB10g9Wu0c3leQPZ840vTa2RdWXsWQX3/xvQ=;
	b=RMFn6t///l87pVFne+2oETPz0Qr2en1Z2yDDezyc87wmWG+KFh6KR5YXkXA5YS6f2GnpZ0
	0OLCV7Od1RiJQpCw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=NPzjCHIN;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="RMFn6t//"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749736039; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e+huMrOQB10g9Wu0c3leQPZ840vTa2RdWXsWQX3/xvQ=;
	b=NPzjCHINtoCkkgooLDQVx7y7JRILmxtXH0n2Vc16NPF0Rjd48K9rSJu7Twud7rtT69tKYp
	IKsMNEcR+bWpbB42qppy62Wg8Ft4mJSqqz4wFS9l186aS84Yj0khSxeQNm4QJbadimS5MQ
	HPqRnveuLhhXgAubXWbhrm7ObYNWz0I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749736039;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e+huMrOQB10g9Wu0c3leQPZ840vTa2RdWXsWQX3/xvQ=;
	b=RMFn6t///l87pVFne+2oETPz0Qr2en1Z2yDDezyc87wmWG+KFh6KR5YXkXA5YS6f2GnpZ0
	0OLCV7Od1RiJQpCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1613613A6D;
	Thu, 12 Jun 2025 13:47:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sCDIAmfaSmhJEAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Thu, 12 Jun 2025 13:47:19 +0000
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
Subject: [PATCH 5/5] mm,hugetlb: Drop unlikelys from hugetlb_fault
Date: Thu, 12 Jun 2025 15:47:01 +0200
Message-ID: <20250612134701.377855-6-osalvador@suse.de>
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
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 934BA1F850
X-Rspamd-Action: no action
X-Spam-Flag: NO
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim,suse.de:email]
X-Spam-Score: -3.01
X-Spam-Level: 

The unlikely predates an era where we were checking for hwpoisoned/migration
entries prior to checking whether the pte was present.

Currently, we check for the pte to be a migration/hwpoison entry after we
have checked that is not present, so it must be either one or the other.

Signed-off-by: Oscar Salvador <osalvador@suse.de>
---
 mm/hugetlb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index ad377e24b7d0..d6b0f2b68beb 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -6744,7 +6744,7 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
 
 	/* Not present, either a migration or a hwpoisoned entry */
 	if (!pte_present(vmf.orig_pte)) {
-		if (unlikely(is_hugetlb_entry_migration(vmf.orig_pte))) {
+		if (is_hugetlb_entry_migration(vmf.orig_pte)) {
 			/*
 			 * Release the hugetlb fault lock now, but retain
 			 * the vma lock, because it is needed to guard the
@@ -6755,7 +6755,7 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
 			mutex_unlock(&hugetlb_fault_mutex_table[hash]);
 			migration_entry_wait_huge(vma, vmf.address, vmf.pte);
 			return 0;
-		} else if (unlikely(is_hugetlb_entry_hwpoisoned(vmf.orig_pte)))
+		} else if (is_hugetlb_entry_hwpoisoned(vmf.orig_pte))
 			ret = VM_FAULT_HWPOISON_LARGE |
 			    VM_FAULT_SET_HINDEX(hstate_index(h));
 		goto out_mutex;
-- 
2.49.0

