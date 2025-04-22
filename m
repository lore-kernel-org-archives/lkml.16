Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C5828F939
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 16:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745339846; cv=none; b=c+VJAw9JJsyMkkDlKBvXvyVFduqKwNZxD/RMj/wPZLw4Aw1IO91FCaua3JymJvWrbO3ZRGeAjAGZ5X6Xsc/2X26fBnnaYytBAIa28fjlrvLj+0S0EjC6am+N2PoEEvSxeJ4RI9FX84ZIWjs7iPSip+btTpxNP9DnScxWCxlFE6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745339846; c=relaxed/simple;
	bh=lCbZMyl6F+SXevcOPaDjtaskA+UHUSRXmM8ZA8czvL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y83gMAPZMR9Ibb8G3STEPSyzkLicfvtaKyBb/1Mn+1ryP9i/zUbU8aHDWC0/mhKGFtfjDyBZ2SLRXGCyc7jpXx+bPfcrwM/v9WFLzUU12iHmD3zIYRy8GckK7f/3tkhGdh/+iyrx4vTI/UFSkVMM8gzAh9hgoFt3PEVIcKdaZ8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: xnF8Ub61SCm1IisdnWHgiw==
X-CSE-MsgGUID: i4dlPvQHSnSEsUtxNqCIsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="47008914"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; 
   d="scan'208";a="47008914"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 09:37:24 -0700
X-CSE-ConnectionGUID: KCYOBlvOQ2+4UkExtGiUrA==
X-CSE-MsgGUID: 7Gg39Xm1QxuI78KnQhknkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; 
   d="scan'208";a="169273318"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 09:37:21 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andy@kernel.org>)
	id 1u7GcX-0000000EmSG-2Koy;
	Tue, 22 Apr 2025 19:37:17 +0300
Date: Tue, 22 Apr 2025 19:37:17 +0300
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
Subject: Re: [PATCH 20/29] x86/boot/e820: Clean up
 e820__setup_pci_gap()/e820_search_gap() a bit
Message-ID: <aAfFvbgRONT0OLmj@smile.fi.intel.com>
References: <20250421185210.3372306-1-mingo@kernel.org>
 <20250421185210.3372306-21-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421185210.3372306-21-mingo@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Apr 21, 2025 at 08:52:00PM +0200, Ingo Molnar wrote:
> Use a bit more readable variable names, we haven't run out of
> underscore characters in the kernel yet.

Size notes:

> +	gap_size = 0x400000;

SZ_4M ?

...

> +		gap_start = (max_pfn << PAGE_SHIFT) + 1024*1024;

SZ_1M ?

-- 
With Best Regards,
Andy Shevchenko


