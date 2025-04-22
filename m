Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A463230273
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 07:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745305590; cv=none; b=hvFwX8wBx5Rp+AIIz/OUDNQ33ozPzLsUT/SUMPNaAJJJv4mbtcmpfzdIXTG99XuJMK0WfaJKMgsOBJSreeGKPAW4LjE3rkWTNWwkfLLHvZKQ0uiIc8w9kSkvJmXCeSLVFKu7JGAr0w+yA76UaRXqXHL8ykAAF3PhaNFFTUB9He0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745305590; c=relaxed/simple;
	bh=nKX/sv2aM8nB5vm2iXjyyUWyTpBPI7X1J5ID9/bKuJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QhJ5Y+Xdwlri70MNZq6zYA4jIOIWyUjuWlBkphsWkiumio6EqPP4rej6eqfWixPoytocsn2PIp1MZ9T48i4v5lj/O4HlWv7Ni0t90oPkGW5cs4yH+pSfT/fU+QYeWXwhDmyE2jAeokGUXpO4UN6ghOq+7RLe+oCrDm5tWnhWitI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HtOVoDnM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HtOVoDnM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FC46C4CEE9;
	Tue, 22 Apr 2025 07:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745305589;
	bh=nKX/sv2aM8nB5vm2iXjyyUWyTpBPI7X1J5ID9/bKuJI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HtOVoDnMC953b+2tA3VLtfeggSdzsjmWapDTwNw6xT3hEMmjc9HNFIXmQ//u+aC0h
	 9j/cHL3sGBxPKNRh4zZRKYC96lwpoxIr9mde71YcBvUOmJY9vEuq3QkrxR2XvmaR7P
	 KEEpFzEAC8cZodRazbebJcLV7c+wEH/sSgUfv3ZnvTc5cvzTz8pg+DqGPTqU7JFL0T
	 863FFG2ZWt9/Ybr9pQFgIZvgy2Xme8Ks8AEPdtwMHvJ+82ycrVSIMp7DhKM9PDCxuA
	 DMPeHeXze9lwXaWM6iiDfgpJtJ7OQP0Jca43zGaTRO6IQ4A05TB5q+0YNidf8WdrZ4
	 ZSZ45HSGNII9g==
Date: Tue, 22 Apr 2025 10:06:21 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Andy Shevchenko <andy@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Juergen Gross <jgross@suse.com>, "H . Peter Anvin" <hpa@zytor.com>,
	Kees Cook <keescook@chromium.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: Re: [PATCH 08/29] x86/boot/e820: Print E820_TYPE_RAM entries as ...
 RAM entries
Message-ID: <aAc_7Zm1PqeRmKMW@kernel.org>
References: <20250421185210.3372306-1-mingo@kernel.org>
 <20250421185210.3372306-9-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421185210.3372306-9-mingo@kernel.org>

On Mon, Apr 21, 2025 at 08:51:48PM +0200, Ingo Molnar wrote:
> So it is a bit weird that the actual RAM entries of the E820 table
> are not actually called RAM, but 'usable':
> 
> 	BIOS-e820: [mem 0x0000000000100000-0x000000007ffdbfff]    1.9 GB usable
> 
> 'usable' is pretty passive-aggressive in that context and ambiguous,
> most E820 entries denote 'usable' address ranges - reserved ranges
> may be used by devices, or the platform.
> 
> Clarify and disambiguate this by making the boot log entry
> explicitly say 'kernel usable RAM':
> 
> 	BIOS-e820: [mem 0x0000000000100000-0x000000007ffdbfff]    1.9 GB kernel usable RAM
> 
> Signed-off-by: Ingo Molnar <mingo@kernel.org>
> Cc: Andy Shevchenko <andy@kernel.org>
> Cc: Arnd Bergmann <arnd@kernel.org>
> Cc: David Woodhouse <dwmw@amazon.co.uk>
> Cc: H. Peter Anvin <hpa@zytor.com>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  arch/x86/kernel/e820.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
> index 8ee89962fcbf..99f997ae88dc 100644
> --- a/arch/x86/kernel/e820.c
> +++ b/arch/x86/kernel/e820.c
> @@ -187,7 +187,7 @@ void __init e820__range_add(u64 start, u64 size, enum e820_type type)
>  static void __init e820_print_type(enum e820_type type)
>  {
>  	switch (type) {
> -	case E820_TYPE_RAM:		pr_cont(" usable");			break;
> +	case E820_TYPE_RAM:		pr_cont(" kernel usable RAM");		break;
>  	case E820_TYPE_RESERVED:	pr_cont(" reserved");			break;
>  	case E820_TYPE_SOFT_RESERVED:	pr_cont(" soft reserved");		break;
>  	case E820_TYPE_ACPI:		pr_cont(" ACPI data");			break;

We have e820_type_to_string(), IMO the whole switch here can be replaced by

	pr_cont(" %s", e820_type_to_string(type));

> -- 
> 2.45.2
> 

-- 
Sincerely yours,
Mike.
