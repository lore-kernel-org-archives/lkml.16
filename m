Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218B71AD3E0
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 06:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747897006; cv=none; b=ZfVxg+1Osj1EomZ7YLsobbNzJPCv9bob7JlRCmwaCCwsMc7TvoEzWRlZafwk+4Aqkr/wXNz3NOkiPXzlM/dMuiQphO9Ym0glJprQU7xgF83uRRYHfJ1I+X71G0x3By/9FBQURAziOEMpmqayccegIAL0lfjf531KPz62/fWFiGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747897006; c=relaxed/simple;
	bh=Kz9JL8AUUhRuVWZMu/WcSf6wS1Z8DinfpEJQ6LTfN3o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CDZFGfTOUIe5NoJ/nXsIBFC8GHMdcZrkDk/mCUrP7a+NyFKJB77AsWCNc5pJ/uUmCwY/gFONegs9NIvxdHICx5YU/MgiY7FoYUmO/v3mSRcexu0X/d/3vJIdKoHDM44q2ubNZC6KxThTOtdhiR48DpiIbPAZ3L3BMbdpiHxPaio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n59AH3V7; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n59AH3V7"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3fa6c54cdb2so6278765b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 23:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747897003; x=1748501803; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WeKMC6ZBMvoz5mZGPjKGgi0Ohr2T8fh1E4A0BZHhyCM=;
        b=n59AH3V7PJX9TvuA4qHYxM1uXa+y+0lcrIvNRSecj+1dDQljKtZF8UxqpaDdzvnOEP
         YVpgVM4lDbOtdhTFNfH+6vBpsbSbE+a1SQJws/AiY7evsD5PUQbodGA1G8FE/iyXAlls
         vg7wZtakWo034zGo+NTF2JTq8homl4z71fk2ddBLGFx8z2+lzGbIiPPgXsd8g0gbFnCk
         BW+c7aF3ALWpjas2Mt1wKa+C18QlwDiTKbD4WJoimSI4XYnWO2AmUXFLBqV8vyX2BeeW
         5qKxrWk7BVI2XuUmPTEEogdcXYlI7fK9YnYVYvIGYOrkpV+JGq4aRr0rlZPzdOQCsWx8
         QWjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747897003; x=1748501803;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WeKMC6ZBMvoz5mZGPjKGgi0Ohr2T8fh1E4A0BZHhyCM=;
        b=q8OmLNhr8NFckh52DAk8ypaD+e5ZB3pMfEWBb4A9ozH7UZBhO8UnV7GDArUpQuqdYh
         vexeQQqPX2OyMEcmGZSSW8RGCaL0s9x60VbFtw6LGVpOViZry0+ZvzoYmdNT7iyG+mc+
         5BNTQ9Q/WrqB0TWIrbksJkKZEIHyBuotiIrEqFvyDbZPj/9M3wmEqXm/KgKbl+hpseT+
         wKZ+MRbaOIrPbkZj+OdVfi1bWYdcM+j9hPs9IgdUem/FyGYdsa1mvwNOBojxrKjwbijl
         IL/Y8mViE+Ac7fZQuv9oA2kAvHZIKG4H9aSUuBcqdr5OL0hq0X3AVjZCGOL33ecTFxoW
         T5Rg==
X-Gm-Message-State: AOJu0YwY0A3BP/W7LOcqI+FuI0HWbOGkimEehbDY1gCTnQSn+AgOJ09D
	+J2WFdFvuhmVN53InfGXW9yGOKKTnQydXTGy3KZDPQco6QahgKx9aBJ6SQ7AyUqawoPCvTDJNsw
	lM/Lsm39k7kgd8DzoanvxMBm0Wi9Oh8ZTJBSpZxuseA==
X-Gm-Gg: ASbGnctlb/ngfAt9ChITcVt2hMDi1pevr1jP6VsdxaPS00kkj2YQKVQYDK2CVviR0rV
	st3pAIeNDiZ9Gw7kMiuMYY6NRDhPavA4DAJ6ZPAMzKcI7I5dgBIZ2B8hMCHuiB12Nk0WGP3NA3B
	Y+EIqqHCT31jvYCKEK//fOBJo4WEu5T1+BMQ==
X-Google-Smtp-Source: AGHT+IHkFUemf1YsBa7Ra5vRLLSyYkClMUJvfuEYqOo7C5Q/HY7RUEskcqp+LiC0Z8m9NvJveoTaK0UdZlaYOd03Who=
X-Received: by 2002:a05:6808:6410:b0:3f7:ff67:1d8c with SMTP id
 5614622812f47-404d88d532amr14478281b6e.36.1747897003075; Wed, 21 May 2025
 23:56:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520152436.474778-1-jens.wiklander@linaro.org>
 <20250520152436.474778-3-jens.wiklander@linaro.org> <dffbd709-def0-47af-93ff-a48686f04153@amd.com>
In-Reply-To: <dffbd709-def0-47af-93ff-a48686f04153@amd.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 22 May 2025 08:56:31 +0200
X-Gm-Features: AX0GCFsuHYqDh1JYpWH8r8xDir4J3V2XXHJjiARqLynYHFcDQxMIIZpQ5oYhZd4
Message-ID: <CAHUa44Ec0+GPoDkcEG+Vg9_TY1NC=nh3yr0F=ezHMbaeX_A0Bg@mail.gmail.com>
Subject: Re: [PATCH v9 2/9] dma-buf: dma-heap: export declared functions
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
	Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	Sumit Garg <sumit.garg@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com, 
	Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>, 
	Rouven Czerwinski <rouven.czerwinski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 9:13=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 5/20/25 17:16, Jens Wiklander wrote:
> > Export the dma-buf heap functions declared in <linux/dma-heap.h>.
>
> That is what this patch does and that should be obvious by looking at it.=
 You need to explain why you do this.
>
> Looking at the rest of the series it's most likely ok, but this commit me=
ssage should really be improved.

I'm considering something like this for the next version:
Export the dma-buf heap functions declared in <linux/dma-heap.h> to allow
them to be used by kernel modules. This will enable drivers like the OP-TEE
driver, to utilize these interfaces for registering and managing their
specific DMA heaps.

Thanks,
Jens

>
> Regards,
> Christian.
>
> >
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> >  drivers/dma-buf/dma-heap.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> > index 3cbe87d4a464..cdddf0e24dce 100644
> > --- a/drivers/dma-buf/dma-heap.c
> > +++ b/drivers/dma-buf/dma-heap.c
> > @@ -202,6 +202,7 @@ void *dma_heap_get_drvdata(struct dma_heap *heap)
> >  {
> >       return heap->priv;
> >  }
> > +EXPORT_SYMBOL(dma_heap_get_drvdata);
> >
> >  /**
> >   * dma_heap_get_name - get heap name
> > @@ -214,6 +215,7 @@ const char *dma_heap_get_name(struct dma_heap *heap=
)
> >  {
> >       return heap->name;
> >  }
> > +EXPORT_SYMBOL(dma_heap_get_name);
> >
> >  /**
> >   * dma_heap_add - adds a heap to dmabuf heaps
> > @@ -303,6 +305,7 @@ struct dma_heap *dma_heap_add(const struct dma_heap=
_export_info *exp_info)
> >       kfree(heap);
> >       return err_ret;
> >  }
> > +EXPORT_SYMBOL(dma_heap_add);
> >
> >  static char *dma_heap_devnode(const struct device *dev, umode_t *mode)
> >  {
>
