Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CA3524F
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 09:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745831789; cv=none; b=EBd2tAJwMBAz03LdOOBrVyDhYwUtB3tAMUZMCLgVOu0SwK2F1YZ0NW3NGvu6a/4L5kg6u/7fH5SsO/qAzh0AvDEKE2UUiF4vDxwTbGBx3PNO36kLWbl/mJlpUJTiySoKURuMH8qJv8fl8XGHHfkb7C1prOG186FgvUj9QJoU/sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745831789; c=relaxed/simple;
	bh=18z0UFVK2+ltYjRhi6k2kC9A4OIkcYfmIxJea4MPBqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q+QkbRU5ne/MzHgncMk71cWGgyCSuxkALsAQf+BtwZ71VR570d+/QPfeTmKzaa3EHxF6HHACXh1fXbPctnEWW2F3KVkJJZB87qOQdcxPpWjxHXexS1XOFW+z/bELHD3/57qp0D+IiyKpRNrc0EKJYbveo2u8eoJWcZL43BgDTiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ab/pYdoL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ab/pYdoL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0247C4CEE4;
	Mon, 28 Apr 2025 09:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745831789;
	bh=18z0UFVK2+ltYjRhi6k2kC9A4OIkcYfmIxJea4MPBqY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ab/pYdoL5tVg6JgaSGJc4LpUmSn0kF4vUAPDs9SrSeHddc7lXJn8STMLqo6ZR16Yi
	 0/LSenW/9wLJ003JjpOL+WDYB/AVlGAmEzcowoIGiwCXHUmGKMzKDruAYB21d0D1w5
	 i4fAzeZ3WBaM40aevogVMEW8pPfuTJjj/TeGeQ4f/55G8Twr0DXVd5nJ3mgCB62Glp
	 ypUffuexicme1UqUvm4IZx6qAVwOlVE4/azHzSgEpcojs8XqEnfEVoPqdQWaCkvBiB
	 gyvoeHsm260suBEOUb14dpPUk0VzHsXKhWvaXRAt9RjIp7x5UwcggQo9kyzrgVCe8U
	 te/tPQ8RVa7PA==
Date: Mon, 28 Apr 2025 11:16:24 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
	"Ahmed S . Darwish" <darwi@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Ard Biesheuvel <ardb@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	John Ogness <john.ogness@linutronix.de>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 13/15] x86/cpu: Make CONFIG_X86_CX8 unconditional
Message-ID: <aA9HaA2u-tdVA2ET@gmail.com>
References: <20250425084216.3913608-1-mingo@kernel.org>
 <20250425084216.3913608-14-mingo@kernel.org>
 <956412a3-43c2-4d6e-bea2-2573c98233ae@app.fastmail.com>
 <8D770F85-5417-4A9E-80DE-1B6A890DECEF@zytor.com>
 <1d4ddcab-cf46-4d7e-9e33-de12b6bd350c@app.fastmail.com>
 <aA34I9rY1-1QQo0R@gmail.com>
 <b97650f6-b541-4496-b84d-862fc7fd711b@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b97650f6-b541-4496-b84d-862fc7fd711b@app.fastmail.com>


* Arnd Bergmann <arnd@kernel.org> wrote:

> >   M486
> >   M486SX
> >   M586
> >   M586MMX         # NEW
> >   M586TSC         # NEW
> >   MCYRIXIII       # NEW
> >   MELAN
> >   MGEODEGX1       # NEW
> >   MK6             # NEW
> >   MWINCHIP3D
> >   MWINCHIPC6
> 
> This would also mean dropping support for the pre-2015 Intel Quark
> and DM&P Vortex86DX/DX2/MX/EX that never had a custom CONFIG_Mxxxx
> option but are still relevant to some degree.
> I think that would be a mistake. 

Yeah, agreed, and especially with the <asm/bitops.h> CMOV complication 
removed per Linus's patch, we could actually remove CONFIG_X86_CMOV, as 
nothing uses it anymore:

  starship:~/mingo.tip.git> git grep X86_CMOV
  arch/x86/Kconfig.cpu:config X86_CMOV
  arch/x86/Kconfig.cpufeatures:   depends on X86_CMOV

The CMOV dependency comes in through compiler options only: 

  arch/x86/Makefile_32.cpu:cflags-$(CONFIG_M586TSC)	+= -march=i586
  arch/x86/Makefile_32.cpu:cflags-$(CONFIG_M586MMX)	+= -march=pentium-mmx
  arch/x86/Makefile_32.cpu:cflags-$(CONFIG_MCYRIXIII)	+= $(call cc-option,-march=c3,-march=i486) $(align)
  arch/x86/Makefile_32.cpu:cflags-$(CONFIG_MGEODEGX1)	+= -march=pentium-mmx
  arch/x86/Makefile_32.cpu:cflags-$(CONFIG_MGEODE_LX)	+= $(call cc-option,-march=geode,-march=pentium-mmx)

These build options will, indirectly, not include CMOV in the kernel 
image, while i686 and higher march options will.

(BTW., we should probably remove the -march=i486 fallback for 
MCYRIXIII, our minimum CC version is beyond that already I believe.)

Anyway, the current plan is to not drop common-i586, only the removal 
of what's in the -v1 series:

   M486
   M486SX
   M586
   MELAN
   MWINCHIP3D
   MWINCHIPC6

> Here are some alternatives I like better than dropping i586:
> 
> a) keep my patch with an new bool option to pick between
>    i586 and i686 targets, by any name.
> 
> b) always build with -march=i586 and leave only the -mtune
>    flags; see if anyone cares enough to even benchmark
>    and pick one of the other options if they can show
>    a meaningful regression over -march=i686 -mtune=

That's actually a good idea IMO. I looked at the code generation with 
current compilers and it turns out that M686 is *substantially* worse 
in code generation than M586, as apparently the extra CMOV instructions 
bloat up the generated code:

      text	   data	    bss	    dec	    hex	filename
  15427023	7601010	1744896	24772929	17a0141	vmlinux.M586
  16578295	7598826	1744896	25922017	18b89e1	vmlinux.M686

 - +7.5% increase in text size (5.6% according to bloatometer),
 - +2% increase in instruction count,
 - while number of branches increases by +1.3%.

But it's not about CMOV: I checked about a dozen functions that end up 
using CMOV, and the 'conditional' part of CMOV does seem to reduce 
branches for those functions by a minor degree and ends up reducing 
their size as well. So CMOV helps, a bit.

The substantial code bloat comes from some other aspect of GCC's 
march=i686 flag ... I bet it's primarily inlining: there's a 0.7% 
reduction in number of calls done.

I have a hard time believing that this kind of bloat and complexity 
helps performance to *any* degree.

I really didn't remember how bad it was, until I re-measured it.

CMOV is likely a drop in the ocean compared to this kind of text bloat. 
And yeah, it doesn't really matter that i686 class CPUs have larger 
caches, the kernel is dominantly cache-cold code execution, inlining 
driven bloat almost never helps performance.

> c) keep the outcome of your v1 series, dropping only
>    pre-i586 support, and leave my patch out. No change here,
>    so at least no regression potential.

Yeah, so this is roughly the current plan, with perhaps light touchups 
on top to make it easier to configure, and to remove residual legacies.

Thanks,

	Ingo
