Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDBE2641CC;
	Tue,  8 Apr 2025 08:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744101010; cv=none; b=GsU5pU0Bu2NTwV9MTNflv2+XQLXdTXJOoiOVlCO+71UZOBvYljxr5Oy2h+4cZqfmcx04s2AxZ7wR4qz0TvPZeNrTTs6ZvCGenafmacPKTYwIbVjR1c+lb9Zfgv2l1i0PjE6vRbOz5AObF6S/01396XmyUJsSRu96HbP/dayDPLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744101010; c=relaxed/simple;
	bh=mtQ0cgbg65B3Y14wimzpCJkbW0UL7A7exIM5eb44PFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j3ZPogUyrL4pHHI0EbNu8cWAllEo4NgZdaDfgGUQ34F8RbnbOD+Kwvng38WZT0xk7GHBL28T2PqNmXnK8F5t+R99/W/QDZ7vx3ndjg1StpicA3wUTzksxVFFG03edprq9CbpV02gq7Z79RS0WwoSiUmcGdnXZRnV6JklzpHPfVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TbjRdyZC; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TbjRdyZC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744101008; x=1775637008;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mtQ0cgbg65B3Y14wimzpCJkbW0UL7A7exIM5eb44PFI=;
  b=TbjRdyZCO+n53ndhyWeWREL1PoDz9cY+gtH7rczLjTkhv/uXDYTUQzBr
   K10E6JN4X24uUOZdsuR4W9bUAYZF9mT8UJD5NLIFYNT17ZedIJbJjPI3J
   IU96tJjNLtuuMVFs0gKPc5tqm2A889RYt2zL0ef7WfgrWsV8qPiB5Q/RM
   QFX36dGE2xoGDVKAa8PpBeG0g3/BQ4l6IRSkGBtipR4JIpELyogXV+vVf
   MjU8PHyNBuKX5B7U937l+TTM5knLLFJcZycvzEh9WM4pUCpz+jf8VV8yk
   uuEm0RAA/+l2B5p8IaPSVlAXv8ZVuFa0ti0MzoaZFH/Lpp4hCLu4Mv+w0
   w==;
X-CSE-ConnectionGUID: FJ2ai5R2QUutrbg9K9Flhw==
X-CSE-MsgGUID: OYsK20KaS2mR2LDSwSIC6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="44770229"
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; 
   d="scan'208";a="44770229"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 01:30:07 -0700
X-CSE-ConnectionGUID: 80DLV24cQKSaJb5P60LKlA==
X-CSE-MsgGUID: ntoy4gz8TbKZqevi3o7V2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; 
   d="scan'208";a="133402993"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 01:30:04 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1u24LI-0000000AL5R-1HaE;
	Tue, 08 Apr 2025 11:30:00 +0300
Date: Tue, 8 Apr 2025 11:30:00 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Denis Mukhin <dmkhn@proton.me>
Cc: Denis Mukhin <dmukhin@ford.com>, Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] x86/early_printk: add MMIO-based UARTs
Message-ID: <Z_TeiDVh50u7OhIw@smile.fi.intel.com>
References: <20250324-earlyprintk-v3-1-aee7421dc469@ford.com>
 <Z_P_nWrl4JQJVy2c@black.fi.intel.com>
 <vCbvBjUt9kPZhYP0tXAoVKrIn5hk5ON-HEqi2OjnCECThGJ73vh7S4qAKspAlxtgBAHFv1Sc_k6Hmdeq_nYXReITCt2FNRy1wWZR-udke9c=@proton.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <vCbvBjUt9kPZhYP0tXAoVKrIn5hk5ON-HEqi2OjnCECThGJ73vh7S4qAKspAlxtgBAHFv1Sc_k6Hmdeq_nYXReITCt2FNRy1wWZR-udke9c=@proton.me>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Apr 07, 2025 at 11:04:42PM +0000, Denis Mukhin wrote:
> On Monday, April 7th, 2025 at 9:38 AM, Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
> > On Mon, Mar 24, 2025 at 05:55:40PM -0700, Denis Mukhin wrote:

> > > During the bring-up of an x86 board, the kernel was crashing before
> > > reaching the platform's console driver because of a bug in the firmware,
> > > leaving no trace of the boot progress.
> > > 
> > > It was discovered that the only available method to debug the kernel
> > > boot process was via the platform's MMIO-based UART, as the board lacked
> > > an I/O port-based UART, PCI UART, or functional video output.
> > > 
> > > Then it turned out that earlyprintk= does not have a knob to configure
> > > the MMIO-mapped UART.
> > > 
> > > Extend the early printk facility to support platform MMIO-based UARTs
> > > on x86 systems, enabling debugging during the system bring-up phase.
> > > 
> > > The command line syntax to enable platform MMIO-based UART is:
> > > earlyprintk=mmio,membase[,{nocfg|baudrate}][,keep]
> > > 
> > > Note, the change does not integrate MMIO-based UART support to:
> > > arch/x86/boot/early_serial_console.c
> > > 
> > > Also, update kernel parameters documentation with the new syntax and
> > > add missing 'nocfg' setting to PCI serial cards description.
> > 
> > Just for your information: Have you seen this rather old series of mine?
> > 
> > https://bitbucket.org/andy-shev/linux/commits/branch/topic%2Fx86%2Fboot-earlyprintk
> 
> This is a nice cleanup!
> Thanks for sharing.
> 
> Sorry, I haven't seen the series above, I had to write a patch (which was months ago).
> It's just I could not post it on the mailing list until recently.

No problem. Can you look at
https://lore.kernel.org/r/20250407172214.792745-1-andriy.shevchenko@linux.intel.com
? I forgot to Cc you and that is an important fix.

-- 
With Best Regards,
Andy Shevchenko


