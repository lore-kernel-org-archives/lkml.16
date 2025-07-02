Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D942D77F7
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 18:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751479984; cv=none; b=SifHO+hhOt/XXZ4/j1zIT6rXMwE4py6cpsOAthoCThyGB2xxGM47fo5RzUIe3Mgj5YiKNotMjoxoqkX0iqahOqooiL+/QcOLKYD86QIy8xKftaChQTMlv0a2g7RS0nD+ZoEVNNnk3pgJ8uM3NpY7JECpCQt6XuYGGmsho0uNnLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751479984; c=relaxed/simple;
	bh=VDnHH8qP6oZIvk6lbRuEMGwsY0B+qCnowOVHKrLfnyg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mhFRTMsr72DGq7Fs7ncjLitZtel5zePAAxcofhcdRHtud1fLmfz3g3iUstzWoZ0sybMHo5WG4p1Q1o6KXyrNmb9lHUE17JCUvyxPElqtLcD9HmTby6mWMFL3HgoV13DmL+M7JQ2lLb9tNtfEcLhL3cBeHZJAtzcrjGTLP0wtU2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=BWIKujXI; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="BWIKujXI"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 37D9840E021C;
	Wed,  2 Jul 2025 18:12:59 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id sxZ_fpRKH06n; Wed,  2 Jul 2025 18:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1751479975; bh=t/LXRgWle3PyUM7zxWZSUtGTSzpFtT7sBoW4E1bzRIM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BWIKujXIVQz0zFg1Dw9DpHunxfTzvh8tPBPJEjydquAs73WldnBc6y+e6WnS6CYmN
	 EmaYWFTrU1mpv/t3qs/SdagjwT/RqZyt3yD2GfeZCptP2rVq/9qsWg4XoqJdTE+/nd
	 agJhTWku3k/VKwpP2KFu+k15G2MbdOR3NWmmcbVXGKVL7TdEUd5Z+AOoVDnlSelLtk
	 +ZtXjz1Z9h1TeTZk7WyRfJY0oedPNmYY5On5vagznjNE1DiyfO01Jav8b0/PSSWtrO
	 yJ6Rlro+ztRcY63gDQIUL25Q+sLVPTvJeHSIi8rlD0VgrzvYF0S0nxWf1lPC8MSSnf
	 J4ryESupZzxGjlKHrsqT79WP9QnitQOLdZfz90wx4K1q2eNS1clZR9l+dxlPXKW5z/
	 n1D0XXX16B57g9uHc3Z4iE4Brh6Qt+xSL6Pyorvip9hF1uIdHHA4W5093hatL1TwqD
	 7BFVX7lLpCu9myHsxp6OMBl4BatS+dyyL3fGKrKAdP4nl9HrNf04EROghZfcFmcu+z
	 IjP/kIpp1nti8RsrL5p0gRG2pJ2pnOb8Zg+Ad77GJbPAyJcb7oZlUcNSi5CeBctsF4
	 e1h0sQAGw7Ql8FLKYgXuIhEDrnOjPgmCjmWTg9VOLFARFWLy79h24ja6dUO1ZEtp9F
	 VJu5NWlfnPuxF/AsQz+UdlHc=
Received: from zn.tnic (p57969c58.dip0.t-ipconnect.de [87.150.156.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id BE8E940E0215;
	Wed,  2 Jul 2025 18:12:42 +0000 (UTC)
Date: Wed, 2 Jul 2025 20:12:36 +0200
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
Message-ID: <20250702181236.GGaGV2lAMxdCg_7MoX@fat_crate.local>
References: <aGUtCveV8Ev17_FS@J2N7QTR9R3.cambridge.arm.com>
 <20250702130915.GEaGUve86iYnv337_Z@fat_crate.local>
 <aGUxH--v32Bv4T81@J2N7QTR9R3.cambridge.arm.com>
 <20250702132415.GFaGUy_6q0dZZI9AX3@fat_crate.local>
 <aGU_IY70Jt4bcbf2@J2N7QTR9R3.cambridge.arm.com>
 <20250702145425.GS1613376@noisy.programming.kicks-ass.net>
 <20250702150739.GT1613376@noisy.programming.kicks-ass.net>
 <20250702154137.71390C24-hca@linux.ibm.com>
 <20250702161012.GQ1613200@noisy.programming.kicks-ass.net>
 <20250702180136.GA3452438@ax162>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250702180136.GA3452438@ax162>

On Wed, Jul 02, 2025 at 11:01:36AM -0700, Nathan Chancellor wrote:
> Thanks Peter. Did something go awry with the latest rebase? It looks
> like current core/bugs has the loongarch issue fixed but "bugs/s390: Use
> 'cond_str' in __EMIT_BUG()" seems to have reverted to the broken
> version?

Ah crap, lemme fix that.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
