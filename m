Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB67C1DE3DF
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 10:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746439228; cv=none; b=C1my5fqXtkGokjdIlgEzv68QKXQuwEfcIdhjc8C38Nx4JOT1Fq8pnQS4fNHNavNSluTQaBowyMVKvbt2wQYA7yKoTfS5aSgfG0R55MG4AJHxFNSid91TXjwkO9jOXipdevishGGnawLkXeLzCUOMoqJuCrPOK1AeFcHgoHCXTkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746439228; c=relaxed/simple;
	bh=Km+TINB0CWZALLBWBc4SAkK6bvOGzq+9JbzdiYWHnJo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N786V8hEy7/wrP1O16T59SeiLD41r5loBHq++jHY8JjcE5MeYXzXv2Q4zRS9BV5EnxC15MuQtrKYxoUV8jL1XvM/hcfuBp9Pmz1GmFHfpwSLwJVoalkr7jHL+2QjdHbBizV+7e5KJwqRm8cvk75DTrra9bb5lKz87DyBsnWesSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xwXSHwK4; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xwXSHwK4"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6065796762fso975469eaf.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 03:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746439226; x=1747044026; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qUO+n2qCCkVBKkF0xc34yA7zFKP1PRXVjAuF6gNjM7w=;
        b=xwXSHwK48G55FvSM1aSJu9ewd6VXQMmIjzn0MWaGFz0p37zpKtfRfB9IkrxmQHrnXe
         WJR2hQG0tZjkn68ZtsEaivcbVire5zRTBmkHnWEtyU6hdqxqipJ8ii+TRpMOd6KISsOd
         19YxWHtn2IbgGy2tC4/JlO/En1mG5fUh6ESMfaZHozeVeyrlcXANLQPYvYDeSzVFqN1y
         mdrJ9w5FPq5AQ0G9AcDRLklxVqAUP7PrUVeKxhBaWpvfSrEhpY+PLRhrESgR4E80rAPr
         h9WNpr0IM6hgrKbdEPUiYS1A4ztWsbofxVBh/+37IK9gpCzs70ZBilZrpm+al0dwqfYs
         DThA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746439226; x=1747044026;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qUO+n2qCCkVBKkF0xc34yA7zFKP1PRXVjAuF6gNjM7w=;
        b=r9r1irMEjB3fK7cTnmU7F+1H6NYLnivsT3u2QDfNG2ZD2VI7fcz5Ee1KIZ0rtRnNpd
         3RwH1aL4d0w6tQCTpwBAdjVQdvPwRouf5xhp2y5Y87r+zsZEksXqe5oKRyy1PInMIrfS
         +YXmKrFTisxghG0fsJOp/yN5uQSFwLyI9c/hRz6qGZrsCRp84HG+ilt+FJeaU2WKl3Va
         /TG07IYR04TAO5wMZYSUvFw5sGpiEsE3XlwepqEBQOQyT1JBj+HHDk4tv2RDG2q3UZkn
         Kp/TWC05H/c0Q+yndMiTvodYtr+Gtd0/1UgE0x/Z3waqjF72bbVamZYHBWVkRBnUhJEF
         ShaQ==
X-Gm-Message-State: AOJu0YzqWXnubX1xDgP3UIg5gnqMFt4gbEBLfOaspdrQkLZRuCsoOSEl
	1ldrSgvmG4dxEAC0AJJq2DsEk7EIKjXFIunoZT9eCBAVs7STPBf6lBEuBQf4XJvdgVDPSPLcpIC
	qwUtv3XzXbxE9E90rzKlIjunqYzohAx0XYzDd+A==
X-Gm-Gg: ASbGncvup7pNikW1wyU6js98RV0s3UXZl1qYjiUcs7UWr9i0cPauPrqqWpKEdlgy931
	vvm5bpbayCNgZdo8Qw0SRSnzKtedF5CJ7w9V05+igrMefvnS+RsVbMK/I303aEJbftPJL2Nqmyf
	KKABjhSWVp2ZAIQuyq/bHBQCc=
X-Google-Smtp-Source: AGHT+IEfTkbjK5JWEDIXSUVf0w92h26obU5oYSgxTn7TbvfY+I0Zkozng+KfK0iBSmGp52i/r+Q8MQct9dxWARB5Up4=
X-Received: by 2002:a05:6870:972c:b0:2d5:230f:b34d with SMTP id
 586e51a60fabf-2dae82cc070mr3868126fac.1.1746439225695; Mon, 05 May 2025
 03:00:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250502100049.1746335-1-jens.wiklander@linaro.org>
 <20250502100049.1746335-11-jens.wiklander@linaro.org> <43e85d6a-ef99-4d61-910e-1d62814fd9ed@arm.com>
In-Reply-To: <43e85d6a-ef99-4d61-910e-1d62814fd9ed@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 5 May 2025 12:00:12 +0200
X-Gm-Features: ATxdqUFPin2MFa6t0S3tPjOQfIF3WcjTWu_QNb2z1h_FFrZyFMNu2bu0GEdtH9Y
Message-ID: <CAHUa44GC-HRUNGkta-EfMD00VzPBvqcVqU4Zj7kvW8CPnahdMg@mail.gmail.com>
Subject: Re: [PATCH v8 10/14] dma-contiguous: export dma_contiguous_default_area
To: Robin Murphy <robin.murphy@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
	Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Sumit Garg <sumit.garg@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com, 
	Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>, 
	Rouven Czerwinski <rouven.czerwinski@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	iommu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, May 2, 2025 at 3:11=E2=80=AFPM Robin Murphy <robin.murphy@arm.com> =
wrote:
>
> On 02/05/2025 10:59 am, Jens Wiklander wrote:
> > Export the global variable dma_contiguous_default_area so
> > dev_get_cma_area() can be called a module.
>
> What dma_map_ops implementation is in a module? Without any other
> context, I can't help thinking this smells of something sketchy.

I see that you found the rest of the patch set
https://lore.kernel.org/lkml/20250502100049.1746335-1-jens.wiklander@linaro=
.org/

Thanks,
Jens


>
> Thanks,
> Robin.
>
> > Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> > Cc: Robin Murphy <robin.murphy@arm.com>
> > Cc: iommu@lists.linux.dev
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> >   kernel/dma/contiguous.c | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
> > index 8df0dfaaca18..eb361794a9c5 100644
> > --- a/kernel/dma/contiguous.c
> > +++ b/kernel/dma/contiguous.c
> > @@ -53,6 +53,7 @@
> >   #endif
> >
> >   struct cma *dma_contiguous_default_area;
> > +EXPORT_SYMBOL(dma_contiguous_default_area);
> >
> >   /*
> >    * Default global CMA area size can be defined in kernel's .config.
