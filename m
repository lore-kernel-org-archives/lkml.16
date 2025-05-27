Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5959D19E7F9
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 15:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748358455; cv=none; b=bEQO/L9izr4xfWe8EXfKj3+bGtwYIKG+t1RbSY39CjQA3t0bUktj7NUPELpqSFpkBVYujLQl+papL6NSnmr2FKxixgkg912GnhL1Qw0/liNZTkN8KX5GP9ukMFwzebLvzaFTzAoUbMBOzTqu7J2PiQcopcfiys6dtqIcvU7/sZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748358455; c=relaxed/simple;
	bh=pUaNeTHTCwKFPAoMIgJmb5zAeyUnC0gPJ5nIg5WMFEs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y5RjyztUZ1RAcWxBHOehhcDXGCfBRqE9mF1SAFomeE7sgJv/v+pjYO9M3d9Ig6nr7a6PrSXQ1d7gCIusKdrfOauESgRvYuGMtlcxd75XF/x4DVGy5ZTZfKKtrbFXYvva2NLRN4CnPaZg6eUU536CHgBWIFDOyFyAKhHF4vQsejs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ITMeFhf7; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ITMeFhf7"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6065803ef35so715835eaf.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 08:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748358452; x=1748963252; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4HvNpqBKFOVDi+Mx9KGaepBPynHnQJMRXklI5JhKtbg=;
        b=ITMeFhf7EM7SPiwjbX3ys37gJh1R3yyljtbFwVkWbQzSFHKLzrwV8RFHeFQTUu5KHp
         30TMmrTu6ooC5GLUBA3BV8pkUcHTdeV1vSap4BAtdnSL3IBB4D/jGzjx5WOFltnoeECB
         YsfpEn3FGD+oFm4b4bwDeZHG0EmkNDfrPc7BkZHR4pdVy/WFMSHCgkkxuoh41887oQ9V
         jBUcmQ86o7HQOZZbLWSs2t48OB16eO0lkL7+jCLO6q1t/LO63v4zEuwGuIlRxM+18BTr
         X05yYFJs+08cd9t3MSM+KTH56Wr1K7x9IBBN+LG00SdPWBKR6wdntS5rK/0kEd1kImWx
         uapQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748358452; x=1748963252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4HvNpqBKFOVDi+Mx9KGaepBPynHnQJMRXklI5JhKtbg=;
        b=QDXf2i60AlgjyCKAAcgdqX39aYSKWP0zvN5USzDRMM/6O7XasBzgBw9RywlbyHh1dY
         o+xFxx0QYDQ1b0Eu2FR31SuQlyuLA/H4kAnFe/8/e6ZygfHtsbDWWipxqBIISwoz2h53
         +RAjGDmuGnaR9EOrLi+IfjlsoELlN0MXmqW74BJ3ElJtdnDy2jJK/TgKkFQDHRrnnrMW
         cHL4Zj06xGAX2cYqiIQBLV9dANAPMJLtiEG3eS0C+IMkwIEqhX1eVxWFOqa8IxOEpt45
         BfFczQTJZVMMo2u7T/e/5CIIFDzMHysQWoGHxYcL6X+eFjfigaJ61Ss/Q7PXDhnMjArj
         YapA==
X-Gm-Message-State: AOJu0Ywr2u6qlyeKMJb+IQobVIn5dsDPFZURs/MxwP7C1m1+5vD6Aa1v
	5i6U88kCnwMZL2nvdN2iyA2abtf9MmgS+jJUhe2OMhiqER4rigO1RxBWGctWwl1Cy/sArC27+Y9
	PyizsDQoIt0aNwk2wCQ06e3OuEFQhi/LSQIfuhKACUA==
X-Gm-Gg: ASbGncvkUCsWk929p+zX/mwYlwCCkIUpKCYDaxjWPzsj9uy2GyyczGy/Yxni9Hbw2Ls
	PthrvjqCtWB8I/19fxQLDi6Q8rgCJSMkkcuD1aLQfHxgbqxBeV1KE4rfdCRbNfFM5JSJP59L/3V
	wGGO4haXh4aLqGjUgYH8XaQ0c//RYMcDd8ow==
X-Google-Smtp-Source: AGHT+IHcnwyoLk78Sdyqna09vDLwno8N4DKtCoMRIDEgmxMn5EJ8+I+135oFuaEbt0jukPgDX+G63PqFO04gyL6xVSo=
X-Received: by 2002:a05:6820:2610:b0:5fe:9edb:eafe with SMTP id
 006d021491bc7-60b9fba1696mr6694046eaf.5.1748358452253; Tue, 27 May 2025
 08:07:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520152436.474778-1-jens.wiklander@linaro.org>
 <20250520152436.474778-9-jens.wiklander@linaro.org> <aDQhn9_fezC42GwS@sumit-X1>
In-Reply-To: <aDQhn9_fezC42GwS@sumit-X1>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 27 May 2025 17:07:18 +0200
X-Gm-Features: AX0GCFv4xwxS381XBNqHvZmFreXW7Y4SbgNJb3O8wPMOP2rKatTJj8xDdz14iuA
Message-ID: <CAHUa44HFPu87JCHDxu6HWAp6YaXrHFwi55JHTb9X=JvTz30XpA@mail.gmail.com>
Subject: Re: [PATCH v9 8/9] optee: FF-A: dynamic protected memory allocation
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

On Mon, May 26, 2025 at 10:09=E2=80=AFAM Sumit Garg <sumit.garg@kernel.org>=
 wrote:
>
> On Tue, May 20, 2025 at 05:16:51PM +0200, Jens Wiklander wrote:
> > Add support in the OP-TEE backend driver dynamic protected memory
> > allocation with FF-A.
> >
> > The protected memory pools for dynamically allocated protected memory
> > are instantiated when requested by user-space. This instantiation can
> > fail if OP-TEE doesn't support the requested use-case of protected
> > memory.
> >
> > Restricted memory pools based on a static carveout or dynamic allocatio=
n
> > can coexist for different use-cases. We use only dynamic allocation wit=
h
> > FF-A.
> >
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
[...]
> > +static int optee_ffa_protmem_pool_init(struct optee *optee, u32 sec_ca=
ps)
> > +{
> > +     enum tee_dma_heap_id id =3D TEE_DMA_HEAP_SECURE_VIDEO_PLAY;
> > +     struct tee_protmem_pool *pool;
> > +     int rc =3D 0;
> > +
> > +     if (sec_caps & OPTEE_FFA_SEC_CAP_PROTMEM) {
> > +             pool =3D optee_protmem_alloc_dyn_pool(optee, id);
> > +             if (IS_ERR(pool))
> > +                     return PTR_ERR(pool);
> > +
> > +             rc =3D tee_device_register_dma_heap(optee->teedev, id, po=
ol);
> > +             if (rc)
> > +                     pool->ops->destroy_pool(pool);
> > +     }
> > +
> > +     return rc;
> > +}
> > +
> >  static int optee_ffa_probe(struct ffa_device *ffa_dev)
> >  {
> >       const struct ffa_notifier_ops *notif_ops;
> > @@ -918,7 +1057,7 @@ static int optee_ffa_probe(struct ffa_device *ffa_=
dev)
> >                                 optee);
> >       if (IS_ERR(teedev)) {
> >               rc =3D PTR_ERR(teedev);
> > -             goto err_free_pool;
> > +             goto err_free_shm_pool;
> >       }
> >       optee->teedev =3D teedev;
> >
> > @@ -965,6 +1104,9 @@ static int optee_ffa_probe(struct ffa_device *ffa_=
dev)
> >                              rc);
> >       }
> >
> > +     if (optee_ffa_protmem_pool_init(optee, sec_caps))
>
> Let's add a Kconfig check for DMABUF heaps support here as well.

I prefer complaining in the log if there's something wrong with the
configuration.

>
> > +             pr_info("Protected memory service not available\n");
> > +
[...]
> > +static int init_dyn_protmem(struct optee_protmem_dyn_pool *rp)
> > +{
> > +     int rc;
> > +
> > +     rp->protmem =3D tee_shm_alloc_dma_mem(rp->optee->ctx, rp->page_co=
unt);
> > +     if (IS_ERR(rp->protmem)) {
> > +             rc =3D PTR_ERR(rp->protmem);
> > +             goto err_null_protmem;
> > +     }
> > +
> > +     /*
> > +      * TODO unmap the memory range since the physical memory will
> > +      * become inaccesible after the lend_protmem() call.
>
> Let's ellaborate this comment to also say that unmap isn't strictly
> needed here in case a platform supports hypervisor in EL2 which can
> perform unmapping as part for memory lending to secure world as that
> will avoid any cache pre-fetch of memory lent to secure world.
>
> With that I can live with this as a ToDo in kernel which can be
> implemented once we see platforms requiring this change to happen.

OK, I'll add something.

[...]
> > +
> > +struct tee_protmem_pool *optee_protmem_alloc_dyn_pool(struct optee *op=
tee,
> > +                                                   enum tee_dma_heap_i=
d id)
> > +{
> > +     struct optee_protmem_dyn_pool *rp;
> > +     u32 use_case =3D id;
>
> Here we can get rid of redundant extra variable with s/id/use_case/.

OK, I'll update.

Cheers,
Jens
