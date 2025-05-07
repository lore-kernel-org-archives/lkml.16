Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E080522A
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 02:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746583491; cv=none; b=CaqsPPZf78lW8T+zjYUjwXzeUApfgloa1BrfRqNQ7IWhbVwOMb/wxE7jhlkEMidChJrLCdMq/u9KENwYr84ieeFQtZE7rT6heWisMYUFWS3C70LkOBUdS8Hi5yx53OUtpHxjLu1zuLBeENCbXliaYPx1xfbKVavRTInJGxDIhxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746583491; c=relaxed/simple;
	bh=cq5jFGeuUB12jAWrEvc1jNVU7zdcL73VdEYWMpXxJ1c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jH0W6KG9Shh3VtX+7uvSgT+74dOYkPZElp3OBHOtKOKkuf3S9yDYBksqIwOxQVVdWcxH0mg/lj8uwHDSxOKEcps8+h/LGwTY+IdAqLSMkBHZTdhGrfTtHnOiwO5pRmY2uY6SihNfH2sUqY0uZ6afd+MfHfwJOJO/GpXb+7FBdj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=id2wMYIA; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="id2wMYIA"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-2c6ed7efb1dso4113650fac.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 19:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746583488; x=1747188288; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NlPsxC11d3qugk3PiiF8rZ2ohueNrS2+jnyIkxmqeRI=;
        b=id2wMYIAm/kvZg2rdJ6vL/P/nfQNWnEsGHYqa3FwiBPrjnGrxSJwjfawfwuGm9TXjj
         3ksv02PbqOoZPNfmZYLsLgpQpZsJ/17tYOFpvuRuDRKaWnO/mgS3K1LOL8bqCMZKvAj9
         icd5K31rkTf9tnz1TxMl2dKA5/mQ8yVpw72wTevqxkRn0ASGX6LXjH1lxLVt9qHukpl4
         Hgx4ZkRhUc+Ez/tdrck/4lY181RuPM/hGyMkGSnuSswL24h7eOXw4U6nAaIaZcQrQDuf
         wb95cT0SZXOHQOAl6wmXm18tfwS/MbUEZe8Rtp668b+1MYA8LRmny6sg2G3vBGNlY824
         rHtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746583488; x=1747188288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NlPsxC11d3qugk3PiiF8rZ2ohueNrS2+jnyIkxmqeRI=;
        b=fW2MY2fVL1FnprzZvbdwod3H+tka6kDYdYf6C+0rBI9VAnLrNv0XiIkfXgFOYm8gNc
         0PR5hTgESUx7gtwGqPGLxGvzCg+hdp3I7qhw/btwCdTUkCn/CAy3n88aqZkn+Nqwd7ks
         phmgbB5z9LcFk2IUe3q/VzSfQPsuiP4dMqLhANJd/WH+m7kjv2wLNrycPYmnGWOxkajq
         2EaEL59P901fWCW8i5bdEZM8rQEg20PABEacQKEVdmSDDMURfwH+InTz9A7zJ0IeIVZV
         MVyKUL2aq0aNeLwTGHX/HNIpQzXM/UXjfmDYW0SBJTyNzZRMbiW9VWELqbg2riyqypfY
         C/2w==
X-Forwarded-Encrypted: i=1; AJvYcCVsbuyo1pE/d9jUXd2JXzDDtJqn8albKxQaiPioTq8RiImKHo+RJitwfhYUCclJ5N22F+S7zIgb/RUvXbE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMtJVX1pKgPbDp9XucuPs8qlvuC3ecJHxpC9UmAY7wRtfsOmfI
	HfyA1+GxwHbkOqdq+nV6aZ7G3dorBMJ95VeFBOfvKH5d2jdtSF0C7l6T5zImYGI+5HwYYx541jP
	0NySeGv6c4xiQPo+D3tTG/Chd+z7PngQ7
X-Gm-Gg: ASbGncuvPdpFRRz/plaxLLpY2IFIc90B+bAvAf3mc+j+TjAO/0ukrbyoWqpdlDUtDX1
	jkJO2unU7CF/ja9y12S1DbD0/6Ecriqj1wGg3ElqeETarPHkv4KvxELjgkDzDEAmYxiropUpkyf
	sM9BLbwGdBT/g8z/KUtflRtg==
X-Google-Smtp-Source: AGHT+IHkoHMO0xYsvp350pbjoRMWgdZnVLWKkLvedDtfBTCi2Y6k7q50Oi7/B2wFj1uQ0BoUIWUzH6GiKF5JtinND5o=
X-Received: by 2002:a05:6122:551:b0:520:6773:e5ba with SMTP id
 71dfb90a1353d-52c379a3dc6mr1479504e0c.2.1746583477798; Tue, 06 May 2025
 19:04:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430082651.3152444-1-qun-wei.lin@mediatek.com>
 <aBqzcIteOzC9mRjY@harry> <A3307E1B-B741-4C23-8053-72A1CA04D923@nvidia.com>
In-Reply-To: <A3307E1B-B741-4C23-8053-72A1CA04D923@nvidia.com>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 7 May 2025 14:04:26 +1200
X-Gm-Features: ATxdqUH1oP4gvc5AhGcGTGALh-RMubLjfFrIFKil_cBMYlEf1IwwAvlRK2V8GAc
Message-ID: <CAGsJ_4yBn7j3WpCttPB0PVuRCYTYBcDbW2221AaPNLOHSmKADA@mail.gmail.com>
Subject: Re: [PATCH] mm: Add Kcompressd for accelerated memory compression
To: Zi Yan <ziy@nvidia.com>
Cc: Harry Yoo <harry.yoo@oracle.com>, Qun-Wei Lin <qun-wei.lin@mediatek.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Nhat Pham <nphamcs@gmail.com>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Minchan Kim <minchan@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Casper Li <casper.li@mediatek.com>, 
	Chinwen Chang <chinwen.chang@mediatek.com>, Andrew Yang <andrew.yang@mediatek.com>, 
	James Hsu <james.hsu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025 at 1:50=E2=80=AFPM Zi Yan <ziy@nvidia.com> wrote:
>
> On 6 May 2025, at 21:12, Harry Yoo wrote:
>
> > On Wed, Apr 30, 2025 at 04:26:41PM +0800, Qun-Wei Lin wrote:
> >> This patch series introduces a new mechanism called kcompressd to
> >> improve the efficiency of memory reclaiming in the operating system.
> >>
> >> Problem:
> >>   In the current system, the kswapd thread is responsible for both sca=
nning
> >>   the LRU pages and handling memory compression tasks (such as those
> >>   involving ZSWAP/ZRAM, if enabled). This combined responsibility can =
lead
> >>   to significant performance bottlenecks, especially under high memory
> >>   pressure. The kswapd thread becomes a single point of contention, ca=
using
> >>   delays in memory reclaiming and overall system performance degradati=
on.
> >>
> >> Solution:
> >>   Introduced kcompressd to handle asynchronous compression during memo=
ry
> >>   reclaim, improving efficiency by offloading compression tasks from
> >>   kswapd. This allows kswapd to focus on its primary task of page recl=
aim
> >>   without being burdened by the additional overhead of compression.
> >>
> >> In our handheld devices, we found that applying this mechanism under h=
igh
> >> memory pressure scenarios can increase the rate of pgsteal_anon per se=
cond
> >> by over 260% compared to the situation with only kswapd. Additionally,=
 we
> >> observed a reduction of over 50% in page allocation stall occurrences,
> >> further demonstrating the effectiveness of kcompressd in alleviating m=
emory
> >> pressure and improving system responsiveness.
> >>
> >> Co-developed-by: Barry Song <21cnbao@gmail.com>
> >> Signed-off-by: Barry Song <21cnbao@gmail.com>
> >> Signed-off-by: Qun-Wei Lin <qun-wei.lin@mediatek.com>
> >> Reference: Re: [PATCH 0/2] Improve Zram by separating compression cont=
ext from kswapd - Barry Song
> >>           https://lore.kernel.org/lkml/20250313093005.13998-1-21cnbao@=
gmail.com/
> >> ---
> >
> > +Cc Zi Yan, who might be interested in writing a framework (or improvin=
g
> > the existing one, padata) for parallelizing jobs (e.g. migration/compre=
ssion)
>
> Thanks.
>
> I am currently looking into padata [1] to perform multithreaded page migr=
ation
> copy job. But based on this patch, it seems that kcompressed is just an a=
dditional
> kernel thread of executing zswap_store(). Is there any need for performin=
g
> compression with multiple threads?

The current focus is on enabling kswapd to perform asynchronous compression=
,
which can significantly reduce direct reclaim and allocstall events.
Therefore, the work begins with supporting a single thread. Supporting
multiple threads might be possible in the future, but it could be difficult
to control=E2=80=94especially on busy phones=E2=80=94since it consumes more=
 power and may
interfere with other threads impacting user experience.

>
> BTW, I also notice that zswap IAA compress batching patchset[2] is using
> hardware accelerator (Intel Analytics Accelerator) to speed up zswap.
> I wonder if the handheld devices have similar hardware to get a similar b=
enefit.

Usually, the answer is no. We use zRAM and CPU, but this patch aims to prov=
ide
a common capability that can be shared by both zRAM and zswap.

>
>
> [1] https://docs.kernel.org/core-api/padata.html
> [2] https://lore.kernel.org/linux-crypto/20250303084724.6490-1-kanchana.p=
.sridhar@intel.com/
> >
> >>  include/linux/mmzone.h |  6 ++++
> >>  mm/mm_init.c           |  1 +
> >>  mm/page_io.c           | 71 +++++++++++++++++++++++++++++++++++++++++=
+
> >>  mm/swap.h              |  6 ++++
> >>  mm/vmscan.c            | 25 +++++++++++++++
> >>  5 files changed, 109 insertions(+)
> >>
> >> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> >> index 6ccec1bf2896..93c9195a54ae 100644
> >> --- a/include/linux/mmzone.h
> >> +++ b/include/linux/mmzone.h
> >> @@ -23,6 +23,7 @@
> >>  #include <linux/page-flags.h>
> >>  #include <linux/local_lock.h>
> >>  #include <linux/zswap.h>
> >> +#include <linux/kfifo.h>
> >>  #include <asm/page.h>
> >>
> >>  /* Free memory management - zoned buddy allocator.  */
> >> @@ -1398,6 +1399,11 @@ typedef struct pglist_data {
> >>
> >>      int kswapd_failures;            /* Number of 'reclaimed =3D=3D 0'=
 runs */
> >>
> >> +#define KCOMPRESS_FIFO_SIZE 256
> >> +    wait_queue_head_t kcompressd_wait;
> >> +    struct task_struct *kcompressd;
> >> +    struct kfifo kcompress_fifo;
> >> +
> >>  #ifdef CONFIG_COMPACTION
> >>      int kcompactd_max_order;
> >>      enum zone_type kcompactd_highest_zoneidx;
> >> diff --git a/mm/mm_init.c b/mm/mm_init.c
> >> index 9659689b8ace..49bae1dd4584 100644
> >> --- a/mm/mm_init.c
> >> +++ b/mm/mm_init.c
> >> @@ -1410,6 +1410,7 @@ static void __meminit pgdat_init_internals(struc=
t pglist_data *pgdat)
> >>      pgdat_init_kcompactd(pgdat);
> >>
> >>      init_waitqueue_head(&pgdat->kswapd_wait);
> >> +    init_waitqueue_head(&pgdat->kcompressd_wait);
> >>      init_waitqueue_head(&pgdat->pfmemalloc_wait);
> >>
> >>      for (i =3D 0; i < NR_VMSCAN_THROTTLE; i++)
> >> diff --git a/mm/page_io.c b/mm/page_io.c
> >> index 4bce19df557b..d85deb494a6a 100644
> >> --- a/mm/page_io.c
> >> +++ b/mm/page_io.c
> >> @@ -233,6 +233,38 @@ static void swap_zeromap_folio_clear(struct folio=
 *folio)
> >>      }
> >>  }
> >>
> >> +static bool swap_sched_async_compress(struct folio *folio)
> >> +{
> >> +    struct swap_info_struct *sis =3D swp_swap_info(folio->swap);
> >> +    int nid =3D numa_node_id();
> >> +    pg_data_t *pgdat =3D NODE_DATA(nid);
> >> +
> >> +    if (unlikely(!pgdat->kcompressd))
> >> +            return false;
> >> +
> >> +    if (!current_is_kswapd())
> >> +            return false;
> >> +
> >> +    if (!folio_test_anon(folio))
> >> +            return false;
> >> +    /*
> >> +     * This case needs to synchronously return AOP_WRITEPAGE_ACTIVATE
> >> +     */
> >> +    if (!mem_cgroup_zswap_writeback_enabled(folio_memcg(folio)))
> >> +            return false;
> >> +
> >> +    sis =3D swp_swap_info(folio->swap);
> >> +    if (zswap_is_enabled() || data_race(sis->flags & SWP_SYNCHRONOUS_=
IO)) {
> >> +            if (kfifo_avail(&pgdat->kcompress_fifo) >=3D sizeof(folio=
) &&
> >> +                    kfifo_in(&pgdat->kcompress_fifo, &folio, sizeof(f=
olio))) {
> >> +                    wake_up_interruptible(&pgdat->kcompressd_wait);
> >> +                    return true;
> >> +            }
> >> +    }
> >> +
> >> +    return false;
> >> +}
> >> +
> >>  /*
> >>   * We may have stale swap cache pages in memory: notice
> >>   * them here and get rid of the unnecessary final write.
> >> @@ -275,6 +307,15 @@ int swap_writepage(struct page *page, struct writ=
eback_control *wbc)
> >>               */
> >>              swap_zeromap_folio_clear(folio);
> >>      }
> >> +
> >> +    /*
> >> +     * Compression within zswap and zram might block rmap, unmap
> >> +     * of both file and anon pages, try to do compression async
> >> +     * if possible
> >> +     */
> >> +    if (swap_sched_async_compress(folio))
> >> +            return 0;
> >> +
> >>      if (zswap_store(folio)) {
> >>              count_mthp_stat(folio_order(folio), MTHP_STAT_ZSWPOUT);
> >>              folio_unlock(folio);
> >> @@ -289,6 +330,36 @@ int swap_writepage(struct page *page, struct writ=
eback_control *wbc)
> >>      return 0;
> >>  }
> >>
> >> +int kcompressd(void *p)
> >> +{
> >> +    pg_data_t *pgdat =3D (pg_data_t *)p;
> >> +    struct folio *folio;
> >> +    struct writeback_control wbc =3D {
> >> +            .sync_mode =3D WB_SYNC_NONE,
> >> +            .nr_to_write =3D SWAP_CLUSTER_MAX,
> >> +            .range_start =3D 0,
> >> +            .range_end =3D LLONG_MAX,
> >> +            .for_reclaim =3D 1,
> >> +    };
> >> +
> >> +    while (!kthread_should_stop()) {
> >> +            wait_event_interruptible(pgdat->kcompressd_wait,
> >> +                            !kfifo_is_empty(&pgdat->kcompress_fifo));
> >> +
> >> +            while (!kfifo_is_empty(&pgdat->kcompress_fifo)) {
> >> +                    if (kfifo_out(&pgdat->kcompress_fifo, &folio, siz=
eof(folio))) {
> >> +                            if (zswap_store(folio)) {
> >> +                                    count_mthp_stat(folio_order(folio=
), MTHP_STAT_ZSWPOUT);
> >> +                                    folio_unlock(folio);
> >> +                                    continue;
> >> +                            }
> >> +                            __swap_writepage(folio, &wbc);
> >> +                    }
> >> +            }
> >> +    }
> >> +    return 0;
> >> +}
> >> +
> >>  static inline void count_swpout_vm_event(struct folio *folio)
> >>  {
> >>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> >> diff --git a/mm/swap.h b/mm/swap.h
> >> index 6f4a3f927edb..3579da413dc2 100644
> >> --- a/mm/swap.h
> >> +++ b/mm/swap.h
> >> @@ -22,6 +22,7 @@ static inline void swap_read_unplug(struct swap_iocb=
 *plug)
> >>  void swap_write_unplug(struct swap_iocb *sio);
> >>  int swap_writepage(struct page *page, struct writeback_control *wbc);
> >>  void __swap_writepage(struct folio *folio, struct writeback_control *=
wbc);
> >> +int kcompressd(void *p);
> >>
> >>  /* linux/mm/swap_state.c */
> >>  /* One swap address space for each 64M swap space */
> >> @@ -199,6 +200,11 @@ static inline int swap_zeromap_batch(swp_entry_t =
entry, int max_nr,
> >>      return 0;
> >>  }
> >>
> >> +static inline int kcompressd(void *p)
> >> +{
> >> +    return 0;
> >> +}
> >> +
> >>  #endif /* CONFIG_SWAP */
> >>
> >>  #endif /* _MM_SWAP_H */
> >> diff --git a/mm/vmscan.c b/mm/vmscan.c
> >> index 3783e45bfc92..2d7b9167bfd6 100644
> >> --- a/mm/vmscan.c
> >> +++ b/mm/vmscan.c
> >> @@ -7420,6 +7420,7 @@ unsigned long shrink_all_memory(unsigned long nr=
_to_reclaim)
> >>  void __meminit kswapd_run(int nid)
> >>  {
> >>      pg_data_t *pgdat =3D NODE_DATA(nid);
> >> +    int ret;
> >>
> >>      pgdat_kswapd_lock(pgdat);
> >>      if (!pgdat->kswapd) {
> >> @@ -7433,7 +7434,26 @@ void __meminit kswapd_run(int nid)
> >>              } else {
> >>                      wake_up_process(pgdat->kswapd);
> >>              }
> >> +            ret =3D kfifo_alloc(&pgdat->kcompress_fifo,
> >> +                            KCOMPRESS_FIFO_SIZE * sizeof(struct folio=
 *),
> >> +                            GFP_KERNEL);
> >> +            if (ret) {
> >> +                    pr_err("%s: fail to kfifo_alloc\n", __func__);
> >> +                    goto out;
> >> +            }
> >> +
> >> +            pgdat->kcompressd =3D kthread_create_on_node(kcompressd, =
pgdat, nid,
> >> +                            "kcompressd%d", nid);
> >> +            if (IS_ERR(pgdat->kcompressd)) {
> >> +                    pr_err("Failed to start kcompressd on node %d=EF=
=BC=8Cret=3D%ld\n",
> >> +                                    nid, PTR_ERR(pgdat->kcompressd));
> >> +                    pgdat->kcompressd =3D NULL;
> >> +                    kfifo_free(&pgdat->kcompress_fifo);
> >> +            } else {
> >> +                    wake_up_process(pgdat->kcompressd);
> >> +            }
> >>      }
> >> +out:
> >>      pgdat_kswapd_unlock(pgdat);
> >>  }
> >>
> >> @@ -7452,6 +7472,11 @@ void __meminit kswapd_stop(int nid)
> >>              kthread_stop(kswapd);
> >>              pgdat->kswapd =3D NULL;
> >>      }
> >> +    if (pgdat->kcompressd) {
> >> +            kthread_stop(pgdat->kcompressd);
> >> +            pgdat->kcompressd =3D NULL;
> >> +            kfifo_free(&pgdat->kcompress_fifo);
> >> +    }
> >>      pgdat_kswapd_unlock(pgdat);
> >>  }
> >>
> >> --
> >> 2.45.2
> >>
> >>
> >
> > --
> > Cheers,
> > Harry / Hyeonggon
>
>
> --
> Best Regards,
> Yan, Zi

Thanks
Barry
