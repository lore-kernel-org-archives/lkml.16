Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58543194A59
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 12:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743770153; cv=none; b=LE4XLWGneyHPp9X6KzXYZ+PGD4QdO1ghujoLxSj1sl2qa0yzaomRwCEN8Rb6wIYnxaNYv9lKp2qRCuuh1acEq0CixGoNarPJLl6gJdwzve17pnun41Q5rLwQtTjce/7HJ+moZNKcm7UnoWSOACIummxDjl3xjViQFVmgsxp1tsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743770153; c=relaxed/simple;
	bh=Yi1snGNDfedBLPnZFca8CbzM3Eod2xACBdn+8tJc8kA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IwbqETK1EIw38INuypgjjkZQidAv0dDWhc+gQGWh1VmiAL2+wqzdxPHbqPGZWycQqUrN5oqtfiWPPBzTyc3GXFMiejEUevfxduKRz8kMZjdrEPEIvR7GMrKNuBWwi4nMI08tT6lDCaOV4SJKLAjsNqXQAISEJOEBRDg/3T+4ihA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EjsjjqO6; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EjsjjqO6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743770151; x=1775306151;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Yi1snGNDfedBLPnZFca8CbzM3Eod2xACBdn+8tJc8kA=;
  b=EjsjjqO6hVdehkfnXvXZpUWe7elmkERegexoI66Yv1Q74SoaoA+R6p4A
   JZkI0PTx4z7GAnyMZ3inDVnLO7SAcwf5VYah0unci2OjyLZh4zXrXdkWl
   wKnDtTiOQIEEAPdLCzHMJipDFYVsBhe9xMe6kYHnCcFT6B0SC/sOYl3Tv
   +tYz78X1DlIkbwmVQUJJkRJGfPHw7rGcnQphXFBxXbEEcAqcgcZLAeAWZ
   RcgSN/twQYUxyhBs2Or23T3ZjUpa6l03Ek8RG3MK8PXeZbXJTP/xkBsXr
   I4KnqG0JBr5KcgoZ+DKFxYp0NqskUMh2WMgKsYGPZg1O3Qe/JAz4FDgby
   A==;
X-CSE-ConnectionGUID: KA+fXcibQJ2GSy6C+NiSyw==
X-CSE-MsgGUID: BqDpSu84RT6yOGM8o7q7vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="45093843"
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="45093843"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 05:35:50 -0700
X-CSE-ConnectionGUID: xDoJ74pIRF6yKkTWnQSK1g==
X-CSE-MsgGUID: +8d4fhfQQvWZJPDU9WCvgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="132506489"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 05:35:49 -0700
Date: Fri, 4 Apr 2025 15:35:45 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, david.m.ertman@intel.com,
	ira.weiny@intel.com, lee@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] mfd: core: Support auxiliary device
Message-ID: <Z-_SIbfBdMXXkkWG@black.fi.intel.com>
References: <20250403110053.1274521-1-raag.jadav@intel.com>
 <2025040336-ethically-regulate-3594@gregkh>
 <Z-_ESekESYYvMHeR@black.fi.intel.com>
 <Z-_QwB1cExN1emMF@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-_QwB1cExN1emMF@smile.fi.intel.com>

On Fri, Apr 04, 2025 at 03:29:52PM +0300, Andy Shevchenko wrote:
> On Fri, Apr 04, 2025 at 02:36:41PM +0300, Raag Jadav wrote:
> > On Thu, Apr 03, 2025 at 03:02:47PM +0100, Greg KH wrote:
> > > On Thu, Apr 03, 2025 at 04:30:53PM +0530, Raag Jadav wrote:
> 
> ...
> 
> > > > 2. Should we allow auxiliary drivers to manage their own resources
> > > >    (MEM, IO, IRQ etc)?
> > > 
> > > The resources are all shared by the "parent" device, that's what makes
> > > aux drivers work, they need to handle this as there is no unique way to
> > > carve up the resources here.
> > > 
> > > So I don't know how you would do this, sorry.
> > 
> > Perhaps we can carve it up in mfd_add_devices() using start and end members
> > and error out if they overlap.
> 
> I don't think we want a flag day. If anything, it should be a new call.

Yes, I mean in mfd_add_auxiliary_device() (as in this patch).

> > Can't we still have a struct resource that is unique to that specific
> > auxiliary device?
> 
> Oh, believe me, you won't do that. Save yourself from _a lot_ of troubles with
> different cases when the shared resources are required.

I think we already have ignore_resource_conflicts flag as part of mfd_cell,
no?

Raag
