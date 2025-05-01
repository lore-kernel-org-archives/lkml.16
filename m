Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0969F20E026
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 17:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746119475; cv=none; b=T6Xqu1YSZcuT/DBYJKqIK9DHnBAIVFPjRG+3G2nItLBQmGc2QF+SUK9Z0GlOw+s+1TESFMJaxXfBlUCmWC0aA6+p6LfgjVeGwDBWqBb5WZQQNfbRsrNOprE6v+g5VUpypyItGYT+mvmBtaVZUQN6FNExQ+POvm6QNGzhHaLz5r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746119475; c=relaxed/simple;
	bh=4ZF2kkw7LO8FSlAXBJz5RFNkuuBctt42MNT5+VNPvBs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a7QEf+2+Myq+aDBUwF1hpkEdNBrNEPsECFU0IIurtBOHphXYhj49GT1qHiI4oeVyd/8aPB2g4UcErYwAj5de6XM5woJoH0x/2VVa/PVHY8NI9OVN/yfaT7dE4jnZDuRcBoulYtG0kqhaiPx5jigclc71xo10tTeOqrulYE4rURM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1gDyO0TU; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1gDyO0TU"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-47666573242so17911cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 10:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746119473; x=1746724273; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TyZUTfbjOtSI4Pg1zTRceh+Y3qETrTmwa1GNlHLrMsE=;
        b=1gDyO0TUmT3TJviFLMX1EyBps9K5EN9YozsqYq4cYJef9UbG6xiNJWY4iI+HC5OQ4x
         rm16rAkUaB/NkFTc9gm0ZaS7Ll7vWFFe7jgwDGg4sSYEk45p+2h15KS2prMjXJdk/83b
         OlQ/AP4cxhanOEQdYbXJci59ej77DAFwWUqVQPpgjzdoxaDIJ2kjfRX4bxnKad6aqIMS
         dAHenatCSj+ga/ZozDA+bPd21trAkcoDHWqnBiI8LYpzltCboxblGRoq6JTs0gbTj3Ky
         rk3RvgCanOclFdWak3PeSOai+PZT9AMfQa1dOM1ebd+GsWCiRwXG+Eq0dTgi/9zXYJ/b
         H6qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746119473; x=1746724273;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TyZUTfbjOtSI4Pg1zTRceh+Y3qETrTmwa1GNlHLrMsE=;
        b=Ml7nE77yFeKOH6nrEvuBrSrWgAFB1Jkml+yt+20sQ3KCwLgTqdm8ePDI8CONbfG5aN
         w9R1+zgH0mO0k+UDu+q8sSVxw01tA/SPGln/qlJjb6T6WvxF8znnYg542bymx7xNAzwo
         1c9s9AC4MlKEwvZiul4P9cFrbA2Gxhr4IFXrNva3xFdw912Fv65HCSa3Tr2YkBuoiVEc
         4vI84GkJ+Sdw4Q7vwOzlb3QO9kQut1AIVzDl/RYMlfafEwtllcMsHcYA9bW6Tsej/O6/
         NfnluuY3ZaYsVvyfCDam5ChyMYrbAa3twaQc01EGjNjf2YAFOg0jTNoI2ghjGc3ZNKmo
         Kc1g==
X-Forwarded-Encrypted: i=1; AJvYcCVD5Eo6EadomYnTz5PTMKU5UItYpA5XQs3A7I8mXDLLPaRpJP5efoHfEJ5PcGpFcq8q+X/7gmT6fsCU6vs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/UxDToxA3AqRChkG9Ac5kxZlwDtFbAv2hjmimrmjAhP3ugQnS
	qq6g94/IdMIdaH+qHzXpTI2CdAA/ctaPca1BPC0ajW8mRMXgIUehmTpHB5MQtCtWZgowKuOaU8S
	sYFshB/XfMfKCqn/FhTOE2BI48qrDGrgHHmKY
X-Gm-Gg: ASbGncuNx+ZUdv+vPP0Bln89zRy4TI06aDXffV0ecN/K394Lcpvuf5Br89RVC/4lFhA
	akIkzG6FeOIA5W3kADfwcvt0F11GygMuWdayNJgGdWHVkNiYj4AjrfO3nLjctLFzsctp4X6YVOR
	QmYUyIY7hK3tHAociI0ibH3MTsBQT8zBZvqiyBXEzdN1a+FZHoRT54ox3C
X-Google-Smtp-Source: AGHT+IGv3eRGNECsUyk6JOE6O6LjupkXS1Vch7nD0P9cmrdw/DfOv9xrVQcy66j5Dit0TNIse4AjgxHkAuco5q3Aruo=
X-Received: by 2002:a05:622a:104:b0:48a:42fa:78fa with SMTP id
 d75a77b69052e-48ae9f775aamr4522371cf.2.1746119472574; Thu, 01 May 2025
 10:11:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250501052532.1903125-1-jyescas@google.com> <3230A277-7D1D-4329-B871-5E43967E6A00@nvidia.com>
In-Reply-To: <3230A277-7D1D-4329-B871-5E43967E6A00@nvidia.com>
From: Juan Yescas <jyescas@google.com>
Date: Thu, 1 May 2025 10:11:01 -0700
X-Gm-Features: ATxdqUGuDLhfocEblH8_bII6KZwxowsdcLaFmo7SPnbUbxHXravB8vFsCWiGWlY
Message-ID: <CAJDx_rgodAQXVrLjZBBGCqBkT82Oem1ACj7dk=G3qKMnyu_AZw@mail.gmail.com>
Subject: Re: [PATCH] mm: Add ARCH_FORCE_PAGE_BLOCK_ORDER to select page block order
To: Zi Yan <ziy@nvidia.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, tjmercier@google.com, 
	isaacmanjarres@google.com, surenb@google.com, kaleshsingh@google.com, 
	Vlastimil Babka <vbabka@suse.cz>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, David Hildenbrand <david@redhat.com>, 
	Mike Rapoport <rppt@kernel.org>, Minchan Kim <minchan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 1, 2025 at 7:24=E2=80=AFAM Zi Yan <ziy@nvidia.com> wrote:
>
> On 1 May 2025, at 1:25, Juan Yescas wrote:
>
> > Problem: On large page size configurations (16KiB, 64KiB), the CMA
> > alignment requirement (CMA_MIN_ALIGNMENT_BYTES) increases considerably,
> > and this causes the CMA reservations to be larger than necessary.
> > This means that system will have less available MIGRATE_UNMOVABLE and
> > MIGRATE_RECLAIMABLE page blocks since MIGRATE_CMA can't fallback to the=
m.
> >
> > The CMA_MIN_ALIGNMENT_BYTES increases because it depends on
> > MAX_PAGE_ORDER which depends on ARCH_FORCE_MAX_ORDER. The value of
> > ARCH_FORCE_MAX_ORDER increases on 16k and 64k kernels.
> >
> > For example, the CMA alignment requirement when:
> >
> > - CONFIG_ARCH_FORCE_MAX_ORDER default value is used
> > - CONFIG_TRANSPARENT_HUGEPAGE is set:
> >
> > PAGE_SIZE | MAX_PAGE_ORDER | pageblock_order | CMA_MIN_ALIGNMENT_BYTES
> > -----------------------------------------------------------------------
> >    4KiB   |      10        |      10         |  4KiB * (2 ^ 10)  =3D  4=
MiB
> >   16Kib   |      11        |      11         | 16KiB * (2 ^ 11) =3D  32=
MiB
> >   64KiB   |      13        |      13         | 64KiB * (2 ^ 13) =3D 512=
MiB
> >
> > There are some extreme cases for the CMA alignment requirement when:
> >
> > - CONFIG_ARCH_FORCE_MAX_ORDER maximum value is set
> > - CONFIG_TRANSPARENT_HUGEPAGE is NOT set:
> > - CONFIG_HUGETLB_PAGE is NOT set
> >
> > PAGE_SIZE | MAX_PAGE_ORDER | pageblock_order |  CMA_MIN_ALIGNMENT_BYTES
> > -----------------------------------------------------------------------=
-
> >    4KiB   |      15        |      15         |  4KiB * (2 ^ 15) =3D 128=
MiB
> >   16Kib   |      13        |      13         | 16KiB * (2 ^ 13) =3D 128=
MiB
> >   64KiB   |      13        |      13         | 64KiB * (2 ^ 13) =3D 512=
MiB
> >
> > This affects the CMA reservations for the drivers. If a driver in a
> > 4KiB kernel needs 4MiB of CMA memory, in a 16KiB kernel, the minimal
> > reservation has to be 32MiB due to the alignment requirements:
> >
> > reserved-memory {
> >     ...
> >     cma_test_reserve: cma_test_reserve {
> >         compatible =3D "shared-dma-pool";
> >         size =3D <0x0 0x400000>; /* 4 MiB */
> >         ...
> >     };
> > };
> >
> > reserved-memory {
> >     ...
> >     cma_test_reserve: cma_test_reserve {
> >         compatible =3D "shared-dma-pool";
> >         size =3D <0x0 0x2000000>; /* 32 MiB */
> >         ...
> >     };
> > };
> >
> > Solution: Add a new config ARCH_FORCE_PAGE_BLOCK_ORDER that
> > allows to set the page block order. The maximum page block
> > order will be given by ARCH_FORCE_MAX_ORDER.
>
> Why not use a boot time parameter to change page block order?

That is a good option. The main tradeoff is:

- The bootloader would have to be updated on the devices to pass the right
pageblock_order value depending on the kernel page size. Currently,
We can boot 4k/16k kernels without any change in the bootloader.

> Otherwise, you will need to maintain an additional kernel
> binary for your use case.
>

Unfortunately, we still need 2 kernel binaries, one for 4k and another for =
16k.
There are several data structures that are aligned at compile time based on=
 the
PAGE_SIZE (__aligned(PAGE_SIZE)) that makes it difficult to have only one
binary.

For example:

static u8 idmap_ptes[IDMAP_LEVELS - 1][PAGE_SIZE] __aligned(PAGE_SIZE)
__ro_after_init,
 kpti_ptes[IDMAP_LEVELS - 1][PAGE_SIZE] __aligned(PAGE_SIZE) __ro_after_ini=
t;

https://elixir.bootlin.com/linux/v6.14.4/source/arch/arm64/mm/mmu.c#L780

Thanks
Juan

> --
> Best Regards,
> Yan, Zi
