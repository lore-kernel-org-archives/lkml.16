Received: from invmail3.skhynix.com (exvmail3.hynix.com [166.125.252.90])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2A6D28F53F
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 23:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.125.252.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744761526; cv=none; b=oI7kXSLwtSRMx4tPjIrMVtnp0ae8iN8TdRFGOdqDR/GeuXXk5dVBexz7JE2aWCF5YtDYwnMuLDmJ/34N9JKGu/u/QglTMT+n5qTF1iZe9OPkexy1jeGXkXNZZuk2o++1F/4K0wQ7uElCDAGLddGRWEYnxqJfnndaaZpG8nURRwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744761526; c=relaxed/simple;
	bh=ocMyd/+F9njsJBHIDcBlp6ILk7K4UYbDoGQBteV/7+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kOzrxRhg8DwJwl+liqMT6ai9I/DVwDE211mTr1JkqayKxTmXliaxj0bqOWjwZUDPSJDuYg5SOqjFZ+zfhLOK2lXk3jiY/jr057noRYhY9KC9sQoCYPLdd7EPnKzCyuFIuvOrj8IqV9gdddiNFMttFPL3stktjadU5Fkv/8ucWKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com; spf=pass smtp.mailfrom=sk.com; arc=none smtp.client-ip=166.125.252.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sk.com
X-AuditID: a67dfc59-057ff7000000aab6-da-67fef2a5aafd
From: "yohan.joung" <yohan.joung@sk.com>
To: daeho43@gmail.com
Cc: chao@kernel.org,
	jaegeuk@kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	pilhyun.kim@sk.com
Subject: Re: [f2fs-dev] [PATCH v1] f2fs: Improve large section GC by locating valid block segments
Date: Wed, 16 Apr 2025 08:58:23 +0900
Message-ID: <20250415235828.2045-1-yohan.joung@sk.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <CACOAw_x6YjYzF0PbifP05c9fnO9n1r_jN8NxUByef3DMPVXjPQ@mail.gmail.com>
References: <CACOAw_x6YjYzF0PbifP05c9fnO9n1r_jN8NxUByef3DMPVXjPQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOLMWRmVeSWpSXmKPExsXC9ZZnke7ST//SDX5u1LA4PfUsk8WbI2dY
	LJ6sn8VscWmRu8XlXXPYHFg9ds66y+6xaVUnm8fuBZ+ZPD5vkgtgieKySUnNySxLLdK3S+DK
	eLv0JnvBjcyKWU01DYxt3l2MnBwSAiYSjVcXssHYP48fBLPZBDQk/vT2MoPYIgKiEvNW72ME
	sZkFOhklfm0JALGFBZIknlw+ywpiswioSqz73c4EYvMKmEnc+7iAEWKmpsSOL+fB4pwCgRJL
	FiwFqxcSCJDoXdnCAlEvKHFy5hMgmwNovrrE+nlCEKvkJZq3zgY6gQtoTA+bxPaT/ewQMyUl
	Dq64wTKBUWAWkvZZCO2zkLQvYGRexSiSmVeWm5iZY6xXnJ1RmZdZoZecn7uJERi8y2r/RO5g
	/HYh+BCjAAejEg9vZPy/dCHWxLLiytxDjBIczEoivOfMgUK8KYmVValF+fFFpTmpxYcYpTlY
	lMR5jb6VpwgJpCeWpGanphakFsFkmTg4pRoYuW4vWxvnMzvsoqIol8+ZwJo3m0XvPZiW/bav
	aPmp1lNPz75/vaw4PTz/cLO+vZl4yc7v6+e/bZ/7jnXO3eD/y2UVF89nO3l9G4tf94r3R24t
	s9sn29bnbPHQ0XFiyIYJtlUVhoICuYK6gaWhF/+JrbcROTm50ef+kWyvOEaHJ1slKyOS3LbP
	VmIpzkg01GIuKk4EAGkJDRBaAgAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNLMWRmVeSWpSXmKPExsXCNUNlju7ST//SDT79kbY4PfUsk8WbI2dY
	LJ6sn8VscWmRu8XlXXPYLCbMvcrkwOaxc9Zddo9NqzrZPHYv+Mzk8e22h8fnTXIBrFFcNimp
	OZllqUX6dglcGW+X3mQvuJFZMauppoGxzbuLkZNDQsBE4ufxg2wgNpuAhsSf3l5mEFtEQFRi
	3up9jCA2s0Ano8SvLQEgtrBAksSTy2dZQWwWAVWJdb/bmUBsXgEziXsfFzBCzNSU2PHlPFic
	UyBQYsmCpWD1QgIBEr0rW1gg6gUlTs58AmRzAM1Xl1g/TwhilbxE89bZzBMYeWchqZqFUDUL
	SdUCRuZVjCKZeWW5iZk5ZnrF2RmVeZkVesn5uZsYgUG4rPbPpB2M3y67H2IU4GBU4uGNiP+X
	LsSaWFZcmXuIUYKDWUmE95w5UIg3JbGyKrUoP76oNCe1+BCjNAeLkjivV3hqgpBAemJJanZq
	akFqEUyWiYNTqoGxdt+Wzt3zpK3T9Pd3J81Y6n3dqU/TxmeS71eWnSsbtu/dY2/FZWr4eMt+
	53f7fXSzrvk471/oc7psp8eq98qzdvec/P3F7m724wXXvRya9iRYpbaLF088L2u24uOt449v
	i/w5xZyYeqtMnOPiRh6jaMWfLy3Pu8stnMqr7nBE7GX1+wlaoc3blFiKMxINtZiLihMBMDQw
	Tz4CAAA=
X-CFilter-Loop: Reflected

>On Fri, Apr 11, 2025 at 3:07 AM Chao Yu <chao@kernel.org> wrote:
>>
>> Yohan,
>>
>> Sorry for the delay, will catch up this a little bit latter.
>>
>> On 2025/4/10 8:17, yohan.joung wrote:
>> > hi jeageuk, chao
>> > How about changing the large section gc in this direction?
>> > Thanks
>> >
>> >> Change the large section GC to locate valid block segments instead of
>> >> performing a sequential search. This modification enhances performance
>> >> by reducing unnecessary block scanning in large storage sections.
>> >>
>> >> example :
>> >> [invalid seg 0] [invalid seg 1] [invalid seg 2]
>> >> [  valid seg 3] [  valid seg 4] [  valid seg 5]
>> >>
>> >> Current: In the first GC, nothing is moved,
>> >> but in the second GC, segments 3, 4, and 5 are moved.
>> >> Change: In the first GC, segments 3, 4, and 5 are moved.
>> >>
>> >> Signed-off-by: yohan.joung <yohan.joung@sk.com>
>> >> ---
>> >>   fs/f2fs/f2fs.h  |  2 ++
>> >>   fs/f2fs/gc.c    | 92 +++++++++++++++++++++++++++++++++++--------------
>> >>   fs/f2fs/gc.h    |  6 ++++
>> >>   fs/f2fs/super.c |  8 ++++-
>> >>   4 files changed, 82 insertions(+), 26 deletions(-)
>> >>
>> >> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>> >> index f1576dc6ec67..348417edac25 100644
>> >> --- a/fs/f2fs/f2fs.h
>> >> +++ b/fs/f2fs/f2fs.h
>> >> @@ -4008,6 +4008,8 @@ int f2fs_gc_range(struct f2fs_sb_info *sbi,
>> >>   int f2fs_resize_fs(struct file *filp, __u64 block_count);
>> >>   int __init f2fs_create_garbage_collection_cache(void);
>> >>   void f2fs_destroy_garbage_collection_cache(void);
>> >> +int __init f2fs_init_garbage_collection_summary_cache(void);
>> >> +void f2fs_destroy_garbage_collection_summary_cache(void);
>> >>   /* victim selection function for cleaning and SSR */
>> >>   int f2fs_get_victim(struct f2fs_sb_info *sbi, unsigned int *result,
>> >>                      int gc_type, int type, char alloc_mode,
>> >> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
>> >> index 2b8f9239bede..3b63e85fa038 100644
>> >> --- a/fs/f2fs/gc.c
>> >> +++ b/fs/f2fs/gc.c
>> >> @@ -24,6 +24,7 @@
>> >>   #include <trace/events/f2fs.h>
>> >>
>> >>   static struct kmem_cache *victim_entry_slab;
>> >> +static struct kmem_cache *gc_page_entry_slab;
>> >>
>> >>   static unsigned int count_bits(const unsigned long *addr,
>> >>                              unsigned int offset, unsigned int len);
>> >> @@ -711,6 +712,30 @@ static void release_victim_entry(struct f2fs_sb_info *sbi)
>> >>      f2fs_bug_on(sbi, !list_empty(&am->victim_list));
>> >>   }
>> >>
>> >> +static struct gc_page_entry *add_gc_page_entry(struct list_head *gc_page_list,
>> >> +                                    struct page *sum_page, unsigned int segno)
>> >> +{
>> >> +    struct gc_page_entry *gpe;
>> >> +
>> >> +    gpe = f2fs_kmem_cache_alloc(gc_page_entry_slab, GFP_NOFS, true, NULL);
>> >> +    gpe->segno = segno;
>> >> +    gpe->sum_page = sum_page;
>> >> +    list_add_tail(&gpe->list, gc_page_list);
>> >> +    return gpe;
>> >> +}
>> >> +
>> >> +static void release_gc_page_entry(struct list_head *gc_page_list, bool putpage)
>> >> +{
>> >> +    struct gc_page_entry *gpe, *tmp;
>> >> +
>> >> +    list_for_each_entry_safe(gpe, tmp, gc_page_list, list) {
>> >> +            if (putpage)
>> >> +                    f2fs_put_page(gpe->sum_page, 0);
>> >> +            list_del(&gpe->list);
>> >> +            kmem_cache_free(gc_page_entry_slab, gpe);
>> >> +    }
>> >> +}
>> >> +
>> >>   static bool f2fs_pin_section(struct f2fs_sb_info *sbi, unsigned int segno)
>> >>   {
>> >>      struct dirty_seglist_info *dirty_i = DIRTY_I(sbi);
>> >> @@ -1721,14 +1746,18 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
>> >>      struct page *sum_page;
>> >>      struct f2fs_summary_block *sum;
>> >>      struct blk_plug plug;
>> >> +    struct gc_page_entry *gpe;
>> >>      unsigned int segno = start_segno;
>> >>      unsigned int end_segno = start_segno + SEGS_PER_SEC(sbi);
>> >>      unsigned int sec_end_segno;
>> >> +    unsigned int window_granularity = 1;
>> >>      int seg_freed = 0, migrated = 0;
>> >>      unsigned char type = IS_DATASEG(get_seg_entry(sbi, segno)->type) ?
>> >>                                              SUM_TYPE_DATA : SUM_TYPE_NODE;
>> >>      unsigned char data_type = (type == SUM_TYPE_DATA) ? DATA : NODE;
>> >>      int submitted = 0;
>> >> +    int gc_list_count = 0;
>> >> +    LIST_HEAD(gc_page_list);
>> >>
>> >>      if (__is_large_section(sbi)) {
>> >>              sec_end_segno = rounddown(end_segno, SEGS_PER_SEC(sbi));
>> >> @@ -1744,7 +1773,7 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
>> >>                                      f2fs_usable_segs_in_sec(sbi);
>> >>
>> >>              if (gc_type == BG_GC || one_time) {
>> >> -                    unsigned int window_granularity =
>> >> +                    window_granularity =
>> >>                              sbi->migration_window_granularity;
>
>Plz, refer to the below described in sysfs-fs-f2fs.
Thanks, I'll take a look at this.
>
>What:           /sys/fs/f2fs/<disk>/migration_window_granularity
>Date:           September 2024
>Contact:        "Daeho Jeong" <daehojeong@google.com>
>Description:    Controls migration window granularity of garbage
>collection on large
>                section. it can control the scanning window
>granularity for GC migration
>                in a unit of segment, while migration_granularity
>controls the number
>                of segments which can be migrated at the same turn.
>
>In your patch, it's more like migration_granularity.
>Plus, I think we don't need migration_window_granularity anymore with
>your patch.
>
>> >>
>> >>                      if (f2fs_sb_has_blkzoned(sbi) &&
>> >> @@ -1752,8 +1781,6 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
>> >>                                      sbi->gc_thread->boost_zoned_gc_percent))
>> >>                              window_granularity *=
>> >>                                      BOOST_GC_MULTIPLE;
>> >> -
>> >> -                    end_segno = start_segno + window_granularity;
>> >>              }
>> >>
>> >>              if (end_segno > sec_end_segno)
>> >> @@ -1762,37 +1789,38 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
>> >>
>> >>      sanity_check_seg_type(sbi, get_seg_entry(sbi, segno)->type);
>> >>
>> >> -    /* readahead multi ssa blocks those have contiguous address */
>> >> -    if (__is_large_section(sbi))
>> >> +    for (segno = start_segno; segno < end_segno; segno++) {
>> >> +            if (!get_valid_blocks(sbi, segno, false))
>> >> +                    continue;
>> >> +
>> >> +            /* readahead multi ssa blocks those have contiguous address */
>> >>              f2fs_ra_meta_pages(sbi, GET_SUM_BLOCK(sbi, segno),
>> >> -                                    end_segno - segno, META_SSA, true);
>> >> +                            window_granularity, META_SSA, true);
>> >>
>> >> -    /* reference all summary page */
>> >> -    while (segno < end_segno) {
>> >> -            sum_page = f2fs_get_sum_page(sbi, segno++);
>> >> +            /* reference all summary page */
>> >> +            sum_page = f2fs_get_sum_page(sbi, segno);
>> >>              if (IS_ERR(sum_page)) {
>> >>                      int err = PTR_ERR(sum_page);
>> >> -
>> >> -                    end_segno = segno - 1;
>> >> -                    for (segno = start_segno; segno < end_segno; segno++) {
>> >> -                            sum_page = find_get_page(META_MAPPING(sbi),
>> >> -                                            GET_SUM_BLOCK(sbi, segno));
>> >> -                            f2fs_put_page(sum_page, 0);
>> >> -                            f2fs_put_page(sum_page, 0);
>> >> -                    }
>> >> +                    release_gc_page_entry(&gc_page_list, true);
>> >>                      return err;
>> >>              }
>> >> +            add_gc_page_entry(&gc_page_list, sum_page, segno);
>> >>              unlock_page(sum_page);
>> >> +            if (++gc_list_count >= window_granularity)
>> >> +                    break;
>> >>      }
>> >>
>> >>      blk_start_plug(&plug);
>> >>
>> >> -    for (segno = start_segno; segno < end_segno; segno++) {
>> >> +    list_for_each_entry(gpe, &gc_page_list, list) {
>> >>
>> >>              /* find segment summary of victim */
>> >> -            sum_page = find_get_page(META_MAPPING(sbi),
>> >> -                                    GET_SUM_BLOCK(sbi, segno));
>> >> -            f2fs_put_page(sum_page, 0);
>> >> +            sum_page = gpe->sum_page;
>> >> +            segno = gpe->segno;
>> >> +            if (!sum_page) {
>> >> +                    f2fs_err(sbi, "Failed to get summary page for segment %u", segno);
>> >> +                    goto skip;
>> >> +            }
>> >>
>> >>              if (get_valid_blocks(sbi, segno, false) == 0)
>> >>                      goto freed;
>> >> @@ -1835,18 +1863,20 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
>> >>                              get_valid_blocks(sbi, segno, false) == 0)
>> >>                      seg_freed++;
>> >>
>> >> -            if (__is_large_section(sbi))
>> >> -                    sbi->next_victim_seg[gc_type] =
>> >> -                            (segno + 1 < sec_end_segno) ?
>> >> -                                    segno + 1 : NULL_SEGNO;
>> >>   skip:
>> >>              f2fs_put_page(sum_page, 0);
>> >>      }
>> >>
>> >> +    if (__is_large_section(sbi) && !list_empty(&gc_page_list))
>> >> +            sbi->next_victim_seg[gc_type] =
>> >> +                    (segno + 1 < sec_end_segno) ?
>> >> +                            segno + 1 : NULL_SEGNO;
>> >> +
>> >>      if (submitted)
>> >>              f2fs_submit_merged_write(sbi, data_type);
>> >>
>> >>      blk_finish_plug(&plug);
>> >> +    release_gc_page_entry(&gc_page_list, false);
>> >>
>> >>      if (migrated)
>> >>              stat_inc_gc_sec_count(sbi, data_type, gc_type);
>> >> @@ -2008,6 +2038,18 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
>> >>      return ret;
>> >>   }
>> >>
>> >> +int __init f2fs_init_garbage_collection_summary_cache(void)
>> >> +{
>> >> +    gc_page_entry_slab = f2fs_kmem_cache_create("f2fs_gc_page_entry",
>> >> +                                    sizeof(struct gc_page_entry));
>> >> +    return gc_page_entry_slab ? 0 : -ENOMEM;
>> >> +}
>> >> +
>> >> +void f2fs_destroy_garbage_collection_summary_cache(void)
>> >> +{
>> >> +    kmem_cache_destroy(gc_page_entry_slab);
>> >> +}
>> >> +
>> >>   int __init f2fs_create_garbage_collection_cache(void)
>> >>   {
>> >>      victim_entry_slab = f2fs_kmem_cache_create("f2fs_victim_entry",
>> >> diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h
>> >> index 5c1eaf55e127..9c8695efe394 100644
>> >> --- a/fs/f2fs/gc.h
>> >> +++ b/fs/f2fs/gc.h
>> >> @@ -82,6 +82,12 @@ struct victim_entry {
>> >>      struct list_head list;
>> >>   };
>> >>
>> >> +struct gc_page_entry {
>> >> +    unsigned int segno;
>> >> +    struct page *sum_page;
>> >> +    struct list_head list;
>> >> +};
>> >> +
>> >>   /*
>> >>    * inline functions
>> >>    */
>> >> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
>> >> index f087b2b71c89..a3241730fe4f 100644
>> >> --- a/fs/f2fs/super.c
>> >> +++ b/fs/f2fs/super.c
>> >> @@ -5090,9 +5090,12 @@ static int __init init_f2fs_fs(void)
>> >>      err = f2fs_create_garbage_collection_cache();
>> >>      if (err)
>> >>              goto free_extent_cache;
>> >> -    err = f2fs_init_sysfs();
>> >> +    err = f2fs_init_garbage_collection_summary_cache();
>> >>      if (err)
>> >>              goto free_garbage_collection_cache;
>> >> +    err = f2fs_init_sysfs();
>> >> +    if (err)
>> >> +            goto free_garbage_collection_summary_cache;
>> >>      err = f2fs_init_shrinker();
>> >>      if (err)
>> >>              goto free_sysfs;
>> >> @@ -5141,6 +5144,8 @@ static int __init init_f2fs_fs(void)
>> >>      f2fs_exit_shrinker();
>> >>   free_sysfs:
>> >>      f2fs_exit_sysfs();
>> >> +free_garbage_collection_summary_cache:
>> >> +    f2fs_destroy_garbage_collection_summary_cache();
>> >>   free_garbage_collection_cache:
>> >>      f2fs_destroy_garbage_collection_cache();
>> >>   free_extent_cache:
>> >> @@ -5172,6 +5177,7 @@ static void __exit exit_f2fs_fs(void)
>> >>      f2fs_destroy_root_stats();
>> >>      f2fs_exit_shrinker();
>> >>      f2fs_exit_sysfs();
>> >> +    f2fs_destroy_garbage_collection_summary_cache();
>> >>      f2fs_destroy_garbage_collection_cache();
>> >>      f2fs_destroy_extent_cache();
>> >>      f2fs_destroy_recovery_cache();
>> >> --
>> >> 2.33.0
>> >>
>
>Do you have any numbers showing how much the performance is enhanced?
Depending on the valid block count within a section, 
in the worst-case scenario, it is assumed that only 
the last 3 segments in the section are valid (SEGS_PER_SEC 512)
#define DEF_GC_THREAD_MAX_SLEEP_TIME_ZONED	20
#define DEF_MIGRATION_WINDOW_GRANULARITY_ZONED	3
The time required to move a single section
before : 
170 * 20ms + migrate 3segments
after : 
migrate 3segments
Thanks.
>
>Thanks.

>
>> >>
>> >>
>> >> _______________________________________________
>> >> Linux-f2fs-devel mailing list
>> >> Linux-f2fs-devel@lists.sourceforge.net
