Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092449450;
	Thu,  3 Apr 2025 01:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743643136; cv=none; b=WMqOGAhipysDblHf13fbvtU9sHNtcLV2mRru2RBOXK7eFQ4BrXjsABh4XtNW9iSJKnj7yS7ewjVlYA45RIPY82c3dmuhuzF074K8Pi3fXhWmHYAqIqy41y+RXkcrKXi7BNOPgR+A4+ksGUil8RdjShAHGoUy0DV+yTUVz3JYLi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743643136; c=relaxed/simple;
	bh=+wbkhxA7fgD+jDjAsUlqMd94lyd4waCkfNu2fzgAVx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o4fCGseuUmrIhcbp2fWypH6CRdGhoyNLb3bAKmxupTv42cXgObnNzOdOht1hom0D0J4WUPjPFuQwpvNRyi1t1F4pGDvc8hQZAfhUyEIAaOpnl0/5HwO/1U1hN4993WLfLtDHH4mrjjw0RA0aiTK5dV6Q5dumwNibLbhbtFYQj3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GQZYXtlS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GQZYXtlS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69DE0C4CEDD;
	Thu,  3 Apr 2025 01:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743643134;
	bh=+wbkhxA7fgD+jDjAsUlqMd94lyd4waCkfNu2fzgAVx8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GQZYXtlS1kTONy4KCRgddTQItMECmZ40kJOUa9mZxQD3DJoX6fnX57B7zBNBglio1
	 f2+8n2S/bZY2oIFq4Gd6nfsjqp46LwIpmT5HGCZV0qBfMuXHtC62jkFiibVkZoxL++
	 FiLNfg2aU/q2S3AL4WRCjRdrR/eV1qg8QIpjwTE5Jtw/tE79aTvHkKqxrSjtRAF7Co
	 n1Q1uWRp8Qr3livcCEB9vxE1AWrjGSTHkItxWr3oDj1i6gFY/yrl5hDp1whcEV04Vq
	 UT9sccF/J1Gdih52OAy6PM1mu1PFNzh6t8GW4SeS0LDE6V4xHyYDPzILW2M+sd4F9K
	 omLDifo9MEbKw==
Date: Wed, 2 Apr 2025 18:18:49 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: open list <linux-kernel@vger.kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	lkft-triage@lists.linaro.org,
	Linux Regressions <regressions@lists.linux.dev>,
	clang-built-linux <llvm@lists.linux.dev>,
	Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Anders Roxell <anders.roxell@linaro.org>
Subject: Re: v6.14-12245-g91e5bfe317d8: Boot regression: rk3399-rock-pi-4b
 dragonboard-410c dragonboard-845c no console output
Message-ID: <20250403011849.GA3138383@ax162>
References: <CA+G9fYve7+nXJNoV48TksXoMeVjgJuP8Gs=+1br+Qur1DPWV4A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYve7+nXJNoV48TksXoMeVjgJuP8Gs=+1br+Qur1DPWV4A@mail.gmail.com>

Hi Naresh,

On Wed, Apr 02, 2025 at 06:19:19PM +0530, Naresh Kamboju wrote:
> Regressions on rk3399-rock-pi-4b, dragonboard-410c and dragonboard-845c
> the lto-thing, hardening and lto-full config boot failed with toolchain
> clang-nightly on the mainline master branch with no console output.
> 
> First seen on the v6.14-12245-g91e5bfe317d8
>  Good: v6.14-11270-g08733088b566
>  Bad: v6.14-12245-g91e5bfe317d8
> 
> Regressions found on rk3399-rock-pi-4b:
>   - boot/clang-nightly-lkftconfig-kselftest
>   - boot/clang-nightly-lkftconfig-lto-thing
>   - boot/clang-nightly-lkftconfig-hardening
>   - boot/clang-nightly-lkftconfig-lto-full
> 
> Regressions found on dragonboard-410c:
>   - boot/clang-nightly-lkftconfig-lto-thing
>   - boot/clang-nightly-lkftconfig-lto-full
>   - boot/clang-nightly-lkftconfig-hardening
> 
> Regressions found on dragonboard-845c:
>   - boot/clang-nightly-lkftconfig-hardening
>   - boot/clang-nightly-lkftconfig-lto-thing
> 
> Regression Analysis:
>  - New regression? Yes
>  - Reproducibility? Yes
> 
> Boot regression: rk3399-rock-pi-4b dragonboard-410c dragonboard-845c
> no console output
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 
> ## Boot log
> Starting kernel
> ...
> <No console output>
> 
> 
> ## Source
> * Kernel version: 6.14.0
> * Git tree: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> * Git sha: 91e5bfe317d8f8471fbaa3e70cf66cae1314a516
> * Git describe: v6.14-12245-g91e5bfe317d8
> * Project details:
> https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.14-12245-g91e5bfe317d8/
> * Architectures: arm64 (rk3399-rock-pi-4b, dragonboard-410c, dragonboard-845c)
> * Toolchains: clang-nightly (Debian clang version 21.0.0 )

The version string for the toolchain seems to be slightly truncated but
from the configuration it is:

  Debian clang version 21.0.0 (++20250330105456+3b3d1a5c2614-1~exp1~20250330225508.1357)

which can be parsed with our parse-debian-clang.py [1] to get more
information:

  $ scripts/parse-debian-clang.py -p -v 'Debian clang version 21.0.0 (++20250330105456+3b3d1a5c2614-1~exp1~20250330225508.1357)'
  clang checkout date: 2025-03-30 10:54 UTC (3 days, 14:17:24.134272 ago)
  clang revision: 3b3d1a5c2614
  clang revision link: https://github.com/llvm/llvm-project/commit/3b3d1a5c2614

Our CI is using a slightly newer version:

  $ scripts/parse-debian-clang.py -p -v 'Debian clang version 21.0.0 (++20250401112529+290d7b82cb5d-1~exp1~20250401112547.1360)'
  clang checkout date: 2025-04-01 11:25 UTC (1 day, 13:49:39.394836 ago)
  clang revision: 290d7b82cb5d
  clang revision link: https://github.com/llvm/llvm-project/commit/290d7b82cb5d

Can you see if it is reproducible with that revision? For what it's
worth, both of the arm64 boxes I have can boot a ThinLTO kernel compiled
with a version of LLVM @ 749535ba2808e133682074f712ac6829335f8875, so it
could be something that was broken for a little bit but Debian happened
to sync before the fix was committed.

[1]: https://github.com/ClangBuiltLinux/continuous-integration2/blob/fe4844afc1be91d469fc162c8a179f23fafb9384/scripts/parse-debian-clang.py

Cheers,
Nathan
