Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F0A26D4F9
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 15:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750690811; cv=none; b=LrQ3N2xFI1QAcdAcB2hBrlhsMaNjSFtaEG5CiHzuDH2PyxObjlB8Cxd19DqY7dsZQTWWzlgZJtLfTFDbrvoQXT37ribC8QVQWBnQ1k23fe/WovBFbidfqtLj4/2bOt6njjPAqmwnD+7F+FZZ1Y15nM0hNuakBQPrX/EScs/6TJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750690811; c=relaxed/simple;
	bh=4WsgUXbLY0jc0mbRG783m2rvtMBeNkFlZ+M53fOqgQc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N/UlH/7QcKgNpTYGkPhaBJe5/3dGnqea121j4uj0gBHcaNYWsryE8ARKUuAuJdvuhEI2PFPFRuj9tAHt8BKHEWO8itkfnTT35/qr7gVMcVM6eLNwmBb8DrjBTN7sCnP6V/dSrxwFyPgzXctKzGDrwl1A3oLWogvgCoV6F748Duo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=LsltKSh7; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=3QGGQPQY; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=LsltKSh7; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=3QGGQPQY; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="LsltKSh7";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="3QGGQPQY";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="LsltKSh7";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="3QGGQPQY"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DE44B21171;
	Mon, 23 Jun 2025 15:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1750690807; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7/Jc4wLf1uWOsp0HxTYybBk/EP+fch0a8kNEf01YT1k=;
	b=LsltKSh71DUd1V0Wu/8KDakVY1WVlIt5xD3Y97gJP+m4K+U20L3u1CAnSZZBn47m95IKfW
	DEnz935sWGXUhUypl1o+8KpMKODz9kmk1R3XAKKumaUTLMp/t7P4yorE8/EZUOrWNZfaHF
	0bmRU0cCsg9dVQvoz2c9V6GjQBI9hno=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1750690807;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7/Jc4wLf1uWOsp0HxTYybBk/EP+fch0a8kNEf01YT1k=;
	b=3QGGQPQYlA/R+gdMm5D1wKLHbSkMiEAxL3TKRSFmSaRooBk/hYdp38KCO+d6ot/ASHzlH+
	C6CvsiMueITxR2Bg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1750690807; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7/Jc4wLf1uWOsp0HxTYybBk/EP+fch0a8kNEf01YT1k=;
	b=LsltKSh71DUd1V0Wu/8KDakVY1WVlIt5xD3Y97gJP+m4K+U20L3u1CAnSZZBn47m95IKfW
	DEnz935sWGXUhUypl1o+8KpMKODz9kmk1R3XAKKumaUTLMp/t7P4yorE8/EZUOrWNZfaHF
	0bmRU0cCsg9dVQvoz2c9V6GjQBI9hno=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1750690807;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7/Jc4wLf1uWOsp0HxTYybBk/EP+fch0a8kNEf01YT1k=;
	b=3QGGQPQYlA/R+gdMm5D1wKLHbSkMiEAxL3TKRSFmSaRooBk/hYdp38KCO+d6ot/ASHzlH+
	C6CvsiMueITxR2Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C64F113AC4;
	Mon, 23 Jun 2025 15:00:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cMwkMPdrWWi8cQAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Mon, 23 Jun 2025 15:00:07 +0000
From: Vlastimil Babka <vbabka@suse.cz>
Date: Mon, 23 Jun 2025 16:59:50 +0200
Subject: [PATCH RFC 1/2] mm, madvise: simplify anon_name handling
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-anon_name_cleanup-v1-1-04c94384046f@suse.cz>
References: <20250623-anon_name_cleanup-v1-0-04c94384046f@suse.cz>
In-Reply-To: <20250623-anon_name_cleanup-v1-0-04c94384046f@suse.cz>
To: Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 David Hildenbrand <david@redhat.com>, Jann Horn <jannh@google.com>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Colin Cross <ccross@google.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Vlastimil Babka <vbabka@suse.cz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5386; i=vbabka@suse.cz;
 h=from:subject:message-id; bh=4WsgUXbLY0jc0mbRG783m2rvtMBeNkFlZ+M53fOqgQc=;
 b=owEBbQGS/pANAwAIAbvgsHXSRYiaAcsmYgBoWWvx+Oz6hY4snQoKDFRhXbnRE58Be0Ib+D0Ix
 Y1TfxhA9yOJATMEAAEIAB0WIQR7u8hBFZkjSJZITfG74LB10kWImgUCaFlr8QAKCRC74LB10kWI
 mso2CACBbp5TpPZEK987JqU7y7hewVG041bmZcQcTHTMISg3CzJmkx4bR/8VBOHGcmJ6SdycVHG
 /CyS2Pzjq7ZE5ESEltg5jEsEJgL9ApB61yWTKMhL4gUOuwMDBY7oP1d1Rt29fj/4MIHPeUOACWA
 ejdSwt380Vw1BTnL+VzvVvTI7BchJzP6K/tbdJic3NYlg8XH+HPx2nKs4zcKk0V9DRvfEb9h8HB
 5GNuIG7WmscJyLpg6g69jiUDse+zHfWyBxp3qbu1cfhRs2Zvn0SZR/bbCUOrMeyI6pOgcTnYhVw
 1RF23CSkMW9Ckr9jkrfXsEIgTaw1D986nFJ10bIm7sZuGcwd
X-Developer-Key: i=vbabka@suse.cz; a=openpgp;
 fpr=A940D434992C2E8E99103D50224FA7E7CC82A664
X-Spam-Flag: NO
X-Spam-Score: -8.30
X-Spamd-Result: default: False [-8.30 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:mid,suse.cz:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 

Since the introduction in 9a10064f5625 ("mm: add a field to store names
for private anonymous memory") the code to set anon_name on a vma has
been using madvise_update_vma() to call replace_vma_anon_name(). Since
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

The remaining reason to obtain the vma's existing anon_name is to pass
it to vma_modify_flags_name() for the splitting and merging to work
properly. In case of merging, the vma might be freed along with the
anon_name, but madvise_update_vma() will not access it afterwards so the
UAF previously fixed by commit 942341dcc574 is not reintroduced.

Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
---
 mm/madvise.c | 37 +++++++++++++------------------------
 1 file changed, 13 insertions(+), 24 deletions(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index 4491bf080f55d6d1aeffb2ff0b8fdd28904af950..ae29395b4fc7f65a449c5772b1901a90f4195885 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -176,21 +176,25 @@ static int replace_anon_vma_name(struct vm_area_struct *vma,
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
-	struct anon_vma_name *anon_name = madv_behavior->anon_name;
+	bool set_new_anon_name = madv_behavior->behavior == __MADV_SET_ANON_VMA_NAME;
+	struct anon_vma_name *anon_name;
 	VMA_ITERATOR(vmi, madv_behavior->mm, range->start);
 
-	if (new_flags == vma->vm_flags && anon_vma_name_eq(anon_vma_name(vma), anon_name))
+	if (set_new_anon_name)
+		anon_name = madv_behavior->anon_name;
+	else
+		anon_name = anon_vma_name(vma);
+
+	if (new_flags == vma->vm_flags && (!set_new_anon_name
+			|| anon_vma_name_eq(anon_vma_name(vma), anon_name)))
 		return 0;
 
 	vma = vma_modify_flags_name(&vmi, madv_behavior->prev, vma,
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

