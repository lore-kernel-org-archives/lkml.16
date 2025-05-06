Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D68C76410
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 06:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746514234; cv=none; b=X51Eot9bGnlTTfdOTT1iXBjNdOb+VOQRSkC+LE/sTGf3/m9EfGtmkBNbz85PJyic8eIWlv3EK9MLrZh1Qa0xs5dQiZHRkJ1xL63HMHG3BI673/e0HdshVb2lzhWVNJ2rzcOd8o1jbfK3qXgmfnFohlgXm9Sctcg1cRuUJdil1Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746514234; c=relaxed/simple;
	bh=ep43/qWrZUzx9hnGwWmsp/LpXI1rag15V9ecAQ+cc+I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aqKAl5GfpgaVuLHm3yU0ZpKOoYcX5PJ+uet/0CDaYeKA4YKCvnctSZ+LB1/6g6qABapR7PkANt65isZNhEqPuzJ2xtv/2/xEc1RKnXfhYfWr6mh4f330OkYOfFHKylT1r7bipWzD3XHTisAQmG/NWU3+wrt12vYOaHAip5ztStE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OLT5cdvo; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OLT5cdvo"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7301c227512so3705422a34.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 23:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746514231; x=1747119031; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P+rnsBrnSg8rRMbhF6ZzJCKOKKucd9+x+mvQiH4XndI=;
        b=OLT5cdvoBuaRrrA8qutLjPJsFehLz7FzJr0voag8pJQsAmmn2rFdH7n3l3rpdUt/J2
         NrW+ztktVpfhGEP4CoBMfwjJNNqtzBTH3Zi96iST1GnuRHDzi6r77iiGGlE1LuwOSNBH
         f0rnyezAfEMHytcekQkyz5Np41fsubOhfGjx5s6PWRnGTXyWa98AmLMF8KGFxpALeEC2
         IGGrZutfuz14mHxlkBwd6pYal6vFmwBVxWSTz+LtcMZI6sEVDnU85/55rz7GHkn/0Fyk
         47HDzszd6orfGWWBQBXm1CpNpu0/dfdgh5id61p9Kv8R2nnVeMMdOTBBIE2owcvt3nn4
         94SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746514231; x=1747119031;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P+rnsBrnSg8rRMbhF6ZzJCKOKKucd9+x+mvQiH4XndI=;
        b=f1uF1ZKIonv5c8M2pUZKcJ+fKZ1R5OEzr0Ua+gABRXWMhQEoVjdGZdA9kiK+JDBwdX
         C2sDX9DgqO07tpP/LgUOu19NucXYdOFNhkcPo7TYHA+MMThtPCMxHp5F1PVIyiu2Df4t
         HPdjPKrZrJAlxCFodnhvR2amTAS33EMS+Q8syF+64kGS89NvoQsfAJC2rT6pW8jZZnei
         +53FTaq+tDIXG2PsG9np2nioZfq1fu792Mv9f48oXASA14YsOvqwA9h/7qZsVokgEndO
         vQIkg45wJQ5A5sloMcdDCMdTTI1mgDnNjp3IyiGBxkkjsU53ADicCgWDz0/aGdVOsuLS
         YuLw==
X-Gm-Message-State: AOJu0YxtEnOKP0zR4ACq5DjO9JqoS2h5lzXVaM1YUOZuS/ogtZ6mOBZJ
	MGbYpFcmt83ON/sbg6/PVinjLYkhMNZfjblG+IiJsaeAQacjwEv73EGaIYGlM4P7UlSN3CRVdST
	MCrdBazv+U1nrKlJSs4vCO8tGxMgEttACJfwPCmkH/425bgkzOls=
X-Gm-Gg: ASbGncuIGhZQIF5YkygU4VXedTXS7SNv6b5uACW/VWc+Ti+c4eAB5dIlgH0x5AWx6Wi
	z6dfTkg7du1uIhgLqJP/bjTPOQeIO6uJJArgVXfXxgWTAO1dCAaUW99GNhIybVuyewE3+KYxF2e
	SfD2Udf2OIJSAPg7pcRBc3Fog=
X-Google-Smtp-Source: AGHT+IHNm5GVjhXN3B45lmCfKthx/G+NZUk5+CRKyT+Ba0DNEGI76r0X6+RqWLQrptXlWXRbeCBTBu5IP8WF2QNe6QA=
X-Received: by 2002:a05:6870:a1a3:b0:2d4:e8fd:7ffb with SMTP id
 586e51a60fabf-2db3ccf9c7emr900510fac.1.1746514231320; Mon, 05 May 2025
 23:50:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250502100049.1746335-1-jens.wiklander@linaro.org>
 <20250502100049.1746335-7-jens.wiklander@linaro.org> <6a33e85f-6b60-4260-993d-974dd29cf8e6@arm.com>
In-Reply-To: <6a33e85f-6b60-4260-993d-974dd29cf8e6@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 6 May 2025 08:50:20 +0200
X-Gm-Features: ATxdqUHZrVfop0JU0rG-vcdbXQsIPujzLICkuywbLk5p8m1md7a0mES_eJcPprM
Message-ID: <CAHUa44EQV5O+KZbE19-d-Z6Wu=HAQuGQmZe+mXZRpmdvRDbmSA@mail.gmail.com>
Subject: Re: [PATCH v8 06/14] tee: implement protected DMA-heap
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
	Rouven Czerwinski <rouven.czerwinski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, May 2, 2025 at 3:59=E2=80=AFPM Robin Murphy <robin.murphy@arm.com> =
wrote:
>
> On 02/05/2025 10:59 am, Jens Wiklander wrote:
> > Implement DMA heap for protected DMA-buf allocation in the TEE
> > subsystem.
> >
> > Restricted memory refers to memory buffers behind a hardware enforced
> > firewall. It is not accessible to the kernel during normal circumstance=
s
> > but rather only accessible to certain hardware IPs or CPUs executing in
> > higher or differently privileged mode than the kernel itself. This
> > interface allows to allocate and manage such protected memory buffers
> > via interaction with a TEE implementation.
> >
> > The protected memory is allocated for a specific use-case, like Secure
> > Video Playback, Trusted UI, or Secure Video Recording where certain
> > hardware devices can access the memory.
> >
> > The DMA-heaps are enabled explicitly by the TEE backend driver. The TEE
> > backend drivers needs to implement protected memory pool to manage the
> > protected memory.
>
> [...]> +static struct sg_table *
> > +tee_heap_map_dma_buf(struct dma_buf_attachment *attachment,
> > +                  enum dma_data_direction direction)
> > +{
> > +     struct tee_heap_attachment *a =3D attachment->priv;
> > +     int ret;
> > +
> > +     ret =3D dma_map_sgtable(attachment->dev, &a->table, direction,
> > +                           DMA_ATTR_SKIP_CPU_SYNC);
>
> If the memory is inaccessible to the kernel, what does this DMA mapping
> even mean? What happens when it tries to perform cache maintenance or
> bounce-buffering on inaccessible memory (which presumably doesn't even
> have a VA if it's not usable as normal kernel memory)?

Doesn't DMA_ATTR_SKIP_CPU_SYNC say that the kernel shouldn't perform
cache maintenance on the buffer since it's already in the device
domain? The device is expected to be permitted to access the memory.

>
> If we're simply housekeeping the TEE's resources on its behalf, and
> giving it back some token to tell it which resource to go do its thing
> with, then that's really not "DMA" as far as the kernel is concerned.

These buffers are supposed to be passed to devices that might be under
only partial control of the kernel.

>
> [...]
> > +static int protmem_pool_op_static_alloc(struct tee_protmem_pool *pool,
> > +                                     struct sg_table *sgt, size_t size=
,
> > +                                     size_t *offs)
> > +{
> > +     struct tee_protmem_static_pool *stp =3D to_protmem_static_pool(po=
ol);
> > +     phys_addr_t pa;
> > +     int ret;
> > +
> > +     pa =3D gen_pool_alloc(stp->gen_pool, size);
> > +     if (!pa)
> > +             return -ENOMEM;
> > +
> > +     ret =3D sg_alloc_table(sgt, 1, GFP_KERNEL);
> > +     if (ret) {
> > +             gen_pool_free(stp->gen_pool, pa, size);
> > +             return ret;
> > +     }
> > +
> > +     sg_set_page(sgt->sgl, phys_to_page(pa), size, 0);
>
> Where does "pa" come from here (i.e. what's the provenance of the
> initial "paddr" passed to tee_protmem_static_pool_alloc())? In general
> we can't call {phys,pfn}_to_page() an arbitrary addresses without
> checking pfn_valid() first. A bogus address might even crash
> __pfn_to_page() itself under CONFIG_SPARSEMEM.

That's a good point. Would it be enough to check the address with
pfn_valid() in tee_protmem_static_pool_alloc()?

I expect that the memory is normally carved out of DDR and made secure
or protected in a platform-specific way, either at boot with a static
carveout or dynamically after boot.

Thanks,
Jens


>
> Thanks,
> Robin.
>
> > +     *offs =3D pa - stp->pa_base;
> > +
> > +     return 0;
> > +}
