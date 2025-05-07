Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDD728C853
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 17:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746639672; cv=none; b=oA4wNw3Hmz5Yrjj3QbGKes8cIN0zX+UjQF31b0Im2qGGGDfrQwMSuM9DgLmPk7g58ObsQTF7FeUR+NK9PsM6FcO9hNAsDqLSGrjgCewGF1UTpNvsnpj94BFabKEPHuR8358MEYlvOBnKut/0ehwo3CBmG7wbni5zDxGS4NL4JYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746639672; c=relaxed/simple;
	bh=FL4IeKrUspWVyp1tk9VzMiFnHwB23qw+vDWGRZbzPBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pyB0ykRVLhDQgHN5YejjjCYkUIbN49YpKI//o7Y+40JoQ7A0GdwCBqoWPU8dLgVtOxgc7m+4ZYX5oqFXUFMNDAMxIt8xh8Rx1WRgXtSNmxQt9oFa/+FZzbKVrDbtCdicg6vWY0+JtVZCqVO+1RK+63iuHfYpXw/TmHxElE8qi/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nbLWgj3J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nbLWgj3J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0406C4CEE2;
	Wed,  7 May 2025 17:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746639671;
	bh=FL4IeKrUspWVyp1tk9VzMiFnHwB23qw+vDWGRZbzPBM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nbLWgj3JmJ31+V389MiRWKysVLZyLMm7eino0x21Azs3KyacL+DinO+8yMWn9aeeO
	 MQtxi6n8FM2JKYpVg7lkOp6kau+f4arYE0yRzGM3WJNP4D5HVdfLoD4RS8AVA3totO
	 sDwXIermbDpd1IF6Md56Epqbl4ON+7bm7SxFk5/8SZuE+1vzyZskSUwZ2Gua1vgPJR
	 /UXTsENqXABiN9/zEO0Yl/78uXQGXMKcfc2xqq+xb+LQf/9XA9NZwtVM3aEYs2GiSk
	 C9s3kY+F+8knTBgDWFSAtQMz05X4l3DHs8Pzul0iEeh0qVWCVhSvMrC9JGuy4bh3Sv
	 Ml598W/FhihlQ==
Date: Wed, 7 May 2025 19:41:06 +0200
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
Subject: Re: [PATCH 15/15] x86/kconfig/32: Synchronize the x86-32 defconfig
 to the x86-64 defconfig
Message-ID: <aBubMpHlXQZYeevi@gmail.com>
References: <20250506170924.3513161-1-mingo@kernel.org>
 <20250506170924.3513161-16-mingo@kernel.org>
 <667849c3-e522-4fbb-9d45-fbe28f7e6da7@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <667849c3-e522-4fbb-9d45-fbe28f7e6da7@app.fastmail.com>


* Arnd Bergmann <arnd@arndb.de> wrote:

> On Tue, May 6, 2025, at 19:09, Ingo Molnar wrote:
>
> > Just a mechanic synchronization of kernel options enabled: nobody 
> > really develops kernel features on x86-32 anymore, so make sure the 
> > defconfig is roughly equivalent to the 64-bit one, so that testing 
> > doesn't cover some combination that nobody cares about.
> 
> What is the size increase here?
>
> Some of the options you enable look like they might add a lot of code 
> to the vmlinux binary, and 32-bit are often might more limited than 
> 64-bit ones.

16.5MB -> 20.8MB, so well within usual RAM limits of x86-32 testing.

As a comparison, the last x86-32 Debian version's kernel, based on 
v6.1, has a vmlinux with 12.2MB .text and 4.2MB of modules loaded when 
booted into text mode, so 16.4MB total. This goes up substantially if 
any graphics is loaded.

> IOW, is your goal here to keep something that works on actual 32-bit 
> machines, or do you want something that will in practice run on 
> 64-bit machines and have a comparable feature set?

This will work on the vast majority of actual 32-bit machines in the 
i686 class and above, but the primary users are kernel developers doing 
test-runs on x86-64. For those who have less than 1GB of RAM, there's 
always tiny-base.config.

> > @@ -50,7 +76,11 @@ CONFIG_ACPI_BGRT=y
> >  CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE=y
> >  CONFIG_CPU_FREQ_GOV_ONDEMAND=y
> >  CONFIG_X86_ACPI_CPUFREQ=y
> > -CONFIG_KPROBES=y
> > +CONFIG_KVM=y
> > +CONFIG_KVM_INTEL=y
> > +CONFIG_KVM_AMD=y
> > +CONFIG_KVM_XEN=y
> > +CONFIG_KVM_MAX_NR_VCPUS=4096
> >  CONFIG_JUMP_LABEL=y
> >  CONFIG_COMPAT_32BIT_TIME=y
> >  CONFIG_MODULES=y
> 
> I have a series to completely remove KVM support for 32-bit. There is 
> one powerpc platform that may keep it, but there is really no point 
> in enabling it here when there are practically zero 32-bit machines 
> that can use it.

That's OK, it will go away once it's removed.

This is an intentionally mechanical mirroring of the 64-bit Kconfig 
over to 32-bit, we've done this in the past as well.

Thanks,

	Ingo
