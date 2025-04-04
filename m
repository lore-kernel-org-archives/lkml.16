Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2938412D1F1
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 13:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743773965; cv=none; b=Hp/Jsybu30VfVDMmuOl7h9GT0mKJFA/ooHfXEbkzEEjX/fFpYCvtOCkV9XkvAEfptFdqBk1qZnC3OcnCUpa5WFtLK8FqdIrlthv4AMKenVOpLBC490NiHn01yHq5hHxpDTY2176lcvl4OmvrJemXu3fWSRWrAP8PCdiAG+YKEOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743773965; c=relaxed/simple;
	bh=Gi8wr+GBzFfZ88My7G2EpRboGbN7NTb7ctyDaIu9ano=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MVfyhzmZTSpFs5kiU6RNA1ty7P9pncsGL7mLiVYpM66VK6M7MDr8HFSk0UrkJOP56kB2F9WD1VPhwWgmAmLzPGzlOyWulodq6KrYwTj7qXTfCmZbjk1KjkXzzcaEuWc2i7/rELPmYGJsCNPOyhc4ws7L5LHA2NifG43Z0Pdz27c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NX6A9ijJ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NX6A9ijJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743773963; x=1775309963;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Gi8wr+GBzFfZ88My7G2EpRboGbN7NTb7ctyDaIu9ano=;
  b=NX6A9ijJRe0bzibf5MMY5OItnB37y6dhfMCYRxgTXgjZ2AZ9DbllARyO
   NRQGcM3IGrazafDmYgKg+X30wSwgzMO1h6PAOMXXOEOiceTiownGLJA7z
   Xq7eagqsB/Gw68pY6SPdUcL0s8kmld6avg+2xLuOjUkIoYiuFJgF1IYhw
   aVG50T1d7OuJDXPgmAZRL/rBtFtvUuUqp9+MR7w6o44wk4eOOLFOoJ0T8
   0/RriSp61UsQweHpJaxR7P+cJKzxCBumoh/vBA7oUq7k1eJXw3HhexKZA
   I12s1Auz3Rj93fdtXUEiaNO+e7oo5hq15+yrXVpFs+CqXh/ahI8YyHdMg
   g==;
X-CSE-ConnectionGUID: OugQJ+wRTZCwizPbKc/sNA==
X-CSE-MsgGUID: zxnKe23VQeqhnuYS7BNXNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="56199040"
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="56199040"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 06:39:23 -0700
X-CSE-ConnectionGUID: t3Myw3EVS82qNUGWwgXDBg==
X-CSE-MsgGUID: z9UQMbVfTZ6mAwnWqMAUzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="127073543"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 06:39:20 -0700
Date: Fri, 4 Apr 2025 16:39:17 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, david.m.ertman@intel.com,
	ira.weiny@intel.com, lee@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] mfd: core: Support auxiliary device
Message-ID: <Z-_hBbqke1qPP_Gi@black.fi.intel.com>
References: <20250403110053.1274521-1-raag.jadav@intel.com>
 <2025040336-ethically-regulate-3594@gregkh>
 <Z-_ESekESYYvMHeR@black.fi.intel.com>
 <Z-_QwB1cExN1emMF@smile.fi.intel.com>
 <Z-_SIbfBdMXXkkWG@black.fi.intel.com>
 <Z-_X2j0yzyLCS3r2@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-_X2j0yzyLCS3r2@smile.fi.intel.com>

On Fri, Apr 04, 2025 at 04:00:10PM +0300, Andy Shevchenko wrote:
> On Fri, Apr 04, 2025 at 03:35:45PM +0300, Raag Jadav wrote:
> > On Fri, Apr 04, 2025 at 03:29:52PM +0300, Andy Shevchenko wrote:
> > > On Fri, Apr 04, 2025 at 02:36:41PM +0300, Raag Jadav wrote:
> > > > On Thu, Apr 03, 2025 at 03:02:47PM +0100, Greg KH wrote:
> > > > > On Thu, Apr 03, 2025 at 04:30:53PM +0530, Raag Jadav wrote:
> 
> ...
> 
> > > > > > 2. Should we allow auxiliary drivers to manage their own resources
> > > > > >    (MEM, IO, IRQ etc)?
> > > > > 
> > > > > The resources are all shared by the "parent" device, that's what makes
> > > > > aux drivers work, they need to handle this as there is no unique way to
> > > > > carve up the resources here.
> > > > > 
> > > > > So I don't know how you would do this, sorry.
> > > > 
> > > > Perhaps we can carve it up in mfd_add_devices() using start and end members
> > > > and error out if they overlap.
> > > 
> > > I don't think we want a flag day. If anything, it should be a new call.
> > 
> > Yes, I mean in mfd_add_auxiliary_device() (as in this patch).
> > 
> > > > Can't we still have a struct resource that is unique to that specific
> > > > auxiliary device?
> > > 
> > > Oh, believe me, you won't do that. Save yourself from _a lot_ of troubles with
> > > different cases when the shared resources are required.
> > 
> > I think we already have ignore_resource_conflicts flag as part of mfd_cell,
> > no?
> 
> It's not so easy, and it's not the only thing that's needed. You can dive into
> it and see how the request of the resource work. Also note the hardware that
> has common registers. Again, using regmap solves most of these issues if not all.

What if there are multiple types of resources including multiple ones
of same type?

I know it's not common but we have such cases already in place.

Raag
