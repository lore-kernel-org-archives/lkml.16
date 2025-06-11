Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9764685
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 01:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749605652; cv=none; b=X6nwXlF8eC8sEyuLHhBhvgt1FGcpThhyaW8gcRjoZqjmQdFuNxIBZHgJZERVrVUgr7STjcDxqqwRgMum2YxgnrO6vORR8+MI3HGFMg9KdtrbXL30YhbHKAldG9S+yGt0SAqns6+5B+F0IufFLNfEd4y1EbWjdERqR6foQRvs2gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749605652; c=relaxed/simple;
	bh=x+OnI1hmCeeSWOq5Kt9cogRY31pzrCUgmspRKccz+GE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B3Z3mHzze4rika3n88TmcD4ikuvs7gw8c5gUDM+bJ70uT7rq0rD/JjHedSTD5NR5vByHV7Z4Wm/jQg9YxjlQGe288tt0t37w/2kaRyS2ca0j/5/5rt95OeRWczsVdx9jQZqd22ky/wIGvba+KDhNsRLligk+6zV7Ic1CnDo0M1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=WPpeRvWk; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="WPpeRvWk"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-313862d48e7so10450a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 18:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1749605649; x=1750210449; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O+RwS1PnfLMbD0PcfPF/1nwrqQ/N+l3fAFRI/JL96GI=;
        b=WPpeRvWkxuO0eYn5EFZ86G/j1ZpwosRYozS1qLLChK9jDk8udDLC5BGwwJcsQ+1C0c
         dPH3+l/5kKsMvGFVhYb+IpoRlOXbkyK4KPKRmuKOBmT6vC90gLIwk/UkufMWcs/GIIIN
         keGmaT7XN17Gc+joWZr3UiP7T5oLYqcdxKbQCyLlBcbdiupTB0+mHsNy9atFZbJH9pA9
         DTrVttRaIfLV522rq1gNYX4ixdgzH/BBE4br9iTpRy3jXHgtBHs4jSNyY8u+0rkre3RT
         LeqCdVWgocZgENjJUCGtOsaHI2FeN27wgg8oHBMq1Z4/RzG3enMsKRtfdzgicWgsN5oq
         0VBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749605649; x=1750210449;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O+RwS1PnfLMbD0PcfPF/1nwrqQ/N+l3fAFRI/JL96GI=;
        b=nSb3KrtLryRp4+GzekUNs/py+GpXF8Zy/dS/Vyr0e/EIpynNt19cwP5SQ0odU2H94Z
         QI0h6hPbKexgwg3a1RCilo7rcmjRT3SSwFYhZdB2QnifSY+Idnt4jQFDwXt0KBHi9JvY
         1obooLifv5AyrYkMl+NwSpG2iGJgAmN0LBJl27eTcXx1spS2U06XunsQjuiCSWM4iKR5
         rbmGUCOEmDzkY+YncvOB8PJy7aUGrnXDJ4evqcRHb4tp3k/BqpEAdyc4d/BYkhEBRR6R
         N87yBj5sJcb9hP+eceXyz6XBOow56rA54vr77jyOHy7iqtcq58mtgdCW86woWSl5He6P
         9qtw==
X-Forwarded-Encrypted: i=1; AJvYcCWh3TMFegCAQkroJsKyKyYW8orQsx0iZhWylFLq3OQNA0D2Y3LGNdWxkB6ggsFRMChLd+TpOg/Unj6heH4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3F0OK2cgZSF7gDaT7AfaKRHdp/zpTKyBkilPvzTz1sn+GO+Cd
	brtsUsRKJKhoGO7BSZa+Z6liKGBxBa9adhxXrxPAcQetXuQL9xCfA5iNaKx0bAzCZAlvm4EjQuA
	xWweRm7YHka4x8atlG7fvJREn+qCiTbCVAuP+2Ua+4w==
X-Gm-Gg: ASbGncuqFu4Xh0MupAcT60+qG0GbZhaE1YCwfFzaMgJePgSnsdEhvYq0J9X5WcS634h
	FLTwu7LjhL+SqXceaIDI2B3JAJhQhnv2w0chTGRMoG2Q/Qya8+jdr2E3eQOE0GU9WRXGk1v/hHV
	Z4jQaQAVLQSV51tlAdLmrPKRYAtHUCx5JU1j4i5CrOorU0
X-Google-Smtp-Source: AGHT+IEzl3sJB2wN19xR6W5vHIJ9eBZ803hJ4/GH3M5wIItPR+l3lII0iZcLuPI7+4eKztFXy7/pTtc1b3K9AFS6fSI=
X-Received: by 2002:a17:90b:3ec5:b0:311:c939:c855 with SMTP id
 98e67ed59e1d1-313af1a5f6dmr762729a91.3.1749605649344; Tue, 10 Jun 2025
 18:34:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610233053.973796-1-cachen@purestorage.com> <20250610182155.36090c78124e1f60f2959d8e@linux-foundation.org>
In-Reply-To: <20250610182155.36090c78124e1f60f2959d8e@linux-foundation.org>
From: Casey Chen <cachen@purestorage.com>
Date: Tue, 10 Jun 2025 18:33:58 -0700
X-Gm-Features: AX0GCFsyzJdMCG0em6cVNKgcAjnFwkzRC995PaClcyP6g5VbMYXECJd6EZjBTAI
Message-ID: <CALCePG318ATYRH-5G+OTY_utre57EwTe3EuP4BLuXMaXPJK9gA@mail.gmail.com>
Subject: Re: [PATCH] alloc_tag: add per-NUMA node stats
To: Andrew Morton <akpm@linux-foundation.org>
Cc: surenb@google.com, kent.overstreet@linux.dev, corbet@lwn.net, 
	dennis@kernel.org, tj@kernel.org, cl@gentwo.org, vbabka@suse.cz, 
	mhocko@suse.com, jackmanb@google.com, hannes@cmpxchg.org, ziy@nvidia.com, 
	rientjes@google.com, roman.gushchin@linux.dev, harry.yoo@oracle.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	yzhong@purestorage.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 6:21=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Tue, 10 Jun 2025 17:30:53 -0600 Casey Chen <cachen@purestorage.com> wr=
ote:
>
> > Add support for tracking per-NUMA node statistics in /proc/allocinfo.
> > Previously, each alloc_tag had a single set of counters (bytes and
> > calls), aggregated across all CPUs. With this change, each CPU can
> > maintain separate counters for each NUMA node, allowing finer-grained
> > memory allocation profiling.
> >
> > This feature is controlled by the new
> > CONFIG_MEM_ALLOC_PROFILING_PER_NUMA_STATS option:
> >
> > * When enabled (=3Dy), the output includes per-node statistics followin=
g
> >   the total bytes/calls:
> >
> > <size> <calls> <tag info>
> > ...
> > 315456       9858     mm/dmapool.c:338 func:pool_alloc_page
> >         nid0     94912        2966
> >         nid1     220544       6892
> > 7680         60       mm/dmapool.c:254 func:dma_pool_create
> >         nid0     4224         33
> >         nid1     3456         27
> >
> > * When disabled (=3Dn), the output remains unchanged:
> > <size> <calls> <tag info>
> > ...
> > 315456       9858     mm/dmapool.c:338 func:pool_alloc_page
> > 7680         60       mm/dmapool.c:254 func:dma_pool_create
> >
> > To minimize memory overhead, per-NUMA stats counters are dynamically
> > allocated using the percpu allocator. PERCPU_DYNAMIC_RESERVE has been
> > increased to ensure sufficient space for in-kernel alloc_tag counters.
> >
> > For in-kernel alloc_tag instances, pcpu_alloc_noprof() is used to
> > allocate counters. These allocations are excluded from the profiling
> > statistics themselves.
>
> What is glaringly missing here is "why".
>
> What is the use case?  Why does Linux want this?  What benefit does
> this bring to our users?  This is the most important part of the
> changelog because it tells Andrew why he is even looking at this patch.
>
>
> Probably related to the above omission: why per-nid?  It would be more
> flexible to present the per-cpu counts and let userspace aggregate that
> into per-node info if that is desirable.
>

Hi Andrew,

Thanks for taking time reviewing my patch. Sorry I didn't include you
in the previous conversion. See
https://lore.kernel.org/all/CAJuCfpHhSUhxer-6MP3503w6520YLfgBTGp7Q9Qm9kgN4T=
Nsfw@mail.gmail.com/T/#u
It includes some motivations and people's opinions. You can take a
look while I am fixing your comments ASAP.
Basically, we want to know if there is any NUMA imbalance on memory
allocation. Further we could optimize our system based on the NUMA
nodes stats.

> >
> > ...
> >
> > --- a/include/linux/alloc_tag.h
> > +++ b/include/linux/alloc_tag.h
> > @@ -15,6 +15,8 @@
> >  #include <linux/static_key.h>
> >  #include <linux/irqflags.h>
> >
> > +extern int pcpu_counters_num;
>
> This globally-visible variable's identifier is too generic - the name
> should communicate which subsystem the variable belongs to.  Perhaps
> alloc_tag_num_pcpu_counters?  It's long, but only used in a few places.
>
> In fact, it's a count-of-nodes so a better name would be alloc_tag_num_no=
des.
>
> Also, as it's written to a single time, __read_mostly is appropriate.
>
> >  struct alloc_tag_counters {
> >       u64 bytes;
> >       u64 calls;
> > @@ -134,16 +136,34 @@ static inline bool mem_alloc_profiling_enabled(vo=
id)
> >                                  &mem_alloc_profiling_key);
> >  }
> >
> > +static inline struct alloc_tag_counters alloc_tag_read_nid(struct allo=
c_tag *tag, int nid)
> > +{
> > +     struct alloc_tag_counters v =3D { 0, 0 };
> > +     struct alloc_tag_counters *counters;
> > +     int cpu;
> > +
> > +     for_each_possible_cpu(cpu) {
>
> for_each_possible_cpu() is lame - potentially much more expensive than
> for_each_online_cpu.  Is it impractical to use for_each_online_cpu()?
>
> Probably doesn't matter for a userspace displaying function but
> userspace can do weird and unexpected things.
>
> > +             counters =3D per_cpu_ptr(tag->counters, cpu);
> > +             v.bytes +=3D counters[nid].bytes;
> > +             v.calls +=3D counters[nid].calls;
> > +     }
> > +
> > +     return v;
> > +}
> > +
> >
> > ...
> >
> >  static int allocinfo_show(struct seq_file *m, void *arg)
> >  {
> >       struct allocinfo_private *priv =3D (struct allocinfo_private *)ar=
g;
> > @@ -116,6 +136,9 @@ static int allocinfo_show(struct seq_file *m, void =
*arg)
> >               priv->print_header =3D false;
> >       }
> >       alloc_tag_to_text(&buf, priv->iter.ct);
> > +#ifdef CONFIG_MEM_ALLOC_PROFILING_PER_NUMA_STATS
> > +     alloc_tag_to_text_all_nids(&buf, priv->iter.ct);
> > +#endif
>
> We can eliminate the ifdef by adding
>
> #else
> static inline void alloc_tag_to_text_all_nids(struct seq_buf *out, struct=
 codetag *ct)
> {
> }
> #endif
>
> above.
>
> > +static void alloc_tag_to_text_all_nids(struct seq_buf *out, struct cod=
etag *ct)
>
> >       seq_commit(m, seq_buf_used(&buf));
> >       return 0;
> >  }
> >
> > ...
> >
> > @@ -247,19 +270,41 @@ static void shutdown_mem_profiling(bool remove_fi=
le)
> >  void __init alloc_tag_sec_init(void)
> >  {
> >       struct alloc_tag *last_codetag;
> > +     int i;
> >
> >       if (!mem_profiling_support)
> >               return;
> >
> > -     if (!static_key_enabled(&mem_profiling_compressed))
> > -             return;
> > -
> >       kernel_tags.first_tag =3D (struct alloc_tag *)kallsyms_lookup_nam=
e(
> >                                       SECTION_START(ALLOC_TAG_SECTION_N=
AME));
> >       last_codetag =3D (struct alloc_tag *)kallsyms_lookup_name(
> >                                       SECTION_STOP(ALLOC_TAG_SECTION_NA=
ME));
> >       kernel_tags.count =3D last_codetag - kernel_tags.first_tag;
> >
> > +#ifdef CONFIG_MEM_ALLOC_PROFILING_PER_NUMA_STATS
> > +     pcpu_counters_num =3D num_possible_nodes();
> > +#else
> > +     pcpu_counters_num =3D 1;
> > +#endif
>
> In the CONFIG_MEM_ALLOC_PROFILING_PER_NUMA_STATS=3Dn case, let's make
> pcpu_counters_num a constant "1", visible to all compilation units.
>
> That way the compiler can optimize away all the
>
>         for (nid =3D 0; nid < pcpu_counters_num; nid++)
>
> looping.
>
> > +     pcpu_counters_size =3D pcpu_counters_num * sizeof(struct alloc_ta=
g_counters);
> >
> > +     for (i =3D 0; i < kernel_tags.count; i++) {
> > +             /* Each CPU has one alloc_tag_counters per numa node */
> > +             kernel_tags.first_tag[i].counters =3D
> > +                     pcpu_alloc_noprof(pcpu_counters_size,
> > +                                       sizeof(struct alloc_tag_counter=
s),
> > +                                       false, GFP_KERNEL | __GFP_ZERO)=
;
> > +             if (!kernel_tags.first_tag[i].counters) {
> > +                     while (--i >=3D 0)
> > +                             free_percpu(kernel_tags.first_tag[i].coun=
ters);
> > +                     pr_info("Failed to allocate per-cpu alloc_tag cou=
nters\n");
>
> pr_err(), methinks.
>
> > +                     return;
>
> And now what happens.  Will the kernel even work?
>
> This code path is untestable unless the developer jumps through hoops
> and it will never be tested again.
>
> We assume that __init-time allocations always succeed, so a hearty
> panic() here would be OK.
>
> > +             }
> > +     }
> > +
> > +     if (!static_key_enabled(&mem_profiling_compressed))
> > +             return;
> > +
> >       /* Check if kernel tags fit into page flags */
> >       if (kernel_tags.count > (1UL << NR_UNUSED_PAGEFLAG_BITS)) {
> >               shutdown_mem_profiling(false); /* allocinfo file does not=
 exist yet */
> > @@ -622,7 +667,9 @@ static int load_module(struct module *mod, struct c=
odetag *start, struct codetag
> >       stop_tag =3D ct_to_alloc_tag(stop);
> >       for (tag =3D start_tag; tag < stop_tag; tag++) {
> >               WARN_ON(tag->counters);
> > -             tag->counters =3D alloc_percpu(struct alloc_tag_counters)=
;
> > +             tag->counters =3D __alloc_percpu_gfp(pcpu_counters_size,
> > +                                                sizeof(struct alloc_ta=
g_counters),
> > +                                                GFP_KERNEL | __GFP_ZER=
O);
> >               if (!tag->counters) {
> >                       while (--tag >=3D start_tag) {
> >                               free_percpu(tag->counters);
>
> Ditto here, actually.
>
> Not that it matters much.  It's init.text and gets thrown away, shrug.
>
> > --- a/mm/page_alloc.c
> > +++ b/mm/page_alloc.c
> >
> > ...
> >
> > @@ -428,6 +429,7 @@ void __show_mem(unsigned int filter, nodemask_t *no=
demask, int max_zone_idx)
> >               nr =3D alloc_tag_top_users(tags, ARRAY_SIZE(tags), false)=
;
> >               if (nr) {
> >                       pr_notice("Memory allocations:\n");
> > +                     pr_notice("<size> <calls> <tag info>\n");
> >                       for (i =3D 0; i < nr; i++) {
> >                               struct codetag *ct =3D tags[i].ct;
> >                               struct alloc_tag *tag =3D ct_to_alloc_tag=
(ct);
> > @@ -435,16 +437,27 @@ void __show_mem(unsigned int filter, nodemask_t *=
nodemask, int max_zone_idx)
> >                               char bytes[10];
> >
> >                               string_get_size(counter.bytes, 1, STRING_=
UNITS_2, bytes, sizeof(bytes));
> > -
> >                               /* Same as alloc_tag_to_text() but w/o in=
termediate buffer */
> >                               if (ct->modname)
> > -                                     pr_notice("%12s %8llu %s:%u [%s] =
func:%s\n",
> > -                                               bytes, counter.calls, c=
t->filename,
> > -                                               ct->lineno, ct->modname=
, ct->function);
> > +                                     pr_notice("%-12s %-8llu %s:%u [%s=
] func:%s\n",
> > +                                             bytes, counter.calls, ct-=
>filename,
> > +                                             ct->lineno, ct->modname, =
ct->function);
> >                               else
> > -                                     pr_notice("%12s %8llu %s:%u func:=
%s\n",
> > -                                               bytes, counter.calls, c=
t->filename,
> > -                                               ct->lineno, ct->functio=
n);
> > +                                     pr_notice("%-12s %-8llu %s:%u fun=
c:%s\n",
> > +                                             bytes, counter.calls,
> > +                                             ct->filename, ct->lineno,=
 ct->function);
> > +
> > +#ifdef CONFIG_MEM_ALLOC_PROFILING_PER_NUMA_STATS
> > +                             int nid;
>
> C99 definition.
>
> > +                             for (nid =3D 0; nid < pcpu_counters_num; =
nid++) {
>
> If we're going to use C99 (is OK now) then it's better to go all the
> way and give `i' loop scope.  "for (int i..".
>
> > +                                     counter =3D alloc_tag_read_nid(ta=
g, nid);
> > +                                     string_get_size(counter.bytes, 1,=
 STRING_UNITS_2,
> > +                                                     bytes, sizeof(byt=
es));
> > +                                     pr_notice("        nid%-5u %-12ll=
d %-8lld\n",
> > +                                               nid, counter.bytes, cou=
nter.calls);
> > +                             }
> > +#endif
> >                       }
> >               }
> >       }
> >
> > ...
> >
