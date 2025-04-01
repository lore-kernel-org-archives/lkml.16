Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60976B673
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 08:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743496400; cv=none; b=KEP4zY4nn8ptwz56C3paCpVRPNaqtIDuXlpeOzChxmfhm1eaI5Obqh9IkVQq2tukcPoPQNt7p6ETm6qf9X4fcufXSfyEmTz5AjBpgC/eW4pxGhW1okYU6kDaS/VregbG1VREpJ+fqKkh6yKLP1E2MRTYXmKjLlpp3AurI0ahuko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743496400; c=relaxed/simple;
	bh=JzfIVhXtNLBrllzd82BMkqO/jFC8JCvh+Wx0t5e1bfA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZnlGQZ7b/tWw49SnGrTzRs920S+w649KVQQ3s46XoQhqFOoNRYHoKI+YP0Q4qS6eyizhSXgSrXzYeZqWSugkWDoabdOxbq0pJ2qJHNhAyEAz3xnl4la/+WozrbTovZlicT6MkMc74G712ab32uNtV+J/zmruhBK9KkINRePitWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mJM9Db3N; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mJM9Db3N"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-2c82007eaadso1606781fac.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 01:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743496396; x=1744101196; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/CPeJtNEQsuzyZj1LWzpLz2qGETWIvRqRfnm4VRDQlo=;
        b=mJM9Db3N38DN1o5vQBAtSjiqDgtGdIT9dRNL2RBvOR2HLhUYxM6Ikji/m1+XXp3VcG
         m6K29tPguvhKNSONgZdkxI+/g7YMbjoIijlhqvtU6qJAcal9S8O5u/YwJQVIISVX5gWw
         EkWDx4zqprKKhG4FHYXL0vq88PCLlnis3CDK22DOXk64Rdz6UTMuszJeKu/9XwwoMTKE
         ZTlqoX24my/IlNF6K9CP2mhxmHTtlG812T32HdKm/ajZ23Hzw1UfWYg9TTKjFVP/HWam
         tygxpKiDuHs7qEYUkxFLq9LljB4TKC8+tCKOg2JzOkGEm8LrpFUlO1pzbyPjuoTf0lXT
         XvxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743496396; x=1744101196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/CPeJtNEQsuzyZj1LWzpLz2qGETWIvRqRfnm4VRDQlo=;
        b=scfJXuN0fEX/Aqe2pmTXCdgjRatvGsRM1Cuke4Wz//jL+9GSlTATvsKmiM3BIWXuPk
         4MBKygBCFk6vvQ/oVOb9NnmK9sW6LMjfsMIFT9MfmdLQHMEjnBi2TaxpN1DOIZrJbe7C
         pKih/entrTSxwfzGBuS4xajGN7EogIyi6HyxtsjUgag1XVGTnttrNPRtuRZa9OapaIOz
         UOads1cohPZsapbXBYr4drDce0sOU+P7/2aj2Gkqqm/kblcYOzGkSpUt7EanuSMJvPyy
         wbT2YMxFZL+obyQ09BmDSisvsoGOzGPpEE6yw6q5/7xo8z1KPMqBfd620xrQn/u/KzRG
         AVvw==
X-Gm-Message-State: AOJu0Yygci1f6QUV4KIKU0FusAfobnWIXEPcS9odnQfwOsKX4CqsJasK
	D/NX4G9gaxC3Q1gMR5iPSzfkldAuzqgrWALi5k5qlN3bxb2/FJCeHg8Zb+uM+yrK85LvOYQvz3O
	9Kbb0gHqoHf2DXS8quScSgPhhBSuz40pUnPZN7A==
X-Gm-Gg: ASbGncsHZhSWTgNpNto9OW9ds/O+8CtrWmH/PSXtmn6cxN/XDmHc/gZYzr2gApilll7
	Rizi+5i1U3RvcL4XzFOki7UrKVEu8Pqxo9RaO1sUleHPxevRW+gZeGaF3PW+zppWS9CNCoLaDw0
	CaLVhaEDycsS6R7HWzKC+YNV6g+AA=
X-Google-Smtp-Source: AGHT+IH9KoU4vUjjPFFl/HpklAnLrv8QnpnI/vnq7QrGKUOSlwBJn74UzBQjYlMDiU71pl/whujtfshDhL1bJanCT0o=
X-Received: by 2002:a05:6870:7815:b0:2c1:9a53:83c4 with SMTP id
 586e51a60fabf-2cbcf755a40mr7187474fac.26.1743496396402; Tue, 01 Apr 2025
 01:33:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250305130634.1850178-1-jens.wiklander@linaro.org>
 <20250305130634.1850178-6-jens.wiklander@linaro.org> <Z-JOPgcWlpTlskgd@sumit-X1>
 <CAHUa44GjpHT5Nqo+Ar5jNYNPV-YJQYpLTCf=7oJ1o0VjP-t0nA@mail.gmail.com> <Z-ucuPzwz4IqVTgb@sumit-X1>
In-Reply-To: <Z-ucuPzwz4IqVTgb@sumit-X1>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 1 Apr 2025 10:33:04 +0200
X-Gm-Features: AQ5f1JrwSW9AJKXv4JPdCzTC-p9MDUHywS1_JUmGEaiaPvfsks0gIEo3VJPjUog
Message-ID: <CAHUa44FpsCVrbwj1=nsJVJFVJSF1kzKdWAkAMXRu6EdLrLvh8g@mail.gmail.com>
Subject: Re: [PATCH v6 05/10] tee: implement restricted DMA-heap
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
	Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 1, 2025 at 9:58=E2=80=AFAM Sumit Garg <sumit.garg@kernel.org> w=
rote:
>
> On Tue, Mar 25, 2025 at 11:55:46AM +0100, Jens Wiklander wrote:
> > Hi Sumit,
> >
>
> <snip>
>
> >
> > >
> > > > +
> > > > +#include "tee_private.h"
> > > > +
> > > > +struct tee_dma_heap {
> > > > +     struct dma_heap *heap;
> > > > +     enum tee_dma_heap_id id;
> > > > +     struct tee_rstmem_pool *pool;
> > > > +     struct tee_device *teedev;
> > > > +     /* Protects pool and teedev above */
> > > > +     struct mutex mu;
> > > > +};
> > > > +
> > > > +struct tee_heap_buffer {
> > > > +     struct tee_rstmem_pool *pool;
> > > > +     struct tee_device *teedev;
> > > > +     size_t size;
> > > > +     size_t offs;
> > > > +     struct sg_table table;
> > > > +};
> > > > +
> > > > +struct tee_heap_attachment {
> > > > +     struct sg_table table;
> > > > +     struct device *dev;
> > > > +};
> > > > +
> > > > +struct tee_rstmem_static_pool {
> > > > +     struct tee_rstmem_pool pool;
> > > > +     struct gen_pool *gen_pool;
> > > > +     phys_addr_t pa_base;
> > > > +};
> > > > +
> > > > +#if !IS_MODULE(CONFIG_TEE) && IS_ENABLED(CONFIG_DMABUF_HEAPS)
> > >
> > > Can this dependency rather be better managed via Kconfig?
> >
> > This was the easiest yet somewhat flexible solution I could find. If
> > you have something better, let's use that instead.
> >
>
> --- a/drivers/tee/optee/Kconfig
> +++ b/drivers/tee/optee/Kconfig
> @@ -5,6 +5,7 @@ config OPTEE
>         depends on HAVE_ARM_SMCCC
>         depends on MMU
>         depends on RPMB || !RPMB
> +       select DMABUF_HEAPS
>         help
>           This implements the OP-TEE Trusted Execution Environment (TEE)
>           driver.

I wanted to avoid that since there are plenty of use cases where
DMABUF_HEAPS aren't needed. This seems to do the job:
+config TEE_DMABUF_HEAP
+ bool
+ depends on TEE =3D y && DMABUF_HEAPS

We can only use DMABUF_HEAPS if the TEE subsystem is compiled into the kern=
el.

Cheers,
Jens
