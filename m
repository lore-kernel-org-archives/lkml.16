Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A672E498D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 18:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751480989; cv=none; b=RmxzQEYahgEMHCHvsohckUlKUUfRepfgGt4m8yzu7LUQ7sSp86K3nR5Bdv9ZwcpCT+WDk+saZJP4TmuJmdDxMq5dUWdpFMigu7K8pveJ/80sT/ne2cvfHi+wMbZ/87zvSOJR+1gymtP31LOzeAFirKottYTbRTwEQ3JRDBAUnks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751480989; c=relaxed/simple;
	bh=1vxlteZGgs8rPgxVkHOhpq5xPFcq85u1536QGsj7Ilw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ricuqKHMp05ritvBFd52kByIsa55Wp5EQ4OnyjYxrNSN31yFR/nqtnCmjgZyY+vhCqgZm5c4GvSfsz5BFzw20gXqDwAiB4A58FE9ooA9OLTxLV0xzIY8DoK5YoTbQELAcVf4Ka4q0wLCRM3ELcbhoOJ7lcmAW9zTWxR0H7ndC0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=bcLbLhTi; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="bcLbLhTi"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id A98C540E0215;
	Wed,  2 Jul 2025 18:29:44 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id qvSWt73tl03D; Wed,  2 Jul 2025 18:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1751480980; bh=X2eYdTgOAj7ev229sZL74SOmPQikqFp9uPGo50WqjDw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bcLbLhTiAETgQIiVutZtrx993YwtpEm7geaQHYzvQrftPhH10vuzPZzOINRx2G9qM
	 EPC1NtbBUWskaeiR9mENIhs6oHYjoNEefD+bfbRxwo5YRa21YGeJjyznC6aMN18eKC
	 bSVZsiKRCVyx/rNCAFAfJxjch8v91EewCCgedXbUv5MZJQdaoYqA3qbnPCgVHu+S9m
	 R1DUVEcRlu+PalqFiSfOMdKeLlu30DpxDGxLBkPDx5VEpdNCHm8j9opNxwGNM5f7xO
	 sMT/bqQ8xmOxJxDLpA1PndKQkKKMs1m55HP/tDMBK3e+UriLxlegbGqds5MjPnUyFX
	 3o1rr+0j/ZYkOFpq774MR3t8ZSdl3FUQ7Qu+lx8ms86ReBgtx+W39fm+u9wO+tEuUj
	 sOaQlAUaidf4GxhD/JvOIWDOG2w3MajtHud2BEvCOzAzDWDYgAjWk5vngm6iDVMtJo
	 tMaVatKDb/28S0EfaavMzKNqayxgw32PUPK8f65Si5VWd+3e0aj+eKqciCMjIO5MNy
	 St0j7BxpZL7I/TifhrW13gIwczW/faJdG+RZTK8fYUqkk1Vtq9v339ObYfisN2Z1TW
	 WRXpbxzYuuE0fW5RRNQc7M/iFp5sTq2jL9YYFLEzOCAR1HBbL1MgJ+cZM8NwS5fgax
	 EEdOpvIuIzUxuu6KJHw1ag10=
Received: from zn.tnic (p57969c58.dip0.t-ipconnect.de [87.150.156.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 7879A40E0217;
	Wed,  2 Jul 2025 18:29:28 +0000 (UTC)
Date: Wed, 2 Jul 2025 20:29:22 +0200
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
Message-ID: <20250702182922.GHaGV6gl6axPokuBIr@fat_crate.local>
References: <20250702130915.GEaGUve86iYnv337_Z@fat_crate.local>
 <aGUxH--v32Bv4T81@J2N7QTR9R3.cambridge.arm.com>
 <20250702132415.GFaGUy_6q0dZZI9AX3@fat_crate.local>
 <aGU_IY70Jt4bcbf2@J2N7QTR9R3.cambridge.arm.com>
 <20250702145425.GS1613376@noisy.programming.kicks-ass.net>
 <20250702150739.GT1613376@noisy.programming.kicks-ass.net>
 <20250702154137.71390C24-hca@linux.ibm.com>
 <20250702161012.GQ1613200@noisy.programming.kicks-ass.net>
 <20250702180136.GA3452438@ax162>
 <20250702181236.GGaGV2lAMxdCg_7MoX@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250702181236.GGaGV2lAMxdCg_7MoX@fat_crate.local>

On Wed, Jul 02, 2025 at 08:12:36PM +0200, Borislav Petkov wrote:
> On Wed, Jul 02, 2025 at 11:01:36AM -0700, Nathan Chancellor wrote:
> > Thanks Peter. Did something go awry with the latest rebase? It looks
> > like current core/bugs has the loongarch issue fixed but "bugs/s390: Use
> > 'cond_str' in __EMIT_BUG()" seems to have reverted to the broken
> > version?
> 
> Ah crap, lemme fix that.

Should be fixed now... famous last words. :-P

git diff e0d1ec28743b a4585558a904
diff --git a/arch/s390/include/asm/bug.h b/arch/s390/include/asm/bug.h
index a185855ab158..acb4b13d98c5 100644
--- a/arch/s390/include/asm/bug.h
+++ b/arch/s390/include/asm/bug.h
@@ -9,7 +9,7 @@
 #else
 #define __BUGVERBOSE_LOCATION(file, line)                      \
                .pushsection .rodata.str, "aMS", @progbits, 1;  \
-       10002:  .string file;                                   \
+       10002:  .ascii file "\0";                               \
                .popsection;                                    \
                                                                \
                .long 10002b - .;                               \

Thanks!

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
