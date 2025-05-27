Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2AB72DCC0C
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 14:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748355701; cv=none; b=LP5TMH3VyHYWkFScrUDuRQBUEa6c2XXmvClVc2ZJCSRZCtxfGEIA9+XMePOgrVWWy7lCIXm+yLX309TJXou9Vg9DRE9lUN7XH+HfjS0utt5g1t+5EJZUprwfSOXbHaBnq0BrPElLXri8GPss8UHS/xoSW+yHAhbbjA4VvBv8bXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748355701; c=relaxed/simple;
	bh=CIpAbQ5tZU/9b/y93vCZiejAH1XRyfu6DUA9IGbLifI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=peaxZ/PmoTlLSgckRbtg3LHmz9kGAEAYuYPgztrjkUI92KsgC2nljFe75gH00OkFj6hcJGNZdkfG7o/M405YGTFJifufjxuRFwr2rxrkoS21vZpIDGDVfMuN28FpfwUtV2xhzh6/3YZP0nm799T23dk4Bbfze56nG7sB6b0jrK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ydimUZxf; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ydimUZxf"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-73384b2c7ffso771318a34.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 07:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748355699; x=1748960499; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hwr1gpmj/Y5xrm528qSwLq/tkBaVoA9zaC9zXNPG4sg=;
        b=ydimUZxfWoHD1FLHL3R1fYD2Wbp1hhSgv2ssLBfGPEijc91q711V3wzlKe0bRC9eJJ
         ylHqf+55yMEYnnrKTvDnsev8taf0duLgQJc3m1Lfw55RCxo4m3ZnFjqil1bgG1r/9bTj
         g028P8njdOHsmkCRhggS6g6Ssb5m30Ebrfe9PpEnnguaZoDzooyhtsW7OgfAwjMBhL2o
         ZHAAYbMDuBrU9c4Arxl+qXquSUnX57RQEz4wHlyiCQ4Gze92/Rrs9rvVPdhpWMRqsRnZ
         6VKxZFW/lElCBFDu61j7zhuvAKEkb3qCRTAikZAUJwAsH2NkrGHsUBMYycwkkxpX3NuT
         Nrng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748355699; x=1748960499;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hwr1gpmj/Y5xrm528qSwLq/tkBaVoA9zaC9zXNPG4sg=;
        b=LjsMz2Kzx+V4asU6qoU7a4j3q2dqbD7GPc1SCidDyV1Q0IevwV9UZ1eSavnhghPXsk
         wH1Lum5HdSO5aW8WzLGZzKCNGOKFZB2hXpY/RuEaHeA/H6gQZ+nPGBo9faGoCoNNMg6V
         Vya86SKi/YoeP1l0enkkjmfl8QQsTRYblDHy2+0E0aePM3Vq66MsOFPBcGF6+9UWWMmb
         Ep74LQdbqH5s31SKTlej7D5q4qSZ22H0052ZNxzQrJ72Q723TJyLfI1d0x5udvKeOd8E
         VD+2hS0EYoD2+5v/JcxoEfmrkxAuPDhESaywZDTwt+SNDjlf3SIxA0v2oP2y2NTcxbsn
         /w9g==
X-Gm-Message-State: AOJu0YzZh6Q3ZoY7vU3Yj19pUPl8xL6TlTGR7A38kiThpqfu3Lq/rcoN
	WWk9cinm2kiEHxkm3yNHU0mREGbMaTSRPfG9xm0b7wFK5r+XGukzthn67h5C+PxA5f7OevgHLDe
	6p9E5d0NqqG6BQOygpXREVV+C1iewcn863Bk/LumxPq0q3pU8Rmf/aYk=
X-Gm-Gg: ASbGncux+UZFrCiKD1XJlKcEUHcqPPURtmqhcw/gIOOfkoX4OCh/MES1ZPWc+GE/8xo
	LrWl1P2mqsyFZTjpFz36WTjj/dyZQRIsMuOE6Eamn6DtujLbXSha00+WR9WqLx8wYrd6oUM0GX/
	bwMY4JlthCwjjk+MW/ZOeZVGNKeW2BCkZxZw==
X-Google-Smtp-Source: AGHT+IHSldvXeMA/elq5GvdUeZXIE9U2qVSq25l+1UuvJ7nlZ4QemLu8hmu4wkxm84jlPfHrWshtHT5sVpyeKj3x5HU=
X-Received: by 2002:a05:6808:1b85:b0:402:ebf9:b770 with SMTP id
 5614622812f47-40646855c6dmr6484125b6e.28.1748355698671; Tue, 27 May 2025
 07:21:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520152436.474778-1-jens.wiklander@linaro.org>
 <20250520152436.474778-7-jens.wiklander@linaro.org> <aDQWt5Ck1Bo01Z_4@sumit-X1>
 <CAHUa44E4-z7-7DQjyGXYRiZDf6mRBKYZDuxWFGy+3JxtWO1ocg@mail.gmail.com> <aDQ1YR5jbcOFctty@sumit-X1>
In-Reply-To: <aDQ1YR5jbcOFctty@sumit-X1>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 27 May 2025 16:21:27 +0200
X-Gm-Features: AX0GCFufndHj8dMt0PaaB1DfiHys-ZIzTuXpul-y9wKknnwSsO_zDsCVnQgE3aw
Message-ID: <CAHUa44HUzfWXEdLeAVimDM0DTFaTbCa4SSTcy8YPhDjWHR352Q@mail.gmail.com>
Subject: Re: [PATCH v9 6/9] tee: add tee_shm_alloc_dma_mem()
To: Sumit Garg <sumit.garg@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
	Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com, 
	Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>, 
	Rouven Czerwinski <rouven.czerwinski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 26, 2025 at 11:33=E2=80=AFAM Sumit Garg <sumit.garg@kernel.org>=
 wrote:
>
> On Mon, May 26, 2025 at 11:21:47AM +0200, Jens Wiklander wrote:
> > On Mon, May 26, 2025 at 9:22=E2=80=AFAM Sumit Garg <sumit.garg@kernel.o=
rg> wrote:
> > >
> > > On Tue, May 20, 2025 at 05:16:49PM +0200, Jens Wiklander wrote:
> > > > Add tee_shm_alloc_dma_mem() to allocate DMA memory. The memory is
> > > > represented by a tee_shm object using the new flag TEE_SHM_DMA_MEM =
to
> > > > identify it as DMA memory. The allocated memory will later be lent =
to
> > > > the TEE to be used as protected memory.
> > > >
> > > > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > > > ---
> > > >  drivers/tee/tee_shm.c    | 74 ++++++++++++++++++++++++++++++++++++=
++--
> > > >  include/linux/tee_core.h |  5 +++
> > > >  2 files changed, 77 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> > > > index e1ed52ee0a16..92a6a35e1a1e 100644
> > > > --- a/drivers/tee/tee_shm.c
> > > > +++ b/drivers/tee/tee_shm.c
> > > > @@ -5,6 +5,8 @@
> > > >  #include <linux/anon_inodes.h>
> > > >  #include <linux/device.h>
> > > >  #include <linux/dma-buf.h>
> > > > +#include <linux/dma-mapping.h>
> > > > +#include <linux/highmem.h>
> > > >  #include <linux/idr.h>
> > > >  #include <linux/io.h>
> > > >  #include <linux/mm.h>
> > > > @@ -13,9 +15,14 @@
> > > >  #include <linux/tee_core.h>
> > > >  #include <linux/uaccess.h>
> > > >  #include <linux/uio.h>
> > > > -#include <linux/highmem.h>
> > > >  #include "tee_private.h"
> > > >
> > > > +struct tee_shm_dma_mem {
> > > > +     struct tee_shm shm;
> > > > +     dma_addr_t dma_addr;
> > > > +     struct page *page;
> > > > +};
> > > > +
> > > >  static void shm_put_kernel_pages(struct page **pages, size_t page_=
count)
> > > >  {
> > > >       size_t n;
> > > > @@ -49,7 +56,14 @@ static void tee_shm_release(struct tee_device *t=
eedev, struct tee_shm *shm)
> > > >       struct tee_shm *parent_shm =3D NULL;
> > > >       void *p =3D shm;
> > > >
> > > > -     if (shm->flags & TEE_SHM_DMA_BUF) {
> > > > +     if (shm->flags & TEE_SHM_DMA_MEM) {
> > > > +             struct tee_shm_dma_mem *dma_mem;
> > > > +
> > > > +             dma_mem =3D container_of(shm, struct tee_shm_dma_mem,=
 shm);
> > > > +             p =3D dma_mem;
> > > > +             dma_free_pages(&teedev->dev, shm->size, dma_mem->page=
,
> > > > +                            dma_mem->dma_addr, DMA_BIDIRECTIONAL);
> > >
> > > Although the kernel bot already found a randconfig issue, it looks li=
ke
> > > we need to add Kconfig dependencies like HAS_DMA, DMA_CMA etc.
> > >
> > > Also, I was thinking if we should rather add a new TEE subsystem
> > > specific Kconfig option like: TEE_DMABUF_HEAPS which can then be used=
 to
> > > select whatever dependency is needed as well as act as a gating Kconf=
ig
> > > for relevant features.
> >
> > You mean something like this?
> >
> > --- a/drivers/tee/Kconfig
> > +++ b/drivers/tee/Kconfig
> > @@ -13,6 +13,14 @@ menuconfig TEE
> >
> >  if TEE
> >
> > +config TEE_DMABUF_HEAPS
> > +       bool
> > +       depends on HAS_DMA && DMABUF_HEAPS
>
> Yeah this looks fine to me but needs to be tested if DMA_CMA is a
> dependency here too.

Why? It can work without CMA for small allocations.

>
> > +
> > +config TEE_STATIC_PROTMEM_POOL
> > +       bool
> > +       depends on HAS_IOMEM && TEE_DMABUF_HEAPS
>
> The static and dynamic protected memory pools should get auto enabled if
> TEE_DMABUF_HEAPS is enabled since they are pre-requisite to provide the
> protected heaps support. Something like:
>
> +config TEE_STATIC_PROTMEM_POOL
> +       bool
> +       default y if TEE_DMABUF_HEAPS
> +       depends on HAS_IOMEM

Right, I'll update as needed.

Cheers,
Jens
