Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2C3F1E1DE0
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 12:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751461142; cv=none; b=HtDo/WNq2GFGMcg283tpYKeubwzwT32z8o7P7pN54uVZM4UWU+tDdJzObl/WvtA2UbG/2u7LWmzcXmBk016cSPCaDGFfG48lDoid/WAYsIWDqO2ygWyCokWQXtBvKNmcxBfuxMWdBG2EFozGnZPvwIQoVqzl4piizBW8oiwqyPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751461142; c=relaxed/simple;
	bh=skRqgPc9wBvGvJ2wowMzW0V8GxW2mFciwdvzAQ8Q5dg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iBEgRxJhIu4TeBa5+jP9iOB9RwpkO6GZB3fYzDVAr3ojYGS5ghq8I/mu3h5enzubGxg32X6Ngu0OcB+K7mk6E3b8eDGielW9ovzrIAwLxP3rtwb+h6Porcz+50/f4HoRTyNC8iNByHaE/D3Cej9jlmvNFYYMrOGvhVKZWhM9WOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 38F801424;
	Wed,  2 Jul 2025 05:58:45 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 946E93F58B;
	Wed,  2 Jul 2025 05:58:58 -0700 (PDT)
Date: Wed, 2 Jul 2025 13:58:50 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Borislav Petkov <bp@alien8.de>
Cc: kernel test robot <lkp@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>
Subject: Re: [tip:master 19/19] include/linux/irq-entry-common.h:201:2:
 error: unexpected token
Message-ID: <aGUtCveV8Ev17_FS@J2N7QTR9R3.cambridge.arm.com>
References: <202507020528.N0LtekXt-lkp@intel.com>
 <20250702123240.GDaGUm6Le4KLL7o_91@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702123240.GDaGUm6Le4KLL7o_91@fat_crate.local>

Hi Boris,

[ adding Linux and Jinjie, since this is almost certainly due to the
  irqentry split ]

On Wed, Jul 02, 2025 at 02:32:40PM +0200, Borislav Petkov wrote:
> On Wed, Jul 02, 2025 at 05:56:06AM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git master
> > head:   104f02a7798f7e8aba25545f9d485035532260b2
> > commit: 104f02a7798f7e8aba25545f9d485035532260b2 [19/19] Merge core/entry into tip/master
> > config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250702/202507020528.N0LtekXt-lkp@intel.com/config)
> > compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250702/202507020528.N0LtekXt-lkp@intel.com/reproduce)
> 
> I'm trying to follow your reproducer and installed binutils-s390x-linux-gnu.
> 
> However: 
> 
> make CC=clang HOSTCC=clang W=1 ARCH=s390 arch/s390/ 
>   SYNC    include/config/auto.conf.cmd
>   CALL    scripts/checksyscalls.sh
>   VDSO    arch/s390/kernel/vdso64/vdso64.so.dbg
> ld: unrecognised emulation mode: elf64_s390
> Supported emulations: elf_x86_64 elf32_x86_64 elf_i386 elf_iamcu i386pep i386pe
> make[2]: *** [arch/s390/kernel/vdso64/Makefile:53: arch/s390/kernel/vdso64/vdso64.so.dbg] Error 1
> make[1]: *** [arch/s390/Makefile:150: vdso_prepare] Error 2
> make: *** [Makefile:248: __sub-make] Error 2
> 
> My linker can't do s390. So I need something else which your system has.

IIUC you can build with `LLVM=1` rather than `CC=clang` to force the use of
LLD (which should support s390 even if you don't have a GNU LD that does).

I have script to use the kernel.org GCC/LLVM builds from:

  https://www.kernel.org/pub/tools/crosstool/
  https://cdn.kernel.org/pub/tools/llvm/

... and I can reproduce this with:

  [mark@lakrids:~/src/linux]% git clean -qfdx
  [mark@lakrids:~/src/linux]% usekorg-llvm 18.1.6 make LLVM=1 ARCH=s390 -s allmodconfig
  [mark@lakrids:~/src/linux]% usekorg-llvm 18.1.6 make LLVM=1 ARCH=s390 -s  

... where that last step blows up with:

| init/main.c:972:6: error: unexpected token
|   972 |         if (WARN(!irqs_disabled(),
|       |             ^

... plus a whole bucnh of other gunk.

I'll take a look, and hopefully Linus and Jinie can too.

Mark.
