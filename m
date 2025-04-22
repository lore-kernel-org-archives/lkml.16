Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7351D1EE7A5;
	Tue, 22 Apr 2025 07:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745308434; cv=none; b=WSnNb+ikj9YD4atJ7mZAvZ5fyOSst97P6gSeQdRVZ/JABQGOi7EUVhXJW0vvW+qyxuGxlUhTkpWpTCpXgAHSEAiDuKycqo9jGU7NcAB4iqEEnb0sVc3mmIUHwPlXQYKj38zOZHrY+63hzBZCkQXgObJ/4TSRq2zMTu9mTluE9Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745308434; c=relaxed/simple;
	bh=KCeJDEVanpGwD284gJqmiMG/ZwTIY9BSla3RMw56SeA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s5mFsOkWJqDYwLjXvn24VDeB571kuneiRkO3BojLcAypMSuuQ80HQbILnAveRwqhnsBrNu6ohx8oYCaLfRevJvRxBTzsFeA+OZag4Xi8Fv+oFVMjd2RAitsQ6XaXfCy61jdXAfCi3mfvqEc0/xEVuQHR6pgU8yOxCpT+jjukFsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=alNfBm/j; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="alNfBm/j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745308434; x=1776844434;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KCeJDEVanpGwD284gJqmiMG/ZwTIY9BSla3RMw56SeA=;
  b=alNfBm/jSXwPOSusPxYIofGZUzbH5ZVJvtxnkL0e23pS1Bjp1S+M/eWL
   4G2SlBZcTSuUpekNbWCHS94K4z8pq7T3fnZnlJrvbvRvycQukN4TJXl2D
   SukAcUDUe1DObjM0Ca8rm69ntHO6O8zwCn0XIaasl+n5vkO4CBKsUe2Z/
   Gi2qbDCr0D0tzSEfGu8RDx1oWFyz8YQMvBCQ/S682oUQ2wII0djZ6PYxX
   h25CD9EgZkjsUO4/B7DbvpWxcljHAygsR/ggtPoy6sIM1WVZN69pUofre
   27yUcB8mXDqB1qVYWY8w11i5LuJgvW9IGsZZO4qL3j6klm8G3EHGM+qlu
   w==;
X-CSE-ConnectionGUID: 4C3u8mQOTXCVLwKnRI0egQ==
X-CSE-MsgGUID: Rlhd6RF8STa3XaQtbN3crg==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="47037073"
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; 
   d="scan'208";a="47037073"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 00:53:53 -0700
X-CSE-ConnectionGUID: xmEp82KeT0mwB1aXlnMs/g==
X-CSE-MsgGUID: lO0CqNO5QCWZWn46D+Bs0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; 
   d="scan'208";a="155111165"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 00:53:51 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u78Rw-0000000EfKN-41dH;
	Tue, 22 Apr 2025 10:53:48 +0300
Date: Tue, 22 Apr 2025 10:53:48 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Saranya Gopal <saranya.gopal@intel.com>
Cc: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/x86/intel: hid: Add Pantherlake support
Message-ID: <aAdLDBK6h0rrs6Ht@smile.fi.intel.com>
References: <20250421041332.830136-1-saranya.gopal@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421041332.830136-1-saranya.gopal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Apr 21, 2025 at 09:43:32AM +0530, Saranya Gopal wrote:
> Add Pantherlake ACPI device ID to the Intel HID driver.
> While there, clean up the device ID table to remove the ", 0" parts.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


