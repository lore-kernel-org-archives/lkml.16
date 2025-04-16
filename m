Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4AD921518B
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 17:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744825670; cv=none; b=tJlKJAy6DgHZDweIU215HaG34vkfHMdkrWmfAj4k1RhQe3KRgZtJY3deaAlPL1XdUiaVuorkO7WyCgN/57TEQ9fk9cf9yyLzGRziKEec85kuhg0K/IU9Ewwh2JYIVsRFCDO09CbpLc1zmnyuAzveiOz/RanFy+8Qomb+orhHCDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744825670; c=relaxed/simple;
	bh=mKk4Koe3jfmmyrx7m6tl+Zwk2YWydwWrWQ8sMVsQhpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WRUHDBo+UanftmRQtvW/kY3XXpv5GvjPZnGUtbsYNhaTvYW+ORfDkL4K7G+t7jPt0THRXCGHUMZqD8Jp/Xb7bWqCc1U5Du4Lg9duahiomt00K4zuwjlpMBvK8P0gSLEzT5QGPwr2pT2kCmj7dCKrbTdi41T61OBHK+tT8TfRRAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YzuWVlwg; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YzuWVlwg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744825669; x=1776361669;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mKk4Koe3jfmmyrx7m6tl+Zwk2YWydwWrWQ8sMVsQhpg=;
  b=YzuWVlwg/SyCnszSkA/pv++W5UL99n2YaMgL+q1Hi0aGgz/DHuoinhfZ
   7IJGlGMN+2/70bYMRMtCF77s7VF4/dBTQBtQpPtG8JwWSf8tlWDYV/OWd
   HmilfDtij7fCbwjRlA5WJJNFyO0q5RhMCXkr91TI9vyGd1y/No/V+68km
   A/NVxl3vWI9xzbQywkgYv0b6r67WY5bN7aWfx04/Rwvd0LjBM7+9n9M/B
   zxZeuctx5T+dcCm+ou4o/gl1qJcwRN+nJrz2QiVUvj2pSggN9AdzIclX/
   MKf9rFbhOKvKY23ddyJtdMIJVpeNuKKZeG8NdSc/gjNMattwE3mz32yXZ
   w==;
X-CSE-ConnectionGUID: DlWKeRpGSs27d/GhaI9iDQ==
X-CSE-MsgGUID: yxAqS0B4SNuirfiuiITl9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="50212697"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="50212697"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 10:47:48 -0700
X-CSE-ConnectionGUID: FmQmhJt3T96sEKluHoyFGQ==
X-CSE-MsgGUID: ZLVi52R0R1SU7j0M35+F+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="131463693"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 10:47:47 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u56rQ-0000000Cvfl-39A9;
	Wed, 16 Apr 2025 20:47:44 +0300
Date: Wed, 16 Apr 2025 20:47:44 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH v2 2/2] bitmap-str: Add missing header(s)
Message-ID: <Z__tQJeyKmbQkwDT@smile.fi.intel.com>
References: <20250416063248.1864059-1-andriy.shevchenko@linux.intel.com>
 <20250416063248.1864059-3-andriy.shevchenko@linux.intel.com>
 <Z__hKFYI5wowbZPx@yury>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z__hKFYI5wowbZPx@yury>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Apr 16, 2025 at 12:56:08PM -0400, Yury Norov wrote:
> On Wed, Apr 16, 2025 at 09:32:11AM +0300, Andy Shevchenko wrote:
> > bitmap-str.h is not self-contained, it uses something that is provided
> > elsewhere, add missing header(s).
> 
> Can you be more specific? Is 'something' means the __user? If so, it's
> provided in linux/compiler_types.h.

bool, __user is defined in compiler_*.h which is guaranteed to be included by
types.h

> Can you add the compiler error you're trying to fix, or how did you
> caught it?

It's by reading the code.

-- 
With Best Regards,
Andy Shevchenko


