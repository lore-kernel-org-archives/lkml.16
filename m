Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777122F7D08
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 18:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751481630; cv=none; b=upbBUEA3pxfCr4d7IM1Kdf3UKLdMkNatL0eNRj/6VLFmgTGyNZXzq3/kO8qyhvA4f6ZWxhCEK3K5S0id4HIl4m+nrV3XALelVVqR6zw05emJSEpdWCxT2nMt+3OBmTiKHO84iMoOA1EAB5t8I0/6N6fYMJFgyrioGijG3hlsCxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751481630; c=relaxed/simple;
	bh=nNA05Dnb2hIoX8oeaBHSBxtAqwh5LCT5so8nd8HtANM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hoZRp/F77H2N+deKcmLx14tUMxUi6ANsL+NKz/vytALpxuBeoJu/a5MCPsgznag3gyYQw5Xmyj4xCh3MRRY7/dh4B8zhaaLK4Ysp5sA3JijxwkYLcmBXD9tE62hK9oJWsES90gjbFQ6W1o6A0xPDw2nyYRfOOL/IrxL8pTNGuTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=iWA6s49V; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="iWA6s49V"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id DF2A640E020E;
	Wed,  2 Jul 2025 18:40:25 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id TQ8MgRyN4nh1; Wed,  2 Jul 2025 18:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1751481622; bh=yPUfwEn+TWpR+25qUC0YoUMBHySSl3XzmwBnngHtIWs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iWA6s49Vzd/Zx7X6v0oO8hbgyc6KWZo1OpaGDQgzr0Ut2I7dJKNuMH/tEouMquEYJ
	 kFqvSUAQaj0LkCIBTVVqcc7D7DeowrVjbCADIB1hsjVaT6JsdRO+Iholm54vuBaMAy
	 Qt5u6o8rTFSqny30EfPOxqG7ASaNVjWZMVLoQlDBFb3mg7gxfAd4Mg8XIr0gwucWwj
	 eGPfcRvdl9DL5xsCBYKs4un9yjuz6SMPgt/SFJQA3cka2xt+hBnm4dhnekmjwu3I28
	 XiwEwdp1EdqgpPkPrzITZN81YOK+3nnfNTkFx/DmSVqss4tmMbcYBMZ+ZNcEb+ReHu
	 YFr+zs2CaSBwaIdcxPTLbslhdoTEGcUf5plhKJMOxqr/YEgOR0iaGmTluNFqW/SgFB
	 stbg2klLBzT4pEkd7Miw6A9Ffbws6qTbxk1Wwfrn/bDu3MfpAAU7UggUTHz5SAb+Qs
	 AMZdQ3mG56tDzwQcYEzcbWi69UTSZPPBUeQWHDwPKAXIv5CpRDA1Tuh7eSRQja3TCc
	 2ZuTOuY66muEJljPJWKWVfeyEgZla2S/ZN3oS+51NggRyyQWu6Gv02qRFNPYA/Jz8t
	 hTfXyZ83xuz4pxEaXd3HQ/1D1HsepKk8wIV56A6g01sDzNTruqSoXgNByBp32rogVW
	 dEKkysALvIMaCxlgtG+cJB68=
Received: from zn.tnic (p57969c58.dip0.t-ipconnect.de [87.150.156.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 6261140E0217;
	Wed,  2 Jul 2025 18:40:10 +0000 (UTC)
Date: Wed, 2 Jul 2025 20:40:03 +0200
From: Borislav Petkov <bp@alien8.de>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	kernel test robot <lkp@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org, Linus Walleij <linus.walleij@linaro.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>
Subject: Re: [tip:master 19/19] include/linux/irq-entry-common.h:201:2:
 error: unexpected token
Message-ID: <20250702184003.GIaGV9A4ysMZA8MF2w@fat_crate.local>
References: <20250702132415.GFaGUy_6q0dZZI9AX3@fat_crate.local>
 <aGU_IY70Jt4bcbf2@J2N7QTR9R3.cambridge.arm.com>
 <20250702145425.GS1613376@noisy.programming.kicks-ass.net>
 <20250702150739.GT1613376@noisy.programming.kicks-ass.net>
 <20250702154137.71390C24-hca@linux.ibm.com>
 <20250702161012.GQ1613200@noisy.programming.kicks-ass.net>
 <20250702180136.GA3452438@ax162>
 <20250702181236.GGaGV2lAMxdCg_7MoX@fat_crate.local>
 <20250702182922.GHaGV6gl6axPokuBIr@fat_crate.local>
 <20250702183800.GA3958046@ax162>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250702183800.GA3958046@ax162>

On Wed, Jul 02, 2025 at 11:38:00AM -0700, Nathan Chancellor wrote:
> On Wed, Jul 02, 2025 at 08:29:22PM +0200, Borislav Petkov wrote:
> > Should be fixed now... famous last words. :-P
> 
> Thanks for sticking with it :) I can confirm that fad009b77942
> builds correctly for me.

No, thank you for double-checking us! Much appreciated. :-D

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
