Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442CF18DB36
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 15:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743694898; cv=none; b=kT3Hyt0r1s1o5b16XZUkd9CTjkriuWLyEVsV1J4wuwNnvFPT5UZIfm54ECVjNEbTewWQUR0jtkKPxH4kMfJ/VQBAHDJDD80ywHJwyeHxFzlG89g3p1HyhIpvt4qTQjHfuv72rh0FjMh8CaDc1gYWXvHB3Wdrn1ufJ8+MQY+GnvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743694898; c=relaxed/simple;
	bh=xcukwwqhDfJieZETAY0kTlbjmlmGEsg3Rvg8ss6Sgrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X6s7KMLRxbdWsMYEQU5iryo8CmSPwBI2G+wHRMZlSGCBJ2Vx3AGk8lTH5S/0hMGIORLzl0tzf7srpMmxGqjO/AxskF6UU8SQH31QEcv80hjzMwHo8E8KC7Vt4oXZirGQFjHHQwsuAGPrmqPCF8KZu22i3Ui6F9fubEhXFl5z8lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IfU8UFx/; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IfU8UFx/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743694896; x=1775230896;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xcukwwqhDfJieZETAY0kTlbjmlmGEsg3Rvg8ss6Sgrw=;
  b=IfU8UFx/AxRAoIhrNfkwIa2zU8YnTq8AJW7aCR1pUanqSlg0sQg+96Ah
   pncFM68rsRnKFJ4nCuCxNnYPMyanHB0ZZ/CflrmVMR1MlOR8+IjPOZrxv
   TdP4hb73gS+TUIqL1HCmcCh96fwP0RsfqT8vO7fnpXW4CnCOP+sYlG129
   RH5/V4rNs1hVWa3lH1MhPXl2uOMJXaIe0FUN/cNgDVHrzWIH9XEXiP8WQ
   OTNUnJjSUM3ZUEZncLxc7YNAEglJ75kKFBRyuLX8iIuI7/7M5A8RhP9D9
   tNyjGtUUIHFTw6ryhWW6TQdrFNiPdDLM7TEnXuvTdOdqhjv5aUeN/xq7K
   Q==;
X-CSE-ConnectionGUID: MzqTkV8uR2qLW0QJtILfoQ==
X-CSE-MsgGUID: ev81/5VbSBi5UNVzNnYTTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="48905385"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="48905385"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 08:41:34 -0700
X-CSE-ConnectionGUID: k0M6nDAuSF6gLwdPz5UjCA==
X-CSE-MsgGUID: Mw//yhTfSJGKkgLWHYULlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="132026236"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 08:41:33 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1u0Mh7-00000008r1n-0RJY;
	Thu, 03 Apr 2025 18:41:29 +0300
Date: Thu, 3 Apr 2025 18:41:28 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: Uros Bizjak <ubizjak@gmail.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH -tip 2/4] x86/idle: Use MONITOR and MWAIT mnemonics in
 <asm/mwait.h>
Message-ID: <Z-6sKELOFl9d8KVe@smile.fi.intel.com>
References: <20250402180827.3762-1-ubizjak@gmail.com>
 <20250402180827.3762-2-ubizjak@gmail.com>
 <Z-6pDGR0pQavVQfq@black.fi.intel.com>
 <Z-6poX1TFKLKn4mB@black.fi.intel.com>
 <Z-6qZP00cj_K7x-_@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-6qZP00cj_K7x-_@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Apr 03, 2025 at 05:33:56PM +0200, Ingo Molnar wrote:
> * Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
> > On Thu, Apr 03, 2025 at 06:28:13PM +0300, Andy Shevchenko wrote:
> > > On Wed, Apr 02, 2025 at 08:08:06PM +0200, Uros Bizjak wrote:

...

> > > > No functional change intended.
> > > 
> > > Hmm... Is it only me who gets these, please?
> > > 
> > > In file included from acpi/cstate.c:18:
> > > asm/mwait.h:30:15: error: invalid operand for instruction
> > >    30 |         asm volatile("monitor %0, %1, %2" :: "a" (eax), "c" (ecx), "d" (edx));
> > >       |                      ^
> > > <inline asm>:1:16: note: instantiated into assembly here
> > >     1 |         monitor %rax, %ecx, %edx
> > >       |                       ^~~~~
> > > In file included from acpi/cstate.c:18:
> > > asm/mwait.h:95:15: error: instruction requires: Not 64-bit mode
> > >    95 |         asm volatile("sti; mwait %0, %1" :: "a" (eax), "c" (ecx));
> > >       |                      ^
> > > <inline asm>:1:7: note: instantiated into assembly here
> > >     1 |         sti; mwait %eax, %ecx
> > >       |              ^
> > 
> > FWIW, revert fixes the issue.
> 
> All gone already, tomorrow's -next should be fine.

Thanks!

-- 
With Best Regards,
Andy Shevchenko


