Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0EE23A58B
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 13:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750770241; cv=none; b=oNkUyOf67OUrus2WctAqy+jQmd6CaGJhH9ejOxjUN2/Ram62/cJgwa5XaIMFpz5/p3EyuXUS/9NDbl1Xl2ICssxuXXmykZ4AAldZFMn1xKVmgrD/asR1EDk/c13130BETy7RcEhN4bg7XRaNryXQZHkAss4R+tuSbrNwZ4+wrtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750770241; c=relaxed/simple;
	bh=O0v3zy9h53nrdU6xpyXTFsCZQCpRbBEsVqLNjLyT+k4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tMCp7oakyd6W04DkhYKzw0SHihOP5k5bskG2k4Rqeh4lsEiIGuSd+iLNxlAFqFIbwPro8xgKhwFo0TWJvjV2FDMTH1tk5MEcFZ6dO4rcxDizR3BIb8TlMEszxaWybYrSNYCckNFgQkPNaR32QIZE3NtgKBSMzM/9zqGQeM9WPgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=OnTBERMi; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=31gfkjTw; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=OnTBERMi; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=31gfkjTw; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="OnTBERMi";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="31gfkjTw";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="OnTBERMi";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="31gfkjTw"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0FEA11F45F;
	Tue, 24 Jun 2025 13:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1750770238; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2v6v5+BvY+B1K5nIDIeewe2c1YreYO69aop0s8USUaA=;
	b=OnTBERMiagKgL9XhfAbv49QeE7mzaeaYso2cAxCly+1yuhp2jGpMhg94n8K5yKg7YsXx9y
	ATXwdp8fHov4F3hIhT2QPVpL2YsrLz+rpHxNemZtG41UqMaR2PjekEjF5gNk+uAcBjZrF0
	R68TX9x/8iDohCZ390rDJ2n9tOi6YwY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1750770238;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2v6v5+BvY+B1K5nIDIeewe2c1YreYO69aop0s8USUaA=;
	b=31gfkjTwatQpCNGJncOFN1rbOBGYaSooNrYb1zeM5NS34c0A4f/Un/z9tBTarRlCYtDdYx
	nLdJqeQMY4RZUiBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1750770238; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2v6v5+BvY+B1K5nIDIeewe2c1YreYO69aop0s8USUaA=;
	b=OnTBERMiagKgL9XhfAbv49QeE7mzaeaYso2cAxCly+1yuhp2jGpMhg94n8K5yKg7YsXx9y
	ATXwdp8fHov4F3hIhT2QPVpL2YsrLz+rpHxNemZtG41UqMaR2PjekEjF5gNk+uAcBjZrF0
	R68TX9x/8iDohCZ390rDJ2n9tOi6YwY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1750770238;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2v6v5+BvY+B1K5nIDIeewe2c1YreYO69aop0s8USUaA=;
	b=31gfkjTwatQpCNGJncOFN1rbOBGYaSooNrYb1zeM5NS34c0A4f/Un/z9tBTarRlCYtDdYx
	nLdJqeQMY4RZUiBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id ED19B13A96;
	Tue, 24 Jun 2025 13:03:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2BKVOT2iWmjqYQAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Tue, 24 Jun 2025 13:03:57 +0000
From: Vlastimil Babka <vbabka@suse.cz>
Date: Tue, 24 Jun 2025 15:03:45 +0200
Subject: [PATCH v2 1/4] mm, madvise: simplify anon_name handling
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-anon_name_cleanup-v2-1-600075462a11@suse.cz>
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

Since the introduction in 9a10064f5625 ("mm: add a field to store names
for private anonymous memory") the code to set anon_name on a vma has
been using madvise_update_vma() to call replace_anon_vma_name(). Since
the former is called also by a number of other madvise behaviours that
do not set a new anon_name, they have been passing the existing
anon_name of the vma to make replace_vma_anon_name() a no-op.

This is rather wasteful as it needs anon_vma_name_eq() to determine the
no-op situations, and checks for when replace_vma_anon_name() is allowed
(the vma is anon/shmem) duplicate the checks already done earlier in
madvise_vma_behavior(). It has also lead to commit 942341dcc574 ("mm:
fix use-after-free when anon vma name is used after vma is freed")
adding anon_name refcount get/put operations exactly to the cases that
actually do not change anon_name - just so the replace_vma_anon_name()
can keep safely determining it has nothing to do.

The recent madvise cleanups made this suboptimal handling very obvious,
but happily also allow for an easy fix. madvise_update_vma() now has the
complete information whether it's been called to set a new anon_name, so
stop passing it the existing vma's name and doing the refcount get/put
in its only caller madvise_vma_behavior().

In madvise_update_vma() itself, limit calling of replace_anon_vma_name()
only to cases where we are setting a new name, otherwise we know it's a
no-op. We can rely solely on the __MADV_SET_ANON_VMA_NAME behaviour and
can remove the duplicate checks for vma being anon/shmem that were done
already in madvise_vma_behavior().

Additionally, by using vma_modify_flags() when not modifying the
anon_name, avoid explicitly passing the existing vma's anon_name and
storing a pointer to it in struct madv_behavior or a local variable.
This prevents the danger of accessing a freed anon_name after vma
merging, previously fixed by commit 942341dcc574.

Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
---
 mm/madvise.c | 37 +++++++++++++------------------------
 1 file changed, 13 insertions(+), 24 deletions(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index 4491bf080f55d6d1aeffb2ff0b8fdd28904af950..fca0e9b3e844ad766e83ac04cc0d7f4099c74005 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -176,25 +176,29 @@ static int replace_anon_vma_name(struct vm_area_struct *vma,
 }
 #endif /* CONFIG_ANON_VMA_NAME */
 /*
- * Update the vm_flags on region of a vma, splitting it or merging it as
- * necessary.  Must be called with mmap_lock held for writing;
- * Caller should ensure anon_name stability by raising its refcount even when
- * anon_name belongs to a valid vma because this function might free that vma.
+ * Update the vm_flags and/or anon_name on region of a vma, splitting it or
+ * merging it as necessary. Must be called with mmap_lock held for writing.
  */
 static int madvise_update_vma(vm_flags_t new_flags,
 		struct madvise_behavior *madv_behavior)
 {
-	int error;
 	struct vm_area_struct *vma = madv_behavior->vma;
 	struct madvise_behavior_range *range = &madv_behavior->range;
 	struct anon_vma_name *anon_name = madv_behavior->anon_name;
+	bool set_new_anon_name = madv_behavior->behavior == __MADV_SET_ANON_VMA_NAME;
 	VMA_ITERATOR(vmi, madv_behavior->mm, range->start);
 
-	if (new_flags == vma->vm_flags && anon_vma_name_eq(anon_vma_name(vma), anon_name))
+	if (new_flags == vma->vm_flags && (!set_new_anon_name ||
+			anon_vma_name_eq(anon_vma_name(vma), anon_name)))
 		return 0;
 
-	vma = vma_modify_flags_name(&vmi, madv_behavior->prev, vma,
+	if (set_new_anon_name)
+		vma = vma_modify_flags_name(&vmi, madv_behavior->prev, vma,
 			range->start, range->end, new_flags, anon_name);
+	else
+		vma = vma_modify_flags(&vmi, madv_behavior->prev, vma,
+			range->start, range->end, new_flags);
+
 	if (IS_ERR(vma))
 		return PTR_ERR(vma);
 
@@ -203,11 +207,8 @@ static int madvise_update_vma(vm_flags_t new_flags,
 	/* vm_flags is protected by the mmap_lock held in write mode. */
 	vma_start_write(vma);
 	vm_flags_reset(vma, new_flags);
-	if (!vma->vm_file || vma_is_anon_shmem(vma)) {
-		error = replace_anon_vma_name(vma, anon_name);
-		if (error)
-			return error;
-	}
+	if (set_new_anon_name)
+		return replace_anon_vma_name(vma, anon_name);
 
 	return 0;
 }
@@ -1313,7 +1314,6 @@ static int madvise_vma_behavior(struct madvise_behavior *madv_behavior)
 	int behavior = madv_behavior->behavior;
 	struct vm_area_struct *vma = madv_behavior->vma;
 	vm_flags_t new_flags = vma->vm_flags;
-	bool set_new_anon_name = behavior == __MADV_SET_ANON_VMA_NAME;
 	struct madvise_behavior_range *range = &madv_behavior->range;
 	int error;
 
@@ -1403,18 +1403,7 @@ static int madvise_vma_behavior(struct madvise_behavior *madv_behavior)
 	/* This is a write operation.*/
 	VM_WARN_ON_ONCE(madv_behavior->lock_mode != MADVISE_MMAP_WRITE_LOCK);
 
-	/*
-	 * madvise_update_vma() might cause a VMA merge which could put an
-	 * anon_vma_name, so we must hold an additional reference on the
-	 * anon_vma_name so it doesn't disappear from under us.
-	 */
-	if (!set_new_anon_name) {
-		madv_behavior->anon_name = anon_vma_name(vma);
-		anon_vma_name_get(madv_behavior->anon_name);
-	}
 	error = madvise_update_vma(new_flags, madv_behavior);
-	if (!set_new_anon_name)
-		anon_vma_name_put(madv_behavior->anon_name);
 out:
 	/*
 	 * madvise() returns EAGAIN if kernel resources, such as

-- 
2.50.0

