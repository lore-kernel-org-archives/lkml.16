Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915C625F99C
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 10:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745834774; cv=none; b=c7rfdlgVp+or0znJUotnO/tpAX3YSSa+6k6xIyJXZaMS8n2ZQWmzrtP3e35WY0x9fgZXeEJUq2UIHak6NX8T9kyAHbt88GrWcX1SpWNkJ3WROVUA9t57W0jzn9gi5jk+ItWn2m2VnZv43Ey8CRDUOv9Ffl/Wb5kxcjvbulm8OxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745834774; c=relaxed/simple;
	bh=jdXhuVxKDtg1x66c6HWakEwrWte9k6LxtSt4bHr4TFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Os1daGfuO6p/j/O82CtCcqGdDmDNiQc4t/xmebikNk3xOHwPEqZDop4diUPu2GoxECXoxcy7/VU3gXATsHaAQgGvDjyhO7ycfvnBgPd4X4v5VA6acm1Oti8Vxct+8oZ+R6XXNYTCNiboLJhDeIiBPIXHx+0EOfcOTOezrouyT/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i4d1kyeG; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i4d1kyeG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745834771; x=1777370771;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jdXhuVxKDtg1x66c6HWakEwrWte9k6LxtSt4bHr4TFQ=;
  b=i4d1kyeGE/m1I594fYdcaDOaH8QbEmUd9PAADQDUZHudrT4xn1lrT4OP
   5fUEDlHEbjCjD3osDsHqRF+puiB0XHugvsHDevuOd+8Bx9jNQEFrMOexD
   JHbbv8tVQC7JH2t1W67VI1RF3twoWm23cIdCrSIRwjAAOz3j7x9I98lGU
   XTPEHI1RruIPwf27c5LdhskDcD/v69hRWt7n4XBvqj8IDzktxRRvScREK
   Pf9YYVQxHbd87pXZ7WEOTunZPD9B8PB0RMadwcrbQAmCpOQMLbgYI3Voa
   zfuYyqbcYcrU7n6wxpOD4/DuoNK42uaMA4Xo8r8jXCxhykUYXIIUg6g2n
   Q==;
X-CSE-ConnectionGUID: 1g0b6s/8QY6m5UKjGz0lIQ==
X-CSE-MsgGUID: wtZg4ncoRwW7jKMNa32q8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="46652784"
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; 
   d="scan'208";a="46652784"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 03:06:09 -0700
X-CSE-ConnectionGUID: x0J3zSHdT3yCjNvUzPeB5w==
X-CSE-MsgGUID: Ojjq9q4NToiOEwckh8DWKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; 
   d="scan'208";a="133793092"
Received: from smile.fi.intel.com ([10.237.72.55])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 03:06:09 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u9LNG-000000013QN-2HWC;
	Mon, 28 Apr 2025 13:06:06 +0300
Date: Mon, 28 Apr 2025 13:06:06 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alexandru Ardelean <aardelean@baylibre.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] util_macros.h: Make the header more resilient
Message-ID: <aA9TDp7FF4rcNI6K@smile.fi.intel.com>
References: <20250428072754.3265274-1-andriy.shevchenko@linux.intel.com>
 <20250428023220.7cfab2286bb94f25c6bf7ca9@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428023220.7cfab2286bb94f25c6bf7ca9@linux-foundation.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Apr 28, 2025 at 02:32:20AM -0700, Andrew Morton wrote:
> On Mon, 28 Apr 2025 10:27:54 +0300 Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> 
> > Add missing header inclusions and protect against double inclusion.

> The patch doesn't "protect against double inclusion"?

Hmm... Not really. This is a copy'n'paste leftover. Can you remove that part
when applying or should I send a new version?

-- 
With Best Regards,
Andy Shevchenko


