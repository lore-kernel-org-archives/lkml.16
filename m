Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C726C70824
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 02:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746585882; cv=none; b=gJiR3JIUyaA9Ugohy6HCS5TFVrYLONiQ4qMcvxNmafFYHDF7MZ4OXlsRgsj6XtkgaR93xiNVADWz6H1YfpUXFy0xqPHktEfmfz4dSeFFKGwKUAE1E16b/XsAm+G43tXLwJxsPVyY2Sfej2k/kOTaq7qvyigTQ62Kj5CKyQ+RGKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746585882; c=relaxed/simple;
	bh=v/k8fkqi/B+bFFED5fC8etueQPbo8d8r4bvAvy5moCg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D18SkW/mkEP1S/U7GBBLY9ppdU0Tkt76PUMzt4oaMAzAZIfx5uTA5cUzjfR26fSzGq+4RlcKNaVq0v/E/pU5MME+cDbl7wJhOFetN61zTja/HfABKCAEa0+JnCJmnMLjYmt1aHWs38/JQBeDPryp56QljHH24SlrRBggV5fOtOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mDBL5SY8; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mDBL5SY8"
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-523dc190f95so2253034e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 19:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746585879; x=1747190679; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9EiL3jR8M7yopoi7vVdrmMpQt07YMhxaiFiq0iV4zSA=;
        b=mDBL5SY89fSQf2/nASFPRi76HcjyuWMrNwApoyGvpMQqJqlZBK8MaFuyLVnSrMWqGT
         fSXWAd6rFYC5EjUGXbmwVSIrYzifNiAF5LlA7mc1efT+OHlXCsV/vyZX2YQJbROCRPyT
         AbVnd19yafup5A74kIha1Exumt/3kQ9fQCz19FD1oWiaqBuFQAfNj5Hx/zuVGkL34fFI
         3ByB+60Iu9vBxFkar5gZJY2Gf4QqfyewC5oB5K0I1MxAvnGrlYaaTV5sjuycAozTo7Fe
         Qw6eOQL+ApuZDvYQXRSMPVDRitupk8r4EAaFc8BvHJeVVLVEwHdVuS/b5zc2oZG2tjfY
         owVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746585879; x=1747190679;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9EiL3jR8M7yopoi7vVdrmMpQt07YMhxaiFiq0iV4zSA=;
        b=BDj2kap7MO1uADG9aJmf99aCsR1afTW2pVhcjPmPtKAWzfKJIXa0DFi89hZ1xmjm58
         IgnT70UH19LkOlm8Vo6zWxTt1GW8H1wNZI2e0ywrNhkKT4laNzhYXtD1dF12GbkTV+nT
         W8garA90BIrLDNzHGu/W0Lgcj+r7mVWgNCYFX/lQs+sXU+1bcFuu4kdIpsK7U6tcxiya
         UzxMY4I0ehiShmCi731Blu+p74OvqCHyLCGvUm4m6n7X9bRNNLlZcYmAqOnbq0fNbYsA
         aud4rwO7APE1tRNOyYPUPhCtfIhhuT63s9BzxgFuD7S2h5NtvfCa8fujpLUOH+fWzGxw
         0y5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXRobFG/gfloAeJx7NnVdmLhwiMzr4bPkoL0SFae/RzNpiydi6K4zLNECAMI64vJI1G9Xs1GMcucMgsHrQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzohwbziepZY7c3e/g/6BJotribvsuXzycVKoVkzgbgZCF3Zuc4
	PNPLFcAP3gKCSvOWS34+lPqkOlROrykNaIoUDARgHY88j8Mo/PyVyd4VZ6H2ipCYLBW6ILLqU5e
	0/GxmD+CbLZOCi0lRu9kqtjd4bNE=
X-Gm-Gg: ASbGncsJWNJw30TOWKTOlt3uJLYBwTltxN1931hEFeSfGG8EdyIxRCvowqy30F4bMmT
	bHfsGqxrEEgJghFoNUc9n2q15AsJmaw/tqddzN5DB3BaIf5MbWyy59t1p8MgLTMxZRs5+4/VQ9l
	j6+4/hL1nLH25THLRADrmnhQ==
X-Google-Smtp-Source: AGHT+IHmw5taEtGxcRol3Sk9+refsDygdCulc98vDVOXQNNgeJkuyxo9X2/0ZA5i0x8IY6U3umyzodWkDkT+MDbZS4g=
X-Received: by 2002:a05:6122:181b:b0:51f:fc9d:875d with SMTP id
 71dfb90a1353d-52c37ab9312mr1279220e0c.8.1746585879594; Tue, 06 May 2025
 19:44:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506030100.394376-1-xiaqinxin@huawei.com> <20250506030100.394376-5-xiaqinxin@huawei.com>
In-Reply-To: <20250506030100.394376-5-xiaqinxin@huawei.com>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 7 May 2025 14:44:28 +1200
X-Gm-Features: ATxdqUH3yMt1mMhq6jKANZZxcE5NsXFCSy7HTPU7XFirkrVBPl8KliTmhIKDXLE
Message-ID: <CAGsJ_4z9oYtCkdXqk=s+F4ZFrjCan+-AuGqRQDeQcXcswPzaHw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] dma mapping benchmark:add support for dma_map_sg
To: Qinxin Xia <xiaqinxin@huawei.com>
Cc: yangyicong@huawei.com, hch@lst.de, iommu@lists.linux.dev, 
	jonathan.cameron@huawei.com, prime.zeng@huawei.com, fanghao11@huawei.com, 
	linux-kernel@vger.kernel.org, linuxarm@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 3:01=E2=80=AFPM Qinxin Xia <xiaqinxin@huawei.com> wr=
ote:
>
> Support for dma_map_sg, add option '-m' to distinguish mode.
>
> i) Users can set option '-m' to select mode:
>    DMA_MAP_SINGLE_MODE=3D0, DMA_MAP_SG_MODE:=3D1
>    (The mode is also show in the test result).
> ii) Users can set option '-g' to set sg_nents
>     (total count of entries in scatterlist)
>     the maximum number is 1024. Each of sg buf size is PAGE_SIZE.
>     e.g
>     [root@localhost]# ./dma_map_benchmark -m 1 -g 8 -t 8 -s 30 -d 2
>     dma mapping mode: DMA_MAP_SG_MODE
>     dma mapping benchmark: threads:8 seconds:30 node:-1
>     dir:FROM_DEVICE granule/sg_nents: 8
>     average map latency(us):1.4 standard deviation:0.3
>     average unmap latency(us):1.3 standard deviation:0.3
>     [root@localhost]# ./dma_map_benchmark -m 0 -g 8 -t 8 -s 30 -d 2
>     dma mapping mode: DMA_MAP_SINGLE_MODE
>     dma mapping benchmark: threads:8 seconds:30 node:-1
>     dir:FROM_DEVICE granule/sg_nents: 8
>     average map latency(us):1.0 standard deviation:0.3
>     average unmap latency(us):1.3 standard deviation:0.5
>
> Signed-off-by: Qinxin Xia <xiaqinxin@huawei.com>

Either merge this into the previous patch or use the correct prefix in the
subject to differentiate patch 3 from patch 4. For example: selftests/dma

> ---
>  tools/testing/selftests/dma/dma_map_benchmark.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/tools/testing/selftests/dma/dma_map_benchmark.c b/tools/test=
ing/selftests/dma/dma_map_benchmark.c
> index b12f1f9babf8..036ddb5ac862 100644
> --- a/tools/testing/selftests/dma/dma_map_benchmark.c
> +++ b/tools/testing/selftests/dma/dma_map_benchmark.c
> @@ -27,6 +27,7 @@ int main(int argc, char **argv)
>         int fd, opt;
>         /* default single thread, run 20 seconds on NUMA_NO_NODE */
>         int threads =3D 1, seconds =3D 20, node =3D -1;
> +       int map_mode =3D DMA_MAP_SINGLE_MODE;
>         /* default dma mask 32bit, bidirectional DMA */
>         int bits =3D 32, xdelay =3D 0, dir =3D DMA_MAP_BIDIRECTIONAL;
>         /* default granule 1 PAGESIZE */
> @@ -34,7 +35,7 @@ int main(int argc, char **argv)
>
>         int cmd =3D DMA_MAP_BENCHMARK;
>
> -       while ((opt =3D getopt(argc, argv, "t:s:n:b:d:x:g:")) !=3D -1) {
> +       while ((opt =3D getopt(argc, argv, "t:s:n:b:d:x:g:m:")) !=3D -1) =
{
>                 switch (opt) {
>                 case 't':
>                         threads =3D atoi(optarg);
> @@ -57,11 +58,20 @@ int main(int argc, char **argv)
>                 case 'g':
>                         granule =3D atoi(optarg);
>                         break;
> +               case 'm':
> +                       map_mode =3D atoi(optarg);
> +                       break;
>                 default:
>                         return -1;
>                 }
>         }
>
> +       if (map_mode >=3D DMA_MAP_MODE_MAX) {
> +               fprintf(stderr, "invalid map mode, DMA_MAP_SINGLE_MODE:%d=
, DMA_MAP_SG_MODE:%d\n",
> +                       DMA_MAP_SINGLE_MODE, DMA_MAP_SG_MODE);
> +               exit(1);
> +       }
> +
>         if (threads <=3D 0 || threads > DMA_MAP_MAX_THREADS) {
>                 fprintf(stderr, "invalid number of threads, must be in 1-=
%d\n",
>                         DMA_MAP_MAX_THREADS);
> @@ -111,13 +121,15 @@ int main(int argc, char **argv)
>         map.dma_dir =3D dir;
>         map.dma_trans_ns =3D xdelay;
>         map.granule =3D granule;
> +       map.map_mode =3D map_mode;
>
>         if (ioctl(fd, cmd, &map)) {
>                 perror("ioctl");
>                 exit(1);
>         }
>
> -       printf("dma mapping benchmark: threads:%d seconds:%d node:%d dir:=
%s granule: %d\n",
> +       printf("dma mapping mode: %d\n", map_mode);
> +       printf("dma mapping benchmark: threads:%d seconds:%d node:%d dir:=
%s granule/sg_nents: %d\n",
>                         threads, seconds, node, dir[directions], granule)=
;
>         printf("average map latency(us):%.1f standard deviation:%.1f\n",
>                         map.avg_map_100ns/10.0, map.map_stddev/10.0);
> --
> 2.33.0
>

Thanks
Barry
