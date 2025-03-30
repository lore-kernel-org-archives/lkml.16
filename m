Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2569C80C02
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 19:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743362433; cv=none; b=EcZqq8j8wOwvFu8O2mvN6G/dvy5GO2y7B9BU8GMjW3mL2O6Qj9/QaHjHoFerCWY+wvslGe2AmAnA3gYX//nN3wXqVMsRz2enr8xTNlWKmAOnZqqUt9u1J1gfe5LTAmF/xc0YOPJCbbHk4q5aPlu0uTXpsmCce+SZbFeTxyk5xYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743362433; c=relaxed/simple;
	bh=rsbJa18r1oClDCmvKLOHT/qFx7mEayUhEfw+cyknsOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bT5CtctSoJhnRYA/9DRbFLAQM4vDthDGsMU60W+20QmjIi4OLp9woK2zcu8G/sfQOo8MQD46JJ/mi1G467tOJW+zDNCSbFgdbd0UMRYq2GO8GviEmYDb03/I5b4530xn+K8gFbx9qdxGpcJMgMa8OB16lxBjPKGJUDZJbua3iW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tpvD102o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tpvD102o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C812FC4CEDD;
	Sun, 30 Mar 2025 19:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743362432;
	bh=rsbJa18r1oClDCmvKLOHT/qFx7mEayUhEfw+cyknsOY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tpvD102oggaCZfkfwhlXNYxMWBvjMFcE3JRgYAvIlH/eVzb+tSVReir46Ln6vS/Ku
	 8rshRhTU2UAnK5pl8W1xJAKnwYp4Z8Z3l/hKXBMHukjFdHXeCLy3oopa8DXpKXbdpq
	 8udslUkbkJ+UxvjXzXSR4pxijTyih8l1nM2Uy7r/9teKHmxMmHm2KypTmQ4+AxR9Cu
	 spKricPl1qpOMEXHvAdjE5olpA7njAmgODi/eUUzblCfne38xGiK8sO4GrMsPlLMWL
	 sXQmAsFTTivKiKM5aKS32EazmI+YSG5YBtJtiV4UE895OzCeN7j8+qhbOxmHMEaF08
	 tHdrgP+3nrerQ==
Date: Sun, 30 Mar 2025 21:20:28 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Uros Bizjak <ubizjak@gmail.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH -tip 2/2] x86/hweight: Use POPCNT when available with
 X86_NATIVE_CPU option
Message-ID: <Z-mZfCvep7iMrqoU@gmail.com>
References: <20250325164854.199420-1-ubizjak@gmail.com>
 <20250325164854.199420-2-ubizjak@gmail.com>
 <20250325171141.GDZ-LjzaPbAG1MwjZi@fat_crate.local>
 <CAFULd4ZT5mjjEXW3SnGQVMo18fO8CapFS-ikLQvYFw5EKtEfmA@mail.gmail.com>
 <20250330173140.GCZ-l__PVdSx6mj-zL@fat_crate.local>
 <Z-mRwxb3r1yrH332@gmail.com>
 <20250330190651.GDZ-mWS5RRwsN8Q3g4@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250330190651.GDZ-mWS5RRwsN8Q3g4@fat_crate.local>


* Borislav Petkov <bp@alien8.de> wrote:

> On Sun, Mar 30, 2025 at 08:47:31PM +0200, Ingo Molnar wrote:
> >  +#ifdef __POPCNT__
> >  +     asm_inline (ASM_FORCE_CLR "popcntl %[val], %[cnt]"
> >  +                 : [cnt] "=&r" (res)
> >  +                 : [val] ASM_INPUT_RM (w));
> >  +#else
> >        asm_inline (ALTERNATIVE(ANNOTATE_IGNORE_ALTERNATIVE
> >                                "call __sw_hweight32",
> >                                ASM_CLR "popcntl %[val], %[cnt]",
> >                                X86_FEATURE_POPCNT)
> >                         : [cnt] "=a" (res), ASM_CALL_CONSTRAINT
> >                         : [val] REG_IN (w));
> >  -
> >  +#endif
> 
> That ifdeffery.
> 
> The alternative only is fine as this is the usual way we do those 
> insns.
> 
> The ifdeffery around it is ugly and is pushing it and it would be 
> fine if it would bring anything but it doesn't. It is making the code 
> ugly for no good reason whatsoever.

Tangible code size reduction, if it can be realized, is definitely 
'something', so your claim is simply false.

> > Which is 3 straightforward lines of assembly code and a 
> > straightforward #ifdef.
> 
> And they bring what exactly?
> 
> I haven't seen anything besides some super minor, completely 
> pointless, hm, "savings". So much so that the uglification of the 
> function is not worth it in the *least*.

Even 0.5K of .text reduction is a tangible benefit.

The kernel's 35 years long history comprises of literally over a 
million patches, which were small and inconsequential 99% of the time.

> > My main objection is different: if __POPCNT__ isn't defined during 
> > the kernel build of major Linux distros, then this optimization 
> > almost doesn't exist to our users. And I don't think it's defined.
> 
> Yah, that too.
> 
> This whole effort is a total waste of time and energy.

We don't know yet for sure, but I don't think an absolutist "can't do" 
approach is very productive.

Thanks,

	Ingo
