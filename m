Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53362223308
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 05:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744003725; cv=none; b=Iz8RovC091Ko9REfw7h+gnO7ddqs8PkQSMQFN9QRmmYzfMaLAX8ixPdIIh71XLwBIzPfjaary0174V039Ze8N2s1L7lnJjgx0UuJ5sXF1Jc2de1cXI0zXID8B24ngysmHnKGyd5itRe/IIytGmZhRYN+XxAWjMlPYGbzvPoYxaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744003725; c=relaxed/simple;
	bh=IR7C8mWGn6S2GwS5npntqj5mc2LFd0mWoZA5VQoPwVs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eui8Fm9YypProYY4vRIsOPzRMzpVxB25ZzN6C1GrxSYYbGJyMmyAx5l+AXV955BhMeaqiXFpo5Wqv/zWF5fR5+UC1fGPOVQ+HcpN0IAO/0JklhqsHCaszJT8njiGpPoZosbKdWdch0JLb8lYYH7ha908tmpBCUiaaocieG1jiR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lpWrziAn; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lpWrziAn"
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-524168b16d3so3741537e0c.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 22:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744003722; x=1744608522; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2m8hkxeQTQAuQicQo0vunu7LYBkQ6hLqfs4neelB+bE=;
        b=lpWrziAnqJb+ssw76Yj6S9lzQLosM1PFTGja0upyFJdZiXffC7T+JwGgOqbuk2Mayk
         HecnC4tQ6IYagMNnTURmLOG2dZ3+ELjqsWcwzS5OIWwzkZC8FT16ZOunVO5pLNAMhFYZ
         KqKgPu45ynhTXxciluRXnAwEsgXL3S1jIHU7gEJZOkArSlAuQcqxW42ELzCZ9TTJFSye
         EkwPPpwybxyg9W8c88G/t0KI9O/nXMa/kdUIUqFUkxv0AbhYm34S3QSsko75RFipt4WD
         mVXY66T+SYAa2H1dgYZ5XZOwGfI0uTf85TqSTmD9PAK0gmI7MiQCyPXNUFy9xTUFWQE1
         x3JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744003722; x=1744608522;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2m8hkxeQTQAuQicQo0vunu7LYBkQ6hLqfs4neelB+bE=;
        b=QppxbD4CM8+6bit+zgB8gZqQRSnInuFIaMbAsh3mh2Lz0EqHwtkCSaJY4FB15TyRA0
         TRLPar0oaPYkeyvoyo7IOfQghQDXQcU5mZie4qMlcvgGeVXnjEZNNqwzuIY5dEO1Qors
         8bNad0rie5yBolEeWoEwN7OFTJQbH1bhnUfRzQSsuxu++nQmNVROd2HxTkkthMLeq/x4
         KhE06cOhNV6H6yqqWYp3OnwQNP2bcy7a19ekDjrjbj3ez/kse+JbZu2sERzB/AyuwRme
         bj0bgfUZx6A0NuD3eDz+VVoIRqoS2TFQ+Mkec9kCbFRa0ADVv9qJ5KUezpS9/ftUXATL
         wCMQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1PQBxcjfbCXJYLeLl+qLkTMs4sOt4RPUx60ZVfxWxcm7sfRvI2PONMgv8MvTqdduEd8ngWUa85gh0P34=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIAan1zym3wEGJmLqw1NkJZ/e0K0jF6gV+Dl9DQUGL+Cg7Q6e4
	1jhazAC+wFfi3hP71ny6s2/e0KftZpwmNCpaUNigAHxBEN1fRaCv8F4mEyFNAQg7FSkdTMc3eWG
	KxeVXYmNGIbDp0bgxfGLo67jY7YPU1MY657I=
X-Gm-Gg: ASbGncvu0iZmi3kf2Caicu1zxNRAshNU+uUSSrd/rIi37UtIIjjYogFgBRugIxAE9bZ
	RR8UDCNg+XMApljD/yg+OKsvCWbAFYLMTQ/CTdi7THUFbutCKxXcLt+oBShJGdJaYcGn51nbHI0
	pNMi8RSYJt2T6cyHbh1jqyoNrw4A==
X-Google-Smtp-Source: AGHT+IF/sC4/sanFSEJjcv9X4aJhwSGKXxAZmUIblLo17jeh8YiTvqYY3jy/3OlZXXpCdGm9dYoUzQjtMHRu5rIAghQ=
X-Received: by 2002:a05:6102:3f05:b0:4bb:e8c5:b162 with SMTP id
 ada2fe7eead31-4c8568e4188mr8158608137.10.1744003721979; Sun, 06 Apr 2025
 22:28:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250212022718.1995504-1-xiaqinxin@huawei.com> <20250212022718.1995504-2-xiaqinxin@huawei.com>
In-Reply-To: <20250212022718.1995504-2-xiaqinxin@huawei.com>
From: Barry Song <21cnbao@gmail.com>
Date: Mon, 7 Apr 2025 17:28:31 +1200
X-Gm-Features: ATxdqUG6XXZmLjmCcNcJ79x8athR9dBwmbL9emzES-cCl5PPW5_OVcEJv4TMzvg
Message-ID: <CAGsJ_4waiZ2+NBJG+SCnbNk+nQ_ZF13_Q5FHJqZyxyJTcEop2A@mail.gmail.com>
Subject: Re: [PATCH 1/3] dma mapping benchmark: modify the framework to adapt
 to more map modes
To: Qinxin Xia <xiaqinxin@huawei.com>
Cc: chenxiang66@hisilicon.com, yangyicong@huawei.com, hch@lst.de, 
	iommu@lists.linux.dev, jonathan.cameron@huawei.com, prime.zeng@huawei.com, 
	fanghao11@huawei.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 12, 2025 at 3:27=E2=80=AFPM Qinxin Xia <xiaqinxin@huawei.com> w=
rote:
>
> In this patch map_benchmark abstract in four interface: prepare, unprepar=
e,
> do_map, do_unmap. When there's a new mode to add, need four steps:
> 1) Add the mode in map_benchmark.h
>
> 2) Defines the mode param, like struct dma_xxx_map_param, and this object
>    will be return in prepare and as input parameter in other ops;
>
> 3) Defines the ops functions:prepare, unprepare, do_map, do_unmap.
>
> 4) Add the new mode in dma_map_benchmark_ops.
>
> Signed-off-by: Qinxin Xia <xiaqinxin@huawei.com>
> ---
>  include/linux/map_benchmark.h |   6 ++
>  kernel/dma/map_benchmark.c    | 122 +++++++++++++++++++++++++++-------
>  2 files changed, 105 insertions(+), 23 deletions(-)
>
> diff --git a/include/linux/map_benchmark.h b/include/linux/map_benchmark.=
h
> index 62674c83bde4..054db02a03a7 100644
> --- a/include/linux/map_benchmark.h
> +++ b/include/linux/map_benchmark.h
> @@ -15,6 +15,11 @@
>  #define DMA_MAP_TO_DEVICE       1
>  #define DMA_MAP_FROM_DEVICE     2
>
> +enum {
> +       DMA_MAP_SINGLE_MODE,
> +       DMA_MAP_MODE_MAX
> +};
> +
>  struct map_benchmark {
>         __u64 avg_map_100ns; /* average map latency in 100ns */
>         __u64 map_stddev; /* standard deviation of map latency */
> @@ -27,5 +32,6 @@ struct map_benchmark {
>         __u32 dma_dir; /* DMA data direction */
>         __u32 dma_trans_ns; /* time for DMA transmission in ns */
>         __u32 granule;  /* how many PAGE_SIZE will do map/unmap once a ti=
me */
> +       __u8  map_mode; /* the mode of dma map */

We previously added some padding to ensure the uABI remained consistent.
I just noticed that Tiantao=E2=80=99s commit (8ddde07a3d285a0f3cec, "dma-ma=
pping:
benchmark: extract a common header file for map_benchmark definition")
accidentally removed that padding, which has completely broken the ABIs.

Could you send a patch to fix this regression, and CC it to
stable@vger.kernel.org before adding the new field which should
use the expansion[] instead.


>  };
>  #endif /* _KERNEL_DMA_BENCHMARK_H */
> diff --git a/kernel/dma/map_benchmark.c b/kernel/dma/map_benchmark.c
> index cc19a3efea89..d8ec0ce058d8 100644
> --- a/kernel/dma/map_benchmark.c
> +++ b/kernel/dma/map_benchmark.c
> @@ -5,6 +5,7 @@
>
>  #define pr_fmt(fmt)    KBUILD_MODNAME ": " fmt
>
> +#include <linux/cleanup.h>
>  #include <linux/debugfs.h>
>  #include <linux/delay.h>
>  #include <linux/device.h>
> @@ -31,17 +32,98 @@ struct map_benchmark_data {
>         atomic64_t loops;
>  };
>
> +struct map_benchmark_ops {
> +       void *(*prepare)(struct map_benchmark_data *map);
> +       void (*unprepare)(void *arg);
> +       int (*do_map)(void *arg);
> +       int (*do_unmap)(void *arg);
> +};
> +
> +struct dma_single_map_param {
> +       struct device *dev;
> +       dma_addr_t addr;
> +       void *xbuf;
> +       u32 npages;
> +       u32 dma_dir;
> +};
> +
> +static void *dma_single_map_benchmark_prepare(struct map_benchmark_data =
*map)
> +{
> +       struct dma_single_map_param *mparam __free(kfree) =3D kzalloc(siz=
eof(*mparam),
> +                                                                   GFP_K=
ERNEL);
> +       if (!mparam)
> +               return NULL;
> +
> +       mparam->npages =3D map->bparam.granule;
> +       mparam->dma_dir =3D map->bparam.dma_dir;
> +       mparam->dev =3D map->dev;
> +       mparam->xbuf =3D alloc_pages_exact(mparam->npages * PAGE_SIZE, GF=
P_KERNEL);
> +       if (!mparam->xbuf)
> +               return NULL;
> +
> +       /*
> +        * for a non-coherent device, if we don't stain them in the
> +        * cache, this will give an underestimate of the real-world
> +        * overhead of BIDIRECTIONAL or TO_DEVICE mappings;
> +        * 66 means evertything goes well! 66 is lucky.
> +        */
> +       if (mparam->dma_dir !=3D DMA_FROM_DEVICE)
> +               memset(mparam->xbuf, 0x66, mparam->npages * PAGE_SIZE);
> +
> +       return_ptr(mparam);
> +}
> +
> +static void dma_single_map_benchmark_unprepare(void *arg)
> +{
> +       struct dma_single_map_param *mparam =3D arg;
> +
> +       free_pages_exact(mparam->xbuf, mparam->npages * PAGE_SIZE);
> +       kfree(mparam);
> +}
> +
> +static int dma_single_map_benchmark_do_map(void *arg)
> +{
> +       struct dma_single_map_param *mparam =3D arg;
> +
> +       mparam->addr =3D dma_map_single(mparam->dev, mparam->xbuf,
> +                                     mparam->npages * PAGE_SIZE, mparam-=
>dma_dir);
> +       if (unlikely(dma_mapping_error(mparam->dev, mparam->addr))) {
> +               pr_err("dma_map_single failed on %s\n", dev_name(mparam->=
dev));
> +               return -ENOMEM;
> +       }
> +
> +       return 0;
> +}
> +
> +static int dma_single_map_benchmark_do_unmap(void *arg)
> +{
> +       struct dma_single_map_param *mparam =3D arg;
> +
> +       dma_unmap_single(mparam->dev, mparam->addr,
> +                        mparam->npages * PAGE_SIZE, mparam->dma_dir);
> +       return 0;
> +}
> +
> +static struct map_benchmark_ops dma_single_map_benchmark_ops =3D {
> +       .prepare =3D dma_single_map_benchmark_prepare,
> +       .unprepare =3D dma_single_map_benchmark_unprepare,
> +       .do_map =3D dma_single_map_benchmark_do_map,
> +       .do_unmap =3D dma_single_map_benchmark_do_unmap,
> +};
> +
> +static struct map_benchmark_ops *dma_map_benchmark_ops[DMA_MAP_MODE_MAX]=
 =3D {
> +       [DMA_MAP_SINGLE_MODE] =3D &dma_single_map_benchmark_ops,
> +};
> +
>  static int map_benchmark_thread(void *data)
>  {
> -       void *buf;
> -       dma_addr_t dma_addr;
>         struct map_benchmark_data *map =3D data;
> -       int npages =3D map->bparam.granule;
> -       u64 size =3D npages * PAGE_SIZE;
> +       __u8 map_mode =3D map->bparam.map_mode;
>         int ret =3D 0;
>
> -       buf =3D alloc_pages_exact(size, GFP_KERNEL);
> -       if (!buf)
> +       void *arg =3D dma_map_benchmark_ops[map_mode]->prepare(map);
> +
> +       if (!arg)
>                 return -ENOMEM;
>
>         while (!kthread_should_stop())  {
> @@ -49,23 +131,10 @@ static int map_benchmark_thread(void *data)
>                 ktime_t map_stime, map_etime, unmap_stime, unmap_etime;
>                 ktime_t map_delta, unmap_delta;
>
> -               /*
> -                * for a non-coherent device, if we don't stain them in t=
he
> -                * cache, this will give an underestimate of the real-wor=
ld
> -                * overhead of BIDIRECTIONAL or TO_DEVICE mappings;
> -                * 66 means evertything goes well! 66 is lucky.
> -                */
> -               if (map->dir !=3D DMA_FROM_DEVICE)
> -                       memset(buf, 0x66, size);
> -
>                 map_stime =3D ktime_get();
> -               dma_addr =3D dma_map_single(map->dev, buf, size, map->dir=
);
> -               if (unlikely(dma_mapping_error(map->dev, dma_addr))) {
> -                       pr_err("dma_map_single failed on %s\n",
> -                               dev_name(map->dev));
> -                       ret =3D -ENOMEM;
> +               ret =3D dma_map_benchmark_ops[map_mode]->do_map(arg);
> +               if (ret)
>                         goto out;
> -               }
>                 map_etime =3D ktime_get();
>                 map_delta =3D ktime_sub(map_etime, map_stime);
>
> @@ -73,7 +142,9 @@ static int map_benchmark_thread(void *data)
>                 ndelay(map->bparam.dma_trans_ns);
>
>                 unmap_stime =3D ktime_get();
> -               dma_unmap_single(map->dev, dma_addr, size, map->dir);
> +               ret =3D dma_map_benchmark_ops[map_mode]->do_unmap(arg);
> +               if (ret)
> +                       goto out;
>                 unmap_etime =3D ktime_get();
>                 unmap_delta =3D ktime_sub(unmap_etime, unmap_stime);
>
> @@ -108,7 +179,7 @@ static int map_benchmark_thread(void *data)
>         }
>
>  out:
> -       free_pages_exact(buf, size);
> +       dma_map_benchmark_ops[map_mode]->unprepare(arg);
>         return ret;
>  }
>
> @@ -209,6 +280,11 @@ static long map_benchmark_ioctl(struct file *file, u=
nsigned int cmd,
>
>         switch (cmd) {
>         case DMA_MAP_BENCHMARK:
> +               if (map->bparam.map_mode >=3D DMA_MAP_MODE_MAX) {
> +                       pr_err("invalid map mode\n");
> +                       return -EINVAL;
> +               }
> +
>                 if (map->bparam.threads =3D=3D 0 ||
>                     map->bparam.threads > DMA_MAP_MAX_THREADS) {
>                         pr_err("invalid thread number\n");
> --
> 2.33.0
>

Thanks
Barry
