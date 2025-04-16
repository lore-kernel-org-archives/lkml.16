Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC5722B5AA
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 06:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744785179; cv=none; b=NWuwb9WMs1d6nCgk5y2ru984oPbHD8Bqagk34JPxTwK50ylXTQYTggeAtVZryH9t2Zti2XJWV+BY24yGdkslcDKCy7KZPJXqlcMUVJi2zAlVNb1G+BLsdYsTUWfi5cxhD7oPVSO6CmJb6cmErhE2u1OlN0YGd/k+KFwNo2mSN0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744785179; c=relaxed/simple;
	bh=7FZNKgYGRz1FAUWoOP85LuaVsxxUpOyz4J5rieUEdio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hLFxSmpYbszt3IXmNyO9qFh/OA2c54vaPnoHtsmIQcQ15GRjGihahRYOVzRy+iqDNaVHa9I0u+sjQvHGdF+K3xIavV2EQefZxFiF+5uO4w5LdKhW2huA+VPweZqLPlnItD43SxKAMuGotZsdWLjgIraFUicpTzuAw3ktXtz5fkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eRq8Y1lm; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eRq8Y1lm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744785178; x=1776321178;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7FZNKgYGRz1FAUWoOP85LuaVsxxUpOyz4J5rieUEdio=;
  b=eRq8Y1lmsBSCJ+yP504h2bndFFsI8hVxsGt7uY+a5dtfOKUr0whhcQRs
   sZsDVCYTyf1vHQjYBn7WgO5VMmQLti3F19BqHak0Os1JE0njl5ByxaHAj
   tKre9fR7DfqIwumKn8wLOz7V3qTWy6MNXfgBEyvUzDlq4BhSDpgDXLGka
   oWLbxD3c9UVO299jOOE8kYeUgEFrtROYk/v7eqMJs/QEswHyJN+w4b8Xx
   9QobtWkMEQxzhYwtBwNXL0HJaFrRHyo62AHeM+lPL3Lsk9/12Ka0vQPeH
   iQpEDRIvTqYTidQerCV/EeNy9hwSJcqBfxRrjI/7DYMzqXiPx0ozNr8Wp
   Q==;
X-CSE-ConnectionGUID: fuvC+9WcTAen5sMdZBVHQw==
X-CSE-MsgGUID: 8/nWl9duSSC2ZjUvuAxR/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="46033337"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="46033337"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 23:32:58 -0700
X-CSE-ConnectionGUID: glhdiLOARoCYOYG1kZdeYA==
X-CSE-MsgGUID: Ophpc1/LTCyIZQCNom2/XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="130296409"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 23:32:56 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u4wKM-0000000ClYH-0hPz;
	Wed, 16 Apr 2025 09:32:54 +0300
Date: Wed, 16 Apr 2025 09:32:53 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH v1 0/2] bitmap-str: A couple of cleanups
Message-ID: <Z_9PFYdAluyNUROq@smile.fi.intel.com>
References: <20250415083156.303914-1-andriy.shevchenko@linux.intel.com>
 <Z_5SdhGGyg5MtEZU@yury>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_5SdhGGyg5MtEZU@yury>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Apr 15, 2025 at 08:35:02AM -0400, Yury Norov wrote:
> On Tue, Apr 15, 2025 at 11:31:18AM +0300, Andy Shevchenko wrote:
> > A couple of simple cleanups to the bitmap-str.h.
> > 
> > Andy Shevchenko (2):
> >   bitmap-str: Get rid of extern
> >   bitmap-str: Add missing header(s)
> > 
> >  include/linux/bitmap-str.h | 10 ++++++----
> >  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> Hi Andy,
> 
> Can you please resend with non-empty commit message?

Sure thing.

Done!

-- 
With Best Regards,
Andy Shevchenko


