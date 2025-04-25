Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A2F22F3BE;
	Fri, 25 Apr 2025 07:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745566852; cv=none; b=AYfQxaLsn108icyKFDpRGyeXpRfN3EdDyaxMzTBrliEqjwrhPaVMfszErp6pPsGgnY5eSfOcCoNsf8cqxORO4xuplBFKLkK9esuBrD+PyZWy59DdlgCIJbHCFmL9n/L29DA279EdVKbdBXMSDK6q130Q/YrdFWm5TVg29+yUFyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745566852; c=relaxed/simple;
	bh=WpQFSnpwNwbZzu1PsGGV0iNBNs0zXtDESG2030ZXknQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JM2H2d8qdO0VOLYF1Sryi4lC4odpE1BxJ2AhU6y86bKD9zA5qpSAjpWnmPFrOypVYOrrZKC34nyjZ54gCGMpklVYJH5IKUwM7d1zNtdfceBwQTmYKV2uJqmRS1gEKiPlUasPgBFH2f8+goNqVIq507skMTpx7lA78RRGOvq5wP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oGkoddQZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oGkoddQZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16F95C4CEEA;
	Fri, 25 Apr 2025 07:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745566851;
	bh=WpQFSnpwNwbZzu1PsGGV0iNBNs0zXtDESG2030ZXknQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oGkoddQZ5ObRjUUJcPqdJRMwI3z3dPMaaU1X/QJiQ7RmWj70x9xFRAWdOMHSk5o8B
	 WlhKmkcmuJisZlPpUQyuNjSur7xMn7tNOGfEHeMx477kg21moTiasUqLagomhrBfZm
	 559Ubi2d/YIJfP34WUpC5oeNZijtq783bUbi5rCc0Wspw+wbILL7j52RiakFag15ta
	 qsaqRKo7Vo5xehl/CSyyFSWt0b7R/JnV2wb+mzKHCXCXvgawjRXos87/Xwi0JFx7CP
	 d0Dmsu7o0F+H3uqLH87Pn+TgfeaI2FtLAtF+y/2wkcdKL1bNZ6DRdvjfh0hsulg7OA
	 X3H3tgJmcA4dw==
Date: Fri, 25 Apr 2025 09:40:46 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
	kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
	John Stultz <jstultz@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Stephen Boyd <sboyd@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: [RFC PATCH 0/15] x86: Remove support for TSC-less and CX8-less
 CPUs
Message-ID: <aAs8fuPmXz7kK1l4@gmail.com>
References: <202504211553.3ba9400-lkp@intel.com>
 <59198081-15e2-4b02-934f-c34dd1a0ac93@app.fastmail.com>
 <aAmeJmL0hUx2kcXC@xsang-OptiPlex-9020>
 <f1ccb8b4-bbe2-42bc-bb86-c2bf3f9c557d@app.fastmail.com>
 <CAHk-=wi6k0wk89u+8vmOhcLHPmapK13DDsL2m+xeqEwR9iTd9A@mail.gmail.com>
 <aAp6u9ylKCpvMJRF@gmail.com>
 <dd29df0c-0b4f-44e6-b71b-2a358ea76fb4@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd29df0c-0b4f-44e6-b71b-2a358ea76fb4@app.fastmail.com>


* Arnd Bergmann <arnd@arndb.de> wrote:

> >       x86/platform: Remove CONFIG_X86_RDC321X support
> >       arch/x86, gpio: Remove GPIO_RDC321X support
> >       arch/x86, watchdog: Remove the RDC321X_WDT watchdog driver
> >       arch/x86, mfd: Remove MFD_RDC321X support
> >       x86/reboot: Remove the RDC321X reboot quirk
> 
> I'm not sure about the RDC321X bits. Obviously the original
> 321x/861x/vortex86sx chips are obsolete and can be removed,
> but the product line is still actively developed by RDC and 
> DM&P, and I suspect that some of the drivers are still used
> on 586tsc-class (vortex86dx, vortex86mx) and 686-class
> (vortex86dx3, vortex86ex) SoCs that do run modern kernels and
> get updates.

So CONFIG_X86_RDC321X actively selects M486:

+++ b/arch/x86/Kconfig
 
 config X86_RDC321X
        bool "RDC R-321x SoC"
        depends on X86_32
        depends on X86_EXTENDED_PLATFORM
        select M486
        ^^^^^^^^^^^
        select X86_REBOOTFIXUPS

But indeed the other drivers are not dependent on M486, at least 
overtly:

  arch/x86, mfd: Remove MFD_RDC321X support
  arch/x86, watchdog: Remove the RDC321X_WDT watchdog driver
  arch/x86, gpio: Remove GPIO_RDC321X support

Although the watchdog driver has this indirect dependency:

   drivers/watchdog/Kconfig:       depends on X86_RDC321X || COMPILE_TEST

But the 486 kernel would work on any 586/686 upgraded boards as well.

Anyway, I've dropped the mfd/watchdog/gpio removal patches, no harm in 
keeping these drivers, and I've switched the watchdog driver over to 
X86_32:

  config RDC321X_WDT
        tristate "RDC R-321x SoC watchdog"
        depends on X86_32 || COMPILE_TEST

There's also no harm in keeping the southbridge reboot quirk I suppose, 
so I've dropped this as well:

  x86/reboot: Remove the RDC321X reboot quirk


> >       x86/cpu: Remove CPU_SUP_UMC_32 support
> >       x86/cpu: Remove TSC-less CONFIG_M586 support
> 
> I think Winchip6 (486-class, no tsc, no cx8) and Winchip3D
> (486-class, with tsc but no cx8) need to go as well then.

Okay, agreed, I've added this patch to the tree:

  bf82539ad9f6 x86/cpu: Remove CONFIG_MWINCHIP3D/MWINCHIPC6

  arch/x86/Kconfig.cpu            | 28 ++++------------------------
  arch/x86/Makefile_32.cpu        |  2 --
  arch/x86/include/asm/vermagic.h |  4 ----
  3 files changed, 4 insertions(+), 30 deletions(-)

> At this point, maybe we can consider removing CONFIG_X86_GENERIC and 
> just always build kernels that work across a wide set of CPUs: Only 
> CMOV and PAE still require a CPU with the hardware support, and 
> X86_L1_CACHE_SHIFT needs to be at least 6 (64 byte) for 
> compatibility, but everything else should just be a tuning option.

Agreed.

Thanks,

	Ingo
