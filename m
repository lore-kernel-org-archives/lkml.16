Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1BF21A931;
	Fri,  9 May 2025 16:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746808468; cv=none; b=QJKYg1p5uo+Rlag2vNo+wfQ3VZzNFDC91GBfuMi6EUky4wAoMb3Pya0snWnWw1P5od88qQSi7a7Xl5u6XIhbgIIxhD+IFbrYKG1BtAhToUOeShmllFQEVvv/tEEn27XleeISYJG9Ri6KAUEGGiVeS6YlgI7CQ1xrbsHRR2RMyo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746808468; c=relaxed/simple;
	bh=UUaR5LUYX/5qsyEn6gVYQsCcbrC9AEXY+CoVxkpzanM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m+IZAv7POT8LTuRuKsTeEwNbpFA4Vk5mKkYBaa8JLq8NUtOaC5XCNmV4AWMSk1XQYBCAN3RKAFrA5S3ZY7OEoQxwAalPjGWi5dzuTn2fCTkhHfsef9wbV2oIKhIm6ndpRJrqj3Jiji7cCsz/yJGqlZvN1voCcVfWPOzuCxsxeXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Luv81E+a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Luv81E+a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B564C4CEE4;
	Fri,  9 May 2025 16:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746808468;
	bh=UUaR5LUYX/5qsyEn6gVYQsCcbrC9AEXY+CoVxkpzanM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Luv81E+a2Uhw6o8uQOxUl5Mw1lqgxiMd3DbucWmTOLyk/i7VIwIZbRL9O8xJcRBPu
	 q9RNtGdLPmHbobg2ttzZV8clP5q3lUyNPf8C+9xLUuSr/s+z377U1CyjbcruaXNw6o
	 m82RMHJwOurxI9+nlkHs7NZBp2HxDC1HN3Vs19uz9r5p5Khn8/ih/dOy2/bDfwNc68
	 +5ZnXqbZ/CTrFvDvjVi+cYH02yKR9zjn09L/yYkhTlgUt+4QucdCpCpviNmEoAtuG/
	 74C76Udg8PUSmYtUoPWKSA/P3KSjHOzfyZIW0yO2/FQZ1pznHNcOBNu7WFHzCJ3QHh
	 8CLEYxSHZH+Jg==
Date: Fri, 9 May 2025 09:34:25 -0700
From: Kees Cook <kees@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: =?utf-8?B?UGF3ZcWC?= Anikiel <panikiel@google.com>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Nathan Chancellor <nathan@kernel.org>, x86@kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Matthew Maurer <mmaurer@google.com>,
	Ramon de C Valle <rcvalle@google.com>
Subject: Re: [PATCH] x86/Kconfig: make CFI_AUTO_DEFAULT depend on !RUST
Message-ID: <202505090933.9DA60728@keescook>
References: <CANiq72k0AM3v9JZe=8mDN6T1ToiAt1-1e1zJ3z0Oh6ZWfchzag@mail.gmail.com>
 <20250416202040.GD38216@noisy.programming.kicks-ass.net>
 <202504161442.66CE2596@keescook>
 <20250417081818.GJ38216@noisy.programming.kicks-ass.net>
 <CANiq72kjDM0cKALVy4POEzhfdT4nO7tqz0Pm7xM+3=_0+L1t=A@mail.gmail.com>
 <CANiq72muSS+NNs5fxp4GPKWWhyXT95spvbGsZz6AJnK8RerUqQ@mail.gmail.com>
 <aB3A0Qe5WqmxXQJt@google.com>
 <CANiq72=NymSwziZw1a0PUNyJ=TCN5tkr3PojJRQ0sjqFWDjz-g@mail.gmail.com>
 <CAM5zL5psM0ED0A5ZkEdNi34q2itfyMCi+QRBtG-5URUsChUU6A@mail.gmail.com>
 <aB3NWUrtWMXOppYE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aB3NWUrtWMXOppYE@google.com>

On Fri, May 09, 2025 at 09:39:37AM +0000, Alice Ryhl wrote:
> On Fri, May 09, 2025 at 11:11:48AM +0200, Paweł Anikiel wrote:
> > On Fri, May 9, 2025 at 11:04 AM Miguel Ojeda
> > <miguel.ojeda.sandonis@gmail.com> wrote:
> > >
> > > On Fri, May 9, 2025 at 10:46 AM Alice Ryhl <aliceryhl@google.com> wrote:
> > > >
> > > > Actually ... I don't think putting it on CFI_AUTO_DEFAULT the right
> > > > approach.
> > > >
> > > > Shouldn't the depends on clause go on `config FINEIBT` instead? After
> > > > all, the current patch just means that you can't make FineIBT the
> > > > default option. But you can still pass kcfi=fineibt on boot to enble
> > > > FineIBT which would result in the same crash.
> > >
> > > I thought the intention was to avoid disabling FineIBT at config time:
> > > https://lore.kernel.org/all/202504161442.66CE2596@keescook/
> > 
> > I think you mean enabling FineIBT - yes, this patch does exactly that,
> > it's still possible to enable it by hand with cfi=
> > 
> > > If another approach is needed, then we can change it on top if that is
> > > OK (I am about to submit the PR).
> > 
> > Putting it on CONFIG_FINEIBT was my initial idea, but it turns out
> > that this creates a dependency cycle in Kconfig:
> > 
> > error: recursive dependency detected!
> >         symbol RUST depends on CALL_PADDING
> >         symbol CALL_PADDING is selected by FINEIBT
> >         symbol FINEIBT depends on RUST
> > 
> > Not sure if it's possible to make it work.
> 
> To fix that, we probably have to do one of:
> 
> Option 1: Upgrade the rustc MSRV past 1.81 and drop the depends on
>           CALL_PADDING.
> 
> Option 2: Split `config FINEIBT` into two options:
> 
> config HAVE_FINEIBT
> 	def_bool y
> 	depends on X86_KERNEL_IBT && CFI_CLANG && MITIGATION_RETPOLINE
> 	depends on !RUST || RUSTC_VERSION >= 108800
> 
> config FINEIBT
> 	bool "Accept cfi=fineibt option at boot"
> 	depends on HAVE_FINEIBT
> 	select CALL_PADDING

Right -- if you want to make FINEIBT unselectable, this will need some
plumbing. Right now, it's kind of tied in with the hash shuffling, so
it'll need more than just a Kconfig change to properly split it.

-- 
Kees Cook
