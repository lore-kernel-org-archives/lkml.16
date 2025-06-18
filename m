Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA141A23BB
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 07:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750230195; cv=none; b=hvyXdXbNln4mqMQSmfNyo/Ah7whUVNoG3+9TwgVZiFYSxRIYHaWMqJXBve6P2IqcY7ndSPAXiZgoiSVW9F4eAz87Zzsp3Qbjk81AIZARmdFtbgWcAPkEL41+iVXqlZIckVbhLtI6IRFiORzSPNFsEXCHQ1JalK7TpFDmclsoAmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750230195; c=relaxed/simple;
	bh=nE+ykYH6M9Fet691mrhbrL6msESON9HWWk+JwGOG8Yc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JkaHQI4eYBb/fGSGbhlZm4DOku0kZ1cCkZhNykGBL8MCzlSn3EaJBP6ib55YW4hVTdy8A6gw7/TOmkXOSut6LAmWL+QPwsL1/3b1ssRThcwVifnZ8oW87h7+wKWu2hXX4lbHyEqp6Sa+UQwD8kwyV58zRXPFsw8npj5of4v/Mrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lKk84U6j; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lKk84U6j"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-73a5c41a71aso1444220a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 00:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750230192; x=1750834992; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r8SFTx5dPQSfu8ZL7Jn6th2YUqqrMFvLWLfJm2Kbj0c=;
        b=lKk84U6jPuo3l1PLtw6SvGS9yd61M7wcWPU3jZD6gse2VEHWEbmab3cyNEjnMgK8z4
         IvUDoOFLjWfKqK+BD+OoZfPlU3vNu8F9O3uJw8Vtz2e33+NXZEJCP271to7K53lMZkR2
         zUGZBZQ2IvJEHDaSOcI6ADBLZVtj0LjiIiMfsZSHqqLsdE1KIGJrLcwmdtVNAeoTmZg0
         SU7qK268l/0e/hueCtJ8+B206PK+bIzVlfRf+DrIcStlnh7yMPLnxDmwdlNk6Sq723dc
         x2ObqMGMVn2BoWKMVQsCIQdoXssKzCLAMXgSeIhwys8JVDW2G0TYqK+0dEPtrBaEP7eM
         ZliA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750230192; x=1750834992;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r8SFTx5dPQSfu8ZL7Jn6th2YUqqrMFvLWLfJm2Kbj0c=;
        b=GqwenGlyYEX3ZMq22k4tY2NRT17qXoBmvYr1CDgEbTJXtY7r6qFp/oUG6Hvtfr8G1s
         BBhYPwrDqtCw8ufWjsH94KCLdf28nAbLDpn/ETmpccn3LQtVkUvE67FqiSEmaTs3vMfb
         /MkiEEyrzJrxdyP3lvqi7DQhb6wwGXMbGwQP5Dr0eyEwjkpDoHcsJDzuYpDblXwaoTb5
         Qp1zTfWnqdg5VZch/xut/Up0LVjk4Tw7pRK6qTA8jB9FUGn64tr0yYPqSGrs9w02zqRo
         cwryAF0nwjBid3k22Laxd7t+UEWkhTjMQ65fUdCUUkefHBGHBIXiujaABKmTdBt3rCsb
         QPaQ==
X-Gm-Message-State: AOJu0YxkHTB70zJGHM4aMHbbm9C4prf8tmklP22XYyjEImE0jaBTMJhO
	YGgNikZEjyi+IZGrMvY8az6ecgIi942GcPn7uuPS6+tgc3q5AeHkxrZ1p1A5xzT95jqUZdBNMs6
	2x6TFaipO5RelTUOO8FlUYama8MhYXfooYhDsBynxJA==
X-Gm-Gg: ASbGnctnRTdQI3TO+8HoZvA4phrk306cc0zNLlrRpf1Y/CkoeBtJ2jX3SyzEqTF1eIo
	bow10IMe7o+N4/oRdYoGGKNMd5Zz0/fyMxXgJ3uDbFCq5t9a5V14Oh1C4/IlPIihUoAK6iJCURz
	CCFS1oBM2jtz9K5ZLJHnh90t096g9yEXejD9mDSTycstc=
X-Google-Smtp-Source: AGHT+IEYIeVC/jTVYCSxf/dGhqeDr1KHxYiJwAAX/5hmURj3RcHrh9D5I5KutnxKn6tUumkHdJ/1wa42+SytUsf+26I=
X-Received: by 2002:a05:6830:40c4:b0:72b:946e:ccc7 with SMTP id
 46e09a7af769-73a36091cbemr11291390a34.0.1750230191671; Wed, 18 Jun 2025
 00:03:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610131600.2972232-1-jens.wiklander@linaro.org>
 <20250610131600.2972232-7-jens.wiklander@linaro.org> <aFFSWDiVsxA1CbCX@sumit-X1>
In-Reply-To: <aFFSWDiVsxA1CbCX@sumit-X1>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 18 Jun 2025 09:03:00 +0200
X-Gm-Features: AX0GCFvrA5yXpBPMnqH5JcYKZyhNKjMM65-tKAnroIXskFJp4M6WI4XH2u_9JeE
Message-ID: <CAHUa44HP5EbURyLCmawMLc0d5jz1oTQZ53V1w2h0-ngUC2hbEw@mail.gmail.com>
Subject: Re: [PATCH v10 6/9] tee: add tee_shm_alloc_dma_mem()
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
	Rouven Czerwinski <rouven.czerwinski@linaro.org>, robin.murphy@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 1:32=E2=80=AFPM Sumit Garg <sumit.garg@kernel.org> =
wrote:
>
> On Tue, Jun 10, 2025 at 03:13:50PM +0200, Jens Wiklander wrote:
> > Add tee_shm_alloc_dma_mem() to allocate DMA memory. The memory is
> > represented by a tee_shm object using the new flag TEE_SHM_DMA_MEM to
> > identify it as DMA memory. The allocated memory will later be lent to
> > the TEE to be used as protected memory.
> >
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> >  drivers/tee/tee_shm.c    | 85 +++++++++++++++++++++++++++++++++++++++-
> >  include/linux/tee_core.h |  5 +++
> >  2 files changed, 88 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> > index e63095e84644..60b0f3932cee 100644
> > --- a/drivers/tee/tee_shm.c
> > +++ b/drivers/tee/tee_shm.c
> > @@ -5,6 +5,8 @@
> >  #include <linux/anon_inodes.h>
> >  #include <linux/device.h>
> >  #include <linux/dma-buf.h>
> > +#include <linux/dma-mapping.h>
> > +#include <linux/highmem.h>
> >  #include <linux/idr.h>
> >  #include <linux/io.h>
> >  #include <linux/mm.h>
> > @@ -13,9 +15,14 @@
> >  #include <linux/tee_core.h>
> >  #include <linux/uaccess.h>
> >  #include <linux/uio.h>
> > -#include <linux/highmem.h>
> >  #include "tee_private.h"
> >
> > +struct tee_shm_dma_mem {
> > +     struct tee_shm shm;
> > +     dma_addr_t dma_addr;
> > +     struct page *page;
> > +};
> > +
> >  static void shm_put_kernel_pages(struct page **pages, size_t page_coun=
t)
> >  {
> >       size_t n;
> > @@ -48,7 +55,16 @@ static void tee_shm_release(struct tee_device *teede=
v, struct tee_shm *shm)
> >  {
> >       void *p =3D shm;
> >
> > -     if (shm->flags & TEE_SHM_DMA_BUF) {
> > +     if (shm->flags & TEE_SHM_DMA_MEM) {
> > +#if IS_ENABLED(CONFIG_TEE_DMABUF_HEAPS)
>
> nit: this config check can be merged into the above if check.

No, because dma_free_pages() is only defined if
CONFIG_TEE_DMABUF_HEAPS is enabled.

>
> > +             struct tee_shm_dma_mem *dma_mem;
> > +
> > +             dma_mem =3D container_of(shm, struct tee_shm_dma_mem, shm=
);
> > +             p =3D dma_mem;
> > +             dma_free_pages(&teedev->dev, shm->size, dma_mem->page,
> > +                            dma_mem->dma_addr, DMA_BIDIRECTIONAL);
> > +#endif
> > +     } else if (shm->flags & TEE_SHM_DMA_BUF) {
>
> Do we need a similar config check for this flag too?

No, because DMA_SHARED_BUFFER is selected, so the dma_buf functions are def=
ined.

Cheers,
Jens


>
> With these addressed, feel free to add:
>
> Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
>
> -Sumit
>
> >               struct tee_shm_dmabuf_ref *ref;
> >
> >               ref =3D container_of(shm, struct tee_shm_dmabuf_ref, shm)=
;
> > @@ -303,6 +319,71 @@ struct tee_shm *tee_shm_alloc_priv_buf(struct tee_=
context *ctx, size_t size)
> >  }
> >  EXPORT_SYMBOL_GPL(tee_shm_alloc_priv_buf);
> >
> > +#if IS_ENABLED(CONFIG_TEE_DMABUF_HEAPS)
> > +/**
> > + * tee_shm_alloc_dma_mem() - Allocate DMA memory as shared memory obje=
ct
> > + * @ctx:     Context that allocates the shared memory
> > + * @page_count:      Number of pages
> > + *
> > + * The allocated memory is expected to be lent (made inaccessible to t=
he
> > + * kernel) to the TEE while it's used and returned (accessible to the
> > + * kernel again) before it's freed.
> > + *
> > + * This function should normally only be used internally in the TEE
> > + * drivers.
> > + *
> > + * @returns a pointer to 'struct tee_shm'
> > + */
> > +struct tee_shm *tee_shm_alloc_dma_mem(struct tee_context *ctx,
> > +                                   size_t page_count)
> > +{
> > +     struct tee_device *teedev =3D ctx->teedev;
> > +     struct tee_shm_dma_mem *dma_mem;
> > +     dma_addr_t dma_addr;
> > +     struct page *page;
> > +
> > +     if (!tee_device_get(teedev))
> > +             return ERR_PTR(-EINVAL);
> > +
> > +     page =3D dma_alloc_pages(&teedev->dev, page_count * PAGE_SIZE,
> > +                            &dma_addr, DMA_BIDIRECTIONAL, GFP_KERNEL);
> > +     if (!page)
> > +             goto err_put_teedev;
> > +
> > +     dma_mem =3D kzalloc(sizeof(*dma_mem), GFP_KERNEL);
> > +     if (!dma_mem)
> > +             goto err_free_pages;
> > +
> > +     refcount_set(&dma_mem->shm.refcount, 1);
> > +     dma_mem->shm.ctx =3D ctx;
> > +     dma_mem->shm.paddr =3D page_to_phys(page);
> > +     dma_mem->dma_addr =3D dma_addr;
> > +     dma_mem->page =3D page;
> > +     dma_mem->shm.size =3D page_count * PAGE_SIZE;
> > +     dma_mem->shm.flags =3D TEE_SHM_DMA_MEM;
> > +
> > +     teedev_ctx_get(ctx);
> > +
> > +     return &dma_mem->shm;
> > +
> > +err_free_pages:
> > +     dma_free_pages(&teedev->dev, page_count * PAGE_SIZE, page, dma_ad=
dr,
> > +                    DMA_BIDIRECTIONAL);
> > +err_put_teedev:
> > +     tee_device_put(teedev);
> > +
> > +     return ERR_PTR(-ENOMEM);
> > +}
> > +EXPORT_SYMBOL_GPL(tee_shm_alloc_dma_mem);
> > +#else
> > +struct tee_shm *tee_shm_alloc_dma_mem(struct tee_context *ctx,
> > +                                   size_t page_count)
> > +{
> > +     return ERR_PTR(-EINVAL);
> > +}
> > +EXPORT_SYMBOL_GPL(tee_shm_alloc_dma_mem);
> > +#endif
> > +
> >  int tee_dyn_shm_alloc_helper(struct tee_shm *shm, size_t size, size_t =
align,
> >                            int (*shm_register)(struct tee_context *ctx,
> >                                                struct tee_shm *shm,
> > diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
> > index f17710196c4c..e46a53e753af 100644
> > --- a/include/linux/tee_core.h
> > +++ b/include/linux/tee_core.h
> > @@ -29,6 +29,8 @@
> >  #define TEE_SHM_POOL         BIT(2)  /* Memory allocated from pool */
> >  #define TEE_SHM_PRIV         BIT(3)  /* Memory private to TEE driver *=
/
> >  #define TEE_SHM_DMA_BUF              BIT(4)  /* Memory with dma-buf ha=
ndle */
> > +#define TEE_SHM_DMA_MEM              BIT(5)  /* Memory allocated with =
*/
> > +                                     /* dma_alloc_pages() */
> >
> >  #define TEE_DEVICE_FLAG_REGISTERED   0x1
> >  #define TEE_MAX_DEV_NAME_LEN         32
> > @@ -310,6 +312,9 @@ void *tee_get_drvdata(struct tee_device *teedev);
> >   */
> >  struct tee_shm *tee_shm_alloc_priv_buf(struct tee_context *ctx, size_t=
 size);
> >
> > +struct tee_shm *tee_shm_alloc_dma_mem(struct tee_context *ctx,
> > +                                   size_t page_count);
> > +
> >  int tee_dyn_shm_alloc_helper(struct tee_shm *shm, size_t size, size_t =
align,
> >                            int (*shm_register)(struct tee_context *ctx,
> >                                                struct tee_shm *shm,
> > --
> > 2.43.0
> >
