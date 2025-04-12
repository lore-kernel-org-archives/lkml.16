Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC262367C9;
	Sat, 12 Apr 2025 01:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744422325; cv=none; b=cnudnZBBVs/yHxzw0dSb9onFX8rpjXG4TlAZOvrmVEHmGpPinn2K7+9oqKlCs4BrhH+/z/lhceB/5u9Vl6IoqtsF83B0HoXCBCy2HgBnz8JQqln4Yyh+iViaiDbj3atHHnLE4PeUSAp1CwOmA7o1mDgsE8MJQkb1a0gLhoxobA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744422325; c=relaxed/simple;
	bh=InI5YIvfIbmAEiSsiYv9SXaP67nBUB72BNS5xoI3aAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jI1rEGDh7tC7uxSoVjT+nfgWOZP/voZF+oglokE8NMAy1Ak5wnlYvl2I5z9NbUZ9QiE97KMgg1vLDd7ZccV+TmLVdGIrLtAu7NQYMiDxHEcevHmHuukpMbr0bmETMv7x1gIIsI3y3hDW/+qkaA+OFjOGzvywsh9O+Oj1LJ7ND4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aH+8Ve3a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aH+8Ve3a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E420EC4CEE2;
	Sat, 12 Apr 2025 01:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744422324;
	bh=InI5YIvfIbmAEiSsiYv9SXaP67nBUB72BNS5xoI3aAk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aH+8Ve3afihmbx2mG3X6H3vD1yYcxfvJMEbeZy3r6GNURDIawp3cGTwMPoLAOMuTg
	 1YT/qJ5wBUGByYhU3Oq2i6i5mv0T5+dKl5WLcOUJWHirosE4yxpJNi7r1Pc+4SGUOs
	 EtX3OnwWfkzlPA2IexZvxSPgrp5xmiZWOOK+fsPFraHP/TsHwfHkgqla/XXpBSeDHh
	 d96HwnBB//WT0ut72I5mXESz76FZmw/PayPGVWaCoGWz3Vm9xUalZisllvVixG6bNX
	 RMh5o5t1sbvg+WgE4+sSWcjgz4KMPFFj80RDBd8BL9+uUbjju+zyz/c0e5VpKb4fRJ
	 3uUQJsWi7bNSg==
Date: Fri, 11 Apr 2025 20:45:19 -0500
From: Nathan Chancellor <nathan@kernel.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: open list <linux-kernel@vger.kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	lkft-triage@lists.linaro.org,
	Linux Regressions <regressions@lists.linux.dev>,
	clang-built-linux <llvm@lists.linux.dev>,
	Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	Kees Cook <keescook@chromium.org>
Subject: Re: v6.14-12245-g91e5bfe317d8: Boot regression: rk3399-rock-pi-4b
 dragonboard-410c dragonboard-845c no console output
Message-ID: <20250412014519.GA1905363@ax162>
References: <CA+G9fYve7+nXJNoV48TksXoMeVjgJuP8Gs=+1br+Qur1DPWV4A@mail.gmail.com>
 <20250403011849.GA3138383@ax162>
 <CA+G9fYtrsLHvMH=ofmdS3MMsMTEj3k0PD7=qsRsA4WkSqLkCzQ@mail.gmail.com>
 <20250405002757.GA836042@ax162>
 <CA+G9fYv=jUunRgUs=ROptP4p5DNxUuUHxYsnWaxUUXbiwdszsA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYv=jUunRgUs=ROptP4p5DNxUuUHxYsnWaxUUXbiwdszsA@mail.gmail.com>

Hi Naresh,

On Fri, Apr 11, 2025 at 12:49:17AM +0530, Naresh Kamboju wrote:
> clang-nightly boot failed with stable-rc 6.12, 6.13 and 6.14 and
> mainline and next on following devices and virtual platforms.
> - dragonboard-410c
> - dragonboard-845c
> - rk3399-rock-pi-4b
> - Juno-r2
> - e850-96
> - FVP (Fast Models Fixed Virtual Platforms)
> 
> Boot Test links,
> - https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.12.y/build/v6.12.23-2-g8e0839d16957/testrun/28076019/suite/boot/test/clang-nightly-lkftconfig-kselftest/history/
> - https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.12.y/build/v6.12.23-2-g8e0839d16957/testrun/28076006/suite/boot/test/clang-nightly-lkftconfig-lto-thing/history/
> -  https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.12.y/build/v6.12.23-2-g8e0839d16957/testrun/28076009/suite/boot/test/clang-nightly-lkftconfig-hardening/history/

Thanks again for confirming. As this is reproducible with the FVP, I was
able to cobble together how to boot it locally with tuxrun and your
configuration (which felt rather convoluted to get from the website
above) and use that to bisect LLVM:

https://github.com/ClangBuiltLinux/linux/issues/2082

I will continue to look into this next week.

Cheers,
Nathan
