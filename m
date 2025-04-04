Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF261F0E51
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 14:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743778056; cv=none; b=pFs21F+2f/RM62G3bnsybN/M53Jr/Grx2IHazNh/ZpLPhA+bE10J0Bju3Yc5hh+TqTwxjY90j9JBa9zTAAixhuMXfAHP+w1IJHjsbAuQEf+Efsk6zZ7++eVguCBnVIOoZOCkXS4fWGR3yJ8OqljzpKTF5E65PDBGQphoJTBE8Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743778056; c=relaxed/simple;
	bh=lTVaJ+hVuHm5UJwWShnN2aU3lV3dQwZ6iAK7XjdfHi0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lm3F69Wb9Bz/GDyWqqII9vnoAVYijyDgHo65EyORV1btzHOgy90noIXbf1a4f0S1aFidwm5s+6/dU9ckvgIjR7EjmYqKENurWrvM4kRyxHFS/nq9h5mwWTQGaphCJ/AQGtdqpSGlVCdG6vVqxo+5Suj5PFMSSZp4AvKXyXXJwNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gwx1+qiO; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gwx1+qiO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743778055; x=1775314055;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lTVaJ+hVuHm5UJwWShnN2aU3lV3dQwZ6iAK7XjdfHi0=;
  b=Gwx1+qiOTyaVAYxHPyIbPck1snRAuxqQMQ2/HRuYJscfYjWBng8OTBJI
   p/LxxcdwwF9yEZSeH9YP41BZI/hVc77GBrdWLN3t7WJOLbZwmomEV9sY5
   vYSg2+JjeYjF5fn/LFHsAL84NovnnJlS5Tol3ke5MF2k4VYmGi3k2N+//
   1CW0z53f2n+R/sG6fJ+uqKgCgDP/nLe8o9FrzBASARTOheJVtylc4zKxa
   OXI1SpsOAUOnxz7rLnoTOGlyj5VPl5CnWc65lOO/sqN7UaDLvxLn7n46m
   iFCfe4lLtX0JFMDbdCcg7CVkzCUPgsLTCVcGLoakJI1JtfkrLPL8tSw7J
   w==;
X-CSE-ConnectionGUID: fZGNHqjDTs+2dvRCHiur0g==
X-CSE-MsgGUID: h8MFSHxnS1avM/LiwsOOVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="49077332"
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="49077332"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 07:47:34 -0700
X-CSE-ConnectionGUID: cV2Wr2P+SRW/BYEa5LJ/Lg==
X-CSE-MsgGUID: D1gIqD9JTV6GKgidtl37ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="158315289"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 07:47:32 -0700
Date: Fri, 4 Apr 2025 17:47:29 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, david.m.ertman@intel.com,
	ira.weiny@intel.com, lee@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] mfd: core: Support auxiliary device
Message-ID: <Z-_xAdzea-qL0khD@black.fi.intel.com>
References: <20250403110053.1274521-1-raag.jadav@intel.com>
 <2025040336-ethically-regulate-3594@gregkh>
 <Z-_ESekESYYvMHeR@black.fi.intel.com>
 <Z-_QwB1cExN1emMF@smile.fi.intel.com>
 <Z-_SIbfBdMXXkkWG@black.fi.intel.com>
 <Z-_X2j0yzyLCS3r2@smile.fi.intel.com>
 <Z-_hBbqke1qPP_Gi@black.fi.intel.com>
 <Z-_k8sLYNOxlkODo@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-_k8sLYNOxlkODo@smile.fi.intel.com>

On Fri, Apr 04, 2025 at 04:56:02PM +0300, Andy Shevchenko wrote:
> On Fri, Apr 04, 2025 at 04:39:17PM +0300, Raag Jadav wrote:
> > On Fri, Apr 04, 2025 at 04:00:10PM +0300, Andy Shevchenko wrote:
> > > On Fri, Apr 04, 2025 at 03:35:45PM +0300, Raag Jadav wrote:
> > > > On Fri, Apr 04, 2025 at 03:29:52PM +0300, Andy Shevchenko wrote:
> > > > > On Fri, Apr 04, 2025 at 02:36:41PM +0300, Raag Jadav wrote:
> > > > > > On Thu, Apr 03, 2025 at 03:02:47PM +0100, Greg KH wrote:
> > > > > > > On Thu, Apr 03, 2025 at 04:30:53PM +0530, Raag Jadav wrote:
> 
> ...
> 
> > > > > > > > 2. Should we allow auxiliary drivers to manage their own resources
> > > > > > > >    (MEM, IO, IRQ etc)?
> > > > > > > 
> > > > > > > The resources are all shared by the "parent" device, that's what makes
> > > > > > > aux drivers work, they need to handle this as there is no unique way to
> > > > > > > carve up the resources here.
> > > > > > > 
> > > > > > > So I don't know how you would do this, sorry.
> > > > > > 
> > > > > > Perhaps we can carve it up in mfd_add_devices() using start and end members
> > > > > > and error out if they overlap.
> > > > > 
> > > > > I don't think we want a flag day. If anything, it should be a new call.
> > > > 
> > > > Yes, I mean in mfd_add_auxiliary_device() (as in this patch).
> > > > 
> > > > > > Can't we still have a struct resource that is unique to that specific
> > > > > > auxiliary device?
> > > > > 
> > > > > Oh, believe me, you won't do that. Save yourself from _a lot_ of troubles with
> > > > > different cases when the shared resources are required.
> > > > 
> > > > I think we already have ignore_resource_conflicts flag as part of mfd_cell,
> > > > no?
> > > 
> > > It's not so easy, and it's not the only thing that's needed. You can dive into
> > > it and see how the request of the resource work. Also note the hardware that
> > > has common registers. Again, using regmap solves most of these issues if not all.
> > 
> > What if there are multiple types of resources including multiple ones
> > of same type?
> > 
> > I know it's not common but we have such cases already in place.
> 
> Don't solve the problems that do not exist. Let's make it simple (following
> KISS principle).

Agree, but that is just additional burden of revamping leaf drivers that may
or may not be possible depending on how other devices are already using them.

Raag
