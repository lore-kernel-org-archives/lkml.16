Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038032376F2;
	Wed,  2 Apr 2025 11:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743593252; cv=none; b=AsNoPA7m9jSgRUGi4FjW8oyfbdaBTgBjWARSEyxLk7dGmdSzddLfowduyFalK1d30BkYP5BoVJzxzy243GcVQN6yvWmx6DHm+fDpbd4753p2gEqYcJrj/euVxBSqEBcfV4uVeC2dlQwIpA7RNm+nWlH47enbbolRdCFYeJZWJaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743593252; c=relaxed/simple;
	bh=iEoq3UvTqn/5QK8ZcHJXTxGcN+fBGRghIFseAgrMVyg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mrQEz8pBboZoLlwmyK1XsxDd3bECcYKog8vFDqZqOI8tP9NNphq71Od/ebK0/SwLuUQ0Ar64w8nXf5VYRuigqUwp/+sRnNLniQRxVxU3ldkqrLsJpMsMUHic+LCgraiO6XGnjl8rjU7L2L3YsFv6GDAYdm/U5BWEzsUmHUoW79w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=cd3AEkyr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cd3AEkyr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB6B1C4CEDD;
	Wed,  2 Apr 2025 11:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743593251;
	bh=iEoq3UvTqn/5QK8ZcHJXTxGcN+fBGRghIFseAgrMVyg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cd3AEkyr040b+TETjzuMWBd/5Bw3uF2EgUsp2fm3UCeTffYTNz/vYO5IaEZlp6EuX
	 CGbTz1/hpG3Y0hgJDcxDmqjXHnRG9bKCbCD8eTiaeQxDFW3Gzw4ZgWQgFTbaurpTXd
	 6Ag18G7ZXJmcNDN10vQvD8OQxoNaJ4qeh2oFqu8U=
Date: Wed, 2 Apr 2025 12:26:03 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: open list <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>,
	linux-mm <linux-mm@kvack.org>, lkft-triage@lists.linaro.org,
	Linux Regressions <regressions@lists.linux.dev>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Vinod Koul <vkoul@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: qemu-i386 boot failed on mainline master - no console output
Message-ID: <2025040216-directive-unmapped-5301@gregkh>
References: <CA+G9fYtdXHVuirs3v6at3UoKNH5keuq0tpcvpz0tJFT4toLG4g@mail.gmail.com>
 <CA+G9fYuHhz2YCafabKK+QMJiDuM65OcxpaW9TN-=u56r_kyGSA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYuHhz2YCafabKK+QMJiDuM65OcxpaW9TN-=u56r_kyGSA@mail.gmail.com>

On Wed, Apr 02, 2025 at 02:24:53PM +0530, Naresh Kamboju wrote:
> + Linus
> + Greg KH
> 
> On Wed, 2 Apr 2025 at 14:14, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> >
> > Regressions on qemu-i386 devices boot tests failed with defconfig on
> > the mainline master no console output.
> >
> 
> The qemu-i386 boot failed with no console output and is still happening on
> the latest mainline master branch.
> 
> > First seen on the char-misc-6.15-rc1 merge 25601e85441d ("Merge tag
> > 'char-misc-6.15-rc1' of...)
> >  Good: [08733088b566b58283f0f12fb73f5db6a9a9de30] Merge tag
> > 'rust-fixes-6.15-merge'
> >  Bad:  [91e5bfe317d8f8471fbaa3e70cf66cae1314a516] Merge tag 'dmaengine-6.15-rc1'
> >
> > * qemu-i386
> >  - boot
> >
> > Regression Analysis:
> >  - New regression? Yes
> >  - Reproducibility? Yes
> >
> > Test regression: qemu-i386 boot failed on mainline master
> > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> >
> > Anders bisected this to,
> >   # first bad commit:
> >     [eb0ece16027f8223d5dc9aaf90124f70577bd22a]
> >     Merge tag 'mm-stable-2025-03-30-16-52' of
> > git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm

But this is bisected to the mm merge, not the char-misc merge, right?

And is this just on i386?  Nothing arch-specific in the char-misc merge
that I can see, so I would place bets on mm doing something accidentally
on 32bit systems.

thanks,

greg k-h
