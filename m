Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB0522F74F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 15:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748964033; cv=none; b=ta0IaFvmOZB/+Wpem4f4f2SsTsEcNgtjHKM3dVXj1SwMXxxrAx13YKYuele6AdGNbIL3yavBZj9TxWUkehwp1/jcBnCZP4TIZ+/QwsL+x2HgFeu6TRgyutoSkfp4dAkkPLCEtRiArXttAdfK6sFty/VZ/cb0/9EjG8OQB4g6bFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748964033; c=relaxed/simple;
	bh=HS+iFi3sXNPRgnoAMRPRfrqFIG84uWgIr3xyUSIbH6g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=el6xaFb/ApTEvoavSA3eOCl8mxll6MNE6U+tHJh+HxRbF7R05XkeUH3Y5/S3Ez04mPeEHxQy2mCYm6vxn1ThwSCeJZRB1YLDH1UheCNt5nOdBaehd1qOlb32HAEia/Yn8TvNJ0+m+LbKtht1a+1EgYl3LkavmIpZg1ahjBvCheA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=O+y0WAMq; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="O+y0WAMq"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-47e9fea29easo460421cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 08:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748964031; x=1749568831; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=78CV190tK21as27HQwEeJbZdS3UbWxafS0fOVgBTz30=;
        b=O+y0WAMqFo2lV+JEySv+6efhTmOzhLVQoNbB2D29UZ+Qvt06zcu9Xys4g/XfhXlp20
         MRssvypDQstij4aX3Cx/aZTv18hCJh2NhmwsQQSYrKkDSLTFyvJ/BAExMXeGzuBUEQ7z
         oBn1REdl8S9bsDKD8SK+YDYk3CRHdxOLSa2OIqwVXwiKyMrgm+Oo3+fbi8qUb+O+2T4l
         B+QOdeGNSIY3rJiTNuzOh55O1ZWM+8O4dU2xrm6cxIfq1kroE2XBf1NQqtZqA00jIGsO
         iAfkyIFC1QPlpc1YamWrESkKkcSgbq5rOdw1iLL0nOga49pm1WRJeYiaQB/Gu04Li58Q
         yheg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748964031; x=1749568831;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=78CV190tK21as27HQwEeJbZdS3UbWxafS0fOVgBTz30=;
        b=VVZ7VkXfeKw2PvpAjTJ1l0iLF8AIhGsbSSFrjiwLiObU0E7jPnMEEQtCr9RFBFXdaS
         x7+L9Mte6l1WSdEnM18Qp+O62n9J9fwlqKfZ+59SOMlVuhWR/WCCnjplMMZAKpVCxnln
         AFBNKdEI0GpXPwKbStTuAgOiVIdXYu8EuSaNf1EGPx/NY/QmxixfhUf6My5v9/gurM9j
         M8dI97j1lbRNQ6UYZzrgGz+5yDxgH1yMmygCHUYc+KzcodsY4FBsKFE97aWImTaKueys
         7M9/IIq2MnKdDCREmZ7y2iugt/lqEpIrvkZSazEk3KGZlMOiFWVN3gv6uJwdBZoumY/O
         6cjA==
X-Forwarded-Encrypted: i=1; AJvYcCX7m2CuB4qt3ZoDjzcNyhg+lmaVqkUBORbCFqBrb4DZKaj3tOwGnJ8pErOdoflVnLTbQzcUmp7pm8vemLY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIS+qZD8BFx56rnqGQgoe8Sw3qtBySnji53BHalSd/c74N+I2t
	5MWekHkxmj2KUPCexbfHuxCcMNitOEh7kYEcYcEXVjM0XIyiS9jXh1WI10ikj1oLn/NOMccCCcJ
	l9w4JhnobCF9yYA4xIAGnQXmv+AEoILMatP1Ucuon
X-Gm-Gg: ASbGnct85DpbHBnJfdUHVH36wwuolbj1+8hmT6e6XtOGVYZ7LzD0KR+fPfMRxF//h2+
	WvKCOmRIR+Uv5geyW/KU2DQajoMmtAka7+8rxtXIbgBLyN+45b1GLRSZ3HVdd/7CkPKEEP1RT1Q
	IirXNe1R0JVx9sFw0uj9E3JWHbSX6PwcshcZr7MDR03IyApJc11To7424bfWYbgYwhKaobO2N26
	KXrow==
X-Google-Smtp-Source: AGHT+IEU2NWoKYw6uCt0aYXE5UKwpld70+yPiKC82maUxmd5SAPQO/hpqZHa8bNTdqgscuMj0WhGcvE3AIdEsV6fR08=
X-Received: by 2002:ac8:6f17:0:b0:494:5797:ccad with SMTP id
 d75a77b69052e-4a59ae60a8bmr4187011cf.9.1748964030412; Tue, 03 Jun 2025
 08:20:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250521215807.1860663-1-jyescas@google.com> <54943dbb-45fe-4b69-a6a8-96381304a268@redhat.com>
In-Reply-To: <54943dbb-45fe-4b69-a6a8-96381304a268@redhat.com>
From: Juan Yescas <jyescas@google.com>
Date: Tue, 3 Jun 2025 08:20:18 -0700
X-Gm-Features: AX0GCFsk2ndzQ--DMsZEMW04cQTVWDjnNyZEio1KWux__YHKC7qFkD7N7-vV8vo
Message-ID: <CAJDx_ribbY-f5ctQf=raFs3i+Ugky=GWzpOLMw8wGgi2upgZFg@mail.gmail.com>
Subject: Re: [PATCH v7] mm: Add CONFIG_PAGE_BLOCK_ORDER to select page block order
To: David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Zi Yan <ziy@nvidia.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	tjmercier@google.com, isaacmanjarres@google.com, kaleshsingh@google.com, 
	masahiroy@kernel.org, Minchan Kim <minchan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 3, 2025 at 6:03=E2=80=AFAM David Hildenbrand <david@redhat.com>=
 wrote:
>
> On 21.05.25 23:57, Juan Yescas wrote:
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
> >     4KiB   |      10        |       9         |  4KiB * (2 ^  9) =3D   =
2MiB
> >    16Kib   |      11        |      11         | 16KiB * (2 ^ 11) =3D  3=
2MiB
> >    64KiB   |      13        |      13         | 64KiB * (2 ^ 13) =3D 51=
2MiB
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
> >     4KiB   |      15        |      15         |  4KiB * (2 ^ 15) =3D 12=
8MiB
> >    16Kib   |      13        |      13         | 16KiB * (2 ^ 13) =3D 12=
8MiB
> >    64KiB   |      13        |      13         | 64KiB * (2 ^ 13) =3D 51=
2MiB
> >
> > This affects the CMA reservations for the drivers. If a driver in a
> > 4KiB kernel needs 4MiB of CMA memory, in a 16KiB kernel, the minimal
> > reservation has to be 32MiB due to the alignment requirements:
> >
> > reserved-memory {
> >      ...
> >      cma_test_reserve: cma_test_reserve {
> >          compatible =3D "shared-dma-pool";
> >          size =3D <0x0 0x400000>; /* 4 MiB */
> >          ...
> >      };
> > };
> >
> > reserved-memory {
> >      ...
> >      cma_test_reserve: cma_test_reserve {
> >          compatible =3D "shared-dma-pool";
> >          size =3D <0x0 0x2000000>; /* 32 MiB */
> >          ...
> >      };
> > };
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
> >             # instructions         |     #page-faults
> >      order 10     |  order 7       | order 10 | order 7
> > --------------------------------------------------------
> >   13,891,765,770       | 11,425,777,314 |    220   |   217
> >   14,456,293,487       | 12,660,819,302 |    224   |   219
> >   13,924,261,018       | 13,243,970,736 |    217   |   221
> >   13,910,886,504       | 13,845,519,630 |    217   |   221
> >   14,388,071,190       | 13,498,583,098 |    223   |   224
> >   13,656,442,167       | 12,915,831,681 |    216   |   218
> >   13,300,268,343       | 12,930,484,776 |    222   |   218
> >   13,625,470,223       | 14,234,092,777 |    219   |   218
> >   13,508,964,965       | 13,432,689,094 |    225   |   219
> >   13,368,950,667       | 13,683,587,37  |    219   |   225
> > -------------------------------------------------------------------
> >   13,803,137,433  | 13,131,974,268 |    220   |   220    Averages
> >
> > There were 4.85% #instructions when order was 7, in comparison
> > with order 10.
> >
> >       13,803,137,433 - 13,131,974,268 =3D -671,163,166 (-4.86%)
> >
> > The number of page faults in order 7 and 10 were the same.
> >
> > These results didn't show any significant regression when the
> > pageblock_order is set to 7 on 16kb kernels.
> >
> > - Run speedometer 3.1 (https://browserbench.org/Speedometer3.1/) 5 time=
s
> >   on the 16k kernels with pageblock_order 7 and 10.
> >
> > order 10 | order 7  | order 7 - order 10 | (order 7 - order 10) %
> > -------------------------------------------------------------------
> >    15.8        |  16.4    |         0.6        |     3.80%
> >    16.4        |  16.2    |        -0.2        |    -1.22%
> >    16.6        |  16.3    |        -0.3        |    -1.81%
> >    16.8        |  16.3    |        -0.5        |    -2.98%
> >    16.6        |  16.8    |         0.2        |     1.20%
> > -------------------------------------------------------------------
> >    16.44     16.4            -0.04              -0.24%   Averages
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
> > Changes in v7:
> >    - Update alignment calculation to 2MiB as per David's
> >      observation.
> >    - Update page block order calculation in mm/mm_init.c for
> >      powerpc when CONFIG_HUGETLB_PAGE_SIZE_VARIABLE is set.
> >
> > Changes in v6:
> >    - Applied the change provided by Zi Yan to fix
> >      the Kconfig. The change consists in evaluating
> >      to true or false in the if expression for range:
> >      range 1 <symbol> if <expression to eval true/false>.
> >
> > Changes in v5:
> >    - Remove the ranges for CONFIG_PAGE_BLOCK_ORDER. The
> >      ranges with config definitions don't work in Kconfig,
> >      for example (range 1 MY_CONFIG).
> >    - Add PAGE_BLOCK_ORDER_MANUAL config for the
> >      page block order number. The default value was not
> >      defined.
> >    - Fix typos reported by Andrew.
> >    - Test default configs in powerpc.
> >
> > Changes in v4:
> >    - Set PAGE_BLOCK_ORDER in incluxe/linux/mmzone.h to
> >      validate that MAX_PAGE_ORDER >=3D PAGE_BLOCK_ORDER at
> >      compile time.
> >    - This change fixes the warning in:
> >      https://lore.kernel.org/oe-kbuild-all/202505091548.FuKO4b4v-lkp@in=
tel.com/
> >
> > Changes in v3:
> >    - Rename ARCH_FORCE_PAGE_BLOCK_ORDER to PAGE_BLOCK_ORDER
> >      as per Matthew's suggestion.
> >    - Update comments in pageblock-flags.h for pageblock_order
> >      value when THP or HugeTLB are not used.
> >
> > Changes in v2:
> >    - Add Zi's Acked-by tag.
> >    - Move ARCH_FORCE_PAGE_BLOCK_ORDER config to mm/Kconfig as
> >      per Zi and Matthew suggestion so it is available to
> >      all the architectures.
> >    - Set ARCH_FORCE_PAGE_BLOCK_ORDER to 10 by default when
> >      ARCH_FORCE_MAX_ORDER is not available.
> >
> >   include/linux/mmzone.h          | 16 ++++++++++++++++
> >   include/linux/pageblock-flags.h |  8 ++++----
> >   mm/Kconfig                      | 34 ++++++++++++++++++++++++++++++++=
+
> >   mm/mm_init.c                    |  2 +-
> >   4 files changed, 55 insertions(+), 5 deletions(-)
> >
> > diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> > index 6ccec1bf2896..05610337bbb6 100644
> > --- a/include/linux/mmzone.h
> > +++ b/include/linux/mmzone.h
> > @@ -37,6 +37,22 @@
> >
> >   #define NR_PAGE_ORDERS (MAX_PAGE_ORDER + 1)
> >
> > +/* Defines the order for the number of pages that have a migrate type.=
 */
> > +#ifndef CONFIG_PAGE_BLOCK_ORDER
> > +#define PAGE_BLOCK_ORDER MAX_PAGE_ORDER
> > +#else
> > +#define PAGE_BLOCK_ORDER CONFIG_PAGE_BLOCK_ORDER
> > +#endif /* CONFIG_PAGE_BLOCK_ORDER */
> > +
> > +/*
> > + * The MAX_PAGE_ORDER, which defines the max order of pages to be allo=
cated
> > + * by the buddy allocator, has to be larger or equal to the PAGE_BLOCK=
_ORDER,
> > + * which defines the order for the number of pages that can have a mig=
rate type
> > + */
> > +#if (PAGE_BLOCK_ORDER > MAX_PAGE_ORDER)
> > +#error MAX_PAGE_ORDER must be >=3D PAGE_BLOCK_ORDER
> > +#endif
> > +
> >   /*
> >    * PAGE_ALLOC_COSTLY_ORDER is the order at which allocations are deem=
ed
> >    * costly to service.  That is between allocation orders which should
> > diff --git a/include/linux/pageblock-flags.h b/include/linux/pageblock-=
flags.h
> > index fc6b9c87cb0a..e73a4292ef02 100644
> > --- a/include/linux/pageblock-flags.h
> > +++ b/include/linux/pageblock-flags.h
> > @@ -41,18 +41,18 @@ extern unsigned int pageblock_order;
> >    * Huge pages are a constant size, but don't exceed the maximum alloc=
ation
> >    * granularity.
> >    */
> > -#define pageblock_order              MIN_T(unsigned int, HUGETLB_PAGE_=
ORDER, MAX_PAGE_ORDER)
> > +#define pageblock_order              MIN_T(unsigned int, HUGETLB_PAGE_=
ORDER, PAGE_BLOCK_ORDER)
> >
> >   #endif /* CONFIG_HUGETLB_PAGE_SIZE_VARIABLE */
> >
> >   #elif defined(CONFIG_TRANSPARENT_HUGEPAGE)
> >
> > -#define pageblock_order              MIN_T(unsigned int, HPAGE_PMD_ORD=
ER, MAX_PAGE_ORDER)
> > +#define pageblock_order              MIN_T(unsigned int, HPAGE_PMD_ORD=
ER, PAGE_BLOCK_ORDER)
> >
> >   #else /* CONFIG_TRANSPARENT_HUGEPAGE */
> >
> > -/* If huge pages are not used, group by MAX_ORDER_NR_PAGES */
> > -#define pageblock_order              MAX_PAGE_ORDER
> > +/* If huge pages are not used, group by PAGE_BLOCK_ORDER */
> > +#define pageblock_order              PAGE_BLOCK_ORDER
> >
> >   #endif /* CONFIG_HUGETLB_PAGE */
> >
> > diff --git a/mm/Kconfig b/mm/Kconfig
> > index e113f713b493..13a5c4f6e6b6 100644
> > --- a/mm/Kconfig
> > +++ b/mm/Kconfig
> > @@ -989,6 +989,40 @@ config CMA_AREAS
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
> > +
> > +#
> > +# When ARCH_FORCE_MAX_ORDER is not defined,
> > +# the default page block order is MAX_PAGE_ORDER (10) as per
> > +# include/linux/mmzone.h.
> > +#
> > +config PAGE_BLOCK_ORDER
> > +     int "Page Block Order"
> > +     range 1 10 if ARCH_FORCE_MAX_ORDER =3D 0
> > +     default 10 if ARCH_FORCE_MAX_ORDER =3D 0
> > +     range 1 ARCH_FORCE_MAX_ORDER if ARCH_FORCE_MAX_ORDER !=3D 0
> > +     default ARCH_FORCE_MAX_ORDER if ARCH_FORCE_MAX_ORDER !=3D 0
> > +     help
> > +       The page block order refers to the power of two number of pages=
 that
> > +       are physically contiguous and can have a migrate type associate=
d to
> > +       them. The maximum size of the page block order is limited by
> > +       ARCH_FORCE_MAX_ORDER.
> > +
> > +       This config allows overriding the default page block order when=
 the
> > +       page block order is required to be smaller than ARCH_FORCE_MAX_=
ORDER
> > +       or MAX_PAGE_ORDER.
> > +
> > +       Reducing pageblock order can negatively impact THP generation
> > +       success rate. If your workloads uses THP heavily, please use th=
is
> > +       option with caution.
> > +
> > +       Don't change if unsure.
>
>
> The semantics are now very confusing [1]. The default in x86-64 will be
> 10, so we'll have
>
> CONFIG_PAGE_BLOCK_ORDER=3D10
>
>
> But then, we'll do this
>
> #define pageblock_order MIN_T(unsigned int, HPAGE_PMD_ORDER,
> PAGE_BLOCK_ORDER)
>
>
> So the actual pageblock order will be different than
> CONFIG_PAGE_BLOCK_ORDER.
>
> Confusing.

I agree that it becomes confusing due that pageblock_order value
depends on whether THP, HugeTLB
are set or not.

>
> Either CONFIG_PAGE_BLOCK_ORDER is misnamed (CONFIG_PAGE_BLOCK_ORDER_CEIL
> ? CONFIG_PAGE_BLOCK_ORDER_LIMIT ?), or the semantics should be changed.
>

We could rename the configuration to CONFIG_PAGE_BLOCK_ORDER_CEIL.

> [1] https://gitlab.com/cki-project/kernel-ark/-/merge_requests/3928
>
> --
> Cheers,
>
> David / dhildenb
>
