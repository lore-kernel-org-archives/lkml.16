Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D17C28FF
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 08:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746953749; cv=none; b=cHKnTgd50re/oIOT9GKsKvHTm79rHnryykSnoV6IJ3/t/XXgOvdTuDh+qaoB3mqyDm4YFUV4i8j/mbxYY308/2++zDpxIRGfL9KvyM7Axwpn0PDNQ3ADKdRD0kRABsQiv2BJtxf66ZkSDigoCVQ1SbndtVs1vqD/3uX3WEo3s4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746953749; c=relaxed/simple;
	bh=YeSgjSVqJ2rI7xgAvby/b3asBcQ5Une5Xh2zKLvCKhA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hpdA8T2899xk0oCx3qtBjCtywhWVlpB0skiFq1kiys+22EbUrJgD/zt91XPv4KEYeGOpvIFQfQwu97Gn61dR35BhqO/P9WJoT1lFnB831tKmMeqsFou1thhHQkF2ruMps9BVnlQaIqbdj/7QpDN54fj7mQSC3FYJeB98nFpnurQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=eK4FiM62; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="eK4FiM62"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 2EFD840E023B;
	Sun, 11 May 2025 08:55:37 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id FHbRGwQaV2OU; Sun, 11 May 2025 08:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1746953731; bh=sizVZE4DrN4UnKLnyZ+fPRU89PwmAombH0k+F9AIJHk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eK4FiM62hz+l9S6VTOyNklvtCX0PlcufbAKI+ha6EYLrC6cm4Yir/YCh9rPhTBDab
	 E2Zp2wLV/1yTAaiQ8HjjuVuZewrx9s7T6AjuhdI8BvjKFaoNuLo9pM6KSmXEz9CrEt
	 1VBGmX/vRav0brSI1qDxKfbgYnTa7WRmQXsNyCMcWG2PAIzM30bpz0s3HTkqGdHiiO
	 M1a7Cx/lHzNFcB7I8J03H73KtSeBvweqUdK0W6kUw3WtGweuEP6+dGCdPVKFToH4dl
	 sXzn6K9lMu/o+Zhdl37ir9lAYsLv/I6YisyDvfZ5CgbRBLF3MeJAFKApkAPGeqsFlo
	 GDQiOBDNcpsfzaLCB2zbXDbEn4JZEIlOcB5wDasSRKNcDA9JYJHUBsi1TSYnWQ/NQj
	 grIhgn6zwksKJmwAvcDwswyxL0rDDWRNu/PrzCyiJU2tLIkhGqO9icEX1LBhyMFBt8
	 TL9tD/aL0xhlvPJOaefpQtAtAYN6/4L/HV0IAODJC59EtQk6dKTIoPk50akRRIBZIG
	 DmbdIGmAFgVjH7MYHUSdW2ydUZx8oFTg0ebH/q+fRYsOPO3EFx5hvHm44XMyXWUv/f
	 DfpExquthQo8JU6MEEC/lXRX1NyWdJYuBDjVvqHo7H2XTqI+qeXjKLgg8AYgWIV3X7
	 qP5lcVciP7iwr7XoQFXIkDxU=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 0CC9740E0192;
	Sun, 11 May 2025 08:55:22 +0000 (UTC)
Date: Sun, 11 May 2025 10:55:13 +0200
From: Borislav Petkov <bp@alien8.de>
To: Seongmanlee <cloudlee1719@gmail.com>,
	Tom Lendacky <thomas.lendacky@amd.com>
Cc: x86@kernel.org, leonardo-leecaprio <augustus92@kaist.ac.kr>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] x86/sev: Fix operator precedence in
 GHCB_MSR_VMPL_REQ_LEVEL macro
Message-ID: <20250511085513.GAaCBl8fIwQb7BpjNv@fat_crate.local>
References: <20250510162726.90681-1-cloudlee1719@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250510162726.90681-1-cloudlee1719@gmail.com>

+ Tom.

On Sun, May 11, 2025 at 01:27:24AM +0900, Seongmanlee wrote:
> From: leonardo-leecaprio <augustus92@kaist.ac.kr>
> 
> The GHCB_MSR_VMPL_REQ_LEVEL macro lacked parentheses around the bitmask
> expression, causing the shift operation to bind too early. As a result,
> when switching to VMPL2 from VMPL1 (e.g., GHCB_MSR_VMPL_REQ_LEVEL(1)),
> incorrect values such as 0x000000016 were generated instead of the intended
> 0x100000016.
> 
> This patch fixes the precedence issue by grouping the masked value

Avoid having "This patch" or "This commit" in the commit message. It is
tautologically useless.

Also, do

$ git grep 'This patch' Documentation/process

for more details.

> before applying the shift.
> 

Fixes: 34ff65901735 ("x86/sev: Use kernel provided SVSM Calling Areas")

> Signed-off-by: leonardo-leecaprio <augustus92@kaist.ac.kr>

Please use your real name.

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

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
