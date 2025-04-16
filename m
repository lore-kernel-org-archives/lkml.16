Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F381B22C336
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 06:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744785282; cv=none; b=qigiqHWI3sPavjcbEEbgnrPfvc7mopB1CVLCaLNBFHYAZ7mlitajbwZ/R2QbZwR2MEEs2EOo4Kjh9HRmNvRedGoXUAebuhzGfhl/NJm40nqj36vZ0qgMiBMWwcxjOJcSgKxbk5Nq2oYo6az1q1LRL2pRDq5IXXNbBvmkWCgHcPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744785282; c=relaxed/simple;
	bh=S0QN9aMOfNreqfKF8qZmVU0ifAofjrywgk5i4jdOUH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=laMVxfHADzNA86ZaI/lqkh+iptVythXhdoQoHbOv5lD/9wVnR/aCG79eknXBKKWszQGKuL/SQ41lheDfySLndmoTeh6hhYQqZtPa1bWHrVDwSUVH8QLKr3Y77Yt4/2zHw2VHmEFDQafaN3XNy7vnKsUYU3qKnd/K3Tik7aZJHaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OQzxgroK; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OQzxgroK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744785281; x=1776321281;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=S0QN9aMOfNreqfKF8qZmVU0ifAofjrywgk5i4jdOUH0=;
  b=OQzxgroKZFUeb86MSp2bAzjeUDHpiKSHXXYl+VhQbP+jcDvjfCtznGMV
   DhhHfbDRCOlUAQT40k2XIyWyAkzMXWxLWcDA8bwuTHr4TyFWpe8Ltl2zr
   E/vnTuZXqfwKc2CX27HcB/nYj3/8uoQMW+ksYzaoA0nfzkOuGhHX2T3Z1
   3FEXjK0ea2KONYrpj+8V3TLEcDS51dKqimbtu0k3gPv3JDbtPu5nXvaNK
   LEEnb67Z4CIh5cka8as807YcQb6lEaBW9AAPInDGlXj5GgGQn1G1T2SDz
   BoNRQn6T6hbkSAqWeJkBKaFbqErxBCRDuVBj5+rUfFzsgYrN+hALVh5wW
   A==;
X-CSE-ConnectionGUID: FeQ+1p06QG2v2q7CkmKjJg==
X-CSE-MsgGUID: fRgZqlkDRWm7EvaTJbTguQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="46333584"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="46333584"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 23:34:41 -0700
X-CSE-ConnectionGUID: iwAcN+cgT2aLo/lfqdzO8A==
X-CSE-MsgGUID: bnJuy8XJQEGMUMTBUyih9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="130111853"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 23:34:38 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u4wLz-0000000ClZV-173E;
	Wed, 16 Apr 2025 09:34:35 +0300
Date: Wed, 16 Apr 2025 09:34:35 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Corey Minyard <corey@minyard.net>
Cc: openipmi-developer@lists.sourceforge.net, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH v1 1/1] ipmi: si: Cast to smaller integer type without
 warning
Message-ID: <Z_9Pe_l-RrO-9v0u@smile.fi.intel.com>
References: <20250415085156.446430-1-andriy.shevchenko@linux.intel.com>
 <Z_5FV65cyIwiI9rs@mail.minyard.net>
 <Z_5L1J11W-ArXcUe@smile.fi.intel.com>
 <Z_5NDNeDztC1-6vx@smile.fi.intel.com>
 <Z_6uzH9DsWIh-hIz@mail.minyard.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_6uzH9DsWIh-hIz@mail.minyard.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Apr 15, 2025 at 02:09:00PM -0500, Corey Minyard wrote:
> On Tue, Apr 15, 2025 at 03:11:56PM +0300, Andy Shevchenko wrote:
> > On Tue, Apr 15, 2025 at 03:06:45PM +0300, Andy Shevchenko wrote:
> > > On Tue, Apr 15, 2025 at 06:39:03AM -0500, Corey Minyard wrote:
> > > > On Tue, Apr 15, 2025 at 11:51:56AM +0300, Andy Shevchenko wrote:
> > > > > Debian clang version 19.1.7 is not happy when compiled with
> > > > > `make W=1` (note, CONFIG_WERROR=y is the default):
> > > > > 
> > > > > ipmi_si_platform.c:268:15: error: cast to smaller integer type 'enum si_type' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]
> > > > >   268 |         io.si_type      = (enum si_type)device_get_match_data(&pdev->dev);
> > > > > 
> > > > > Fix this by intermediate cast to the uintptr_t, that makes compiler happy.
> > > > 
> > > > Unless things have changed recently, Linus prefers "unsigned long" per
> > > > https://patchwork.kernel.org/project/linux-hardening/patch/20220616143617.449094-1-Jason@zx2c4.com/#24899749
> > > 
> > > I'm not sure I got your point. That discussion seems irrelevant to me.
> > > They are talking about pointer-as-an-integer cases. Here we already know
> > > that we are passing integer-as-a-pointer and this is the opposite
> > > conversion.
> > > 
> > > > And it would match what is in the match table.
> > > 
> > > Match tables are tend to move to pointers, enum is usually goes to int.
> > > 
> > > > Is that change ok?
> > > 
> > > If you don't like my change, please do yours and consider this as
> > > a bug report that needs to be addressed. I prefer more my solution
> > > as we do that in many places for the exact scenario.
> > 
> > Note, the proper solution to the cases like this is to move to info-like
> > structure and actually operate with the pointers instead of enums, longs, etc.
> > 
> > That's what's slowly moving on in IIO subsystem, for instance.
> 
> Yes, you are right, I'll probably make that change.  I'm not sure
> about the uintptr thing, but I think the right change is to do an info
> structure.  I never liked that code as it was, anyway.

Please do, I will happily test anything you provide as currently this code breaks
`make W=1` builds.

-- 
With Best Regards,
Andy Shevchenko


