Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9763257450
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 21:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746134273; cv=none; b=GR9TuWNpJMHs+wG47Xng7h1kg5NAhDC4dqe1oMk+U2bRzTjkL7pi8bGowSz6lMs4aNhIWzbiERxf+vKlio5IIFCsAPlNRKbb+3PrF9tYKnrYju9Jg7b/bQs1SHDwYNjcTvSfJZuBpknYWQBGUNWM05q0gqtTfrBWH/aIe9a6RIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746134273; c=relaxed/simple;
	bh=ZJI33z+9nbqWvm2iVptlOn2S1wwlCIMCFm1W8w7t/Bg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MijN/bNz96mAFtJvCZHqkpyb1iLR+8dr9UvPl1cur+d8TZhQe4ZlCup8zrgEvmiWu3NFi3nIiWYVuyJ+uHuL5JTJeGPOmLWY+5Fc0+AddXeBj3cWKgODWq+dYPM4a2qYVlxnL2DBmhtTVXNKGHDyn1/kdbreRjkcrOmuJHm4bwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Nanqodkr; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Nanqodkr"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-47e9fea29easo34271cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 14:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746134271; x=1746739071; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JWyQw8Cds5LESduVc1Rgu5TXLU2igPw8biM/GPcGcEE=;
        b=Nanqodkr0ZY+d3IA8iBvD/SRymE4E8KdzKXKKAb8gvNw5pt0Jhu7NXoMUg2c8r1vhU
         ZmfGtYZ6wQLSLjo61c/P5XR2a0e4OiDLI4Bh037+J/HUoOxaSv3LT/Ykw+WtFBR+U0db
         sUDXRjP3Dm4bJwDz4P1oqi3wND9HH0rJ0AGBejcjF8ns112E8alIJ95jOKLRwa04p/z9
         XQ8v9TUQ7z2aRRcedpN3FBy5QjE0gmo4tve1YUU9WXWvWJyTfMYOxJkGyCpy/2xIyrBc
         4hBx6lIEktEPlf5kBOZ4gh822Q4NvEd17LIvWjQlAPpVlCMeDrmzlsGKHQa3VH2AYMAH
         KVHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746134271; x=1746739071;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JWyQw8Cds5LESduVc1Rgu5TXLU2igPw8biM/GPcGcEE=;
        b=wu0gyg1kOX423ssbUtpAjg7cvmbYMoR4vcOQfoWk0QFa+xIdD8/nQw+F2+PCWKMjMU
         jVIWOJ5jEn1qCzigIdCQU+9RRjZxO7SKmMWzdFXKJviZrIQvDXWsgXsbMLF+U35fj6Am
         cb1AT+PxA9PT4rkBaRHoPLKLjfHPZtAyNSU1NrFAxUIDjNmkqGqvwpLsbNzGk949hYVT
         amdOWWWcAC72KWIwO1RDpEf0Ci44zO5Bu9U84ttxcQrf9arxSvx7IBmCckVN9+XgUGEU
         WoqMT1OnNhDv9aPvQaSNda5XneuOjBCNvvV2ysxln1MOX8kSkfoOVLK5KYkkmyA7xc0a
         B+jg==
X-Forwarded-Encrypted: i=1; AJvYcCVpzkgYnNQ/Hudo6MKZNkklwdo5zy3LuNanh22TJAp5dTO3mW+N2yw84oQ/bSwt4rDc85sMcNuFQjUpNy4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZW0N3ce3sldT8BOkM4GvZ7oT8ZasCoiPj2SYMvR0G2i0C740t
	1s8P1XtlUYD83V3ooLbSgDDzaMjbcwAlpXtnwSLSpAbLOpuYGVLOUukfwlVNyupuJALJ5BidRKC
	G7WRVwva4mkzxtw9k7mqmobT0+jK4/SJGAfcp
X-Gm-Gg: ASbGnctKx7u3DSsi6j4OHyF0H0g/VAEcSi7d/BNDpjkHNcHMFnFAX3nI9sAfwk0Is4T
	uUsanXFUK50Zei/98sVjHs2sveThGGRHidzPr0yTImQt7xHk8kTQ2BFMO9tuTPQ+tDwLylf0xBc
	L/AA2DNG0KA36bFsePld8Tozk1Kk0J9mgTKQDyA8L7IUBy0L8EbVvzjBth
X-Google-Smtp-Source: AGHT+IGfumJSsiisStXyn8AuifGkC9XEdJhdj92CWWPKME4nvzUrmJ0CTeBR/ov+OTDdJdNRZX5qbGMbAy/mLDFtJ18=
X-Received: by 2002:ac8:584f:0:b0:47a:cc58:1fb0 with SMTP id
 d75a77b69052e-48b0c80e383mr4627621cf.3.1746134270300; Thu, 01 May 2025
 14:17:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250501052532.1903125-1-jyescas@google.com> <15428BF6-A7DD-44ED-B225-AECD7866394C@nvidia.com>
In-Reply-To: <15428BF6-A7DD-44ED-B225-AECD7866394C@nvidia.com>
From: Juan Yescas <jyescas@google.com>
Date: Thu, 1 May 2025 14:17:38 -0700
X-Gm-Features: ATxdqUHh-eQxAZeQPnN6vxzYF4KED7BDzIubnWMQBvU9nZhpT5jXU4ibXzkaJaE
Message-ID: <CAJDx_riTDWUkFSUr9GenJMQ1Oi1=Q4wU5iNE1JfX5wWnCSesVg@mail.gmail.com>
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

On Thu, May 1, 2025 at 11:49=E2=80=AFAM Zi Yan <ziy@nvidia.com> wrote:
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
> >
> > By default, ARCH_FORCE_PAGE_BLOCK_ORDER will have the same
> > value that ARCH_FORCE_MAX_ORDER. This will make sure that
> > current kernel configurations won't be affected by this
> > change. It is a opt-in change.
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
> > ---
> >  arch/arm64/Kconfig              | 14 ++++++++++++++
> >  include/linux/pageblock-flags.h | 12 +++++++++---
> >  2 files changed, 23 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > index a182295e6f08..d784049e1e01 100644
> > --- a/arch/arm64/Kconfig
> > +++ b/arch/arm64/Kconfig
> > @@ -1658,6 +1658,20 @@ config ARCH_FORCE_MAX_ORDER
> >
> >         Don't change if unsure.
> >
> > +config ARCH_FORCE_PAGE_BLOCK_ORDER
> > +     int "Page Block Order"
> > +     range 1 ARCH_FORCE_MAX_ORDER
> > +     default ARCH_FORCE_MAX_ORDER
> > +     help
> > +       The page block order refers to the power of two number of pages=
 that
> > +       are physically contiguous and can have a migrate type associate=
d to them.
> > +       The maximum size of the page block order is limited by ARCH_FOR=
CE_MAX_ORDER.
>
> Since memory compaction operates at pageblock granularity and pageblock s=
ize
> usually matches THP size, a smaller pageblock size degrades kernel
> anti-fragmentation mechanism for THP significantly. Can you add something=
 like
> the text below to the help section?
>
> "Reducing pageblock order can negatively impact THP generation successful=
 rate.
> If your workloads uses THP heavily, please use this option with caution."
>
Thanks Zi for Pointing this out. I will add the comment in the help section=
.

> Otherwise, Acked-by: Zi Yan <ziy@nvidia.com>
>
> I am also OK if you move this to mm/Kconfig.
>

This seems reasonable to me.

> > +
> > +       This option allows overriding the default setting when the page
> > +       block order requires to be smaller than ARCH_FORCE_MAX_ORDER.
> > +
> > +       Don't change if unsure.
> > +
> >  config UNMAP_KERNEL_AT_EL0
> >       bool "Unmap kernel when running in userspace (KPTI)" if EXPERT
> >       default y
> > diff --git a/include/linux/pageblock-flags.h b/include/linux/pageblock-=
flags.h
> > index fc6b9c87cb0a..ab3de96bb50c 100644
> > --- a/include/linux/pageblock-flags.h
> > +++ b/include/linux/pageblock-flags.h
> > @@ -28,6 +28,12 @@ enum pageblock_bits {
> >       NR_PAGEBLOCK_BITS
> >  };
> >
> > +#if defined(CONFIG_ARCH_FORCE_PAGE_BLOCK_ORDER)
> > +#define PAGE_BLOCK_ORDER CONFIG_ARCH_FORCE_PAGE_BLOCK_ORDER
> > +#else
> > +#define PAGE_BLOCK_ORDER MAX_PAGE_ORDER
> > +#endif /* CONFIG_ARCH_FORCE_PAGE_BLOCK_ORDER */
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
> >  /* If huge pages are not used, group by MAX_ORDER_NR_PAGES */
> > -#define pageblock_order              MAX_PAGE_ORDER
> > +#define pageblock_order              PAGE_BLOCK_ORDER
> >
> >  #endif /* CONFIG_HUGETLB_PAGE */
> >
> > --
> > 2.49.0.906.g1f30a19c02-goog
>
>
> --
> Best Regards,
> Yan, Zi
