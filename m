Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8211F3FD2
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 13:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743774969; cv=none; b=WK4kawTuIbQp0UnPJe4jFDNTl1ZolauYKFuxjeL8khmzzLvRqD2NLcbBcDD20HsKtnsNdlEdNOIKYlspFiQaUYHQMe13RmbvXJQf+CFoGQ3zeDw9SimxQRjZi0hACJXc2SP1ETBEfz747JOIcewWE7RxlvCPTplchgVYyz/Z1/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743774969; c=relaxed/simple;
	bh=9Z5nMV9IYLL5j0FabMWUyd01PGQbHkohEb/0097qIE4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TAcLa90aDu3cSi2q3CJ2JWUeIitPQ4zVc/mMwLkinMM0FrpNgy2cx5fGHvXNtfLiMKa2fPoMcNIGezUjLkQIqrX4eOfESkDnD8EaEg9ocxPXO8RN4GFV034IlXoZ500mZMq2wJ3pHo5RkiYnrAz6REGdW9kTwvBSeICCL3ijWsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SOVxdayl; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SOVxdayl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743774968; x=1775310968;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9Z5nMV9IYLL5j0FabMWUyd01PGQbHkohEb/0097qIE4=;
  b=SOVxdayl7qlXJUI9hDbTZroZXOUI90c8N1htMVS8BMFxK/ohMAfDfbRT
   v2OLl4bs24YNyS7I4e94Mn5O3rgSngwbUTXWkK56CvGNGRC9psSp51ATk
   HCySTYKs29bObi/+6nP6tbmyTgbYoT3TYU+P9war1wXtM2MDIRzvXJRlF
   My24NB3UnK5PvMcaL/M5idUf/eDS5t1FrxZOqWl9GvSBvm50gh+8ditG4
   /qVphPqI6qE4iNn5S9AjcMYzzff0d5a7Zq6K8jcoz7Rsd+sMaPa23cgWt
   H9Q5n65ar1PrW0aYtRu5oedxBmEprnt83n7MRfq21VwFkND5p7ZfzCfZe
   Q==;
X-CSE-ConnectionGUID: NnLEf+BORoug1Q/KFn16bg==
X-CSE-MsgGUID: 6IWYCvqQRS+HHAzC/dPznA==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="48867122"
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="48867122"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 06:56:08 -0700
X-CSE-ConnectionGUID: eMiMXG92QSKNsdwjK3yeAA==
X-CSE-MsgGUID: VPV/R1boRsa+oDHZhi8beg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="128225276"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 06:56:06 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u0hWd-000000099a9-0CWQ;
	Fri, 04 Apr 2025 16:56:03 +0300
Date: Fri, 4 Apr 2025 16:56:02 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, david.m.ertman@intel.com,
	ira.weiny@intel.com, lee@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] mfd: core: Support auxiliary device
Message-ID: <Z-_k8sLYNOxlkODo@smile.fi.intel.com>
References: <20250403110053.1274521-1-raag.jadav@intel.com>
 <2025040336-ethically-regulate-3594@gregkh>
 <Z-_ESekESYYvMHeR@black.fi.intel.com>
 <Z-_QwB1cExN1emMF@smile.fi.intel.com>
 <Z-_SIbfBdMXXkkWG@black.fi.intel.com>
 <Z-_X2j0yzyLCS3r2@smile.fi.intel.com>
 <Z-_hBbqke1qPP_Gi@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-_hBbqke1qPP_Gi@black.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Apr 04, 2025 at 04:39:17PM +0300, Raag Jadav wrote:
> On Fri, Apr 04, 2025 at 04:00:10PM +0300, Andy Shevchenko wrote:
> > On Fri, Apr 04, 2025 at 03:35:45PM +0300, Raag Jadav wrote:
> > > On Fri, Apr 04, 2025 at 03:29:52PM +0300, Andy Shevchenko wrote:
> > > > On Fri, Apr 04, 2025 at 02:36:41PM +0300, Raag Jadav wrote:
> > > > > On Thu, Apr 03, 2025 at 03:02:47PM +0100, Greg KH wrote:
> > > > > > On Thu, Apr 03, 2025 at 04:30:53PM +0530, Raag Jadav wrote:

...

> > > > > > > 2. Should we allow auxiliary drivers to manage their own resources
> > > > > > >    (MEM, IO, IRQ etc)?
> > > > > > 
> > > > > > The resources are all shared by the "parent" device, that's what makes
> > > > > > aux drivers work, they need to handle this as there is no unique way to
> > > > > > carve up the resources here.
> > > > > > 
> > > > > > So I don't know how you would do this, sorry.
> > > > > 
> > > > > Perhaps we can carve it up in mfd_add_devices() using start and end members
> > > > > and error out if they overlap.
> > > > 
> > > > I don't think we want a flag day. If anything, it should be a new call.
> > > 
> > > Yes, I mean in mfd_add_auxiliary_device() (as in this patch).
> > > 
> > > > > Can't we still have a struct resource that is unique to that specific
> > > > > auxiliary device?
> > > > 
> > > > Oh, believe me, you won't do that. Save yourself from _a lot_ of troubles with
> > > > different cases when the shared resources are required.
> > > 
> > > I think we already have ignore_resource_conflicts flag as part of mfd_cell,
> > > no?
> > 
> > It's not so easy, and it's not the only thing that's needed. You can dive into
> > it and see how the request of the resource work. Also note the hardware that
> > has common registers. Again, using regmap solves most of these issues if not all.
> 
> What if there are multiple types of resources including multiple ones
> of same type?
> 
> I know it's not common but we have such cases already in place.

Don't solve the problems that do not exist. Let's make it simple (following
KISS principle).

-- 
With Best Regards,
Andy Shevchenko


