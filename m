Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E8A19DF8D
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 03:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744775935; cv=none; b=Ly7yfjtbHF/2XpuN7Yxfhvk6PAIF4mJWVnmqIDzud7MYDDOx/YzBK1OgbTGQ/PyjyBpyv9du4iKBJjM20PWdR/3F3PUgynm+j1sONvj/S4zlHN5mVFu/KWv7kQpyvRPa/9BhSZHXvVbx8FN0zMS2oiYY0DcQ5iTiklu/NHiEGsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744775935; c=relaxed/simple;
	bh=/jNHeqelxuQoACbaXmWuUWs85LQe8P+MsreFE3ZURDM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HEPstOxStn16qykyYxkjrAwifFsxsulaVCgRftPiwyjkxUmBjUeE1ps+oId8QzSJQqvVm0sSnWrvtWG98QCqFrAvEPLw6UMxtJlG8W7NI3uZoqbYt8QfnZE9vS3tvWx23np81K6LxvgCgRYOZ50rII1Wq84r7xwsuEwFKNwPGw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Jfzy5SBJ; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Jfzy5SBJ"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-47666573242so263391cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 20:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744775932; x=1745380732; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TFabfu1YUr8Gpuaxg0bUAkmAqFwkoAZ83WLrOAJAIgA=;
        b=Jfzy5SBJrm00nzblcsCwOxXwMtqOXCWlfG4ur316TPCDmKp1FjL/QO3xvk+ItWDqJ2
         ggPQE5IjaraI0SYmXr/IjjlG1rftYvLnj0Qn++JSkiUjkP+QF4a7xwadDqSi3o2rXLwf
         lm/mONTBtxhH3AhJE+27TRdtIFK0mZuPU2b3iDDRS3JtFJZWX9QLQnxvnXKWTNkD0WHC
         GLSyWna9OZLv28aNi8XOLo87dcquQ8FUkkoyi1A41I3VMqPvJc/SJB6/BOFQnqxJYyDQ
         G4SBcRLW9xkSPGZUv2RvTQTRLemrx+qC/GnI54PDeKsQxKFmfnIvnaipYk8KUIfeWz0l
         6HYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744775932; x=1745380732;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TFabfu1YUr8Gpuaxg0bUAkmAqFwkoAZ83WLrOAJAIgA=;
        b=d/hdOjoPH9SwIstcmza48Ji9DGj0fAX79EMz/dAYEoJgDpJ3ekRRIcObxSoD0B5o8p
         5RyUa6RO2/XiMDAT0ZUXxWtwpCfku+mL1ru5AGOQFDImc0tWdHxT5YcxijFB9Vvhbldb
         InNCC1igVkp1XvU0hwehtREYHfglyiUnn4aILnx/ZT7quxTaTGgPqQ2Tpearv0Qz95+Q
         UgL89/lh1bDcryE34m71z1hIojWtEPAHyoa2jJ7eUqBkr2bZFyBJPMpVFGEeqNK/UuK1
         bQUmiXwh7icaVuTh5gLQn7gt8wK9VtoEVWszeasJwhC6/hhiCtO5NsTvnicxgccKHVCK
         H/2g==
X-Forwarded-Encrypted: i=1; AJvYcCX36xmT5g9ETPY0usnrv0nDTZnSvJ0bFB35F7yCH69ZU0yYsfZBPE1E+DCNL5pssZ3Uysws7z5Qjb8EufE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeiZvocjBX4OYIjmDXXSFdWnrrwIA1AOwMww1ZPCrsvEyQTAPZ
	++pR/U3GInQxyYRf82VpVWkpDJy+2v+w3KcYVJBim2VTFsqQvmcI41Y9eXc1FQxM5yYqb0ihmOC
	UBcKMRCVdgV6KZo4K6H28892L19aoAyLEtbuX
X-Gm-Gg: ASbGnctUL9HsyfvScj6g1x4YRbIeN1PQLidiubZNA/svxWZ4fAroyd9ElGwfsk9QeFY
	z4S2Z6pi8Cf/XKfNntI8hvP6heoulqEYhrxeqmAJTMPh20X3HJXqmymcAKnhgQSZtEU3NppTSLv
	YiSMwkuCzeNFzbhRt+2fhFkL84egY9wy1x0azP0RFoB652ujpug3KUqA0n
X-Google-Smtp-Source: AGHT+IGeOWFg3oYjRQF/8DYP6nBlgJnhbE7CLdjFrvnB17no8ih232I0TwalyaJOkOjEzNnrhqtwOr+YIgZVqCq+nEI=
X-Received: by 2002:ac8:7dc1:0:b0:466:8c23:823a with SMTP id
 d75a77b69052e-47ad7ad737cmr339751cf.17.1744775932099; Tue, 15 Apr 2025
 20:58:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250415171954.3970818-1-jyescas@google.com> <CGME20250415205720epcas1p4a8bbb4ff1ad221a72776694d08801368@epcas1p4.samsung.com>
 <CABdmKX3Ht=bCcPFxK5mGX2qD4riXQ7Ucw6H_-+1PupXy-1ABGQ@mail.gmail.com> <106c301dbae77$414454a0$c3ccfde0$@samsung.com>
In-Reply-To: <106c301dbae77$414454a0$c3ccfde0$@samsung.com>
From: Juan Yescas <jyescas@google.com>
Date: Tue, 15 Apr 2025 20:58:40 -0700
X-Gm-Features: ATxdqUHh7qbmy3C_xdgIq0V1oTSEWDrnu_ijLPdQUZ9_-V5qyO1ldD2Pd_jbOZU
Message-ID: <CAJDx_riYc2GRpcmf5RH8mwJQ-ehh7+JA+tQ__vX1Qsm1HJo9OQ@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: heaps: Set allocation orders for larger page sizes
To: =?UTF-8?B?6rmA7J6s7JuQ?= <jaewon31.kim@samsung.com>
Cc: "T.J. Mercier" <tjmercier@google.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
	baohua@kernel.org, dmitry.osipenko@collabora.com, Guangming.Cao@mediatek.com, 
	surenb@google.com, kaleshsingh@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 7:28=E2=80=AFPM =EA=B9=80=EC=9E=AC=EC=9B=90 <jaewon=
31.kim@samsung.com> wrote:
>
>
>
> > -----Original Message-----
> > From: T.J. Mercier [mailto:tjmercier@google.com]
> > Sent: Wednesday, April 16, 2025 5:57 AM
> > To: Juan Yescas <jyescas@google.com>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>; Benjamin Gaignard
> > <benjamin.gaignard@collabora.com>; Brian Starkey <Brian.Starkey@arm.com=
>;
> > John Stultz <jstultz@google.com>; Christian K=C3=B6nig
> > <christian.koenig@amd.com>; linux-media@vger.kernel.org; dri-
> > devel@lists.freedesktop.org; linaro-mm-sig@lists.linaro.org; linux-
> > kernel@vger.kernel.org; baohua@kernel.org; dmitry.osipenko@collabora.co=
m;
> > jaewon31.kim@samsung.com; Guangming.Cao@mediatek.com; surenb@google.com=
;
> > kaleshsingh@google.com
> > Subject: Re: [PATCH] dma-buf: heaps: Set allocation orders for larger p=
age
> > sizes
> >
> > On Tue, Apr 15, 2025 at 10:20=E2=80=AFAM Juan Yescas <jyescas@google.co=
m> wrote:
> > >
> > > This change sets the allocation orders for the different page sizes
> > > (4k, 16k, 64k) based on PAGE_SHIFT. Before this change, the orders fo=
r
> > > large page sizes were calculated incorrectly, this caused system heap
> > > to allocate from 2% to 4% more memory on 16KiB page size kernels.
> > >
> > > This change was tested on 4k/16k page size kernels.
> > >
> > > Signed-off-by: Juan Yescas <jyescas@google.com>
> >
> > I think "dma-buf: system_heap:" would be better for the subject since t=
his
> > is specific to the system heap.
> >
> > Would you mind cleaning up the extra space on line 321 too?
> > @@ -318,7 +318,7 @@ static struct page
> > *alloc_largest_available(unsigned long size,
> >         int i;
> >
> >         for (i =3D 0; i < NUM_ORDERS; i++) {
> > -               if (size <  (PAGE_SIZE << orders[i]))
> > +               if (size < (PAGE_SIZE << orders[i]))
> >
> > With that,
> > Reviewed-by: T.J. Mercier <tjmercier@google.com>
> >
> > Fixes: d963ab0f15fb ("dma-buf: system_heap: Allocate higher order pages=
 if
> > available") is also probably a good idea.
> >
>
>
> Hi Juan.
>
> Yes. This system_heap change should be changed for 16KB page. Actually,
> we may need to check other drivers using page order number. I guess
> gpu drivers may be one of them.
>

Thanks Jaewon for pointing it out. We'll take a look at the GPU drivers to =
make
sure that they are using the proper page order.

> > > ---
> > >  drivers/dma-buf/heaps/system_heap.c | 9 ++++++++-
> > >  1 file changed, 8 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/dma-buf/heaps/system_heap.c
> > > b/drivers/dma-buf/heaps/system_heap.c
> > > index 26d5dc89ea16..54674c02dcb4 100644
> > > --- a/drivers/dma-buf/heaps/system_heap.c
> > > +++ b/drivers/dma-buf/heaps/system_heap.c
> > > @@ -50,8 +50,15 @@ static gfp_t order_flags[] =3D {HIGH_ORDER_GFP,
> > HIGH_ORDER_GFP, LOW_ORDER_GFP};
> > >   * to match with the sizes often found in IOMMUs. Using order 4 page=
s
> > instead
> > >   * of order 0 pages can significantly improve the performance of man=
y
> > IOMMUs
> > >   * by reducing TLB pressure and time spent updating page tables.
> > > + *
> > > + * Note: When the order is 0, the minimum allocation is PAGE_SIZE.
> > > + The possible
> > > + * page sizes for ARM devices could be 4K, 16K and 64K.
> > >   */
> > > -static const unsigned int orders[] =3D {8, 4, 0};
> > > +#define ORDER_1M (20 - PAGE_SHIFT)
> > > +#define ORDER_64K (16 - PAGE_SHIFT)
> > > +#define ORDER_FOR_PAGE_SIZE (0)
> > > +static const unsigned int orders[] =3D {ORDER_1M, ORDER_64K,
> > > +ORDER_FOR_PAGE_SIZE};
> > > +
> > >  #define NUM_ORDERS ARRAY_SIZE(orders)
> > >
> > >  static struct sg_table *dup_sg_table(struct sg_table *table)
> > > --
> > > 2.49.0.604.gff1f9ca942-goog
> > >
>
>
