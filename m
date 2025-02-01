Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF78BA34
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 09:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738401717; cv=none; b=EnrRNSOfgjKNMbVq0S67OSa7QPShTa5rTOxg+ZneauNOKTdkV4N3DtLaSz3WYqwVUhBE/jU14JmqS1E8VgkdIZ/gSHWs7clRK0tImweAI0gfMTOHGJ46ZCs/LMLJLdDAs1Ie7G5j2jrDsjwW672NCZttS/jWSLU/wZhlso6W5RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738401717; c=relaxed/simple;
	bh=IKSFQPrzm5KnlgS6zFfDTiP0nejDEpYKMeq1l+oV3ns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iB+OQP3Nb++kb7OFWo15pjGQi7dV8wshO51yGihXkOcLv8MSzyhq97ao7iI8CFThdFthmHtf1OOVP6tXQqZ/6CmTJsML4CYNpvB+YV7HyB11D4isQ+kNGk0qnXx8EM8OG7gv+Rpw7xcqkKmpIpd7NNB6FIJhD193uI3Tpa4q9iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aKUj4VBw; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aKUj4VBw"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30761be8fa8so26224751fa.2
        for <linux-kernel@vger.kernel.org>; Sat, 01 Feb 2025 01:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738401712; x=1739006512; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zfx3S2dBIyfRumerX8ffl1DnCCuzv9ZN168RxmRN/LY=;
        b=aKUj4VBw+ek3sPmvZrfLmcDoZmTFlopDnRNBiZCAnYq5+onleBzDqjG/Xn4jVTI6Nw
         Jvsj6ZMNCLPvW/KIW+d3BYCujtHioY/LSKzENwgajdn7r6P0heKe3h5MiuOmDolMsDXg
         tjhRHFiWnGxJV06RZGbTDW33xPMvh4kQoHPWvcOYuDhNVkU2jsiQzJZc3nSv9CSzRa20
         Ybms5xdIpSmRK9Tdk/OZysqVwpWCzIINND249rALFyPbboF2ozMD+hri5fUYEmtTxEN3
         VhjgZz8YF6hAAGtE+KjrAHH/ALwaR47A4UubteNGXiGLlkkMTmYqNEnpvsWbWayjF5wa
         fZCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738401712; x=1739006512;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zfx3S2dBIyfRumerX8ffl1DnCCuzv9ZN168RxmRN/LY=;
        b=wM20e0xIdi3pyVlutGZkjcxbrudLs4tftDAmZkh+hi8Iu69ZA7YMYQ80zj8B220Jwl
         vTNu4dcm9xSLoWdYMcs3FubdyAx+/aALu4HpxQXqu07qs6Fkkil9mt0EVAPccbdO15Fr
         nAA3HwXyXMhWeoHiBq0MPEtHRYsc+8beaFoZBDxsRUImeyHDC8MsM04AH4iR91P1ZEW7
         mh3oKPQ+KczcqC1L41ZltYG85cRj2Hh2na1LM941e+Inn7AOQHs86uOBwcHMI57r8grP
         DD+F2aHv8tnQQLJGW5Q+7vgWqAugqKRiUpAiwMBYl9GuxHRryAMvGBc+OHa4HlStOTiN
         TMdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLT+yFyXllan6jF11zdhHCw4a8ehZbExqHdFX7p8ulZ8xyxddPTsR6eF2I/OkK3EJfSUC9SuJ9i1Vw+Kg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3ueqRWOkrWs82fc+ry48u5ViO/mZ5SgmLS5HJ1YxTtnMcRETG
	nLPJ1tLC8qpz0ItmkDZL35rBIY+70QpnrohGspR24+0ZkOC8jnvbd1K6IiAKHd3wxV5y7kFK6P5
	pw1CV/5gmCEZp8GtfhaG+/uGE0r8=
X-Gm-Gg: ASbGncvgnpSSb0GGY97F2kghrsd3FMPQciPRJQoy3FLWpWuURVdgRCyysPGG18Iy0+V
	Tw4njJg24jxZLn1pFqbWKvPTXCzMfIcDhP9F5YJDKL3CgB2BkVsBeBlHF3vRZ1keAd8CZEb9uEA
	==
X-Google-Smtp-Source: AGHT+IHhTHe02EWhJXsULCEd+AhMIELapgSMV13y4pUoGEJ0c4m6oV2uwfl6MNORV5arGrEf6FQ3xPEYhjkueljJdwI=
X-Received: by 2002:a2e:b8cb:0:b0:300:3de4:ff72 with SMTP id
 38308e7fff4ca-307968ec551mr61124941fa.27.1738401711787; Sat, 01 Feb 2025
 01:21:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250131090658.3386285-1-senozhatsky@chromium.org> <20250131090658.3386285-3-senozhatsky@chromium.org>
In-Reply-To: <20250131090658.3386285-3-senozhatsky@chromium.org>
From: Kairui Song <ryncsn@gmail.com>
Date: Sat, 1 Feb 2025 17:21:35 +0800
X-Gm-Features: AWEUYZllhQpdsad0F-KjtRxX3og_LaVLQGsbxr6aKjR7KceagBBKBSsX-k-wnEk
Message-ID: <CAMgjq7BFUrUY5Xq5Eks4ibqbWgJcca1vqB4kq=otQVyG=23FRw@mail.gmail.com>
Subject: Re: [PATCHv4 02/17] zram: do not use per-CPU compression streams
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Minchan Kim <minchan@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sergey,

On Fri, Jan 31, 2025 at 5:07=E2=80=AFPM Sergey Senozhatsky
<senozhatsky@chromium.org> wrote:
>
> Similarly to per-entry spin-lock per-CPU compression streams
> also have a number of shortcoming.
>
> First, per-CPU stream access has to be done from a non-preemptible
> (atomic) section, which imposes the same atomicity requirements on
> compression backends as entry spin-lock do and makes it impossible
> to use algorithms that can schedule/wait/sleep during compression
> and decompression.
>
> Second, per-CPU streams noticeably increase memory usage (actually
> more like wastage) of secondary compression streams.  The problem
> is that secondary compression streams are allocated per-CPU, just
> like the primary streams are.  Yet we never use more that one
> secondary stream at a time, because recompression is a single
> threaded action.  Which means that remaining num_online_cpu() - 1
> streams are allocated for nothing, and this is per-priority list
> (we can have several secondary compression algorithms).  Depending
> on the algorithm this may lead to a significant memory wastage, in
> addition each stream also carries a workmem buffer (2 physical
> pages).
>
> Instead of per-CPU streams, maintain a list of idle compression
> streams and allocate new streams on-demand (something that we
> used to do many years ago).  So that zram read() and write() become
> non-atomic and ease requirements on the compression algorithm
> implementation.  This also means that we now should have only one
> secondary stream per-priority list.
>
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
>  drivers/block/zram/zcomp.c    | 164 +++++++++++++++++++---------------
>  drivers/block/zram/zcomp.h    |  17 ++--
>  drivers/block/zram/zram_drv.c |  29 +++---
>  include/linux/cpuhotplug.h    |   1 -
>  4 files changed, 109 insertions(+), 102 deletions(-)
>
> diff --git a/drivers/block/zram/zcomp.c b/drivers/block/zram/zcomp.c
> index bb514403e305..982c769d5831 100644
> --- a/drivers/block/zram/zcomp.c
> +++ b/drivers/block/zram/zcomp.c
> @@ -6,7 +6,7 @@
>  #include <linux/slab.h>
>  #include <linux/wait.h>
>  #include <linux/sched.h>
> -#include <linux/cpu.h>
> +#include <linux/cpumask.h>
>  #include <linux/crypto.h>
>  #include <linux/vmalloc.h>
>
> @@ -43,31 +43,40 @@ static const struct zcomp_ops *backends[] =3D {
>         NULL
>  };
>
> -static void zcomp_strm_free(struct zcomp *comp, struct zcomp_strm *zstrm=
)
> +static void zcomp_strm_free(struct zcomp *comp, struct zcomp_strm *strm)
>  {
> -       comp->ops->destroy_ctx(&zstrm->ctx);
> -       vfree(zstrm->buffer);
> -       zstrm->buffer =3D NULL;
> +       comp->ops->destroy_ctx(&strm->ctx);
> +       vfree(strm->buffer);
> +       kfree(strm);
>  }
>
> -static int zcomp_strm_init(struct zcomp *comp, struct zcomp_strm *zstrm)
> +static struct zcomp_strm *zcomp_strm_alloc(struct zcomp *comp)
>  {
> +       struct zcomp_strm *strm;
>         int ret;
>
> -       ret =3D comp->ops->create_ctx(comp->params, &zstrm->ctx);
> -       if (ret)
> -               return ret;
> +       strm =3D kzalloc(sizeof(*strm), GFP_KERNEL);
> +       if (!strm)
> +               return NULL;
> +
> +       INIT_LIST_HEAD(&strm->entry);
> +
> +       ret =3D comp->ops->create_ctx(comp->params, &strm->ctx);
> +       if (ret) {
> +               kfree(strm);
> +               return NULL;
> +       }
>
>         /*
> -        * allocate 2 pages. 1 for compressed data, plus 1 extra for the
> -        * case when compressed size is larger than the original one
> +        * allocate 2 pages. 1 for compressed data, plus 1 extra in case =
if
> +        * compressed data is larger than the original one.
>          */
> -       zstrm->buffer =3D vzalloc(2 * PAGE_SIZE);
> -       if (!zstrm->buffer) {
> -               zcomp_strm_free(comp, zstrm);
> -               return -ENOMEM;
> +       strm->buffer =3D vzalloc(2 * PAGE_SIZE);
> +       if (!strm->buffer) {
> +               zcomp_strm_free(comp, strm);
> +               return NULL;
>         }
> -       return 0;
> +       return strm;
>  }
>
>  static const struct zcomp_ops *lookup_backend_ops(const char *comp)
> @@ -109,13 +118,59 @@ ssize_t zcomp_available_show(const char *comp, char=
 *buf)
>
>  struct zcomp_strm *zcomp_stream_get(struct zcomp *comp)
>  {
> -       local_lock(&comp->stream->lock);
> -       return this_cpu_ptr(comp->stream);
> +       struct zcomp_strm *strm;
> +
> +       might_sleep();
> +
> +       while (1) {
> +               spin_lock(&comp->strm_lock);
> +               if (!list_empty(&comp->idle_strm)) {
> +                       strm =3D list_first_entry(&comp->idle_strm,
> +                                               struct zcomp_strm,
> +                                               entry);
> +                       list_del(&strm->entry);
> +                       spin_unlock(&comp->strm_lock);
> +                       return strm;
> +               }
> +
> +               /* cannot allocate new stream, wait for an idle one */
> +               if (comp->avail_strm >=3D num_online_cpus()) {
> +                       spin_unlock(&comp->strm_lock);
> +                       wait_event(comp->strm_wait,
> +                                  !list_empty(&comp->idle_strm));
> +                       continue;
> +               }
> +
> +               /* allocate new stream */
> +               comp->avail_strm++;
> +               spin_unlock(&comp->strm_lock);
> +
> +               strm =3D zcomp_strm_alloc(comp);
> +               if (strm)
> +                       break;
> +
> +               spin_lock(&comp->strm_lock);
> +               comp->avail_strm--;
> +               spin_unlock(&comp->strm_lock);
> +               wait_event(comp->strm_wait, !list_empty(&comp->idle_strm)=
);
> +       }
> +
> +       return strm;
>  }
>
> -void zcomp_stream_put(struct zcomp *comp)
> +void zcomp_stream_put(struct zcomp *comp, struct zcomp_strm *strm)
>  {
> -       local_unlock(&comp->stream->lock);
> +       spin_lock(&comp->strm_lock);
> +       if (comp->avail_strm <=3D num_online_cpus()) {
> +               list_add(&strm->entry, &comp->idle_strm);
> +               spin_unlock(&comp->strm_lock);
> +               wake_up(&comp->strm_wait);
> +               return;
> +       }
> +
> +       comp->avail_strm--;
> +       spin_unlock(&comp->strm_lock);
> +       zcomp_strm_free(comp, strm);
>  }
>
>  int zcomp_compress(struct zcomp *comp, struct zcomp_strm *zstrm,
> @@ -148,61 +203,19 @@ int zcomp_decompress(struct zcomp *comp, struct zco=
mp_strm *zstrm,
>         return comp->ops->decompress(comp->params, &zstrm->ctx, &req);
>  }
>
> -int zcomp_cpu_up_prepare(unsigned int cpu, struct hlist_node *node)
> -{
> -       struct zcomp *comp =3D hlist_entry(node, struct zcomp, node);
> -       struct zcomp_strm *zstrm;
> -       int ret;
> -
> -       zstrm =3D per_cpu_ptr(comp->stream, cpu);
> -       local_lock_init(&zstrm->lock);
> -
> -       ret =3D zcomp_strm_init(comp, zstrm);
> -       if (ret)
> -               pr_err("Can't allocate a compression stream\n");
> -       return ret;
> -}
> -
> -int zcomp_cpu_dead(unsigned int cpu, struct hlist_node *node)
> -{
> -       struct zcomp *comp =3D hlist_entry(node, struct zcomp, node);
> -       struct zcomp_strm *zstrm;
> -
> -       zstrm =3D per_cpu_ptr(comp->stream, cpu);
> -       zcomp_strm_free(comp, zstrm);
> -       return 0;
> -}
> -
> -static int zcomp_init(struct zcomp *comp, struct zcomp_params *params)
> -{
> -       int ret;
> -
> -       comp->stream =3D alloc_percpu(struct zcomp_strm);
> -       if (!comp->stream)
> -               return -ENOMEM;
> -
> -       comp->params =3D params;
> -       ret =3D comp->ops->setup_params(comp->params);
> -       if (ret)
> -               goto cleanup;
> -
> -       ret =3D cpuhp_state_add_instance(CPUHP_ZCOMP_PREPARE, &comp->node=
);
> -       if (ret < 0)
> -               goto cleanup;
> -
> -       return 0;
> -
> -cleanup:
> -       comp->ops->release_params(comp->params);
> -       free_percpu(comp->stream);
> -       return ret;
> -}
> -
>  void zcomp_destroy(struct zcomp *comp)
>  {
> -       cpuhp_state_remove_instance(CPUHP_ZCOMP_PREPARE, &comp->node);
> +       struct zcomp_strm *strm;
> +
> +       while (!list_empty(&comp->idle_strm)) {
> +               strm =3D list_first_entry(&comp->idle_strm,
> +                                       struct zcomp_strm,
> +                                       entry);
> +               list_del(&strm->entry);
> +               zcomp_strm_free(comp, strm);
> +       }
> +
>         comp->ops->release_params(comp->params);
> -       free_percpu(comp->stream);
>         kfree(comp);
>  }
>
> @@ -229,7 +242,12 @@ struct zcomp *zcomp_create(const char *alg, struct z=
comp_params *params)
>                 return ERR_PTR(-EINVAL);
>         }
>
> -       error =3D zcomp_init(comp, params);
> +       INIT_LIST_HEAD(&comp->idle_strm);
> +       init_waitqueue_head(&comp->strm_wait);
> +       spin_lock_init(&comp->strm_lock);
> +
> +       comp->params =3D params;
> +       error =3D comp->ops->setup_params(comp->params);
>         if (error) {
>                 kfree(comp);
>                 return ERR_PTR(error);
> diff --git a/drivers/block/zram/zcomp.h b/drivers/block/zram/zcomp.h
> index ad5762813842..62330829db3f 100644
> --- a/drivers/block/zram/zcomp.h
> +++ b/drivers/block/zram/zcomp.h
> @@ -3,10 +3,10 @@
>  #ifndef _ZCOMP_H_
>  #define _ZCOMP_H_
>
> -#include <linux/local_lock.h>
> -
>  #define ZCOMP_PARAM_NO_LEVEL   INT_MIN
>
> +#include <linux/wait.h>
> +
>  /*
>   * Immutable driver (backend) parameters. The driver may attach private
>   * data to it (e.g. driver representation of the dictionary, etc.).
> @@ -31,7 +31,7 @@ struct zcomp_ctx {
>  };
>
>  struct zcomp_strm {
> -       local_lock_t lock;
> +       struct list_head entry;
>         /* compression buffer */
>         void *buffer;
>         struct zcomp_ctx ctx;
> @@ -60,16 +60,15 @@ struct zcomp_ops {
>         const char *name;
>  };
>
> -/* dynamic per-device compression frontend */
>  struct zcomp {
> -       struct zcomp_strm __percpu *stream;
> +       struct list_head idle_strm;
> +       spinlock_t strm_lock;
> +       u32 avail_strm;
> +       wait_queue_head_t strm_wait;
>         const struct zcomp_ops *ops;
>         struct zcomp_params *params;
> -       struct hlist_node node;
>  };
>
> -int zcomp_cpu_up_prepare(unsigned int cpu, struct hlist_node *node);
> -int zcomp_cpu_dead(unsigned int cpu, struct hlist_node *node);
>  ssize_t zcomp_available_show(const char *comp, char *buf);
>  bool zcomp_available_algorithm(const char *comp);
>
> @@ -77,7 +76,7 @@ struct zcomp *zcomp_create(const char *alg, struct zcom=
p_params *params);
>  void zcomp_destroy(struct zcomp *comp);
>
>  struct zcomp_strm *zcomp_stream_get(struct zcomp *comp);
> -void zcomp_stream_put(struct zcomp *comp);
> +void zcomp_stream_put(struct zcomp *comp, struct zcomp_strm *strm);
>
>  int zcomp_compress(struct zcomp *comp, struct zcomp_strm *zstrm,
>                    const void *src, unsigned int *dst_len);
> diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.=
c
> index 1c2df2341704..8d5974ea8ff8 100644
> --- a/drivers/block/zram/zram_drv.c
> +++ b/drivers/block/zram/zram_drv.c
> @@ -31,7 +31,6 @@
>  #include <linux/idr.h>
>  #include <linux/sysfs.h>
>  #include <linux/debugfs.h>
> -#include <linux/cpuhotplug.h>
>  #include <linux/part_stat.h>
>  #include <linux/kernel_read_file.h>
>
> @@ -1601,7 +1600,7 @@ static int read_compressed_page(struct zram *zram, =
struct page *page, u32 index)
>         ret =3D zcomp_decompress(zram->comps[prio], zstrm, src, size, dst=
);
>         kunmap_local(dst);
>         zs_unmap_object(zram->mem_pool, handle);
> -       zcomp_stream_put(zram->comps[prio]);
> +       zcomp_stream_put(zram->comps[prio], zstrm);
>
>         return ret;
>  }
> @@ -1762,14 +1761,14 @@ static int zram_write_page(struct zram *zram, str=
uct page *page, u32 index)
>         kunmap_local(mem);
>
>         if (unlikely(ret)) {
> -               zcomp_stream_put(zram->comps[ZRAM_PRIMARY_COMP]);
> +               zcomp_stream_put(zram->comps[ZRAM_PRIMARY_COMP], zstrm);
>                 pr_err("Compression failed! err=3D%d\n", ret);
>                 zs_free(zram->mem_pool, handle);
>                 return ret;
>         }
>
>         if (comp_len >=3D huge_class_size) {
> -               zcomp_stream_put(zram->comps[ZRAM_PRIMARY_COMP]);
> +               zcomp_stream_put(zram->comps[ZRAM_PRIMARY_COMP], zstrm);
>                 return write_incompressible_page(zram, page, index);
>         }
>
> @@ -1793,7 +1792,7 @@ static int zram_write_page(struct zram *zram, struc=
t page *page, u32 index)
>                                    __GFP_HIGHMEM |
>                                    __GFP_MOVABLE);
>         if (IS_ERR_VALUE(handle)) {
> -               zcomp_stream_put(zram->comps[ZRAM_PRIMARY_COMP]);
> +               zcomp_stream_put(zram->comps[ZRAM_PRIMARY_COMP], zstrm);
>                 atomic64_inc(&zram->stats.writestall);
>                 handle =3D zs_malloc(zram->mem_pool, comp_len,
>                                    GFP_NOIO | __GFP_HIGHMEM |
> @@ -1805,7 +1804,7 @@ static int zram_write_page(struct zram *zram, struc=
t page *page, u32 index)
>         }
>
>         if (!zram_can_store_page(zram)) {
> -               zcomp_stream_put(zram->comps[ZRAM_PRIMARY_COMP]);
> +               zcomp_stream_put(zram->comps[ZRAM_PRIMARY_COMP], zstrm);
>                 zs_free(zram->mem_pool, handle);
>                 return -ENOMEM;
>         }
> @@ -1813,7 +1812,7 @@ static int zram_write_page(struct zram *zram, struc=
t page *page, u32 index)
>         dst =3D zs_map_object(zram->mem_pool, handle, ZS_MM_WO);
>
>         memcpy(dst, zstrm->buffer, comp_len);
> -       zcomp_stream_put(zram->comps[ZRAM_PRIMARY_COMP]);
> +       zcomp_stream_put(zram->comps[ZRAM_PRIMARY_COMP], zstrm);
>         zs_unmap_object(zram->mem_pool, handle);
>
>         zram_slot_write_lock(zram, index);
> @@ -1972,7 +1971,7 @@ static int recompress_slot(struct zram *zram, u32 i=
ndex, struct page *page,
>                 kunmap_local(src);
>
>                 if (ret) {
> -                       zcomp_stream_put(zram->comps[prio]);
> +                       zcomp_stream_put(zram->comps[prio], zstrm);
>                         return ret;
>                 }
>
> @@ -1982,7 +1981,7 @@ static int recompress_slot(struct zram *zram, u32 i=
ndex, struct page *page,
>                 /* Continue until we make progress */
>                 if (class_index_new >=3D class_index_old ||
>                     (threshold && comp_len_new >=3D threshold)) {
> -                       zcomp_stream_put(zram->comps[prio]);
> +                       zcomp_stream_put(zram->comps[prio], zstrm);
>                         continue;
>                 }
>
> @@ -2040,13 +2039,13 @@ static int recompress_slot(struct zram *zram, u32=
 index, struct page *page,
>                                __GFP_HIGHMEM |
>                                __GFP_MOVABLE);
>         if (IS_ERR_VALUE(handle_new)) {
> -               zcomp_stream_put(zram->comps[prio]);
> +               zcomp_stream_put(zram->comps[prio], zstrm);
>                 return PTR_ERR((void *)handle_new);
>         }
>
>         dst =3D zs_map_object(zram->mem_pool, handle_new, ZS_MM_WO);
>         memcpy(dst, zstrm->buffer, comp_len_new);
> -       zcomp_stream_put(zram->comps[prio]);
> +       zcomp_stream_put(zram->comps[prio], zstrm);
>
>         zs_unmap_object(zram->mem_pool, handle_new);
>
> @@ -2794,7 +2793,6 @@ static void destroy_devices(void)
>         zram_debugfs_destroy();
>         idr_destroy(&zram_index_idr);
>         unregister_blkdev(zram_major, "zram");
> -       cpuhp_remove_multi_state(CPUHP_ZCOMP_PREPARE);
>  }
>
>  static int __init zram_init(void)
> @@ -2804,15 +2802,9 @@ static int __init zram_init(void)
>
>         BUILD_BUG_ON(__NR_ZRAM_PAGEFLAGS > sizeof(zram_te.flags) * 8);
>
> -       ret =3D cpuhp_setup_state_multi(CPUHP_ZCOMP_PREPARE, "block/zram:=
prepare",
> -                                     zcomp_cpu_up_prepare, zcomp_cpu_dea=
d);
> -       if (ret < 0)
> -               return ret;
> -
>         ret =3D class_register(&zram_control_class);
>         if (ret) {
>                 pr_err("Unable to register zram-control class\n");
> -               cpuhp_remove_multi_state(CPUHP_ZCOMP_PREPARE);
>                 return ret;
>         }
>
> @@ -2821,7 +2813,6 @@ static int __init zram_init(void)
>         if (zram_major <=3D 0) {
>                 pr_err("Unable to get major number\n");
>                 class_unregister(&zram_control_class);
> -               cpuhp_remove_multi_state(CPUHP_ZCOMP_PREPARE);
>                 return -EBUSY;
>         }
>
> diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
> index 6cc5e484547c..092ace7db8ee 100644
> --- a/include/linux/cpuhotplug.h
> +++ b/include/linux/cpuhotplug.h
> @@ -119,7 +119,6 @@ enum cpuhp_state {
>         CPUHP_MM_ZS_PREPARE,
>         CPUHP_MM_ZSWP_POOL_PREPARE,
>         CPUHP_KVM_PPC_BOOK3S_PREPARE,
> -       CPUHP_ZCOMP_PREPARE,
>         CPUHP_TIMERS_PREPARE,
>         CPUHP_TMIGR_PREPARE,
>         CPUHP_MIPS_SOC_PREPARE,
> --
> 2.48.1.362.g079036d154-goog

This seems will cause a huge regression of performance on multi core
systems, this is especially significant as the number of concurrent
tasks increases:

Test build linux kernel using ZRAM as SWAP (1G memcg):

Before:
+ /usr/bin/time make -s -j48
2495.77user 2604.77system 2:12.95elapsed 3836%CPU (0avgtext+0avgdata
863304maxresident)k

After:
+ /usr/bin/time make -s -j48
2403.60user 6676.09system 3:38.22elapsed 4160%CPU (0avgtext+0avgdata
863276maxresident)k

`perf lock contention -ab sleep 3` also indicates the big spin lock in
zcomp_stream_get/put is having significant contention:
contended   total wait     max wait     avg wait         type   caller

    793357     28.71 s       2.66 ms     36.19 us     spinlock
zcomp_stream_get+0x37
    793170     28.60 s       2.65 ms     36.06 us     spinlock
zcomp_stream_put+0x1f
    444007     15.26 s       2.58 ms     34.37 us     spinlock
zcomp_stream_put+0x1f
    443960     15.21 s       2.68 ms     34.25 us     spinlock
zcomp_stream_get+0x37
      5516    152.50 ms      3.30 ms     27.65 us     spinlock
evict_folios+0x7e
      4523    137.47 ms      3.66 ms     30.39 us     spinlock
folio_lruvec_lock_irqsave+0xc3
      4253    108.93 ms      2.92 ms     25.61 us     spinlock
folio_lruvec_lock_irqsave+0xc3
     49294     71.73 ms     15.87 us      1.46 us     spinlock
list_lru_del+0x7c
      2327     51.35 ms      3.48 ms     22.07 us     spinlock
evict_folios+0x5c0
