Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB6C2BF3FA
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 17:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747157552; cv=none; b=Qrwl+dAL0Q/C1bkVilcFFGu7tOzppqZ5Y1U3mKpvhuNzw0G9cm2jxsb/wtQ4i4AAnZfysmGDbvAqkUPbg89sTPMq8uqMn4gcR2P1+frL7CohEqk/aQ0rhpUij4/3z7SkLjmujMEEiaLHmjKF8vE+GAmlPOAqsTRFZ51N/9Q+lEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747157552; c=relaxed/simple;
	bh=WEEw3H+WDhvJpFTJ4qQDXt71XI9vO4UTOBjSfohSR6Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C5fIeghPLoDWp5JIn6ymrZa/2efdWtlPjZKpK3Uv6Ue3j/lafi8ZlJqH5BBKe1UqQdXURqnDiwyMoskoAu96ysximeVfELItp3l1yqgy1XGVeIBAMdRMd6wT/+0JTghK+RhfWAC3O9Tdk692S1wzDEcNlXRUeelM5nqwhJj00qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mtfQx8RY; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mtfQx8RY"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-48b7747f881so23711cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 10:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747157549; x=1747762349; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2DOowbSxIBNFz77Dq0SWuQaa+felhYyndn2kYV4C73o=;
        b=mtfQx8RYUZZyR95jZVJEwegApNmZ2jLD5gFaAiLyi5Ckq1diuZEWEeM6ig88D+CLOT
         bQdq15/DKEzLUTYRL2aC863muZ2zdZ9MhQpksMGYlad7ZFJBAaWlOmiB7VF+01s+9SmR
         9Uf4WpHPhkN61I/1vdLNyeR3yT24uUf3pxoTPFZFjH1v5IavNWYclNVPvt66oD7FpZkt
         +E0qUqjaMjgGfJhgoq8TGrkTf6DGA33Q2XJK0aEZJpLTPh7+6xpugp4vG6kpsPRr2cL3
         pqQD1TBxqEH6byW3QMeV2b5iNOD6fd0hwLwO3nhySiEXHMEwSZNRA14X483TyW+37jQQ
         ar0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747157549; x=1747762349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2DOowbSxIBNFz77Dq0SWuQaa+felhYyndn2kYV4C73o=;
        b=JDlbBCLShAfNFf0xm9Bjd6BPzN5rzqe3qbOJGOLM78rK7gqUC82715J4dYGo9wGur2
         Kew2lkiD5bDxEZJQCNtSf20N9qlIL/6CJCHEyJ82+9kFy/0MU/ceq4d5dlbcm+57QC5r
         iF0WbxlbAXrIopEwLPv5WX9q69H+gQMwIOu7mwtIgJY7nfn6dyqra32IUzIrP+2y+AjJ
         KF4ZRDNHXUDcg67o+oh/gKmF/WP0oERw9Ljc23B41fE0eAtj1Ooq87V86vBZ86muWYHa
         F39roVjabDNAJFTJDdRlTGFc1S49thDX+TUj4kKkuanDqoQ4DfqYr/V3XsjdH27PLOc4
         8bOw==
X-Forwarded-Encrypted: i=1; AJvYcCUm3ERzW1HtN0m2YYsFBmpwmdMed3a7GoB0cZTVgkDKJWHPE756zLy+dvQk4keo5JsAVqmjjRtAny+d/HU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRBGHgRAsVVZz83kgctpx1BZeYUpLucr3HrHb4YZpbGYstwC1v
	AG7O5yKeYtdiAeMfcowmbueMym+B3x474/2LjNyFZx8WasZSRpN6hs8k1sqWvENz7lMvgtAWtkf
	N+uRhnEm38HLtgfFp8AzcMJQptCvPwHLp3YPRDfKT
X-Gm-Gg: ASbGncvwqf+O2soDMFm9m7zS3TtkGSAXJHqldvV+SOS6cTqUVYvQlJ93NVK8CFJ+Z/n
	2y/hhwS+8O9QQE9l51XyRjOEZDUzkj0wcRKmV2P92tTXryzQOeY8kch62TE+DjTsltqwxKzVYrZ
	x5hfeO694VeTccNLSD1ibIGJOwMk6kZLf9+Q==
X-Google-Smtp-Source: AGHT+IG+8VLEF5LwFCMQ0UHlKUUGTtV36GRRRSd04x5eFCzOeewR4VGbhq+2ryDt5b+wtk8+cDAHA/Jvf+AKp3ItYCg=
X-Received: by 2002:a05:622a:202:b0:471:eab0:ef21 with SMTP id
 d75a77b69052e-494898efbb9mr4851341cf.13.1747157548610; Tue, 13 May 2025
 10:32:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250510010338.3978696-1-jyescas@google.com> <202505110035.wtOWnL8o-lkp@intel.com>
 <A3E9017A-7282-4BF9-AC60-E2C74EB68980@nvidia.com> <CAJDx_rj2QpiQkLoJM0x-WOD5nJQVLDbsFNm4-xZ9SfAq_f1SBw@mail.gmail.com>
 <2513BE19-5527-45A4-8BE8-A447B53654C0@nvidia.com>
In-Reply-To: <2513BE19-5527-45A4-8BE8-A447B53654C0@nvidia.com>
From: Juan Yescas <jyescas@google.com>
Date: Tue, 13 May 2025 10:32:17 -0700
X-Gm-Features: AX0GCFtkFGhhXiBkpciVK_nVdr9uM4M6rZUdEjYlxAZyTsZ4doe_1wm8rW9p5rM
Message-ID: <CAJDx_rgP2vXpFqFD9n_LreOPoDGvNsY6J41mC-ZL7W8vpiLQcw@mail.gmail.com>
Subject: Re: [PATCH v4] mm: Add CONFIG_PAGE_BLOCK_ORDER to select page block order
To: Zi Yan <ziy@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, kernel test robot <lkp@intel.com>, 
	linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, tjmercier@google.com, isaacmanjarres@google.com, 
	surenb@google.com, kaleshsingh@google.com, Vlastimil Babka <vbabka@suse.cz>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>, Minchan Kim <minchan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025 at 9:47=E2=80=AFAM Zi Yan <ziy@nvidia.com> wrote:
>
> On 13 May 2025, at 12:41, Juan Yescas wrote:
>
> > On Tue, May 13, 2025 at 8:08=E2=80=AFAM Zi Yan <ziy@nvidia.com> wrote:
> >>
> >> On 10 May 2025, at 13:16, kernel test robot wrote:
> >>
> >>> Hi Juan,
> >>>
> >>> kernel test robot noticed the following build errors:
> >>>
> >>> [auto build test ERROR on linus/master]
> >>> [also build test ERROR on v6.15-rc5]
> >>> [cannot apply to akpm-mm/mm-everything next-20250509]
> >>> [If your patch is applied to the wrong git tree, kindly drop us a not=
e.
> >>> And when submitting patch, we suggest to use '--base' as documented i=
n
> >>> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >>>
> >>> url:    https://github.com/intel-lab-lkp/linux/commits/Juan-Yescas/mm=
-Add-CONFIG_PAGE_BLOCK_ORDER-to-select-page-block-order/20250510-090501
> >>> base:   linus/master
> >>> patch link:    https://lore.kernel.org/r/20250510010338.3978696-1-jye=
scas%40google.com
> >>> patch subject: [PATCH v4] mm: Add CONFIG_PAGE_BLOCK_ORDER to select p=
age block order
> >>> config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive=
/20250511/202505110035.wtOWnL8o-lkp@intel.com/config)
> >>> compiler: powerpc64-linux-gcc (GCC) 14.2.0
> >>> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/a=
rchive/20250511/202505110035.wtOWnL8o-lkp@intel.com/reproduce)
> >>>
> >>> If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
> >>> the same patch/commit), kindly add following tags
> >>> | Reported-by: kernel test robot <lkp@intel.com>
> >>> | Closes: https://lore.kernel.org/oe-kbuild-all/202505110035.wtOWnL8o=
-lkp@intel.com/
> >>>
> >>> All errors (new ones prefixed by >>):
> >>>
> >>>    In file included from include/linux/gfp.h:7,
> >>>                     from include/linux/xarray.h:16,
> >>>                     from include/linux/list_lru.h:14,
> >>>                     from include/linux/fs.h:14,
> >>>                     from include/linux/compat.h:17,
> >>>                     from arch/powerpc/kernel/asm-offsets.c:12:
> >>>>> include/linux/mmzone.h:53:2: error: #error MAX_PAGE_ORDER must be >=
=3D PAGE_BLOCK_ORDER
> >>>       53 | #error MAX_PAGE_ORDER must be >=3D PAGE_BLOCK_ORDER
> >>>          |  ^~~~~
> >>>    make[3]: *** [scripts/Makefile.build:98: arch/powerpc/kernel/asm-o=
ffsets.s] Error 1
> >>
> >> In this config, CONFIG_ARCH_FORCE_MAX_ORDER is set to 8, lower than
> >> the default PAGE_BLOCK_ORDER value, 10. I wonder if the error should
> >> be changed to ignore CONFIG_PAGE_BLOCK_ORDER when MAX_PAGE_ORDER is
> >> set by CONFIG_ARCH_FORCE_MAX_ORDER and give a warning instead.
> >
> > In ARMv8, MAX_PAGE_ORDER is set up by CONFIG_ARCH_FORCE_MAX_ORDER
> > and CONFIG_PAGE_BLOCK_ORDER is also set up, so we need to take into acc=
ount
> > CONFIG_PAGE_BLOCK_ORDER. For other architectures, the default will be:
> > CONFIG_ARCH_FORCE_MAX_ORDER =3D CONFIG_PAGE_BLOCK_ORDER.
>
> It seems that the Kconfig =E2=80=9Crange 1 ARCH_FORCE_MAX_ORDER if ARCH_F=
ORCE_MAX_ORDER=E2=80=9D
> is not working. The above powerpc-allmodconfig has CONFIG_ARCH_FORCE_MAX_=
ORDER
> set to 8 and CONFIG_PAGE_BLOCK_ORDER is set to 10, leading to the compila=
tion
> error.
>

Right, Kconfig restriction is being ignored by powerpc, however, it is
respected by ARMv8.

The main difference that I see between arch/arm64/Kconfig and
arch/powerpc/Kconfig
is that powerpc/Kconfig is using ranges, but not in arm64/Kconfig

https://elixir.bootlin.com/linux/v6.14.6/source/arch/arm64/Kconfig#L1637
config ARCH_FORCE_MAX_ORDER
int
default "13" if ARM64_64K_PAGES
default "11" if ARM64_16K_PAGES
default "10"

https://elixir.bootlin.com/linux/v6.14.6/source/arch/powerpc/Kconfig#L918
config ARCH_FORCE_MAX_ORDER
int "Order of maximal physically contiguous allocations"
range 7 8 if PPC64 && PPC_64K_PAGES
default "8" if PPC64 && PPC_64K_PAGES
range 12 12 if PPC64 && !PPC_64K_PAGES
default "12" if PPC64 && !PPC_64K_PAGES
range 8 10 if PPC32 && PPC_16K_PAGES

> >
> > Is there any valid case where the MAX_PAGE_ORDER needs to be smaller th=
an
> > the page block order?
>
> I am not aware of any.
>
> >
> > Thanks
> > Juan
> >>
> >>>    make[3]: Target 'prepare' not remade because of errors.
> >>>    make[2]: *** [Makefile:1275: prepare0] Error 2
> >>>    make[2]: Target 'prepare' not remade because of errors.
> >>>    make[1]: *** [Makefile:248: __sub-make] Error 2
> >>>    make[1]: Target 'prepare' not remade because of errors.
> >>>    make: *** [Makefile:248: __sub-make] Error 2
> >>>    make: Target 'prepare' not remade because of errors.
> >>>
> >>>
> >>> vim +53 include/linux/mmzone.h
> >>>
> >>>     46
> >>>     47        /*
> >>>     48         * The MAX_PAGE_ORDER, which defines the max order of p=
ages to be allocated
> >>>     49         * by the buddy allocator, has to be larger or equal to=
 the PAGE_BLOCK_ORDER,
> >>>     50         * which defines the order for the number of pages that=
 can have a migrate type
> >>>     51         */
> >>>     52        #if (PAGE_BLOCK_ORDER > MAX_PAGE_ORDER)
> >>>   > 53        #error MAX_PAGE_ORDER must be >=3D PAGE_BLOCK_ORDER
> >>>     54        #endif
> >>>     55
> >>>
> >>> --
> >>> 0-DAY CI Kernel Test Service
> >>> https://github.com/intel/lkp-tests/wiki
> >>
> >>
> >> Best Regards,
> >> Yan, Zi
>
>
> Best Regards,
> Yan, Zi
