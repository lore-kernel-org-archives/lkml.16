Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9161547C9
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 08:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738225289; cv=none; b=PSDu1ErD7VG5S4cJewYiE2SJGBZe0760F+6dZYVaEp5/ClzDe5ZiaSAqmPyNsf7FvoPnelX6DaR5m8ryfg2esSCKapzXHiTHFa/LsNn3W1xaaELNEoK4EBMpQ5I/3EukEl5gzblj295bd6axg0YWGz8XCN61OgHVzvIRLcysP+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738225289; c=relaxed/simple;
	bh=M1qt6yIqv7j8m2gxhiDBq3JhCbnCFKoGYMctlmrwUuo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i507kDLuyXbJhgaC+WjZ0oqH42XNWZDYK6h+wpC5OHEw7SvKJZs6/vL+ulCXxd9qmBL4zJp16MTge2HL8fSLQ4NTCo7/e3QWz1J+3JA/COqBi54GvNsla+Vb2WLQsabpDysuIVgrgxWBqF8JQQo21I6gOOLphGTVMGnbnK22efI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R+joXJeH; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R+joXJeH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738225288; x=1769761288;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=M1qt6yIqv7j8m2gxhiDBq3JhCbnCFKoGYMctlmrwUuo=;
  b=R+joXJeHAQS/3BFYZBm2Nh4zsbysvb6DsxfUNtWxd+Z8Givhp4TidHQ1
   MzxkXqQ7aOGPzb6BfBiR4OA/iESEFWMf6mWTy6pwNwUqk/NYxMZqFv+RR
   CmVmLenU/zl93Ndtz1AdE0jrX1bHkLr1JZ4Uu95g/TYoeW91tzzvAcxt2
   XT5ryO/OWew+VPXcoY2dnVy8uEzfrPo5J4leztmH4JtAvaBJZEa/LJs8g
   f19SIyBI34FD2E8bbeMNFKL03gIvAh4hUwMId8Rx5dSzoxNQpLVlksxka
   wNVDloB26pjFVpkublRODSqyDn83jiCSsa6/3B2nzTfyM+3hUoHn+bWnC
   A==;
X-CSE-ConnectionGUID: eIrWza2yQPK0rNvmwHdO0g==
X-CSE-MsgGUID: n6CojmGzQTusQho7YHziTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="38664562"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; 
   d="scan'208";a="38664562"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2025 00:21:27 -0800
X-CSE-ConnectionGUID: Jg+3FL3KT4OdJNtJ2Qsjuw==
X-CSE-MsgGUID: 0uzz3YCcQgq+3fMLp1Bocg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113877805"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2025 00:21:25 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tdPne-00000006coi-2jbv;
	Thu, 30 Jan 2025 10:21:22 +0200
Date: Thu, 30 Jan 2025 10:21:22 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	DRI mailing list <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v3 1/1] regmap: Synchronize cache for the page selector
Message-ID: <Z5s2gpIj-HOiHD3C@smile.fi.intel.com>
References: <Z4pktkZ1ihfkZjHm@smile.fi.intel.com>
 <Z4ppo8wV3nicOfAQ@smile.fi.intel.com>
 <8a7581e4-6422-4d77-8027-02df0d7da489@samsung.com>
 <Z4qTQ9ypkX6iS1Pl@smile.fi.intel.com>
 <42fe4488-0ff2-4b92-ae11-cce1664a7176@samsung.com>
 <Z4-hMdUUTeQHN5W_@smile.fi.intel.com>
 <6b4cba29-786c-4999-ac1d-27b3e4cea6f8@samsung.com>
 <Z5kJLrE6xOzOKaeb@smile.fi.intel.com>
 <Z5pESDSekep9ChAN@smile.fi.intel.com>
 <c2c2f613-3b65-4efe-99c2-135f043b2d3b@samsung.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c2c2f613-3b65-4efe-99c2-135f043b2d3b@samsung.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Jan 29, 2025 at 06:50:57PM +0100, Marek Szyprowski wrote:
> On 29.01.2025 16:07, Andy Shevchenko wrote:
> >> [...]
> > Meanwhile, can you test this patch (on top of non-working case)?
> >
> > If I understood the case, the affected driver doesn't use case and we actually
> > write to the selector register twice which most likely messes up the things.
> > But this is only a theory (since we don't have the traces yet).
> 
> Bingo! This patch (on top of current linux-next) fixed the probe issue. 
> Feel free to add:
> 
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

Thank you! I will test it on my HW as well to confirm that there no regressions
and will submit a formal fix.

> (although I'm not sure if this is a fix for the generic case or just 
> this driver)

This is for all cases where cache is not in use.

-- 
With Best Regards,
Andy Shevchenko


