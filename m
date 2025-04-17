Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDF8253330
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 15:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744905342; cv=none; b=CkHV5VObDE8XKW/upsjafXMzdSNFgyTe9h8Tojg24XNBKQwu3h6agYJlWYfBUHA3YZAy2E1dPHyZzrXYyM8ekBEpzeFKu9vFcMeUVEUAxLFAqTuif1X/qPC9jIyfDSQstGIjHEp0/0zaut/WUq+KYVRTbulJcn1psSMHgo+rBbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744905342; c=relaxed/simple;
	bh=czu23b/807cDDfwcB8TN6WMA0TNtGIk5Y4v6xBe9J5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WJFnEJWDYuwILOFAyx9eJGEQANbIoiP9V0VlwSPI0iHHVO+1wfGRZ1EcTFaxzwY+b9XBmnyWXg6Brb6DTzahGY7JoKDlKAtc3mrJfEP0Wd6TzXuWAyV/L/t56wl3LNvxh+lt/0YPGr8YfFBc0LQKA5ZXMDytuFho/5nDDXRKWyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZRbQYwHS; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZRbQYwHS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744905340; x=1776441340;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=czu23b/807cDDfwcB8TN6WMA0TNtGIk5Y4v6xBe9J5c=;
  b=ZRbQYwHS2EE2pCpurJoxk6I4+YfqOmGjBgkVEKZcHonecCYC1SUs8XgZ
   Aekgkij3GUb7Mk5ZhIVcQErJnF70k5dobGY0xdB26ZqviM5ZAh4FvxVAb
   Qr60eGFJWtxdUW5RwjZWgzUPpfFjV29lhIgEoUGqF6fLkLdz/X7uqkV6S
   nf7Ck9hbyoQOEqHnGz1JD6gVJmg7+HNdBCMUc73XxcyCjF0HZP8qjBQkN
   jnbx8WOYWTx9EPrDQgj4cFtPG7kvsCGAEtcw7f/pRlxeiC3PGiBP01zia
   TsB9bHJisaqyIj5ba5+Uczc0mnFvU9ZpundHS6z40wRD8TSrrj9mNtjMn
   g==;
X-CSE-ConnectionGUID: bx1+W/AIR+Srj6PHBOme7Q==
X-CSE-MsgGUID: N9gpVePcT8Kpufhwcgx6WQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="57145625"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="57145625"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 08:55:39 -0700
X-CSE-ConnectionGUID: cnPo122qQnKUq/wq+Hb5jw==
X-CSE-MsgGUID: kRmTJp8hShypFjZ38hsNOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="135663136"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 08:55:38 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u5RaR-0000000DFBM-38E0;
	Thu, 17 Apr 2025 18:55:35 +0300
Date: Thu, 17 Apr 2025 18:55:35 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Corey Minyard <corey@minyard.net>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>,
	OpenIPMI Developers <openipmi-developer@lists.sourceforge.net>
Subject: Re: [PATCH v2] ipmi:si: Move SI type information into an info
 structure
Message-ID: <aAEkdwD888tW2OUY@smile.fi.intel.com>
References: <20250416183614.3777003-2-corey@minyard.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416183614.3777003-2-corey@minyard.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Apr 16, 2025 at 01:36:15PM -0500, Corey Minyard wrote:
> Andy reported:
> 
> Debian clang version 19.1.7 is not happy when compiled with
> `make W=1` (note, CONFIG_WERROR=y is the default):
> 
> ipmi_si_platform.c:268:15: error: cast to smaller integer type 'enum si_type'
> +from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]
>   268 |         io.si_type      = (enum
> +si_type)device_get_match_data(&pdev->dev);
> 
> The IPMI SI type is an enum that was cast into a pointer that was
> then cast into an enum again.  That's not the greatest style, so
> instead create an info structure to hold the data and use that.

Tested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


