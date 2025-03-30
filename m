Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8387218E75A
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 18:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743360860; cv=none; b=fWARAQzjVTAgS8UC10pI0MXfGa6uCqqwxJWP7JlVUwclaK+e0Tg14KKNns/HsRaY7CTYlyLLtibLXVpTJCWFGIDpQiL72OiHlq7YmLaEiTgT78GOTsRT8gz77bOyuUrP7h9YqRmZioeRdqJ2V1GctBU8jCX4SXM7DeTm8mxVXeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743360860; c=relaxed/simple;
	bh=2wxCf3/vhKuenpzwtjl9XnuTJc4oIpz0aXNE32kqTz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mZbIqkwXuEO5RwUuRaBdhXHE38cKobkhd662CdtAujq4pnPqBCItDx+TDKeRBDPaGWabUdEGd6cf1Kw4EfQ434Mc0rMTPRAe7jdYMHyJnSUtYBKrxbubpOIekGyCyxrbOFlrCcARKp4xKbkXeOgY9ytwAPueSrB6G62gYePD5RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dBEZ4bI5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dBEZ4bI5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4076CC4CEDD;
	Sun, 30 Mar 2025 18:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743360860;
	bh=2wxCf3/vhKuenpzwtjl9XnuTJc4oIpz0aXNE32kqTz8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dBEZ4bI5UPgKikFwS7Y7MbAIlbpwLdyIPRl5T7kMJ+OcwmqLNsFTuI1dBSESjScXj
	 Cy+L8SnQNDlHhHDkxPwWMRQ2NRrNbhH6REGI+j0LA1TbTqZRAbAaeVTMeFdTaLp0cO
	 SO3DkLd/acH4ku1tmMIWTXNjq+8Yx+E5iIuHtBa36Rt5ad1yGmxEM+kV39qUkuJODd
	 BbQC6GyvKRyIXmyJeIo9AXDHsv08pSQenFiL19ZEQdhnzaj/LUyMn0ogQVbkY8lqvu
	 P9hSU3bjXTfr8kT/Y7Kxj9XLLvxOGTNKR0l3IIjWGtWobFsVZ0BstWLF2oGQyQb6lO
	 U3tGaeaM+DdKg==
Date: Sun, 30 Mar 2025 20:54:15 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH -tip 2/2] x86/hweight: Use POPCNT when available with
 X86_NATIVE_CPU option
Message-ID: <Z-mTVyOb8h1wYxvt@gmail.com>
References: <20250325164854.199420-1-ubizjak@gmail.com>
 <20250325164854.199420-2-ubizjak@gmail.com>
 <Z-Mme_OxuhYfxgzO@gmail.com>
 <CAFULd4bCnnL-CBFwgAQtN9S+sUE_wikda6E+8k9632J9b62dCg@mail.gmail.com>
 <Z-kVT4ROZJXx6kui@gmail.com>
 <CAFULd4a2eOhZ4TPQRsLtN1yPYSfgqsXR_yOG+z3PedE-ZCMynw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFULd4a2eOhZ4TPQRsLtN1yPYSfgqsXR_yOG+z3PedE-ZCMynw@mail.gmail.com>


* Uros Bizjak <ubizjak@gmail.com> wrote:

> On Sun, Mar 30, 2025 at 11:56 AM Ingo Molnar <mingo@kernel.org> wrote:
> >
> >
> > * Uros Bizjak <ubizjak@gmail.com> wrote:
> >
> > > > So a better optimization I think would be to declare and implement
> > > > __sw_hweight32 with a different, less intrusive function call ABI
> > > > that
> > >
> > > With an external function, the ABI specifies the location of input
> > > argument and function result.
> >
> > This is all within the kernel, and __sw_hweight32() is implemented in
> > the kernel as well, entirely in assembly, and the ALTERNATIVE*() macros
> > are fully under our control as well - so we have full control over the
> > calling convention.
> 
> There is a minor issue with a generic prototype in <linux/bitops.h>,
> where we declare:
> 
> extern unsigned int __sw_hweight32(unsigned int w);
> extern unsigned long __sw_hweight64(__u64 w);
> 
> This creates a bit of mixup, so perhaps it is better to define and use
> an x86 specific function name.

Yes, I alluded to this complication:

> > For example, we could make a version of __sw_hweight32 that is a
> > largely no-clobber function that only touches a single register, which

That version of __sw_hweight32 would be a different symbol.

> > I'm not saying it's *worth* it for POPCNTL emulation alone:
> >
> >  - The code generation benefits might or might not be there. Needs to
> >    be examined.
> 
> Matching inputs with output will actually make the instruction
> "destructive", so the compiler will have to copy the input argument
> when it won't die in the instruction. This is not desirable.

Yeah, absolutely - it was mainly a demonstration that even 
single-clobber functions are possible. (There's even zero-clobber 
functions, like __fentry__)

> I think that adding a __POPCNT__ version (similar to my original 
> patch) would bring the most benefit, because we could use "rm" input 
> and "=r" output registers, without any constraints, enforced by 
> fallback function call. This is only possible with a new 
> -march=native functionality.

Yeah, -march=native might be nice for local tinkering, but it won't 
reach 99.999% of Linux users - so it's immaterial to this particular 
discussion.

Also, is POPCNTL the best example for this? Are there no other, more 
frequently used ALTERNATIVE() patching sites with function call 
alternatives that disturb the register state of important kernel 
functions? (And I don't know the answer.)

Thanks,

	Ingo
