Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB5A242D6A
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 17:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745947823; cv=none; b=lHIEaCNyiFeYtlnCq3p9hUFhjuZ79PtOErLe9sNYDuaBm2GSntmQzC/cswdJCHSsePNMjSLyduxAXTG3fssWc/Q3x4tqE9mc0z+d/nughAAVKl7TxO6r00A44OnHqrq572sdr3qcBJiHMK2Vf+X3oF/YCyOUW7WCh5RWYCzgMB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745947823; c=relaxed/simple;
	bh=iH6Owlhwo7/obpVoLUxLDGUT633M4A804YexIcc3OFM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uxm0x7yApKyABY5PG8i2xftK25cHHegYpPhcb1SLMcN2Vzziz5ojzG0xQ0EyUnlk6KaUWo/31eBS84tXhP8Q50fvkwqPMMdCUXaw1POxBTHhNKDxnZ89y0uHjCMVtzZMc9AFKG7feyqH0lCwzbMVHZhWeu3AXzxN4XsV/CF4Yzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Uu7YC8P+; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Uu7YC8P+"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5e5e0caa151so663955a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 10:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745947820; x=1746552620; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Sc4+TzSowcDRl7hLIypowfP7AcQ7Rbov5yPrrWksHAo=;
        b=Uu7YC8P+lb2fE63Bmvdlhhgdhs0ko22IGHLAaWpEs7TgR5UNJzpdskk9OLB0fPYBVj
         TobdZV7L6lJr6RvsxG/IFkAxMJjoXbGf+vz1ubH91X56rhT1k0QjUVqxqF6aY+7juxlZ
         J/58NlcO3LR/xh1emx5LR0i2+7carDPL6DDI0333u9sD466bLDZBmpRm3mG9DzB+z/Fv
         I33tjEQfitMD1I4sT7QQywHBj8TM2ccgw9Om4MmnClMVdBESL8hsILMmARksva4mHPjy
         exN6e9j+mEJ3whVJx6Iv+GbWnuDR4xXR+on0HYZYljpyxYO65QsOM2PrfcieCuOUF9gT
         RC5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745947820; x=1746552620;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sc4+TzSowcDRl7hLIypowfP7AcQ7Rbov5yPrrWksHAo=;
        b=nUavtazsNPAQj4k1Eu/xW6HdsW8hoR9YaWU/CwJewdLQVs7aYDGenZqpVLf1eAAKk9
         FdqESq4+LF4VM01Yp8x+gzGpRVNcustGO8aZvv2LUy5jR3MWpAUnQcZMASX/hVX5/cxy
         WsJelqjYWjHq2tsfQNcXhTUt+lyxikQf+VvqQK61pRVFiybHzjil3DRIhAi2+vYIs62v
         rgwo36AhttXX+dRBk8FIj0DtyWHJL2T1tFzARfZ8z8UqsR956TfWNVvtEiBrdO7qQ+ql
         34SnCF3hIA4amV208uZ5s1uKawVQPOkuYDteHUrTRGAJiHZAvtjpbIMGgeRJ2f10i3/z
         mCEw==
X-Forwarded-Encrypted: i=1; AJvYcCVTaKsU0jlWU9Vx5LEinidjl4g/3Ss8+OYocZhESaP6qIngn6TCiotat41PFAhASS79/00lebqlymqoEWg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVDkp15D7cHP8L4rgRMEy70nxvLQwrDEPSqIUz6nt9Xe1Yr7Q0
	ra1XHkw36i9XZFfxHl0vY5+R3Rb1rtREe0RmA4BFB061+rLOwoYBJhGr133avErvMrLCgRQszYw
	vFaUO/2TaZh88kqhME2iNJFtvTJqWQdZfJKJZVA==
X-Gm-Gg: ASbGncviWXnT+0fqE5LJKjg1mj57s2dcxUvOoi6NCFHiXFqVOx9Vb+Z1yKCo8+5g//z
	zXpx44Ub2P3s2ZVrhvFG7kSN6lpPLRFeh0GgQaF40xYSWK7dnJTTIg1JFdinlGmi7Zt5NyHHpQx
	jNQgRwc0EIaEZCrYNslU1lw+QFz2Q9aqRpGd5ZqFfnf3uEwAYFuXEu60Ht
X-Google-Smtp-Source: AGHT+IFehYf0d8PpH1R2BJB2r7eFTKl8u51pe/GzhtkLgjZNrelsbpFr//PxWWkACriX1/8jtoRJQERGiEtx1uS0LIQ=
X-Received: by 2002:a05:6402:40d3:b0:5e5:bdfe:6bfb with SMTP id
 4fb4d7f45d1cf-5f83885f55bmr4196335a12.16.1745947819729; Tue, 29 Apr 2025
 10:30:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250426065348.1234391-1-xiaolei.wang@windriver.com>
 <20250426065348.1234391-3-xiaolei.wang@windriver.com> <09bab7ab-badd-4a7d-9ba5-5dd7181f6a6f@windriver.com>
In-Reply-To: <09bab7ab-badd-4a7d-9ba5-5dd7181f6a6f@windriver.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 29 Apr 2025 11:30:08 -0600
X-Gm-Features: ATxdqUGGH1oEM35wjSVapCU_wc_NAw2TKa6cQrQ2zmSrZZbypcsXceaQ3lXxPSI
Message-ID: <CANLsYkynk4wogcEAvVQ-MTyCGRF3CyqSjxaKUS4eYCbGsL7+Kg@mail.gmail.com>
Subject: Re: [PATCH V2 2/2] remoteproc: core: release rproc->clean_table after
 rproc_attach() fails
To: Xiaolei Wang <xiaolei.wang@windriver.com>
Cc: andersson@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 28 Apr 2025 at 20:20, Xiaolei Wang <xiaolei.wang@windriver.com> wrote:
>
>
> On 4/26/25 14:53, Xiaolei Wang wrote:
> > When rproc->state = RPROC_DETACHED is attached to remote processor
> > through rproc_attach(), if rproc_handle_resources() returns failure,
> > then the clean table should be released, otherwise the following
> > memory leak will occur.
> >
> > unreferenced object 0xffff000086a99800 (size 1024):
> > comm "kworker/u12:3", pid 59, jiffies 4294893670 (age 121.140s)
> > hex dump (first 32 bytes):
> > 00 00 00 00 00 80 00 00 00 00 00 00 00 00 10 00 ............
> > 00 00 00 00 00 00 08 00 00 00 00 00 00 00 00 00 ............
> > backtrace:
> >   [<000000008bbe4ca8>] slab_post_alloc_hook+0x98/0x3fc
> >   [<000000003b8a272b>] __kmem_cache_alloc_node+0x13c/0x230
> >   [<000000007a507c51>] __kmalloc_node_track_caller+0x5c/0x260
> >   [<0000000037818dae>] kmemdup+0x34/0x60
> >   [<00000000610f7f57>] rproc_boot+0x35c/0x56c
> >   [<0000000065f8871a>] rproc_add+0x124/0x17c
> >   [<00000000497416ee>] imx_rproc_probe+0x4ec/0x5d4
> >   [<000000003bcaa37d>] platform_probe+0x68/0xd8
> >   [<00000000771577f9>] really_probe+0x110/0x27c
> >   [<00000000531fea59>] __driver_probe_device+0x78/0x12c
> >   [<0000000080036a04>] driver_probe_device+0x3c/0x118
> >   [<000000007e0bddcb>] __device_attach_driver+0xb8/0xf8
> >   [<000000000cf1fa33>] bus_for_each_drv+0x84/0xe4
> >   [<000000001a53b53e>] __device_attach+0xfc/0x18c
> >   [<00000000d1a2a32c>] device_initial_probe+0x14/0x20
> >   [<00000000d8f8b7ae>] bus_probe_device+0xb0/0xb4
> >   unreferenced object 0xffff0000864c9690 (size 16):
> >
> > Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> > ---
> >   drivers/remoteproc/remoteproc_core.c | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > index b21eedefff87..6226e2d12a97 100644
> > --- a/drivers/remoteproc/remoteproc_core.c
> > +++ b/drivers/remoteproc/remoteproc_core.c
> > @@ -1656,6 +1656,7 @@ static int rproc_attach(struct rproc *rproc)
> >   unprepare_device:
> >       /* release HW resources if needed */
> >       rproc_unprepare_device(rproc);
> > +     kfree(rproc->clean_table);
> >   disable_iommu:
> >       rproc_disable_iommu(rproc);
> >       return ret;
>
> Hi Mathieu
>
> For this patch, if I use devm_kmemdup() instead of kmemdup()

I don't think using devm_kmemdup() would work in this case since the
memory is only free'd when rproc->dev is released.  So if you have
Attach()->detach()->attach(), we'd only keep accumulating memory that
is no longer used.

>
> in rproc_set_rsc_table() function, is it better? Also delete
>
> kfree(rproc->clean_table) in rproc_set_rsc_table()
>
> thanks
>
> xiaolei
>
