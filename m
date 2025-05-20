Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CC31B7F4
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 18:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747767554; cv=none; b=D779YyJ2ZENVhnhDJOWPW5flTnP6Y1a4RTt4Dst/xSXpnn5cXqdzpVPnDDyWhd/55U1uxLHYlOPUOjefjgeYktRArYSPb9pen3ArUgrTouLORedLfjDeThPPdhSripp0BlsnMEnYhl9K4wk2GVd9T+2kjvDDuaNAZMWiuUvWea0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747767554; c=relaxed/simple;
	bh=pN5xgUr67le2F1dBppDrpGuEASyGyLE94svaAw++Gts=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dT6lFPQ0yhAKC7jyYh0cEmmx5f7xuhePdtvfGrtvZTxgK0+YmMoeU44L375xjlRYryROMZVP6Om0RhBItKDHsfpuugznQNyJM0xfqdQAupu0EPiS7Icu0wH4/5NhVY2VPjvp4zeiKc3amdEV/tdpNgGZGjOfNW6picAdMCLLgf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ljKYUpmK; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ljKYUpmK"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54998f865b8so6487003e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 11:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747767551; x=1748372351; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AQkQjJt9kU+uPyL7lP3eEXiloE0ae6R3M6xCgJ/0rus=;
        b=ljKYUpmKsUZEPF6+uuw+TGZCS6xN2jvvGOZvxg8L2aMsqMDU6BXcGDBoVPdfFvjtwy
         iya57hQFs7XnC2fQi72Gsq86bYu4WGHSz2rhDN4h680/dlXlouRJq60s/FafR5w2541W
         Nnn47fzLeulzsrXyzk+UE+13dnheSV8E9eT7Tp3O+s8cFufwNJ6wZ3b0BBN/GPm7cbp6
         groApfSy+9xKA1I/hJk8sI6p+RpRdJ2U5kU1i5oqHwF3TAJtYcHLSK0M/pciZTU/7SQw
         7lPPaax2XLtM02xLCYA+WORSjdfbN2YOL+IyEClbezwVI/mOMe8LEApasdu7lDzCYQUr
         8t/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747767551; x=1748372351;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AQkQjJt9kU+uPyL7lP3eEXiloE0ae6R3M6xCgJ/0rus=;
        b=uhitZfDmZeFQ84l/iA92On8BjDJ94YjsnvDc9LTkm2OlYprS7Se+ioqoMOfx1u2uKA
         UTftE5uVhiSqRveW/M3xfAxXn47blauMi32Ck4WZN1fchO5KV53lZ06G2yBlHnfJ9c4m
         2JKAeCGkhz8WBnkSK7751OSA/RSzitDDgGLaMaDlYEvCF64VnX164XqSvoyBoOliNbgu
         I7KGyyyHRPEHSm0IU7LPnNgCE0NVqYRqRAaKZNfUqsAwXMqEK2N5obRMA+J86x+8+fjW
         hi91wUJwYPiH08Q2Zz80wgbJ0cSf2cgXLLZq+8zsm3j/R3yllhFP3RflMHh3Wj/ikTkI
         wxrA==
X-Forwarded-Encrypted: i=1; AJvYcCVLiGaG+TQ7xhFXxpUxxgc5wg0UizgeEvNhZ9mBbfUFsSXyGX37YEv9Dw8Hpzp8L8n/G8zbLuB2DjBjZ5E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlDTsQD4Hb4pVtWnNDveLekbmDjRvWydsCsu8HS559IqH6vEK5
	kE7w/Qa2zkUfCoxDZ12xIZd+wdS+b4y6KkDtdlfbZfjun7Ks4KGduVEW
X-Gm-Gg: ASbGncvix4n1iCxfMv9loNxfrqy8u/6AA2cwi5Ki2h5tK6X9rl8R+VI8l4MoStkK15y
	c6O5PLYYfI/tPDU2AGybSx5ZrC7QtSKtpsYtndy7B85gH3/jrryfLVpbbFZD9b2h1Rg0wyJ0Gsi
	QbqanJnR5tlbizuw12v2EL/bCQ3f68VXMMC5fiPZCZZBCAKuueBq2L9tUh6ljJk1Hcdj1pSj629
	JA2KSVGTGyruFE/Kozr2B6RlssI0Nq1RLNDd8wE3YzeggaeqdZfyyKb3LXYq3vw6y5M647weeMO
	df6WnM0HETCbyCv8Sg==
X-Google-Smtp-Source: AGHT+IG9aC8N0QQsz41YVmle4vSQ3Luf0WbY4OtJcMJGGaty6QGbyUBQVNJ+DSdkKfSdcQTc+lmpsw==
X-Received: by 2002:a05:6512:460c:b0:549:8e5e:9d8e with SMTP id 2adb3069b0e04-550e70fcc0cmr4791136e87.0.1747767550611;
        Tue, 20 May 2025 11:59:10 -0700 (PDT)
Received: from pc636 ([2001:9b1:d5a0:a500::800])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703e7a6sm2481344e87.218.2025.05.20.11.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 11:59:09 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Tue, 20 May 2025 20:59:08 +0200
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Uladzislau Rezki <urezki@gmail.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Usama Arif <usamaarif642@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>, surenb@google.com,
	hannes@cmpxchg.org, vlad.wing@gmail.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 1/2] mm: slub: allocate slab object extensions
 non-contiguously
Message-ID: <aCzQ_FQUvYgcTX1W@pc636>
References: <20250520122547.1317050-1-usamaarif642@gmail.com>
 <3divtzm4iapcxwbzxlmfmg3gus75n3rqh43vkjnog456jm2k34@f3rpzvcfk3p6>
 <6d015d91-e74c-48b3-8bc3-480980a74f9b@gmail.com>
 <22oihuvcrh5sg3urocw6wbop2v5yni7zinuhywbz7glsee4yoa@gzi5v5fcggdl>
 <ewn4u5ssskqzad4sjerg6zkxjhvuik6cs4st4jarpizztq4fca@p4wwfavollhm>
 <qn7zsk4clyzstu7mvsy4lucj4m2os7h3rmjoitdl4fjpqa3kfx@hi75pqd6gtom>
 <aCy_kfhKfojXYwlE@pc636>
 <dvbvfrj4voyoyoj47ufowpr2sblbtd4wptogx6nnucdz3yrvbj@c7xojwuozflq>
 <aCzCdraykYULK8x2@pc636>
 <tfqlkdhvqgw4ptvqrpyq5t7et7xppm6flb7knwa2qe67oeyjqr@hmawn4vqai2p>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tfqlkdhvqgw4ptvqrpyq5t7et7xppm6flb7knwa2qe67oeyjqr@hmawn4vqai2p>

On Tue, May 20, 2025 at 01:58:25PM -0400, Kent Overstreet wrote:
> On Tue, May 20, 2025 at 07:57:10PM +0200, Uladzislau Rezki wrote:
> > On Tue, May 20, 2025 at 01:47:54PM -0400, Kent Overstreet wrote:
> > > On Tue, May 20, 2025 at 07:44:49PM +0200, Uladzislau Rezki wrote:
> > > > On Tue, May 20, 2025 at 10:28:06AM -0400, Kent Overstreet wrote:
> > > > > On Tue, May 20, 2025 at 07:24:40AM -0700, Shakeel Butt wrote:
> > > > > > On Tue, May 20, 2025 at 10:01:27AM -0400, Kent Overstreet wrote:
> > > > > > > On Tue, May 20, 2025 at 02:46:14PM +0100, Usama Arif wrote:
> > > > > > > > 
> > > > > > > > 
> > > > > > > > On 20/05/2025 14:44, Kent Overstreet wrote:
> > > > > > > > > On Tue, May 20, 2025 at 01:25:46PM +0100, Usama Arif wrote:
> > > > > > > > >> When memory allocation profiling is running on memory bound services,
> > > > > > > > >> allocations greater than order 0 for slab object extensions can fail,
> > > > > > > > >> for e.g. zs_handle zswap slab which will be 512 objsperslab x 16 bytes
> > > > > > > > >> per slabobj_ext (order 1 allocation). Use kvcalloc to improve chances
> > > > > > > > >> of the allocation being successful.
> > > > > > > > >>
> > > > > > > > >> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
> > > > > > > > >> Reported-by: Vlad Poenaru <vlad.wing@gmail.com>
> > > > > > > > >> Closes: https://lore.kernel.org/all/17fab2d6-5a74-4573-bcc3-b75951508f0a@gmail.com/
> > > > > > > > >> ---
> > > > > > > > >>  mm/slub.c | 2 +-
> > > > > > > > >>  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > > > > >>
> > > > > > > > >> diff --git a/mm/slub.c b/mm/slub.c
> > > > > > > > >> index dc9e729e1d26..bf43c403ead2 100644
> > > > > > > > >> --- a/mm/slub.c
> > > > > > > > >> +++ b/mm/slub.c
> > > > > > > > >> @@ -1989,7 +1989,7 @@ int alloc_slab_obj_exts(struct slab *slab, struct kmem_cache *s,
> > > > > > > > >>  	gfp &= ~OBJCGS_CLEAR_MASK;
> > > > > > > > >>  	/* Prevent recursive extension vector allocation */
> > > > > > > > >>  	gfp |= __GFP_NO_OBJ_EXT;
> > > > > > > > >> -	vec = kcalloc_node(objects, sizeof(struct slabobj_ext), gfp,
> > > > > > > > >> +	vec = kvcalloc_node(objects, sizeof(struct slabobj_ext), gfp,
> > > > > > > > >>  			   slab_nid(slab));
> > > > > > > > > 
> > > > > > > > > And what's the latency going to be on a vmalloc() allocation when we're
> > > > > > > > > low on memory?
> > > > > > > > 
> > > > > > > > Would it not be better to get the allocation slighly slower than to not get
> > > > > > > > it at all?
> > > > > > > 
> > > > > > > Our behaviour when thrashing sucks, we don't want to do anything to make
> > > > > > > that worse.
> > > > > > > 
> > > > > > > There's also the fact that vmalloc doesn't correctly respect gfp flags,
> > > > > > > so until that gets fixed this doesn't work at all.
> > > > > > 
> > > > > > Which gfp flags vmalloc is not respecting today?
> > > > > 
> > > > > GFP_NOWAIT.
> > > > > 
> > > > > As to why, you'd better ask Michal Hocko...
> > > > > 
> > > > It is mainly due to pte_alloc_one_kernel(), it uses the GFP_KERNEL
> > > > 
> > > > #define GFP_PGTABLE_KERNEL	(GFP_KERNEL | __GFP_ZERO)
> > > > 
> > > > to get a new pte entry.
> > > > 
> > > > I think we can fix it. For example if we populate some region and allocate
> > > > there for NOWAIT. But there are of course can be other hidden problems.
> > > 
> > > No, PF_MEMALLOC flags allow for passing most of gfp flags for pte
> > > allocation.
> > >
> > It is hard-coded:
> > 
> > static inline pte_t *__pte_alloc_one_kernel_noprof(struct mm_struct *mm)
> > {
> > 	struct ptdesc *ptdesc = pagetable_alloc_noprof(GFP_PGTABLE_KERNEL &
> > 			~__GFP_HIGHMEM, 0);
> > 
> > 	if (!ptdesc)
> > 		return NULL;
> > 	return ptdesc_address(ptdesc);
> > }
> 
> I suggest you read the code around PF_MEMALLOC flags.
>
To wrap the allocation context by the PF_MEMALLOC to prevent entering into
direct reclaim and no sleeping, looks like another approach, i can think about.

One concern is depleting of memory reserves. Populating PTEs would not require
this but i tend to say it is ugly approach which i mentioned above.

--
Uladzislau Rezki
