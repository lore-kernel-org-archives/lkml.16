Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760CB5228
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 09:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746955838; cv=none; b=bLmwKsn18CfGUlGFS0hZb1zFW8Yzy93IS6i7IVH3OwByesziDZNf1dVphHeP1bl8OKnJ4eytwnKpe2gwzTCBbRUIr89l1ya5cXwFnyCxhhqsJazLxIuHkY8V/8ugcpOgDnabow9sCJGwVX8xtB9S5cxSKE5hUqXB2wY27FXjo8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746955838; c=relaxed/simple;
	bh=ghjmwqkJELVXvQOOfRoZf+XEY5wLjluR3CxqGgp2Fz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jRqm6gyevPTTbWK8uDXjKy1lONK5m1Lq3/oZyLZKKOa6sUD9t0SnCXPu8W17mJ8LLLB5tQWnIPo9cJfLut6d/sjiG1nXDsoO10/K5xI2Y9xcX1oSXmRg4dzzuxAKLa6fBgStXDJXD8q+dviLpYTPjeb9/GI+lyHmt0uxlGLbDM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=ceuAviyU; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="ceuAviyU"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 1A95540E0196;
	Sun, 11 May 2025 09:30:33 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id IvrWS7uOYDGu; Sun, 11 May 2025 09:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1746955827; bh=a5K534Wj1Ui7kYvS+0d1+1lWwiHHtV0UUwgr+yRAA/4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ceuAviyUTK20hS7oO5v+rlpuhZgam1BU2iKGF6Vuj02+CshaiISvOE1IJZ7hAhQD2
	 Aj+r4heJTdIl5Ey+m0OteE+mZuRMwW0hc6o1XdEC5OU0HSnFvKXgSzm2DxdrzU2hMT
	 V0LmV9+Ronf/7ue3S6sF9uA9GeiA7lUig9PQCS79YSyHVOSmu43dK491us/iQ+mwqJ
	 89f7BfMCM+plfPzYW8KTp6sCPkZM84nWukV8z7EJKPTQYPTX8jnogaYy17tCsCQzBF
	 tsxwOeCXY7k4iSHC1S7iL/dbBnbZEtbBNf1lMrb4OuK2G3JlPLwa1eiz4d59t3lOEI
	 jaJDZs0F5X6teh98I5qx11D5oCJ/dg9WaWkPlYC+jBVzBmPcZ7vYC6noJgSNITfKNf
	 4NyT1OxOdgaEM44RdHQ3Ki7dS1czEWvNRHh1gN62CCBYk1tGnR/zV/gBAA9ceB6hNt
	 zTh/Tig25qeBA0jWzarp+VScwfDXoYXbCCO9n8jyzK3mJs+t0g/z/INKm4KT8hkwYj
	 gdO6oSWa30Uo9NLeB2z+TNLLnYwRcQMmwR8vAh1gADk18Hj4YHWb8Ilv22xLDsgKmg
	 TBNHW2/GRBOgcbRAVeQOEVhtfSSlwkG89DqqUgp9tL7rkZEUpqfcMcJTl5DNMg9xqg
	 F0FZxTX8zq/VSQGx7F6HPfcg=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 5A27D40E01ED;
	Sun, 11 May 2025 09:30:19 +0000 (UTC)
Date: Sun, 11 May 2025 11:30:12 +0200
From: Borislav Petkov <bp@alien8.de>
To: Seongmanlee <cloudlee1719@gmail.com>
Cc: x86@kernel.org, leonardo-leecaprio <augustus92@kaist.ac.kr>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] x86/sev: Fix operator precedence in
 GHCB_MSR_VMPL_REQ_LEVEL macro
Message-ID: <20250511093012.GBaCBuJDhtPXqCcwQv@fat_crate.local>
References: <20250511092329.12680-1-cloudlee1719@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250511092329.12680-1-cloudlee1719@gmail.com>

On Sun, May 11, 2025 at 06:23:28PM +0900, Seongmanlee wrote:
> From: leonardo-leecaprio <augustus92@kaist.ac.kr>
	^^^^^^^^^^^^^

Right, when you fix the name, you need to fix the authorship too:

$ git commit --amend --author="Seongman Lee <augustus92@kaist.ac.kr>"

as this name will appear in the git history.

But no worries, I'll fix it up when applying - just something to think about
in the future.

You can also set your name in .git/config or .gitconfig and then it'll be
correct automagically.

> The GHCB_MSR_VMPL_REQ_LEVEL macro lacked parentheses around the bitmask
> expression, causing the shift operation to bind too early. As a result,
> when switching to VMPL2 from VMPL1 (e.g., GHCB_MSR_VMPL_REQ_LEVEL(1)),
> incorrect values such as 0x000000016 were generated instead of the intended
> 0x100000016.
> 
> Fixes the precedence issue by grouping the masked value before applying
> the shift.
> 
> Fixes: 34ff65901735 ("x86/sev: Use kernel provided SVSM Calling Areas")
> 
> Signed-off-by: Seongman Lee <augustus92@kaist.ac.kr>
> ---
>  arch/x86/include/asm/sev-common.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/x86/include/asm/sev-common.h b/arch/x86/include/asm/sev-common.h
> index acb85b934..0020d77a0 100644
> --- a/arch/x86/include/asm/sev-common.h
> +++ b/arch/x86/include/asm/sev-common.h
> @@ -116,7 +116,7 @@ enum psc_op {
>  #define GHCB_MSR_VMPL_REQ		0x016
>  #define GHCB_MSR_VMPL_REQ_LEVEL(v)			\
>  	/* GHCBData[39:32] */				\
> -	(((u64)(v) & GENMASK_ULL(7, 0) << 32) |		\
> +	((((u64)(v) & GENMASK_ULL(7, 0)) << 32) |	\
>  	/* GHCBDdata[11:0] */				\
>  	GHCB_MSR_VMPL_REQ)
>  
> -- 

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
