Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6BE25B1D3
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 17:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747763839; cv=none; b=NoVl8pKum70DssOTc7jeM9le1xNyskrzkdUbqGwJNkWlt3KRbdnezmNQkFyr00zHETD5+KrvKbmjQtEZ7OY0MfMFH4vbM/BaxPytreY3gD/zwtXvYYnAkEebis5jPm60vnqjz+5UFBGD4NpboheksTR1Ko2w8NSB+6UNub2GO40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747763839; c=relaxed/simple;
	bh=CdMS84GyIR554cm7Cm8JqlW7ZuOyNs4k5DwLXWh8UvI=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SpsZeF5eDBuGGb4d6mdwIri6vVpTRgpdy2o6JuBWR8RN3vk49ITql4Rlnm4Of22lCoIUESFkY20chQgu5oZ6/Igb0Hd4Ft1fF92vdMr7ZUD5iruc5x7m/n1cKn603RPy6l7BvB69bKLXIDtKxmMwYVKKiA3XGRvGibwH63HXKWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b957y6hu; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b957y6hu"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54e816aeca6so8272301e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 10:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747763835; x=1748368635; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bCQTVbbhE730X8duFOmA3U3pomBunlH8eFJh1Xh6tuI=;
        b=b957y6hu5w+8CnrDL5qp1hJIGJNPzOuySd4c3vQegvUh+WKer5v0S1FyNJw5uW52en
         FwOGsBrFWcgu2gqBrfUDC7GKkhzSb6kQmwJ3kF4PgPgs6nB8qf41ejGiFAP+AQ3sETcf
         /e2smB13lnkaaSnZtGu4ClrLK4/Ex4s+Jl0uRyTbZLC7OV8/RTIFfD0uC98DyejBHjfq
         +DURkF5EOGxnVRV4rNVRNMcIXm29IADvUqq0qNQoT6/NX0UvD4iPSkcIbDK69zbX0yL3
         spel5hSMSiKZQ2mgSTAzAxAF2S2KDyyEupp8W+2VNPBI+VvKuuhHJoH6SmDPeeE/GPx3
         JW5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747763835; x=1748368635;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bCQTVbbhE730X8duFOmA3U3pomBunlH8eFJh1Xh6tuI=;
        b=QS3SwYFVAthKTPSJmTtHLjo4boJjkIKhv2r6l5hIIYg5sgx0nrF6gm+Sl8rf5NkHX6
         MlWs1ShU3K1RtaMXVdgYM5W5polRvym8tGUTBnsPnXdHxFlwqRyHKHbgOHL6aSz6ZGET
         ayHrfA3SBWHJUFjmYrstWx7OkVN5LmjOS3k74yFHQ5VJEF7LqciBlFeuvAejEMeCzqVw
         bVAezaa3dEsbdCOJ9vQPJB0C3hLbcjrtk5/n2dCILIWxxAUphteLEzW0E4vOky8z6mpo
         Z3Wlz7O9oGfFzmbaTgF3GZfeqOHjZ2EbYHf93qYpSq1Rbp9hYxNiVkap8ozUREd8Rps2
         46ag==
X-Forwarded-Encrypted: i=1; AJvYcCUuUnggu/mbCDHpWcwNbMmEhmsQeOob7FlNw4ne/KnJj8dbL17HGU8V3RkniZ4xde6vIuZse8hxtIZH+Zk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNFgXlR2abn+Jv5hV9MXcWQMcfx+YntPfPFDcjS1N4mvLRaQDs
	S52Sv+YF3/MCanbtvOmTVwZg4/lI4QFOkbSb5Fi7MkUnuUQ+/Y425UHv
X-Gm-Gg: ASbGncvBfBjB8wh1as0I8qVcKhMX45lVe9Kg9FnLBgD9ttdk//N2l+rXFi3zY4rh+ZQ
	vKggWTZr78Z8z1chFyD7JKb8aFBZtNiZdk6OK+CTL+4f976FT0Yp+gq9JR5lCOJb++XEFbykuxv
	yzZ9kd/SLfucq8agLQKH0hqniycPv5VyVa8fc8ih23rRgf2P5ab3p/8IQaBQ4bbGNH5D+UwVNod
	WrqEvTIvaB89BGZlof2CMbcNO4ws5CTF68Key5m562Bx729JCKZWJPj6kdPunhCFDuX75Et9+XF
	ehMsDYhH6kgaO0BTP4uKsxCOfBIf1qgExBTQp+qV+9PUag3ZbnNstxvW/ljV75E6bBVgkaYinBS
	Mz8YPSMT1Dk/3CQ==
X-Google-Smtp-Source: AGHT+IEHa8KFSft9nSahkWlLKCT1jK9D+CuOuuvCQcWBs4con5+PnrBflcV9gzE89tdF+JujXmP0Ug==
X-Received: by 2002:a05:6512:460c:b0:549:8e5e:9d8e with SMTP id 2adb3069b0e04-550e70fcc0cmr4743872e87.0.1747763834313;
        Tue, 20 May 2025 10:57:14 -0700 (PDT)
Received: from pc636 (host-95-193-69-199.mobileonline.telia.com. [95.193.69.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f35205sm2442624e87.95.2025.05.20.10.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 10:57:13 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Tue, 20 May 2025 19:57:10 +0200
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Uladzislau Rezki <urezki@gmail.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Usama Arif <usamaarif642@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>, surenb@google.com,
	hannes@cmpxchg.org, vlad.wing@gmail.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 1/2] mm: slub: allocate slab object extensions
 non-contiguously
Message-ID: <aCzCdraykYULK8x2@pc636>
References: <20250520122547.1317050-1-usamaarif642@gmail.com>
 <3divtzm4iapcxwbzxlmfmg3gus75n3rqh43vkjnog456jm2k34@f3rpzvcfk3p6>
 <6d015d91-e74c-48b3-8bc3-480980a74f9b@gmail.com>
 <22oihuvcrh5sg3urocw6wbop2v5yni7zinuhywbz7glsee4yoa@gzi5v5fcggdl>
 <ewn4u5ssskqzad4sjerg6zkxjhvuik6cs4st4jarpizztq4fca@p4wwfavollhm>
 <qn7zsk4clyzstu7mvsy4lucj4m2os7h3rmjoitdl4fjpqa3kfx@hi75pqd6gtom>
 <aCy_kfhKfojXYwlE@pc636>
 <dvbvfrj4voyoyoj47ufowpr2sblbtd4wptogx6nnucdz3yrvbj@c7xojwuozflq>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dvbvfrj4voyoyoj47ufowpr2sblbtd4wptogx6nnucdz3yrvbj@c7xojwuozflq>

On Tue, May 20, 2025 at 01:47:54PM -0400, Kent Overstreet wrote:
> On Tue, May 20, 2025 at 07:44:49PM +0200, Uladzislau Rezki wrote:
> > On Tue, May 20, 2025 at 10:28:06AM -0400, Kent Overstreet wrote:
> > > On Tue, May 20, 2025 at 07:24:40AM -0700, Shakeel Butt wrote:
> > > > On Tue, May 20, 2025 at 10:01:27AM -0400, Kent Overstreet wrote:
> > > > > On Tue, May 20, 2025 at 02:46:14PM +0100, Usama Arif wrote:
> > > > > > 
> > > > > > 
> > > > > > On 20/05/2025 14:44, Kent Overstreet wrote:
> > > > > > > On Tue, May 20, 2025 at 01:25:46PM +0100, Usama Arif wrote:
> > > > > > >> When memory allocation profiling is running on memory bound services,
> > > > > > >> allocations greater than order 0 for slab object extensions can fail,
> > > > > > >> for e.g. zs_handle zswap slab which will be 512 objsperslab x 16 bytes
> > > > > > >> per slabobj_ext (order 1 allocation). Use kvcalloc to improve chances
> > > > > > >> of the allocation being successful.
> > > > > > >>
> > > > > > >> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
> > > > > > >> Reported-by: Vlad Poenaru <vlad.wing@gmail.com>
> > > > > > >> Closes: https://lore.kernel.org/all/17fab2d6-5a74-4573-bcc3-b75951508f0a@gmail.com/
> > > > > > >> ---
> > > > > > >>  mm/slub.c | 2 +-
> > > > > > >>  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > > >>
> > > > > > >> diff --git a/mm/slub.c b/mm/slub.c
> > > > > > >> index dc9e729e1d26..bf43c403ead2 100644
> > > > > > >> --- a/mm/slub.c
> > > > > > >> +++ b/mm/slub.c
> > > > > > >> @@ -1989,7 +1989,7 @@ int alloc_slab_obj_exts(struct slab *slab, struct kmem_cache *s,
> > > > > > >>  	gfp &= ~OBJCGS_CLEAR_MASK;
> > > > > > >>  	/* Prevent recursive extension vector allocation */
> > > > > > >>  	gfp |= __GFP_NO_OBJ_EXT;
> > > > > > >> -	vec = kcalloc_node(objects, sizeof(struct slabobj_ext), gfp,
> > > > > > >> +	vec = kvcalloc_node(objects, sizeof(struct slabobj_ext), gfp,
> > > > > > >>  			   slab_nid(slab));
> > > > > > > 
> > > > > > > And what's the latency going to be on a vmalloc() allocation when we're
> > > > > > > low on memory?
> > > > > > 
> > > > > > Would it not be better to get the allocation slighly slower than to not get
> > > > > > it at all?
> > > > > 
> > > > > Our behaviour when thrashing sucks, we don't want to do anything to make
> > > > > that worse.
> > > > > 
> > > > > There's also the fact that vmalloc doesn't correctly respect gfp flags,
> > > > > so until that gets fixed this doesn't work at all.
> > > > 
> > > > Which gfp flags vmalloc is not respecting today?
> > > 
> > > GFP_NOWAIT.
> > > 
> > > As to why, you'd better ask Michal Hocko...
> > > 
> > It is mainly due to pte_alloc_one_kernel(), it uses the GFP_KERNEL
> > 
> > #define GFP_PGTABLE_KERNEL	(GFP_KERNEL | __GFP_ZERO)
> > 
> > to get a new pte entry.
> > 
> > I think we can fix it. For example if we populate some region and allocate
> > there for NOWAIT. But there are of course can be other hidden problems.
> 
> No, PF_MEMALLOC flags allow for passing most of gfp flags for pte
> allocation.
>
It is hard-coded:

static inline pte_t *__pte_alloc_one_kernel_noprof(struct mm_struct *mm)
{
	struct ptdesc *ptdesc = pagetable_alloc_noprof(GFP_PGTABLE_KERNEL &
			~__GFP_HIGHMEM, 0);

	if (!ptdesc)
		return NULL;
	return ptdesc_address(ptdesc);
}

--
Uladzislau Rezki
