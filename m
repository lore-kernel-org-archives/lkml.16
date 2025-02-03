Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B08204C34;
	Mon,  3 Feb 2025 16:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738599746; cv=none; b=ECnglEShsdVoaaNnSffdGBTwHIWCf1nGyt3c/X+93gKLGsKbOUHKqb/vSDBj/nkCmxRmM2KuVXugGKDLoXRgRkxkrI1aaD9ZB4a49W3Ows12UK5K1yowboHrfU8a6RpFbx3lf8TJhDI8/LXB6O6wtLwGxNe9dsNrZqX05koQvkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738599746; c=relaxed/simple;
	bh=DFHJ3vmErFa4deYA6nOa61KF1ALiQmcEM90eIIvvFMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X7CnFrE729MZAnoXeDBP9+QpYj9aNl6eGbYUVup97Pez7ZYJp4Ce4M3hug7NamhgQhtE4Vd+Cqj+Ci8kHpoJPLzS+us/S0/7aCtSI/gYmoK2Q2x/64VLuqBm7+pNkMGgvgE0VEuuhHG2KYju3jrV20Wjbvx71gJ4RsTAptymjpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B9YrFUCI; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B9YrFUCI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738599744; x=1770135744;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DFHJ3vmErFa4deYA6nOa61KF1ALiQmcEM90eIIvvFMI=;
  b=B9YrFUCIBDCvFSpwd+S9iTQ4qO7DCbVB686QsnItOJmOHz/VV3UoFrxa
   SiRdovjPy3we0ApHbnsgHDtlB/2XgjDn+W7bZa92nr5F5luCugQo4UNkQ
   tc0dtLKWDLFrct6+ZZGXsOb8NO164OW7c+eh+VH+UApbk3zIRQX9wl4Pe
   d2qW1jD4bxpJyVY6QOmrZwmiFxWQVCaIvktKW6qYJcZA31VYWU4Aqn7N/
   W+fKAcbFDzY5uJlQfJjETYv7BhZV6pDX2AAV5wCe0rceEoX/vH9V9YCZe
   34lRPH2J8xhnxKhP2pqFaHJvnN7bmC1/6WoGdLFZztlT6nH3+7rR7PZiq
   A==;
X-CSE-ConnectionGUID: ktu542HeQBOMeCzQuNpbJg==
X-CSE-MsgGUID: iASaq+xrQFO5C7o7/7Xeug==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="43023613"
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; 
   d="scan'208";a="43023613"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 08:22:23 -0800
X-CSE-ConnectionGUID: zEXEqU0pSfmp2fB4xfr6fQ==
X-CSE-MsgGUID: LfxRPiJRQ0O+0kB14sbVRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; 
   d="scan'208";a="110158738"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 08:22:20 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tezDE-00000007szN-2wlB;
	Mon, 03 Feb 2025 18:22:16 +0200
Date: Mon, 3 Feb 2025 18:22:16 +0200
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
Message-ID: <Z6DtOEPqTb_9Aqdl@smile.fi.intel.com>
References: <2025020324-thermal-quilt-1bae@gregkh>
 <2025020326-backer-vendetta-7094@gregkh>
 <Z6DchyPieQKBJ0SN@smile.fi.intel.com>
 <2025020300-gown-outmatch-1343@gregkh>
 <Z6DpP3qMNYZoKEP2@smile.fi.intel.com>
 <2025020337-obstruct-washbasin-63a4@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025020337-obstruct-washbasin-63a4@gregkh>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Feb 03, 2025 at 05:13:28PM +0100, Greg Kroah-Hartman wrote:
> On Mon, Feb 03, 2025 at 06:05:19PM +0200, Andy Shevchenko wrote:

...

> > > > > +	faux_obj = kzalloc(sizeof(*faux_obj) + strlen(name) + 1, GFP_KERNEL);
> > > > 
> > > > Potential overflow. To avoid one may use struct_size() from overflow.h.
> > > 
> > > Users should not be providing the string here.  Again, this comes from
> > > platform.c.
> > 
> > I'm not sure I follow. The name parameter is not limited anyhow, so one may
> > provide non-terminated string and strlen() will return an arbitrary number.
> > Potentially this can lead to big numbers and become an overflow when gets
> > to a parameter for kmalloc(). This most likely never happen in real life,
> > but still the overflow is possible.
> 
> I've now bounded at 256, because really, who needs a bigger name for a
> device than that :)

Works for me! With printable ASCII characters it can be estimated as up to
64^256 combinations, which "ought to be enough for everybody" (of course
it will be much less if we count only human-readable strings). :-)

-- 
With Best Regards,
Andy Shevchenko


