Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BB2253F1D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 13:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749736046; cv=none; b=P0KZatQmr7f5Mjt7J4zU09P31pX/SznpIjMwS7LAwgpYlL/4Mjy+EGKYmk7rjw46lmYbnDtOywIVrW0FgzvR2gm8HX7zEiQNjiPGtlNz8UW0lhjY8YCydZbDfEkOpULyb52maanT7pnTkOq77+3yWLwwgYpTqHOUzw0Vf+NGVD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749736046; c=relaxed/simple;
	bh=mrnYwXze3IEA6YWuxw+bXXG/61PFWANBDnS+e2mHLug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I/Xgy+TEa5eIN6x1zhqUY+iXFhxTQnoMXUPD+AkjdJgnN7p/8UNZTnSrVZE6/EK1+DMjTezI/urAh4tLI1BJnejOEL7DkgWvGGZtA/vxz4McRR1lscdzH5LVFvaLWdJBIqbfa+TErpgNgTUQrVLzbb2EWMBP1WqeO0iVgz+Nzmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gGMahn7h; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=q/cz1jQg; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gGMahn7h; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=q/cz1jQg; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gGMahn7h";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="q/cz1jQg";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gGMahn7h";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="q/cz1jQg"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D1A5621977;
	Thu, 12 Jun 2025 13:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749736037; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EaFjV+YYVmHkh8fxJDeIMLJgp7WZCofGq73lz5YTZdk=;
	b=gGMahn7h2NFCR1mcl3kx3ny/sXV9xL8tq61+MYwsP/AWMz5M3AxsRV20QVUU6aZ2jPVgwq
	FWlc6Jt2/neLj902ixoGf54o8eQcvkVsrigF2G4vXmyYO5PsuqIOjM/4adi4InRQjRPaTs
	+IXPAZaFheDfmXVaqCtNG0PS78iLzXY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749736037;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EaFjV+YYVmHkh8fxJDeIMLJgp7WZCofGq73lz5YTZdk=;
	b=q/cz1jQgd5bjEPf/ecu/5YPTQir0e1oZjgTTV22SsKFy8JHwy1qyBsEy47zKUB3/8wrPeB
	7vdvd5pOGrs1evBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=gGMahn7h;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="q/cz1jQg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749736037; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EaFjV+YYVmHkh8fxJDeIMLJgp7WZCofGq73lz5YTZdk=;
	b=gGMahn7h2NFCR1mcl3kx3ny/sXV9xL8tq61+MYwsP/AWMz5M3AxsRV20QVUU6aZ2jPVgwq
	FWlc6Jt2/neLj902ixoGf54o8eQcvkVsrigF2G4vXmyYO5PsuqIOjM/4adi4InRQjRPaTs
	+IXPAZaFheDfmXVaqCtNG0PS78iLzXY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749736037;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EaFjV+YYVmHkh8fxJDeIMLJgp7WZCofGq73lz5YTZdk=;
	b=q/cz1jQgd5bjEPf/ecu/5YPTQir0e1oZjgTTV22SsKFy8JHwy1qyBsEy47zKUB3/8wrPeB
	7vdvd5pOGrs1evBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5237A132D8;
	Thu, 12 Jun 2025 13:47:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WFNhEWXaSmhJEAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Thu, 12 Jun 2025 13:47:17 +0000
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
Subject: [PATCH 2/5] mm,hugetlb: Document the reason to lock the folio in the faulting path
Date: Thu, 12 Jun 2025 15:46:58 +0200
Message-ID: <20250612134701.377855-3-osalvador@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid,suse.de:email]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: D1A5621977
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.01

Recent conversations showed that there was a misunderstanding about why we
were locking the folio prior to calling hugetlb_wp().
Document explicitly why we need to take the lock, explaining on the way that
although the timespan for the locking of anonymous and file folios is different,
it would require a major surgery to represent that difference with the current
code.

Signed-off-by: Oscar Salvador <osalvador@suse.de>
---
 mm/hugetlb.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 175edafeec67..dfa09fc3b2c6 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -6537,6 +6537,10 @@ static vm_fault_t hugetlb_no_page(struct address_space *mapping,
 			}
 			new_pagecache_folio = true;
 		} else {
+			/*
+			 * hugetlb_wp() expects the folio to be locked in order to
+			 * check whether we can re-use this page exclusively for us.
+			 */
 			folio_lock(folio);
 			anon_rmap = 1;
 		}
@@ -6801,7 +6805,19 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
 		/* Fallthrough to CoW */
 	}
 
-	/* hugetlb_wp() requires page locks of pte_page(vmf.orig_pte) */
+	/*
+	 * We need to lock the folio before calling hugetlb_wp().
+	 * Either the folio is in the pagecache and we need to copy it over
+	 * to another file, so it must remain stable throughout the operation,
+	 * or the folio is anonymous and we need to lock it in order to check
+	 * whether we can re-use it and mark it exclusive for this process.
+	 * The timespan for the lock differs depending on the type, since
+	 * anonymous folios only need to hold the lock while checking whether we
+	 * can re-use it, while we need to hold it throughout the copy in case
+	 * we are dealing with a folio from a pagecache.
+	 * Representing this difference would be tricky with the current code,
+	 * so just hold the lock for the duration of hugetlb_wp().
+	 */
 	folio = page_folio(pte_page(vmf.orig_pte));
 	folio_lock(folio);
 	folio_get(folio);
-- 
2.49.0

