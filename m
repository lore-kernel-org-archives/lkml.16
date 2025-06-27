Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712C02BDC1D
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 10:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751020174; cv=none; b=YubU01fQeWAG2mUkw7SoTxLo1pWxgoxXCGJKBHVWIbGcb8yaYwcdtX+G7ePcI8PGmP93XudI0ecg8R077tSOLPQ17j/BuLk4es2iPuH/TsZ8ebg3tRn+wxpwmFFiQ+EM0GZP3qRCP5Y0v2QoxIXp8MbGueQkYZNI5hdGo2epkHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751020174; c=relaxed/simple;
	bh=DMB1IokfNeWikJ+Ngbt+5vobnNSrFFXdTEJSNQ4yk/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dJ4Kw0BvKLozU/nQWcmNnH8obF5oWgBEaCFbTSDj2r6xRYeacbzcmefdnWx9mCSzSgKdCBeaSbKZsK8d7KZkrdiYxXiY8r06pGPOR//oGYKosS3UJojnlstl74gNn7vQ85VhzfVoPdpa7C3tSikr8HjzwEcwj1sIFi4m0q3KGa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sHhER//3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jSc8xpIH; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sHhER//3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jSc8xpIH; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sHhER//3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jSc8xpIH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sHhER//3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jSc8xpIH"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 64CA41F441;
	Fri, 27 Jun 2025 10:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751020158; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kfi8/l69UuNC8lJU7DgbzOuhvxfNUkN/vTlkmP1mOoE=;
	b=sHhER//3GH862S3JMnhCJeTtFLSEHJMOWm/MExazrOAbpCVX+1Bx/pZTiCY/KN5lrf/WsV
	aiO/VxgxAGthlKn9k/GSW/9SUiuXIwr66IkeEEiivtYSpdCu1l2mSScoyROgozHCt/05Yr
	Yk21vOJ71appP356AQTMKW/SQyLCEk4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751020158;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kfi8/l69UuNC8lJU7DgbzOuhvxfNUkN/vTlkmP1mOoE=;
	b=jSc8xpIHdSpHpvhTXFG2YZY5CsodQ+lEbZ9WZbVjjCLkuh6b7kCUKYqqWOOAwUTtRbo3LS
	WDbwfVqHxdgGjuAA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="sHhER//3";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=jSc8xpIH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751020158; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kfi8/l69UuNC8lJU7DgbzOuhvxfNUkN/vTlkmP1mOoE=;
	b=sHhER//3GH862S3JMnhCJeTtFLSEHJMOWm/MExazrOAbpCVX+1Bx/pZTiCY/KN5lrf/WsV
	aiO/VxgxAGthlKn9k/GSW/9SUiuXIwr66IkeEEiivtYSpdCu1l2mSScoyROgozHCt/05Yr
	Yk21vOJ71appP356AQTMKW/SQyLCEk4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751020158;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kfi8/l69UuNC8lJU7DgbzOuhvxfNUkN/vTlkmP1mOoE=;
	b=jSc8xpIHdSpHpvhTXFG2YZY5CsodQ+lEbZ9WZbVjjCLkuh6b7kCUKYqqWOOAwUTtRbo3LS
	WDbwfVqHxdgGjuAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E109413786;
	Fri, 27 Jun 2025 10:29:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gCIaNH1yXmgIAgAAD6G6ig
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
Subject: [PATCH v3 5/5] mm,hugetlb: Drop unlikelys from hugetlb_fault
Date: Fri, 27 Jun 2025 12:29:04 +0200
Message-ID: <20250627102904.107202-6-osalvador@suse.de>
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
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 64CA41F441
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
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
index 0a6a519fabe5..64d628755b7f 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -6749,7 +6749,7 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
 
 	/* Not present, either a migration or a hwpoisoned entry */
 	if (!pte_present(vmf.orig_pte)) {
-		if (unlikely(is_hugetlb_entry_migration(vmf.orig_pte))) {
+		if (is_hugetlb_entry_migration(vmf.orig_pte)) {
 			/*
 			 * Release the hugetlb fault lock now, but retain
 			 * the vma lock, because it is needed to guard the
@@ -6760,7 +6760,7 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
 			mutex_unlock(&hugetlb_fault_mutex_table[hash]);
 			migration_entry_wait_huge(vma, vmf.address, vmf.pte);
 			return 0;
-		} else if (unlikely(is_hugetlb_entry_hwpoisoned(vmf.orig_pte)))
+		} else if (is_hugetlb_entry_hwpoisoned(vmf.orig_pte))
 			ret = VM_FAULT_HWPOISON_LARGE |
 			    VM_FAULT_SET_HINDEX(hstate_index(h));
 		goto out_mutex;
-- 
2.50.0

