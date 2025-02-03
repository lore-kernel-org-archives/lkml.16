Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A3320A5CB;
	Mon,  3 Feb 2025 16:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738598760; cv=none; b=Ow56Y72fcY0nebU8hYFSfY1Qt6NZhdtlxmu04LCAu38dS29RKfE5NwXZ0O5MAJeL3hG2/B2Y91kJVpyIdRkAzNhhP6iHdmUhpVgJJ7VlGD9ufvPuqLF5NNuTbMVzI64iiRU8kgm9xjvoq4hvDgBdJh4N/C6Dh08dvb+oXZOeP5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738598760; c=relaxed/simple;
	bh=LGXY8khUf7r4bcgC/32pfBc76U1452ttZ+5vp98F+0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YU1GbgeKVDsKQbYN2blOSm+YO+FmHwEiyfzmBwwG+31TKIGedDN8+huHcHWCLvGbRaLn3urZKRhAEa+n4B9i9YdP3wND5TOyEWGYshtPe9w/ST+wKnqh54oQTVSuKEK0BHt3BCOcdFHBzisyAzdr1OelamFxk9oO/GT8frZmlaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RSe4+fdp; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RSe4+fdp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738598759; x=1770134759;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LGXY8khUf7r4bcgC/32pfBc76U1452ttZ+5vp98F+0g=;
  b=RSe4+fdpllmTpFZ7A1xk1b7eiHiPY5hBHyil1bKJyqRS3YAoqVlqrJcq
   iv3H8jc1eeju8NOZ0cNmhTOSPpjPqYZ/KN1hFvu5WkwCzqcz4P/4V3FF8
   mFgR5kcVC9vK5B11CsNGuIOIo50H3PZRb73x5qPGErEt0PQhnGCIQeCHA
   geXiEwDbJ62IBoVCGpIYEyqNu7EHju/7lk9CcYDKKPN6Cp0E/g8zFYYaV
   GCzBmp/H4H4WsMQ1FkB5si2F60UTsv4BY32v1GYc08EXj7NJ94eSznsyo
   drP8N4dF2ni7fb56tWhabxX1Nz6Z7Qbh/DJTex+OKbgAAJXu4yvsJg6eq
   A==;
X-CSE-ConnectionGUID: FZorSHicSNCjX3YgF8uwVg==
X-CSE-MsgGUID: BmfVpisZTfmShu/IuGHlSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="64453055"
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; 
   d="scan'208";a="64453055"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 08:05:58 -0800
X-CSE-ConnectionGUID: su8gKK5QTDyCeHlxD/7S1A==
X-CSE-MsgGUID: 3qxVQWDfSs2Exy1SKBC4vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; 
   d="scan'208";a="110896922"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 08:05:54 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1teyxK-00000007shu-2lug;
	Mon, 03 Feb 2025 18:05:50 +0200
Date: Mon, 3 Feb 2025 18:05:50 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Mark Brown <broonie@kernel.org>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	Robin Murphy <robin.murphy@arm.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Zijun Hu <quic_zijuhu@quicinc.com>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 1/3] driver core: add a faux bus for use when a simple
 device/bus is needed
Message-ID: <Z6DpXnBruLUvXCVh@smile.fi.intel.com>
References: <2025020324-thermal-quilt-1bae@gregkh>
 <2025020326-backer-vendetta-7094@gregkh>
 <Z6DchyPieQKBJ0SN@smile.fi.intel.com>
 <2025020300-gown-outmatch-1343@gregkh>
 <2025020308-shrill-brewery-38d6@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025020308-shrill-brewery-38d6@gregkh>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Feb 03, 2025 at 04:46:56PM +0100, Greg Kroah-Hartman wrote:
> On Mon, Feb 03, 2025 at 04:35:45PM +0100, Greg Kroah-Hartman wrote:
> > > > + */
> > > > +struct faux_device *__faux_device_create(const char *name,
> > > > +					       struct faux_driver_ops *faux_ops,
> > > > +					       struct module *owner)
> > > > +{
> > > > +	struct device_driver *drv;
> > > > +	struct device *dev;
> > > > +	struct faux_object *faux_obj;
> > > > +	struct faux_device *faux_dev;
> > > > +	int ret;
> > > 
> > > > +	faux_obj = kzalloc(sizeof(*faux_obj) + strlen(name) + 1, GFP_KERNEL);
> > > 
> > > Potential overflow. To avoid one may use struct_size() from overflow.h.
> > 
> > Users should not be providing the string here.  Again, this comes from
> > platform.c.
> 
> Sima just proved me wrong, I'll go check for this now, thanks for
> pointing it out.

Ah, you are welcome!

-- 
With Best Regards,
Andy Shevchenko


