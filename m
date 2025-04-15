Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E23294A1D
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 12:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744719123; cv=none; b=muYoRgDJrucZniIwQzUd2nFAw+HtnLsEkdo6XuS1QRKEMiIXceWHHKoG7Dgi2ndaToOpuGNh7Jq+MsHrTN9qVadfe+O52krVt1g2SJk/92LA0uT69X881L69Uyr06BbUVzqvaKby937xf6cb6KEts+Y/N1p7+r+VCyOpn2/R8XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744719123; c=relaxed/simple;
	bh=0hYUve0xkE/hQHXWHLhI5xgSlQ8xtJMN237cyCHu2cw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X7+HH6r9fqv1uulBh69fe3NkF0Jti1hvx1Ved7AbfQKVUe+Z0EBunzkeuXKJL8mML3SAKGTkz5Dnk6cTa3SiEswAZSDFc37+FcDB9xzrKk+u1DXRx98nH7FotG81P5SVb6BJwq3m8GIQG19gGL0cIVAH8aOzJy+cUVc899iTNmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a56sdakV; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a56sdakV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744719122; x=1776255122;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0hYUve0xkE/hQHXWHLhI5xgSlQ8xtJMN237cyCHu2cw=;
  b=a56sdakVQ4i43fWkQ9/41W4VrTFVi9C6ZtweZbBFLSx3NfZkiJGKIVJu
   brxa19368ltHxNAroikQpkj+OVOAf8gKpDVEymQ7/Fr1+pL5vD+BRz05G
   5L3r7rmQ0ggLzGKSXWexKVP3rOUkXevHkkHnYzgZ1j3q8rbEd/Fa/B1w5
   45wUZTqjP6c4zsY/Av87iYvsXejq16rw1203uYIsxmKzov4tBGtHgAh17
   2kk9yna9WGQRXSYtB41TjHsY+bOIwPDtfA2jzFj1W77wRiqnc+k6+6nHJ
   GNot1lhjgGAR4Zpb8ae1IH0BX4ouxgBz0+8koPQjnpkZGdv8tsbYRwJye
   w==;
X-CSE-ConnectionGUID: 2aWsOd8ATJGyghdebbdECA==
X-CSE-MsgGUID: 2AM3B8nuTE6d+u/VL6SmvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="45458678"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="45458678"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 05:12:01 -0700
X-CSE-ConnectionGUID: si6E1ClKTem4PZIaad4ZSA==
X-CSE-MsgGUID: u+ZNaiIjTsSSyRqFj1oGwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="131001182"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 05:11:59 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u4f8u-0000000CXRT-1mVG;
	Tue, 15 Apr 2025 15:11:56 +0300
Date: Tue, 15 Apr 2025 15:11:56 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Corey Minyard <corey@minyard.net>
Cc: openipmi-developer@lists.sourceforge.net, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH v1 1/1] ipmi: si: Cast to smaller integer type without
 warning
Message-ID: <Z_5NDNeDztC1-6vx@smile.fi.intel.com>
References: <20250415085156.446430-1-andriy.shevchenko@linux.intel.com>
 <Z_5FV65cyIwiI9rs@mail.minyard.net>
 <Z_5L1J11W-ArXcUe@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_5L1J11W-ArXcUe@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Apr 15, 2025 at 03:06:45PM +0300, Andy Shevchenko wrote:
> On Tue, Apr 15, 2025 at 06:39:03AM -0500, Corey Minyard wrote:
> > On Tue, Apr 15, 2025 at 11:51:56AM +0300, Andy Shevchenko wrote:
> > > Debian clang version 19.1.7 is not happy when compiled with
> > > `make W=1` (note, CONFIG_WERROR=y is the default):
> > > 
> > > ipmi_si_platform.c:268:15: error: cast to smaller integer type 'enum si_type' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]
> > >   268 |         io.si_type      = (enum si_type)device_get_match_data(&pdev->dev);
> > > 
> > > Fix this by intermediate cast to the uintptr_t, that makes compiler happy.
> > 
> > Unless things have changed recently, Linus prefers "unsigned long" per
> > https://patchwork.kernel.org/project/linux-hardening/patch/20220616143617.449094-1-Jason@zx2c4.com/#24899749
> 
> I'm not sure I got your point. That discussion seems irrelevant to me.
> They are talking about pointer-as-an-integer cases. Here we already know
> that we are passing integer-as-a-pointer and this is the opposite
> conversion.
> 
> > And it would match what is in the match table.
> 
> Match tables are tend to move to pointers, enum is usually goes to int.
> 
> > Is that change ok?
> 
> If you don't like my change, please do yours and consider this as
> a bug report that needs to be addressed. I prefer more my solution
> as we do that in many places for the exact scenario.

Note, the proper solution to the cases like this is to move to info-like
structure and actually operate with the pointers instead of enums, longs, etc.

That's what's slowly moving on in IIO subsystem, for instance.

-- 
With Best Regards,
Andy Shevchenko


