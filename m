Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873C121CFFD
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 03:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746762707; cv=none; b=E4mpttVkhwLv7znUi0kj6/lj293x7AIHNKbLKOIwU0Er+ZEngNtAQybXNCyiZro3hmO+fbVAfDjueWKkuRsD7ViUj8qo87H3B1qn8ZYjf8h6tM43UDd+1ycNtH4zfXlHaU21hwTJQIeMKGGC/yMQt05LUu+recocTefEOofsZJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746762707; c=relaxed/simple;
	bh=/rk0S+po0CpMnRGbNZnCyaDZ1IpsqAh1t7Yg4UItnTo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QMVG/0nEjpHT25TmVudwSnfr1yEtxbN1g+6kyiKpTrswZNlhigEhlNYT9r4RVgpu7NfrkWo2wRbcAqobAleOxA2G9nileDk5XwWrHXYPGrf/YM9eeoJpnk41JpvlHViIB2xAw1MjiWOToQt2IoQKzYm8Tx6lioRX+Xp6FTbGgmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dpg5SOZ7; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dpg5SOZ7"
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4c6cf5e4cd5so1486108137.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 20:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746762704; x=1747367504; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zZtJpHVIJ93K8uv3nzoIfCvHtR5OdEc9EX11A6Us4YM=;
        b=dpg5SOZ7BaRRqEOrh+nZM1gI0tZ3yFwuEWx6e9y3Uj5xtTmbNBlx4n2kALNI89ypjt
         I3QH3UQwl7iaEpm1n62ukoSfaxsjGgUJZNiJhURmmimvN4xphICUOuy9pnlLLfOy7sFH
         bQXQC+Qh3Hh47t60hrHIh4pCf6a8oUMCbJFPBR0LjfQV0LbeBqFmQlcA77dR6RLOkO/4
         qxsa9Zz/BadTvs8+Ta72Esb76uYllDcSh1tmrqaiWbZj3z196ceQAZw6nQYNPCWEpidj
         gV9UQV3E1wUbbj7/hT+7PsC/irIURBccqONYv4UR1ZvsDxtCyNmmrOt2/4QGLC/RoiWZ
         Gkxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746762704; x=1747367504;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zZtJpHVIJ93K8uv3nzoIfCvHtR5OdEc9EX11A6Us4YM=;
        b=o73QSlkEDF5YFEdei4pDt6SIbSrrHUpYlokFuMgNqC/40/AiHt1pOM6KwHHG/0bLF+
         hz51in0W+GgrYnRTjjDx8B7cL8lxQ+wjLctb2rDfWs6XC1lMztoR3uqOwhTJCV3cSZoU
         bQBarqAqcbiviLmxpsqdx6/0pm6412w9exOF/RvgzNhYzoTbE5lKx7Vj/HdJRnBnpCT+
         k1vF0uZKK1lFBOfOsMZ6FhSFRMeW0ICpcQ6GCZmfn+4sUMuNClM2j/7cgLY/Vu9aYLIL
         mb15Bsg8wyD1PiUhu8tjeMVnvcubbS6VikG1twoTFx6rG4ia3bL+ypZgFS3UFUmAeiJJ
         MwtA==
X-Forwarded-Encrypted: i=1; AJvYcCUwUEWTDXTgIbb8+uWsZYxTOhwM55087gSa54m3v+B3ZT5NQycjPNp5qaYegGBMVUQROpuqsEWHn5Eozqs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/StsJXCjSUx/NBbOX6DAlScAXbglTGs0wvKSgCQzuC1KCeDpP
	PveW571SXYtiug0XCOdYhcqGh7FJ5mquKyX1n8m2UoOJ9h/EowCp2B+MHgVLR0e/sgUIRzAZ5P5
	rqmS5ERCKcHuAibUWW8SLU/EUyHGviFLZ
X-Gm-Gg: ASbGncuG9MW4MdYT+EAOPPBY5nrAK4MpiYgktSKBkst6f3bOyY04PkYWMlVG+LSVtsK
	aFEPH0yE8EogCPQt233l2JjcR5XLVC8RboWa8RzbjIy5KgPxWbrUich7NPVOUaqHnsVVuI6Lt8P
	pZb14diMxfI0upIm6iEL5QEg==
X-Google-Smtp-Source: AGHT+IF/FZbeR1JzSQGpji4YArl8egk9e/tJo4Cdye8RmX0cu/HaSz/KiEG4E6WHjuAGaZcp6ELLuyTEOBTAEV5jUFM=
X-Received: by 2002:a05:6122:7d0:b0:529:2644:676f with SMTP id
 71dfb90a1353d-52c53dc0a0cmr2047694e0c.8.1746762693593; Thu, 08 May 2025
 20:51:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509020238.3378396-1-xiaqinxin@huawei.com> <20250509020238.3378396-4-xiaqinxin@huawei.com>
In-Reply-To: <20250509020238.3378396-4-xiaqinxin@huawei.com>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 9 May 2025 15:51:22 +1200
X-Gm-Features: AX0GCFthyNPpdDu5Qsc5jKRSeqqB30O-QqH6KuGTdMdJ0WSfXKss_x2Eew6SNcQ
Message-ID: <CAGsJ_4xOX6Rnz7nrd3ZRCzjaTzqmvWoWQNq4JzfXRhwRKkPJjw@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] dma-mapping: benchmark: add support for dma_map_sg
To: Qinxin Xia <xiaqinxin@huawei.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Robin Murphy <robin.murphy@arm.com>
Cc: yangyicong@huawei.com, hch@lst.de, iommu@lists.linux.dev, 
	jonathan.cameron@huawei.com, prime.zeng@huawei.com, fanghao11@huawei.com, 
	linux-kernel@vger.kernel.org, linuxarm@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 2:02=E2=80=AFPM Qinxin Xia <xiaqinxin@huawei.com> wr=
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

- stable@vger.kernel.org
+ Marek
+ Robin,

Once the minor issues below are addressed, feel free to add:

Reviewed-by: Barry Song <baohua@kernel.org>

> ---
>  include/linux/map_benchmark.h |  43 ++++++++++----
>  kernel/dma/map_benchmark.c    | 103 ++++++++++++++++++++++++++++++++++
>  2 files changed, 134 insertions(+), 12 deletions(-)
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

DMA_MAP_BENCH_ ...

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
> index 47a06b891db8..3a996be9fb22 100644
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
> @@ -111,8 +112,110 @@ static struct map_benchmark_ops dma_single_map_benc=
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
> +       int i;
> +
> +       struct dma_sg_map_param *params __free(kfree) =3D kzalloc(sizeof(=
*params), GFP_KERNEL);
> +       if (!params)
> +               return NULL;
> +
> +       /*
> +        * Set the number of scatterlist entries based on the granule.
> +        * In SG mode, 'granule' represents the number of scatterlist ent=
ries.
> +        * Each scatterlist entry corresponds to a single page.
> +        */
> +       params->npages =3D map->bparam.granule;
> +       params->dma_dir =3D map->bparam.dma_dir;
> +       params->dev =3D map->dev;
> +       params->buf =3D kmalloc_array(params->npages, sizeof(*params->buf=
),
> +                                   GFP_KERNEL);
> +       if (!params->buf)
> +               goto out;
> +
> +       if (sg_alloc_table(&params->sgt, params->npages, GFP_KERNEL))
> +               goto free_buf;
> +
> +       for_each_sgtable_sg(&params->sgt, sg, i) {
> +               params->buf[i] =3D (void *)__get_free_page(GFP_KERNEL);
> +               if (!params->buf[i])
> +                       goto free_page;
> +
> +               if (params->dma_dir !=3D DMA_FROM_DEVICE)
> +                       memset(params->buf[i], 0x66, PAGE_SIZE);
> +
> +               sg_set_buf(sg, params->buf[i], PAGE_SIZE);
> +       }
> +
> +       return_ptr(params);
> +
> +free_page:
> +       while (i-- > 0)
> +               free_page((unsigned long)params->buf[i]);
> +
> +       sg_free_table(&params->sgt);
> +free_buf:
> +       kfree(params->buf);
> +out:
> +       return NULL;
> +}
> +
> +static void dma_sg_map_benchmark_unprepare(void *mparam)
> +{
> +       struct dma_sg_map_param *params =3D mparam;
> +       int i;
> +
> +       for (i =3D 0; i < params->npages; i++)
> +               free_page((unsigned long)params->buf[i]);
> +
> +       sg_free_table(&params->sgt);
> +
> +       kfree(params->buf);
> +       kfree(params);
> +}
> +
> +static int dma_sg_map_benchmark_do_map(void *mparam)
> +{
> +       struct dma_sg_map_param *params =3D mparam;
> +       int ret =3D 0;
> +
> +       int sg_mapped =3D dma_map_sg(params->dev, params->sgt.sgl,
> +                                  params->npages, params->dma_dir);
> +       if (!sg_mapped) {
> +               pr_err("dma_map_sg failed on %s\n", dev_name(params->dev)=
);
> +               ret =3D -ENOMEM;
> +       }
> +
> +       return ret;
> +}
> +
> +static void dma_sg_map_benchmark_do_unmap(void *mparam)
> +{
> +       struct dma_sg_map_param *params =3D mparam;
> +
> +       dma_unmap_sg(params->dev, params->sgt.sgl, params->npages,
> +                    params->dma_dir);
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
