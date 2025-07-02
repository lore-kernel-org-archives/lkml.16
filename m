Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9310C1E5B70
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 13:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751461780; cv=none; b=gFgvhejAf72eWrYRpAH+6O9YlDFkRFn42YX4I5icS+S/E5LQGoCY7CsUf1rZMHFIA1j6Cm5QgD/NbRqsI5Pmzxrw/+g4sEIrmyXESTUg3KIk01iAqXCniL2ou+XU94Siyae3vX46oai9y6xx3DxdM0IJ0T7XItJlD4V7dlawrJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751461780; c=relaxed/simple;
	bh=T0T50epQYXSTIcomIRVA4pTMk0v0FrjObGdzIlNlzY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j+GR9bAmaQxEdUxhPbi1abnBMs/4AykoKkJv6tEe6BHRqwlOMqxAETQ0cKeUKKTrBu0+3zAKXc9o1HCCGjQabIH/V1PlTIxzPGAH27RqBa8FceKVakfvUUPS12VXmXCZZnXILUVlNukcMI76BEYQgwRz8lq8ilW3dmrQfVewoXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=PeMl1KbJ; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="PeMl1KbJ"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 4235A40E0205;
	Wed,  2 Jul 2025 13:09:36 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id T9VHxsU5LReM; Wed,  2 Jul 2025 13:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1751461771; bh=wjkdRehXZRzRYjP4NRRWzsslHj3FiEjq733eglR4EgQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PeMl1KbJpVbPUqHbEEtF+uKgxwoYsdqkxHkhM6OdQptt5pxSi+Oy2L64LjmkdoSp+
	 wyaNZaGdAbSIM4Inbi8XmJMz09zSmlvnhV0RAtwdF4BNV0vzMsB9e4ulskUT/dSc3d
	 b7Tt9LK+BPcVZVhAcNhgH5Bsw7rYx5C7kVftvSADBc0BFUIyTR87pxIFy7AAaXnL+k
	 /xAjyjBXx2BWHQFNBI9yEkPllZNam4U46RczSxUdbc1i5HcDOeEzERlvAyloj4kNku
	 KgAnupimy9b9S5pPnS74bKpC5j7jjfSGLgumbp8tEeeBgQBI/1g/fNHlFBofV+t6ov
	 GkPavETo4hpEkO7fjheARhsME3mmzRFCknxnh/kMmmAF2LpHRM/EuOnSgNesZM3DBy
	 w9IQl8YixJZeZbPQ6VKoe3KtgyNdRG/KPolVndj4k4AcwqgjXxJU2f6G+LZNcGvlQ/
	 Snrj8Ti0WLQKJpFfkM80/c/3wESP62VXkdaH3fOVhFZ+UH9aAI/g9i9JI392js38Fr
	 RW8tgQEP6VSTBORN1TxDwp85eCReYhfEpN/QOExge+vbY9F+DPClc9bREMLZ66uwl4
	 TaCuqqUWEP9/Cwc9K/BTkKI1SFf//uX6YKOuDJtbSwpXP1JHI7/AQ/RtZ3RypWQK0e
	 S3UymDOZgyK5651yCvx0PTnE=
Received: from zn.tnic (p57969c58.dip0.t-ipconnect.de [87.150.156.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 6A27240E021C;
	Wed,  2 Jul 2025 13:09:22 +0000 (UTC)
Date: Wed, 2 Jul 2025 15:09:15 +0200
From: Borislav Petkov <bp@alien8.de>
To: Mark Rutland <mark.rutland@arm.com>
Cc: kernel test robot <lkp@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>
Subject: Re: [tip:master 19/19] include/linux/irq-entry-common.h:201:2:
 error: unexpected token
Message-ID: <20250702130915.GEaGUve86iYnv337_Z@fat_crate.local>
References: <202507020528.N0LtekXt-lkp@intel.com>
 <20250702123240.GDaGUm6Le4KLL7o_91@fat_crate.local>
 <aGUtCveV8Ev17_FS@J2N7QTR9R3.cambridge.arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aGUtCveV8Ev17_FS@J2N7QTR9R3.cambridge.arm.com>

Hey,

On Wed, Jul 02, 2025 at 01:58:50PM +0100, Mark Rutland wrote:
> Hi Boris,
> 
> [ adding Linux and Jinjie, since this is almost certainly due to the
>   irqentry split ]
> 
> On Wed, Jul 02, 2025 at 02:32:40PM +0200, Borislav Petkov wrote:
> > On Wed, Jul 02, 2025 at 05:56:06AM +0800, kernel test robot wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git master
> > > head:   104f02a7798f7e8aba25545f9d485035532260b2
> > > commit: 104f02a7798f7e8aba25545f9d485035532260b2 [19/19] Merge core/entry into tip/master
> > > config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250702/202507020528.N0LtekXt-lkp@intel.com/config)
> > > compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250702/202507020528.N0LtekXt-lkp@intel.com/reproduce)
> > 
> > I'm trying to follow your reproducer and installed binutils-s390x-linux-gnu.
> > 
> > However: 
> > 
> > make CC=clang HOSTCC=clang W=1 ARCH=s390 arch/s390/ 
> >   SYNC    include/config/auto.conf.cmd
> >   CALL    scripts/checksyscalls.sh
> >   VDSO    arch/s390/kernel/vdso64/vdso64.so.dbg
> > ld: unrecognised emulation mode: elf64_s390
> > Supported emulations: elf_x86_64 elf32_x86_64 elf_i386 elf_iamcu i386pep i386pe
> > make[2]: *** [arch/s390/kernel/vdso64/Makefile:53: arch/s390/kernel/vdso64/vdso64.so.dbg] Error 1
> > make[1]: *** [arch/s390/Makefile:150: vdso_prepare] Error 2
> > make: *** [Makefile:248: __sub-make] Error 2
> > 
> > My linker can't do s390. So I need something else which your system has.
> 
> IIUC you can build with `LLVM=1` rather than `CC=clang` to force the use of
> LLD (which should support s390 even if you don't have a GNU LD that does).

I was just typing:

Nathan says:

"You need to supply CROSS_COMPILE=s390x-linux-gnu- or use LLVM=-19 to avoid the ld error."

:-)

> I have script to use the kernel.org GCC/LLVM builds from:
> 
>   https://www.kernel.org/pub/tools/crosstool/
>   https://cdn.kernel.org/pub/tools/llvm/
> 
> ... and I can reproduce this with:
> 
>   [mark@lakrids:~/src/linux]% git clean -qfdx
>   [mark@lakrids:~/src/linux]% usekorg-llvm 18.1.6 make LLVM=1 ARCH=s390 -s allmodconfig
>   [mark@lakrids:~/src/linux]% usekorg-llvm 18.1.6 make LLVM=1 ARCH=s390 -s  
> 
> ... where that last step blows up with:
> 
> | init/main.c:972:6: error: unexpected token
> |   972 |         if (WARN(!irqs_disabled(),
> |       |             ^
> 
> ... plus a whole bucnh of other gunk.
> 
> I'll take a look, and hopefully Linus and Jinie can too.

Thanks.

It looks to me like that BUGVERBOSE stuff in tip/core/bugs and it warns
because core/entry starts using it when it gets merged to the rest of the tip
pile.

Lemme show it to Peter.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
