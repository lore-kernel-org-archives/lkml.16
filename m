Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BAB20E6EB
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 12:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747657582; cv=none; b=S/oLwDGIpol6sHsJu74pYvKrWHlR1wJ6ViwTmPa2hX30ZDG5uptaqkgN609cuxuiLeMFgVM1TfsWpFVlVAZth8JhsxeAfgFnJ+LJ9col5kFPK5q6tqqJX/pk6bdOngKeZCz9k0iR8N9cO7RFdzD81VuLBGHjTO9Jye+9K5MRxYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747657582; c=relaxed/simple;
	bh=/eR6f0OxRQOAxe3FahYCD0wNAlMR1rG6wi6YpOL+VB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CHv4pcyFRaUAH60pI+iG2VDDo+sNg1R9vMf3oxLNAS9ULGyvJKL6tt1yhvia0IPVUPg/B954QZ+mO/cpqWjVao+AvJ6u45Np3ua4RN729pheLyc+D5DyBMLPWaeM0D0NiGIOR0NIqT4hsSFgHb41as5HJQxQ9CoXWGa9uI7CVuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: /ibWzKEISmuKeOSAk7cU6A==
X-CSE-MsgGUID: H8oeOC3gQ+6FMLKaFX4QMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="37172309"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="37172309"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 05:26:20 -0700
X-CSE-ConnectionGUID: ggfXUXG7QXCOnmP8+3KCvg==
X-CSE-MsgGUID: NxZ0eqcAR2OVQAfwNnaniA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="144240184"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 05:26:16 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andy@kernel.org>)
	id 1uGzZN-0000000322O-2KGN;
	Mon, 19 May 2025 15:26:13 +0300
Date: Mon, 19 May 2025 15:26:13 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>,
	Borislav Petkov <bp@alien8.de>, Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Kees Cook <keescook@chromium.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: Re: [PATCH 07/32] x86/boot/e820: Print out sizes of E820 memory
 ranges
Message-ID: <aCsjZW15Wh2lRC1q@smile.fi.intel.com>
References: <20250515120549.2820541-1-mingo@kernel.org>
 <20250515120549.2820541-8-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515120549.2820541-8-mingo@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, May 15, 2025 at 02:05:23PM +0200, Ingo Molnar wrote:
> Before:
> 
>         BIOS-provided physical RAM map:
>         BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] usable
>         BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff] reserved
>         BIOS-e820: [mem 0x00000000000f0000-0x00000000000fffff] reserved
>         BIOS-e820: [mem 0x0000000000100000-0x000000007ffdbfff] usable
>         BIOS-e820: [mem 0x000000007ffdc000-0x000000007fffffff] reserved
>         BIOS-e820: [mem 0x00000000b0000000-0x00000000bfffffff] reserved
>         BIOS-e820: [mem 0x00000000fed1c000-0x00000000fed1ffff] reserved
>         BIOS-e820: [mem 0x00000000feffc000-0x00000000feffffff] reserved
>         BIOS-e820: [mem 0x00000000fffc0000-0x00000000ffffffff] reserved
>         BIOS-e820: [mem 0x000000fd00000000-0x000000ffffffffff] reserved
> 
> After:
> 
> 	BIOS-provided physical RAM map:
> 	BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff]  639   KB kernel usable RAM
> 	BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff]    1   KB reserved
> 	BIOS-e820: [gap 0x00000000000a0000-0x00000000000effff]  320   KB ...
> 	BIOS-e820: [mem 0x00000000000f0000-0x00000000000fffff]   64   KB reserved
> 	BIOS-e820: [mem 0x0000000000100000-0x000000007ffdbfff]    1.9 GB kernel usable RAM
> 	BIOS-e820: [mem 0x000000007ffdc000-0x000000007fffffff]  144   KB reserved
> 	BIOS-e820: [gap 0x0000000080000000-0x00000000afffffff]  768   MB ...
> 	BIOS-e820: [mem 0x00000000b0000000-0x00000000bfffffff]  256   MB reserved
> 	BIOS-e820: [gap 0x00000000c0000000-0x00000000fed1bfff] 1005.1 MB ...
> 	BIOS-e820: [mem 0x00000000fed1c000-0x00000000fed1ffff]   16   KB reserved
> 	BIOS-e820: [gap 0x00000000fed20000-0x00000000feffbfff]    2.8 MB ...
> 	BIOS-e820: [mem 0x00000000feffc000-0x00000000feffffff]   16   KB reserved
> 	BIOS-e820: [gap 0x00000000ff000000-0x00000000fffbffff]   15.7 MB ...
> 	BIOS-e820: [mem 0x00000000fffc0000-0x00000000ffffffff]  256   KB reserved
> 	BIOS-e820: [gap 0x0000000100000000-0x000000fcffffffff] 1008   GB ...
> 	BIOS-e820: [mem 0x000000fd00000000-0x000000ffffffffff]   12   GB reserved
> 
> Note how a 1-digit precision field is printed out if a range is
> fractional in its largest-enclosing natural size unit.
> 
> So the "256 MB" and "12 GB" fields above denote exactly 256 MB and
> 12 GB regions, while "1.9 GB" signals the region's fractional nature
> and it being just below 2GB.
> 
> Printing E820 maps with such details visualizes 'weird' ranges
> at a glance, and gives users a better understanding of how
> large the various ranges are, without having to perform hexadecimal
> subtraction in their minds.

Returning to the v1 discussion for sring_get_size(). Looking at its code
it seems to me that you haven't tried to use it. It should give no .0 for
the exact numbers. If it's not the case, please confirm that we have a
bug/feature. If it's documented (read: we have a test case), then we would
need an additional flag to avoid this behaviour for your case. No need
to reinvent a wheel here.

-- 
With Best Regards,
Andy Shevchenko


