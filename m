Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A705C21ABBF
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 09:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747386794; cv=none; b=LfLfVHCZHBoFlx41wxHkNFFcM7gadVb7AQ9ePOZAonSic1nh+BfkROD8vTZg1UNH6zrX3hzl+D1g+C8y4/jDz617EdZg3NCk2/lGqWEDncRaEloa4G+44ZVNGqa0JE/QaCvf1AnGRIeq+t7+XCaoS/rCYzsolBGI20dMoNQkrQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747386794; c=relaxed/simple;
	bh=ksekMZVhPXdIuET0lg2g9cXAvBNY/5XmvEQhXStTji0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e3xmtKSFOm6ixp7jYjKEub3ScmEZ4PVvtQK2A/EK42KsH4C+xGlu9+p+mfRPFawlnBZ4H3/xwGASfS6/x2cFuDHgl05xS848Si37amgGH4yLwkrrM8PTh294neouCYKWO28jjzi6rIGpuMjcL0Y1lo0PdtpYoLKAEUoYR/A9OY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
X-CSE-ConnectionGUID: 978PjgOEQTOin37xaoX0Lg==
X-CSE-MsgGUID: Lmt7C9DnQBaRvgW9/vOBeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="71856940"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="71856940"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 02:13:12 -0700
X-CSE-ConnectionGUID: Y87Srr0sRye6sqqtksERhw==
X-CSE-MsgGUID: QazlszgLTlWhAADhp7qgHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="142644054"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 02:13:04 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andy.shevchenko@gmail.com>)
	id 1uFr7l-000000025sp-1nBT;
	Fri, 16 May 2025 12:13:01 +0300
Date: Fri, 16 May 2025 12:13:01 +0300
From: Andy Shevchenko <andy.shevchenko@gmail.com>
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
Subject: Re: [PATCH 05/29] x86/boot/e820: Print gaps in the E820 table
Message-ID: <aCcBnWbfKalvndCI@smile.fi.intel.com>
References: <20250421185210.3372306-1-mingo@kernel.org>
 <20250421185210.3372306-6-mingo@kernel.org>
 <aAc6aj5FVMkwDo06@surfacebook.localdomain>
 <aCXBvRe6PrY_zlvU@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCXBvRe6PrY_zlvU@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, May 15, 2025 at 12:28:13PM +0200, Ingo Molnar wrote:
> * Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > Mon, Apr 21, 2025 at 08:51:45PM +0200, Ingo Molnar kirjoitti:

...

> > > +		u64 range_start, range_end;
> > 
> > struct range (from range.h) and...
> 
> Yeah, using those primitives makes sense, but right now the e820 code 
> isn't using them, and it's better to have similar & unified range 
> handling code patterns.
> 
> In principle I wouldn't be opposed to patches that convert the e820 
> code to <linux/range.h> types.

Okay, perhaps a separate cleanup in the future. Not sure if I will have time,
but let's see...

...

> > > +		if (range_start > range_end_prev) {
> > > +			pr_info("%s: [gap %#018Lx-%#018Lx]\n",
> > > +				who,
> > > +				range_end_prev,
> > > +				range_start-1);
> > 
> > %pra
> 
> This would be part of any <linux/range.h> conversion patches.
> 
> > with who mentioned the "gap"?
> 
> Not sure I understand?

With the range.h in place and the mentioned specifier, the above will be like

BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] usable
BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff] reserved
BIOS-e820: [range 0x00000000000a0000-0x00000000000effff] gap
BIOS-e820: [mem 0x00000000000f0000-0x00000000000fffff] reserved

-- 
With Best Regards,
Andy Shevchenko


