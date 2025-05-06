Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A3928135C
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 16:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746547713; cv=none; b=d7HMt58VPwqC25MT/8HA5AY0dOSpcIIl2LOBIhHgP7y76pBup1myjLh8Np4wp855ZzS1YZKUpstoQrM2JMl9JxdavR7NKpjqYe6fuotufvo9TN6ZIvYxaji46xxsubNUag0Mk5aBqAReDbaTgxTcLOISxYzpO/t9Bx0FA61EWPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746547713; c=relaxed/simple;
	bh=E9YHQNfPMb/1LtnLrjIPM34heDNccVoLFbFwQK89V5Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JT418ao8/sY9wumkyURP3l8QTKYVjduje+17P5adZ1w1Kard9LBEX0143QaZrxEaTBg4YXC4CgXagkhX5MayEhydlsBzW74vWqgkeoiFHa4LjveiTZGuYfSX3KIh+PYAOcFUiU7kEdF/M6TBm+L6/SiZiPp2GhKbjfH6D7XdK4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YpniID65; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YpniID65"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-47666573242so403981cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 09:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746547710; x=1747152510; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xWJ9zoUWlBUqE0sXfkCqGQm7u6SmJH3pxd7Z4uT65pU=;
        b=YpniID656A6bxiY3sicozR5VKI+oPWFyaPczH2BO/+OIa9hyaIg/uApGtwwmDJtshC
         m1qXepzZLxRnfqFLLp0lwLX39cNks23TjFoxkN9GbDKu7jMQ4d6jmQFvEssm3DWhEU/t
         vnff0gd77sVWm9wl6BeEjIqszKd7KYmx+O+tLsVbcfE5I3Jwh0uMFvfBA4RRQdoZzPfI
         tWbuUTDqldrKQHm/5t0h3JKIO9m8hfcqFa7XlFqEt23wO+rn8jmUTnEiSYi/vFuCkYp0
         /SXZA0mOOFv+y4C4xvaQeRobrj5vzqUZhlKDlV4xxPS6FZ5E47naJ2H+F3DYByna7WtP
         A+Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746547710; x=1747152510;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xWJ9zoUWlBUqE0sXfkCqGQm7u6SmJH3pxd7Z4uT65pU=;
        b=M9ZSPCBD/nowaX2ol2NmPrqx/wQslXMBVD29rv1JsrA5sHpOUdmI3f7cHpcP6Pr/Xa
         iNCAlmcu/53zZHQ5dRQFMSKsxv6CeiD2Tz2+C2m1RZosWJwxNWhl5BhhXpON8g6Rlitk
         TpuS4/5X4QXu8D/yQiT2nZEVmqooUt6TC3zWcyhg5EjOq1fLegHB/L9u0PkjDoLL52lm
         wvLZjfNGFBU8AaHA6ks2ZrcBEaR3LCTUbJwJhOX0fQu1r+mIwwruzjBGXT+HG9jmO5cU
         fC9HDZ1VHpqIX6cJB2D8PUUn2fhHwvbM+rtlcMPsh8ObJUlBvjRUk/UW+/OBA/5qpCCE
         tfLw==
X-Forwarded-Encrypted: i=1; AJvYcCU5uzmdPr8Dc1JCli0gj9xMvM4n+Gf4vULIVXtMHzToKbp+PZ0KnfTC/ri+5MnpIOvKJQnjz4R9fM52res=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUK+Ts5Dflv1CuwhIl5DlbBASSUl3H36q5p5M7An7DLGgfKJI+
	iwhu/59e3am7VYEE9ok/K27WydpeidpHDFVKH2aysZZaajsbB2QGi7fOgn1tORgXy8OnMU4wyac
	iV5c804fN+wxfOBrZ2L+S5NkJ8gc+7cXh2Ati
X-Gm-Gg: ASbGncu40haHBizV+67Z0BPsibFwO+Gb/KdVGaK+4zHOENDyGnHizw+gT/caXfUIP/o
	8yUMVpnjD975NvE0wJV9izuVslAHL9A0xCLmrScr5MW6Mgql6UYvMfe8pqfI5juEBX6235Dk3f0
	LF0kU/kgRKsgTAkzU/8e7rJ0y5oHKrOtC0HyvgPDSIYugOYjCgD4KcfAo=
X-Google-Smtp-Source: AGHT+IE9HQStKmdCVvuXN8pwokAeyXR9wvitUGA+/pdKZfFusSEcNLLWW6B0rJPJ7BYVhidXD0ZJv0veYGKl1qSxu6c=
X-Received: by 2002:a05:622a:2d2:b0:477:8686:901d with SMTP id
 d75a77b69052e-491ff65fbeamr446051cf.1.1746547709667; Tue, 06 May 2025
 09:08:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506002319.513795-1-jyescas@google.com> <64a0c678-ead9-4620-b69b-e631d6e540f9@arm.com>
In-Reply-To: <64a0c678-ead9-4620-b69b-e631d6e540f9@arm.com>
From: Juan Yescas <jyescas@google.com>
Date: Tue, 6 May 2025 09:08:17 -0700
X-Gm-Features: ATxdqUEwGUN7QDvI02zIl2FoaXEI0NoL7oCbzfgxmcbq_TL4RqObWLAXRIFXArQ
Message-ID: <CAJDx_riQQR+dfxQyzCtM-BCJ5w6X3kwA6MmoP+rNhAWszyt43Q@mail.gmail.com>
Subject: Re: [PATCH v3] mm: Add CONFIG_PAGE_BLOCK_ORDER to select page block order
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, tjmercier@google.com, isaacmanjarres@google.com, 
	surenb@google.com, kaleshsingh@google.com, Vlastimil Babka <vbabka@suse.cz>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>, Minchan Kim <minchan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 5, 2025 at 11:53=E2=80=AFPM Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
>
> On 5/6/25 05:52, Juan Yescas wrote:
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
> > For example, in ARM, the CMA alignment requirement when:
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
>
> This indeed is a valid problem which reduces available memory for
> non-CMA page blocks on system required for general memory usage.
>
> >
> > Solution: Add a new config CONFIG_PAGE_BLOCK_ORDER that
> > allows to set the page block order in all the architectures.
> > The maximum page block order will be given by
> > ARCH_FORCE_MAX_ORDER.
> >
> > By default, CONFIG_PAGE_BLOCK_ORDER will have the same
> > value that ARCH_FORCE_MAX_ORDER. This will make sure that
> > current kernel configurations won't be affected by this
> > change. It is a opt-in change.
>
> Right.
>
> >
> > This patch will allow to have the same CMA alignment
> > requirements for large page sizes (16KiB, 64KiB) as that
> > in 4kb kernels by setting a lower pageblock_order.
> >
> > Tests:
> >
> > - Verified that HugeTLB pages work when pageblock_order is 1, 7, 10
> > on 4k and 16k kernels.
> >
> > - Verified that Transparent Huge Pages work when pageblock_order
> > is 1, 7, 10 on 4k and 16k kernels.
> >
> > - Verified that dma-buf heaps allocations work when pageblock_order
> > is 1, 7, 10 on 4k and 16k kernels.
>
> pageblock_order are choosen as 1, 7 and 10 to cover the entire possible
> range for ARCH_FORCE_MAX_ORDER. Although kernel CI should test this for
> all values in the range. Because this now opens up different ranges for
> different platforms which were never tested earlier.
>
> >
> > Benchmarks:
> >
> > The benchmarks compare 16kb kernels with pageblock_order 10 and 7. The
> > reason for the pageblock_order 7 is because this value makes the min
> > CMA alignment requirement the same as that in 4kb kernels (2MB).
> >
> > - Perform 100K dma-buf heaps (/dev/dma_heap/system) allocations of
> > SZ_8M, SZ_4M, SZ_2M, SZ_1M, SZ_64, SZ_8, SZ_4. Use simpleperf
> > (https://developer.android.com/ndk/guides/simpleperf) to measure
> > the # of instructions and page-faults on 16k kernels.
> > The benchmark was executed 10 times. The averages are below:
> >
> >            # instructions         |     #page-faults
> >     order 10     |  order 7       | order 10 | order 7
> > --------------------------------------------------------
> >  13,891,765,770        | 11,425,777,314 |    220   |   217
> >  14,456,293,487        | 12,660,819,302 |    224   |   219
> >  13,924,261,018        | 13,243,970,736 |    217   |   221
> >  13,910,886,504        | 13,845,519,630 |    217   |   221
> >  14,388,071,190        | 13,498,583,098 |    223   |   224
> >  13,656,442,167        | 12,915,831,681 |    216   |   218
> >  13,300,268,343        | 12,930,484,776 |    222   |   218
> >  13,625,470,223        | 14,234,092,777 |    219   |   218
> >  13,508,964,965        | 13,432,689,094 |    225   |   219
> >  13,368,950,667        | 13,683,587,37  |    219   |   225
> > -------------------------------------------------------------------
> >  13,803,137,433  | 13,131,974,268 |    220   |   220    Averages
> >
> > There were 4.85% #instructions when order was 7, in comparison
> > with order 10.
> >
> >      13,803,137,433 - 13,131,974,268 =3D -671,163,166 (-4.86%)
> >
> > The number of page faults in order 7 and 10 were the same.
> >
> > These results didn't show any significant regression when the
> > pageblock_order is set to 7 on 16kb kernels.
> >
> > - Run speedometer 3.1 (https://browserbench.org/Speedometer3.1/) 5 time=
s
> >  on the 16k kernels with pageblock_order 7 and 10.
> >
> > order 10 | order 7  | order 7 - order 10 | (order 7 - order 10) %
> > -------------------------------------------------------------------
> >   15.8         |  16.4    |         0.6        |     3.80%
> >   16.4         |  16.2    |        -0.2        |    -1.22%
> >   16.6         |  16.3    |        -0.3        |    -1.81%
> >   16.8         |  16.3    |        -0.5        |    -2.98%
> >   16.6         |  16.8    |         0.2        |     1.20%
> > -------------------------------------------------------------------
> >   16.44     16.4            -0.04               -0.24%   Averages
> >
> > The results didn't show any significant regression when the
> > pageblock_order is set to 7 on 16kb kernels.
> >
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: Vlastimil Babka <vbabka@suse.cz>
> > Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
> > Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > Cc: David Hildenbrand <david@redhat.com>
> > CC: Mike Rapoport <rppt@kernel.org>
> > Cc: Zi Yan <ziy@nvidia.com>
> > Cc: Suren Baghdasaryan <surenb@google.com>
> > Cc: Minchan Kim <minchan@kernel.org>
> > Signed-off-by: Juan Yescas <jyescas@google.com>
> > Acked-by: Zi Yan <ziy@nvidia.com>
> > ---
> > Changes in v3:
> >   - Rename ARCH_FORCE_PAGE_BLOCK_ORDER to PAGE_BLOCK_ORDER
> >     as per Matthew's suggestion.
> >   - Update comments in pageblock-flags.h for pageblock_order
> >     value when THP or HugeTLB are not used.
> >
> > Changes in v2:
> >   - Add Zi's Acked-by tag.
> >   - Move ARCH_FORCE_PAGE_BLOCK_ORDER config to mm/Kconfig as
> >     per Zi and Matthew suggestion so it is available to
> >     all the architectures.
> >   - Set ARCH_FORCE_PAGE_BLOCK_ORDER to 10 by default when
> >     ARCH_FORCE_MAX_ORDER is not available.
> >
> >
> >
> >
> >  include/linux/pageblock-flags.h | 14 ++++++++++----
> >  mm/Kconfig                      | 31 +++++++++++++++++++++++++++++++
> >  2 files changed, 41 insertions(+), 4 deletions(-)
> >
> > diff --git a/include/linux/pageblock-flags.h b/include/linux/pageblock-=
flags.h
> > index fc6b9c87cb0a..0c4963339f0b 100644
> > --- a/include/linux/pageblock-flags.h
> > +++ b/include/linux/pageblock-flags.h
> > @@ -28,6 +28,12 @@ enum pageblock_bits {
> >       NR_PAGEBLOCK_BITS
> >  };
> >
> > +#if defined(CONFIG_PAGE_BLOCK_ORDER)
> > +#define PAGE_BLOCK_ORDER CONFIG_PAGE_BLOCK_ORDER
> > +#else
> > +#define PAGE_BLOCK_ORDER MAX_PAGE_ORDER
> > +#endif /* CONFIG_PAGE_BLOCK_ORDER */
> > +
> >  #if defined(CONFIG_HUGETLB_PAGE)
> >
> >  #ifdef CONFIG_HUGETLB_PAGE_SIZE_VARIABLE
> > @@ -41,18 +47,18 @@ extern unsigned int pageblock_order;
> >   * Huge pages are a constant size, but don't exceed the maximum alloca=
tion
> >   * granularity.
> >   */
> > -#define pageblock_order              MIN_T(unsigned int, HUGETLB_PAGE_=
ORDER, MAX_PAGE_ORDER)
> > +#define pageblock_order              MIN_T(unsigned int, HUGETLB_PAGE_=
ORDER, PAGE_BLOCK_ORDER)
> >
> >  #endif /* CONFIG_HUGETLB_PAGE_SIZE_VARIABLE */
> >
> >  #elif defined(CONFIG_TRANSPARENT_HUGEPAGE)
> >
> > -#define pageblock_order              MIN_T(unsigned int, HPAGE_PMD_ORD=
ER, MAX_PAGE_ORDER)
> > +#define pageblock_order              MIN_T(unsigned int, HPAGE_PMD_ORD=
ER, PAGE_BLOCK_ORDER)
> >
> >  #else /* CONFIG_TRANSPARENT_HUGEPAGE */
> >
> > -/* If huge pages are not used, group by MAX_ORDER_NR_PAGES */
> > -#define pageblock_order              MAX_PAGE_ORDER
> > +/* If huge pages are not used, group by PAGE_BLOCK_ORDER */
> > +#define pageblock_order              PAGE_BLOCK_ORDER
> >
> >  #endif /* CONFIG_HUGETLB_PAGE */
> >
>
> These all look good.
>
> > diff --git a/mm/Kconfig b/mm/Kconfig
> > index e113f713b493..c52be3489aa3 100644
> > --- a/mm/Kconfig
> > +++ b/mm/Kconfig
> > @@ -989,6 +989,37 @@ config CMA_AREAS
> >
> >         If unsure, leave the default value "8" in UMA and "20" in NUMA.
> >
> > +#
> > +# Select this config option from the architecture Kconfig, if availabl=
e, to set
> > +# the max page order for physically contiguous allocations.
> > +#
> > +config ARCH_FORCE_MAX_ORDER
> > +     int
>
> ARCH_FORCE_MAX_ORDER needs to be defined here first before PAGE_BLOCK_ORD=
ER
> could use that subsequently.But ARCH_FORCE_MAX_ORDER is defined in variou=
s
> architectures in 'int' or 'int "<description>"' formats. So could there b=
e
> a problem for this config to be defined both in generic and platform code=
 ?
> But clearly ARCH_FORCE_MAX_ORDER still remains a arch specific config.
>
> #git grep "config ARCH_FORCE_MAX_ORDER"
> arch/arc/Kconfig:config ARCH_FORCE_MAX_ORDER
> arch/arm/Kconfig:config ARCH_FORCE_MAX_ORDER
> arch/arm64/Kconfig:config ARCH_FORCE_MAX_ORDER
> arch/loongarch/Kconfig:config ARCH_FORCE_MAX_ORDER
> arch/m68k/Kconfig.cpu:config ARCH_FORCE_MAX_ORDER
> arch/mips/Kconfig:config ARCH_FORCE_MAX_ORDER
> arch/nios2/Kconfig:config ARCH_FORCE_MAX_ORDER
> arch/powerpc/Kconfig:config ARCH_FORCE_MAX_ORDER
> arch/sh/mm/Kconfig:config ARCH_FORCE_MAX_ORDER
> arch/sparc/Kconfig:config ARCH_FORCE_MAX_ORDER
> arch/xtensa/Kconfig:config ARCH_FORCE_MAX_ORDER
> mm/Kconfig:config ARCH_FORCE_MAX_ORDER
>
> arch/arc/
>
> config ARCH_FORCE_MAX_ORDER
>         int "Maximum zone order"
>
> arch/arm/
>
> config ARCH_FORCE_MAX_ORDER
>         int "Order of maximal physically contiguous allocations"
>
> arch/arm64/
>
> config ARCH_FORCE_MAX_ORDER
>         int
> ...........
>
> arch/sparc/
>
> config ARCH_FORCE_MAX_ORDER
>         int "Order of maximal physically contiguous allocations"
>
> > +
> > +# When ARCH_FORCE_MAX_ORDER is not defined, the default page block ord=
er is 10,
>
> Just wondering - why the default is 10 ?
>

When CONFIG_ARCH_FORCE_MAX_ORDER is not defined, the default is 10
for MAX_PAGE_ORDER in include/linux/mmzone.h.

https://elixir.bootlin.com/linux/v6.15-rc5/source/include/linux/mmzone.h#L3=
0

My understanding is that with the default order 10 for MAX_PAGE_ORDER,
we make sure that we can allocate huge pages using the buddy allocator
when PAGE_SIZE =3D 4096. For example, we can allocate 2 huge pages
of 2MiB using the buddy allocator:

(2 ^ 10) * 4096 =3D 4194304 =3D 4 MiB

Could any of the mm experts confirm this?

> > +# as per include/linux/mmzone.h.
> > +config PAGE_BLOCK_ORDER
> > +     int "Page Block Order"
> > +     range 1 10 if !ARCH_FORCE_MAX_ORDER
>
> Also why the range is restricted to 10 ?

The PAGE_BLOCK_ORDER has to be less or equal to the MAX_PAGE_ORDER
when ARCH_FORCE_MAX_ORDER is not defined.

Thanks
Juan

>
> > +     default 10 if !ARCH_FORCE_MAX_ORDER
> > +     range 1 ARCH_FORCE_MAX_ORDER if ARCH_FORCE_MAX_ORDER
> > +     default ARCH_FORCE_MAX_ORDER if ARCH_FORCE_MAX_ORDER
>
> We still have the MAX_PAGE_ORDER which maps into ARCH_FORCE_MAX_ORDER
> when available or otherwise just falls back as 10.
>
> /* Free memory management - zoned buddy allocator.  */
> #ifndef CONFIG_ARCH_FORCE_MAX_ORDER
> #define MAX_PAGE_ORDER 10
> #else
> #define MAX_PAGE_ORDER CONFIG_ARCH_FORCE_MAX_ORDER
> #endif
>
> Hence could PAGE_BLOCK_ORDER config description block be simplified as
>
> config PAGE_BLOCK_ORDER
>         int "Page Block Order"
>         range 1 MAX_PAGE_ORDER
>         default MAX_PAGE_ORDER
>
> As MAX_PAGE_ORDER could switch between ARCH_FORCE_MAX_ORDER and 10 as
> and when required.
>
> > +
> > +     help
> > +       The page block order refers to the power of two number of pages=
 that
> > +       are physically contiguous and can have a migrate type associate=
d to
> > +       them. The maximum size of the page block order is limited by
> > +       ARCH_FORCE_MAX_ORDER.
>
> s/ARCH_FORCE_MAX_ORDER/ARCH_FORCE_MAX_ORDER when available on the platfor=
m/ ?
>
> Also mention about max range when ARCH_FORCE_MAX_ORDER is not available.
>
> > +
> > +       This option allows overriding the default setting when the page
> > +       block order requires to be smaller than ARCH_FORCE_MAX_ORDER.
> > +
> > +       Reducing pageblock order can negatively impact THP generation
> > +       successful rate. If your workloads uses THP heavily, please use=
 this
> > +       option with caution.
>
> Just wondering - could there be any other side effects besides THP ? Will=
 it
> be better to depend on CONFIG_EXPERT while selecting anything other than =
the
> default option i.e ARCH_FORCE_MAX_ORDER or 10 from the value range.
>
> > +
> > +       Don't change if unsure.
> > +
> >  config MEM_SOFT_DIRTY
> >       bool "Track memory changes"
> >       depends on CHECKPOINT_RESTORE && HAVE_ARCH_SOFT_DIRTY && PROC_FS
