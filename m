Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16711FECDF
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 13:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738588043; cv=none; b=Xprn1k0RaPkCymnoe5yWGXeJF0HndCb6aovK13KAgoMVnU4YQ9jx0VlPPX6jAdiAyWTWTiRWTXgUgOYQMGpWSzFFmpxnPFfL6VkwtSs+ih4gNcC1I4ikhilNMIp95epTvUwA999B2IcGw3YuBrAEG30A+KKVdLw+sqZJDIOwbSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738588043; c=relaxed/simple;
	bh=0Iv61x4iGBHTvEl65EBQzUt2TO7zniIckQfdujV1iu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kJ1d9urpZThGKFbW3qy0NrEJJ+a7xCK/kuxQPxOa07NAggUvA1w+Z6eZnbEak/yi16AApYQWApXRxDzCgGz0ZNQ2SQfoBJpHfTaEHFR5v8yeB9W+xYvVMXn+PP02a0u5ypwgkwzBOQHnPxkfQVuOP226QIXhazewa9Rapgk5iHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iDqQQLnK; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iDqQQLnK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738588041; x=1770124041;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0Iv61x4iGBHTvEl65EBQzUt2TO7zniIckQfdujV1iu4=;
  b=iDqQQLnKhVUFxUAd29lHQpNzQgNjGall1epb2+bA7o6szs+8HEcxXMkS
   FW+r80wppy+DKIYczgkpyTHG4u+FzSIV37PzyBNbnBsybuGi9JCGvXAS/
   nZa6v9BB7z1vY8Ki5eTN9x8yjReJ8WLDSduWhjAYv/LXA0A6EJD17f1FA
   INOtdKSB7NBS5GQXHi1QZ2yNwX5mQtuy1/aQaa+pUvm2Q7VkprfkrJ/Ys
   cFa0rfNENBBNsDOUkeLtd1/Bjvj87/UbPw+6zNjZsbAvtnNT35iAnjK2k
   RGlfhj6+yBjqHihLMGuGuOPh81GMbXrYGDQI8Q70ajS8UTOlq0ILn/24u
   Q==;
X-CSE-ConnectionGUID: Cd0p+vdSRIyuo3K8zRarRA==
X-CSE-MsgGUID: GHqBEoGsSgiw/ibluD8HzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50492924"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="50492924"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 05:07:21 -0800
X-CSE-ConnectionGUID: 39ZnDj6TTMeDiJ1StK8P9A==
X-CSE-MsgGUID: o8Ar0ERMTZeO4bdLMiKkLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114904819"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 05:07:19 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tewAW-00000007psU-1GMK;
	Mon, 03 Feb 2025 15:07:16 +0200
Date: Mon, 3 Feb 2025 15:07:16 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	DRI mailing list <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v3 1/1] regmap: Synchronize cache for the page selector
Message-ID: <Z6C_hAvjW9FC2Pix@smile.fi.intel.com>
References: <8a7581e4-6422-4d77-8027-02df0d7da489@samsung.com>
 <Z4qTQ9ypkX6iS1Pl@smile.fi.intel.com>
 <42fe4488-0ff2-4b92-ae11-cce1664a7176@samsung.com>
 <Z4-hMdUUTeQHN5W_@smile.fi.intel.com>
 <6b4cba29-786c-4999-ac1d-27b3e4cea6f8@samsung.com>
 <Z5kJLrE6xOzOKaeb@smile.fi.intel.com>
 <Z5pESDSekep9ChAN@smile.fi.intel.com>
 <eyjsejpx7klztr4k7xmrvceosfykyozs736kycdnf5uur5by43@5i5x7tsuxtpg>
 <Z6CKGu7URC1iGOVO@smile.fi.intel.com>
 <849eca29-4f03-4fb2-bd1f-747ce42f4c5f@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <849eca29-4f03-4fb2-bd1f-747ce42f4c5f@sirena.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Feb 03, 2025 at 12:45:27PM +0000, Mark Brown wrote:
> On Mon, Feb 03, 2025 at 11:19:22AM +0200, Andy Shevchenko wrote:
> 
> > Thank you, guys, for reporting an testing, but it seems the simple problem
> > to solve requires a lot of changes to be done without regressions
> > (this fix on fix makes a regression to those who have cache enabled), which
> > means that for now I propose to revert it (or drop) if possible, Mark,
> > what is your preference?
> 
> I dropped it a while ago, it's not in mainline.

Okay, thanks!

-- 
With Best Regards,
Andy Shevchenko


