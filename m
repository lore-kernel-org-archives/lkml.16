Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0EC2C15B0
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 13:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750770253; cv=none; b=MN+VbTWS7ZpH4NfFKAvEc59DsseYSe9knB45ePVMiqKSkkQJCGKRqBaSkzXyrU6WuEVhqeb5yA/1ZyAgF2TwnphAWbsaiPM02kQxvL7RdrHPRomkaWaaiAJV00N5X8TlrGzlr9iv17DdicvLkHLLkLk69x8GywAjyOEqmu+pa4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750770253; c=relaxed/simple;
	bh=fkOsy+t+qaACcx9sjCgoEdlw5N/duW/gWOdJkLKYnUc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V7fscJYjZudSt2VoxdVlzjqefr8ZtcMV41j8OFWAI/BRO5SdUWuzUVLF3yobcSd3q3hLH/FOlfNzISqX8pTXEhukeU18TzjzlcpD2jwR2B/UfW/qcBVIQxPrTF11IVJ22CIaBfQ6GOJa1P6H2l2DJF8r2OYlhMcNHJ77Oo4Vrh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=sFg8rAI7; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=Ct7iXai7; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=sFg8rAI7; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=Ct7iXai7; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="sFg8rAI7";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="Ct7iXai7";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="sFg8rAI7";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="Ct7iXai7"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4B2071F74A;
	Tue, 24 Jun 2025 13:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1750770238; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4xVVugloGygpGatajnAlg5Wq+hCv948n+P1il18F82E=;
	b=sFg8rAI7nDBvs7LWKTvjKpmUl+wpaBSlEAnV5/6mlv4eBYEVr+Fgw7ysfWx8h4+47JQY6j
	Kl53owziDE61kyVquaLL7TA31joFDYuVLduNxulP0TZG4Xo17KrQVwaksqFXrMvcEQbTc1
	gpTajf2cIMFeXI/kzD52bLnvxayURjI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1750770238;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4xVVugloGygpGatajnAlg5Wq+hCv948n+P1il18F82E=;
	b=Ct7iXai7wbCRYsRsmYN8DwzI4s9dyPzK0Q/56Xldm5ZfTsad4vYKfFigrJ3yGpEVDu0Q4R
	jZ6DWZfYlSKF1tAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1750770238; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4xVVugloGygpGatajnAlg5Wq+hCv948n+P1il18F82E=;
	b=sFg8rAI7nDBvs7LWKTvjKpmUl+wpaBSlEAnV5/6mlv4eBYEVr+Fgw7ysfWx8h4+47JQY6j
	Kl53owziDE61kyVquaLL7TA31joFDYuVLduNxulP0TZG4Xo17KrQVwaksqFXrMvcEQbTc1
	gpTajf2cIMFeXI/kzD52bLnvxayURjI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1750770238;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4xVVugloGygpGatajnAlg5Wq+hCv948n+P1il18F82E=;
	b=Ct7iXai7wbCRYsRsmYN8DwzI4s9dyPzK0Q/56Xldm5ZfTsad4vYKfFigrJ3yGpEVDu0Q4R
	jZ6DWZfYlSKF1tAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 339E013ACE;
	Tue, 24 Jun 2025 13:03:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aAtTDD6iWmjqYQAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Tue, 24 Jun 2025 13:03:58 +0000
From: Vlastimil Babka <vbabka@suse.cz>
Date: Tue, 24 Jun 2025 15:03:48 +0200
Subject: [PATCH v2 4/4] mm, madvise: use standard madvise locking in
 madvise_set_anon_name()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-anon_name_cleanup-v2-4-600075462a11@suse.cz>
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

Use madvise_lock()/madvise_unlock() in madvise_set_anon_name() in the
same way as in do_madvise(). This narrows the lock scope a bit and
reuses existing functionality. get_lock_mode() already picks the correct
MADVISE_MMAP_WRITE_LOCK mode for __MADV_SET_ANON_VMA_NAME so we can just
remove the explicit assignment.

Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
---
 mm/madvise.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index cae064479cdf908707c45b941bd03d43d095eab6..ee02ccd0315a146cdb3001cd189e03be9e48a2ea 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -2082,10 +2082,10 @@ static int madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
 {
 	unsigned long end;
 	unsigned long len;
+	int error;
 	struct madvise_behavior madv_behavior = {
 		.mm = mm,
 		.behavior = __MADV_SET_ANON_VMA_NAME,
-		.lock_mode = MADVISE_MMAP_WRITE_LOCK,
 		.anon_name = anon_name,
 	};
 
@@ -2106,7 +2106,14 @@ static int madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
 
 	madv_behavior.range.start = start;
 	madv_behavior.range.end = end;
-	return madvise_walk_vmas(&madv_behavior);
+
+	error = madvise_lock(&madv_behavior);
+	if (error)
+		return error;
+	error = madvise_walk_vmas(&madv_behavior);
+	madvise_unlock(&madv_behavior);
+
+	return error;
 }
 
 int set_anon_vma_name(unsigned long addr, unsigned long size,
@@ -2136,9 +2143,7 @@ int set_anon_vma_name(unsigned long addr, unsigned long size,
 			return -ENOMEM;
 	}
 
-	mmap_write_lock(mm);
 	error = madvise_set_anon_name(mm, addr, size, anon_name);
-	mmap_write_unlock(mm);
 	anon_vma_name_put(anon_name);
 
 	return error;

-- 
2.50.0

