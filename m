Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C3F22CBEC
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 14:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748873793; cv=none; b=o37tYh9uUAs+W10XKkwp/gGglRgKlbPLqECRvvBONIH6V41sAcDtqI4MulMd+f49ilObSgOkGhwlsAvWv2z8GIWBqozOhB13lZ+0uXWZzv4lGizxBoRs/NdFy19DHUz6vOK3xHNv+GIIvDsXNsCRuE7WUW5YfF+/pR80OkTL2N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748873793; c=relaxed/simple;
	bh=OagGubIDdITTlh5M+MMlyhgI2JNyyx1zwsAZCR34iHc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VFe+nUTJBJfNzm1eCgcmJ5kYfk/gJMb/5cASuDjDbLMZ4SHjoRrRjsE8foQ32oqdXo+l8rnf7s2VYl8K6A7209pretPBm6Y5QDidbHHxMB6jiISYLCInqpf/hIcpmB9T3Gzc2RI+3ZOdp32+OUCyqJFGSOlIqXMVDCEeMa69d/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=190ZZex1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=k7CGi+j4; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=190ZZex1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=k7CGi+j4; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="190ZZex1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="k7CGi+j4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="190ZZex1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="k7CGi+j4"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9BD1F21994;
	Mon,  2 Jun 2025 14:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1748873784; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=26hIJaIlsEh8asQLVwhKQAe/u/26xTMmcWw8TsHGbT4=;
	b=190ZZex1ahKmfXCarDoa3eHYQvAz6PPVj5936zI85GRurs0Q9B+d3kir3z3XAgpH8LxApV
	NvLFU344kb2e+vVDWwc65UN3LWw35B9r0MjYxp35tUNcV+9yGK7bG0iOrxnmhvG/4ULJL9
	TmXuPt0L3rQQp6YwAerSX22itg6E4DQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1748873784;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=26hIJaIlsEh8asQLVwhKQAe/u/26xTMmcWw8TsHGbT4=;
	b=k7CGi+j4q4iY/gg0l89lsFFwp/h5io53f8CRbA2g0X6z+mdJyIFWZlsIwY8k0G7WBrca8h
	emhnV8sxTSCtHRCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1748873784; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=26hIJaIlsEh8asQLVwhKQAe/u/26xTMmcWw8TsHGbT4=;
	b=190ZZex1ahKmfXCarDoa3eHYQvAz6PPVj5936zI85GRurs0Q9B+d3kir3z3XAgpH8LxApV
	NvLFU344kb2e+vVDWwc65UN3LWw35B9r0MjYxp35tUNcV+9yGK7bG0iOrxnmhvG/4ULJL9
	TmXuPt0L3rQQp6YwAerSX22itg6E4DQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1748873784;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=26hIJaIlsEh8asQLVwhKQAe/u/26xTMmcWw8TsHGbT4=;
	b=k7CGi+j4q4iY/gg0l89lsFFwp/h5io53f8CRbA2g0X6z+mdJyIFWZlsIwY8k0G7WBrca8h
	emhnV8sxTSCtHRCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 19E4913AE1;
	Mon,  2 Jun 2025 14:16:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yN54AziyPWhqVAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Mon, 02 Jun 2025 14:16:24 +0000
From: Oscar Salvador <osalvador@suse.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Muchun Song <muchun.song@linux.dev>,
	David Hildenbrand <david@redhat.com>,
	James Houghton <jthoughton@google.com>,
	Peter Xu <peterx@redhat.com>,
	Gavin Guo <gavinguo@igalia.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Oscar Salvador <osalvador@suse.de>
Subject: [RFC PATCH 3/3] mm, hugetlb: Drop unlikelys from hugetlb_fault
Date: Mon,  2 Jun 2025 16:16:10 +0200
Message-ID: <20250602141610.173698-4-osalvador@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250602141610.173698-1-osalvador@suse.de>
References: <20250602141610.173698-1-osalvador@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -6.80
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 

The unlikely predates an era where we were checking for
hwpoisoned/migration entries without knowing whether the pte was
present.

The code-flow has changed, and we do not do that anymore, plus
they do not bring any advantatge at all.

Signed-off-by: Oscar Salvador <osalvador@suse.de>
---
 mm/hugetlb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 6ef90958839f..02ede63e7e5e 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -6768,7 +6768,7 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
 	 * or hwpoisoned entry.
 	 */
 	if (!pte_present(vmf.orig_pte)) {
-		if (unlikely(is_hugetlb_entry_migration(vmf.orig_pte))) {
+		if (is_hugetlb_entry_migration(vmf.orig_pte)) {
 			/*
 			 * Release the hugetlb fault lock now, but retain
 			 * the vma lock, because it is needed to guard the
@@ -6779,7 +6779,7 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
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

