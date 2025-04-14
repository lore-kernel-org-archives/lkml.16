Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9353288CA3;
	Mon, 14 Apr 2025 16:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744647501; cv=none; b=CQ1cTdhYeRkPRT0zX2AAj2bRTNRcWOcACgUbNq53XWnqr//03djnEfGZZ4Q5UrkHGQ/zJ1B7PqE2whl9oQhC1wQh4KCfzy6RXknZXVC3AiEAP89cfn4dAIttn5jE2p8zszlAAsyb15KUGt9x9ToafomdHUlqadV0HOvvI13Z+pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744647501; c=relaxed/simple;
	bh=8VX3HCV2FtYHKbjmNiMwOuVyLdzJo4RYGuFeI3jbRgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cxzl39XBBeKapHAj+4H+syCWr7V16us1hLcME2kPcR7ui4H2U/Qs68lieUuYN3sKt17TQ9dKqQW+/16n8ojANZH/exNS206UbsVC0fucQyfBjsZe+Ao7ZMlySocurpLPLOIxIRVZmbnmGatd2OLuaQpB9f0FGK48l9nT58GoeYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZMXOeUoa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZMXOeUoa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63651C4CEE2;
	Mon, 14 Apr 2025 16:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744647501;
	bh=8VX3HCV2FtYHKbjmNiMwOuVyLdzJo4RYGuFeI3jbRgM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZMXOeUoakjExN34Vb8t2Y/bYfvz4LzOvBFoGZTbAvms59fjrXvnR70kcyZpTnLioZ
	 lbQvvDR/xfYLitn3vJTbC6G/l9wlLiT3N2+T+x2rg26PZO6Q7sWlQ/UhCjxBLOYaOr
	 vITHhgpi446zPMzTc7zpFfQh3kRUd12RLiTPDnS0EaXFAtQTU0a/wEwpEm/2Eygx5B
	 hYcB+vyh2EImGrysIkkCy0DLLP0vUa4PZdE0KOsp2fDVNmPvyKmctV7DSKn5x2v4av
	 yCCTmxXwyDrg41seZJRXw42g/AG/2pt1UCSwCIeA8CEvZntFpXGzL+Lq+AT6UsDdOl
	 xKm0Da1eznxlw==
Date: Mon, 14 Apr 2025 09:18:16 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: clang-built-linux <llvm@lists.linux.dev>, lkft-triage@lists.linaro.org,
	Linux Regressions <regressions@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Anders Roxell <anders.roxell@linaro.org>
Subject: Re: x86_64 clang-20 clang-nightly config lto-full failed - ld.lld:
 error: linking module flags 'Code Model': IDs have conflicting values: 'i32
 1' from vmlinux.a(gdt_idt.o at 1321040), and 'i32 2' from ld-temp.o
Message-ID: <20250414161816.GA33918@ax162>
References: <CA+G9fYvnun+bhYgtt425LWxzOmj+8Jf3ruKeYxQSx-F6U7aisg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYvnun+bhYgtt425LWxzOmj+8Jf3ruKeYxQSx-F6U7aisg@mail.gmail.com>

Hi Naresh,

On Mon, Apr 14, 2025 at 09:37:51PM +0530, Naresh Kamboju wrote:
> Regressions on x86_64 config LTO_CLANG_FULL with korg-clang-20 and
> clang-nightly on the
> Linux next-20250407 and found again on next-20250414 tag
> 
> First seen on the next-20250407.
> Bad: next-20250407 and next-20250414
> Good:next-20250404
> 
> * x86_64, Build
>  - Build/korg-clang-20-lkftconfig-lto-full
>  - Build/clang-nightly-lkftconfig-lto-full
> 
> Regression Analysis:
> - New regression? Yes
> - Reproducibility? Yes
> 
> Build regression: x86_64 clang-20 clang-nightly config lto-full failed
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 
> ## Build log
> ld.lld: error: linking module flags 'Code Model': IDs have conflicting
> values: 'i32 1'
>     from vmlinux.a(gdt_idt.o at 1321040), and 'i32 2' from ld-temp.o

Thanks for the report, I will be sending a patch to fix this today.

Cheers,
Nathan
