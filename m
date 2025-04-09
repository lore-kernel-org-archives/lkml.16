Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B211B0F19
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 21:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744234451; cv=none; b=AMAlBieuD5JhA+c6n2619mFTbhGDFo2aGfg4cfyF5p2V8cyfu6iKC2BNh/iCJQSV/AnaG/g+/DQw9VYrgQDbh6fKvTZd4o9IHQ1NlbosQrMrq80IhyKGFogNsZHjlIi9Rd+h42SxwlFtR2psY7O06PcSNknnmHWLqXPlH1yf2Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744234451; c=relaxed/simple;
	bh=a48WLQkkP4gWo/eLBpfCmDza6nZ39Kc1DDQYC5pcMAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J/gOpor2NnW8sQJYQLd6+0dCKks1Y4YdjDqijOYa6g1vNFKrtyZcnI5BV0yc4Ih2ZbzafVL3RTUfpDns26qcu22jpSI9KGuzdQJz3+X0v6J5ZRZLEiC4/Xr6w0flObM3oQrZigm4Eh8SzpDhzpE50WMoVLmF2wgT+qpAFDknb/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nufb9xb9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nufb9xb9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA986C4CEE2;
	Wed,  9 Apr 2025 21:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744234450;
	bh=a48WLQkkP4gWo/eLBpfCmDza6nZ39Kc1DDQYC5pcMAg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nufb9xb9hRrg4Y4JrZG03t9mCjGEsDxSMzfT4DyDqc41mI5iHEWFp12mICAsO9s8A
	 d+4v0ZQgYN81AyalzmB/+s0s/czMQpYOnWWyzm3x2c4KPLhkwRvofjP7VZHW1P0fNq
	 J2b1Ix2NGLnF2PD4zkPRyvqYIIqNE3jHH60J7z4b1uGnuYDLWTcYP8UpYwJDTMaC9F
	 XqqBQq+zBwyDsygR0jioHQUbHD85XyBBZHerC5K+fRobaXlj7nw+94qbSclL54Ppd7
	 Z1z+fr9iwNFExIhczcFdOP7x4iebNYx49syYV/OVHuvMtlfmuAhJDv8kA8nYACy3HU
	 Zx4GYNvheJtOA==
Date: Wed, 9 Apr 2025 23:34:06 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org,
	linux-kernel@vger.kernel.org, hpa@zytor.com
Subject: Re: [PATCH] x86/Kconfig: Fix dependency for X86_DEBUG_FPU
Message-ID: <Z_bnzs3IPyhVIYaT@gmail.com>
References: <20250407231057.328010-1-skhan@linuxfoundation.org>
 <Z_TIMh7UsWQiSkqg@gmail.com>
 <f9642a9f-27d4-4f84-818c-390194b898bf@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f9642a9f-27d4-4f84-818c-390194b898bf@linuxfoundation.org>


* Shuah Khan <skhan@linuxfoundation.org> wrote:

> On 4/8/25 00:54, Ingo Molnar wrote:
> > 
> > * Shuah Khan <skhan@linuxfoundation.org> wrote:
> > 
> > > Compile fails when X86_DEBUG_FPU is enabled and X86_REQUIRED_FEATURE_FPU is
> > > disabled. Add explicit dependency on X86_REQUIRED_FEATURE_FPU to fix it.
> > > 
> > > ../arch/x86/kernel/fpu/regset.c:411:(.text+0x4cf2f): undefined reference to `fpregs_soft_get'
> > > ld: vmlinux.o: in function `fpregs_set':
> > > ../arch/x86/kernel/fpu/regset.c:445:(.text+0x4d0da): undefined reference to `fpregs_soft_set'
> > > ld: vmlinux.o: in function `copy_fpstate_to_sigframe':
> > > ../arch/x86/kernel/fpu/signal.c:197:(.text+0x4da98): undefined reference to `fpregs_soft_get'
> > > 
> > 
> > So I cannot reproduce this build failure on either v6.14 or v6.15-rc1:
> > 
> >    starship:~/tip> git describe
> >    v6.15-rc1
> > 
> >    starship:~/tip> grep -E 'X86_32=|M486SX=|X86_REQUIRED_FEATURE|X86_DEBUG_FPU' .config
> >    CONFIG_X86_32=y
> >    CONFIG_M486SX=y
> >    CONFIG_X86_REQUIRED_FEATURE_ALWAYS=y
> >    CONFIG_X86_DEBUG_FPU=y
> > 
> >    starship:~/tip> make -j128 ARCH=i386 bzImage modules
> > 
> >    ...
> >    Kernel: arch/x86/boot/bzImage is ready  (#5)
> > 
> > > Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
> > > ---
> > > 6.14 compile worked without X86_REQUIRED_FEATURE_FPU enabled. Might be a
> > > new dependency. Enabling X86_REQUIRED_FEATURE_FPU fixed it for me on my
> > > test system.
> > 
> > So vanilla v6.14 does not have X86_REQUIRED_FEATURE Kconfig flags, at
> > all:
> > 
> >    starship:~/tip> grep FPU .config
> >    CONFIG_ARCH_HAS_KERNEL_FPU_SUPPORT=y
> >    CONFIG_X86_DEBUG_FPU=y
> >    # CONFIG_TEST_FPU is not set
> > 
> > Because X86_REQUIRED_FEATURE_FPU is a new v6.15-rc1 feature, introduced
> > via:
> > 
> >    3d37d9396eb3 ("x86/cpufeatures: Add {REQUIRED,DISABLED} feature configs")
> > 
> > I have no doubt you are seeing this build failure - but I think there
> > might be some other .config detail required to reproduce it, not
> > mentioned in your changelog. Could you please send the config you used?
> > 
> 
> Config attached.
> 
> grep _FPU /boot/config-6.14.0+
> CONFIG_ARCH_HAS_KERNEL_FPU_SUPPORT=y
> CONFIG_X86_DEBUG_FPU=y
> # CONFIG_TEST_FPU is not set
> 
> I noticed you are building ARCH=i386 - can you reproduce this
> with x86_64? That is what I am building.
> 
> thanks,
> -- Shuah

> #
> # Automatically generated file; DO NOT EDIT.
> # Linux/x86 6.14.0 Kernel Configuration
> #
> CONFIG_CC_VERSION_TEXT="gcc (Debian 14.2.0-17) 14.2.0"

Is this a vanilla v6.14 kernel? Because on upstream v6.14 'make 
oldconfig' gives me:

  Generate BTF type information (DEBUG_INFO_BTF) [N/y/?] (NEW) 

Maybe different build environment?

... and after answering that with 'N' the build succeeds:

  LD      arch/x86/boot/setup.elf
  OBJCOPY arch/x86/boot/setup.bin
  BUILD   arch/x86/boot/bzImage
Kernel: arch/x86/boot/bzImage is ready  (#3)

More importantly, X86_REQUIRED_FEATURE_FPU *does not exist* in the 
vanilla v6.14 kernel, it's a new v6.15 feature. So this part of your 
changelog totally doesn't apply to a v6.14 kernel:

> > > Compile fails when X86_DEBUG_FPU is enabled and X86_REQUIRED_FEATURE_FPU is
> > > disabled. Add explicit dependency on X86_REQUIRED_FEATURE_FPU to fix it.

Thanks,

	Ingo
