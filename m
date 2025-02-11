Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9071E5B68;
	Tue, 11 Feb 2025 19:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739300648; cv=none; b=gOOcURZSLrIiDNzCE7qGBkdqsJHVe4FywIVpHg9DcgPbZvWHXjQ6+BDNxILls+FIRQRm/+chSfgfBOqZqnfV8i5HiG1EezT6HIuY0SmQnU51KDOoVF04wie5Q5M5tHoDpz+9m09Q8B/1eXTDTSkp1opV9hq1OC4chuT3/8DA/rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739300648; c=relaxed/simple;
	bh=/Ljjw5AlvMvn7fg6wWvVO+9IlLKhPy1ShhOtpXaNzGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ITErcbqu3DTuQu/b1reWKAmomGEZK09lnM07e1i9nHaozOTUF2PcMHoeQvYSrQDx/dJaqxXEayjV/exLY+61y0oPhwkHxgu83/CljEEiRhYC8kHqP67lmTyMUbeyxTUGsqjewwf9lrVDKICHvCGRfXOIFGO5x6ZS65m9XJaohWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W3XhRlZn; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W3XhRlZn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739300647; x=1770836647;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/Ljjw5AlvMvn7fg6wWvVO+9IlLKhPy1ShhOtpXaNzGQ=;
  b=W3XhRlZnEpfMzCTfwm/a2iI2/5XVcXuNd5rHSJLt+bVQyqgs5oeCYACx
   dda4IT6xykC2EJiX00yMhWOtpiZwcdiDY8sOVRboJEKoGuZWI1pl+2UHF
   nduRCT8b92AKyF7GX3bVhNzvCEh+2+1OML6NPvPjgGhRhAmIzQiRbGvJT
   ST6+awZbYp/ZydyVXYK/49U0lwJNLTQLiwk0A880CUFaEco3fViYKCE4R
   pk6tyhO9Un1qouxOYwRKsC3KOrSeUKgeNLiFjqystd4ofvv1CduCxIimI
   QP7vB7kq7ZiRPPwDMInglNrx1LWjBMmiudsRFxduqtVsWzbB3LoTJ+Voa
   A==;
X-CSE-ConnectionGUID: pJ1yCOfUTa+SxZIXyxKZ+w==
X-CSE-MsgGUID: ERgtw4aUTda3N083KYeICw==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="62403692"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="62403692"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 11:04:06 -0800
X-CSE-ConnectionGUID: GpuNRdGGT2qKGGc/VMzOOA==
X-CSE-MsgGUID: Kz2gOXTpSP2BT1vgOrFtJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="113109845"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 11:04:04 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1thvY9-0000000AbNv-1OyJ;
	Tue, 11 Feb 2025 21:04:01 +0200
Date: Tue, 11 Feb 2025 21:04:01 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Kurt Borja <kuurtb@gmail.com>
Cc: platform-driver-x86@vger.kernel.org,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Armin Wolf <W_Armin@gmx.de>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Hans de Goede <hdegoede@redhat.com>, Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 11/14] platform/x86: Split the alienware-wmi driver
Message-ID: <Z6ufIQADzILVMusc@smile.fi.intel.com>
References: <20250207154610.13675-1-kuurtb@gmail.com>
 <20250207154610.13675-12-kuurtb@gmail.com>
 <Z6uBJ9AC5XgZTlJG@black.fi.intel.com>
 <D7PT98IDXMUV.G2F1LRF8BX7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D7PT98IDXMUV.G2F1LRF8BX7@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Feb 11, 2025 at 12:59:53PM -0500, Kurt Borja wrote:
> On Tue Feb 11, 2025 at 11:56 AM -05, Andy Shevchenko wrote:
> > On Fri, Feb 07, 2025 at 10:46:07AM -0500, Kurt Borja wrote:

...

> >>  obj-$(CONFIG_ALIENWARE_WMI)		+= alienware-wmi.o
> >>  alienware-wmi-objs			:= alienware-wmi-base.o
> >> +alienware-wmi-y				+= alienware-wmi-legacy.o
> >> +alienware-wmi-y				+= alienware-wmi-wmax.o
> >
> > Oh my... it's even inconsistent!
> 
> Again, this is an already used pattern:

> 	https://elixir.bootlin.com/linux/v6.14-rc2/source/drivers/platform/x86/dell/Makefile#L14
> 
> I add configuration entries later. Is the order of the changes wrong? or
> is it the entire approach? Do other modules here need a fix?

Again, it doesn't mean it's correct.

Maybe other modules also need that, I don't remember, but you may `git log
--no-merges --author="Andy" --grep objs` to see changes I made in the past.

...

> >> +	if (!ret) {
> >> +		if (out_data == 0)
> >> +			return sysfs_emit(buf, "[disabled] s5 s5_s4\n");
> >> +		else if (out_data == 1)
> >> +			return sysfs_emit(buf, "disabled [s5] s5_s4\n");
> >> +		else if (out_data == 2)
> >> +			return sysfs_emit(buf, "disabled s5 [s5_s4]\n");
> >
> > The whole code inherited same issues like redundant 'else'. Please, refactor.
> 
> This is not my code, so a separate patch would be needed.

Okay!

...

> >> +	if (strcmp(buf, "disabled\n") == 0)
> >> +		args.arg = 0;
> >> +	else if (strcmp(buf, "s5\n") == 0)
> >> +		args.arg = 1;
> >> +	else
> >> +		args.arg = 2;
> >
> > sysfs_match_string()
> 
> Same as above.

Same as above :-)

...

> >> +	if ((code & WMAX_THERMAL_TABLE_MASK) == WMAX_THERMAL_TABLE_USTT &&
> >> +	    (code & WMAX_THERMAL_MODE_MASK) <= THERMAL_MODE_USTT_LOW_POWER)
> >> +		return true;
> >> +
> >> +	return false;
> >
> > 	return ...
> >
> > but if you wish, this one is okay.
> 
> This was done for readibility. Also this would require a different
> patch.

No need, I'm fine with the current approach, just to show the alternatives.

...

> >> +	ret = wmax_thermal_information(priv->wdev, WMAX_OPERATION_SYS_DESCRIPTION,
> >> +				       0, (u32 *) &sys_desc);
> >
> > How do you guarantee an alignment? Yes, it might be good for the specific
> > hardware, but in general this is broken code.
> 
> This is a good question. I'm not really sure how to fix this tho. Is it
> fine to just pass a __packed struct? Also this would require another
> patch.

Usual approach here is to use one of get_unaligned_le32(), get_unaligned_be32()
depending on the byte ordering.

> >> +	if (ret < 0)
> >> +		return ret;

...

> >> +		set_bit(profile, choices);
> >
> > Do you need it to be atomic?
> 
> I don't think so. `choices` belongs to this thread only.

So, __set_bit() will suffice then.

...

> >> +void __exit alienware_wmax_wmi_exit(void)
> >> +{
> >> +	wmi_driver_unregister(&alienware_wmax_wmi_driver);
> >> +}
> >
> > Why not moving these boilerplate to ->probe() and use module_wmi_driver()?
> 
> This 3 files are a single module and it has two WMI drivers so this
> can't be used.

Can it be split to two separate modules then?

-- 
With Best Regards,
Andy Shevchenko


