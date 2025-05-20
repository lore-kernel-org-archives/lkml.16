Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D262417F0
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 17:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747761637; cv=none; b=okKT5L1A1dZb3wEnNxLfjE8to7IuhNHJPnnBTMmwEqCwxwiCbVrEdZQYcnZ50diX0DCr+vtn6UojHNcYFxSemiBc6CxNcC1tFk97xB1Wkjt7QwwsBdPi8tgZj6pJawppQtXLDYiOzxsCZcBSXVhTj65Xy/MLEUHKbAqiIHeTyzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747761637; c=relaxed/simple;
	bh=eaJYaU/F8iv2v2aDniB0skZs4J/E8FarK9KL5VN/QSs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FHD5vSbvrhM1jEkhNhzvZHO+TfpABTeXIcnfE9ASq/owkUFE8Fmw5/LytGV1CiApZZpGIwMh7E/TuMcvXRBwHNBgLFUcCLsKpLrPwMyNSDimBNMEQkMOBD+1326a6mPknzZepoJSJoboAoHcEn/eM3XUgEivcJl1WI3U9dLoetc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jPj5OjUm; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jPj5OjUm"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-47666573242so1119081cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 10:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747761634; x=1748366434; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pMz/GawTYm93M6wk1r8Hyis5b46n5tgbqvpVyMnXyKM=;
        b=jPj5OjUmRuJAyrh29VWIKAJOfkz6/20+ssOgqOQiqOHBRSUF7RvEkoUIhPe67nf13Y
         S9r87Dc+BWfkYL9SUc1xts65pQYMR6lVr/MAu/ofcE4Sbtt4AGwAROptwfsTDzPU1Ppb
         cjPmYE8HhOnZ5kLy1uDyX4bEXaxo2IbtmjQCqcYzAf7SujmdPEvxVFdnpmDXBYBoQ62E
         uk88RQKKtDxj6ymo8Mm+/Uq2C2D1/ZpMvpz3a7P/naHOtKQiPGC8jEwepDGI+Y3pSYIX
         leWqpfBrT780rhe9hrCfwj0F/n+skyFKvUm2M0WDqYgYU4JkUfYturAzSJeZst1uhfes
         ppMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747761634; x=1748366434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pMz/GawTYm93M6wk1r8Hyis5b46n5tgbqvpVyMnXyKM=;
        b=bdwX4O+mztUGtrgLPMHTXlqIky42VwhAMhy9Zf7PgECClV+Dn7nZVYEcjMVkBlAHJd
         8kGezgZi7mX41bVLqaKhJgdrVgxJlGXM6sL+TgCpEkSb5zBPGNhWsecMy/O0ruHUC9VK
         9MFTtyw6RW6+hbPvRs1EiFD7ORj+clduBti0U6sJioG21UIjS8OidlzAPR54h9DGHAYm
         EUkfmuBBWHOXTSrRl3eDvbSKHoPX+lGCWNllJ4qfz8pFSFhrDVertHp75TicUwpcMUYi
         aKZkCf3ah6QkOM1zX9UAKQAzwZmRPfHDqzpm3crVJWS8fd4/VBwTPeJZ54ndoxyHiZWn
         +q2w==
X-Forwarded-Encrypted: i=1; AJvYcCWXFZlJc2xvpe9LVYDbxwAnCXViY55YSJMYJF20VcSyh6SIrcYwv/5tTZcHnRcUZqA4Suuh1ZgMtXgGqIo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6NZ1Ia152okEOT/bMufv2W3rAgLLdthsP+4BxaI3Sv6NQkq/f
	nPYxH3NxqIX2vYDXv1+DfuTRSUU3GfpyQ3QGcboxQPGMN8342yTz5zljqhP6G0qjuSp2/BwSB0o
	5OxxTJIY8EPh5LRbcCNzZcUSK+rZ3fLPucu3krtB8
X-Gm-Gg: ASbGncvk6+rfQD93snudctVXOYhyxotlHJc0yfd2asGN3M519Tjvw5T0XT/vxMAvUEC
	HdOSOQF89rJalBZojumBvchSpqKtarmAqU97XNJ9rGnJGmxGCmvnFyZthFFFxpiT+w58WgkdIiO
	0AxyhHzv1Andsyid2i6SxFT1FgVms+0NrJ/MBzwQHhMNy8Gna1ySKJ09RM7E/dN5yqZsU4J66Mk
	w==
X-Google-Smtp-Source: AGHT+IEN4cy/pozJUBlzjNxeVd+YNzp86jN9uT2YcCkPwp/GNMJOJCbYMQ4W0MBZZmvegZBSiBORzw7uEBE3WptOFSo=
X-Received: by 2002:ac8:5ac3:0:b0:467:8416:d99e with SMTP id
 d75a77b69052e-49601270e7amr11465061cf.21.1747761634113; Tue, 20 May 2025
 10:20:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520122547.1317050-1-usamaarif642@gmail.com>
 <3divtzm4iapcxwbzxlmfmg3gus75n3rqh43vkjnog456jm2k34@f3rpzvcfk3p6>
 <6d015d91-e74c-48b3-8bc3-480980a74f9b@gmail.com> <b696e3c2-3d96-4729-9e07-87bb644f145b@gmail.com>
 <CAJuCfpEL__bRSbVWATs0qbNF3E2ZS_n7banhRxU01FFT2aTPAQ@mail.gmail.com> <sfh57nqbhxaycdlyitiughqc7ul3xuix5kis65l4grrnxwfqz3@gch2dlf3fnxo>
In-Reply-To: <sfh57nqbhxaycdlyitiughqc7ul3xuix5kis65l4grrnxwfqz3@gch2dlf3fnxo>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 20 May 2025 10:20:23 -0700
X-Gm-Features: AX0GCFs_pF-siV8WacuUIqWISrluJMLCa0d2yYdAA0SX13VUt7rYJEG5VlgtvtQ
Message-ID: <CAJuCfpHqGQKgU=rnJbZnbyTs3vKL-gEjLp1Yw1idWUzdkjZsLA@mail.gmail.com>
Subject: Re: [PATCH 1/2] mm: slub: allocate slab object extensions non-contiguously
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Usama Arif <usamaarif642@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	hannes@cmpxchg.org, shakeel.butt@linux.dev, vlad.wing@gmail.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 9:41=E2=80=AFAM Kent Overstreet
<kent.overstreet@linux.dev> wrote:
>
> On Tue, May 20, 2025 at 08:20:38AM -0700, Suren Baghdasaryan wrote:
> > On Tue, May 20, 2025 at 7:13=E2=80=AFAM Usama Arif <usamaarif642@gmail.=
com> wrote:
> > >
> > >
> > >
> > > On 20/05/2025 14:46, Usama Arif wrote:
> > > >
> > > >
> > > > On 20/05/2025 14:44, Kent Overstreet wrote:
> > > >> On Tue, May 20, 2025 at 01:25:46PM +0100, Usama Arif wrote:
> > > >>> When memory allocation profiling is running on memory bound servi=
ces,
> > > >>> allocations greater than order 0 for slab object extensions can f=
ail,
> > > >>> for e.g. zs_handle zswap slab which will be 512 objsperslab x 16 =
bytes
> > > >>> per slabobj_ext (order 1 allocation). Use kvcalloc to improve cha=
nces
> > > >>> of the allocation being successful.
> > > >>>
> > > >>> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
> > > >>> Reported-by: Vlad Poenaru <vlad.wing@gmail.com>
> > > >>> Closes: https://lore.kernel.org/all/17fab2d6-5a74-4573-bcc3-b7595=
1508f0a@gmail.com/
> > > >>> ---
> > > >>>  mm/slub.c | 2 +-
> > > >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >>>
> > > >>> diff --git a/mm/slub.c b/mm/slub.c
> > > >>> index dc9e729e1d26..bf43c403ead2 100644
> > > >>> --- a/mm/slub.c
> > > >>> +++ b/mm/slub.c
> > > >>> @@ -1989,7 +1989,7 @@ int alloc_slab_obj_exts(struct slab *slab, =
struct kmem_cache *s,
> > > >>>     gfp &=3D ~OBJCGS_CLEAR_MASK;
> > > >>>     /* Prevent recursive extension vector allocation */
> > > >>>     gfp |=3D __GFP_NO_OBJ_EXT;
> > > >>> -   vec =3D kcalloc_node(objects, sizeof(struct slabobj_ext), gfp=
,
> > > >>> +   vec =3D kvcalloc_node(objects, sizeof(struct slabobj_ext), gf=
p,
> > > >>>                        slab_nid(slab));
> > > >>
> > > >> And what's the latency going to be on a vmalloc() allocation when =
we're
> > > >> low on memory?
> > > >
> > > > Would it not be better to get the allocation slighly slower than to=
 not get
> > > > it at all?
> > >
> > > Also a majority of them are less than 1 page. kvmalloc of less than 1=
 page
> > > falls back to kmalloc. So vmalloc will only be on those greater than =
1 page
> > > size, which are in the minority (for e.g. zs_handle, request_sock_sub=
flow_v6,
> > > request_sock_subflow_v4...).
> >
> > Not just the majority. For all of these kvmalloc allocations kmalloc
> > will be tried first and vmalloc will be used only if the former
> > failed: https://elixir.bootlin.com/linux/v6.14.7/source/mm/util.c#L665
> > That's why I think this should not regress normal case when slab has
> > enough space to satisfy the allocation.
>
> And you really should consider just letting the extension vector
> allocation fail if we're under that much memory pressure.

I see your point. One case we would want to use vmalloc is if the
allocation is sizable (multiple pages), so failing it does not mean
critical memory pressure level yet. I don't think today's extension
vectors would be large enough to span multiple pages. That would
require a rather large obj_per_slab and in most cases I think this
change would not affect current behavior, the allocations will be
smaller than PAGE_SIZE and kvmalloc will fail anyway.
I guess the question is whether we want to fail if allocation size is
higher than PAGE_SIZE but less than PAGE_ALLOC_COSTLY_ORDER. Failing
that I think is reasonable and I don't think any extension vector will
be large enough to reach PAGE_ALLOC_COSTLY_ORDER. So, I'm ok with
dropping this part of the patchset.

>
> Failing allocations is an important mechanism for load shedding,
> otherwise stuff just piles up - it's a big cause of our terrible
> behaviour when we're thrashing.
>
> It's equivalent to bufferbloat in the networking world.
