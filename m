Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12F3360
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744848944; cv=none; b=AYOKqn9BumSPItY+z6ULb0XwJyv6/6NLBX3Sn5pAXobRjBy2wlorxbkOu1bjeogr/rj2uq5G3HtUgKApP6qIjE3kBcTzOlh4BKgfhaem3pSV3SdpqIfK38ZLAgI2V81M5abwDjozIr42BdogYrJTKqNQphhnL7shJe3tSqQNA18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744848944; c=relaxed/simple;
	bh=KDv/r1yWEkdgUU7mIRgQvbFSeA2gD4W1D6chZambajA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lvcFOSMz8yIgXAuij3lJ5ch3R459YVZZKxDL9nHZ/b5HRqa67u55do7I7pbmx3gDelGMX9L+ieEG9zGQxPaaJu/xpBw8qmK0tFKex92xLTvL74cGt0m2/PuxOKtlM99fu9c8VyxHqjh38sWIgEoLnEy8NbB57D2cqmhY+I96IAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lAhazMVV; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lAhazMVV"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4769e30af66so96681cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 17:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744848941; x=1745453741; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0JJihK6dPKRsrS1PEroxMgG1IwFRWNm5iCk7/Hx4ugI=;
        b=lAhazMVVucQJN6qI6wmXUMZM80K62d+1YEXGkRnnEPvg1rbUB+WKckBrV3kH4F1IUE
         g+8Lc3ZuaVbiOT8qOCsVIrNtF37VvHT//VPXt+RIUow/se0+J5uryCQgkfU6jJNlsF25
         5tTsUnD8GeFHdZ8/u/TyP9CYcUktEAWGcspgjeOAGyU6O91sFadB+jNbpJFV9fhGLdch
         tuhJetCdUKkq2kc71c0//ffGSE42q6tCSIQOwHtoIghVJ7ik/FqRp49TbD+6iGMX8mye
         7zkTyl7BNdJGdCjYLNfqVfaPWZLCKbF4kSfJTJzoLiWCvTx851Rz8If0ONbUgESalghK
         NhaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744848941; x=1745453741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0JJihK6dPKRsrS1PEroxMgG1IwFRWNm5iCk7/Hx4ugI=;
        b=ocnMwEm+uFYJIGHQFANSons6hjWkxYPMTddoGeuWVfJCY54u1eZnfioKbP3qsDbUQq
         slOeQd3++XoXJfPU88IpKmdqUJIV5nOWQGM6GKLgQBrPjBEuwGVQCc4CklIatpLaKj8O
         /+av06H/is/KxRO2F7utM2eBaT2HEB6gKYfAEgWK+UKZ15FBBlGWRDw2UQqGivgG7RGj
         wIkRvaKoWShV99NS7WdEjOUq9yy8h70/qx/tIn6iylJSffjf0oQsHcx3gLkRDUZKyVPP
         OGVzY5nva31YI5juVgQZw/5M2eQPpKRkYi3Aem4jft7qTTO47GpyJ6u9frwO5o8M2lpU
         U8Uw==
X-Forwarded-Encrypted: i=1; AJvYcCWvUd69rwnAh0ZpSuGs21oNxGcxz6gOvzUU4nxaa3VrqjbFT82IdYYbsTZEzamvQmB5ursdZVcuQj4iIBk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzT7LQ1MHwkGBNbrY/kCjBRylrcdFMWzGaiTDZnX8SZrKg5+O8J
	mAmDlqBYez8NvKww/7a9r+sgL6cEzfYc7njyf2ma9xhb/TlGKyJUA96njcr79V6wZUu08afY7ff
	NvhF+G/ibomnDvzlYByq1yzMoFF9+EJ+Nm2+E
X-Gm-Gg: ASbGncuR8wF+300fjWhxjqiwWL25NxzJwJdQxpx413M/+LbfS71kHetJT5yDJKiiS6Z
	y8/cXPWqg5jCvntdgbIrvaOFhFRANFGYrFRW3TZcybaHiwhQX5pM4iCYDlqdQWFMvc0emBSko2r
	UbF0tilzSiofpPTSFRvcyYhxT8t+3WHOE=
X-Google-Smtp-Source: AGHT+IF/DioXRmqQqk6kvZDJENGBbv0pvFx3ZLUiuZfNtUxnoKj28NHtlbAY4Fnqxj5KAMo/QQod4H/XgipEgiVtbzs=
X-Received: by 2002:ac8:7dcd:0:b0:476:6232:183f with SMTP id
 d75a77b69052e-47adfcefbb1mr797961cf.19.1744848941092; Wed, 16 Apr 2025
 17:15:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416180653.3438158-1-usamaarif642@gmail.com>
 <CAJuCfpEKrX+1_SJ5fOyT6JLDSNcDxjcfBMj9_siVZt-rX5WQ=w@mail.gmail.com> <d03e8fbe-516e-40c3-96aa-43f5e51d0c3f@gmail.com>
In-Reply-To: <d03e8fbe-516e-40c3-96aa-43f5e51d0c3f@gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 16 Apr 2025 17:15:30 -0700
X-Gm-Features: ATxdqUFpXxa7Rm8fYWUTa0QsErFtD8_aTZRropD5vN4mlr9IpCSUnFupxXNcBmU
Message-ID: <CAJuCfpED6HQh8mT-8tvKzzcH2Xo=tP2Two+f=zk8sW-o_AJ8qw@mail.gmail.com>
Subject: Re: [PATCH] alloc_tag: introduce Kconfig option for default
 compressed profiling
To: Usama Arif <usamaarif642@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, hannes@cmpxchg.org, 
	shakeel.butt@linux.dev, linux-kernel@vger.kernel.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 2:52=E2=80=AFPM Usama Arif <usamaarif642@gmail.com>=
 wrote:
>
>
>
> On 16/04/2025 22:08, Suren Baghdasaryan wrote:
> > On Wed, Apr 16, 2025 at 11:06=E2=80=AFAM Usama Arif <usamaarif642@gmail=
.com> wrote:
> >>
> >> With this Kconfig option enabled, the kernel stores allocation tag ref=
erences
> >> in the page flags by default.
> >>
> >> There are 2 reasons to introduce this:
> >> - As mentioned in [1], compressed tags dont have system memory overhea=
d
> >> and much lower performance overhead. It would be preferrable to have t=
his as
> >> the default option, and to be able to switch it at compile time. Anoth=
er
> >> option is to just declare the static key as true by default?
> >> - As compressed option is the best one, it doesn't make sense to have =
to
> >> change both defconfig and command line options to enable memory
> >> allocation profiling. Changing commandline across a large number of se=
rvices
> >> can result in signifcant work, which shouldn't be needed if the kernel
> >> defconfig needs to be changed anyways.
> >
> > The reason tag compression is not the default option is because it
> > works only if there are enough free bits in the page flags to store a
> > tag index. If you configure it to use page flags and your build does
> > not have enough free bits, the profiling will be disabled (see
> > alloc_tag_sec_init()). IOW there is no graceful fallback to use page
> > extensions. Therefore, the current default option is not the most
> > performant but the one which works on all builds. Instead of this just
> > set sysctl.vm.mem_profiling boot parameter in your config file.
>
> Hi Suren,

Hi Usama,

>
> Thanks for the review! The main reason is to not have to make a change in
> both defconfig and kernel command line while deploying it. We can ofcours=
e
> set the commandline as well, but just makes deployment more tedious, and
> adds an extra commandline parameter. In our case, we only want to deploy
> compressed tags, and if there aren't enough free bits, we would prefer to
> disable memory allocation profiling than to take the memory and performan=
ce
> hit.
>
> Would keeping the default value of this config disabled be an acceptable =
option?
> i.e. the below diff on top of this patch?

Well, in that case I fail to see why
CONFIG_MEM_ALLOC_PROFILING_COMPRESSED_ENABLED_BY_DEFAULT=3Dy is better
than CONFIG_CMDLINE=3D"sysctl.vm.mem_profiling=3D1,compressed" ? Either
way you need to change the config file, no?

>
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 66d8995f3514..163ffcece47a 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -1030,7 +1030,7 @@ config MEM_ALLOC_PROFILING_ENABLED_BY_DEFAULT
>
>  config MEM_ALLOC_PROFILING_COMPRESSED_ENABLED_BY_DEFAULT
>         bool "store page allocation tag references in the page flags by d=
efault"
> -       default y
> +       default n
>         depends on MEM_ALLOC_PROFILING
>
>  config MEM_ALLOC_PROFILING_DEBUG
>
>
> Thanks,
> Usama
> >
> > Your change effectively changes the default value of
> > mem_profiling_compressed and I don't see why you need to introduce a
> > new config option for that. But that really does not matter because
> > changing default to compressed tags is not the right choice IMO.
> >
> >>
> >> [1] https://lore.kernel.org/all/20241023170759.999909-7-surenb@google.=
com/T/#m0da08879435f7673eaa10871a6e9d1be4f605ac8
> >>
> >> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
> >> ---
> >>  include/linux/pgalloc_tag.h | 4 ++++
> >>  lib/Kconfig.debug           | 5 +++++
> >>  lib/alloc_tag.c             | 4 ++++
> >>  3 files changed, 13 insertions(+)
> >>
> >> diff --git a/include/linux/pgalloc_tag.h b/include/linux/pgalloc_tag.h
> >> index c74077977830..0226059bcf00 100644
> >> --- a/include/linux/pgalloc_tag.h
> >> +++ b/include/linux/pgalloc_tag.h
> >> @@ -16,7 +16,11 @@ extern unsigned long alloc_tag_ref_mask;
> >>  extern int alloc_tag_ref_offs;
> >>  extern struct alloc_tag_kernel_section kernel_tags;
> >>
> >> +#ifdef CONFIG_MEM_ALLOC_PROFILING_COMPRESSED_ENABLED_BY_DEFAULT
> >> +DECLARE_STATIC_KEY_TRUE(mem_profiling_compressed);
> >> +#else
> >>  DECLARE_STATIC_KEY_FALSE(mem_profiling_compressed);
> >> +#endif
> >>
> >>  typedef u16    pgalloc_tag_idx;
> >>
> >> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> >> index 9fe4d8dfe578..66d8995f3514 100644
> >> --- a/lib/Kconfig.debug
> >> +++ b/lib/Kconfig.debug
> >> @@ -1028,6 +1028,11 @@ config MEM_ALLOC_PROFILING_ENABLED_BY_DEFAULT
> >>         default y
> >>         depends on MEM_ALLOC_PROFILING
> >>
> >> +config MEM_ALLOC_PROFILING_COMPRESSED_ENABLED_BY_DEFAULT
> >> +       bool "store page allocation tag references in the page flags b=
y default"
> >> +       default y
> >> +       depends on MEM_ALLOC_PROFILING
> >> +
> >>  config MEM_ALLOC_PROFILING_DEBUG
> >>         bool "Memory allocation profiler debugging"
> >>         default n
> >> diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
> >> index 25ecc1334b67..30adad5630dd 100644
> >> --- a/lib/alloc_tag.c
> >> +++ b/lib/alloc_tag.c
> >> @@ -31,7 +31,11 @@ DEFINE_STATIC_KEY_MAYBE(CONFIG_MEM_ALLOC_PROFILING_=
ENABLED_BY_DEFAULT,
> >>                         mem_alloc_profiling_key);
> >>  EXPORT_SYMBOL(mem_alloc_profiling_key);
> >>
> >> +#ifdef CONFIG_MEM_ALLOC_PROFILING_COMPRESSED_ENABLED_BY_DEFAULT
> >> +DEFINE_STATIC_KEY_TRUE(mem_profiling_compressed);
> >> +#else
> >>  DEFINE_STATIC_KEY_FALSE(mem_profiling_compressed);
> >> +#endif
> >>
> >>  struct alloc_tag_kernel_section kernel_tags =3D { NULL, 0 };
> >>  unsigned long alloc_tag_ref_mask;
> >> --
> >> 2.47.1
> >>
>
