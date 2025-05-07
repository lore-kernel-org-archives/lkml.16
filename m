Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F416C1940A1
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 02:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746585565; cv=none; b=mXVyRTaF5Q/e38xET3SfoBsKVcV7MDGFXsIVX0lsIbqA7KJYUsqTWAiBf8qMBq3xH7ShlU6iOjYo8zrYqRQH+nn3sT68z1B09Z2g0pWccOHhVanb+sXlqHGUV5LwXya1e7sbaYQrF0nCN6xkPjpJbSfocIwSKWjl7ryAHvcez3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746585565; c=relaxed/simple;
	bh=AB6axM5YviGmQu+aK72+sPdzfV0gkW5k1I+CmPGnigo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qUuIy+xW7uGJVJTIdRvK8RJkjnzBLQuuW387R1N/v3hO0FolvvaoK3t8I/Q/eHcd1ax0JLFYH2/K3R3lRtM6k7KzdBNL59V9itlZS1me4snYHLU/mlqS6Qi2K4VppNKhBa/BPGgMRsDvaz8PO/gP4Pd6L1IkDQom5Zth5svxoAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HAdnRi3y; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HAdnRi3y"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-527a2b89a11so1997747e0c.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 19:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746585562; x=1747190362; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2wkWd3mpSwgn/ORyZrrLqXyFRvmqvQMNecHp4igLlJs=;
        b=HAdnRi3y181eLRaqcu6fUE7uFRnu3IGjjr4Xplz/DvRG7x776wE2y05BNyDITffMzO
         V34s3xdW+AhJ07/nUHS/01d8MwN3ovpdteDQm753+sMgcASAZhtgdUj1b7Bts2AyMv88
         IhL/Da1uQCLm3UeOArAN63eQocM+R4no+LaRs6lH50ogoY02XQXAOPrCSTkVlD1CQDek
         qFv2r3VnbEkeVpDxUel7QiWY8pxislRzX0riXVaV0kvUlduJIj99o+Kth+jr3CoYkqQi
         u3OP96gnD03bQheS0fdF7IqXwILyiGrrlifY9mzpilKL7MMvQBVWgtNmKGSqm2XJHs1V
         rJmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746585562; x=1747190362;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2wkWd3mpSwgn/ORyZrrLqXyFRvmqvQMNecHp4igLlJs=;
        b=SY90zmbf3ZcR9M057dxpeiLqc8aZWPlMxTjLHY3pJVpl7DeUmqqdi2EiCkxCYQjohs
         qzEW6mCLR1KZAayT6Bs9U0seSHzPQKRqsg1o5WvLgmqQ77gQIMgbnXuWkUF7vhOK5q0h
         9/SqV00ikHCmq2yBBtutJOJg3NCxFXfNk/L98k70gGLCRcSELcqBVly37ieudHRJc8fA
         O8rCcdJ8RG6IGvSEgswzrKVrKALz2j1UZySArSuthPU+jArqaSB4Cvwnl/ifqfQFGS/L
         kdiEa6wgpRMH0wxXHRf3qSZe+69BuRxZCU78Z0CIXchDdXt6MuxbtYekucCLcuasFx4B
         5kyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDJ7nJ+4y3JFh0Bo6tTbMLjYjDy0xDivETdcjdoa0X2Kxye2DFj9XHgbgAZCnlFMLWthAgRknd2r2gQw8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyErRw+FBkmQo80XTi5SW1yAtUWmnqI0WZZmxdsJwzozBftpf8q
	3HwlxHxls7zDD+Tl25kjOX7aWfdulA/RnxXybn2Pd+WdP4ZggaYbQe/KDcnfBOpZDbJk29a7AAU
	UKE84VmEILgxIjl12ebNActBpW0k=
X-Gm-Gg: ASbGncs2kOmG5X89Up6TSeWvEOujgPgNPfqsXoMHfQTbFFSRLj3z8U+sxUzgV2GquZC
	1AeiCQ5UcsiIBKspImIArjkOoAG8Sa3bMJ9BujJzkBxmXrbBtLbn9NbhaGcHl3NgTuelW9woE85
	sIdP0T5G8HTNel+Luj0ELELw==
X-Google-Smtp-Source: AGHT+IF/XkOY4GQjpYCXPl+LezdUBEVxkKD2rbgN+/2Nf1zDxVzejnDRAwgAZ3WRWd49g/ubLvrnsObAmcdM0hxH+n0=
X-Received: by 2002:a05:6102:4a87:b0:4db:e6f:9c99 with SMTP id
 ada2fe7eead31-4dc73790663mr1599807137.1.1746585561769; Tue, 06 May 2025
 19:39:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506030100.394376-1-xiaqinxin@huawei.com> <20250506030100.394376-4-xiaqinxin@huawei.com>
In-Reply-To: <20250506030100.394376-4-xiaqinxin@huawei.com>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 7 May 2025 14:39:10 +1200
X-Gm-Features: ATxdqUHz28oD3DpDcOYv89LGKjbYslfcFAHjeX8XOE2R7jR6z84CkVGv7ZsG958
Message-ID: <CAGsJ_4zBHVwc3A67Wff3u0aypuPv6h25B_YdDqG5j9FmBOXn8g@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] dma-mapping: benchmark: add support for dma_map_sg
To: Qinxin Xia <xiaqinxin@huawei.com>
Cc: yangyicong@huawei.com, hch@lst.de, iommu@lists.linux.dev, 
	jonathan.cameron@huawei.com, prime.zeng@huawei.com, fanghao11@huawei.com, 
	linux-kernel@vger.kernel.org, linuxarm@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 3:01=E2=80=AFPM Qinxin Xia <xiaqinxin@huawei.com> wr=
ote:
>
> Support for dma scatter-gather mapping and is intended for testing
> mapping performance. It achieves by introducing the dma_sg_map_param
> structure and related functions, which enable the implementation of
> scatter-gather mapping preparation, mapping, and unmapping operations.
> Additionally, the dma_map_benchmark_ops array is updated to include
> operations for scatter-gather mapping. This commit aims to provide
> a wider range of mapping performance test to cater to different scenarios=
.
>
> Signed-off-by: Qinxin Xia <xiaqinxin@huawei.com>
> ---
>  include/linux/map_benchmark.h |  43 ++++++++++----
>  kernel/dma/map_benchmark.c    | 102 ++++++++++++++++++++++++++++++++++
>  2 files changed, 133 insertions(+), 12 deletions(-)
>
> diff --git a/include/linux/map_benchmark.h b/include/linux/map_benchmark.=
h
> index 5294dfd1870f..bf8c9ade43fd 100644
> --- a/include/linux/map_benchmark.h
> +++ b/include/linux/map_benchmark.h
> @@ -17,22 +17,41 @@
>
>  enum {
>         DMA_MAP_SINGLE_MODE,
> +       DMA_MAP_SG_MODE,
>         DMA_MAP_MODE_MAX
>  };
>
> +/**
> + * struct map_benchmark - Benchmarking data for DMA mapping operations.
> + * @avg_map_100ns: Average map latency in 100ns.
> + * @map_stddev: Standard deviation of map latency.
> + * @avg_unmap_100ns: Average unmap latency in 100ns.
> + * @unmap_stddev: Standard deviation of unmap latency.
> + * @threads: Number of threads performing map/unmap operations in parall=
el.
> + * @seconds: Duration of the test in seconds.
> + * @node: NUMA node on which this benchmark will run.
> + * @dma_bits: DMA addressing capability.
> + * @dma_dir: DMA data direction.
> + * @dma_trans_ns: Time for DMA transmission in ns.
> + * @granule: Number of PAGE_SIZE units to map/unmap at once.
> +            In SG mode, this represents the number of scatterlist entrie=
s.
> +            In single mode, this represents the total size of the mappin=
g.
> + * @map_mode: Mode of DMA mapping.
> + * @expansion: Reserved for future use.
> + */
>  struct map_benchmark {
> -       __u64 avg_map_100ns; /* average map latency in 100ns */
> -       __u64 map_stddev; /* standard deviation of map latency */
> -       __u64 avg_unmap_100ns; /* as above */
> +       __u64 avg_map_100ns;
> +       __u64 map_stddev;
> +       __u64 avg_unmap_100ns;
>         __u64 unmap_stddev;
> -       __u32 threads; /* how many threads will do map/unmap in parallel =
*/
> -       __u32 seconds; /* how long the test will last */
> -       __s32 node; /* which numa node this benchmark will run on */
> -       __u32 dma_bits; /* DMA addressing capability */
> -       __u32 dma_dir; /* DMA data direction */
> -       __u32 dma_trans_ns; /* time for DMA transmission in ns */
> -       __u32 granule;  /* how many PAGE_SIZE will do map/unmap once a ti=
me */
> -       __u8  map_mode; /* the mode of dma map */
> -       __u8 expansion[75];     /* For future use */
> +       __u32 threads;
> +       __u32 seconds;
> +       __s32 node;
> +       __u32 dma_bits;
> +       __u32 dma_dir;
> +       __u32 dma_trans_ns;
> +       __u32 granule;
> +       __u8  map_mode;
> +       __u8 expansion[75];
>  };
>  #endif /* _KERNEL_DMA_BENCHMARK_H */
> diff --git a/kernel/dma/map_benchmark.c b/kernel/dma/map_benchmark.c
> index f04973eba1d8..72cd2c5f839e 100644
> --- a/kernel/dma/map_benchmark.c
> +++ b/kernel/dma/map_benchmark.c
> @@ -17,6 +17,7 @@
>  #include <linux/module.h>
>  #include <linux/pci.h>
>  #include <linux/platform_device.h>
> +#include <linux/scatterlist.h>
>  #include <linux/slab.h>
>  #include <linux/timekeeping.h>
>
> @@ -110,8 +111,109 @@ static struct map_benchmark_ops dma_single_map_benc=
hmark_ops =3D {
>         .do_unmap =3D dma_single_map_benchmark_do_unmap,
>  };
>
> +struct dma_sg_map_param {
> +       struct sg_table sgt;
> +       struct device *dev;
> +       void **buf;
> +       u32 npages;
> +       u32 dma_dir;
> +};
> +
> +static void *dma_sg_map_benchmark_prepare(struct map_benchmark_data *map=
)
> +{
> +       struct scatterlist *sg;
> +       int i =3D 0;

I'm not sure we need `i =3D 0`; perhaps just `int i` would be sufficient.

> +
> +       struct dma_sg_map_param *mparam __free(kfree) =3D kzalloc(sizeof(=
*mparam), GFP_KERNEL);
> +       if (!mparam)
> +               return NULL;
> +
> +       /*
> +        * Set the number of scatterlist entries based on the granule.
> +        * In SG mode, 'granule' represents the number of scatterlist ent=
ries.
> +        * Each scatterlist entry corresponds to a single page.
> +        */
> +       mparam->npages =3D map->bparam.granule;
> +       mparam->dma_dir =3D map->bparam.dma_dir;
> +       mparam->dev =3D map->dev;
> +       mparam->buf =3D kmalloc_array(mparam->npages, sizeof(*mparam->buf=
),
> +                                   GFP_KERNEL);
> +       if (!mparam->buf)
> +               goto out;
> +
> +       if (sg_alloc_table(&mparam->sgt, mparam->npages, GFP_KERNEL))
> +               goto free_buf;
> +
> +       for_each_sgtable_sg(&mparam->sgt, sg, i) {
> +               mparam->buf[i] =3D (void *)__get_free_page(GFP_KERNEL);
> +               if (!mparam->buf[i])
> +                       goto free_page;
> +
> +               if (mparam->dma_dir !=3D DMA_FROM_DEVICE)
> +                       memset(mparam->buf[i], 0x66, PAGE_SIZE);
> +
> +               sg_set_buf(sg, mparam->buf[i], PAGE_SIZE);
> +       }
> +
> +       return_ptr(mparam);
> +
> +free_page:
> +       while (i-- > 0)
> +               free_page((unsigned long)mparam->buf[i]);
> +
> +       sg_free_table(&mparam->sgt);
> +free_buf:
> +       kfree(mparam->buf);
> +out:
> +       return NULL;
> +}
> +
> +static void dma_sg_map_benchmark_unprepare(void *arg)

The term "arg" is meaningless for a function argument, as it's already impl=
ied
that it is an argument.

> +{
> +       struct dma_sg_map_param *mparam =3D arg;
> +       int i;
> +
> +       for (i =3D 0; i < mparam->npages; i++)
> +               free_page((unsigned long)mparam->buf[i]);
> +
> +       sg_free_table(&mparam->sgt);
> +
> +       kfree(mparam->buf);
> +       kfree(mparam);
> +}
> +
> +static int dma_sg_map_benchmark_do_map(void *arg)
> +{
> +       struct dma_sg_map_param *mparam =3D arg;
> +
> +       int sg_mapped =3D dma_map_sg(mparam->dev, mparam->sgt.sgl,
> +                                  mparam->npages, mparam->dma_dir);

int ret.

> +       if (!sg_mapped) {
> +               pr_err("dma_map_sg failed on %s\n", dev_name(mparam->dev)=
);
> +               return -ENOMEM;
> +       }
> +
> +       return 0;
> +}
> +
> +static void dma_sg_map_benchmark_do_unmap(void *arg)
> +{
> +       struct dma_sg_map_param *mparam =3D arg;
> +
> +       dma_unmap_sg(mparam->dev, mparam->sgt.sgl, mparam->npages,
> +                    mparam->dma_dir);
> +}
> +
> +static struct map_benchmark_ops dma_sg_map_benchmark_ops =3D {
> +       .prepare =3D dma_sg_map_benchmark_prepare,
> +       .unprepare =3D dma_sg_map_benchmark_unprepare,
> +       .do_map =3D dma_sg_map_benchmark_do_map,
> +       .do_unmap =3D dma_sg_map_benchmark_do_unmap,
> +};
> +
>  static struct map_benchmark_ops *dma_map_benchmark_ops[DMA_MAP_MODE_MAX]=
 =3D {
>         [DMA_MAP_SINGLE_MODE] =3D &dma_single_map_benchmark_ops,
> +       [DMA_MAP_SG_MODE] =3D &dma_sg_map_benchmark_ops,
>  };
>
>  static int map_benchmark_thread(void *data)
> --
> 2.33.0
>

Thanks
barry
