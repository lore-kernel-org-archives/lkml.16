Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207BF292B51
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 09:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751014967; cv=none; b=B7ufr9voDC8iwyTj2rf9477m84l4T3ToxoXK6FN+d3crLKivWZ6OA8CqdQtvsVr1B7G8qZVBkcqKZoIJIdyaVK/nop6HZB0HrLCbDTplT1hyv+Q8vQ7PnLjP/2LMtGIDJkFR6ezz2NW/9lASpLXiRTYFGdn5CkufNh53uEt7Op4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751014967; c=relaxed/simple;
	bh=NOeNUst4aqb6XWbyNCciAT3+m81vf6e1Uk8OTBoBk98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qvZHh3x48HO3ZaOVAsAEnSJnP4DIKbedo9zR3PuMNeaSEQmGZkoWDsH3Mniq5eOA3A+FGF/JXt4K85HtRGp2PMnFEyCntPv6MexgVriN78ncByLwWRidPTLlMX5JKP4fsv9kcU3hmpfxyChVlm5jSSXFA5mMK+lh2IWOPMORkys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MyrHe7/V; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MyrHe7/V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751014966; x=1782550966;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NOeNUst4aqb6XWbyNCciAT3+m81vf6e1Uk8OTBoBk98=;
  b=MyrHe7/VY89maHkP/byCQSJhI3atZOpFj8kwuCX2uB0tjZOaCMc0D2za
   9p+sI1YU01XhNuNkJpfqGv3infReoB2Hx61+3BpsHr+19p+f/6XdL/9xU
   mx0iuLIS38M+/diONWApuNSqiEaIVBTrtq3l2i5LcEGcD5UjsGP80TDXm
   sr0nSTiTtd/b90ypg9dQdYUZ5JDZPd/PZIGDb5seWhBwSyRgkxd9AVyeT
   ddWnUlZbO6yFTyMVVNDsSKbR253QWV2zMnQWQ/McA0akNdG0y+Z9SUrXs
   wHTuRb9MEUQw/mOxgUD6XyrxgSBMbT/7NlQRn2KCujUoWFDldpO9by4fd
   Q==;
X-CSE-ConnectionGUID: xjAZ8D4iT3COQpywOHSH0w==
X-CSE-MsgGUID: KKF4RdNxTJCOav06rDkR+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53421870"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="53421870"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 02:02:46 -0700
X-CSE-ConnectionGUID: m+Zx1QH0S7mxQYd4c3iScQ==
X-CSE-MsgGUID: fuI0lNsTQAaCbtG+u/Oemg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="152275456"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 02:02:43 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uV4ym-0000000AQt0-0125;
	Fri, 27 Jun 2025 12:02:40 +0300
Date: Fri, 27 Jun 2025 12:02:39 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v1 1/2] firmware: sysfb: Unorphan sysfb files
Message-ID: <aF5eL1o3WNo3Q7_p@smile.fi.intel.com>
References: <20250626172039.329052-1-andriy.shevchenko@linux.intel.com>
 <20250626172039.329052-2-andriy.shevchenko@linux.intel.com>
 <87ikkhd0uv.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ikkhd0uv.fsf@minerva.mail-host-address-is-not-set>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Jun 27, 2025 at 10:50:48AM +0200, Javier Martinez Canillas wrote:
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> writes:
> 
> > The commit d391c5827107 ("drivers/firmware: move x86 Generic
> > System Framebuffers support") moved some code to the common
> > folders and effectively orphaned it without any reason. Put
> > it back under DRM MISC record.
> 
> What do you mean that it was "orphaned without any reason" ? There were no
> regex matchs for the old file paths in MAINTAINERS either before that commit.

There were maintainers for that code before. The change in question dropped that.

[((bf44e8cecc03...))]$ scripts/get_maintainer.pl -f arch/x86/kernel/sysfb*
Thomas Gleixner <tglx@linutronix.de> (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT))
Ingo Molnar <mingo@redhat.com> (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT))
Borislav Petkov <bp@alien8.de> (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT))
x86@kernel.org (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT))
"H. Peter Anvin" <hpa@zytor.com> (reviewer:X86 ARCHITECTURE (32-BIT AND 64-BIT))
linux-kernel@vger.kernel.org (open list:X86 ARCHITECTURE (32-BIT AND 64-BIT))

[((d391c5827107...))]$ scripts/get_maintainer.pl -f drivers/firmware/sysfb*
linux-kernel@vger.kernel.org (open list)

See the difference?

...

> > +F:	drivers/firmware/sysfb*.c

> I would prefer these to be in the "DRM DRIVER FOR FIRMWARE FRAMEBUFFERS"
> entry instead of "DRM DRIVERS" since the former is what has most of the
> code for the sysfb infrastructure.

Then do it, please, fix the above.

-- 
With Best Regards,
Andy Shevchenko


