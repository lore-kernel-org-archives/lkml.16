Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564331459F6
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 16:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747846334; cv=none; b=IRBX4TBTE0vr/cm5C+Yvt/JxrsTNel5+GBe2Q43da8dkCO4trYIEEpg0ix7wD0nc3YJqQ5T0h7lCI8hQE6HIkfoVQEgH0ulCGNE3LnzzauOSjvI9Y9Lfmq4JjfP1d9+LuIYdTaCG74Idpb9QO5nZ4ktwxOPpjn/hoj5aGexapMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747846334; c=relaxed/simple;
	bh=SEvDtKvKMRqzf3gUp8Oq2TiR61IzFdIBmkZSXdyyO+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IhfKjR20a+5WTOIpHU6bMXSdgstrG+hS94K4VDWe+6tZA/USbsriLfWgasS9kCkEl6JZdZkRGf0WMgUDPfRXr3/XYXAl61I9lRBYGC2WWbRKt+IWTmsFi/0LsNe6YKciEtk5uO+56Oh6pZJds1b1Yl5bT3+VoGwR/51hXyqaA78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FoWm/H88; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FoWm/H88"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-47e9fea29easo1802351cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 09:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747846331; x=1748451131; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xzr5DN7c10BBUBlQ2M+z0tfhq4oVhDixEXUCPIoodw4=;
        b=FoWm/H88h3yBBkMzfLQitEAKNF2NvPqXPkw1EqyedryedTCpXwBxfvLYNDzLvmJqUb
         g9uHR/NV0zfiy00QvHlJpetuOml6Re3YKQ98R/s/TJFsGU6IdgbrOYV/I+HWgan7LXkj
         Y5s34g/WKM8nRgSIhyHiV1Xg/MrC357b9NGL/rascI42TU0Ye+l8gc7jQ+dCpm+XiYXA
         NcTnc6xbhabC7EOAre0uOuy2VysBbh3A6MY14+tRHwkETxOhV+IUv+4PwmUFF+AwTkm7
         /UJw3FIduJS+5dz93lawS+LudUm4R68EXqDnCRrxE2lfj/W5ffdBj0KILDctjKnP4bUV
         BjqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747846331; x=1748451131;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xzr5DN7c10BBUBlQ2M+z0tfhq4oVhDixEXUCPIoodw4=;
        b=uooPWz0HmAc10Klf9FJPC5S02ZP+wmHGvx29u7qX7bU6NEAQq1CyIxifSF8wN2s6mr
         EJQfLWNbwq355mZogHd7NoxBcn+qpM/Oqi2RkAYbRJ84YW55DKkIbsIc+PUyyjji1NhT
         Y0l89pW8lF4iVvJvZlZeN7IAEVOm+4XbrMjKYxMgAb2mYp3lBfnuneSrhd55iopRKEU1
         I1EtO/BELXKvBB961zd/797yJJjUSEVDS83kJUZKs/fH2K3cpPK9Z8WiO7RmnWmUxtaC
         ifWDLgplchLuTBoTvgmvj3TJE6YIJcxvps24Ak3crw+guursbUZeK0IVbI+ia0QCsaKN
         a+qg==
X-Forwarded-Encrypted: i=1; AJvYcCXg+SrzQHIogvNalkc9EixkTweiybmiVKAJxgBHtztzGyAGZrML7BckoqQ4IADuq2x8A0b13sism4siih8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZofO0oiQ++OWyaeovvMRT10n1HBXm8JzgPt0hFIKMD8gvCvT3
	aGsqIP33lLtikgI3saKckYSs3xKOfbaXKxVcvECetMtIZ0XNqh6COwJwIOLCXt/vBBPjHC9Oiju
	4Mgaf9Rb/HHow3GXlbQczrhOw5slvCvB3bMQzo8x6
X-Gm-Gg: ASbGnctLitQMJpDcS8IfM1eYLCubl5DjCgh/8roufpSNOF46K99DxGNvGVZIbvJCgz3
	38lqaUteE4Q9dnRuu1AkApP3A9RDy50g5Sd0ykYob7sETgjsgCaxzHNVzmOpE/fIK3vtAByZehM
	jw1xWgln2URaXIlWrBUoDkDqvxjH/K5ECttM/AecAOW1Q54E2oaqEef6DgrrAEUePslm5CgtzIb
	LBXTQ==
X-Google-Smtp-Source: AGHT+IGkNe6g6hLI65pZPw+VIFqBt2XeJtJ7r0s1dnUHwABvl0FENopO0L4DnTuzFvXZH6CzSDb2Pt/F3IDOE3dNzY4=
X-Received: by 2002:a05:622a:1826:b0:494:af4b:59fd with SMTP id
 d75a77b69052e-49595d52c6emr18378601cf.18.1747846330794; Wed, 21 May 2025
 09:52:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520225945.991229-1-jyescas@google.com> <28a2881d-fd33-44d9-a212-adeb8600e15b@redhat.com>
In-Reply-To: <28a2881d-fd33-44d9-a212-adeb8600e15b@redhat.com>
From: Juan Yescas <jyescas@google.com>
Date: Wed, 21 May 2025 09:51:58 -0700
X-Gm-Features: AX0GCFtzzMydHhPRZJlML7H8EGmro4cbDr5qsfwSbfNq5AjZkA7_wmFNUAGiUNo
Message-ID: <CAJDx_rjyLXxFxCG3QENN23+Xcao=_jeLTDZho0xrLm5i=Sc9GQ@mail.gmail.com>
Subject: Re: [PATCH v6] mm: Add CONFIG_PAGE_BLOCK_ORDER to select page block order
To: David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Zi Yan <ziy@nvidia.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	tjmercier@google.com, isaacmanjarres@google.com, kaleshsingh@google.com, 
	masahiroy@kernel.org, Minchan Kim <minchan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 11:47=E2=80=AFPM David Hildenbrand <david@redhat.co=
m> wrote:
>
> On 21.05.25 00:59, Juan Yescas wrote:
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
> >     4KiB   |      10        |      10         |  4KiB * (2 ^ 10)  =3D  =
4MiB
>
> Why is pageblock_nr_pages 10 in that case?
>
>         #define pageblock_order MIN_T(unsigned int, HPAGE_PMD_ORDER, MAX_=
PAGE_ORDER)
>
> So it should be 2 MiB (order-9)?
>

That is right. I will update the description to set it to 2 MiB.

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
>
> I think we should just always group at HPAGE_PMD_ORDER also in this case.=
 But that's
> a different thing to sort out :)
>
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
>
> Sorry for the late reply. I think using a bootime option might have saved=
 us
> some of the headake. :)

No worries.

The bootime option sounds good, however, there are these tradeoffs:

- bootloader needs to be updated to find out the kernel page size and calcu=
late
the pageblock_order to pass to the kernel.
- if the pageblock_order changes, it is likely that some CMA
reservations might need
to be updated, so the DTS needs to be compiled.

> [...]
>
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
> > +>   /*
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
>
> How is CONFIG_HUGETLB_PAGE_SIZE_VARIABLE handled?

That is a powepc configuration, and the pageorder_order variable is
initialized in:

mm/mm_init.c
#ifdef CONFIG_HUGETLB_PAGE_SIZE_VARIABLE
/* Initialise the number of pages represented by NR_PAGEBLOCK_BITS */
void __init set_pageblock_order(void)
{
unsigned int order =3D MAX_PAGE_ORDER;

/* Check that pageblock_nr_pages has not already been setup */
if (pageblock_order)
return;

/* Don't let pageblocks exceed the maximum allocation granularity. */
if (HPAGE_SHIFT > PAGE_SHIFT && HUGETLB_PAGE_ORDER < order)
order =3D HUGETLB_PAGE_ORDER;

/*
* Assume the largest contiguous order of interest is a huge page.
* This value may be variable depending on boot parameters on powerpc.
*/
pageblock_order =3D order;
}

Should this line be updated?
https://elixir.bootlin.com/linux/v6.15-rc7/source/mm/mm_init.c#L1513
unsigned int order =3D MAX_PAGE_ORDER;

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
>
> Wait, why are we using the MIN_T in that case? If someone requests 4 MiB,=
 why would we reduce
> it to 2 MiB even though MAX_PAGE_ORDER allows for it?
>
I don't have the context for that change. I think Vlastimil might know
why it is needed:

That change was introduced in this patch:
https://lore.kernel.org/all/20240426040258.AD47FC113CD@smtp.kernel.org/

Thanks
Juan

>
> Maybe we really have to clean all that up first :/
>
> --
> Cheers,
>
> David / dhildenb
>
