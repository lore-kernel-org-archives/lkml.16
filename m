Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31F4433D1
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 14:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743690401; cv=none; b=YkXrg8r/0M5BxeM2bDBjFda9Y1hNtiJU6ifTX8oq+UjmaCIsopiCR/L6RG0LFWITNWXkWf80/LyWO6V+OqNU1Pa1YaziCBcwDF9x3icYnhl43DJD4qjA5mSxymgAwUoCHlXQz2esYgpNO2PDb4uZT7a8Iw9bXRK7lm1SDo7RvKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743690401; c=relaxed/simple;
	bh=8Oy+VaA23wXMT84oxyuP+BRVicWXXuU7IUUqLN1IYWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BZiYZoTfoWaLlF/m95j8oPCTHfgU+wlLatby21pyCkUEA+eJr9jYjRS8CzPd7DypdcCcMxmg4O/OqNA4md7gV8WctJ486GSQnTwueWrL4kQaBnI8DCKb1SbD7osTwQUxPTasTnN/ZNogJeZ51/XEPjSEmR/7YpSlst26SAZvEBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XOz/sO83; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XOz/sO83"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743690400; x=1775226400;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8Oy+VaA23wXMT84oxyuP+BRVicWXXuU7IUUqLN1IYWM=;
  b=XOz/sO83NES0p3Cm/TzyHI5BTLJfYfssfQlXVt2Xk+fFkyyJlQcmahJL
   GQapkx7gayxb2Qf2quzCkGndJvQLNHsioNgwP6URlrb4cvJEI0fr+Np98
   4p0ESNNKf2/TEEXhTfnwsw3O5IZh87gizvrxYCRcg2Jryspr8a/TYkw9N
   2u0NDUjyVE53fQhnIXNRyCsfWXqjuF7eTlI5k1BCxrIBaUkhR/idBNu3q
   r0YUp9U52CWlR0T9iNB+42oMtrIBbI8wBXtfP6m7azASlRuSMrzEOkU4u
   tCZvvs27G5VnsfUVmenD1XEFA8Q6DZI5gjDQIw/RaGy1krTL5Ybvgts4M
   w==;
X-CSE-ConnectionGUID: fy6u3s6GTcO9iFB9yLoUOQ==
X-CSE-MsgGUID: 1ZQGDSfUQgO/lrmFbDVGOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="62505841"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="62505841"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 07:26:39 -0700
X-CSE-ConnectionGUID: o0F+MBApTx2hFUhW50THDw==
X-CSE-MsgGUID: yMdWXaJ5Sj2a+A0YLPBfwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="158007997"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 07:26:37 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u0LWc-00000008pyU-47jo;
	Thu, 03 Apr 2025 17:26:34 +0300
Date: Thu, 3 Apr 2025 17:26:34 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Raag Jadav <raag.jadav@intel.com>, david.m.ertman@intel.com,
	ira.weiny@intel.com, lee@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] mfd: core: Support auxiliary device
Message-ID: <Z-6amuPCmtRpUmxj@smile.fi.intel.com>
References: <20250403110053.1274521-1-raag.jadav@intel.com>
 <2025040336-ethically-regulate-3594@gregkh>
 <Z-6YU24dhxF5PRaw@smile.fi.intel.com>
 <Z-6Y6lbLSbe46-uQ@smile.fi.intel.com>
 <2025040343-vascular-swung-f124@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025040343-vascular-swung-f124@gregkh>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Apr 03, 2025 at 03:23:22PM +0100, Greg KH wrote:
> On Thu, Apr 03, 2025 at 05:19:22PM +0300, Andy Shevchenko wrote:
> > On Thu, Apr 03, 2025 at 05:16:51PM +0300, Andy Shevchenko wrote:
> > > On Thu, Apr 03, 2025 at 03:02:47PM +0100, Greg KH wrote:
> > > > On Thu, Apr 03, 2025 at 04:30:53PM +0530, Raag Jadav wrote:

...

> > > > > 2. Should we allow auxiliary drivers to manage their own resources
> > > > >    (MEM, IO, IRQ etc)?
> > > > 
> > > > The resources are all shared by the "parent" device, that's what makes
> > > > aux drivers work, they need to handle this as there is no unique way to
> > > > carve up the resources here.
> > > > 
> > > > So I don't know how you would do this, sorry.
> > > 
> > > I think we should simply enforce the requirement that MFD on AUX bus must use
> > > regmap. This will solve the serialisation and common access to the resources.
> > 
> > That said, make an additional API call like
> > 
> > dev_mfd_add_aux_devices() which should enforce new infrastructure and convert
> > drivers one by one. Also with that you may add a warning to the existing (PCI)
> > drivers that are using old API
> > 
> > 	if (dev_is_pci(parent))
> > 		dev_warn(parent, "Uses old API, please switch to ...\n");
> 
> Don't add "warnings" like this if you aren't also going to actually
> convert the code.  Just convert it, otherwise you pester users with
> problems that they have no idea how to fix.

Good point. I'm wondering how many actually we have PCI MFD (ab)users right
now? 30? 100? More?


-- 
With Best Regards,
Andy Shevchenko


