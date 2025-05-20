Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842532B9A9
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 17:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747761504; cv=none; b=emKufElaFH5WgIei/9dxqKDsLI/soxilpK0looNfZ8R98X3Lv6iO0W6F8He5CODqyAxllFcEkGfUoMWqY66Z0rkq8I0LLZxn4FLWXoejLSgOnKw/LjwhU+g0n0New6sdvlH6V8OTmZMxXCqlOvfulPkNWuEBRvVpnjlBWwItaJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747761504; c=relaxed/simple;
	bh=uLTgLS7K1OU9M7z/y2hLRUWE61DRWKY0bmXdHAIACKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OHVfqwWke5UImsWt2g8x0PvM1oDSLpto7rs8NM6u83Al4+jBxiFzFMcJRHwGCVY0GgJo1gT8mFvmxXq5C0stHDggNY/slQDlLKVZiAZmgsPxxSABVgza5F1vIe3jR8OIh/xtOK/pcDN1PRTC5jyK1jGj6jxiIs1Lru8kd0/0wIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=SkCL/T6Y; arc=none smtp.client-ip=209.85.160.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="SkCL/T6Y"
Received: by mail-qt1-f193.google.com with SMTP id d75a77b69052e-476ae781d21so57846221cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 10:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1747761499; x=1748366299; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b8g+Wzhfz5B8szoWnxmhLEqR559LReTGMLzbHkIJgXM=;
        b=SkCL/T6YdcZyCcjlZYsMp3keLD8v8pEDnyI/g0YncLs43pFtwKCTyRLQWdrIArk79u
         57kLU7syXpuCPraJ/oHloA5klToZbCPDxX/lgGEC5H53dcVBTPJPis6/u3jg8y9aWh/U
         2NhB+uxtyu0WVtiwJxaqUs9jUcjwwGPdj8D7yFS+Le4BSg6KcXgrnbS3A8qp4xsZm65B
         9ALO06YjRMUMUThPnOsIIE4dBCptQGgWUM++kQuu2tnZl5e/g/7nSa7jcVgxlJ0zqRFt
         Jptq/Ykk7NeWay0PF9tC/1iBw9/Ph0TEkAyXWobWMZ5F/ne3cPJsoDE/GACf7nDdHmzR
         pGEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747761499; x=1748366299;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b8g+Wzhfz5B8szoWnxmhLEqR559LReTGMLzbHkIJgXM=;
        b=mcamyNutC3RrUt2TOSEvXdgO/5TKaYsDvqeGjMT0WtkFhkyh9tGgaJfyPh6g1DgC5a
         7hj4mkWTjyYg4vD4UHBB7KVRPiaOJrvKcAWikBT4rVptf3LfalHbujSQk6VjftVZjl9b
         eGaKKJWXQ4Je8ITdEt+GUX1wVknarYcPR677IXo9m0pX2Cw4oxHCI6sGBqWXGLSaLVL1
         QtBB/EQJMNK54YxuOJvqPj6Af3BX4kIWgwZJ95WZiBdAlQVm0eTJzZ6xpne87kGkQRTv
         4BKp+yM/OJls2chkV0wbRFuf0fmru+JqDA31lueq6DfUSR5PEsLuajGhE8Vs66OsBWBZ
         B6dg==
X-Forwarded-Encrypted: i=1; AJvYcCVZiQdLTPgZ3B90XWul7mIgXKYagPwsWMekUz/WMKLH8Q1UwzZ23C06gDe1UqD/OIFyKLm6fMmyk6EhrZk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVtbZuhKNfPL5DhNkiLZ1ImkqRP0aRMJVtwFltVCg7OE8eBjDH
	PqM4mv+f+zPoze5UaQMYZFPA0eIInX+YIZdG2SiUXU50B4avKCXIUzXT80TRvpHLVsU=
X-Gm-Gg: ASbGncsefHPYcnZrfrOjWfgngRGVXCrUwea9bte3z13IaUIBDr3/D6Oed4d/IQonetI
	VejsCcyBM+AImJ/n7gKgEkeH11UIpSv6o7rgK1hKajz1F23Mc0qIyuZB8uJ8bHLv6xDhS8y9B5X
	4HSPKN2EArmwpyBb1rJVkhhucqjARbuVCqkn2MbcNQaWvbBM/5htWQFa1HaCI0IMFEo4YlDSi5o
	6r4F0GicsoscTQtNsJnCeybBFvkSZdVS5wUMgekP0QMZlkDUW62dDce3fC0pGToLS5zojUVQiHd
	ZkvJxMCR/QqqRA1sadpYBEtG+46ndtsXaam97lY7OuwLD/AIEQ==
X-Google-Smtp-Source: AGHT+IF3vxJLFoWuPMLOAda2AzUWAGYkc1HWDEx6oFnY0D+0fW2Y+u+FWJ1vkeSFfmD0B6aa9ewRRQ==
X-Received: by 2002:a05:622a:1e0b:b0:476:7eca:57e7 with SMTP id d75a77b69052e-494b07dcd9emr285134001cf.26.1747761498978;
        Tue, 20 May 2025 10:18:18 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:365a:60ff:fe62:ff29])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-494ae3f922csm73377711cf.26.2025.05.20.10.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 10:18:18 -0700 (PDT)
Date: Tue, 20 May 2025 13:18:14 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Suren Baghdasaryan <surenb@google.com>
Cc: Usama Arif <usamaarif642@gmail.com>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>, shakeel.butt@linux.dev,
	vlad.wing@gmail.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 1/2] mm: slub: allocate slab object extensions
 non-contiguously
Message-ID: <20250520171814.GC773385@cmpxchg.org>
References: <20250520122547.1317050-1-usamaarif642@gmail.com>
 <3divtzm4iapcxwbzxlmfmg3gus75n3rqh43vkjnog456jm2k34@f3rpzvcfk3p6>
 <6d015d91-e74c-48b3-8bc3-480980a74f9b@gmail.com>
 <b696e3c2-3d96-4729-9e07-87bb644f145b@gmail.com>
 <CAJuCfpEL__bRSbVWATs0qbNF3E2ZS_n7banhRxU01FFT2aTPAQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJuCfpEL__bRSbVWATs0qbNF3E2ZS_n7banhRxU01FFT2aTPAQ@mail.gmail.com>

On Tue, May 20, 2025 at 08:20:38AM -0700, Suren Baghdasaryan wrote:
> On Tue, May 20, 2025 at 7:13 AM Usama Arif <usamaarif642@gmail.com> wrote:
> >
> >
> >
> > On 20/05/2025 14:46, Usama Arif wrote:
> > >
> > >
> > > On 20/05/2025 14:44, Kent Overstreet wrote:
> > >> On Tue, May 20, 2025 at 01:25:46PM +0100, Usama Arif wrote:
> > >>> When memory allocation profiling is running on memory bound services,
> > >>> allocations greater than order 0 for slab object extensions can fail,
> > >>> for e.g. zs_handle zswap slab which will be 512 objsperslab x 16 bytes
> > >>> per slabobj_ext (order 1 allocation). Use kvcalloc to improve chances
> > >>> of the allocation being successful.
> > >>>
> > >>> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
> > >>> Reported-by: Vlad Poenaru <vlad.wing@gmail.com>
> > >>> Closes: https://lore.kernel.org/all/17fab2d6-5a74-4573-bcc3-b75951508f0a@gmail.com/
> > >>> ---
> > >>>  mm/slub.c | 2 +-
> > >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> > >>>
> > >>> diff --git a/mm/slub.c b/mm/slub.c
> > >>> index dc9e729e1d26..bf43c403ead2 100644
> > >>> --- a/mm/slub.c
> > >>> +++ b/mm/slub.c
> > >>> @@ -1989,7 +1989,7 @@ int alloc_slab_obj_exts(struct slab *slab, struct kmem_cache *s,
> > >>>     gfp &= ~OBJCGS_CLEAR_MASK;
> > >>>     /* Prevent recursive extension vector allocation */
> > >>>     gfp |= __GFP_NO_OBJ_EXT;
> > >>> -   vec = kcalloc_node(objects, sizeof(struct slabobj_ext), gfp,
> > >>> +   vec = kvcalloc_node(objects, sizeof(struct slabobj_ext), gfp,
> > >>>                        slab_nid(slab));
> > >>
> > >> And what's the latency going to be on a vmalloc() allocation when we're
> > >> low on memory?
> > >
> > > Would it not be better to get the allocation slighly slower than to not get
> > > it at all?
> >
> > Also a majority of them are less than 1 page. kvmalloc of less than 1 page
> > falls back to kmalloc. So vmalloc will only be on those greater than 1 page
> > size, which are in the minority (for e.g. zs_handle, request_sock_subflow_v6,
> > request_sock_subflow_v4...).
> 
> Not just the majority. For all of these kvmalloc allocations kmalloc
> will be tried first and vmalloc will be used only if the former
> failed: https://elixir.bootlin.com/linux/v6.14.7/source/mm/util.c#L665
> That's why I think this should not regress normal case when slab has
> enough space to satisfy the allocation.

Alexei raised a good point offline that having slab enter vmalloc
messes with the whole slab re-entrancy and nmi safety he has been
pursuing for bpf/probing.

Add that to the other concerns around vmalloc, and I think we should
just drop that part.

IMO, the more important takeaway is that we accept that this
allocation is optimistic, and can and does fail in practice, even if
the slab allocation itself succeeded.

So it probably makes sense to 1) ax the warning entirely - since it's
not indicative of a bug. And 2) accept that the numbers can have a
fudge factor in practice, and mark line items in the report
correspondingly when they do.
