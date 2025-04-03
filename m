Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C55024EF7E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 15:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743694441; cv=none; b=RlOqOBez7uJIj6PiS5qBi/WX86FHfOOFBsbPG+qSnqf5aSoqAQPWK9Js14BWtb1AITC06BwZobKX1CGj+mMMgH0q27OrVTsijiFkg/pkwULzKvw3IJ683UxGMNIG1GQ3E9aLz1vLhAF9roAzkFgvEhvwwCdqAzGNz2si0VAcXBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743694441; c=relaxed/simple;
	bh=JsLZAXKUPdqTt30gf9EjGJVuQCU6B9GhYAqBRjm0A0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RgHMiX+JGBQnxaUFiOOsqZYukia3UI/WPqc/p5Vx9rokI+7qJH2xefl8tCi4CNb7+JBVedYMGa1IA5eklSKTC+5xWjIvCxoOmYfsxc8hjfKS/FKqRMnQ5IO6RzGJV0W8QeI8OisC31Jeiare49xmUEqSKVm3cihjCSz2SJewROM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SpJR9B/4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SpJR9B/4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7B11C4CEE3;
	Thu,  3 Apr 2025 15:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743694440;
	bh=JsLZAXKUPdqTt30gf9EjGJVuQCU6B9GhYAqBRjm0A0c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SpJR9B/4w1JObVFdIoSCrs0vXafGxZ23XBpfPUNQW0FM931bgDeRsyjJFRfNcZ5XH
	 ikR64PE0y8ypyUGLxZFXwFU1jhfs7LSieDQHKsoH7RBjEWchCHVSQrnW7Os8LBJ3bD
	 KAc/hh2w73siwCUlR5b+EzPwqybLculcIndS8SDKVCunGV/QDs2QSdtABpaWMh1ZoI
	 TUMeRYgz/zcW/2dRYpZDsPoDCZulN9IMGjQty2FpjFjmUHlhhMeq/j+CIfLKFms35y
	 62wgEHF72Chz3LOyCtwv6YczPSZbgdLNjjKrM/hkrSGaLt1cVBv5HAUhm5hBPKkwwm
	 Jt4NYoKfpfM1Q==
Date: Thu, 3 Apr 2025 17:33:56 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Uros Bizjak <ubizjak@gmail.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH -tip 2/4] x86/idle: Use MONITOR and MWAIT mnemonics in
 <asm/mwait.h>
Message-ID: <Z-6qZP00cj_K7x-_@gmail.com>
References: <20250402180827.3762-1-ubizjak@gmail.com>
 <20250402180827.3762-2-ubizjak@gmail.com>
 <Z-6pDGR0pQavVQfq@black.fi.intel.com>
 <Z-6poX1TFKLKn4mB@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-6poX1TFKLKn4mB@black.fi.intel.com>


* Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Thu, Apr 03, 2025 at 06:28:13PM +0300, Andy Shevchenko wrote:
> > On Wed, Apr 02, 2025 at 08:08:06PM +0200, Uros Bizjak wrote:
> > > Current minimum required version of binutils is 2.25,
> > > which supports MONITOR and MWAIT instruction mnemonics.
> > > 
> > > Replace the byte-wise specification of MONITOR and
> > > MWAIT with these proper mnemonics.
> > > 
> > > No functional change intended.
> > 
> > Hmm... Is it only me who gets these, please?
> > 
> > In file included from acpi/cstate.c:18:
> > asm/mwait.h:30:15: error: invalid operand for instruction
> >    30 |         asm volatile("monitor %0, %1, %2" :: "a" (eax), "c" (ecx), "d" (edx));
> >       |                      ^
> > <inline asm>:1:16: note: instantiated into assembly here
> >     1 |         monitor %rax, %ecx, %edx
> >       |                       ^~~~~
> > In file included from acpi/cstate.c:18:
> > asm/mwait.h:95:15: error: instruction requires: Not 64-bit mode
> >    95 |         asm volatile("sti; mwait %0, %1" :: "a" (eax), "c" (ecx));
> >       |                      ^
> > <inline asm>:1:7: note: instantiated into assembly here
> >     1 |         sti; mwait %eax, %ecx
> >       |              ^
> 
> FWIW, revert fixes the issue.

All gone already, tomorrow's -next should be fine.

Thanks,

	Ingo
