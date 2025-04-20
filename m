Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57E729CE1
	for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 06:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745130021; cv=none; b=CJNWPG1dJUBnp9TUXY+2edYtJQl2NQVNi5t1x5dZgcOJKyoLobxGIJfX8N8gY4bXu4wpHLMu8upqJQy5jT6vPlhgYYYVWNIGym31pVxfD2MFCPt/qyVH6D9DrmxfEy9sIiaiE71ObgHdSf+HAmGLunpqxyznQJLqimKXww5MU7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745130021; c=relaxed/simple;
	bh=VLBNrXtP+YkMA6EvbT+6/i2wbdonOLhY7sVtOOpYhYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NahqY9xG3RRNC5dxKuWPYop0bUwESDJCTy7b7jzo9787F1VT8kn5J7Aib5mM8WuhUM0ug4AufVSH9rXCowCNMjDF6Nr8ihEMeHEB6EzOM+hbYr80HPhdb5eQpZnnbNPw4W5PAYgyp2+rIEzeX42TTfACwNSZFOCT0rOv171EDNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RvjZPXHh; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RvjZPXHh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745130020; x=1776666020;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VLBNrXtP+YkMA6EvbT+6/i2wbdonOLhY7sVtOOpYhYg=;
  b=RvjZPXHhZv5eZKRhl8aWOx7xaKUvN5MKNnOVSC3lWYVcExIKpzl0bAw/
   M2f23JTuXknUz+E3quhdPMhiXxgdNwpV5JePPde0xPzbtY1CRiqETUikf
   nb/2ekk/qxYya3rOrXxg2TfDcL5KTg6Ws9lU5JuuuiVawffv11EY1vqa5
   6A/E0y91dJIFp5AaUyw94B4fMURAEiCl8l5JsoqZhZIo+JowwVMfhDOFf
   7rbK7jeI24F2Mu6FnXRjBuYytGzB4B8LOHw64QkYEg2PcmLmDRJbcF7G3
   oIV4vfEkSny/N8o2X5Lw2LcueAdNWj4Ez2Acbcw0+NyqcLeum7SqgH37m
   g==;
X-CSE-ConnectionGUID: YXfVjvlJQnWjIIICDYcRxQ==
X-CSE-MsgGUID: PB9rqsTSQFe+swfp8A2ceA==
X-IronPort-AV: E=McAfee;i="6700,10204,11408"; a="34316862"
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="34316862"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2025 23:20:19 -0700
X-CSE-ConnectionGUID: uKgQfIuNR3q6IXgxlMgRaA==
X-CSE-MsgGUID: ZVjh1QugT8O7C9fCvdRQWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="131973991"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2025 23:20:17 -0700
Date: Sun, 20 Apr 2025 09:20:13 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: gregkh@linuxfoundation.org, david.m.ertman@intel.com,
	ira.weiny@intel.com, lee@kernel.org,
	mika.westerberg@linux.intel.com, heikki.krogerus@linux.intel.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mfd: core: Support auxiliary device
Message-ID: <aASSHasej5Lme0Wc@black.fi.intel.com>
References: <20250418123433.2586383-1-raag.jadav@intel.com>
 <aAPBHBplhmZ_D0jC@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAPBHBplhmZ_D0jC@smile.fi.intel.com>

On Sat, Apr 19, 2025 at 06:28:28PM +0300, Andy Shevchenko wrote:
> On Fri, Apr 18, 2025 at 06:04:33PM +0530, Raag Jadav wrote:
> > Extend MFD subsystem to support auxiliary child device. This is useful
> > for MFD usecases where parent device is on a discoverable bus and doesn't
> > fit into the platform device criteria. Purpose of this implementation is
> > to provide discoverable MFDs just enough infrastructure to register
> > independent child devices with their own memory and interrupt resources
> > without abusing the platform device.
> > 
> > Current support is limited to just PCI type MFDs, but this can be further
> > extended to support other types like USB in the future.
> 
> ...
> 
> >  config MFD_CORE
> >  	tristate
> > +	select AUXILIARY_BUS
> >  	select IRQ_DOMAIN
> 
> >  	default n
> 
> Can be dropped. It's the default 'default' and with user invisible
> configuration, it makes even less sense.

Sure.

> > +/*
> > + * Common structure between MFD parent and auxiliary child device.
> > + * To be used by leaf drivers to access child device resources.
> > + */
> > +struct mfd_aux_device {
> > +	struct auxiliary_device auxdev;
> > +	struct resource	mem;
> > +	struct resource	irq;
> > +	/* Place holder for other types */
> > +	struct resource	ext;
> 
> I don't like it. It's no-scalable solution, just make it VLA. Each resource
> already has type in case one needs to extract an exact one, also this won't
> work in case of the two resources for memory or IRQ needed.

Agree, but is it worth introducing a whole new set of get_resource() and
friends? I'm not sure if the maintainers will be okay with it.

> > +/* TODO: Convert the platform device abusers and remove this flag */
> > +#define MFD_AUX_TYPE	BIT(31)
> 
> Yeah, LKP wants this to be signed... Or 'id' to be unsigned.

I'll revert it back to INT_MIN, a specific number would rather become more
questionable.

Raag
