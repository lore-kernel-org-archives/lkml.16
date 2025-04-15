Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7D52951C7
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 12:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744718812; cv=none; b=LO/0IllTeU/FBBNpwSDr6qmcDKS4dMuGXb3eBpiAqQL4SIpDrzcZwUs3HkoYzSyK0r81Up8sAE6KDkeKnD916bkhPWWpWSnKGQxd0L71Bm0g3wexRCUzsRSiyuQkCgFQOvUXg3Hb8lT/84jmj2wQjw6k3FIjHL1qIBA3CE4yKa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744718812; c=relaxed/simple;
	bh=x4b1Ksyd2oZZ01nHbkKfVYXSxKoQwElChjUNG5hzlbo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PKfDMwMx34ccQge7AgSdkG4vvC8i0BI20cs3u/4G796ytqnRMEBd4xgmz8KmZkoCXzNJPDKs3ZdVR+o1zj+KFlRcxWp3xu55IY3Kd8OdF5KWQL6lIlEX6/jXGfWeoBsyjzRkVv9ocTAKtMXde8P8rzI1yJI6hpmV5Hcp33RxHkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NPHTkUH7; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NPHTkUH7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744718811; x=1776254811;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=x4b1Ksyd2oZZ01nHbkKfVYXSxKoQwElChjUNG5hzlbo=;
  b=NPHTkUH7B62ERFK7YGBo2oS+gVtOeuvIbVMuD4gKh7J4J8nUS0NQbwMi
   T6tIMNS740V+9g+r2vHW0BrNvuPH7sJrPUTaWz2j2t7CLIquzxaLAqODh
   Es8VHMFuem2szn1pIEs2q3lZBwdPrPsiQ7Wb/8b4ZWf6skdoZQTsOilCY
   E+Y64A5BROY5bvpyNFLdyGl/5McifuOIrkdUI9q2QiaacVjrF0os49ErL
   BY2cYIRR40P+o573vZZiTB6+pljf2Sw37UepFtiIHpAyOQgJO+9Pxv4fU
   T0I0ZCqzDFj11aYwPlUnCCalXZ+MaM6xLn2tUFg26yWG4USPVVaQuo6r9
   g==;
X-CSE-ConnectionGUID: gx3739JiQra+jQSGDDPoMw==
X-CSE-MsgGUID: ZJIyLZsCSvSJ46In/vejYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="56883900"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="56883900"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 05:06:50 -0700
X-CSE-ConnectionGUID: 3ZUTnRvyQc2AZuhJ32hn1w==
X-CSE-MsgGUID: NkzuOuzgR1OaN+lXV9EWhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="130632856"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 05:06:48 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u4f3t-0000000CXNM-021J;
	Tue, 15 Apr 2025 15:06:45 +0300
Date: Tue, 15 Apr 2025 15:06:44 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Corey Minyard <corey@minyard.net>
Cc: openipmi-developer@lists.sourceforge.net, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH v1 1/1] ipmi: si: Cast to smaller integer type without
 warning
Message-ID: <Z_5L1J11W-ArXcUe@smile.fi.intel.com>
References: <20250415085156.446430-1-andriy.shevchenko@linux.intel.com>
 <Z_5FV65cyIwiI9rs@mail.minyard.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_5FV65cyIwiI9rs@mail.minyard.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Apr 15, 2025 at 06:39:03AM -0500, Corey Minyard wrote:
> On Tue, Apr 15, 2025 at 11:51:56AM +0300, Andy Shevchenko wrote:
> > Debian clang version 19.1.7 is not happy when compiled with
> > `make W=1` (note, CONFIG_WERROR=y is the default):
> > 
> > ipmi_si_platform.c:268:15: error: cast to smaller integer type 'enum si_type' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]
> >   268 |         io.si_type      = (enum si_type)device_get_match_data(&pdev->dev);
> > 
> > Fix this by intermediate cast to the uintptr_t, that makes compiler happy.
> 
> Unless things have changed recently, Linus prefers "unsigned long" per
> https://patchwork.kernel.org/project/linux-hardening/patch/20220616143617.449094-1-Jason@zx2c4.com/#24899749

I'm not sure I got your point. That discussion seems irrelevant to me.
They are talking about pointer-as-an-integer cases. Here we already know
that we are passing integer-as-a-pointer and this is the opposite
conversion.

> And it would match what is in the match table.

Match tables are tend to move to pointers, enum is usually goes to int.

> Is that change ok?

If you don't like my change, please do yours and consider this as
a bug report that needs to be addressed. I prefer more my solution
as we do that in many places for the exact scenario.

-- 
With Best Regards,
Andy Shevchenko


