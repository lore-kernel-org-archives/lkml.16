Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1B3257435
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 13:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750770248; cv=none; b=eSfWRTkcdXHtM/xDV21fkFnJezy6RDCZUi8HqIsY/qdHurfVDHuxLUgqL4hfkmAkcNuSQKyRVeIBaP+G0nZQF8Qan5VZfjVnuFY3rZRiHmh2tnZJ560iVp7DHpEG3RpzAbW/g4XNbAm9Rl+kS0t8Q8eIwuVGX3IPZ8SKemIsXzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750770248; c=relaxed/simple;
	bh=rRAO5JDl/GFSSyC/skOkwiCLgk5I6TM14uLkwKcXPaA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iUcfzHeTC8i98QCO8lRBU01eHSpl+AWo+l1Ayf+EhdnLCPCA0B346Jmj9Ce7OtWsWglxc04wbKH64mO2jT/sfvdbc1g4+s804RfIQSbkirrq/vEbc1goXtIRla6507nY3+a7t0j/et+ZPQysoggXcu/M0/Na9GS50w8XDWTm2Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=ruYd/FUD; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=n3ZF4xdc; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=ruYd/FUD; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=n3ZF4xdc; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="ruYd/FUD";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="n3ZF4xdc";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="ruYd/FUD";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="n3ZF4xdc"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 37DA9211E4;
	Tue, 24 Jun 2025 13:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1750770238; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8Ch+zCO8SYGhDyPI51jKs0XFTLHSpFudRVEK6OHgTHg=;
	b=ruYd/FUDPfpI3FqCdM3DfkW10+Y1GSceaVdQJ7//oONLzXmX3KkkXZtYmsKsmIVGhDe2Kg
	7dPr0ahTNhJKkgNknFBYFjyZiS0+4feikC7wchFdDs1AxJ2FunHdR/dVF3B8xMSVdJUOzJ
	G1lbiJ1s1PymzSK1TZhDA/F5QMLp6oc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1750770238;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8Ch+zCO8SYGhDyPI51jKs0XFTLHSpFudRVEK6OHgTHg=;
	b=n3ZF4xdcktsWGFJYdYoEt0qgrl0uegOmDEt2ex/mM0iA7aktx3GO+7IDdaK0cAeqdC837m
	n3uKYUElrRVH2BBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1750770238; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8Ch+zCO8SYGhDyPI51jKs0XFTLHSpFudRVEK6OHgTHg=;
	b=ruYd/FUDPfpI3FqCdM3DfkW10+Y1GSceaVdQJ7//oONLzXmX3KkkXZtYmsKsmIVGhDe2Kg
	7dPr0ahTNhJKkgNknFBYFjyZiS0+4feikC7wchFdDs1AxJ2FunHdR/dVF3B8xMSVdJUOzJ
	G1lbiJ1s1PymzSK1TZhDA/F5QMLp6oc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1750770238;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8Ch+zCO8SYGhDyPI51jKs0XFTLHSpFudRVEK6OHgTHg=;
	b=n3ZF4xdcktsWGFJYdYoEt0qgrl0uegOmDEt2ex/mM0iA7aktx3GO+7IDdaK0cAeqdC837m
	n3uKYUElrRVH2BBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 207A213A9D;
	Tue, 24 Jun 2025 13:03:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CFSmBz6iWmjqYQAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Tue, 24 Jun 2025 13:03:58 +0000
From: Vlastimil Babka <vbabka@suse.cz>
Date: Tue, 24 Jun 2025 15:03:47 +0200
Subject: [PATCH v2 3/4] mm, madvise: move madvise_set_anon_name() down the
 file
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-anon_name_cleanup-v2-3-600075462a11@suse.cz>
References: <20250624-anon_name_cleanup-v2-0-600075462a11@suse.cz>
In-Reply-To: <20250624-anon_name_cleanup-v2-0-600075462a11@suse.cz>
To: Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 David Hildenbrand <david@redhat.com>, Jann Horn <jannh@google.com>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Colin Cross <ccross@google.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Vlastimil Babka <vbabka@suse.cz>
X-Mailer: b4 0.14.2
X-Spamd-Result: default: False [-8.30 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RL7wgbib1ih6q11z93xiyrfhpt)];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,suse.cz:mid]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -8.30

Preparatory change so that we can use madvise_lock()/unlock() in the
function without forward declarations or more thorough shuffling.

Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
---
 mm/madvise.c | 64 ++++++++++++++++++++++++++++++------------------------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index 7e8819b5e9a0f183213ffe19d7e52bd5fda5f49d..cae064479cdf908707c45b941bd03d43d095eab6 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -133,38 +133,6 @@ static int replace_anon_vma_name(struct vm_area_struct *vma,
 
 	return 0;
 }
-
-static int madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
-		unsigned long len_in, struct anon_vma_name *anon_name)
-{
-	unsigned long end;
-	unsigned long len;
-	struct madvise_behavior madv_behavior = {
-		.mm = mm,
-		.behavior = __MADV_SET_ANON_VMA_NAME,
-		.lock_mode = MADVISE_MMAP_WRITE_LOCK,
-		.anon_name = anon_name,
-	};
-
-	if (start & ~PAGE_MASK)
-		return -EINVAL;
-	len = (len_in + ~PAGE_MASK) & PAGE_MASK;
-
-	/* Check to see whether len was rounded up from small -ve to zero */
-	if (len_in && !len)
-		return -EINVAL;
-
-	end = start + len;
-	if (end < start)
-		return -EINVAL;
-
-	if (end == start)
-		return 0;
-
-	madv_behavior.range.start = start;
-	madv_behavior.range.end = end;
-	return madvise_walk_vmas(&madv_behavior);
-}
 #else /* CONFIG_ANON_VMA_NAME */
 static int replace_anon_vma_name(struct vm_area_struct *vma,
 				 struct anon_vma_name *anon_name)
@@ -2109,6 +2077,38 @@ static inline bool is_valid_name_char(char ch)
 		!strchr(ANON_VMA_NAME_INVALID_CHARS, ch);
 }
 
+static int madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
+		unsigned long len_in, struct anon_vma_name *anon_name)
+{
+	unsigned long end;
+	unsigned long len;
+	struct madvise_behavior madv_behavior = {
+		.mm = mm,
+		.behavior = __MADV_SET_ANON_VMA_NAME,
+		.lock_mode = MADVISE_MMAP_WRITE_LOCK,
+		.anon_name = anon_name,
+	};
+
+	if (start & ~PAGE_MASK)
+		return -EINVAL;
+	len = (len_in + ~PAGE_MASK) & PAGE_MASK;
+
+	/* Check to see whether len was rounded up from small -ve to zero */
+	if (len_in && !len)
+		return -EINVAL;
+
+	end = start + len;
+	if (end < start)
+		return -EINVAL;
+
+	if (end == start)
+		return 0;
+
+	madv_behavior.range.start = start;
+	madv_behavior.range.end = end;
+	return madvise_walk_vmas(&madv_behavior);
+}
+
 int set_anon_vma_name(unsigned long addr, unsigned long size,
 		      const char __user *uname)
 {

-- 
2.50.0

