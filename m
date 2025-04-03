Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C206F241672
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 08:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743668744; cv=none; b=nPGOX3eyTSRvDSJJCOdpO5jHvvTKKgl/AylKRZK5uyFzqdN81G20im5bVnd9keS5rXfD0PgvPqEs4sRJQ8/Vu+Bo8QjoDT0D6VrKRfW20AAATCGbmcBQJPT0rgALSe9wyEPPjEwi39a+9XiL3Yoj6poBtKwn3Br7Vvy06HDc4l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743668744; c=relaxed/simple;
	bh=iHVyqDu7ZmLIy0mAMdQVNnQdgdMxjHIppXpD2G31IRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rxXFmD0VTPGkq1UMjIxhLCoUvDdw2LH68L32ugXawXYcmbmztpwQzwM5k4XLBvYNTWarq1uyP3gcMdglfaXLF+kbGOtgFFQM7/xbrVzh2DPIB3UZG2dkZdK2NU56yGyxQ1mJAkC9AVXTy+f8Pqjwvd/bxRPuanYq2MK30u8zYzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=ACKjWkDC; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="ACKjWkDC"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id DEDFC40E021F;
	Thu,  3 Apr 2025 08:25:30 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id I2rWiXDhLeqd; Thu,  3 Apr 2025 08:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1743668726; bh=hn536CbXmIM5vZ++pXIE0RVpfCDzNyPlJJt6MUVv9wE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ACKjWkDCGbUz4uHWs3e9PxX0SYCimu+DwOovUQ0ikYIBbkjEqr/ZI5xH3blZlZAxe
	 IbUp8Qz37ixgTuLckb/QNyiu9+IvYmy90M+8qts6p1XTdA68q73xZlpqRAJaaQczjH
	 IwhyAQD05DxFi4V5Gmx4jA69QBbbL56oyJadMV/J1O2alxzBdLCZrNgRKS+xBD1cc6
	 YtoLCIr/i1LXO+hG2qPfG6HofkN/eFKJ4xyYGl2pOpRAVhm+1JcS2oGoPl3DbnJhTw
	 Cadt0LchZTMCmOxOat+APcDEMVX5Mf3Xk7CPuIveMWYI+zIn8TkOPeGKxzGUGYEL+K
	 WYYus1bF2k+P6Ap+76HheFYhVYl4pCa3k8gZmuCHrjJnlueiO+EWUHVjKhkbxJlzC/
	 XOUZa1fzlOG8XinfRW9nTmBT8NHKfnTLZNtvcUVathcWT9DQcSGgQQTO5IIgC7UeYB
	 PXDsZigr88cMAcuUNbG3kydnz/COODQODna+EsOISfyfQxHqwgaGBLi42CDSXEsZ9z
	 EDVC1P5hjxmaBRPwZLNObAN8RmCL6XRccgawKmFxt6TVFoW+l/fgfTwVi5ApBKdih3
	 5KV6O4wKE0oKgGWH+YwNQqMFHouW8hvrexgEXMM5LZOIDvooRPwEGJCHjZ7BDnLvGC
	 opcOVotpheWxIi0ZuKhSYYEY=
Received: from zn.tnic (pd95303ce.dip0.t-ipconnect.de [217.83.3.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 27D2640E0232;
	Thu,  3 Apr 2025 08:25:18 +0000 (UTC)
Date: Thu, 3 Apr 2025 10:25:08 +0200
From: Borislav Petkov <bp@alien8.de>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH -tip] x86/idle: Work around LLVM assembler bug with
 MONITOR and MWAIT insn
Message-ID: <20250403082508.GAZ-5F5EMVZq3-6Zoo@fat_crate.local>
References: <20250403070453.214190-1-ubizjak@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250403070453.214190-1-ubizjak@gmail.com>

On Thu, Apr 03, 2025 at 09:04:37AM +0200, Uros Bizjak wrote:
> LLVM assembler is not able to assemble correct forms of MONITOR
> and MWAIT instructions with explicit operands:
> 
>   error: invalid operand for instruction
>           monitor %rax,%ecx,%edx
>                        ^~~~
> 
> Use instruction mnemonics with implicit operands when LLVM assembler
> is detected to work around this issue.
> 
> Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@kernel.org>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Fixes: cd3b85b27542 ("x86/idle: Use MONITOR and MWAIT mnemonics in <asm/mwait.h>")

No, you should whack that one - the toolchains are clearly not ready yet...

> +#ifdef CONFIG_LD_IS_LLD
> +# define ASM_MONITOR	"monitor"
> +# define ASM_MWAIT	"mwait"
> +#else
> +# define ASM_MONITOR	"monitor %[eax], %[ecx], %[edx]"
> +# define ASM_MWAIT	"mwait %[eax], %[ecx]"
> +#endif

... instead of piling more ifdeffery ontop and making the code uglier than
before.

Go fix the LLVM assembler to deal with explicit operands or GCC and LLVM
should agree on common syntax they both assemble or whatever and the kernel
should do *one* thing exactly and not carry toolchain-specific ifdeffery at
every spot.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
