Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334E51C5F37
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 18:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746123725; cv=none; b=pzgtNOWO8RvZcYiJ3cSJhtUX0eADKd+tuxhuIzqmoxRG6Bu08va5Y2m5HqqY6+xcDPvrSy9nTLxzfVXQnkzci6FAoKVmYKzdHqIMBBktXEmrxjXobcaH5bFPL8omN9bnsNgCTo9phF/iwe62LCQ/nwl+1EsRAtIwmiW7XbrJE1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746123725; c=relaxed/simple;
	bh=fJpz+tY6bQAjQp7AWEOf07GfaJWUXUjzt4m1Nv9i7Ls=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YWTuQ6TcIh3POOZqDbbPsFvTVuOkvq8oXu8VMGPrVJEBo6fpYCK6kC2Mg5165IIVp6mIS7YwA5x7X0UokjSfPW3aAo8n89mn6eCdjImR9fG6aVfhAEhpIdndf04K9J9W4jwWMYIJWQBWoGPHStvmyMUm4b/WIPijy7xoxTZPMMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mFTBMLn4; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mFTBMLn4"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2240aad70f2so27075ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 11:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746123723; x=1746728523; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M4oEmD5pkFXHibsXA2WC273fo0mn5jrWwyr6sBq7SDo=;
        b=mFTBMLn4fHPxO+aPPl5mt82lutv/KgZbMdjVCpFR8FeJc12sB+gM7R978+Qry1cdqS
         sCtsN/GgLikcva+jWr8cYR+JKr8SWixDdip+3r6HUG+DSGeKE4sxCUNbTJ0bSkcAXGcz
         ru7tNsFWlmgt0nJJM6NhAwSDGiqCJqt9ZBTVM/CHiKbailG6OSMJ/oFVz6OqXlShDMmA
         JDKWXQAVBg7kaEVs404XythV9Z43zP000mnEZ+IqOjnA/IMveBz/p3GeQs1zMowtTwkt
         JpdOs0yO3QMv2tqMUZtU1RFkntoR2UGDm0rKONOm78E7bsGNubTTh5B4as9/9hJUmMWk
         ljDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746123723; x=1746728523;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M4oEmD5pkFXHibsXA2WC273fo0mn5jrWwyr6sBq7SDo=;
        b=ZHNMWgOH5VARN+CBxpsgJGZG7/yu78slTGlq4Ah2Nwy96W2CsqadMw5FifsZqWGADt
         HfNzz8YFUZBcrQLQ4r5Sm8b/NTl+5KtcEKuObBZFwxhb4vgoC8uTQF1QV+BSVstB4+q8
         MiiGwBRggNX4DH6A4clhS/kKWdN7utV/RlKCz8nWuiNAoOtX9JmXmfLX55sDlc9RYwRt
         accVs3c8Pn+XLxB1rmdOZO/Z9DMXw2DGwCJWXelihhP7qpcE36ykYHL2z+tdmgbKRRl/
         eL6d5c7lrJrsVoNzRxrVbLi3Ee2+28ES8z7spzYS1h82LKF75EIPge7E9u+s2Tl+wgwR
         lK8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXv/qbQahU0iYZh8Ga1ia3qzesK/4Aq7tWgStPZiYbEnfz4y5bL4cTh/XbEAMwAL1TFtEXA+bQJfmzBdyE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6QU44Fh1OAEJ2w2eRBMDzIi0zXshgoDBvfVYOaS85uNgsqLUv
	rc9xbSXYOnEjjKER4z0Z3bT44RdurxXljwmFXCvTtPBl1sKiFSZQQkF82aHhzueFbyTtt+Njg2x
	Zs3bVZ1HClXubjb3VZx+kypcGhfqGahfalNMY
X-Gm-Gg: ASbGnctJAJUwcbn4/+HNS+NjfFdbpon566ksXeEvUwBaEHe8fqBmGXau9Vsd4QMXp76
	DlVWv6TRnG8UXYeThailGoYV2uskcNlurWnpGsLAXy8BJWgeYgw3+M6inM5EaMIa1kLoB4OLRQW
	gmDVqfSa2xB/A0fMT6pgp/iZe7qE7FvW96uUP1xzaYuQ9JBF6EIFQ=
X-Google-Smtp-Source: AGHT+IGw01QLKei1a1tqjRO1f1fstLHCdEGbwq/8Z+18IvDEQWgBjR9t4vbhB4thwSTGW5yezeLPGhT4pQ+nxyomE04=
X-Received: by 2002:a17:902:e750:b0:21f:3e29:9cd1 with SMTP id
 d9443c01a7336-22e0784ed21mr2880445ad.1.1746123723117; Thu, 01 May 2025
 11:22:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250501052532.1903125-1-jyescas@google.com> <3230A277-7D1D-4329-B871-5E43967E6A00@nvidia.com>
 <CAJDx_rgodAQXVrLjZBBGCqBkT82Oem1ACj7dk=G3qKMnyu_AZw@mail.gmail.com>
In-Reply-To: <CAJDx_rgodAQXVrLjZBBGCqBkT82Oem1ACj7dk=G3qKMnyu_AZw@mail.gmail.com>
From: Kalesh Singh <kaleshsingh@google.com>
Date: Thu, 1 May 2025 11:21:51 -0700
X-Gm-Features: ATxdqUELKjWvsXtfVkBZFM3lN1s1zGGvb5Be96Hj7WDDLkjDj34v7xW40EM0e3Y
Message-ID: <CAC_TJvf36Qr3r_LJ0Knf7WtozUZ_YVxLxF7bEAPC+87J-QEd6Q@mail.gmail.com>
Subject: Re: [PATCH] mm: Add ARCH_FORCE_PAGE_BLOCK_ORDER to select page block order
To: Juan Yescas <jyescas@google.com>
Cc: Zi Yan <ziy@nvidia.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, tjmercier@google.com, isaacmanjarres@google.com, 
	surenb@google.com, Vlastimil Babka <vbabka@suse.cz>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>, Minchan Kim <minchan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 1, 2025 at 10:11=E2=80=AFAM Juan Yescas <jyescas@google.com> wr=
ote:
>
> On Thu, May 1, 2025 at 7:24=E2=80=AFAM Zi Yan <ziy@nvidia.com> wrote:
> >
> > On 1 May 2025, at 1:25, Juan Yescas wrote:
> >
> > > Problem: On large page size configurations (16KiB, 64KiB), the CMA
> > > alignment requirement (CMA_MIN_ALIGNMENT_BYTES) increases considerabl=
y,
> > > and this causes the CMA reservations to be larger than necessary.
> > > This means that system will have less available MIGRATE_UNMOVABLE and
> > > MIGRATE_RECLAIMABLE page blocks since MIGRATE_CMA can't fallback to t=
hem.
> > >
> > > The CMA_MIN_ALIGNMENT_BYTES increases because it depends on
> > > MAX_PAGE_ORDER which depends on ARCH_FORCE_MAX_ORDER. The value of
> > > ARCH_FORCE_MAX_ORDER increases on 16k and 64k kernels.
> > >
> > > For example, the CMA alignment requirement when:
> > >
> > > - CONFIG_ARCH_FORCE_MAX_ORDER default value is used
> > > - CONFIG_TRANSPARENT_HUGEPAGE is set:
> > >
> > > PAGE_SIZE | MAX_PAGE_ORDER | pageblock_order | CMA_MIN_ALIGNMENT_BYTE=
S
> > > ---------------------------------------------------------------------=
--
> > >    4KiB   |      10        |      10         |  4KiB * (2 ^ 10)  =3D =
 4MiB
> > >   16Kib   |      11        |      11         | 16KiB * (2 ^ 11) =3D  =
32MiB
> > >   64KiB   |      13        |      13         | 64KiB * (2 ^ 13) =3D 5=
12MiB
> > >
> > > There are some extreme cases for the CMA alignment requirement when:
> > >
> > > - CONFIG_ARCH_FORCE_MAX_ORDER maximum value is set
> > > - CONFIG_TRANSPARENT_HUGEPAGE is NOT set:
> > > - CONFIG_HUGETLB_PAGE is NOT set
> > >
> > > PAGE_SIZE | MAX_PAGE_ORDER | pageblock_order |  CMA_MIN_ALIGNMENT_BYT=
ES
> > > ---------------------------------------------------------------------=
---
> > >    4KiB   |      15        |      15         |  4KiB * (2 ^ 15) =3D 1=
28MiB
> > >   16Kib   |      13        |      13         | 16KiB * (2 ^ 13) =3D 1=
28MiB
> > >   64KiB   |      13        |      13         | 64KiB * (2 ^ 13) =3D 5=
12MiB
> > >
> > > This affects the CMA reservations for the drivers. If a driver in a
> > > 4KiB kernel needs 4MiB of CMA memory, in a 16KiB kernel, the minimal
> > > reservation has to be 32MiB due to the alignment requirements:
> > >
> > > reserved-memory {
> > >     ...
> > >     cma_test_reserve: cma_test_reserve {
> > >         compatible =3D "shared-dma-pool";
> > >         size =3D <0x0 0x400000>; /* 4 MiB */
> > >         ...
> > >     };
> > > };
> > >
> > > reserved-memory {
> > >     ...
> > >     cma_test_reserve: cma_test_reserve {
> > >         compatible =3D "shared-dma-pool";
> > >         size =3D <0x0 0x2000000>; /* 32 MiB */
> > >         ...
> > >     };
> > > };
> > >
> > > Solution: Add a new config ARCH_FORCE_PAGE_BLOCK_ORDER that
> > > allows to set the page block order. The maximum page block
> > > order will be given by ARCH_FORCE_MAX_ORDER.
> >
> > Why not use a boot time parameter to change page block order?
>
> That is a good option. The main tradeoff is:
>
> - The bootloader would have to be updated on the devices to pass the righ=
t
> pageblock_order value depending on the kernel page size. Currently,
> We can boot 4k/16k kernels without any change in the bootloader.

Once we change the page block order we likely need to update the CMA
reservations in the device tree to match the new min alignment, which
needs to be recompiled and flashed to the device. So there is likely
not a significant process saving by making the page block order a boot
parameter.

-- Kalesh

>
> > Otherwise, you will need to maintain an additional kernel
> > binary for your use case.
> >
>
> Unfortunately, we still need 2 kernel binaries, one for 4k and another fo=
r 16k.
> There are several data structures that are aligned at compile time based =
on the
> PAGE_SIZE (__aligned(PAGE_SIZE)) that makes it difficult to have only one
> binary.
>
> For example:
>
> static u8 idmap_ptes[IDMAP_LEVELS - 1][PAGE_SIZE] __aligned(PAGE_SIZE)
> __ro_after_init,
>  kpti_ptes[IDMAP_LEVELS - 1][PAGE_SIZE] __aligned(PAGE_SIZE) __ro_after_i=
nit;
>
> https://elixir.bootlin.com/linux/v6.14.4/source/arch/arm64/mm/mmu.c#L780
>
> Thanks
> Juan
>
> > --
> > Best Regards,
> > Yan, Zi
