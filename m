Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CEFD18D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 09:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743587604; cv=none; b=rai8WUPDLAmT982lJKkNA5HsbYE0b2++3WdUloLWVTosD2HxC+vCwR4aZhFzNRZOoSrku4V37KHHxzix+ncsRzrMcrTaCOncAwDp1vAYFmFVTg8DxlrhVzLRh8vNMM1ttvyG7RmhJuXWK/PhJxAKPK8jijdcaa+pZysQbiVE5E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743587604; c=relaxed/simple;
	bh=a8jbYSieblgpF6s6DEnRtgdNYxcNNAfHFzsE1Dd9yYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E+2imWzzQwSfrzYT5o/BcvIrfTxoTUDLqWUcfXGqjGmWC8bxhc24URdEgu54G4zOIpl4Q/GPJ4SUlYmwQpikMwv9Qioj8cYdzfEqV1A+PFZks5Zjf50NUKj7I+5HJk5jj+n5bXbXofTskI00i5ztyHooYn0cHTa2zoUIWF6NAUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=XQ078uEQ; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="XQ078uEQ"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id E9E8340E0196;
	Wed,  2 Apr 2025 09:53:19 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id TD1FnaGsKzRz; Wed,  2 Apr 2025 09:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1743587594; bh=6nJNszVB+Xm3RI+OqKI6S7Lgnphdtn5/BeQiQBtGtPo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XQ078uEQXBWIsYmBoEo4vpmTCHSH2TpZ/kO/oZD7re85VrCG2AtGotCCI/pUXWb8z
	 Visoe8FVuXcdt2z5M7RL+cxrA4YJ8cY9PEIxCILEYAWxOkjEGQp50ahf0xSzdjGoDc
	 rcSfSZEd3nJsU8fkS/BjiAL2ITP1voq5xb9PR4MbDBUqKq596Nhx0EiolO/2Ph1lE6
	 P+1wbZ6iwOtAD6fH6s9YWIer269pIv/zTbYj0W95qM9t3n5RD2g8yES3ese+/uxE/6
	 ipmn/LQ8lcCNSnxNxnjrvwMFdDzdeiyCZV5Mvx9nq7mm/p0zs0/nOtjzQjOIkKsLwd
	 23meHEuE1IswFtAriEY0qQzS/embtEopkzvq5psh92TOeTVzmZHud7Lz3c7JdsCmg5
	 wKZ2poV/TNJPscyFBVHMdrc4Fogy+lFDv2QZiAquzDLgeBRSfdHlzOjyGndtIEJ9Av
	 6xJ4Cuv45cmpq0hFc6vZQfhNfn3gvXBckgssQ5sNZhcas338AlMVtgvyPmqyVGIGP1
	 spbjFV8uEbdxJHUZ+XZV6CLF1/xJaxaxmAQRbFu+aiomL7XMY17b7GtN6APPBs9NuB
	 4G35HYVW3nEZKtpNmwQKC/jt0iwPA3esZXOwt+VDmoEiZmSRm/nQGDDL/+eEVn/3+W
	 P20J7mUb0J0IRGopAItNc020=
Received: from zn.tnic (pd95303ce.dip0.t-ipconnect.de [217.83.3.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id AE34840E0219;
	Wed,  2 Apr 2025 09:53:07 +0000 (UTC)
Date: Wed, 2 Apr 2025 11:53:06 +0200
From: Borislav Petkov <bp@alien8.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: x86/idle: Remove barriers for X86_BUG_CLFLUSH_MONITOR
Message-ID: <20250402095306.GBZ-0JAkfivL09kG1F@fat_crate.local>
References: <20250402091017.1249019-1-andrew.cooper3@citrix.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250402091017.1249019-1-andrew.cooper3@citrix.com>

On Wed, Apr 02, 2025 at 10:10:17AM +0100, Andrew Cooper wrote:
> Commit 7e98b7192046 ("x86, idle: Use static_cpu_has() for CLFLUSH
> workaround, add barriers") adds barriers, justified with:
> 
>   ... and add memory barriers around it since the documentation is explicit
>   that CLFLUSH is only ordered with respect to MFENCE.
> 
> The SDM currently states:
> 
>   Executions of the CLFLUSH instruction are ordered with respect to each
>   other and with respect to writes, locked read-modify-write instructions,
>   and fence instructions[1].
> 
> With footnote 1 reading:
> 
>   Earlier versions of this manual specified that executions of the CLFLUSH
>   instruction were ordered only by the MFENCE instruction.  All processors
>   implementing the CLFLUSH instruction also order it relative to the other
>   operations enumerated above.
> 
> i.e. The SDM was incorrect at the time, and barriers should not have been
> inserted.  Double checking the original AAI65 errata (not available from
> intel.com any more) shows no mention of barriers either.
> 
> Additionally, drop the static_cpu_has_bug() and use a plain alternative.
> The workaround is a single instruction, with identical address setup to the
> MONITOR instruction.
> 
> Link: https://web.archive.org/web/20090219054841/http://download.intel.com/design/xeon/specupdt/32033601.pdf
> Fixes: 7e98b7192046 ("x86, idle: Use static_cpu_has() for CLFLUSH workaround, add barriers")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Thomas Gleixner <tglx@linutronix.de>
> CC: Ingo Molnar <mingo@redhat.com>
> CC: Borislav Petkov <bp@alien8.de>
> CC: Dave Hansen <dave.hansen@linux.intel.com>
> CC: x86@kernel.org
> CC: "H. Peter Anvin" <hpa@zytor.com>
> CC: linux-kernel@vger.kernel.org
> 
> diff --git a/arch/x86/include/asm/mwait.h b/arch/x86/include/asm/mwait.h
> index ce857ef54cf1..dff9e7d854ed 100644
> --- a/arch/x86/include/asm/mwait.h
> +++ b/arch/x86/include/asm/mwait.h
> @@ -116,13 +116,11 @@ static __always_inline void __sti_mwait(unsigned long eax, unsigned long ecx)
>  static __always_inline void mwait_idle_with_hints(unsigned long eax, unsigned long ecx)
>  {
>  	if (static_cpu_has_bug(X86_BUG_MONITOR) || !current_set_polling_and_test()) {
> -		if (static_cpu_has_bug(X86_BUG_CLFLUSH_MONITOR)) {
> -			mb();
> -			clflush((void *)&current_thread_info()->flags);
> -			mb();
> -		}
> +		const void *addr = &current_thread_info()->flags;
>  
> -		__monitor((void *)&current_thread_info()->flags, 0, 0);
> +		alternative_input("", "clflush (%[addr])", X86_BUG_CLFLUSH_MONITOR,
> +				  [addr] "a" (addr));
> +		__monitor(addr, 0, 0);
>  
>  		if (!need_resched()) {
>  			if (ecx & 1) {

LGTM.

Acked-by: Borislav Petkov (AMD) <bp@alien8.de>

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
