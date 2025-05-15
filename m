Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09E821D00E;
	Thu, 15 May 2025 16:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747326361; cv=none; b=reAYFs70qheO/OwKRrsaKykR0iMVzmZ+7Zx4llfU3LkTi0a6Xnc4pjPpgAhuwpEH3+YrZ/3YGS86dnH2T88TP8DOS2yazo9/0mjdEoOfbVbjGbtKMxq2L7f/BPV6G6wXxXuNcRRKewjLqAYt2dRuZuG/fmsmtSBPfuPbcrkh6II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747326361; c=relaxed/simple;
	bh=AKFreQe3sAxdmAZMRpWWMXP43sKQJoM22Ztyza9GE/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fD9uJ1ZUxbLzIKgmULSus2nuoxcAI8jYBKOsV+I1yrJ2eepf6qwWlN+Zfw19e1cVSOqqpCUZ8ENQ6qfc76Bb1IspBX08f7I0zO+P/soE079heuaFJfqxG2YLFwWkXqE7+am2UxLA5BFqf+yo+kd7iZ46g+BqyofsqzO52u1+lT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YCMX+e7Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YCMX+e7Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7371C4CEE7;
	Thu, 15 May 2025 16:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747326361;
	bh=AKFreQe3sAxdmAZMRpWWMXP43sKQJoM22Ztyza9GE/k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YCMX+e7YdViwfW8/XRIC7jM4To1R9itEZdbGnvHOJvoWR6eNUzT7sSmitUSvFGwbu
	 UmzUVB6jIFeBYpMU7ttBZiEHQ0zpqLNAqPWtRG12z1yVHY4SVUk++2v4rJGrWXZBIo
	 SPAOloZRaRsghAcFU5hOBVmZlutqz53Y8I8CcmeKMcfV5GJj7bXtbHA8K+MIw5fR1L
	 FT2b6J+BRVPWqFqY2GOFh1wU/A4IBaVwQoik/nhByO+Uj7/ODEv1DkOIsPrMCQaqN+
	 LGI3+Od7vkAGX30jQ5CAnD0iOI7tzyBwtr1LUJGROsKpF76PGRYocvxiBxKA4Xrwg1
	 HLgCnYeD4RgvQ==
Date: Thu, 15 May 2025 18:25:56 +0200
From: Ingo Molnar <mingo@kernel.org>
To: "Ahmed S. Darwish" <darwi@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 2/9] x86/cpuid: Set <asm/cpuid/api.h> as the main
 CPUID header
Message-ID: <aCYVlLgDNE4fs3yU@gmail.com>
References: <20250508150240.172915-1-darwi@linutronix.de>
 <20250508150240.172915-3-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508150240.172915-3-darwi@linutronix.de>


* Ahmed S. Darwish <darwi@linutronix.de> wrote:

> The main CPUID header <asm/cpuid.h> was originally a storefront for the
> headers:
> 
>     <asm/cpuid/api.h>
>     <asm/cpuid/leaf_0x2_api.h>
> 
> Now that the latter CPUID(0x2) header has been merged into the former,
> there is no practical difference between <asm/cpuid.h> and
> <asm/cpuid/api.h>
> 
> Remove <asm/cpuid.h> and let all call-sites directly include
> <asm/cpuid/api.h>.
> 
> Suggested-by: Ingo Molnar <mingo@kernel.org>
> Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>

> diff --git a/arch/x86/include/asm/cpuid.h b/arch/x86/include/asm/cpuid.h
> deleted file mode 100644
> index d5749b25fa10..000000000000
> --- a/arch/x86/include/asm/cpuid.h
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -
> -#ifndef _ASM_X86_CPUID_H
> -#define _ASM_X86_CPUID_H
> -
> -#include <asm/cpuid/api.h>
> -
> -#endif /* _ASM_X86_CPUID_H */

Note that in the tip:x86/core commit I've applied today I've delayed 
this removal of <asm/cpuid.h>, in case there's something in -next that 
started using it. I've adjusted the changelog accordingly.

We can remove it later on, shortly after -rc1 or so.

Thanks,

	Ingo
