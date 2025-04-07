Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD2A20FA8F;
	Mon,  7 Apr 2025 17:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744048062; cv=none; b=N7YOplXjeG5dho+fGEPDt71qWuCt5AUnYy7XatJq8i/ANX0PE9m3DZdvu9HRvL8qgVAY3bHHxs3++exlQo/KaIZuDVJKOw6r70CJ2ZuBKe77kZ1FEjDGt9Cmw1K4J3YunEkCtHvydalu6eIaDDTZUffZu0zz6PsmkAwxjoErEzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744048062; c=relaxed/simple;
	bh=LCOtNNrpVZmriqn/2j8arDSoQ5pjQNWL+FUtw55KIT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D02Ogeh/jzwub94S+5GVVK83ip3h130uJN+CVZnSuIon/fFy7KaaNDAsKx22IAruzzzfQ6Gj8ru1P0T1MLvHRBzdSEGodF46yCGiSo4RBEmVk9027AS8kDT02DZlLLyCHfm8O31ISbSWoLDaVQZ6Ji86sq7C2Xkyp6orSxUKfYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TR5yGXWA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TR5yGXWA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CC93C4CEDD;
	Mon,  7 Apr 2025 17:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744048062;
	bh=LCOtNNrpVZmriqn/2j8arDSoQ5pjQNWL+FUtw55KIT4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TR5yGXWAMDPR4Zf8/5QuBIhPyonpjHH8ZXYaqFPJEoRCZDMXVUzK+qOOp/kOuS0ou
	 G+VRvM6rIiom5ygtQDI3uafnbnbXMTdzT30PJidg2AfHJmADqI5Q9BM5x5IOwBFYF0
	 otvFwv8NKhHT9+9GUJqvtj/SrvKVn9ZMYxa8GrF/qjhdeDJ4TeQfic7wdtmLzTwMAI
	 wZ3Kr76mUTwsUhxRHUeYSoLUm3xnPwSwICDQmlJB0Vrf87fnuM2aub+uXf/jj/8TME
	 xuNr+Toh44plbtcmBGQS1H2Ko2y/nfiP955FIEAfcLcIa9VmhujO/iKl+/2gAZWwgo
	 t4yiAI45WX4+g==
Date: Mon, 7 Apr 2025 19:47:36 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>,
	open list <linux-kernel@vger.kernel.org>,
	clang-built-linux <llvm@lists.linux.dev>,
	Linux Regressions <regressions@lists.linux.dev>,
	lkft-triage@lists.linaro.org, Nathan Chancellor <nathan@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Anders Roxell <anders.roxell@linaro.org>, dwmw@amazon.co.uk,
	"H. Peter Anvin" <hpa@zytor.com>, Kees Cook <keescook@chromium.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: next-20250407: qemu_x86_64 clang-20, clang-nightly no console
 log but gcc-13 boot pass
Message-ID: <Z_QPuPmtrFOnhjeP@gmail.com>
References: <CA+G9fYt4VVa3kUDR+ze05xM+fRmMBVfbBTsypUq5oOpAfuzjfg@mail.gmail.com>
 <CA+G9fYtNcnAEVs70eH2yP5UxRBsfrN2B1nKNcggGQ7FNMAJMmg@mail.gmail.com>
 <CAMj1kXH+z4zAhxMucg5NeaOpfp2p69=sqL78JiwvEsWNjFaJOQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXH+z4zAhxMucg5NeaOpfp2p69=sqL78JiwvEsWNjFaJOQ@mail.gmail.com>


* Ard Biesheuvel <ardb@kernel.org> wrote:

> On Mon, 7 Apr 2025 at 18:17, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> >
> > On Mon, 7 Apr 2025 at 17:15, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> > >
> > > Regressions on qemu-x86_64 with clang-20 and clang-nightly on the
> > > Linux next-20250407 and no console output.
> > >
> > > The gcc-13 builds boot pass on qemu-x86_64.
> > >
> > > First seen on the next-20250407.
> > > Bad: next-20250407
> > > Good:next-20250404
> > >
> > > * qemu-x86_64, boot
> > >  - boot/clang-20-lkftconfig
> > >  - boot/clang-20-lkftconfig-compat
> > >  - boot/clang-nightly-lkftconfig
> > >
> > > Regression Analysis:
> > > - New regression? Yes
> > > - Reproducibility? Yes
> > >
> > > Boot regression: qemu_x86_64 clang-20, clang-nightly no console log
> > > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> >
> > Anders bisected this and found,
> > # first bad commit:
> >    [cc34e658c6db493c1524077e95b42d478de58f2b]
> >    x86/boot: Move the early GDT/IDT setup code into startup/
> >
> > Lore report link,
> >  - https://lore.kernel.org/all/CA+G9fYt4VVa3kUDR+ze05xM+fRmMBVfbBTsypUq5oOpAfuzjfg@mail.gmail.com/
> >
> 
> Thanks for the report. I'll look into this.

I've zapped cc34e658c6db from tip:x86/boot for the time being.

I have the same request as for the other patches applies, please split 
it up into ~3 patches for better bisectability and ease of review:

 - first the mechanic movement of code, with very few changes (if the 
   result builds & boots),

 - then drop the RIP_REL_REF() uses in the second patch,

 - and drop __head annotations in the third patch.

Thanks,

	Ingo
