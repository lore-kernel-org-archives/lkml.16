Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF62B28CF76
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 14:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751294561; cv=none; b=JRZF60dq4o8IP038pZQSuLIkLrpLipU6cIDovqwIdSMmzg5JZNHvwqeD3ayZuuT7RA/drt5dcgbZR+C2jngbXyiUU7rSdz4GGn1r0DK+DAGsPvbkipHlxOg2YoBQvTHVxdlO42Dv1iTMPJRae3pokXfdHzJSvTEhp0TCUbnJ8KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751294561; c=relaxed/simple;
	bh=wNc5/0oYy9n47qFvbw589KeGQi7wI1lepwH1WsSR3yU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vAoOcNW32e0ynlqGWvOdec+s5G70W6SnoIAvutrypUNQpNRq5niO8T6TNptlFfIAau0+fMfKuKOO61XrEz0fC3j4TGlaTk0OFSiTgX8R2dxXdNgQBqCfUzyCSyWgprE9Dl7sQz4AXL9uDcXQhl0QdfN2GaMhkBRuHzR4VeadR2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ErG1j74Z; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SVjaLSc+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ErG1j74Z; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SVjaLSc+; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ErG1j74Z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SVjaLSc+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ErG1j74Z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SVjaLSc+"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5268521169;
	Mon, 30 Jun 2025 14:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751294539; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I/0nrP3gEwMU8Fn4GtEZKqKPsnJhVzjLl9aZ9S6/OZg=;
	b=ErG1j74ZDfTCSF0jDtWMy7eMFoREIa+dH54jLRbAtEd/+HJYayYIXfTuI7aAyxoYhsLaIx
	/6KzhxVVr20gGd42bQQo+fP4BDYwolkMiBalHr2egN0762gaOk1TrmanYxMbkL/hGWWcP9
	H9vIqrX3lLN1wpnoIILvVQJRqjtln24=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751294539;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I/0nrP3gEwMU8Fn4GtEZKqKPsnJhVzjLl9aZ9S6/OZg=;
	b=SVjaLSc+Qk0F3x37ufNyImVLYi7z8sovgvTcJbk0HtoNj2VBgjqeFYVOpop0iRxXfZ/bKO
	aAqc18JLN+ZD5FBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ErG1j74Z;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=SVjaLSc+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751294539; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I/0nrP3gEwMU8Fn4GtEZKqKPsnJhVzjLl9aZ9S6/OZg=;
	b=ErG1j74ZDfTCSF0jDtWMy7eMFoREIa+dH54jLRbAtEd/+HJYayYIXfTuI7aAyxoYhsLaIx
	/6KzhxVVr20gGd42bQQo+fP4BDYwolkMiBalHr2egN0762gaOk1TrmanYxMbkL/hGWWcP9
	H9vIqrX3lLN1wpnoIILvVQJRqjtln24=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751294539;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I/0nrP3gEwMU8Fn4GtEZKqKPsnJhVzjLl9aZ9S6/OZg=;
	b=SVjaLSc+Qk0F3x37ufNyImVLYi7z8sovgvTcJbk0HtoNj2VBgjqeFYVOpop0iRxXfZ/bKO
	aAqc18JLN+ZD5FBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CE49E13A24;
	Mon, 30 Jun 2025 14:42:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2PyqL0qiYmjqdAAAD6G6ig
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
Subject: [PATCH v4 5/5] mm,hugetlb: drop unlikelys from hugetlb_fault
Date: Mon, 30 Jun 2025 16:42:12 +0200
Message-ID: <20250630144212.156938-6-osalvador@suse.de>
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
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 5268521169
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,linux.dev:email];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_RATELIMIT(0.00)[to_ip_from(RLfw9wkb71jz54yo3bnq4aib6i)];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01
X-Spam-Level: 

The unlikely predates an era where we were checking for
hwpoisoned/migration entries prior to checking whether the pte was
present.

Currently, we check for the pte to be a migration/hwpoison entry after we
have checked that is not present, so it must be either one or the other.

Link: https://lkml.kernel.org/r/20250627102904.107202-6-osalvador@suse.de
Signed-off-by: Oscar Salvador <osalvador@suse.de>
Cc: David Hildenbrand <david@redhat.com>
Cc: Gavin Guo <gavinguo@igalia.com>
Cc: Muchun Song <muchun.song@linux.dev>
Cc: Peter Xu <peterx@redhat.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---
 mm/hugetlb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index ba078aa1cb96..fda6b748e985 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -6747,7 +6747,7 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
 
 	/* Not present, either a migration or a hwpoisoned entry */
 	if (!pte_present(vmf.orig_pte)) {
-		if (unlikely(is_hugetlb_entry_migration(vmf.orig_pte))) {
+		if (is_hugetlb_entry_migration(vmf.orig_pte)) {
 			/*
 			 * Release the hugetlb fault lock now, but retain
 			 * the vma lock, because it is needed to guard the
@@ -6758,7 +6758,7 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
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

