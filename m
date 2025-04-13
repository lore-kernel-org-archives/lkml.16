Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A09A14EC73
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 21:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744581460; cv=none; b=dtagUiRg7KvDghi1byyv4Y/2IKz82/rwjwzqdbqbTT9Yo4/Ywkox6Uqu9ptl1c8HIYauCUfr/qSuhI7dDW/TSLdmFUQ/vsZMKPN59TpfcCW+Y5u7Cv4F1jhcCdowfwYLp3gMjqbp4etFs3CEXg8zjSmxBr86BZSkdIwwxJid9SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744581460; c=relaxed/simple;
	bh=SB9S6OlOau8gwtk0jJfQu+g9LsVziFd2Wbz00WxLOV0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZjYOy+WEVbJW3nACmB8GyrgiSVtP6cjJBV+6tVZCJDsBv/GLKQXpG9frehSyluKo3uGelW7dEBoTbzgiPzmsFJ+UFuK7O7lpgDRMzqh1e4adfeGzNX+F916CmxyCC++46yUQ/1HX2zfdw9GfRe2GNHLKSIGYqDT5bYO/RePzUZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gLso5OOJ; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gLso5OOJ"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-52446b21cfdso1561036e0c.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 14:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744581457; x=1745186257; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B+KHsXWFX3rQhtFp9akHwtAVVobYH9F7JjLm3VRuREI=;
        b=gLso5OOJ1q+mocWZEke7u76b4k8ARW3/8j5yDSYNpg0BSN7VqM1mRkiY2mFLwnzCaP
         DEEFc0oNXEQG5X9eDtQW3y2Xf48WDKFTx+3a2dJUVStRcSwi+t64eZK0QhQ3KLXCSY+i
         YHgYUJHhHe8ivmEE0DrLutDj0kge4xr4xkeKu9vcD6U4dFyrrDE/upnTlXi51vKFuEew
         XqMLKROXvsYL9r6jKxVGXgtNmWLkeG6SnJR4xz4D5eCzDGP9kGXGPHh/gshf2n4VWcfO
         4lfPLz9OUqBLcA3rcdtkKQdKN3BVrCSvyMy+Pdr+iALNl+JXi8fVkFsckNE2TFDVnRMd
         Ctbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744581457; x=1745186257;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B+KHsXWFX3rQhtFp9akHwtAVVobYH9F7JjLm3VRuREI=;
        b=ZBbS7LYi2DkBOoyJlELCVFU6YPJqN9K5YzwB32crv9znBzlJ+eVASZdHcXt3dLvSxl
         p2PLrmmOyaZDBARDgUw7VZQRJWq5k+XooNyiwOeU6B3qJoKKt7JoVmRt/hL+4g3YdXMS
         dyXyaxKgo/CWP8KOzfPF+NGF4jDH9foqBbXTk3CM6IHt6zKMeq4+qhX3Y8RFZR/qvje3
         qrMHofF5A6L8x/cimT8wIyoxx0ro73vGzElSUQ5y2fD0fKSy0uU/2PpFd9HEvlXtehxJ
         dVtBB+VuBK25+Ym0CRJIzGCXZJqBWUtRp1aFeygB2KCunBUGCkRZPsAhRvokUmvLUq3G
         FXIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEo4OeyqLCZAh8WRSqyp78HBVLiqsYBG6KH1frpeS/JyewtYMrhZKBb0RCL7BXP8vJvLLxmHew+/MefBY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIDYg2MsgYcOuHO0BeU0HNlQ3y4l12GLujWOajmJjpawM5Kq9V
	SQoxq399Y7wtBUY+Cv7sWc5Fu6UlBd3DMxVSziu/9WS+L0m6l1MKirFbju7VfD35iuoMbqsLBpu
	e8OxRhBBQYdl0cMACwd7iwG1u1zw=
X-Gm-Gg: ASbGncsw1puVk7jnvMeV1VY2kWpTcfyhw4Ir326vxGnfjd6jEUrOGkRiG6SN3HW3K3b
	hIcs/LNwkxlVjAytuKAcO5nwcGEWdB7dZ0zouVixAE0T+B5ELW03/hmbq4lrivLhQL4msfOeE+j
	vLv5ega5RYDN5V2IE1soMrcg==
X-Google-Smtp-Source: AGHT+IG3Zw4RW597XC+bS89jWCMvGOSdkanmkcT2FQo726Ddrdrwfc+6gui/G20yeRuv448PYMSB08LahlDIFRTzmrI=
X-Received: by 2002:a05:6122:8c6:b0:526:720:704 with SMTP id
 71dfb90a1353d-527c359743fmr5985825e0c.7.1744581457183; Sun, 13 Apr 2025
 14:57:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2d42decac5194c2c8d897b0424f0dcf3@honor.com> <Z_fYsyEA9hSEOoxp@kernel.org>
 <CAGsJ_4wACEvWe-Fcx9fShkF8okEVb3srGDVCn0v0QjALq7nneg@mail.gmail.com>
 <bdf6988006d546d498ccb2b7c14c6fe0@honor.com> <CAGsJ_4xDc_5q8dBYVq-Ga0iKJD9pTQdYSHrKw8R=1RHNb4+r7Q@mail.gmail.com>
 <c915776e308f49e7867ecb50afa44d36@honor.com>
In-Reply-To: <c915776e308f49e7867ecb50afa44d36@honor.com>
From: Barry Song <21cnbao@gmail.com>
Date: Mon, 14 Apr 2025 09:57:26 +1200
X-Gm-Features: ATxdqUHfxB6zE_onPyS5JIkQClurElIiYFcoRX3HtdGibPrA2baUQ_IEg5mnvVM
Message-ID: <CAGsJ_4x+5Pm6r655k+H9A67-d9AchD9qgsEKgU5oY6N1=JbTRA@mail.gmail.com>
Subject: Re: [PATCH] mm: simplify zone_idx()
To: gaoxu <gaoxu2@honor.com>
Cc: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	"surenb@google.com" <surenb@google.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, yipengxiang <yipengxiang@honor.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 12, 2025 at 10:06=E2=80=AFPM gaoxu <gaoxu2@honor.com> wrote:
>
> >
> > On Sat, Apr 12, 2025 at 8:34=E2=80=AFPM gaoxu <gaoxu2@honor.com> wrote:
> > >
> > > >
> > > > On Fri, Apr 11, 2025 at 2:42=E2=80=AFAM Mike Rapoport <rppt@kernel.=
org> wrote:
> > > > >
> > > > > Hi,
> > > > >
> > > > > On Thu, Apr 10, 2025 at 12:03:00PM +0000, gaoxu wrote:
> > > > > > store zone_idx directly in struct zone to simplify and optimize
> > > > > > zone_idx()
> > > > >
> > > > > Do you see an actual speed up somewhere?
> > > Almost negligible. my simple code tests showed the patch provides an =
average
> > improvement of ~0.02%.
> > > Thus, in the Android 15-6.6 kernel, I confidently retained the origin=
al zone_idx
> > function.
> > > (https://android-review.googlesource.com/c/kernel/common/+/3578322/2/=
m
> > > m/page_alloc.c#770)
> > >
> > > This patch only eliminates 2-3 assembly instructions, making it
> > > challenging to observe measurable performance benefits.
> > > However, since the zone struct includes CACHELINE_PADDING (reserving
> > > unused space), adding a new member variable does not alter the size o=
f
> > > zone. This makes the patch effectively zero-cost while achieving a cl=
eaner
> > implementation of zone_idx.
> >
> > The struct zone contains many CONFIG_ options to include or exclude cer=
tain
> > fields.
> > If we're confident that our new zone_idx doesn't increase cacheline usa=
ge for all
> > those cases, this seems like a worthwhile cleanup. Have you checked the
> > numbers?
>
> The zone info obtained through T32 in the Android 15-6.6 system(arm64):
> (struct zone) struct (1664 bytes,
>                 [0] unsigned long [4] _watermark,
>                 [32] unsigned long watermark_boost,
>                 [40] unsigned long nr_reserved_highatomic,
>                 [48] long [5] lowmem_reserve,
>                 [88] struct pglist_data * zone_pgdat,
>                 [96] struct per_cpu_pages * per_cpu_pageset,
>                 [104] struct per_cpu_zonestat * per_cpu_zonestats,
>                 [112] int pageset_high,
>                 [116] int pageset_batch,
>                 [120] unsigned long zone_start_pfn,
>                 [128] atomic_long_t managed_pages,
>                 [136] unsigned long spanned_pages,
>                 [144] unsigned long present_pages,
>                 [152] unsigned long present_early_pages,
>                 [160] unsigned long cma_pages,
>                 [168] const char * name,
>                 [176] unsigned long nr_isolate_pageblock,
>                 [184] seqlock_t span_seqlock,
>                 [192] int order,
>                 [196] int initialized,
>                 [256] struct cacheline_padding _pad1_,
>                 [256] struct free_area [11] free_area,
>                 [1400] unsigned long flags,
>                 [1408] spinlock_t lock,
>                 [1472] struct cacheline_padding _pad2_,
>                 [1472] unsigned long percpu_drift_mark,
>                 [1480] unsigned long compact_cached_free_pfn,
>                 [1488] unsigned long [2] compact_cached_migrate_pfn,
>                 [1504] unsigned long compact_init_migrate_pfn,
>                 [1512] unsigned long compact_init_free_pfn,
>                 [1520] unsigned int compact_considered,
>                 [1524] unsigned int compact_defer_shift,
>                 [1528] int compact_order_failed,
>                 [1532] bool compact_blockskip_flush,
>                 [1533] bool contiguous,
>                 [1536] struct cacheline_padding _pad3_,
>                 [1536] atomic_long_t [11] vm_stat,
>                 [1624] atomic_long_t [0] vm_numa_event)
>
> 1) It can be observed that there are 56B of free space in CACHELINE_PADDI=
NG(pad1)=EF=BC=9B
> 2) Before the variables in CACHELINE_PADDING(pad1), there are two CONFIGs=
 that are not enabled in Android 15-6.6:
>         #ifdef CONFIG_NUMA
>                 int node;
>         #endif
>
>         #ifndef CONFIG_SPARSEMEM
>                 unsigned long *pageblock_flags;
>         #endif /* CONFIG_SPARSEMEM */
>         These two CONFIGs occupy 16B.
> 3) Compared to the latest Linux code, two new variables, unsigned long nr=
_free_highatomic and int pageset_high_max, occupy an additional 16B;
> Based on the above analysis, there are still 24B of free space before CAC=
HELINE_PADDING(pad1).
> (If I misunderstand, please point it out in a timely manner. Thank you!)
>
> It would be more appropriate to place the newly added variable zone_idx b=
efore initialized.

I don't have a strong opinion on whether we need `zone_idx`=E2=80=94I'm oka=
y
with having it or not. If you'd like to add it, feel free to send out
a v2 noting that it doesn't increase the struct size. If no one
objects, it might be a nice cleanup.

> >
> > > >
> > > > +1. Curious if there's data indicating zone_idx is a hot path.
> > > There are several functions in the memory management code that are
> > > frequently executed and will call zone_idx:
> > > rmqueue()->wakeup_kswapd()->zone_idx()
> > > alloc_pages_bulk_noprof()->__count_zid_vm_events()->zone_idx()
> > >
> > > The patch
> > > (https://lore.kernel.org/all/20240229183436.4110845-2-yuzhao@google.c=
o
> > > m/) will add new hotspot paths, with the details as follows:
> > > __zone_watermark_ok()->zone_is_suitable()->zone_idx()
> > > zone_watermark_fast()->zone_is_suitable()->zone_idx()
> > > get_page_from_freelist()->zone_is_suitable()->zone_idx()
> > > __free_one_page()->zone_max_order()->zone_idx()
> > >
> > > Although The patch
> > > (https://lore.kernel.org/all/20240229183436.4110845-2-yuzhao@google.c=
o
> > > m/) has not yet merged into the Linux mainline; it is already include=
d
> > > in Android 15-6.6.
> > > >
> > >
> > > > >
> > > > > > Signed-off-by: gao xu <gaoxu2@honor.com>
> > > > > > ---
> > > > > >  include/linux/mmzone.h | 3 ++-
> > > > > >  mm/mm_init.c           | 1 +
> > > > > >  2 files changed, 3 insertions(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> > > > > > index 4c95fcc9e..7b14f577d 100644
> > > > > > --- a/include/linux/mmzone.h
> > > > > > +++ b/include/linux/mmzone.h
> > > > > > @@ -941,6 +941,7 @@ struct zone {  #endif
> > > > > >
> > > > > >       const char              *name;
> > > > > > +     enum zone_type  zone_idx;
> > > > > >
> > > > > >  #ifdef CONFIG_MEMORY_ISOLATION
> > > > > >       /*
> > > > > > @@ -1536,7 +1537,7 @@ static inline int local_memory_node(int
> > > > > > node_id)
> > > > { return node_id; };
> > > > > >  /*
> > > > > >   * zone_idx() returns 0 for the ZONE_DMA zone, 1 for the
> > > > > > ZONE_NORMAL
> > > > zone, etc.
> > > > > >   */
> > > > > > -#define zone_idx(zone)               ((zone) -
> > > > (zone)->zone_pgdat->node_zones)
> > > > > > +#define zone_idx(zone)               ((zone)->zone_idx)
> > > > > >
> > > > > >  #ifdef CONFIG_ZONE_DEVICE
> > > > > >  static inline bool zone_is_zone_device(struct zone *zone) diff
> > > > > > --git a/mm/mm_init.c b/mm/mm_init.c index 9659689b8..a7f7264f1
> > > > > > 100644
> > > > > > --- a/mm/mm_init.c
> > > > > > +++ b/mm/mm_init.c
> > > > > > @@ -1425,6 +1425,7 @@ static void __meminit
> > > > > > zone_init_internals(struct
> > > > zone *zone, enum zone_type idx,
> > > > > >       atomic_long_set(&zone->managed_pages, remaining_pages);
> > > > > >       zone_set_nid(zone, nid);
> > > > > >       zone->name =3D zone_names[idx];
> > > > > > +     zone->zone_idx =3D idx;
> > > > > >       zone->zone_pgdat =3D NODE_DATA(nid);
> > > > > >       spin_lock_init(&zone->lock);
> > > > > >       zone_seqlock_init(zone);
> > > > > > --
> > > > > > 2.17.1
> > > > >
> > > > > --
> > > > > Sincerely yours,
> > > > > Mike.
> > > >
> >

Thanks
Barry
