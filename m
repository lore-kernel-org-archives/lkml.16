Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45F9E22A4DB
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 13:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751462182; cv=none; b=D54uUNQKfio8bKzhFupfxtWDz1aQFm0J/EPilhsA+6epr4g1q8oS+8nXdJUCT4MM0la+vLr8eVjYL4Bg/BFLOkFfaQOpr0VCNOckFMItrEAVvJV5DTwQCFQRymC7OhGfrEHiLFV5/6Azu3jBncXno1kKHD5WqhEnZQxlE44Uug4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751462182; c=relaxed/simple;
	bh=eoh/0ngUiWGnFNUZX8+EKdsHmE8O2b7KxJ6G+VXBozU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J+CzmwOMCrMYI+EWiuzwRs4Lrpev35zT2Jnb+lV/wthEdJCmQ8hpHm7nEAKhs6RSz4K+oKcqYH0q1DPKs3aj3O77reI61jYUGEC/bXtzoJH9HzEe5cTMqNCq0lJAwzlL/dQej7fGW6B66mleqYiJ6m/QfMi/ZrIsjI9ehCdMQPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C381C152B;
	Wed,  2 Jul 2025 06:16:04 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 402C23F58B;
	Wed,  2 Jul 2025 06:16:18 -0700 (PDT)
Date: Wed, 2 Jul 2025 14:16:15 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Borislav Petkov <bp@alien8.de>
Cc: kernel test robot <lkp@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>
Subject: Re: [tip:master 19/19] include/linux/irq-entry-common.h:201:2:
 error: unexpected token
Message-ID: <aGUxH--v32Bv4T81@J2N7QTR9R3.cambridge.arm.com>
References: <202507020528.N0LtekXt-lkp@intel.com>
 <20250702123240.GDaGUm6Le4KLL7o_91@fat_crate.local>
 <aGUtCveV8Ev17_FS@J2N7QTR9R3.cambridge.arm.com>
 <20250702130915.GEaGUve86iYnv337_Z@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702130915.GEaGUve86iYnv337_Z@fat_crate.local>

On Wed, Jul 02, 2025 at 03:09:15PM +0200, Borislav Petkov wrote:
> Hey,
> 
> On Wed, Jul 02, 2025 at 01:58:50PM +0100, Mark Rutland wrote:
> > Hi Boris,
> > 
> > [ adding Linux and Jinjie, since this is almost certainly due to the
> >   irqentry split ]

I was wrong about the above, sorry for the noise!

> It looks to me like that BUGVERBOSE stuff in tip/core/bugs and it warns
> because core/entry starts using it when it gets merged to the rest of the tip
> pile.

Yep; my bisect fingers:

  b940c7b8ea92 ("bugs/s390: Use 'cond_str' in __EMIT_BUG()")

| git bisect start
| # bad: [104f02a7798f7e8aba25545f9d485035532260b2] Merge core/entry into tip/master
| git bisect bad 104f02a7798f7e8aba25545f9d485035532260b2
| # bad: [959770cda97b75bc831267fd939408ec58139cb5] Merge locking/core into tip/master
| git bisect bad 959770cda97b75bc831267fd939408ec58139cb5
| # good: [86731a2a651e58953fc949573895f2fa6d456841] Linux 6.16-rc3
| git bisect good 86731a2a651e58953fc949573895f2fa6d456841
| # good: [7abdafd2343ab199367c8243d6a5f06a9aa6976b] Merge tag 'drm-fixes-2025-06-28' of https://gitlab.freedesktop.org/drm/kernel
| git bisect good 7abdafd2343ab199367c8243d6a5f06a9aa6976b
| # good: [2d41eb1b4a70fd8f3ca7f08ed209ae5c8037af62] Merge x86/kconfig into tip/master
| git bisect good 2d41eb1b4a70fd8f3ca7f08ed209ae5c8037af62
| # good: [b7770ed895ab888d0626802a83939f6a30c35576] Merge x86/bugs into tip/master
| git bisect good b7770ed895ab888d0626802a83939f6a30c35576
| # bad: [244efb663e9ead81d3d258d81f38a38af02e09de] Merge core/bugs into tip/master
| git bisect bad 244efb663e9ead81d3d258d81f38a38af02e09de
| # bad: [e7e26cfad96c57c81156693cbf63032d899fe7c9] bugs/s390: Remove private WARN_ON() implementation
| git bisect bad e7e26cfad96c57c81156693cbf63032d899fe7c9
| # good: [66e94df0dd272b057899b8cdbca906ea1306d7a1] bugs/LoongArch: Pass in 'cond_str' to __BUG_ENTRY()
| git bisect good 66e94df0dd272b057899b8cdbca906ea1306d7a1
| # bad: [4218dedd47c79946bc9e6214f50c0d16096873ce] bugs/riscv: Pass in 'cond_str' to __BUG_FLAGS()
| git bisect bad 4218dedd47c79946bc9e6214f50c0d16096873ce
| # good: [7d9e9021ad7e9dac89b8262fbf95630ead7a787a] bugs/s390: Pass in 'cond_str' to __EMIT_BUG()
| git bisect good 7d9e9021ad7e9dac89b8262fbf95630ead7a787a
| # bad: [b940c7b8ea921fae7a99d305e819883d8311669e] bugs/s390: Use 'cond_str' in __EMIT_BUG()
| git bisect bad b940c7b8ea921fae7a99d305e819883d8311669e
| # first bad commit: [b940c7b8ea921fae7a99d305e819883d8311669e] bugs/s390: Use 'cond_str' in __EMIT_BUG()  

> Lemme show it to Peter.

Sounds like a plan.

Mark.
