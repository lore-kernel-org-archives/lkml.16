Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C00C1E4BE
	for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 11:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749986588; cv=none; b=F4XQWhEHYTd4kbj1ITS+M7JCr3rIMGFlgmfTfr0Sd2gsFfsHy2LHrODx2UyudSGTtrDQTojZ3dSLDGV3JLLk0hK7MVIUD7HVPe60/vuHvUH3v1YWa/58StCcDLDKBzSjAwHy1nn+S2reX7q83e0CHtrSwtbttTKVtV+IjTpsxHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749986588; c=relaxed/simple;
	bh=2lsLuXXzT/VxisJpUumd3IrwHE/meyYx5ds0bScIBUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T86/WGWBvwEm1cev/WzoPiQjTaDExDUo/hf2xR4/lUC7rqTB5EHa4nkjjbm0SoVZ+t1/+ZDuDqpNJoIaaGngbrV07U2jhkc7KwGg0kQ5nJaTLLMVuX0EuKrgW+zYLW7MKs7AjVbvhJAxmNl18fIGb+oEDDkdeOmakHjXbvZsFV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=irImKwL/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="irImKwL/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4471C4CEEE;
	Sun, 15 Jun 2025 11:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749986587;
	bh=2lsLuXXzT/VxisJpUumd3IrwHE/meyYx5ds0bScIBUo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=irImKwL/NwAQSW4aAlUGJU8F0oE9/hEugvxAWFsrF7+7JVFopTf2C1FXXudTcAnD5
	 vESFdp2q7maxuIG48U9f/40me6f/Z58tzzzwi5dXB53bK3luv9kNEQOgplrPYwWRwW
	 LqscRIcuJsiiPX3ZtuO6xMMICRAQeJbW+xwyjwPTSJ2Pmg7K5Mxq7M8iIgPRYLk0i9
	 EhetBEDVxYuT1K/BANvJxwoLxZ7nw5lklYdPA9NHwn3LP46n6UUAwhQXCFZzO0cEjZ
	 WsPE3nMyyI247GKnMjmtYOujBiGdV78nD3qpcxq8YcjHkmEEi7c5UhMBCXkSYQNzzY
	 2ZUrz7uTxQTFQ==
Date: Sun, 15 Jun 2025 13:23:02 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	=?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Michal Marek <michal.lkml@markovi.net>,
	Rik van Riel <riel@surriel.com>
Subject: Re: [PATCH 09/13] x86/kconfig/64: Enable popular MM options in the
 defconfig
Message-ID: <aE6tFoBkF3tl9aeH@gmail.com>
References: <20250515132719.31868-1-mingo@kernel.org>
 <20250515132719.31868-10-mingo@kernel.org>
 <CAHk-=winzTt3SCzv8BWGMm0fzrXS0gb59gK0h4dAe0L6hj3X_w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=winzTt3SCzv8BWGMm0fzrXS0gb59gK0h4dAe0L6hj3X_w@mail.gmail.com>


* Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Thu, 15 May 2025 at 06:28, Ingo Molnar <mingo@kernel.org> wrote:
> >
> > Since the x86 defconfig aims to be a distro kernel work-alike with
> > fewer drivers and a shorter build time, enable the following
> > MM options that are typically enabled on major Linux distributions:
> 
> Ingo, PLEASE STOP.
> 
> This whole "enable random crap that distros enable" is completely 
> pointless.
> 
> If you want a distro config, then USE the distro config, for 
> chrissake!
> 
> The defconfig should be some sane configuration for NORMAL :PEOPLE.
> 
> Not for cloud providers - get rid of the stipid cloud virt stuff.
> 
> Not for distros - get rid of the silly "distros enable this".
> 
> For NORMAL people. People who don't know what they should do without 
> a default config. People who just have a random machine that they 
> want to run Linux on and need an initial config for.
>
> This whole "enable random things just because a distro has bad taste 
> and enables them" is BROKEN.

Okay, first off, no arguments from me about the way forward - I've just 
nuked the following commits:

  011f3ac16949 ("x86/kconfig/64: Enable the KVM host in the defconfig")
  e76fe3432a2e ("x86/kconfig/64: Enable more virtualization guest options in the defconfig: Enable Xen, Xen_PVH, Jailhouse, ACRN, Intel TDX and Hyper-V")
  1093fbcf57ad ("x86/kconfig/64: Enable BPF support in the defconfig")
  4e96a8b1eb76 ("x86/kconfig/64: Enable popular MM options in the defconfig")
  53bc35f2d937 ("x86/kconfig/64: Enable popular kernel debugging options in the defconfig")
  c0fa33249920 ("x86/kconfig/64: Enable popular scheduler, cgroups and namespaces options in the defconfig")
  475cf81e4fda ("x86/kconfig/64: Enable popular generic kernel options in the defconfig")
  9e3d5f041005 ("x86/kconfig/32: Synchronize the x86-32 defconfig to the x86-64 defconfig")
  c86ec5635d07 ("x86/kconfig: Remove the CONFIG_DRM_I915=y driver from the defconfig")
  7ce421edd9fc ("x86/kconfig/defconfig: Enable CONFIG_DRM_FBDEV_EMULATION=y")

Which is almost all of this series. These commits are not coming back. 
Clearly my approach of using the lowest common denominator of distro 
kernel configs is not appreciated and I have no desire whatsoever to 
fight such pushback.

As a background as to what I was trying to do with this series:

1) Why more hypervisor guest driver enablement? Firstly, a significant 
   percentage of x86 patch contributions come from CPU vendors, cloud 
   vendors and Linux distributions, so I thought it useful to make it 
   easier for all of them to test their changes on their own 
   environments out of the box - and for them to be better aware of any 
   interactions between their environments. Yes, they can each 
   individually enable their own options, but that's not what end users 
   end up using. I didn't think this (or frankly *any*) aspect of the 
   series was particularly controversial, as we already enable support 
   for obscure machine variants in the x86 defconfig:

        CONFIG_CPU_SUP_HYGON=y
        CONFIG_CPU_SUP_CENTAUR=y 
        CONFIG_CPU_SUP_ZHAOXIN=y

   And had a bunch of virtualization guest options enabled in the 
   defconfig as well (before this series):

	starship:~/tip> make defconfig; grep -E 'KVM|VIRT|GUEST|HYPER' .config | grep =y

	CONFIG_HYPERVISOR_GUEST=y
	CONFIG_PARAVIRT=y
	CONFIG_KVM_GUEST=y
	CONFIG_PARAVIRT_CLOCK=y
	CONFIG_VIRTUALIZATION=y
	CONFIG_NET_9P_VIRTIO=y
	CONFIG_VIRTIO_BLK=y
	CONFIG_SCSI_VIRTIO=y
	CONFIG_VIRTIO_NET=y
	CONFIG_VIRTIO_CONSOLE=y
	CONFIG_PTP_1588_CLOCK_KVM=y
	CONFIG_DRM_VIRTIO_GPU=y
	CONFIG_DRM_VIRTIO_GPU_KMS=y
	CONFIG_DMA_VIRTUAL_CHANNELS=y
	CONFIG_VIRTIO_ANCHOR=y
	CONFIG_VIRTIO=y
	CONFIG_VIRTIO_PCI_LIB=y
	CONFIG_VIRTIO_PCI_LIB_LEGACY=y
	CONFIG_VIRTIO_MENU=y
	CONFIG_VIRTIO_PCI=y
	CONFIG_VIRTIO_PCI_ADMIN_LEGACY=y
	CONFIG_VIRTIO_PCI_LEGACY=y
	CONFIG_VIRTIO_INPUT=y
	CONFIG_VIRTIO_DMA_SHARED_BUFFER=y

   Why not make the defconfig work out of the box for the testing 
   environments of a broader group of our actual contributors, as long 
   as the build cost isn't overly high?

   Secondly, even outside of cloud vendors, many kernel developers use 
   some sort of simple virtual environment to test their patches, but 
   our defconfig often doesn't boot & work, while distro kernels mostly 
   work but take a lot of time to build.

   defconfigs are useful if they work, as the difference between a ~30 
   seconds defconfig build and a ~4 minutes distro config build is 
   enormous to test-iteration speed:

     defconfig:                      34.67 seconds time elapsed
     distro config+localmodconfig:   58.07 seconds time elapsed
     allmodconfig+localmodconfig:    90.36 seconds time elapsed
     distro config:                 227.86 seconds time elapsed
     allmodconfig:                  317.60 seconds time elapsed

   And that's on my very fast desktop.

   Even 'make distro-config+localmodconfig', where a tester manually 
   uses a distro config and disables all modules not loaded at the 
   moment, is 2x slower to build in practice. Full distro kernels are 
   6.5x slower to build, allmodconfig kernels 9x slower to build - no 
   surprises there.

   In fact on a typical modern desktop that our developers and testers 
   are using, I'd estimate build times to be more along the lines of:

     defconfig:                      ~60 seconds time elapsed
     distro config+localmodconfig:  ~120 seconds time elapsed
     allmodconfig+localmodconfig:   ~180 seconds time elapsed
     distro config:                 ~440 seconds time elapsed
     allmodconfig:                  ~640 seconds time elapsed

   Third, and building upon the previous point, bisecting a bug that 
   triggers in a distro kernel is a *very* time-consuming process in 
   part due to the very long build times, and very few testers end up 
   being able to (or willing to) do that when they report bugs.

   So, at least on x86, over the years the defconfig has morphed into a 
   kind of lowest common denominator config that is fast to build but 
   which is still mostly relevant to our users. (and obviously it 
   shouldn't enable anything crazy, and any crazy in this series is my 
   fault alone.) The defconfig kernel's code generation quality gets 
   checked, and it gets tested first and can be used for longer 
   bisections.

   After this series, the following build method is actually expected 
   to boot and work on a wide(r) range of x86 systems, physical and 
   virtual systems included, and result in a kernel close to what 
   distro kernels are doing in the field:

     $ make defconfig localyesconfig

   ... and which is still very fast to build:

      34.11 seconds time elapsed

   So this series attempted to broaden the x86 defconfig to more of 
   what our developers and users are using in practice, while staying 
   within the bounds of what our Kconfig space allows and recommends. 
   (And any deviation from that principle is my fault.)


2) The other motivation for this series was that the reality is that 
   99.9% of Linux users use a distro kernel, and our defconfig became 
   rather detached from that reality.

   I've noticed that we Linux kernel developers are in a kind of 
   isolated microcosm with homebrewn configs that have random kernel 
   options enabled/disabled, with the occasional strong opinions about 
   some of those options, and we are often totally unaware of the 
   actual runtime overhead and code generation realities in distro 
   kernels, that 99.9% of our users use every single day... This is a 
   suboptimal social dynamic and indicates a broken development 
   feedback loop IMHO.

   Let's take CONFIG_KSM as an example, which PeterZ says sucks 
   security wise. Yet it's enabled in literally *every* single Linux 
   distribution out there that I managed to check:

     .config.distro.debian.x86_32:        CONFIG_KSM=y
     .config.distro.opensuse.default:     CONFIG_KSM=y
     .config.distro.fedora.generic:       CONFIG_KSM=y
     .config.distro.rhel.generic:         CONFIG_KSM=y
     .config.distro.ubuntu:               CONFIG_KSM=y

   If CONFIG_KSM, which feature was merged upstream 15+ years ago, is 
   indeed unsafe and/or stupid, why is it still in the upstream kernel 
   to begin with? We are effectively denying reality by pretending that 
   it doesn't exist, while 99.9% of our users are using it...

   The Kconfig help text for CONFIG_KSM is ... what appears to be 
   unhelpful and misleading:

     config KSM
        bool "Enable KSM for page merging"
        depends on MMU
        select XXHASH
        help
          Enable Kernel Samepage Merging: KSM periodically scans those areas
          of an application's address space that an app has advised may be
          mergeable.  When it finds pages of identical content, it replaces
          the many instances by a single page with that content, so
          saving memory until one or another app needs to modify the content.
          Recommended for use with KVM, or with other duplicative applications.
          See Documentation/mm/ksm.rst for more information: KSM is inactive
          until a program has madvised that an area is MADV_MERGEABLE, and
          root has set /sys/kernel/mm/ksm/run to 1 (if CONFIG_SYSFS is set).

   It doesn't say that it's unsafe. In fact the upstream kernel's 
   official help text says that this feature is:

     "Recommended for use with KVM, or with other duplicative applications."

   ... which by its plain reading makes it sound useful to testers and 
   distros, with no tradeoffs mentioned whatsoever. Why wouldn't 
   testers and distros enable it?

   That a 'stupid' or 'broken' kernel option is default-disabled in 
   practice has almost no relevance and doesn't help in filtering good 
   kernel options from bad ones: almost all new kernel options, even 
   useful ones we'd like distros to disable, are default-disabled, and 
   stay so even if all distributions end up enabling it.

   Ie. the development feedback loop is somewhat broken in these cases, 
   because by offering a .config feature the upstream kernel tacitly 
   acknowledges distros enabling options that key upstream developers 
   consider 'stupid' or 'broken'.

TL;DR: in this specific example I'm advocating for one of four 
outcomes:

  - Fix CONFIG_KSM if it can be fixed,
  - ... or remove CONFIG_KSM if it's unsafe and cannot be fixed,
  - ... or explain why it's safe and can be enabled,
  - ... or at least *document* that it's unsafe/stupid, so that distros 
        don't end up enabling it ...

Because the status quo of kernel developers often ignoring what 99.9% 
of our users are running and summarily declaring that distro kernels 
enable "stupid" configs while our Kconfig help text describes nothing 
of the sort kinda sucks and is a double standard at best, isn't it?

Thanks,

	Ingo
