Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283A23D3B8
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 09:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745747408; cv=none; b=U0VNpJO960OkyOPebSUbhIIvLnDFQz2+y+a4LkwWTI29Nl/kVkwVOxfQy+CPLhGwjeQPufHHkKhtXKhfl7w1fXg/eu3QxYzF9neLWkpyhmihOm1FAyx8F+KuWPNMMmBpj4xxWsBvg2MNntqwgZ0CVOcnZscsUZ6te+AeVTRq0mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745747408; c=relaxed/simple;
	bh=8UYVrDmaKV6ZZ3qAklvl94/hVHJqh5GIwBuL4dIJJTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=px/87gRzwQQbk6+Ym7VV10YfwU1kP9C+6D0xI4O3nUP83qetIZw+yhTHJgtu5jIneC10+CBn24vhv3R7RLZtpyVJRnNwRmbt4FykSn7yk0+jodpQ9oPKYXsU+babKBSltykWlenpLhAvoqO7nrwn2LPfnh5IS2HqHwDvJGki5/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LNUFh+HV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LNUFh+HV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2390C4CEE3;
	Sun, 27 Apr 2025 09:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745747407;
	bh=8UYVrDmaKV6ZZ3qAklvl94/hVHJqh5GIwBuL4dIJJTU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LNUFh+HV+LRgnlPShS8rXS7sdSbnkm7jbQkvCdQsHl+SntI9iCfZu/sITsPyhbxQP
	 VxVG7pCTFrxhj2lsgxbjty+QQQUfryr9eRA9koIa29U19wCpHAhZZUoMF3g6dNaziW
	 Nv9RG226Cx91ZCmPX1xL1EB7VB9OTb3sTaIPT+9QrLCaJAjylLeH4tqzse919IMCEn
	 dLPiARw0uHyg45zc9QUJBD/RbN4rIYBlZ+o/PxX55rbbFkJciSe3Jau7DINL50lONy
	 6UzTYjOH4/st87qenWg4Mdd8Qo7nZjJlMjKVAK2vsoz6KgS/EbnH/Ea/txXkSFrGSP
	 8Wt7G1FYKHkCQ==
Date: Sun, 27 Apr 2025 11:50:01 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mateusz =?utf-8?Q?Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
	Mike Rapoport <rppt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] [RFC] x86/cpu: rework instruction set selection
Message-ID: <aA39ydJ7Spw-K8_1@gmail.com>
References: <20250425141740.734030-1-arnd@kernel.org>
 <aAyiganPp_UsNlnZ@gmail.com>
 <d2b0e71c-e79b-40d6-8693-3202cd894d66@app.fastmail.com>
 <CAHk-=wh=TUsVv6xhtzYsWJwJggrjyOfYT3kBu+bHtoYLK0M9Xw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wh=TUsVv6xhtzYsWJwJggrjyOfYT3kBu+bHtoYLK0M9Xw@mail.gmail.com>


* Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Sat, 26 Apr 2025 at 11:59, Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > Right. With the current set of features, CMOV is almost the
> > same as 686. My reasoning was that support for CMOV has a
> > very clear definition, with the instruction either being
> > available or not.
> 
> Yeah, I don't think there's any reason to make CMOV a reason to drop support.
> 
> It has questionable performance impact - I doubt anybody can measure 
> it - and the "maintenance burden" is basically a single compiler 
> flag.
> 
> (And yes, one use in a x86 header file that is pretty questionable 
> too: I think the reason for the cmov is actually i486-only behavior 
> and we could probably unify the 32-bit and 64-bit implementation)
> 
> Let's not drop Pentium support due to something as insignificant as 
> that.

Agreed on that. Idea to require CMOV dropped.

Note that the outcome of 486 removal will likely be that the few 
remaining community distros that still offer x86-32 builds are either 
already 686-CMOV-only (Debian), or are going to drop their 486 builds 
and keep their 686-CMOV-only builds (Gentoo and Archlinux32) by way of 
simple inertia. (There's an off chance that they'll change their 486 
builds to 586, but I think dropping the extra complication and 
standardizing on 686 will be the most likely outcome.)

No commercial distro builds x86-32 with a modern v6.x series kernel 
AFAICS.

Anyway, I agree that the maintenance cost on the kernel side to build 
non-CMOV kernels is very low.

Thanks,

	Ingo
