Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F12C146A69
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 01:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738892349; cv=none; b=NClbjGX5ob2givusimIBWYIpyDtOkflHcktwaica0c3sXcRdDzeEig7lSV8rCmCc70Kf+JIfLMxjjS56nRqIHqPqEF42EwyvPKee4OVQNnVGdCFneGRzgPJJA3RFZimM/kcPrA6o6Xpm27OuFvuBpy7vDfjFnVy6/YRYYUcaAMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738892349; c=relaxed/simple;
	bh=RWD/jJAmsYyNOn211Bbue2KjkmRhyD6nM7GKyaekbWs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A+LGxcE8NV/zzXp0Wb44Xd/asD1LPF97Lm+ThVMuhnAM2PbZoZ6LhR9jHiLWvbyF8leAeRDcRi31/5T2sLtlc5NTcaSWYl0qsXl2wtD8C5v19SaIHkw5PIICt8g4w77Uk/6TqbBmsyLpPuAqYg7k0Clog3fNYOgQA+pypYgRmmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=WTNBUVTX; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="WTNBUVTX"
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 407E83F85C
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 01:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1738892343;
	bh=GTkrXOMiM73qeeJp4KtVvMnuZB30bb4oVfWJGcMkjrM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=WTNBUVTXrk5KsQ5LitO3XLgC5UzgxXIaaVmJfvVNStFNFwW6Dcau5tyA/Bs1R/ShN
	 Zby/T+ww2b+Ehoi9ykda0imLnkHw9pT4bIcKGGKWoqFi2G9Dj8bcxFw/3zMLv+BiZK
	 bbLV6gzpU0tO/vG2p2+ZIzXrH2Me4n0Lh0nYCinm7G95ME7Aat1FO7SdZ4AFJG6Y2p
	 CgmbbFnRabKhS4HQgbTBSqkGSKEtS4kUSPmN8CWazti0wysPQDRi3KeNc2kbv6ZoO1
	 oHq+pDl+MDIRrkLtbxi/jEP2n+Kr8ktc81aww8IierqkPKixZeP08UVUPYt/P2ZnHB
	 9KQbW4UwKYaig==
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5dcd443254fso1737174a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 17:39:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738892340; x=1739497140;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GTkrXOMiM73qeeJp4KtVvMnuZB30bb4oVfWJGcMkjrM=;
        b=ov9NUOC7qJK5JCyWz20T0Cx13TEVKY2iK4nvDmhW9A0QnbE/PiPaaa1h+2etEl9gAK
         PCpmc7VP1JvyB4tDM9AFoQE1XuN76NN018Z19hYO+KmLv0AcA+nHOH9YF9bDSld7vSOA
         aSrQaTnuNeXtmln6SUC3m8yTKba9G030J5jS2wEPK+lkF2eyqbufPOD0ocIf9FQhXE+b
         WrxbcSMbMHQkSpf9jMp9II9kPOrBha4lS164bC3x25hUYNAnaa7APxpDSgpEiESBsjdX
         o46yGIbWXTruaG3s8X+kPCF4rNLbR3eQ/NW14K4IaUp4Oq9dNt/PcLR401B2f+0BrYqD
         O4UQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoPCSerMJiwisougOaSMcw0l5izDgyRNAO76L2owtTFaregbnpz0cGG+Q3cmmllgXdr80uSTH1Y1veZMg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfiXK6lI17rscB0IU23xZBxtdx79y3bANepOfjQlbW8qp6yGQk
	6/6ZMPgAt0IlH+Hyg+rdTGVy7hjqfqwUQ6DvHAYlxZNG73987Rj/zN5jyuV3Nyhykft0CMT2CCm
	Gzx//Bfbjkge7CT7whj/t447iIJqymcn4XE1tyRjNv8k7mtLdx5lAoYnCsAijh3CZzmMst9400G
	v+Yws85penbIx/ELwDiw8YjMzzFquOK/nRCrTsWy03+nQDAyuie03c
X-Gm-Gg: ASbGnct8A+8B7JELN2FIC5UG9U7xdhHGzgr4wpmaUVfUusMDeGlcUu/IwWlf2X/ZFhY
	i4DZnxiASPmF2raRy1NoDJmHRmBSqD0cjQ5/m1T5hTBFsTjjHj88UhkVykIaV
X-Received: by 2002:a05:6402:2711:b0:5db:f317:98d7 with SMTP id 4fb4d7f45d1cf-5de4504012amr1547476a12.6.1738892340426;
        Thu, 06 Feb 2025 17:39:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFgOhkvrAKf7nnqy6gf6zaVcLFDeVOoBgzqKLIZs9WBroJfeQUTu2VncuzrSklAcKO7aLry1JfOkH3CEhT1YvI=
X-Received: by 2002:a05:6402:2711:b0:5db:f317:98d7 with SMTP id
 4fb4d7f45d1cf-5de4504012amr1547459a12.6.1738892340077; Thu, 06 Feb 2025
 17:39:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250205231728.2527186-1-alex.williamson@redhat.com> <20250205231728.2527186-5-alex.williamson@redhat.com>
In-Reply-To: <20250205231728.2527186-5-alex.williamson@redhat.com>
From: Mitchell Augustin <mitchell.augustin@canonical.com>
Date: Thu, 6 Feb 2025 19:38:49 -0600
X-Gm-Features: AWEUYZlzA01SrkVvm2yXKQXBYBNe15LNEHSv-QmGFlSTajNCQkvq6Nepgp2ijso
Message-ID: <CAHTA-ub-FG_9NZvBsz657jLpKncsEz_jpXr86JmzdAPq7+wimQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] mm: Provide page mask in struct follow_pfnmap_args
To: Alex Williamson <alex.williamson@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, peterx@redhat.com, 
	clg@redhat.com, akpm@linux-foundation.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: "Mitchell Augustin" <mitchell.augustin@canonical.com>
Tested-by: "Mitchell Augustin" <mitchell.augustin@canonical.com>


On Wed, Feb 5, 2025 at 5:18=E2=80=AFPM Alex Williamson
<alex.williamson@redhat.com> wrote:
>
> follow_pfnmap_start() walks the page table for a given address and
> fills out the struct follow_pfnmap_args in pfnmap_args_setup().
> The page mask of the page table level is already provided to this
> latter function for calculating the pfn.  This page mask can also be
> useful for the caller to determine the extent of the contiguous
> mapping.
>
> For example, vfio-pci now supports huge_fault for pfnmaps and is able
> to insert pud and pmd mappings.  When we DMA map these pfnmaps, ex.
> PCI MMIO BARs, we iterate follow_pfnmap_start() to get each pfn to test
> for a contiguous pfn range.  Providing the mapping page mask allows us
> to skip the extent of the mapping level.  Assuming a 1GB pud level and
> 4KB page size, iterations are reduced by a factor of 256K.  In wall
> clock time, mapping a 32GB PCI BAR is reduced from ~1s to <1ms.
>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: linux-mm@kvack.org
> Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
> ---
>  include/linux/mm.h | 2 ++
>  mm/memory.c        | 1 +
>  2 files changed, 3 insertions(+)
>
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index b1c3db9cf355..0ef7e7a0b4eb 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2416,11 +2416,13 @@ struct follow_pfnmap_args {
>          * Outputs:
>          *
>          * @pfn: the PFN of the address
> +        * @pgmask: page mask covering pfn
>          * @pgprot: the pgprot_t of the mapping
>          * @writable: whether the mapping is writable
>          * @special: whether the mapping is a special mapping (real PFN m=
aps)
>          */
>         unsigned long pfn;
> +       unsigned long pgmask;
>         pgprot_t pgprot;
>         bool writable;
>         bool special;
> diff --git a/mm/memory.c b/mm/memory.c
> index 398c031be9ba..97ccd43761b2 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -6388,6 +6388,7 @@ static inline void pfnmap_args_setup(struct follow_=
pfnmap_args *args,
>         args->lock =3D lock;
>         args->ptep =3D ptep;
>         args->pfn =3D pfn_base + ((args->address & ~addr_mask) >> PAGE_SH=
IFT);
> +       args->pgmask =3D addr_mask;
>         args->pgprot =3D pgprot;
>         args->writable =3D writable;
>         args->special =3D special;
> --
> 2.47.1
>


--
Mitchell Augustin
Software Engineer - Ubuntu Partner Engineering
