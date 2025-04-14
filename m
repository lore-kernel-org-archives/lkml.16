Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE1214B945;
	Mon, 14 Apr 2025 15:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744643776; cv=none; b=p4OgFQ6Zz6Bpdtk7W5FvAbcHAOIvbBGWWnlkfDysurEJAFM7B+hXC1mdZlRBBEUdCk++IejNoKx5GYUMmoTwZ80ohz6McX1b+ACF65D350N2IsQkm7oRW2M8fwl8GeIa3cWnXtYP5eWrK0N/bX16/Kwf346IgH82OLIiJIAoQSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744643776; c=relaxed/simple;
	bh=2JnxNddfe/pVkB/0v3Ww6eFjFY9ZReYEQsNtziLaUh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fGgCglAKAnUgCJON4iuUjtPeotlcV3CIm7n0YMNKAkG5SUBIXuh5e0z0wT4YHPJgBBzWT42Z5L/4jg/FsojwlKATjiMWhVIsT4/xsMq+xLCrtgsD6WRbvi1Nl9DVO33dFDCAP6WK+kxZSvLsesdfMicmrRh4v0Gkt7OwGPj9+/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KsxYw4Js; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KsxYw4Js"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65286C4CEE2;
	Mon, 14 Apr 2025 15:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744643775;
	bh=2JnxNddfe/pVkB/0v3Ww6eFjFY9ZReYEQsNtziLaUh0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KsxYw4Js4qII1IRFfsfOdiQ/DadmdIB+Jw6+KpEKCQiAy5OCnt1IQ4Bk05NkVZiZ9
	 6JEIv4+ZSOEBefIIyvIo06fu4OWGgKBOpuD7aXzS53xZ0+pK14Mgz4CvSpV9TaIOfJ
	 1pVDQ1GeXuMqHkhOLDXZ7etUXhHm7oVJzcCwxnLhFnDXsHBsYpYVPCRHmVc9jnYRy6
	 cCBl362r2mIK2QEgaf1mJNO7dLxzaoDZDHbONHHTdkpXJWMQR+V2/tj65jmo7L1eM1
	 z1hNw2mgOTUom/aG4ec8BnKwFMIqToVl0LvzeSb5Wj8956u/4mA68FI1GvN3GbRv1C
	 OdJqix616dvBg==
Date: Mon, 14 Apr 2025 08:16:11 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Aleksandr Nogikh <nogikh@google.com>
Cc: llvm@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>,
	syzkaller <syzkaller@googlegroups.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Alexander Potapenko <glider@google.com>
Subject: Re: Latest clang versions fail to compile CONFIG_X86_X32_ABI=y
Message-ID: <20250414151611.GA3404099@ax162>
References: <CANp29Y4FmGDXm3LWvW6D+JR8CWf=fvuiAseFb1h2HQSDjFKO2A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANp29Y4FmGDXm3LWvW6D+JR8CWf=fvuiAseFb1h2HQSDjFKO2A@mail.gmail.com>

On Mon, Apr 14, 2025 at 04:11:15PM +0200, Aleksandr Nogikh wrote:
> Hi,
> 
> I've been trying to build a Linux kernel using newer llvm toolchain
> versions (18, 19, 20), but it consistently fails with the following
> errors:
> 
> ld.lld: error: arch/x86/entry/vdso/vgetrandom-x32.o:(.note.gnu.property+0x0):
> data is too short
> ld.lld: error: arch/x86/entry/vdso/vgetcpu-x32.o:(.note.gnu.property+0x0):
> data is too short
> ld.lld: error: arch/x86/entry/vdso/vclock_gettime-x32.o:(.note.gnu.property+0x0):
> data is too short
> 
> The steps to reproduce:
> $ git checkout v6.15-rc2
> $ make defconfig
> $ ./scripts/config -e X86_X32_ABI
> $ make CC=clang LD=ld.lld -j48
> 
> The versions used:
> $ clang --version
> Debian clang version 20.1.2
> (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97)
> $ ld.lld --version
> Debian LLD 20.1.2 (compatible with GNU linkers)
> 
> Is this a known clang/Linux issue?

I am not aware of this but it is likely because as Thomas pointed out,
this invocation is only using clang/the integrated assembler and ld.lld,
not the entire LLVM toolchain, which is generally what we encourage
people to use unless there is a problem with doing so.

> There's a kernel commit that addresses a similar problem:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=aaeed6ecc1253ce1463fa1aca0b70a4ccbc9fa75
> 
> but the error is slightly different there and the added Kconfig
> condition apparently did not kick in.

What version of binutils is being used here ('objcopy --version')? I can
try and look into this and see if the Kconfig checks should be expanded
to include other tools/versions. I highly doubt anyone building with
LLVM would notice lack of x32 support, as I believe only Debian and
Gentoo have support for it and some x86 folks have tried to put it on
the chopping block before.

Cheers,
Nathan
