Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75681A0BFA
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 22:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744669329; cv=none; b=I0AnfL/Gi9Yd0Uc36+sOk8cRNxCiHsf7dRd0AFSGR0FWXI3BQ4Kgui8opLtVeO4bvRY7y+uM/UuqgG2cIly2qjEeFCr5QFJZDdYgYndghSrerZLo8Zsvv3dyhxrlda8mJ8nwMF7gxQw1s3mDto6O8Mppj8TcSGORA5CleOlhihc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744669329; c=relaxed/simple;
	bh=LJlRc7vTi823ajsdPLfwTO3YUFsGLfwqM4zvUjGhzKw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DsjjLu6t+iqLLxLXWKHGFfq7vFWei41B2gdcrwI1WSn/ZeF/D/C9VPOwBWPLuROkjXeBiNqBdkGSQoHrY3iOM+CTgqtktlRUXqK7cgYTm61cyZwVibMXGf2kYEsUeC4lFeDttVeovFsYyGuNUbdlzZpZGR4+M4WKeF2sxGGLteE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L+yivwfi; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L+yivwfi"
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-86dc3482b3dso5380163241.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 15:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744669326; x=1745274126; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iK/nxqicaOMRgHlN+BH55oegbNVrqJvNg6xS7Bg7ixo=;
        b=L+yivwfiGZd7uszq9MvegTdy2ppKs8VbsI/MAUKlUJausk+ZOnBW3pKZK0Wm0pGrVE
         g3jzHYiMcoocRdH9Rivpx58bA9ENyRlfY71hoxMMLlPMVkqzYSxjTDmINz3QpTSb514a
         nBW2SCIt91l/hO8MtZE6ybXyVgf/OGGt3QOk6oqOTj22Naq3FjVEnfn9oeEwL9rcE8PW
         sWU/L0M68qByuD7FBneOi/GODe78DJXPflB4/PlYpZLGzWXJm5cDFczlsEO5dHVyV+en
         /vqXqjmOwEJACH8oyeYg0oSsD7ZcQsEomZMwu6KU4Ao9O8ZFQ+LVolcTWLMT5cgDvzSG
         /Smg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744669326; x=1745274126;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iK/nxqicaOMRgHlN+BH55oegbNVrqJvNg6xS7Bg7ixo=;
        b=I3oBSzwei2H02I0UVSQAXgLPMUGHHW2SCCyECcB6+T2tVE5PEvopwP/nOPOA/LM6FB
         cTbE8NvZKb9xpekZX9khrilkNzKwHxlbEqfpDbJ3/y9D3GK7kEsxXVxVW76hmEfvovYy
         n9KNDU5R7C1AkVzoVacwMkLV7cTkhSXdY4sGeJP3KkquSgXubwwHNEo8GpuhJ8fpYUok
         L5qZzbtZQpXqsdtxKyKWOwh5t2I9a3com4Aqgb4DXM24VOsUH3C8VHCQayQZGRMFmC7W
         uBIfQs7BgRjWTKbZsL8+knTXccW5rroaK1+W274p4fIJ1n6oiu4FQnFSc22OeHi5C7L4
         gMfA==
X-Forwarded-Encrypted: i=1; AJvYcCXVmboIslLPykdoPH1eNInDsNo7B76Y3ioLJA/Om0VEL5m1pKYOV7ahr03SxLRj+xuKaOu3FrmEL0R1vXI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw336yM7yOxMRjNOzbj4d4dEpoyOG832MnpUr6VF9msdlbwEQxR
	O32BXraSeaQukJscFmsozZGEYYPB2AAZRdFgKJQZmTvi8DSE5m8KWGbR95On4+auERlLhWRE9R7
	TqKm/yMG7t/57e+GxmaJ9nwLWQoEUYDmV
X-Gm-Gg: ASbGnct47hb0ffHEF6/CwLY5a++oYIQMUFiQJvnsNAciD1/9kYak9zpa06NHGuSQmpW
	k+d2T/eAg+KGHlYac8rpngxJYzda6P9jABOWen50iMq/Ngf59tS25bI/7qzSo5LCVlqPBXED+WD
	FvVdeE4SaCFc9J3JL52gvFjGoqZcVLHnTS87HYw6CTgFllQI6pqI4WJ3A=
X-Google-Smtp-Source: AGHT+IF0/N+41owJcwFJnZTGUTx2bmokxI68RBiwge12PFIrT/0VRnWiurjDcdvq+4FtF6W2GBvhu29U/K4CWYouBfo=
X-Received: by 2002:a67:c986:0:b0:4c4:ebb1:4f6d with SMTP id
 ada2fe7eead31-4cb42eb1e78mr892003137.11.1744669326413; Mon, 14 Apr 2025
 15:22:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410001747.1844-1-yohan.joung@sk.com> <de198b35-fdfd-4fe9-98b9-bb346a81b54c@kernel.org>
In-Reply-To: <de198b35-fdfd-4fe9-98b9-bb346a81b54c@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Mon, 14 Apr 2025 15:21:55 -0700
X-Gm-Features: ATxdqUFIeybaPUiDisaKH1o_2ttH9TqwAAbsl-twjTpipedkdep39QFCv1tlaHs
Message-ID: <CACOAw_x6YjYzF0PbifP05c9fnO9n1r_jN8NxUByef3DMPVXjPQ@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH v1] f2fs: Improve large section GC by locating
 valid block segments
To: Chao Yu <chao@kernel.org>
Cc: "yohan.joung" <yohan.joung@sk.com>, pilhyun.kim@sk.com, linux-kernel@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2025 at 3:07=E2=80=AFAM Chao Yu <chao@kernel.org> wrote:
>
> Yohan,
>
> Sorry for the delay, will catch up this a little bit latter.
>
> On 2025/4/10 8:17, yohan.joung wrote:
> > hi jeageuk, chao
> > How about changing the large section gc in this direction?
> > Thanks
> >
> >> Change the large section GC to locate valid block segments instead of
> >> performing a sequential search. This modification enhances performance
> >> by reducing unnecessary block scanning in large storage sections.
> >>
> >> example :
> >> [invalid seg 0] [invalid seg 1] [invalid seg 2]
> >> [  valid seg 3] [  valid seg 4] [  valid seg 5]
> >>
> >> Current: In the first GC, nothing is moved,
> >> but in the second GC, segments 3, 4, and 5 are moved.
> >> Change: In the first GC, segments 3, 4, and 5 are moved.
> >>
> >> Signed-off-by: yohan.joung <yohan.joung@sk.com>
> >> ---
> >>   fs/f2fs/f2fs.h  |  2 ++
> >>   fs/f2fs/gc.c    | 92 +++++++++++++++++++++++++++++++++++------------=
--
> >>   fs/f2fs/gc.h    |  6 ++++
> >>   fs/f2fs/super.c |  8 ++++-
> >>   4 files changed, 82 insertions(+), 26 deletions(-)
> >>
> >> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> >> index f1576dc6ec67..348417edac25 100644
> >> --- a/fs/f2fs/f2fs.h
> >> +++ b/fs/f2fs/f2fs.h
> >> @@ -4008,6 +4008,8 @@ int f2fs_gc_range(struct f2fs_sb_info *sbi,
> >>   int f2fs_resize_fs(struct file *filp, __u64 block_count);
> >>   int __init f2fs_create_garbage_collection_cache(void);
> >>   void f2fs_destroy_garbage_collection_cache(void);
> >> +int __init f2fs_init_garbage_collection_summary_cache(void);
> >> +void f2fs_destroy_garbage_collection_summary_cache(void);
> >>   /* victim selection function for cleaning and SSR */
> >>   int f2fs_get_victim(struct f2fs_sb_info *sbi, unsigned int *result,
> >>                      int gc_type, int type, char alloc_mode,
> >> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> >> index 2b8f9239bede..3b63e85fa038 100644
> >> --- a/fs/f2fs/gc.c
> >> +++ b/fs/f2fs/gc.c
> >> @@ -24,6 +24,7 @@
> >>   #include <trace/events/f2fs.h>
> >>
> >>   static struct kmem_cache *victim_entry_slab;
> >> +static struct kmem_cache *gc_page_entry_slab;
> >>
> >>   static unsigned int count_bits(const unsigned long *addr,
> >>                              unsigned int offset, unsigned int len);
> >> @@ -711,6 +712,30 @@ static void release_victim_entry(struct f2fs_sb_i=
nfo *sbi)
> >>      f2fs_bug_on(sbi, !list_empty(&am->victim_list));
> >>   }
> >>
> >> +static struct gc_page_entry *add_gc_page_entry(struct list_head *gc_p=
age_list,
> >> +                                    struct page *sum_page, unsigned i=
nt segno)
> >> +{
> >> +    struct gc_page_entry *gpe;
> >> +
> >> +    gpe =3D f2fs_kmem_cache_alloc(gc_page_entry_slab, GFP_NOFS, true,=
 NULL);
> >> +    gpe->segno =3D segno;
> >> +    gpe->sum_page =3D sum_page;
> >> +    list_add_tail(&gpe->list, gc_page_list);
> >> +    return gpe;
> >> +}
> >> +
> >> +static void release_gc_page_entry(struct list_head *gc_page_list, boo=
l putpage)
> >> +{
> >> +    struct gc_page_entry *gpe, *tmp;
> >> +
> >> +    list_for_each_entry_safe(gpe, tmp, gc_page_list, list) {
> >> +            if (putpage)
> >> +                    f2fs_put_page(gpe->sum_page, 0);
> >> +            list_del(&gpe->list);
> >> +            kmem_cache_free(gc_page_entry_slab, gpe);
> >> +    }
> >> +}
> >> +
> >>   static bool f2fs_pin_section(struct f2fs_sb_info *sbi, unsigned int =
segno)
> >>   {
> >>      struct dirty_seglist_info *dirty_i =3D DIRTY_I(sbi);
> >> @@ -1721,14 +1746,18 @@ static int do_garbage_collect(struct f2fs_sb_i=
nfo *sbi,
> >>      struct page *sum_page;
> >>      struct f2fs_summary_block *sum;
> >>      struct blk_plug plug;
> >> +    struct gc_page_entry *gpe;
> >>      unsigned int segno =3D start_segno;
> >>      unsigned int end_segno =3D start_segno + SEGS_PER_SEC(sbi);
> >>      unsigned int sec_end_segno;
> >> +    unsigned int window_granularity =3D 1;
> >>      int seg_freed =3D 0, migrated =3D 0;
> >>      unsigned char type =3D IS_DATASEG(get_seg_entry(sbi, segno)->type=
) ?
> >>                                              SUM_TYPE_DATA : SUM_TYPE_=
NODE;
> >>      unsigned char data_type =3D (type =3D=3D SUM_TYPE_DATA) ? DATA : =
NODE;
> >>      int submitted =3D 0;
> >> +    int gc_list_count =3D 0;
> >> +    LIST_HEAD(gc_page_list);
> >>
> >>      if (__is_large_section(sbi)) {
> >>              sec_end_segno =3D rounddown(end_segno, SEGS_PER_SEC(sbi))=
;
> >> @@ -1744,7 +1773,7 @@ static int do_garbage_collect(struct f2fs_sb_inf=
o *sbi,
> >>                                      f2fs_usable_segs_in_sec(sbi);
> >>
> >>              if (gc_type =3D=3D BG_GC || one_time) {
> >> -                    unsigned int window_granularity =3D
> >> +                    window_granularity =3D
> >>                              sbi->migration_window_granularity;

Plz, refer to the below described in sysfs-fs-f2fs.

What:           /sys/fs/f2fs/<disk>/migration_window_granularity
Date:           September 2024
Contact:        "Daeho Jeong" <daehojeong@google.com>
Description:    Controls migration window granularity of garbage
collection on large
                section. it can control the scanning window
granularity for GC migration
                in a unit of segment, while migration_granularity
controls the number
                of segments which can be migrated at the same turn.

In your patch, it's more like migration_granularity.
Plus, I think we don't need migration_window_granularity anymore with
your patch.

> >>
> >>                      if (f2fs_sb_has_blkzoned(sbi) &&
> >> @@ -1752,8 +1781,6 @@ static int do_garbage_collect(struct f2fs_sb_inf=
o *sbi,
> >>                                      sbi->gc_thread->boost_zoned_gc_pe=
rcent))
> >>                              window_granularity *=3D
> >>                                      BOOST_GC_MULTIPLE;
> >> -
> >> -                    end_segno =3D start_segno + window_granularity;
> >>              }
> >>
> >>              if (end_segno > sec_end_segno)
> >> @@ -1762,37 +1789,38 @@ static int do_garbage_collect(struct f2fs_sb_i=
nfo *sbi,
> >>
> >>      sanity_check_seg_type(sbi, get_seg_entry(sbi, segno)->type);
> >>
> >> -    /* readahead multi ssa blocks those have contiguous address */
> >> -    if (__is_large_section(sbi))
> >> +    for (segno =3D start_segno; segno < end_segno; segno++) {
> >> +            if (!get_valid_blocks(sbi, segno, false))
> >> +                    continue;
> >> +
> >> +            /* readahead multi ssa blocks those have contiguous addre=
ss */
> >>              f2fs_ra_meta_pages(sbi, GET_SUM_BLOCK(sbi, segno),
> >> -                                    end_segno - segno, META_SSA, true=
);
> >> +                            window_granularity, META_SSA, true);
> >>
> >> -    /* reference all summary page */
> >> -    while (segno < end_segno) {
> >> -            sum_page =3D f2fs_get_sum_page(sbi, segno++);
> >> +            /* reference all summary page */
> >> +            sum_page =3D f2fs_get_sum_page(sbi, segno);
> >>              if (IS_ERR(sum_page)) {
> >>                      int err =3D PTR_ERR(sum_page);
> >> -
> >> -                    end_segno =3D segno - 1;
> >> -                    for (segno =3D start_segno; segno < end_segno; se=
gno++) {
> >> -                            sum_page =3D find_get_page(META_MAPPING(s=
bi),
> >> -                                            GET_SUM_BLOCK(sbi, segno)=
);
> >> -                            f2fs_put_page(sum_page, 0);
> >> -                            f2fs_put_page(sum_page, 0);
> >> -                    }
> >> +                    release_gc_page_entry(&gc_page_list, true);
> >>                      return err;
> >>              }
> >> +            add_gc_page_entry(&gc_page_list, sum_page, segno);
> >>              unlock_page(sum_page);
> >> +            if (++gc_list_count >=3D window_granularity)
> >> +                    break;
> >>      }
> >>
> >>      blk_start_plug(&plug);
> >>
> >> -    for (segno =3D start_segno; segno < end_segno; segno++) {
> >> +    list_for_each_entry(gpe, &gc_page_list, list) {
> >>
> >>              /* find segment summary of victim */
> >> -            sum_page =3D find_get_page(META_MAPPING(sbi),
> >> -                                    GET_SUM_BLOCK(sbi, segno));
> >> -            f2fs_put_page(sum_page, 0);
> >> +            sum_page =3D gpe->sum_page;
> >> +            segno =3D gpe->segno;
> >> +            if (!sum_page) {
> >> +                    f2fs_err(sbi, "Failed to get summary page for seg=
ment %u", segno);
> >> +                    goto skip;
> >> +            }
> >>
> >>              if (get_valid_blocks(sbi, segno, false) =3D=3D 0)
> >>                      goto freed;
> >> @@ -1835,18 +1863,20 @@ static int do_garbage_collect(struct f2fs_sb_i=
nfo *sbi,
> >>                              get_valid_blocks(sbi, segno, false) =3D=
=3D 0)
> >>                      seg_freed++;
> >>
> >> -            if (__is_large_section(sbi))
> >> -                    sbi->next_victim_seg[gc_type] =3D
> >> -                            (segno + 1 < sec_end_segno) ?
> >> -                                    segno + 1 : NULL_SEGNO;
> >>   skip:
> >>              f2fs_put_page(sum_page, 0);
> >>      }
> >>
> >> +    if (__is_large_section(sbi) && !list_empty(&gc_page_list))
> >> +            sbi->next_victim_seg[gc_type] =3D
> >> +                    (segno + 1 < sec_end_segno) ?
> >> +                            segno + 1 : NULL_SEGNO;
> >> +
> >>      if (submitted)
> >>              f2fs_submit_merged_write(sbi, data_type);
> >>
> >>      blk_finish_plug(&plug);
> >> +    release_gc_page_entry(&gc_page_list, false);
> >>
> >>      if (migrated)
> >>              stat_inc_gc_sec_count(sbi, data_type, gc_type);
> >> @@ -2008,6 +2038,18 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2=
fs_gc_control *gc_control)
> >>      return ret;
> >>   }
> >>
> >> +int __init f2fs_init_garbage_collection_summary_cache(void)
> >> +{
> >> +    gc_page_entry_slab =3D f2fs_kmem_cache_create("f2fs_gc_page_entry=
",
> >> +                                    sizeof(struct gc_page_entry));
> >> +    return gc_page_entry_slab ? 0 : -ENOMEM;
> >> +}
> >> +
> >> +void f2fs_destroy_garbage_collection_summary_cache(void)
> >> +{
> >> +    kmem_cache_destroy(gc_page_entry_slab);
> >> +}
> >> +
> >>   int __init f2fs_create_garbage_collection_cache(void)
> >>   {
> >>      victim_entry_slab =3D f2fs_kmem_cache_create("f2fs_victim_entry",
> >> diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h
> >> index 5c1eaf55e127..9c8695efe394 100644
> >> --- a/fs/f2fs/gc.h
> >> +++ b/fs/f2fs/gc.h
> >> @@ -82,6 +82,12 @@ struct victim_entry {
> >>      struct list_head list;
> >>   };
> >>
> >> +struct gc_page_entry {
> >> +    unsigned int segno;
> >> +    struct page *sum_page;
> >> +    struct list_head list;
> >> +};
> >> +
> >>   /*
> >>    * inline functions
> >>    */
> >> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> >> index f087b2b71c89..a3241730fe4f 100644
> >> --- a/fs/f2fs/super.c
> >> +++ b/fs/f2fs/super.c
> >> @@ -5090,9 +5090,12 @@ static int __init init_f2fs_fs(void)
> >>      err =3D f2fs_create_garbage_collection_cache();
> >>      if (err)
> >>              goto free_extent_cache;
> >> -    err =3D f2fs_init_sysfs();
> >> +    err =3D f2fs_init_garbage_collection_summary_cache();
> >>      if (err)
> >>              goto free_garbage_collection_cache;
> >> +    err =3D f2fs_init_sysfs();
> >> +    if (err)
> >> +            goto free_garbage_collection_summary_cache;
> >>      err =3D f2fs_init_shrinker();
> >>      if (err)
> >>              goto free_sysfs;
> >> @@ -5141,6 +5144,8 @@ static int __init init_f2fs_fs(void)
> >>      f2fs_exit_shrinker();
> >>   free_sysfs:
> >>      f2fs_exit_sysfs();
> >> +free_garbage_collection_summary_cache:
> >> +    f2fs_destroy_garbage_collection_summary_cache();
> >>   free_garbage_collection_cache:
> >>      f2fs_destroy_garbage_collection_cache();
> >>   free_extent_cache:
> >> @@ -5172,6 +5177,7 @@ static void __exit exit_f2fs_fs(void)
> >>      f2fs_destroy_root_stats();
> >>      f2fs_exit_shrinker();
> >>      f2fs_exit_sysfs();
> >> +    f2fs_destroy_garbage_collection_summary_cache();
> >>      f2fs_destroy_garbage_collection_cache();
> >>      f2fs_destroy_extent_cache();
> >>      f2fs_destroy_recovery_cache();
> >> --
> >> 2.33.0
> >>

Do you have any numbers showing how much the performance is enhanced?

Thanks.

> >>
> >>
> >> _______________________________________________
> >> Linux-f2fs-devel mailing list
> >> Linux-f2fs-devel@lists.sourceforge.net
>
