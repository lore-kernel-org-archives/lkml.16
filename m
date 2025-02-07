Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B225A149C4A
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 01:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738892359; cv=none; b=OyWiQPFmbGNauGvMJf++gkEAyW88+4yIywj4e5QacuzmK67ffxLv3XYOoPxQWH7067WobuOmleTUmhqjoXtBYJ+U6qE23y5YbaLX3ebBHWYGEQmNUE2OgYuTcJr99upR29Asa38NZ6zfBq4qpessMzJFDepXoDY6JwJ5oZ7s6a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738892359; c=relaxed/simple;
	bh=m//XKS5v/N/PRan3Tui0rOlJ9s5x+n9T9DtCy6T0H9M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tpvk7GTDb9naNYg1pegfPQu1/mMtclzHclaFO+HVu8IiupCajJuwC1yI6rUhVvGlzVpd/TAu+t1drYFI5I9KpOUrApTT04D4trGR1zF34hfkqgDW+4wkHGf7eZ3GWteZ8G14/AHtGbxYxJAXfzkOOSXukNBewqa62mHp8VpX/CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=dREAZh1E; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="dREAZh1E"
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id DEC183FA56
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 01:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1738892352;
	bh=fNB47AZskNaVXFROFOsVtdHZC/VEBES+Tul1gkugFo8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=dREAZh1EDA0Uzvkxr4L74+c6F5nrCvvtAwwoxCVw5GOj7bhx8K4WrWGBrNfX4jidD
	 gtEEBGRPz6jOiwTL3Ht8WcLOLhybq8bfyMWamQv+JWGR2kw9imrT//ckgMU1c+BRcD
	 Blp3EyQ9Ioxyk1l/KfG3oGsFNXEKdACPycLV220HqHdNSX/jOv4Y2IPRODjOkCxHF+
	 dJjjGYaj9rTO7NDhpkNAgRvPFr4etfeG50JuloJyBMxVP+r+967OhllA+F/M3KxT34
	 XKT6ISbYDAWRCSndw+gtQuidyww8zYcUATuSrrBcjieX76/rGWMwCLCh0QuwZ9AXRt
	 QI2EdaFrVB5bg==
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5dcef975708so1352101a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 17:39:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738892352; x=1739497152;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fNB47AZskNaVXFROFOsVtdHZC/VEBES+Tul1gkugFo8=;
        b=DeimlQ8wUmHYFt8fcQsVxrdvcneJ6udHGpmk8dyihZVxu/BY5TFH+KrK+0BGHpojkv
         CSP9rR7dy91HKs+xjInTtciGLmYRIMJx6UoPXcNXJDDseNjIJmV3o9ooQfF+la2flP5S
         obx+cwSQrDHgF4szS/PtNDx0wVbk7zvYchuxmUN0GpLtqedkxL4CwOpWZPmfS/kLYi3a
         wV6gJwWMXUvb7h2rOhcrv2CD7pNCvORcXTWulbuxSiG6ZpM6+2YPaYQ0gr9mV7+ZBiPd
         8F6OfbRgxMNewtOI2/jdLut6kwjfrAiD9I7G9TZGrCtPZTzmxm5MJzrzindpQk1Acpep
         v+Hw==
X-Forwarded-Encrypted: i=1; AJvYcCWbYcy/5qEeGS8J0oCpaClJ0R9pUCmsKetzfc/w/anJquvxAqqW9PfiMtb0hL2HZSI/b7WpNtKGHf15fqo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGdpVktZOBqwEM2G8CJkZXd5n8x48uk5iPUt4z0oQ/aFoGQcem
	PC3l3hF+C8ikWtjeLDkesjlyhq4Drewuc1f9+pH0nl43CFlBBFMISRpUYjNcPI0Oo/fhs86DuZg
	8rNGB+iaGw0O7qHCYrzlrl+jZrr4B8pY+3kEqloCnOkU+XOLGK2swTCrOiinhOoXCpaIMfxUCfK
	SOmglSTIgEm4NBHgMtPd+9g6vyw7A9BctZpXAPCDvorQuQouIG4GxT
X-Gm-Gg: ASbGncvJJ3x9g9EkQM0e1YOJQvW62v+6YwWZ24W99pLK3sZY7Kjt2EQrKGGKu/P7N0x
	bfLTxauaNrZqMT2dMhJbYouGNwLXr2Yxn5QW2RS8SsGJ55/023SHzpeGEZZ9X
X-Received: by 2002:a05:6402:1ecf:b0:5dc:1395:1d3a with SMTP id 4fb4d7f45d1cf-5de45040136mr1224808a12.1.1738892352092;
        Thu, 06 Feb 2025 17:39:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF/hfeNzW0PLF4wIrEEYadVAd/ZpRfylvoon43qb7nTnRX2cUuBVjBJ/j4A/WtVm/FBP3qMLamc0NsqBBkMXCE=
X-Received: by 2002:a05:6402:1ecf:b0:5dc:1395:1d3a with SMTP id
 4fb4d7f45d1cf-5de45040136mr1224796a12.1.1738892351707; Thu, 06 Feb 2025
 17:39:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250205231728.2527186-1-alex.williamson@redhat.com> <20250205231728.2527186-6-alex.williamson@redhat.com>
In-Reply-To: <20250205231728.2527186-6-alex.williamson@redhat.com>
From: Mitchell Augustin <mitchell.augustin@canonical.com>
Date: Thu, 6 Feb 2025 19:39:00 -0600
X-Gm-Features: AWEUYZm-8N3C_RogZQE-LMB_5GAV_JU3d6aW2EE3P7c5fBbLXqIJWAR7Ls5C54k
Message-ID: <CAHTA-ub+_txMHOG1YmtnPRnwSgU0eLrN6kjA5u4b+cJ=ja2L7Q@mail.gmail.com>
Subject: Re: [PATCH 5/5] vfio/type1: Use mapping page mask for pfnmaps
To: Alex Williamson <alex.williamson@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, peterx@redhat.com, 
	clg@redhat.com, akpm@linux-foundation.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

LGTM and completely eliminates guest VM PCI initialization slowdowns
on H100 and A100.
Also not seeing any obvious regressions on my side.

Reported-by: "Mitchell Augustin" <mitchell.augustin@canonical.com>
Reviewed-by: "Mitchell Augustin" <mitchell.augustin@canonical.com>
Tested-by: "Mitchell Augustin" <mitchell.augustin@canonical.com>


On Wed, Feb 5, 2025 at 5:18=E2=80=AFPM Alex Williamson
<alex.williamson@redhat.com> wrote:
>
> vfio-pci supports huge_fault for PCI MMIO BARs and will insert pud and
> pmd mappings for well aligned mappings.  follow_pfnmap_start() walks the
> page table and therefore knows the page mask of the level where the
> address is found and returns this through follow_pfnmap_args.pgmask.
> Subsequent pfns from this address until the end of the mapping page are
> necessarily consecutive.  Use this information to retrieve a range of
> pfnmap pfns in a single pass.
>
> With optimal mappings and alignment on systems with 1GB pud and 4KB
> page size, this reduces iterations for DMA mapping PCI BARs by a
> factor of 256K.  In real world testing, the overhead of iterating
> pfns for a VM DMA mapping a 32GB PCI BAR is reduced from ~1s to
> sub-millisecond overhead.
>
> Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
> ---
>  drivers/vfio/vfio_iommu_type1.c | 24 +++++++++++++++++-------
>  1 file changed, 17 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_ty=
pe1.c
> index 939920454da7..6f3e8d981311 100644
> --- a/drivers/vfio/vfio_iommu_type1.c
> +++ b/drivers/vfio/vfio_iommu_type1.c
> @@ -520,7 +520,7 @@ static void vfio_batch_fini(struct vfio_batch *batch)
>
>  static int follow_fault_pfn(struct vm_area_struct *vma, struct mm_struct=
 *mm,
>                             unsigned long vaddr, unsigned long *pfn,
> -                           bool write_fault)
> +                           unsigned long *pgmask, bool write_fault)
>  {
>         struct follow_pfnmap_args args =3D { .vma =3D vma, .address =3D v=
addr };
>         int ret;
> @@ -544,10 +544,12 @@ static int follow_fault_pfn(struct vm_area_struct *=
vma, struct mm_struct *mm,
>                         return ret;
>         }
>
> -       if (write_fault && !args.writable)
> +       if (write_fault && !args.writable) {
>                 ret =3D -EFAULT;
> -       else
> +       } else {
>                 *pfn =3D args.pfn;
> +               *pgmask =3D args.pgmask;
> +       }
>
>         follow_pfnmap_end(&args);
>         return ret;
> @@ -590,15 +592,23 @@ static int vaddr_get_pfns(struct mm_struct *mm, uns=
igned long vaddr,
>         vma =3D vma_lookup(mm, vaddr);
>
>         if (vma && vma->vm_flags & VM_PFNMAP) {
> -               ret =3D follow_fault_pfn(vma, mm, vaddr, pfn, prot & IOMM=
U_WRITE);
> +               unsigned long pgmask;
> +
> +               ret =3D follow_fault_pfn(vma, mm, vaddr, pfn, &pgmask,
> +                                      prot & IOMMU_WRITE);
>                 if (ret =3D=3D -EAGAIN)
>                         goto retry;
>
>                 if (!ret) {
> -                       if (is_invalid_reserved_pfn(*pfn))
> -                               ret =3D 1;
> -                       else
> +                       if (is_invalid_reserved_pfn(*pfn)) {
> +                               unsigned long epfn;
> +
> +                               epfn =3D (((*pfn << PAGE_SHIFT) + ~pgmask=
 + 1)
> +                                       & pgmask) >> PAGE_SHIFT;
> +                               ret =3D min_t(int, npages, epfn - *pfn);
> +                       } else {
>                                 ret =3D -EFAULT;
> +                       }
>                 }
>         }
>  done:
> --
> 2.47.1
>


--
Mitchell Augustin
Software Engineer - Ubuntu Partner Engineering
