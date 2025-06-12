Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D095325A2D2
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 13:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749736052; cv=none; b=OSaRqRDESVk9HjVmllk8OyvarFCCGOZz3JgSlrIGFmzFOEBBz4xsfQ9lJk+Pyb0feamXgqTK0f/IeLXKQ2F2Uv+LtGUw/TonAVVD0g9bLcPgh+qlw6deqyBOpUJmkXRQnAeY5FpWV8z0jg+1kCLxnbpmkqMnj44m9NOCpSt9tA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749736052; c=relaxed/simple;
	bh=+sSAp8qXn6cQTtZrbNBGZmqBEN4KINGiCBzMWx3bKEs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e6gCuXIoM9NnJyghOaqQW/dd8ks6+jlkRkOcSxinKvWtNQtviZMwVlCvywZTFj/hEYWi7qBtNvr/sSgHlWS/HCWAISno+0mKG5JPQUoBHUNhFQ3w3t+me6XYj+9lJHmoH3FBzoBq3MYn1c5zkhnh5D6RXz1o2ekVGUVebI0wS7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dCemQDOT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9Bf/jW9p; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dCemQDOT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9Bf/jW9p; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dCemQDOT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9Bf/jW9p";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dCemQDOT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9Bf/jW9p"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6AC5521985;
	Thu, 12 Jun 2025 13:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749736038; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vt/8GylTs/EQrkcPezsjpSOQ7ldzUYCaWmy2QFxBUFY=;
	b=dCemQDOT8NRxm/2HdvF5olIZ2zAth0e4UmZM7G0eFE6WgVAqneoYqcOhIXEsVfQ++7Dw5Y
	+92zLK+n0ZShK4qoicbKJkmPD1vwNKtdYimE6KuLK3ufO7+AJwQBRYwUab2TqWmVlIIAES
	YoDif25FpIwJ+ms7G+dB+4scRmcvm/I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749736038;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vt/8GylTs/EQrkcPezsjpSOQ7ldzUYCaWmy2QFxBUFY=;
	b=9Bf/jW9pjaBJNqh+O7dnGyYRYZmqcUaXSPmNbbCpFxvJedgFktFzm6mHrIw98vsKdsW2vN
	qjegRpSUZ5CWGuCA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=dCemQDOT;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="9Bf/jW9p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749736038; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vt/8GylTs/EQrkcPezsjpSOQ7ldzUYCaWmy2QFxBUFY=;
	b=dCemQDOT8NRxm/2HdvF5olIZ2zAth0e4UmZM7G0eFE6WgVAqneoYqcOhIXEsVfQ++7Dw5Y
	+92zLK+n0ZShK4qoicbKJkmPD1vwNKtdYimE6KuLK3ufO7+AJwQBRYwUab2TqWmVlIIAES
	YoDif25FpIwJ+ms7G+dB+4scRmcvm/I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749736038;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vt/8GylTs/EQrkcPezsjpSOQ7ldzUYCaWmy2QFxBUFY=;
	b=9Bf/jW9pjaBJNqh+O7dnGyYRYZmqcUaXSPmNbbCpFxvJedgFktFzm6mHrIw98vsKdsW2vN
	qjegRpSUZ5CWGuCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E27D313A6D;
	Thu, 12 Jun 2025 13:47:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AA2lNGXaSmhJEAAAD6G6ig
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
Subject: [PATCH 3/5] mm,hugetlb: Conver anon_rmap into boolean
Date: Thu, 12 Jun 2025 15:46:59 +0200
Message-ID: <20250612134701.377855-4-osalvador@suse.de>
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
X-Rspamd-Queue-Id: 6AC5521985
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.01

We use anon_rmap as a boolean, so declare it as that.

Signed-off-by: Oscar Salvador <osalvador@suse.de>
---
 mm/hugetlb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index dfa09fc3b2c6..62bc3808f99e 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -6431,7 +6431,7 @@ static vm_fault_t hugetlb_no_page(struct address_space *mapping,
 	struct mm_struct *mm = vma->vm_mm;
 	struct hstate *h = hstate_vma(vma);
 	vm_fault_t ret = VM_FAULT_SIGBUS;
-	int anon_rmap = 0;
+	bool anon_rmap = false;
 	unsigned long size;
 	struct folio *folio;
 	pte_t new_pte;
@@ -6542,7 +6542,7 @@ static vm_fault_t hugetlb_no_page(struct address_space *mapping,
 			 * check whether we can re-use this page exclusively for us.
 			 */
 			folio_lock(folio);
-			anon_rmap = 1;
+			anon_rmap = true;
 		}
 	} else {
 		/*
-- 
2.49.0

