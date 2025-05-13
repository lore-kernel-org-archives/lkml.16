Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7BE1F12F4
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 16:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747154499; cv=none; b=kUj7gBeflUlxE/JqFzTv+Ml3GRLV22PB9c4Pg68yqYczn24L+6rYnpRLfIPLnv4gDt3s+47M+Bdrx2uXz2KOYbu106O34zIXCXOUmgWOm6Nx8h8uYT93mT85JYx3hilqb5Dwc7ll9ZwVPmmM+Y0/+drH8gWUIwpVeudhG7m4N0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747154499; c=relaxed/simple;
	bh=qh5G/eEmWG16XzGmayNka2kXrS3FjLV815oMffc4Klg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nE8dSC9N3aQQjfBbr7pw0cs+B6hmNf/TqMSUvWASbhSVi6kBV9OxAmu5cCE/84dfmzPTeysKsti62IYGG67/bD2ueSawqJkSSmvTo0m0tovNoMOQAJRt7EhldBu8Vtb/ui4uR1RZ6l9KlmAMmjrA4ghS16PLE8nAdjgnEkFbyJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TFL0S+hY; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TFL0S+hY"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-47666573242so7181cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 09:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747154497; x=1747759297; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6BnDDfyJoznq74Fy9bepDWSIw4wPa6h1sLOGzU/61vk=;
        b=TFL0S+hYoonCCqnL/rFEfeOaAgAsYCgTK5rL1C7RCRPtDTbvtmCoV/YAy9UXHs9FK1
         xTCvU2T6Z1DBT50coN9xa2xLO8u3awRQ4n7lH1eU4M3HqG6+luEblnDK71Fj9RGV7IoB
         CyccTDOZhuRStbS87InWpnWwDSTrgdfqwBewntuC+UmV4jfmNqdUxk1HDcEu8YD7BAgD
         bLXwcAACQyhUGSQ0RR4z1SMQ4agxfgaB/hdLzC/j99zPjWFtCiuF21k3TuGjzfuF+KUP
         LchC2Xcf3yYIl6fvyMnZErMmGwY93reReMomerswthppgltaHRVQdW+/Ic+Qt34kcQnJ
         GmDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747154497; x=1747759297;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6BnDDfyJoznq74Fy9bepDWSIw4wPa6h1sLOGzU/61vk=;
        b=bAfoS+Ny/6hSwxToJdKpEzTmbDLHZ34ttcb7shQkGH6VNza/AnzpvZv5yrckRVWcCH
         mzX/uRllxHGMbh1QsqF8I63CE9UKOnlv1kXleEff1xJ5WmHJkOehKsdsZcBuYuFc+sMt
         5VjfequDzEGfwL7Mv6blH7r+e2U5m7g5ifpR9GnrG2JNexmgPekU+/5iXvnCLh68jFXD
         v4gBtELik7V0JGp30sVSQk3hyhpmXapqH2PBA6ayTbIgMauVJuPvdPmH7rSjjjvmVU80
         LekimMbT7q0wxlD+GmOexpgDQSep3vtlv2mfsd2KBqU/lJKTG2ZvEQSK0x5wKGO4ELO4
         /9wg==
X-Forwarded-Encrypted: i=1; AJvYcCXrKiyDPv95FZ2ZDQw95Mm00sx40CR2dksd1bqIIcp7ftsVW64rXmJa8kRH7VCgO3c9khbWUUuc6Blu7NM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrazSHb9GtBjRjXYfw0IfeXh0uDIMJrjTZaN/OaGqBhkAZAej2
	kGWTod1NTbM/NwJd8EuyzGvMMgT1wKtJrhd09yFDTo0TBrji0y+6V2Fmi0Rl9RRHBHHiVgXEm9m
	FGbv7WK7pnX0MNHcHqGQgqyn5yfczvZ20ETop1TOU
X-Gm-Gg: ASbGncvjO8lEEVS+6V8UfwI0NrsLIydoH08jPhY7U5yJFx89UyyCOQqdoqkTJPgkKYn
	QPB93q/9T8mVvmJubnTI4wok1w7ecunNB100K+32qyVb4hz1VB5ktnIqJUDhaPU1NQqM8npVTWA
	i5q8i8VzKp2dMybDfcBD1w8MhUsJdVe2toYQ==
X-Google-Smtp-Source: AGHT+IEJHAdBReTtQOM+Du77qJGTcBmfyorO99vnOGQflRem28oWY3TBlhFPfh4hozV7waawUleyczMmoCPeFGe6apM=
X-Received: by 2002:a05:622a:1b9f:b0:47d:4e8a:97f0 with SMTP id
 d75a77b69052e-4948990f38dmr3883821cf.29.1747154496402; Tue, 13 May 2025
 09:41:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250510010338.3978696-1-jyescas@google.com> <202505110035.wtOWnL8o-lkp@intel.com>
 <A3E9017A-7282-4BF9-AC60-E2C74EB68980@nvidia.com>
In-Reply-To: <A3E9017A-7282-4BF9-AC60-E2C74EB68980@nvidia.com>
From: Juan Yescas <jyescas@google.com>
Date: Tue, 13 May 2025 09:41:24 -0700
X-Gm-Features: AX0GCFuQ__xLeJQ79EFOWN0yV7Y9yxsqU-iVJS9r_l0AKVbr7f7W4t90YzZtWWI
Message-ID: <CAJDx_rj2QpiQkLoJM0x-WOD5nJQVLDbsFNm4-xZ9SfAq_f1SBw@mail.gmail.com>
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

On Tue, May 13, 2025 at 8:08=E2=80=AFAM Zi Yan <ziy@nvidia.com> wrote:
>
> On 10 May 2025, at 13:16, kernel test robot wrote:
>
> > Hi Juan,
> >
> > kernel test robot noticed the following build errors:
> >
> > [auto build test ERROR on linus/master]
> > [also build test ERROR on v6.15-rc5]
> > [cannot apply to akpm-mm/mm-everything next-20250509]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Juan-Yescas/mm-A=
dd-CONFIG_PAGE_BLOCK_ORDER-to-select-page-block-order/20250510-090501
> > base:   linus/master
> > patch link:    https://lore.kernel.org/r/20250510010338.3978696-1-jyesc=
as%40google.com
> > patch subject: [PATCH v4] mm: Add CONFIG_PAGE_BLOCK_ORDER to select pag=
e block order
> > config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/2=
0250511/202505110035.wtOWnL8o-lkp@intel.com/config)
> > compiler: powerpc64-linux-gcc (GCC) 14.2.0
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20250511/202505110035.wtOWnL8o-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202505110035.wtOWnL8o-l=
kp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> >    In file included from include/linux/gfp.h:7,
> >                     from include/linux/xarray.h:16,
> >                     from include/linux/list_lru.h:14,
> >                     from include/linux/fs.h:14,
> >                     from include/linux/compat.h:17,
> >                     from arch/powerpc/kernel/asm-offsets.c:12:
> >>> include/linux/mmzone.h:53:2: error: #error MAX_PAGE_ORDER must be >=
=3D PAGE_BLOCK_ORDER
> >       53 | #error MAX_PAGE_ORDER must be >=3D PAGE_BLOCK_ORDER
> >          |  ^~~~~
> >    make[3]: *** [scripts/Makefile.build:98: arch/powerpc/kernel/asm-off=
sets.s] Error 1
>
> In this config, CONFIG_ARCH_FORCE_MAX_ORDER is set to 8, lower than
> the default PAGE_BLOCK_ORDER value, 10. I wonder if the error should
> be changed to ignore CONFIG_PAGE_BLOCK_ORDER when MAX_PAGE_ORDER is
> set by CONFIG_ARCH_FORCE_MAX_ORDER and give a warning instead.

In ARMv8, MAX_PAGE_ORDER is set up by CONFIG_ARCH_FORCE_MAX_ORDER
and CONFIG_PAGE_BLOCK_ORDER is also set up, so we need to take into account
CONFIG_PAGE_BLOCK_ORDER. For other architectures, the default will be:
CONFIG_ARCH_FORCE_MAX_ORDER =3D CONFIG_PAGE_BLOCK_ORDER.

Is there any valid case where the MAX_PAGE_ORDER needs to be smaller than
the page block order?

Thanks
Juan
>
> >    make[3]: Target 'prepare' not remade because of errors.
> >    make[2]: *** [Makefile:1275: prepare0] Error 2
> >    make[2]: Target 'prepare' not remade because of errors.
> >    make[1]: *** [Makefile:248: __sub-make] Error 2
> >    make[1]: Target 'prepare' not remade because of errors.
> >    make: *** [Makefile:248: __sub-make] Error 2
> >    make: Target 'prepare' not remade because of errors.
> >
> >
> > vim +53 include/linux/mmzone.h
> >
> >     46
> >     47        /*
> >     48         * The MAX_PAGE_ORDER, which defines the max order of pag=
es to be allocated
> >     49         * by the buddy allocator, has to be larger or equal to t=
he PAGE_BLOCK_ORDER,
> >     50         * which defines the order for the number of pages that c=
an have a migrate type
> >     51         */
> >     52        #if (PAGE_BLOCK_ORDER > MAX_PAGE_ORDER)
> >   > 53        #error MAX_PAGE_ORDER must be >=3D PAGE_BLOCK_ORDER
> >     54        #endif
> >     55
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
>
>
> Best Regards,
> Yan, Zi
