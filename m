Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F722571A0
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 23:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747782901; cv=none; b=L/3aBRr1cviJVs4yECO7HdB6JalIRbTX4fbwjPB17ZeSnYxggCcYM4fJ9F6uel3RO8hDvu2m9Y7u6EuzS/VGD/Fv5bPSTrzjUNTN6dr9ePcqSSXXHU+cvlODlvPOwnVrJpcul8PpgtP1Yi9lz5M6n2kcSOTkvqFHenWd7hBK2X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747782901; c=relaxed/simple;
	bh=xfjC1o2pS7aW7rvcrv9IY/LblXEmUSjGu4qe52Gb+uQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VX9kPkXqrI89IQRtvE55SxOYxVcHcLmAHTuCG2aYT5RUvc06YtP1zHKpwVGreZV9bvRRqR/Vlul7C7eZJy+kUDZaiTL232ZJ/Zu6A5Or9/Ly/bk9TTKr1BqEPmlRHntd28E6sbfWvZ0HiSreXlmhSIOzSKUmoOrPj4sMy/WCflc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0YL+uYQX; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0YL+uYQX"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-47666573242so1233371cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 16:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747782898; x=1748387698; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VwKDYk+LUh/66D5vXsuMYGfvDobJ3NQ267JBjwa/l8M=;
        b=0YL+uYQXk3fAZPNNx3hYngvD5InMjyo78eiqi0FKAlbdkmLR4tgxxyPo5uqyfUqSUN
         LoCMxBHiko9sWDPJ9lN8CoEpPYKzJuIot2df3Dts/yQS/FJ1gfwWK8JR/Gn9fX43MWmj
         rWv4Ejkd1mCvJVPhaHLu5Dr0eTzUQ/x0BptPEI04yagWbT8ATEWSNs4qGKGuzzPVEi3q
         WH+6ApwG2Y0XmTjCNG+x73I+rxXj+DTSj7YODwFO3aYXT7kh9yPZkyEJgLjARwwTH/km
         BiEqKYlcqm0C5rRCZWVvxLTiBsc9F2QEZQwoy9eqlXP3W8CVAe7+LDq5hEgD1vbz5+Ug
         XBvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747782898; x=1748387698;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VwKDYk+LUh/66D5vXsuMYGfvDobJ3NQ267JBjwa/l8M=;
        b=quEzR4k0yyU7nRaAc/6Mm/OhM9B0Y5Ue3SvZsq7sNo+r5HpNwxzDh7RfBIMYqu4z7Q
         bbmbHu/XY7Wg5jCoEHbEsds4RmugrDwWpTM9TRU8wawdQFVIup9tFQ44DH2WXTv6Ra1n
         MUPZY4NmH3izQWIqmJMlJrWGDOqzMNwzBV+uVbjSHLfwtP4yizF8HwS8JUfqMUsgI6cS
         srWdn88/p5Byx7rfwPccu7yEWSLk8ndfcTHsbqS5m7obXbHzntxQcQSER13a0+lhLKkM
         XAw5BDdNy5+ojP+mfmKr6kGPuFfanRzvV79mSN5Rm3tEfoRoKAOvXtU6xdosnFuu7bnP
         H0fQ==
X-Forwarded-Encrypted: i=1; AJvYcCUP8vWnI8ySBDjPiNX+J/9W2AI87dxx7MB0t5ZNJcu5n8s7vHvyjg0W5id9k3lCrGoSxHjV8j7uM6rmI2I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlivWUUF6WJxaDd09TcrIPb5N82RzJznSgUqeSODggF0ZCb896
	Y4BmemhAQdcEGS5D6i7MRhNB3uswEu91yycSL18l6grte2o0vegqw++YUI3aOC7/7FqUSP3pX2g
	OroI8/YAW6+dDnL96OXsSzCGggWNc+geCLgf+/4aZ
X-Gm-Gg: ASbGnct6Tyi66Lq8QNKfCxM8IeoPLz5UNozuEMjg+OX5Tj+2ofhIPHY/ToYetMTJJY5
	dZqspEgKI1yAJJaCfTCqLgEl/2z8kuj9gv16YY8g5um2nnNyGVukibEoREA8BnOOcKKSjMEhLpd
	YyUzzjt1/I7XzLks7fc6lA8oLhoPOqsf7V66+grwrD1sSIrQKr1E81FAWFtYVglQwElq8tOKP8
X-Google-Smtp-Source: AGHT+IGaU9BQ83k0ZRoBuYykShd6kgLdiRzG5qNoS7Gd2LDAPwLl0KN6KvyLD/qSbh0UhKFqfBYB3h34mTYWTrXD3s8=
X-Received: by 2002:ac8:5a8e:0:b0:477:8686:901d with SMTP id
 d75a77b69052e-495ff6d3f0dmr12920411cf.1.1747782897668; Tue, 20 May 2025
 16:14:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250510010338.3978696-1-jyescas@google.com> <8E999CBA-6F55-4DCA-8BE3-569B1C537802@nvidia.com>
In-Reply-To: <8E999CBA-6F55-4DCA-8BE3-569B1C537802@nvidia.com>
From: Juan Yescas <jyescas@google.com>
Date: Tue, 20 May 2025 16:14:46 -0700
X-Gm-Features: AX0GCFtC-z_Cx3cMi0nT69lR5itEQxl7k2LfSNYQdr27xoRVSQ0DmIhnpcZUc7M
Message-ID: <CAJDx_rgmKi4_=zOrJEgux=dZ-Hf6MJevNZD6GHRJc6AkNqi_DA@mail.gmail.com>
Subject: Re: [PATCH v4] mm: Add CONFIG_PAGE_BLOCK_ORDER to select page block order
To: Zi Yan <ziy@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, tjmercier@google.com, isaacmanjarres@google.com, 
	surenb@google.com, kaleshsingh@google.com, Vlastimil Babka <vbabka@suse.cz>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>, Minchan Kim <minchan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 17, 2025 at 11:51=E2=80=AFAM Zi Yan <ziy@nvidia.com> wrote:
>
> On 9 May 2025, at 21:02, Juan Yescas wrote:
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
> > Changes in v4:
> >   - Set PAGE_BLOCK_ORDER in incluxe/linux/mmzone.h to
> >     validate that MAX_PAGE_ORDER >=3D PAGE_BLOCK_ORDER at
> >     compile time.
> >   - This change fixes the warning in:
> >    https://lore.kernel.org/oe-kbuild-all/202505091548.FuKO4b4v-lkp@inte=
l.com/
> >
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
> >  include/linux/mmzone.h          | 16 ++++++++++++++++
> >  include/linux/pageblock-flags.h |  8 ++++----
> >  mm/Kconfig                      | 31 +++++++++++++++++++++++++++++++
> >  3 files changed, 51 insertions(+), 4 deletions(-)
>
> Hi Juan,
>
> The patch below on top of your v4 fixed powerpc build issue, as I tested
> it locally.
>
> From 5c2ae4dfca135e99da45302e4f5d96a315a99603 Mon Sep 17 00:00:00 2001
> From: Zi Yan <ziy@nvidia.com>
> Date: Sat, 17 May 2025 14:49:39 -0400
> Subject: [PATCH] fix CONFIG_PAGE_BLOCK_ORDER
>
> Signed-off-by: Zi Yan <ziy@nvidia.com>
> ---
>  mm/Kconfig | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/mm/Kconfig b/mm/Kconfig
> index 79237842f7e2..af0dd42e3506 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -1016,10 +1016,10 @@ config ARCH_FORCE_MAX_ORDER
>  # as per include/linux/mmzone.h.
>  config PAGE_BLOCK_ORDER
>         int "Page Block Order"
> -       range 1 10 if !ARCH_FORCE_MAX_ORDER
> -       default 10 if !ARCH_FORCE_MAX_ORDER
> -       range 1 ARCH_FORCE_MAX_ORDER if ARCH_FORCE_MAX_ORDER
> -       default ARCH_FORCE_MAX_ORDER if ARCH_FORCE_MAX_ORDER
> +       range 1 10 if ARCH_FORCE_MAX_ORDER =3D 0
> +       default 10 if ARCH_FORCE_MAX_ORDER =3D 0
> +       range 1 ARCH_FORCE_MAX_ORDER if ARCH_FORCE_MAX_ORDER !=3D 0
> +       default ARCH_FORCE_MAX_ORDER if ARCH_FORCE_MAX_ORDER !=3D 0
>
>         help
>           The page block order refers to the power of two number of pages=
 that
> --
> 2.47.2
>
Thanks Zi, the changes were applied in v6

https://lore.kernel.org/all/20250520225945.991229-1-jyescas@google.com/

>
>
>
> --
> Best Regards,
> Yan, Zi
