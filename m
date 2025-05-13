Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0A012CD96
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 17:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747157638; cv=none; b=jBdkiBG4sBM9pFsLI7l731p7einBuLgBKL6M1Wq8ecq8mCUXk9na9OElr2DQH2WEbjP5mhyphK3+tYZgMx4zIovPPHC/FAQ1QkOYrZmXKIoXRgdX/AvrK3w+bf0BUEsy+0L9YRfJVAxQ3nfOAols1yyxtlqTTiBFzJya0yqgpYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747157638; c=relaxed/simple;
	bh=WiJK3c9zkXuiOXWSx+YJehk78mTgdznH2Z+RncA9zkM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QWxh71IfAxuVCzdI3/HyAZ95HCFM2Y2OtSLR97S3Sm9gV3Xe9XukTHjxg0uBqAPizdnn6Z9UiIJ8bQma07qwmydR9Sne8MSlhgP+Lf/9VKsII2+W1wQafoD+vPLiLBNr+81BD1evKrzl89brXvNIRYwIqecN05/Owcbw8VnNsWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YU1SFC2C; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YU1SFC2C"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-47666573242so27721cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 10:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747157636; x=1747762436; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OGZhE1s2JEZR2aghl+eaXgLkZsMZTnt2KxW/7xIZ5zM=;
        b=YU1SFC2CnUisUpv70j31SKQ0QheAz6WlTeFLt+WGMnY2o7Vn3FucQssHm2yaY/WDez
         zawz+Ak83MEtpnmnUuHD3fiRjgvcF02qBuxDnCMQ8KIT8Uk+txd4CqPpHXkDEzlgvXl4
         OI7jx3tfxvsPdPp5TKZJPcvxj+KLfgUcRtIotuW2lOmni+n2l+X9QdBTs7jssQcng9jx
         7E2aYX9377eGGaz08MvEzam2E49eTjiorjI7hytzFCkBUJJPsvqpecBs/5Hafxbwccbj
         81muzi9yxme0ijVwhSysqxIw4hkAkm5fkW6s9wmaOBcJ7ohAmasJLjdIOFjAUKnD9x/W
         bjdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747157636; x=1747762436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OGZhE1s2JEZR2aghl+eaXgLkZsMZTnt2KxW/7xIZ5zM=;
        b=iZl8nCO75DLT7eop4sDQ5Fh1gJXeFHnvRwfutqHFxG6QoTaaDLJLbaXLpjjnkfxjeU
         5FW+Cz3alP/1dcR1S9bbRJKHwJeKpqv7ExOsKIZvVVl5etPGfP2HEcwJs2u2qd4ahcHl
         QDWt5Ua+fhmkl3ZIEdpdlmu3hvT6I4bhwNxOHHYWkiX8hfBdA1sFLu9tKG2LNTD76L63
         y6pbbIAA3dQgTbUesjoR7OOvRmF+/hVO0aboKNBQRFNAtbP/9/xgwbDfYFGC2h853dC2
         PaRiDV+xQFQ3mWZ5Gw+R5jSqXmipftdbeqUPoCVMIVXqas7xZMUBG7SFF3SEG9RBhmns
         kacg==
X-Forwarded-Encrypted: i=1; AJvYcCXHBobejiXANU551J4tJkV6VF5ogsy4qyiW0DiCSDo7DVHI8QYL0p8NFXF1yAhfQlSsaZDUuMjNFeztiRs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjEC/CHnHUUWVc/9zdvFx/VJhCz5gGg49N5pFE/3W6BJbrmxSY
	jjrv9gJls5Wmn2JNOMVVWqHOu+Z3jwguwnIyYDoSTeOiFwGm3oORvp17q4g5YrQAuJn3dkmpVSx
	n4vvZvyVoaXk8jPcq1Bk02GJ68u7SPRUjcjIeMmNs
X-Gm-Gg: ASbGncu9DxLCG/zTo06bT+klXx81SbZEtNhWeI2R8W5DXcjwy4zKk/azwOupuDfLx4q
	Ycs/n9cT1TvsrJNX1m5PIxr7lUk0ayUDBUIW9Dft+YUZ9x2SrsA9Stjf05db+K4yXp+pqWYqXOT
	o8jsdN8yyEFn9A0sp4opvwSiyEG7V8B7gSpA==
X-Google-Smtp-Source: AGHT+IGR+aRkPDQu30C21Yg15jM/Rvta9kt+tqUIrVd3aCPyFeFOfxhT65b2G1ZByAMG9Pqd6bcFcqMCzMjko1MYtA0=
X-Received: by 2002:ac8:598d:0:b0:466:8c23:823a with SMTP id
 d75a77b69052e-494898efdb9mr4013011cf.17.1747157635413; Tue, 13 May 2025
 10:33:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250510010338.3978696-1-jyescas@google.com> <202505110035.wtOWnL8o-lkp@intel.com>
 <A3E9017A-7282-4BF9-AC60-E2C74EB68980@nvidia.com> <CAJDx_rj2QpiQkLoJM0x-WOD5nJQVLDbsFNm4-xZ9SfAq_f1SBw@mail.gmail.com>
 <2513BE19-5527-45A4-8BE8-A447B53654C0@nvidia.com> <9A5BA016-179F-4BFF-AB1E-61F39CA0C1C2@nvidia.com>
In-Reply-To: <9A5BA016-179F-4BFF-AB1E-61F39CA0C1C2@nvidia.com>
From: Juan Yescas <jyescas@google.com>
Date: Tue, 13 May 2025 10:33:43 -0700
X-Gm-Features: AX0GCFssEtVKMlvc2w89Raz7x1SKnlM6TwuuCt_fA0gC2KTM19wyfhtp99168uo
Message-ID: <CAJDx_rjE5mzxcXHF5beL-9w-S0EaqEEehPNkLgyWHSp91LuS-A@mail.gmail.com>
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

On Tue, May 13, 2025 at 9:52=E2=80=AFAM Zi Yan <ziy@nvidia.com> wrote:
>
> On 13 May 2025, at 12:47, Zi Yan wrote:
>
> > On 13 May 2025, at 12:41, Juan Yescas wrote:
> >
> >> On Tue, May 13, 2025 at 8:08=E2=80=AFAM Zi Yan <ziy@nvidia.com> wrote:
> >>>
> >>> On 10 May 2025, at 13:16, kernel test robot wrote:
> >>>
> >>>> Hi Juan,
> >>>>
> >>>> kernel test robot noticed the following build errors:
> >>>>
> >>>> [auto build test ERROR on linus/master]
> >>>> [also build test ERROR on v6.15-rc5]
> >>>> [cannot apply to akpm-mm/mm-everything next-20250509]
> >>>> [If your patch is applied to the wrong git tree, kindly drop us a no=
te.
> >>>> And when submitting patch, we suggest to use '--base' as documented =
in
> >>>> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >>>>
> >>>> url:    https://github.com/intel-lab-lkp/linux/commits/Juan-Yescas/m=
m-Add-CONFIG_PAGE_BLOCK_ORDER-to-select-page-block-order/20250510-090501
> >>>> base:   linus/master
> >>>> patch link:    https://lore.kernel.org/r/20250510010338.3978696-1-jy=
escas%40google.com
> >>>> patch subject: [PATCH v4] mm: Add CONFIG_PAGE_BLOCK_ORDER to select =
page block order
> >>>> config: powerpc-allmodconfig (https://download.01.org/0day-ci/archiv=
e/20250511/202505110035.wtOWnL8o-lkp@intel.com/config)
> >>>> compiler: powerpc64-linux-gcc (GCC) 14.2.0
> >>>> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/=
archive/20250511/202505110035.wtOWnL8o-lkp@intel.com/reproduce)
> >>>>
> >>>> If you fix the issue in a separate patch/commit (i.e. not just a new=
 version of
> >>>> the same patch/commit), kindly add following tags
> >>>> | Reported-by: kernel test robot <lkp@intel.com>
> >>>> | Closes: https://lore.kernel.org/oe-kbuild-all/202505110035.wtOWnL8=
o-lkp@intel.com/
> >>>>
> >>>> All errors (new ones prefixed by >>):
> >>>>
> >>>>    In file included from include/linux/gfp.h:7,
> >>>>                     from include/linux/xarray.h:16,
> >>>>                     from include/linux/list_lru.h:14,
> >>>>                     from include/linux/fs.h:14,
> >>>>                     from include/linux/compat.h:17,
> >>>>                     from arch/powerpc/kernel/asm-offsets.c:12:
> >>>>>> include/linux/mmzone.h:53:2: error: #error MAX_PAGE_ORDER must be =
>=3D PAGE_BLOCK_ORDER
> >>>>       53 | #error MAX_PAGE_ORDER must be >=3D PAGE_BLOCK_ORDER
> >>>>          |  ^~~~~
> >>>>    make[3]: *** [scripts/Makefile.build:98: arch/powerpc/kernel/asm-=
offsets.s] Error 1
> >>>
> >>> In this config, CONFIG_ARCH_FORCE_MAX_ORDER is set to 8, lower than
> >>> the default PAGE_BLOCK_ORDER value, 10. I wonder if the error should
> >>> be changed to ignore CONFIG_PAGE_BLOCK_ORDER when MAX_PAGE_ORDER is
> >>> set by CONFIG_ARCH_FORCE_MAX_ORDER and give a warning instead.
> >>
> >> In ARMv8, MAX_PAGE_ORDER is set up by CONFIG_ARCH_FORCE_MAX_ORDER
> >> and CONFIG_PAGE_BLOCK_ORDER is also set up, so we need to take into ac=
count
> >> CONFIG_PAGE_BLOCK_ORDER. For other architectures, the default will be:
> >> CONFIG_ARCH_FORCE_MAX_ORDER =3D CONFIG_PAGE_BLOCK_ORDER.
> >
> > It seems that the Kconfig =E2=80=9Crange 1 ARCH_FORCE_MAX_ORDER if ARCH=
_FORCE_MAX_ORDER=E2=80=9D
> > is not working. The above powerpc-allmodconfig has CONFIG_ARCH_FORCE_MA=
X_ORDER
> > set to 8 and CONFIG_PAGE_BLOCK_ORDER is set to 10, leading to the compi=
lation
> > error.
>
> You can get the same config by running =E2=80=9CARCH=3Dpowerpc make allmo=
dconfig=E2=80=9D.
>

Thanks, that works!

> >
> >>
> >> Is there any valid case where the MAX_PAGE_ORDER needs to be smaller t=
han
> >> the page block order?
> >
> > I am not aware of any.
> >
> >>
> >> Thanks
> >> Juan
> >>>
> >>>>    make[3]: Target 'prepare' not remade because of errors.
> >>>>    make[2]: *** [Makefile:1275: prepare0] Error 2
> >>>>    make[2]: Target 'prepare' not remade because of errors.
> >>>>    make[1]: *** [Makefile:248: __sub-make] Error 2
> >>>>    make[1]: Target 'prepare' not remade because of errors.
> >>>>    make: *** [Makefile:248: __sub-make] Error 2
> >>>>    make: Target 'prepare' not remade because of errors.
> >>>>
> >>>>
> >>>> vim +53 include/linux/mmzone.h
> >>>>
> >>>>     46
> >>>>     47        /*
> >>>>     48         * The MAX_PAGE_ORDER, which defines the max order of =
pages to be allocated
> >>>>     49         * by the buddy allocator, has to be larger or equal t=
o the PAGE_BLOCK_ORDER,
> >>>>     50         * which defines the order for the number of pages tha=
t can have a migrate type
> >>>>     51         */
> >>>>     52        #if (PAGE_BLOCK_ORDER > MAX_PAGE_ORDER)
> >>>>   > 53        #error MAX_PAGE_ORDER must be >=3D PAGE_BLOCK_ORDER
> >>>>     54        #endif
> >>>>     55
> >>>>
> >>>> --
> >>>> 0-DAY CI Kernel Test Service
> >>>> https://github.com/intel/lkp-tests/wiki
> >>>
> >>>
> >>> Best Regards,
> >>> Yan, Zi
> >
> >
> > Best Regards,
> > Yan, Zi
>
>
> Best Regards,
> Yan, Zi
