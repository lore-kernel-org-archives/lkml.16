Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FCF1DF993
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 12:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743771201; cv=none; b=ns6Q77OuR9YdkqPS0VDwWYcQ9gVNw8kXrIrOFQaja/L+2V0370SoeVamoqpUuwYjOknsWVaoUnPVdFQIB+v0bfNyzgSoxqR8+MrsrOTgChKvJ7uYTrAnBnjre1uxpbB4qc6AeQbYA3VxUbUTdY8JFxElS7u80vsb8v/I4UI0IGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743771201; c=relaxed/simple;
	bh=+cJ1TuCmxASLIjUj4waEA5rUpgkrh9mJXMKRYetWXQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EZieL6Fq53OIEHx2jAyk9sgi0/UIy7eAnwJ9ceeOwCjDcWsJvqMNN3gWLAaVihMXcjRFSm5U+g8+fFSGVxvZ3WkAfntCA1JZocRPwm3stCjjQkVT1XOyWuQ0hURcN1Zr+Cbcxh4G6FLey07dqczMXQhfMGXurl74DHM9DsZ2bU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i/0nb8xg; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i/0nb8xg"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-abbd96bef64so372934566b.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 05:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743771197; x=1744375997; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BxSV5JdfZYerNlQnuHDGWvwKKG0TLYgttgt+Oowf87E=;
        b=i/0nb8xgHYNpwoQDRdzfDqHhqj15u6cnCmlxsFLn7bXwmimPKVtS5hzTqh1fZnGRib
         wPon5zdKpu9WBysolIdDNMWE9MYJqXKL5T/bLEuCRK5E4HTd6Ej1h1yHfPgQSGcIf3qO
         wS5WYNtR5Ccbecc/a+1XDx2zLzOq6wcc5h7e8yyrNLR36QqQj8nntCovJ1lhrdDmBLnK
         3IeX4xUqdGjH0pe0SVkoyY+t5D31co5KhBW8c3iCmHZBMTQq6aJmJEflGJg80payJR4w
         HlBDJRrKkQNiYfzazMg713sbCsZnkfakBgr6R0xfshU242F0+l5SAT/mxKTfYMWe9894
         tlZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743771197; x=1744375997;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BxSV5JdfZYerNlQnuHDGWvwKKG0TLYgttgt+Oowf87E=;
        b=LfW1CpGDSU9w6EXZ8/C91vkJwCE+24Bb9XxjQP2e9OT7eIa561AyaSQjwDOeaoNeHq
         WezCF6baMEEd1MS+3cLjNSqX41DNUvlBrYtugo4Sk6/7WnAz6XanToJYG7bVHcfKDuFc
         USzD/ufQjPXsP4VBQn0RcOpVx47QowphrsJnDjlcQcL9EsQFpRgzslXc23jkuWGTaiiI
         L2QuJLF/cnrEiVuwag2G+DOhZUcwaH4rxGf8wXEK10/CqRg+EetFvj/SfJMLYNuUfpnZ
         bdsr7eF1tCO8mMoV0aSis7wl+BMTMIsR2AWFBPM9EnTP93xQEccxeNkJ9OQlG1pPXbBQ
         ZnmA==
X-Forwarded-Encrypted: i=1; AJvYcCVc+vkfHRtfQqe1fOJz2ZprPWZjHYI4QkeTaHH39lqXyHzv/JsHrXRgutALbyuWUCboXfi8n/xc+ejbfTs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCpvq9S0/uD10QxdFpCaXlQqEm7XzN71eHPp+cjzq8NQ9fYpie
	C4O63ZWCHqHmh79TrtEQ9tLP20LLb4R+TGv7Wp/8ymIPDsRJI1U3
X-Gm-Gg: ASbGncvKYt8dfb5myc5vjl0ghJwNxr5tMsMoNN0jZQbwEEgaomyKEELHVw9uu7ZOqim
	3X2eJEVPm6UvPkEBVe4lZ7q5nNOqW4szK+/aKXc9rzcs9P76wkYxkDJE5ih25Un+Js4c7l83BDZ
	Wxhwp0D8C2imzB/qv1jq7GgYpb5XfPXhMAaXKteKS2MBoPswi8TxU6Xo93qEEuJ3rA6KNQ+S8ay
	xnr/YYmU2DNDm1EOHcBSokQFxng0Nj6dxnDklKxGExw5mai+ogvc/7J06xmJnnq8dVTHyaOWoWn
	/j3GqbsisAiT2o0SwoKYiokkJWbfm/AfYuRvVewrvgAwJS9SvSPo2jo=
X-Google-Smtp-Source: AGHT+IHhpmh0Zd+jSwcDgXoqq4LjVdAHEM1glKtn2rYqjD+Vi3fO5csG4iFVzNS8+2xBUDjtnt2smQ==
X-Received: by 2002:a17:907:a4d:b0:ac7:3456:7ece with SMTP id a640c23a62f3a-ac7d1b28752mr343911266b.46.1743771196491;
        Fri, 04 Apr 2025 05:53:16 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a3cc5sm2335682a12.74.2025.04.04.05.53.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Apr 2025 05:53:15 -0700 (PDT)
Date: Fri, 4 Apr 2025 12:53:15 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Suren Baghdasaryan <surenb@google.com>,
	David Hildenbrand <david@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Rik van Riel <riel@surriel.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] mm/vma: fix incorrectly disallowed anonymous VMA
 merges
Message-ID: <20250404125315.5bou5ays7u7sv4rb@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <cover.1742245056.git.lorenzo.stoakes@oracle.com>
 <ab86a655c18cf9feb031a9b08b74812dcb432221.1742245056.git.lorenzo.stoakes@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab86a655c18cf9feb031a9b08b74812dcb432221.1742245056.git.lorenzo.stoakes@oracle.com>
User-Agent: NeoMutt/20170113 (1.7.2)

On Mon, Mar 17, 2025 at 09:15:03PM +0000, Lorenzo Stoakes wrote:
[...]
>However, we have a problem here - typically the vma passed here is the
>destination VMA.
>
>For instance in vma_merge_existing_range() we invoke:
>
>can_vma_merge_left()
>-> [ check that there is an immediately adjacent prior VMA ]
>-> can_vma_merge_after()
>  -> is_mergeable_vma() for general attribute check
>-> is_mergeable_anon_vma([ proposed anon_vma ], prev->anon_vma, prev)
>
>So if we were considering a target unfaulted 'prev':
>
>	  unfaulted    faulted
>	|-----------|-----------|
>	|    prev   |    vma    |
>	|-----------|-----------|
>
>This would call is_mergeable_anon_vma(NULL, vma->anon_vma, prev).
>
>The list_is_singular() check for vma->anon_vma_chain, an empty list on
>fault, would cause this merge to _fail_ even though all else indicates a
>merge.
>

Great spot. It is hiding there for 15 years.

>Equally a simple merge into a next VMA would hit the same problem:
>
>	   faulted    unfaulted
>	|-----------|-----------|
>	|    vma    |    next   |
>	|-----------|-----------|
>
[...]
>---
> mm/vma.c                |  81 +++++++++++++++++++++++---------
> tools/testing/vma/vma.c | 100 +++++++++++++++++++++-------------------
> 2 files changed, 111 insertions(+), 70 deletions(-)
>
>diff --git a/mm/vma.c b/mm/vma.c
>index 5cdc5612bfc1..5418eef3a852 100644
>--- a/mm/vma.c
>+++ b/mm/vma.c
>@@ -57,6 +57,22 @@ struct mmap_state {
> 		.state = VMA_MERGE_START,				\
> 	}
> 
>+/*
>+ * If, at any point, the VMA had unCoW'd mappings from parents, it will maintain
>+ * more than one anon_vma_chain connecting it to more than one anon_vma. A merge
>+ * would mean a wider range of folios sharing the root anon_vma lock, and thus
>+ * potential lock contention, we do not wish to encourage merging such that this
>+ * scales to a problem.
>+ */

I don't follow here. Take a look into do_wp_page(), where CoW happens. But I
don't find where it will unlink parent anon_vma from vma->anon_vma_chain.

Per my understanding, the unlink behavior happens in unlink_anon_vma() which
unlink all anon_vma on vma->anon_vma_chain. And the normal caller of
unlink_anon_vma() is free_pgtables(). Other callers are on error path to
release prepared data. From this perspective, I don't see the chance to unlink
parent anon_vma from vma->anon_vma_chain either.

But maybe I missed something. If it is not too bother, would you mind giving
me a hint?

>+static bool vma_had_uncowed_parents(struct vm_area_struct *vma)
>+{
>+	/*
>+	 * The list_is_singular() test is to avoid merging VMA cloned from
>+	 * parents. This can improve scalability caused by anon_vma lock.
>+	 */
>+	return vma && vma->anon_vma && !list_is_singular(&vma->anon_vma_chain);
>+}
>+
> static inline bool is_mergeable_vma(struct vma_merge_struct *vmg, bool merge_next)
> {
> 	struct vm_area_struct *vma = merge_next ? vmg->next : vmg->prev;
>@@ -82,24 +98,28 @@ static inline bool is_mergeable_vma(struct vma_merge_struct *vmg, bool merge_nex
> 	return true;
> }
> 
>-static inline bool is_mergeable_anon_vma(struct anon_vma *anon_vma1,
>-		 struct anon_vma *anon_vma2, struct vm_area_struct *vma)
>+static bool is_mergeable_anon_vma(struct vma_merge_struct *vmg, bool merge_next)
> {
>+	struct vm_area_struct *tgt = merge_next ? vmg->next : vmg->prev;
>+	struct vm_area_struct *src = vmg->middle; /* exisitng merge case. */
                                                     ^^^

A trivial typo here.

>+	struct anon_vma *tgt_anon = tgt->anon_vma;
>+	struct anon_vma *src_anon = vmg->anon_vma;
>+
> 	/*
>-	 * The list_is_singular() test is to avoid merging VMA cloned from
>-	 * parents. This can improve scalability caused by anon_vma lock.
>+	 * We _can_ have !src, vmg->anon_vma via copy_vma(). In this instance we
>+	 * will remove the existing VMA's anon_vma's so there's no scalability
>+	 * concerns.
> 	 */
>-	if ((!anon_vma1 || !anon_vma2) && (!vma ||
>-		list_is_singular(&vma->anon_vma_chain)))
>-		return true;
>-	return anon_vma1 == anon_vma2;
>-}
>+	VM_WARN_ON(src && src_anon != src->anon_vma);
> 
>-/* Are the anon_vma's belonging to each VMA compatible with one another? */
>-static inline bool are_anon_vmas_compatible(struct vm_area_struct *vma1,
>-					    struct vm_area_struct *vma2)
>-{
>-	return is_mergeable_anon_vma(vma1->anon_vma, vma2->anon_vma, NULL);
>+	/* Case 1 - we will dup_anon_vma() from src into tgt. */
>+	if (!tgt_anon && src_anon)
>+		return !vma_had_uncowed_parents(src);
>+	/* Case 2 - we will simply use tgt's anon_vma. */
>+	if (tgt_anon && !src_anon)
>+		return !vma_had_uncowed_parents(tgt);
>+	/* Case 3 - the anon_vma's are already shared. */
>+	return src_anon == tgt_anon;
> }
> 
> /*
>@@ -164,7 +184,7 @@ static bool can_vma_merge_before(struct vma_merge_struct *vmg)
> 	pgoff_t pglen = PHYS_PFN(vmg->end - vmg->start);
> 
> 	if (is_mergeable_vma(vmg, /* merge_next = */ true) &&
>-	    is_mergeable_anon_vma(vmg->anon_vma, vmg->next->anon_vma, vmg->next)) {
>+	    is_mergeable_anon_vma(vmg, /* merge_next = */ true)) {
> 		if (vmg->next->vm_pgoff == vmg->pgoff + pglen)
> 			return true;
> 	}
>@@ -184,7 +204,7 @@ static bool can_vma_merge_before(struct vma_merge_struct *vmg)
> static bool can_vma_merge_after(struct vma_merge_struct *vmg)
> {
> 	if (is_mergeable_vma(vmg, /* merge_next = */ false) &&
>-	    is_mergeable_anon_vma(vmg->anon_vma, vmg->prev->anon_vma, vmg->prev)) {
>+	    is_mergeable_anon_vma(vmg, /* merge_next = */ false)) {
> 		if (vmg->prev->vm_pgoff + vma_pages(vmg->prev) == vmg->pgoff)
> 			return true;
> 	}

We have two sets API to check vma's mergeability:

  * can_vma_merge_before/after
  * can_vma_merge_left/right

And xxx_merge_right() calls xxx_merge_before(), which is a little confusing.

Now can_vma_merge_before/after looks almost same. Do you think it would be
easier for reading to consolidate to one function?

-- 
Wei Yang
Help you, Help me
