Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA64E1CAA92
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 12:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751889961; cv=none; b=GOq4vmzXFmtIhX2S6E9Br3EO68YXscKCCE+H4aVU1gQXk2iYBnaKw+8oEW1PVhokbywwX/z5jlcSgc9pVfcBrqy37vHh4DpHGYtuXtDX1/bmVvobtJ+tB3mI95xYsZ9W7iPhhRYoYKv4cuBoRUhSQtM4IRLTSJRhXVxem+MaeLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751889961; c=relaxed/simple;
	bh=tZ801LLNKdS+VNXgUpZHe/YDCfJy/le/GNWNddLIspE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NgIg4H4xP/7R3k089qgpJjdLH2E9s/VUuKkg05NFVZ0SE8BAySAjk8jeVaVA7G7KA0OcANPxphzn6ONY81WDMyKUQ5Vb3TDeQWVKfZQ7NB5yq6Bs8DaIX3N24PcMuFjzIgH/HuXHJ4Gfq/UyY1Krb+/TxaBGfQtjxMtICxexPOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readmodwrite.com; spf=none smtp.mailfrom=readmodwrite.com; dkim=pass (2048-bit key) header.d=readmodwrite-com.20230601.gappssmtp.com header.i=@readmodwrite-com.20230601.gappssmtp.com header.b=uECnhbHU; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=readmodwrite-com.20230601.gappssmtp.com header.i=@readmodwrite-com.20230601.gappssmtp.com header.b="uECnhbHU"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-311ef4fb43dso2380024a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 05:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=readmodwrite-com.20230601.gappssmtp.com; s=20230601; t=1751889959; x=1752494759; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AbRTOhGVmvoLFbv7787UbxqrHjCa5AmcSlfrkYU6bVo=;
        b=uECnhbHU+p+KbswA+XWlCo8yiN6kp7nPblQAejYEf03Ce/vC0Cdi0c9wkHbDTXl8c/
         xDty7+GfaOE8U+qbbFM81JEt2yfzNEobPmq5bTED5yKsgvbaBDrzi6FAA1JEgN09xas4
         zl++PseNmfLUFf+xup8/IGN0kLxeu4lZGJiizgd0bGH1C2wFGzTz8XG/Dygo2UderIja
         ZdaDmM7PrADzWhfrZTXlH4iEGMczYl6X2nLEsljRW0psWd5tUR/LBTTc+pnLJgzgEGIq
         oKpPSL15/YZuV8Nm1oAJPcIbPpJJvHKqg1GT/kCzC5ptLZe6Un1bZahy6k0m4GoJPEUs
         /aow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751889959; x=1752494759;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AbRTOhGVmvoLFbv7787UbxqrHjCa5AmcSlfrkYU6bVo=;
        b=Gz9DK3GNFPwvBTnsod657pFU/0NYuQFF35jEoN6/6IjCl06bo9HlARzSwWgXFKakmT
         b+4DTEjjEw57M1VcVyGoDIOyCF335ETqDUMeuJUiol/Hl1CG5c8BYCemcObcNFFB/hi/
         gzed+WDQsttk25G1kfrp3/8HWE6H+3luwXVu0pQxgupd26OZuvkgPSP1nHAVs5MBpoyO
         DxCTjjFgtBpMN126/B8Ojy9fGpJS05Qhb3qEVRmNer7dFZ2+dX+/rf6pbgDxM6tgrS5x
         BDD4OmKHgWeYGwytgxW0dkt3G8sjwbJOcID1LGw7OGCV3EPDpnDVFwNTETX2VyIef/Wx
         iTEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiJOsZ+ZN60a2SyqOM3b4GvQjBJ15anjPIi7JNvbKxIU4y/VituseqtXkBjUMwM6tFdjzG/pmbcRqV2mM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWgjbX7yXfPJ14Zc9r6ad61CjxZu27FuLvPVLHMMZalcErZoOm
	2pAVw9D5YhNvFUJJAPPlQGGEuiuY03En+6psokmtht/pFZNPFWm+aawLiV/qFRdKi4L8tgF0UwN
	r1QR4c18B2E0/unF+DLMTTqK2R2UYz2BhaVjNhihdVg==
X-Gm-Gg: ASbGnctVty0Tv9l/vKe2SHHhZlnqMO6biCBbzHiR0IK6baa/WX1pBzVYRzmNMAaX88w
	TfT3VMGCNHo05OfMrlbtKE7lZEf/yKM1mNX3hQCmp3J6xOZtSyRRR5eneZ919jRBSByTSt6hJdE
	fAj5ZQkOqjppCwlaKw4xtmr7tsTW9scxIhJf6sPBV/ht1ZFeWkEHoJFjuNjBis
X-Google-Smtp-Source: AGHT+IGUdt3KMjfnarURaNeP6WlX5nDMccMisIpvVAtRfZIXRm1ihWFRYUMZ6WRww+XZ0TQLt/UUU5X1wU/E7Un8bGY=
X-Received: by 2002:a17:90b:2ecd:b0:311:ef19:824d with SMTP id
 98e67ed59e1d1-31aadcb0f0emr20626562a91.2.1751889959009; Mon, 07 Jul 2025
 05:05:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250704120604.2688934-1-matt@readmodwrite.com>
 <202507051300.E0JSHxu1-lkp@intel.com> <CANpmjNMU26CGN2zYvCYC9eFwfsgHW4U=DQs4sA8TTPte7RTrSg@mail.gmail.com>
In-Reply-To: <CANpmjNMU26CGN2zYvCYC9eFwfsgHW4U=DQs4sA8TTPte7RTrSg@mail.gmail.com>
From: Matt Fleming <matt@readmodwrite.com>
Date: Mon, 7 Jul 2025 13:05:47 +0100
X-Gm-Features: Ac12FXzyYmYk7YR7M3ps6gHcAJL7EYFN2ugE_j8ajeQSisU5-HpmQRqbIHrcaFw
Message-ID: <CAENh_STpgcdkwZiB2Zd-10QmnadnUBiMjOQPPFqaEVpYjrU4Zg@mail.gmail.com>
Subject: Re: [PATCH v2] stackdepot: Make max number of pools build-time configurable
To: Marco Elver <elver@google.com>
Cc: kernel test robot <lkp@intel.com>, Andrew Morton <akpm@linux-foundation.org>, 
	oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, linux-kernel@vger.kernel.org, 
	kernel-team@cloudflare.com, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Oscar Salvador <osalvador@suse.de>, Vlastimil Babka <vbabka@suse.cz>, 
	Matt Fleming <mfleming@cloudflare.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 7, 2025 at 7:40=E2=80=AFAM Marco Elver <elver@google.com> wrote=
:
>
> On Sat, 5 Jul 2025 at 08:01, kernel test robot <lkp@intel.com> wrote:
> >
> > Hi Matt,
> >
> > kernel test robot noticed the following build errors:
> >
> > [auto build test ERROR on akpm-mm/mm-nonmm-unstable]
> > [also build test ERROR on linus/master v6.16-rc4 next-20250704]
> > [cannot apply to akpm-mm/mm-everything]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Matt-Fleming/sta=
ckdepot-Make-max-number-of-pools-build-time-configurable/20250704-200804
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-=
nonmm-unstable
> > patch link:    https://lore.kernel.org/r/20250704120604.2688934-1-matt%=
40readmodwrite.com
> > patch subject: [PATCH v2] stackdepot: Make max number of pools build-ti=
me configurable
> > config: arm64-randconfig-001-20250705 (https://download.01.org/0day-ci/=
archive/20250705/202507051300.E0JSHxu1-lkp@intel.com/config)
> > compiler: aarch64-linux-gcc (GCC) 10.5.0
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20250705/202507051300.E0JSHxu1-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202507051300.E0JSHxu1-l=
kp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> >    In file included from include/linux/init.h:5,
> >                     from include/linux/printk.h:6,
> >                     from include/asm-generic/bug.h:22,
> >                     from arch/arm64/include/asm/bug.h:26,
> >                     from include/linux/bug.h:5,
> >                     from include/linux/vfsdebug.h:5,
> >                     from include/linux/fs.h:5,
> >                     from include/linux/debugfs.h:15,
> >                     from lib/stackdepot.c:17:
> > >> include/linux/build_bug.h:78:41: error: static assertion failed: "DE=
POT_MAX_POOLS <=3D (1LL << (DEPOT_POOL_INDEX_BITS)) - 1"
> >       78 | #define __static_assert(expr, msg, ...) _Static_assert(expr,=
 msg)
> >          |                                         ^~~~~~~~~~~~~~
> >    include/linux/build_bug.h:77:34: note: in expansion of macro '__stat=
ic_assert'
> >       77 | #define static_assert(expr, ...) __static_assert(expr, ##__V=
A_ARGS__, #expr)
> >          |                                  ^~~~~~~~~~~~~~~
> >    lib/stackdepot.c:42:1: note: in expansion of macro 'static_assert'
> >       42 | static_assert(DEPOT_MAX_POOLS <=3D (1LL << (DEPOT_POOL_INDEX=
_BITS)) - 1);
> >          | ^~~~~~~~~~~~~
>
> This is odd. The randconfig here uses the default:
>
> > CONFIG_STACKDEPOT_MAX_POOLS=3D8192

Ugh, I see what's happened here. For this config, the expression evaluates =
to

  static_assert(8192 <=3D 8191);

So the default needs to be 8191.
