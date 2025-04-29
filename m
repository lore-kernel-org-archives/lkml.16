Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE8121C19E
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 10:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745922175; cv=none; b=qbDvmOd9abVhWJg2kk2IQ5fIi4hS5rPUyDX+K9Qt2zzh662Rv3kzhG59uHdFtNQJpHdRxBSXf/1gleDFZg5/5+qFDtBG8qrIb4lOmzhVanMgkx+KEPEHLLJ2OrX+Mg0eqXlFCteyRKoY7w2Y7roh2VJ5MVHzjDAEUC8vFtGBSzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745922175; c=relaxed/simple;
	bh=GIACiLW/Jc4x3T5Rk4tqtDYhcuUuBK/CdC2s1tOxhQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TAxMneJJMETmIaNVKkyXRCLfKxzVidX54s0X+ExNnOnrqoul3E8B1SJ5oaGufv5LIDDr2M4cbcSWiQH8KvFz6m3K8ubv+CD1qRMdzZE9WNrl2p/ykVApmjLiAEicr/C4eyb8PWciCNgFhpWt7sZlBygLQzV/OUjNetjK6ZGSHPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SfO0rC5/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SfO0rC5/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82414C4CEE3;
	Tue, 29 Apr 2025 10:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745922174;
	bh=GIACiLW/Jc4x3T5Rk4tqtDYhcuUuBK/CdC2s1tOxhQc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SfO0rC5/VXc5qDLoOLhdLx0vN9mBZR0Izmz+5iUIqrfvPcoTG8R+fDeJ5Lu1YBiD+
	 lx4nd7hKv0tlZAzoIPLAQ6MmSW6bjgqohil+cfHkgRznVbaH+UWGOEcnCzakPnP9Te
	 7MkmBA1TokaAR75nF+14pTpbE7+XvrqMeRxhZ9x6h5PFq+LEwiaJN8Eb//ZxWg806B
	 o3T/6ocG2oeq1UgJ8fN116uE0M9mobcucJbwvM1GiIS9+q12hCOfpNhj0em8kP21pb
	 Gt2MimkXwdqAwzQMRQzizFVi/lpkmLGEGJ93tPJ2S22QA1Jg4fkE7FA+n7E+lm1IpF
	 hESrD4KdGBWXQ==
Date: Tue, 29 Apr 2025 12:22:50 +0200
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
Message-ID: <aBCoesvpVU0-njjH@gmail.com>
References: <20250425084216.3913608-1-mingo@kernel.org>
 <20250425084216.3913608-14-mingo@kernel.org>
 <956412a3-43c2-4d6e-bea2-2573c98233ae@app.fastmail.com>
 <8D770F85-5417-4A9E-80DE-1B6A890DECEF@zytor.com>
 <1d4ddcab-cf46-4d7e-9e33-de12b6bd350c@app.fastmail.com>
 <aA34I9rY1-1QQo0R@gmail.com>
 <b97650f6-b541-4496-b84d-862fc7fd711b@app.fastmail.com>
 <aA9HaA2u-tdVA2ET@gmail.com>
 <6c363c6f-7152-4d09-96db-861eda759a35@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6c363c6f-7152-4d09-96db-861eda759a35@app.fastmail.com>


* Arnd Bergmann <arnd@kernel.org> wrote:

> On Mon, Apr 28, 2025, at 11:16, Ingo Molnar wrote:
> > * Arnd Bergmann <arnd@kernel.org> wrote:
> >> 
> >> b) always build with -march=i586 and leave only the -mtune
> >>    flags; see if anyone cares enough to even benchmark
> >>    and pick one of the other options if they can show
> >>    a meaningful regression over -march=i686 -mtune=
> >
> > That's actually a good idea IMO. I looked at the code generation with 
> > current compilers and it turns out that M686 is *substantially* worse 
> > in code generation than M586, as apparently the extra CMOV instructions 
> > bloat up the generated code:
> >
> >       text	   data	    bss	    dec	    hex	filename
> >   15427023	7601010	1744896	24772929	17a0141	vmlinux.M586
> >   16578295	7598826	1744896	25922017	18b89e1	vmlinux.M686
> >
> >  - +7.5% increase in text size (5.6% according to bloatometer),
> >  - +2% increase in instruction count,
> >  - while number of branches increases by +1.3%.
> >
> > But it's not about CMOV: I checked about a dozen functions that end up 
> > using CMOV, and the 'conditional' part of CMOV does seem to reduce 
> > branches for those functions by a minor degree and ends up reducing 
> > their size as well. So CMOV helps, a bit.
> >
> > The substantial code bloat comes from some other aspect of GCC's 
> > march=i686 flag ... I bet it's primarily inlining: there's a 0.7% 
> > reduction in number of calls done.
> 
> I had tried the same thing already, but saw a different result,

Just to clarify, my measurements only compare -march=i586 to 
-march=i686, not -mtune. Your results are primarily -mtune figures.

So unless you see something different from my figures with -march only, 
it's an apples to oranges comparison.

> There is a good chance that the -mtune= optimizations totally dwarf 
> cmov not just in code size difference but also actual performance, 
> the bit I'm unsure about is whether we still need to worry about any 
> core where this is not the case (I'm guessing not but have no way to 
> prove that).

I didn't use -mtune - I only tested two Kconfig variants:

  CONFIG_M686=y vs. CONFIG_M586TSC=y

... which map to two -march flags, not different -mtune flags:

  arch/x86/Makefile_32.cpu:cflags-$(CONFIG_M586TSC)       += -march=i586
  ...
  arch/x86/Makefile_32.cpu:cflags-$(CONFIG_M686)          += -march=i686

This is the current upstream status quo of x86-32 compiler flags, which 
results in significant .text bloat:

      text         data     bss     dec     hex filename
  15427023      7601010 1744896 24772929        17a0141 vmlinux.M586
  16578295      7598826 1744896 25922017        18b89e1 vmlinux.M686

 - +7.5% increase in text size (+5.6% according to bloatometer),
 - +2% increase in instruction count,
 - the number of branches increases by +1.3%,
 - while there's a -0.7% reduction in number of CALLs done.

I believe this is mostly the result of increased amount of inlining GCC 
14.2.0 does on march=i686 vs. march=i586.

The extra CMOV use on -march=i686 helps a bit but is overwhelmed by the 
effects of inlining.

Obviously these metrics cannot be automatically transformed into 
performance figures, but such inlining driven bloat almost always 
reduces the kernel's performance even on CPUs with large caches, for 
most but a few select 'hot' functions.

An interesting 'modern' twist: the reduced number of CALLs due to 
increased inlining is almost certainly reflected in a reduced number of 
CALLs in real workloads as well, which would be a disproportionately 
positive factor on x86 kernels and CPUs with retbleed-style mitigations 
activated (which is almost all of them).

Thanks,

	Ingo
