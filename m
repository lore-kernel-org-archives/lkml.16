Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0A325E471
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 10:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744625115; cv=none; b=L79mXD+EAA7BCkTR5W7CDSBO4hluk9pOvFJTlG55mGLby94lSbXE+3pe8BV8gJLLEqxlfFV7NhhdPjHaOzHogGD4kElb+R4ptW8RuKJed1QxVuCkBOql1wdd2ftKb9SBH8zaakjUWDlCOGiPbKUgvbpUE0VwlUuBdu5kEWO7pFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744625115; c=relaxed/simple;
	bh=uqgYg2BJtBzuQ9/dVXr1lqIyh/Q6T+Jizhlw2pSZ5MA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kl1djtO9VKoj2qn4QWjlwgzjJihFNigcR4unsUu2VqSaVFvqvjTY27Q6p7/lvUKzSX+92DO5OUR5AI2orwUoNvHuYzxehfSvqTvZs+sgCXlLpFW3pD+bhgMIls4k1HQpW0Qfdfl8caCxE6+w7DG+mMhCgpXmV9s61pIJpst7ApQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rtzj4K23; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rtzj4K23"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744625114; x=1776161114;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uqgYg2BJtBzuQ9/dVXr1lqIyh/Q6T+Jizhlw2pSZ5MA=;
  b=Rtzj4K23VbF44FbcBPF9zQvd3jzurDrPCyBPbL3VuSP3KjDhxWMuhGx5
   v1sc8JBM+RpqUt14i8i/LxK91vztKCruT3RP9I+OSP7QqiGL07AkJG9xO
   nOmVBex5/fkEiHe6J3w7xloazNsqZVllUCqnUyFo1zJ36P8B609VGq48g
   Pc/NPDMJz1EoPoAUQMf/mIKhgGO5IrMWILQXocESseU9DObxE1MJO2PpF
   zHNSC0V846ROcmSr3X5dKH2lUpbC4cexoUqsy2dkENOO11sYTALnJGcIv
   vQs4gd/ryHthtGSNpAmMUI3YToMNuv/EpLODiH9mEeR3hdmemcCjzERhL
   g==;
X-CSE-ConnectionGUID: ZRQ4CGPdRuKSUU/ijavzPg==
X-CSE-MsgGUID: lUh5o27ZQI+wUyX8kQf5Hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="46218515"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="46218515"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 03:05:14 -0700
X-CSE-ConnectionGUID: uzpaVyvgRWiYIaniGAG/8A==
X-CSE-MsgGUID: RG0eWEDiReePF5ugEMqixA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="160731476"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 03:05:12 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u4Gge-0000000CCZf-2GWA;
	Mon, 14 Apr 2025 13:05:08 +0300
Date: Mon, 14 Apr 2025 13:05:08 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jens Axboe <axboe@kernel.dk>, dm-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Cc: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH v1 1/1] dm table: Fix W=1 build warning when
 mempool_needs_integrity is unused
Message-ID: <Z_zd1NCtn_QxaCzC@smile.fi.intel.com>
References: <20250407072126.3879086-1-andriy.shevchenko@linux.intel.com>
 <Z_zdwSCfaYDotOI2@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_zdwSCfaYDotOI2@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Apr 14, 2025 at 01:04:49PM +0300, Andy Shevchenko wrote:
> On Mon, Apr 07, 2025 at 10:21:26AM +0300, Andy Shevchenko wrote:
> > The mempool_needs_integrity is unused. This, in particular, prevents
> > kernel builds with Clang, `make W=1` and CONFIG_WERROR=y:
> > 
> > drivers/md/dm-table.c:1052:7: error: variable 'mempool_needs_integrity' set but not used [-Werror,-Wunused-but-set-variable]
> >  1052 |         bool mempool_needs_integrity = t->integrity_supported;
> >       |              ^
> > 
> > Fix this by removing the leftover.
> 
> This issue is still present in v6.15-rc1.

I meant v6.15-rc2, of course.

-- 
With Best Regards,
Andy Shevchenko


