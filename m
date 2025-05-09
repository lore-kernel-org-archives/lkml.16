Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC9E23D2AF
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 04:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746763207; cv=none; b=gXI9l5Pj3BgwPHtnkiOImj9lViZhNLDjZDyK9CPwvUjfzm/EmJdET2W6OG0g9VZUZlPaagZLvCam7jIB2Trk7QuAn1UwYLQv1VhwPmTaxxb8gMGXb9VMtrM1xWtDz4EcVtj6ldaXohnmdiEy+Ie8l1SZSD5WtGxa2Mu8gc5pYGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746763207; c=relaxed/simple;
	bh=O0wc9bDinKNUgWud/v1ynGKPFpt6zxAkHu4kZCpjBLs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b7xo8ZgyY9RBE/IxMbJiF0I8KeJq5FNz186LlUlFZc0Ixm+TaLbUS98iLRqPiUrrDGA01hXoh4ujajUMwWYf96xM1qTcPfYjVvrYFxFur/XO3pJtW0rBfPRKMZZZUPs6a0ldJ80X7WLVP32Fy7WjilnG+WGoWTBFCIvSWl0NYYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FGp56G13; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FGp56G13"
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-879ecd26b36so971661241.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 21:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746763204; x=1747368004; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6G6oVMS2/2cZwRoqWPoJH6DF7ZUJdFMrU5gGv2C0tcI=;
        b=FGp56G135tBZoOJnmpiuQ+Xnj5xrXHLNi4TDgbXoPnTRe/vQbrPhBRwLfuTSw+R3tx
         dpRl4wPT2XqYfFvqpW21UQ8fkheLGjuyloIkbPhQ1I+Buar5zyGvy6CG68USHr2VbZlf
         9ppEFKaSN7GTjGgbFVv0PX3ptnVkG8kD7sdB/dt5+W/9AcnituGls5LTKFuVBV6E6cEe
         YazAIqoAWh56BgOJzBNSiKO+yZhlXREKDRKGLgVEfhqBGWIJYpvOx31yd6GQzXmPK2zJ
         NX3WPzakbqoYy8vb/bEcTgcQ+G6s7OfNZkIOHcsJi51+F4ASadjkXtdHxhoUpMbXGZsH
         DRAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746763204; x=1747368004;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6G6oVMS2/2cZwRoqWPoJH6DF7ZUJdFMrU5gGv2C0tcI=;
        b=o4aS2p79+NSLcDqjC8IQcxNH2RAPs7n0dDvaThuMQtyO8PVpCILYIZmEgBvJkNEq1b
         O1Wm7njoDUyrHpAPCywdwoWJlq94s3bErRAjhJ/9xF8RTwXAz+Ph+c/MgW8cmjukfOJ9
         m9HFvbiIhUwexvMk1nskPm1orTPRMVOnFc3gITvoxebHiHOeuAELxOK15r8nAQOZYweP
         urwnP7QTKv2cgmgvx3vejG7p8rfldVqYw3A5D5wDrZnoXEOl/42jQ2TpvdjJqbOMeA2I
         3QY6B0x6v8RzDnLiZMwc9PSQKBOlOYTdCrDP0NNpiqU5uCfqvIk0C4GH96HaAJZ/ANkr
         9ZIw==
X-Forwarded-Encrypted: i=1; AJvYcCUlw2uuX+Y1gvSA14Uz+u5DvPy69ESmYycTGIA4tnkiG5vZmZc61YaUxGfErtuMlXyuEFxNuszr5VD/BDQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3kjRjMiwxiHWXlfhoI5ajsa/8atvinRLnZ1y4hkkiLkAY6JiW
	kktj92VuMbgq2Gne4oMYO5KpmEfUk143oPtxiIumYueN7Bw5saqPPo0UWT/We0FF1n3Pyf7wQ16
	YGR9GfmBr6FFtUM2LIjMLiQxG3co=
X-Gm-Gg: ASbGncsmCgPMBC/mMder0R8YlL6fjVm8tJoSSMC66Gm+Yf15pCTCPOsR5R03bQMkqXj
	22r97bmX7CljiNz3DbFG27PABTS2IJ6K+/LwIja4UA6NbtwjupnUdPXIZszkshMtf69Ifg4IaST
	pONJ/BenLNIciu+kwHZc0bxnhoUdjhbE34
X-Google-Smtp-Source: AGHT+IHIcljw4VAISO8y0egc9b6+n1i+yR4OqDyi8CeF/F6PBxgRUsH2uaETX5k2p6QWYWMa3s0puJpc65i6dnobCEc=
X-Received: by 2002:a67:f411:0:b0:4db:10bf:6f2c with SMTP id
 ada2fe7eead31-4ddac94bbb8mr5192054137.11.1746763204204; Thu, 08 May 2025
 21:00:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509020238.3378396-1-xiaqinxin@huawei.com> <20250509020238.3378396-5-xiaqinxin@huawei.com>
In-Reply-To: <20250509020238.3378396-5-xiaqinxin@huawei.com>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 9 May 2025 15:59:53 +1200
X-Gm-Features: AX0GCFurr0i-Df4uo4cGNP0_BIxmRZQifcMqyWZ-td28HMFimLzCvsljDauHGD0
Message-ID: <CAGsJ_4zaE6F5Goh9O6ytPA+RekeYiMhsU7dHYAM_sKzXREiQjA@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] selftests/dma: Add dma_map_sg support
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


- stable@vger.kernel.org
+ Marek
+ Robin,

Please also include something like 'DMA map benchmark' in the subject line
to make it more specific. Additionally, make sure constants like
DMA_MAP_SINGLE_MODE use a more specific namespace, as mentioned in
earlier replies. With those changes, feel free to add:

Reviewed-by: Barry Song <baohua@kernel.org>

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
