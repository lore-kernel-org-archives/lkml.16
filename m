Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B46C15D1
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 10:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749290932; cv=none; b=sZfgYtaFBczRB7bBvHFx6Ov/8hxOd5mS6//7vES07Krll2c1QD4NBL0luvDwm/xAM/zV4cNr2de9k57QSoHtX9AR78MhLZcr71VFgNAUAHudoBiIV4spA99wuoavcRkYEszu2I4ZUFMl3TfvClp9y1MYMh7wXEvySP0lAlUB2ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749290932; c=relaxed/simple;
	bh=BhsPvtvD3zZwx0vQheSv7g5C1qLY1cwclAO+lSgsAJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TMHXdhBFEgb+BAYnOf0tYJ7gfuRsjqWftYkov/CD+p+cP6FrtpdG0R6phAX3Iy7hl77L6UhD5DhQeEUrWHHWPWQgBVmZAHJDLb5FDo3sA6s8Ax4E+/Zh5FW36tRww8/PwXA2ZQKgxLjpei8ZQ78TgqTiVE0PlJhdT0VQl6ceBd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=htaQiNez; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="htaQiNez"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=KGK2V+df45qcDCr+fTxe+QxFxaVRM5lYQUmUVkTQFdM=; b=htaQiNez0PVWlAxO6FEI/ZhFTW
	pd9evC2CQsR5pLSs1+UroWCBl5H1DgwriQKnN5xlY2784pCwMOMc/rVkPMiFfBdM9CeM2ARu/Ej5A
	IUIZ5ThXQkcM3Wc7oDytXNXHfTECkWyJ6H9sF6UMPUd5+XjIUWCKi07myUcqOZ5/DKwwvTUVCi8xK
	BBaWBc1ooO7EV9xJ4d6aVx6fnCMHHhhw4U4p/pm9uMu+vUEqqJh9IeuOPLtwG+EFg82UXenclKny/
	Sy4i83aJImT6MvCXL6dexno3qsX0dDhY5QdP4Uq9PmGXrMCJE+3I8fRKA0Q8yhioLb7g1GnSkdN89
	Xsz5WZgA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNqTm-00000006Hq2-2998;
	Sat, 07 Jun 2025 10:08:46 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id DA86530078B; Sat,  7 Jun 2025 12:08:45 +0200 (CEST)
Date: Sat, 7 Jun 2025 12:08:45 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org, kees@kernel.org, acarmina@redhat.com,
	jpoimboe@kernel.org, mark.rutland@arm.com,
	torvalds@linuxfoundation.org
Subject: Re: [PATCH 08/11] x86_64/bug: Implement __WARN_printf()
Message-ID: <20250607100845.GC39944@noisy.programming.kicks-ass.net>
References: <20250607094224.104791182@infradead.org>
 <20250607095618.934805791@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250607095618.934805791@infradead.org>

On Sat, Jun 07, 2025 at 11:42:32AM +0200, Peter Zijlstra wrote:
> @@ -156,10 +166,21 @@ __always_inline int decode_bug(unsigned
>  	if (X86_MODRM_MOD(v) != 3 && X86_MODRM_RM(v) == 4)
>  		addr++;			/* SIB */
>  
> +	reg = X86_MODRM_REG(v) + 8*!!X86_REX_R(rex);
> +	rm  = X86_MODRM_RM(v)  + 8*!!X86_REX_B(rex);
> +
>  	/* Decode immediate, if present */
>  	switch (X86_MODRM_MOD(v)) {
>  	case 0: if (X86_MODRM_RM(v) == 5)
> -			addr += 4; /* RIP + disp32 */
> +			addr += 4;	/* RIP + disp32 */
> +
> +		if (rm == 0)		/* (%eax) */
> +			type = BUG_UD1_UBSAN;
> +
> +		if (rm == 1) {		/* (%ecx) */
> +			*imm = reg;
> +			type = BUG_UD1_WARN;
> +		}
>  		break;
>  
>  	case 1: *imm = *(s8 *)addr;
> @@ -176,12 +197,73 @@ __always_inline int decode_bug(unsigned
>  	/* record instruction length */
>  	*len = addr - start;
>  
> -	if (X86_MODRM_REG(v) == 0)	/* EAX */
> -		return BUG_UD1_UBSAN;
> +	return type;
> +}

Oh, this breaks the UBSAN case, it must also set UD1_UBSAN for mod 1 and
2. I'll fix.
