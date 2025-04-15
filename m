Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7304D205AB8
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 05:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744696040; cv=none; b=YfoZTyy4bWUzC/kR38Us2unHDWAixgifjBnQ01ACfLH4rGTVCh1Nc9JsMfwnZF+R4hxh7Qo4l83cRXvRrKJ+OxJcy+DLDRU4hwNSJsjEGIVWbGQz9rScmBYshPgxVdp07+ix6pzmdXdNc2u7MWbFRm+JmTQrWrjM7C+VsbPxCr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744696040; c=relaxed/simple;
	bh=H9Bcya8I6v9xPGtKD76r4DW4ffUowuK7+mQUR2YsV60=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sC2m2LLR3q0G+s+/BDChNPnbzzsHwhMBay4B44vGvWaNjqdYwgQ21mAgJZ81d2hg2iNI5rvWmEAQDIyIoiTOOhUIkaRopndLUXqx2c25Pog6BcFy79FbLv94yryFXrmOb6hmV539PyKaS8VGwhLA4C4xLVRQSMyQpzl/cxg69AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KYsGpmaM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wMTYom4A; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KYsGpmaM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wMTYom4A; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KYsGpmaM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wMTYom4A";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KYsGpmaM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wMTYom4A"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4DA931F38A;
	Tue, 15 Apr 2025 05:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744696036; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Jk6Zy4/AUwBU7wb2nBxfNQOQXPbgWFB6fRcPP6ab5vU=;
	b=KYsGpmaMNkYQZsnqC9EgB1TaCK+6Fs7+dx9WZeomoltuPfereu2PriOYYBvVcLRicNjBKJ
	/JH3xKbRUlURIAHyFZnXAZYF2hNZ5kV8O4rF9+w66apPJAOWtqazmCSqiNXtEbNmiFTt0H
	aD2KPlkGu2Tn6XYfh8qjOOd3ZoHf47o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744696036;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Jk6Zy4/AUwBU7wb2nBxfNQOQXPbgWFB6fRcPP6ab5vU=;
	b=wMTYom4AnX077uvX3q64GYuD5atZcOXWMh8igLbRr/7omMTB5hFdxHQyWhJuuOs19bvC6f
	pDzrTlcTfq7UnNCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744696036; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Jk6Zy4/AUwBU7wb2nBxfNQOQXPbgWFB6fRcPP6ab5vU=;
	b=KYsGpmaMNkYQZsnqC9EgB1TaCK+6Fs7+dx9WZeomoltuPfereu2PriOYYBvVcLRicNjBKJ
	/JH3xKbRUlURIAHyFZnXAZYF2hNZ5kV8O4rF9+w66apPJAOWtqazmCSqiNXtEbNmiFTt0H
	aD2KPlkGu2Tn6XYfh8qjOOd3ZoHf47o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744696036;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Jk6Zy4/AUwBU7wb2nBxfNQOQXPbgWFB6fRcPP6ab5vU=;
	b=wMTYom4AnX077uvX3q64GYuD5atZcOXWMh8igLbRr/7omMTB5hFdxHQyWhJuuOs19bvC6f
	pDzrTlcTfq7UnNCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C7E6113927;
	Tue, 15 Apr 2025 05:47:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kc+5LePy/We2EwAAD6G6ig
	(envelope-from <osalvador@suse.de>); Tue, 15 Apr 2025 05:47:15 +0000
From: Oscar Salvador <osalvador@suse.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Muchun Song <muchun.song@linux.dev>,
	David Hildenbrand <david@redhat.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Vlastimil Babka <vbabka@suse.cz>,
	Matthew Wilcox <willy@infradead.org>,
	Oscar Salvador <osalvador@suse.de>
Subject: [PATCH] mm, hugetlb: Reset mapping to TAIL_MAPPING before restoring vmemmap
Date: Tue, 15 Apr 2025 07:47:05 +0200
Message-ID: <20250415054705.370412-1-osalvador@suse.de>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid]
X-Spam-Score: -2.80
X-Spam-Flag: NO

commit 4eeec8c89a0c ("mm: move hugetlb specific things in folio to page[3]")
shifted hugetlb specific stuff, and now mapping overlaps _hugetlb_cgroup field.

_hugetlb_cgroup is set to NULL when preparing the hugetlb page in
init_new_hugetlb_folio().
For a better picture, this is page->mapping before and after the comming
for the first three tail pages:

before:
page: fffff51a44358040  0000000000000000
page: fffff51a44358080  0000000000000000
page: fffff51a443580c0  dead000000000400

after:
page: fffff1f0042b0040  0000000000000000
page: fffff1f0042b0080  fffff1f0042b0090
page: fffff1f0042b00c0  0000000000000000

Tail#2 has fffff1f0042b0090 because of the _deferred_list initialization,
which was also shifted, but that is not a problem.

For HVO, upon restoring that gets copied in some tail pages (reset_struct_pages)
and so those tail pages will not have TAIL_MAPPING set and the check
in free_tail_page_prepare() will fail:

 kernel: BUG: Bad page state in process kworker/0:3  pfn:10ac40
 kernel: page does not match folio
 kernel: page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x10ac40
 kernel: flags: 0x17ffffc0000000(node=0|zone=2|lastcpupid=0x1fffff)
 kernel: raw: 0017ffffc0000000 fffff1f0042b0000 0000000000000000 0000000000000000
 kernel: raw: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000000
 kernel: page dumped because: corrupted mapping in tail page

Reset _hugetlb_cgroup to TAIL_MAPPING before restoring so tail pages have the
right value.

Signed-off-by: Oscar Salvador <osalvador@suse.de>
---
Hi guys,

Although I can no longer reproduce the issue with this patch, I'm not entirely
sure this is the right way to fix the problem, so I'm open to
suggestions.
---
 mm/hugetlb_vmemmap.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 9a99dfa3c495..3d763182c834 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -498,6 +498,12 @@ static int __hugetlb_vmemmap_restore_folio(const struct hstate *h,
  */
 int hugetlb_vmemmap_restore_folio(const struct hstate *h, struct folio *folio)
 {
+	/*
+	 * Before restoring vmemmap, make sure to reset mapping to TAIL_MAPPING,
+	 * so tail pages that were reset will have the right thing after being
+	 * restored, and the checks in free_tail_page_prepare() will pass.
+	 */
+	set_hugetlb_cgroup(folio, TAIL_MAPPING);
 	return __hugetlb_vmemmap_restore_folio(h, folio, VMEMMAP_SYNCHRONIZE_RCU);
 }
 
-- 
2.49.0

