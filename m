Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261A828B7E2
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 16:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746634183; cv=none; b=cOENOC9rIg9MqA00vp8P6nOdTqoCPY2m8z4Yj0WwsN4a9IIVgLanjeMMjVWEHUHEuH9nR67PEg682yVjrR2gxzuXJk0tS6mf6781umw0AOIF7KG1D3KWwzRhpPCRyKWT59hYObRIS6Q2VBkH1WqKfXEo3hbjUz95eDUuC/2ftWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746634183; c=relaxed/simple;
	bh=6wtcYJxCUt/MrHrxSXNitK2VcxZc0XiX8cqaZ2qty20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sVYMV87wPAXIq9P4GJpYRkDjVdQc7DbG5W/JLikGaKLHrowWzREN7NIiPWzEQPBvgHyo6381B/Xt0MiArG6Ps6171pXeP7R6AM4a/n5M/0m7wvHhOZ0EzRcu6C8MXfIPStJ7Y5CGhMAy9M+JJr0cbM4ooB/f64GhTE7xhOUsz2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WxNWfeTw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WxNWfeTw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECB74C4CEEE;
	Wed,  7 May 2025 16:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746634182;
	bh=6wtcYJxCUt/MrHrxSXNitK2VcxZc0XiX8cqaZ2qty20=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WxNWfeTwnp9zM+g+UKmIatJZq6h9aZX9ZjD8Q43joQYSXf5B5aDmgYewz26CBwrHE
	 K1yfXd4uAX7jcEVdS1A/WMR8eduhr+DmeGlcUu9GFYgWXf68lMR9mAQqS4bUsvKwxl
	 zZARoWxiGZIURq8xIInS4GS9u0F1WrkjvKp8sAIjjUIWSyzrkdTuBZy1o9thK0suuk
	 hX2iF9SiLIrrcKhP01CaMGtb33lsfHVF7RD3EULs5ncwczn7FK/Dl9v57HqyrBmv1/
	 pfJn4A+Fi+Au3I1b8A7NVBXaQ2aPDT7XBDHk6pb+EsqMo2DWQYJ1cs/TiRCeOKGDVk
	 ZwOIevU9K7W2Q==
Date: Wed, 7 May 2025 18:09:37 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Michal Marek <michal.lkml@markovi.net>
Subject: Re: [PATCH 13/15] x86/kconfig/64: Enable popular scheduler, cgroups
 and namespaces options in the defconfig
Message-ID: <aBuFwQqQd3wldnHm@gmail.com>
References: <20250506170924.3513161-1-mingo@kernel.org>
 <20250506170924.3513161-14-mingo@kernel.org>
 <e1585615-e8bb-47bf-846c-b0d2696d0c1f@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e1585615-e8bb-47bf-846c-b0d2696d0c1f@app.fastmail.com>


* Arnd Bergmann <arnd@arndb.de> wrote:

> > +CONFIG_SYSFS_SYSCALL=y
> > +CONFIG_EXPERT=y
> >  CONFIG_KALLSYMS_ALL=y
> >  CONFIG_PROFILING=y
> 
> I really don't like enabling CONFIG_EXPERT=y in a generic
> defconfig. What changes if you turn this off?

That's a good question.

Disabling it gives me material changes for 4 options:

	--- .config.before
	+++ .config.after
	-CONFIG_EXPERT=y
	-CONFIG_ARCH_HAS_ZONE_DMA_SET=y
	+CONFIG_RFKILL_INPUT=y
	-CONFIG_PCIE_BUS_DEFAULT=y
	+CONFIG_DEBUG_MEMORY_INIT=y

1) CONFIG_DEBUG_MEMORY_INIT

The CONFIG_DEBUG_MEMORY_INIT default is super weird:

  config DEBUG_MEMORY_INIT
        bool "Debug memory initialisation" if EXPERT
        default !EXPERT

I this might in fact be a bug, and Ubuntu might have fallen victim to 
it:

  .config.fedora: CONFIG_DEBUG_MEMORY_INIT=y
  .config.ubuntu: # CONFIG_DEBUG_MEMORY_INIT is not set

I believe this should be 'default y', or 'default n'.

2) CONFIG_ARCH_HAS_ZONE_DMA_SET

This one is an interim Kconfig helper flag, and it's a bit weird as 
well:

  arch/x86/Kconfig:       select ARCH_HAS_ZONE_DMA_SET if EXPERT

I *think* the intent here is to make configurability of ZONE_DMA and 
ZONE_DMA32 dependent on EXPERT, while still giving architectures an 
opt-in as well:

 config ZONE_DMA
        bool "Support DMA zone" if ARCH_HAS_ZONE_DMA_SET
        default y if ARM64 || X86

 config ZONE_DMA32
        bool "Support DMA32 zone" if ARCH_HAS_ZONE_DMA_SET
        depends on !X86_32
        default y if ARM64

I think the better approach would be to make the EXPERT policy at the 
ZONE_DMA and ZONE_DMA32 level:

        bool "Support DMA zone" if ARCH_HAS_ZONE_DMA_SET && EXPERT

but it should be functionally equivalent.

3) RFKILL_INPUT

I think this one's a bug too:

 config RFKILL_INPUT
        bool "RF switch input support" if EXPERT
        depends on RFKILL
        depends on INPUT = y || RFKILL = INPUT
        default y if !EXPERT

Basically if you turn on EXPERT, the default changes from Y to N.

I think this should be a plain 'default y'.

4) CONFIG_PCIE_BUS_DEFAULT

I think this is quite confusing code as well:

  choice
        prompt "PCI Express hierarchy optimization setting"
        default PCIE_BUS_DEFAULT
        depends on PCI && EXPERT
        help
  ...

  config PCIE_BUS_DEFAULT
        bool "Default"
        depends on PCI
        help
          Default choice; ensure that the MPS matches upstream bridge.

  ...
  endchoice

So the intent here is clearly to steer users towards picking 
PCIE_BUS_DEFAULT.

But the 'depends' line turns off the option entirely on !EXPERT.

Which happens to work due to how the config options are used by the PCI 
code:

  #ifdef CONFIG_PCIE_BUS_TUNE_OFF
  enum pcie_bus_config_types pcie_bus_config = PCIE_BUS_TUNE_OFF;
  #elif defined CONFIG_PCIE_BUS_SAFE
  enum pcie_bus_config_types pcie_bus_config = PCIE_BUS_SAFE;
  #elif defined CONFIG_PCIE_BUS_PERFORMANCE
  enum pcie_bus_config_types pcie_bus_config = PCIE_BUS_PERFORMANCE;
  #elif defined CONFIG_PCIE_BUS_PEER2PEER
  enum pcie_bus_config_types pcie_bus_config = PCIE_BUS_PEER2PEER;
  #else
  enum pcie_bus_config_types pcie_bus_config = PCIE_BUS_DEFAULT;
  #endif

But this is highly unintuitive IMO. A cleaner implementation would be 
to always have CONFIG_PCIE_BUS_DEFAULT enabled on !EXPERT, which can be 
done by making the configurability of the choice-list depend on EXPERT:

  choice
        prompt "PCI Express hierarchy optimization setting" if EXPERT
        default PCIE_BUS_DEFAULT
        depends on PCI

> Based on the help text for CONFIG_EXPERT, nothing we
> consider the default should ever be guarded by it. If there
> is something that distros commonly that is prevented by
> EXPERT=n, it would be better to relay the dependency on that
> particular thing.

I think distro kernel maintainers mainly inherited their old configs 
and aren't afraid of CONFIG_EXPERT.

Thus *all* major distros I checked have CONFIG_EXPERT enabled: Ubuntu, 
Fedora, Debian, you name it. So literally over 99% of our users use a 
kernel that has CONFIG_EXPERT=y in it. Which is perfectly fine, distro 
kernel maintainers *are* the ultimate experts in this matter - but 
their choices inevitably make it to users configuring their own 
kernels: if users type 'make localmodconfig' they'll have 
CONFIG_EXPERT=y.

So I don't think we should ostracize CONFIG_EXPERT too much. :)

Otherwise I think you were right: 2 out of 4 of the configuration 
settings that change due to EXPERT are outright bugs IMO, the other 2 
are weird code that could be done in a more standard fashion, resulting 
in an invariant .config when EXPERT is toggled on/off.

Also, I kinda don't mind having CONFIG_EXPERT=y in the kernel 
defconfig: it's a helper config for *kernel developers* who want to 
have finegrained control over debug facilities and other details, it's 
not something for users - the resulting kernels won't result in a fully 
working system on modern x86 systems.

Thanks,

	Ingo
