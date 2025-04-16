Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C451E5B7D
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 11:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744804350; cv=none; b=P/dkSO/Oiaud2jNhg3uF523kUujUgEbvA/eL5Z2LyXq1XKgMgwSJ9L8dMee4/SESzeCXiTjVnyQQFjeAcsUzbNC0iMbrI4WRSi8AsHdBdVOex652R8v6OM42d1qXPnecQaZlINYMVhqxt90SLOzduIjrHN6jpQnV1IVm1kp/cxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744804350; c=relaxed/simple;
	bh=v8wNmeoBMwfYNwBpRA0k96+UPcHS/QWlzdqsNPkV7bo=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CwWCbT2boAuOqOvtpjWQXId/Ig2NUEE4ZrmOFBAYYwWqXTje63vrJDP9cBzleYiUtaKT7HWoXsfXDzGo6028zWibwfwaeB3NYr5pL3VWWqlzUjoAmazdhU+w32m+7AlfQdKDC0tzsytp/kf0nTiBzBi4IrUXQCqzM+Nx6qVXjog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fhTk3474; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fhTk3474"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744804349; x=1776340349;
  h=date:from:to:subject:message-id:references:mime-version:
   content-transfer-encoding:in-reply-to;
  bh=v8wNmeoBMwfYNwBpRA0k96+UPcHS/QWlzdqsNPkV7bo=;
  b=fhTk3474g4o4idya9moHKfRg+Riw2DmK3khV7o2oSDQZMhlzZBPZhdny
   LUcZAIf+oiTlMCXnOlMiV7z3ypvlit/MGmkGUEkEx4H/kwQ8BwiX5r5FZ
   xlzuOw9lu/TwEgUa1Essw/5H25YuNSaz4ZuarVuaPENSsTJkdD504wM6S
   USfB5FcU+cDYfDt31dGAR67GN4P6MUsTjJFoMhNpshl9/db4po6cZd8Fd
   BI60NZ8mc9/dOzZapYQ6QUXh9LsAL4pS5Hf1BNgrNG43Qi7zr+y7wfIyo
   JOt6Tpgx0DoDs0N4SaqjhMnuIQdSDIfIreM/YcRvKYAhtYn5mBqLfBEuk
   A==;
X-CSE-ConnectionGUID: Fk0NUe1DRquRe7H5Fn+EdQ==
X-CSE-MsgGUID: qmpejhcvQT2OAynEnIhybQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="50155564"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="50155564"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 04:52:22 -0700
X-CSE-ConnectionGUID: p90rslSRScKGmthdrl20Aw==
X-CSE-MsgGUID: BV0Bhd9sTfGxr7Iwq02fvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="135619371"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 04:52:21 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u51JS-0000000CqFT-1ITc;
	Wed, 16 Apr 2025 14:52:18 +0300
Date: Wed, 16 Apr 2025 14:52:18 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] genirq/irqdesc: Balance locking to make sparse
 happy
Message-ID: <Z_-Z8kH0oNVRyA-c@smile.fi.intel.com>
References: <20250416114122.2191820-1-andriy.shevchenko@linux.intel.com>
 <20250416114122.2191820-3-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250416114122.2191820-3-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Apr 16, 2025 at 02:40:34PM +0300, Andy Shevchenko wrote:
> Sparse is not happy right now about conditional locking and
> complains:
> 
>   irqdesc.c:899:17: warning: context imbalance in '__irq_get_desc_lock' - wrong count at exit
> 
> Refactor the code and use __acquire() to make it happy.
> Annotate the function that it acquires the lock in the
> similar way how __irq_put_desc_unlock() is marked.

Oh, scratch this, it basically will diminish the idea for the users.

…

>  __irq_get_desc_lock(unsigned int irq, unsigned long *flags, bool bus,
>  		    unsigned int check)
> +	__acquires(&desc->lock)

This is correct annotation, but it doesn't help alone.
We need __cond_acquires() to be supported by sparse...

...

It can be still fixed by using macros, but this is not probably what we want.
For the reference: d795e38df4b7 ("iio: core: Rework claim and release of direct
mode to work with sparse.")


-- 
With Best Regards,
Andy Shevchenko


