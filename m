Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8E74A18
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 15:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745768282; cv=none; b=PY8fkYVqj0Yf3M4FwuCIQhQ+Z6leYXTA6p8BotOcLjDWm5r9X7qH0fftaCjYHEQt1WJ6TqlCj3xCisTrjPm1tC1Dec61D/HlM2CPomus34+Hg1vkfnHoi96dWDW0dVaI15UFhAaWrYXBFTFERcdCd6YkR66TVOKNvQaPvX8DzKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745768282; c=relaxed/simple;
	bh=tbphF5l2KkhDIxo/NfirpGYFA6/7r4pGIx2p56844JU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e8BaFJskD1a0BqRnpOGOddTzDv70GbuCAUcjyBZp4ucm1Mp4XF0aA/5+YMtZwMA2BeHJH5iYP/AsaeD/tnrHmaomlSWQdT6oaAz0geORNqr/cz29uC5bGRKAluTVMi8020kd589xXWkfKy0RKowHEEVsZFc6D1O/3CQpaIWi3L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=MocnW+yZ; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="MocnW+yZ"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id A142E40E015D;
	Sun, 27 Apr 2025 15:37:56 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id t_lgqNvFVj4p; Sun, 27 Apr 2025 15:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1745768270; bh=mghQm3RtsAGYlVy0UOmjxEVB7dmYe/krTlR13kIjZW4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MocnW+yZV1t3HRL/EzWodx5IZddCmvfAntxdloIC1ur1N8h3NOph8RX/s6LaqHmWH
	 FJXmo+2blWmE6wTTsakPumHY5UG69+EcB/7Wj54O4AAYJ1UosQFt0bwsF8O2F/XNiu
	 V8AxPCWxo2DD5bNiWmdYXPittSCywaFT95PXIMUCPOa1jBZXyZeJ3UIjNppPfANe+s
	 ZoaQkoAYyZjS6P6uexMlDzO23PIBChur41D64qqiN2ZYES3qgP5vYg6OCXTiNbN+lb
	 bVXcllfoH98O5f7vSVSjigF+Chi4kmk724T0s9JepICz+kDne72SRIV6FXXwZwh7di
	 UK+0C/V1a0rH82DQ8mbEvw6f60XbSJ7rk0GiUJ/eWimJoIv4toOuLHBTauaFALMq30
	 zEsRTwA/9BwzYZclNp1+nEAnjzogCR09lx9mslGVH4dXn0eBrqX5eEdwEye+99KBSL
	 k80PyJscB7bi//e4OvU311l5FzKK9+hxt69hixhBhR1n3QzKqe5mBTN6ZmqR0vwCIl
	 7ZiJtn1HUVVk9X8DZsxw7iIEItDI0NrjdIxskLx36nkKsZQgHIw5i9BO5pyr11csgP
	 5LPEfO2S3YxFX7aZiiL+QOkfVNQqpYeyt75qLOJ2BNQXC4wavOFOkQnB4KwcXOgl/s
	 URi4PABHiUXtx/E8HYERHL84=
Received: from rn.tnic (unknown [IPv6:2a02:3038:263:e72f:8736:46f5:3e28:41ad])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 60C4040E015E;
	Sun, 27 Apr 2025 15:37:39 +0000 (UTC)
Date: Sun, 27 Apr 2025 17:38:37 +0200
From: Borislav Petkov <bp@alien8.de>
To: David Kaplan <david.kaplan@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 09/16] x86/bugs: Allow retbleed=stuff only on Intel
Message-ID: <20250427153837.GBaA5Pfb-eV_LznB90@renoirsky.local>
References: <20250418161721.1855190-1-david.kaplan@amd.com>
 <20250418161721.1855190-10-david.kaplan@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250418161721.1855190-10-david.kaplan@amd.com>

On Fri, Apr 18, 2025 at 11:17:14AM -0500, David Kaplan wrote:
> The retbleed=stuff mitigation is only applicable for Intel CPUs affected
> by retbleed.  If this option is selected for another vendor, print a
> warning and fall back to the AUTO option.
> 
> Signed-off-by: David Kaplan <david.kaplan@amd.com>
> ---
>  arch/x86/kernel/cpu/bugs.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
> index 72e04938fdcb..84d3f6b3d1eb 100644
> --- a/arch/x86/kernel/cpu/bugs.c
> +++ b/arch/x86/kernel/cpu/bugs.c
> @@ -1187,6 +1187,10 @@ static void __init retbleed_select_mitigation(void)
>  	case RETBLEED_CMD_STUFF:
>  		if (IS_ENABLED(CONFIG_MITIGATION_CALL_DEPTH_TRACKING) &&
>  		    spectre_v2_enabled == SPECTRE_V2_RETPOLINE) {
> +			if (boot_cpu_data.x86_vendor != X86_VENDOR_INTEL) {
> +				pr_err("WARNING: retbleed=stuff only supported for Intel CPUs.\n");
> +				goto do_cmd_auto;
> +			}

Right, the reason it is possible to select this mitigation on other
vendors is purely to be able to experiment with the different mitigation
techniques.

But I've never considered that ability to be particularly useful - and
even if, if you wanna do that, you might as well hack the kernel too.

So yeah, I guess it is better to not allow non-sensical mitigations.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
