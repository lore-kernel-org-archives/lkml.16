Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12D91C5D7B
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 12:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750422644; cv=none; b=k50qY1Y73g2gyvnhoHVVZwswv+q/nCE17bGBUL7MuxH6gReks24LjCeTCTxkOf5327HJpF6s3WrD2jD0+rzSYu+DvTT3zuZgPXGtmZb2pUZAvR3XNPDVd0pSYRJ/FSXgBuxUkAzVh3dZWfJmgweXbYIB1iJ/E3RlsBlBKqJtV7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750422644; c=relaxed/simple;
	bh=07/pZfCDAJ9okFUghNJ3W/JUw1tdKSQ0ShoQtA0MFrI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KzMkybh1sYerxMBVBkrm6oKn5GfBoVomsIhxKBFPubPrBzvhtcgrzbTGUsmNXvUSV9k2Hhz67/N5vCd66qDN4XNhiK9zd4zBHNLU7Z0ypEi6dC/Iugehili7YFtsXb94AG0SyKELSoYDWX34Ph81eZSxA3QP3WR0tSBbpaNebNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 877541F38D;
	Fri, 20 Jun 2025 12:30:30 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1077613A99;
	Fri, 20 Jun 2025 12:30:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sH9WAWZUVWjNKAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Fri, 20 Jun 2025 12:30:30 +0000
From: Oscar Salvador <osalvador@suse.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>,
	Muchun Song <muchun.song@linux.dev>,
	Peter Xu <peterx@redhat.com>,
	Gavin Guo <gavinguo@igalia.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Oscar Salvador <osalvador@suse.de>
Subject: [PATCH v2 5/5] mm,hugetlb: Drop unlikelys from hugetlb_fault
Date: Fri, 20 Jun 2025 14:30:14 +0200
Message-ID: <20250620123014.29748-6-osalvador@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620123014.29748-1-osalvador@suse.de>
References: <20250620123014.29748-1-osalvador@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: 877541F38D
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -4.00

The unlikely predates an era where we were checking for hwpoisoned/migration
entries prior to checking whether the pte was present.

Currently, we check for the pte to be a migration/hwpoison entry after we
have checked that is not present, so it must be either one or the other.

Signed-off-by: Oscar Salvador <osalvador@suse.de>
---
 mm/hugetlb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 868ee8ed45c0..1ef554b6934a 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -6748,7 +6748,7 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
 
 	/* Not present, either a migration or a hwpoisoned entry */
 	if (!pte_present(vmf.orig_pte)) {
-		if (unlikely(is_hugetlb_entry_migration(vmf.orig_pte))) {
+		if (is_hugetlb_entry_migration(vmf.orig_pte)) {
 			/*
 			 * Release the hugetlb fault lock now, but retain
 			 * the vma lock, because it is needed to guard the
@@ -6759,7 +6759,7 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
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

