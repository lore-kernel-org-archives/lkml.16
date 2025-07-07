Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA0E2797AB
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 06:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751870410; cv=none; b=KcfJH/AHQmEqlgGt+fbhw7wb6sjF7X91GjX1EdvasPkCVhKWLoUL8RvuyRDorsQW3OSorpS3BzNMH96/aKCXcCS5DzcyRYUS51a6FWE8gH+6HDhdTjM6l0ZHiALX3xto1Bp7Dwhfyz5OFDGOCVralDGcAEZCDW2B2fvytZdoz9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751870410; c=relaxed/simple;
	bh=h5qe5wP5akorexOjbomxqoKsYJPNUhpTj+jDDh/DP5c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hHNQHeIttojKjKlhFdkhF4uZkJwmkJuVhStzVGtcdim9buS3FUB8LcudA7N8biZyfDlXZkXwZZsLFS8MYaVgmjLF08mG2BTp8dluHO+DvjnscxZH/XlTgYpg9M3bAZucrp07M4vZpnFkjhh5Yyx5fzu2MRb1zjddJhjLTPfF/jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=F/QI8ZTo; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="F/QI8ZTo"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3190fbe8536so2331245a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 23:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751870408; x=1752475208; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QJhAGJ9tmMlIKcB16GBcz6X9yl3DYiY3sfL1qtRWK70=;
        b=F/QI8ZToY+R9AXzYvgSdaJB60fE0Z+pwPzpDCEp0Mz73srqpJEd6MktlaVgki3vXZ1
         6XPlqyP31LdJy6LSKZKGyKs7U9sBCTOd7AX3muhMXwm6XbPWX+3fYKCDI1dXEfJyRC0x
         17g7/9QWfjisuTQ5xjcmEx76YOGed/rmHjbThfuPKhXAC79PbiFE6mUm8YYcHMHHsjrq
         LoXGbcr2uR/K/WH3tQ5m7q2wAkvArfdnaLBT4ndwennyLXkhtuPsDpETHnQPdlW1n4AB
         SMwYcqVlbOOoyHOf7VOTJXf00vgK7LO/peqQFe3ynoFdhhIL/9AT1cV9lc0kDhfIyzsB
         FJeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751870408; x=1752475208;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QJhAGJ9tmMlIKcB16GBcz6X9yl3DYiY3sfL1qtRWK70=;
        b=nXIVCHdym9XD0ifN6yMoRnRdrMveU4MyNH7joW4OEHNVCbpRma0LEjI9XOLxlTDwAD
         ZO5JOb/73S6K5rqBxZ9ZUS4gIDbMGdfVzpnd7qKjb2Fvg0aBv8zEZMobmrBPNPC3EQJl
         nz1VHXcVvG7qtey7X/lSBSTtJukpGDFCT9e8gdGedJaABbJZK8h4WeSNmn7AljX01tuQ
         /Nd/rolWxyc0zoJXWu18MyA4Lehhd9oM10Lmn4+LjP8tCQYsrcl/2SeQAdGjbVPLeSiU
         O9tSl2Bg9cHhynb2aSguooglv3iXG4VBAliy/+ma+yYAgtW+VfikXSKvy+Uy6Y+/za07
         MHRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXt4wyGUdiZPiNR+V2V3rwQhmjj1/6Bvh5692zlgbSm6IHpxIffdwIbR5CQlQoPkcARmNPZHFwcAuHsJzU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7W/Clu9zHQMS2xNkV2SyoUAa/EG0VQaXdhdFM5BKMnMYuU0FJ
	h0RtVNRGQXhEodQ54tZont/d+ofcRbuXdE1emqkPqO3eD2Azh1QUriW9V5pY8I80f1qaXVausEW
	4aQg4PmlWejG+r6AJGCNyAEwQNtzsiKCr07gaztzG
X-Gm-Gg: ASbGncuH1qHA1TiCNaIMU5MYovYWP0oS3dYrPErzBmf9NJ7YX/yLcGtmXTwcfmtDP/i
	TRe5D3BVW07iKHWen2rQ5zt9NIF+9Y2L/Ubkvvtc77nfjn6pnAEP7IN3jc29Bwvw5HtIEQrCKTj
	XvaHak6VVlIgfkay47zFWIwC/QZoi8BgkVYCYvv2Wbs4KlrRQiLvE9dUxkySeb1M0D58WeNUOlp
	WqOR7+Z3GrG
X-Google-Smtp-Source: AGHT+IH2JrxplFpTRlsOFUQX9GNs+cq+uKVtxro6hLk8JyoR/xG6hab4OA8rIVs7DpqX2HYTroPSbhWqeS49OTgpLTk=
X-Received: by 2002:a17:90b:3fcd:b0:311:df4b:4b82 with SMTP id
 98e67ed59e1d1-31aadcf7c3amr15462676a91.4.1751870407541; Sun, 06 Jul 2025
 23:40:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250704120604.2688934-1-matt@readmodwrite.com> <202507051300.E0JSHxu1-lkp@intel.com>
In-Reply-To: <202507051300.E0JSHxu1-lkp@intel.com>
From: Marco Elver <elver@google.com>
Date: Mon, 7 Jul 2025 08:39:30 +0200
X-Gm-Features: Ac12FXz542X-7N20muK4y55Qaq43ij6l3VZo-CTwD1D1GBG89fL4Qb0H3409Eco
Message-ID: <CANpmjNMU26CGN2zYvCYC9eFwfsgHW4U=DQs4sA8TTPte7RTrSg@mail.gmail.com>
Subject: Re: [PATCH v2] stackdepot: Make max number of pools build-time configurable
To: kernel test robot <lkp@intel.com>
Cc: Matt Fleming <matt@readmodwrite.com>, Andrew Morton <akpm@linux-foundation.org>, 
	oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, linux-kernel@vger.kernel.org, 
	kernel-team@cloudflare.com, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Oscar Salvador <osalvador@suse.de>, Vlastimil Babka <vbabka@suse.cz>, 
	Matt Fleming <mfleming@cloudflare.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, 5 Jul 2025 at 08:01, kernel test robot <lkp@intel.com> wrote:
>
> Hi Matt,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on akpm-mm/mm-nonmm-unstable]
> [also build test ERROR on linus/master v6.16-rc4 next-20250704]
> [cannot apply to akpm-mm/mm-everything]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Matt-Fleming/stackdepot-Make-max-number-of-pools-build-time-configurable/20250704-200804
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
> patch link:    https://lore.kernel.org/r/20250704120604.2688934-1-matt%40readmodwrite.com
> patch subject: [PATCH v2] stackdepot: Make max number of pools build-time configurable
> config: arm64-randconfig-001-20250705 (https://download.01.org/0day-ci/archive/20250705/202507051300.E0JSHxu1-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 10.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250705/202507051300.E0JSHxu1-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202507051300.E0JSHxu1-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    In file included from include/linux/init.h:5,
>                     from include/linux/printk.h:6,
>                     from include/asm-generic/bug.h:22,
>                     from arch/arm64/include/asm/bug.h:26,
>                     from include/linux/bug.h:5,
>                     from include/linux/vfsdebug.h:5,
>                     from include/linux/fs.h:5,
>                     from include/linux/debugfs.h:15,
>                     from lib/stackdepot.c:17:
> >> include/linux/build_bug.h:78:41: error: static assertion failed: "DEPOT_MAX_POOLS <= (1LL << (DEPOT_POOL_INDEX_BITS)) - 1"
>       78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>          |                                         ^~~~~~~~~~~~~~
>    include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
>       77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
>          |                                  ^~~~~~~~~~~~~~~
>    lib/stackdepot.c:42:1: note: in expansion of macro 'static_assert'
>       42 | static_assert(DEPOT_MAX_POOLS <= (1LL << (DEPOT_POOL_INDEX_BITS)) - 1);
>          | ^~~~~~~~~~~~~

This is odd. The randconfig here uses the default:

> CONFIG_STACKDEPOT_MAX_POOLS=8192
