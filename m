Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192F52AE6A;
	Tue, 11 Feb 2025 16:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739291434; cv=none; b=LgMYzjOB0YjMyUptvN5gQSg6ZCQyzpBCYGa3WszZQZ6Q9IP3hshbLW6uXQ5BGfS1LlH5reTjaxv3Gx0TpMTwtwZSdDy3xfcjvHq6Eq0EYWnuX6wr2cH4iloV9ngl/xB+d+CU3n35/gfligxgEMBA+eKvwbUYqwAz1sIL2m/PbN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739291434; c=relaxed/simple;
	bh=cHhVe3lnCIHIlSu/fg/SHyBljFFWdesuVmKgHAUgfu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KUoTU4H3CGbwV3oJgjyrqvNeFrjS0LF0JZ41NyXhQ7TzXmxC4o782MWSRquUGJMCeDQ/o6G3kjYWYj20Miy2b0Zu6mYhY72Wyd63yFPIEM71UqT08lt56yhBkqa3kOqC4EOEBUi1KoO4wMsWk0h1hvpCVScqIuRdwrJLQEHMp9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L9/gZbCw; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L9/gZbCw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739291432; x=1770827432;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cHhVe3lnCIHIlSu/fg/SHyBljFFWdesuVmKgHAUgfu4=;
  b=L9/gZbCw1VKTWWVz/9DbtIx7v26ourLKkw6hDgJ+vcS/Re4E3nYgkrGm
   F/2LfQysi/NQVYj6TZgjrk+Zu9TRSfDxAEUCk7qIliKjYfxo+J2IlQqwn
   t/ecc52BjCH6A+1/xc/6oGQXxFczf/DtNlREAZd6+ozXN+IjLBHTNFxoD
   O0aKp8BYeG4KYMWVgjh8RPucfZ5U4Snj2Ky2MikQQa5L3bIAuyujBbNVV
   I+2mhInbC1e+1PJwr0fl1h6CcX3C0TiRJ6ayT5XvkH4nHad2pixz32mxo
   qYqkW9N9pMXwLN5BPswAdbAVMaA9jNByd1ahzCm/fi+/+o/tlsNnsVM3k
   w==;
X-CSE-ConnectionGUID: 1+IOLPFIRGOprJSutrZKOQ==
X-CSE-MsgGUID: ocvsyDVzQR6xzaWCmInXww==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="39802282"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="39802282"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 08:30:30 -0800
X-CSE-ConnectionGUID: 7hmef146TemXHrdIlZ1N/w==
X-CSE-MsgGUID: knwsERq+S12G/QnS/D+DSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="112322563"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa009.jf.intel.com with ESMTP; 11 Feb 2025 08:30:28 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id D49BB8F; Tue, 11 Feb 2025 18:30:26 +0200 (EET)
Date: Tue, 11 Feb 2025 18:30:26 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Kurt Borja <kuurtb@gmail.com>
Cc: platform-driver-x86@vger.kernel.org,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Armin Wolf <W_Armin@gmx.de>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Hans de Goede <hdegoede@redhat.com>, Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 02/14] platform/x86: alienware-wmi: Add WMI Drivers
Message-ID: <Z6t7IjcOFuAbztfn@black.fi.intel.com>
References: <20250207154610.13675-1-kuurtb@gmail.com>
 <20250207154610.13675-3-kuurtb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207154610.13675-3-kuurtb@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Feb 07, 2025 at 10:45:58AM -0500, Kurt Borja wrote:
> Add WMI drivers for LEGACY and WMAX devices.
> 
> This involves moving the platform device registration to a helper
> function that is now called from the driver's preferred WMI device
> driver probe. In the case of the WMAX this is done only if
> `!quirks->thermal` because the newer WMAX interface doesn't support any
> of the LED features of this driver. This also eliminates the need to
> check for `quirks->num_zones > 0` inside alienfx_probe().
> 
> Only one WMI driver is registered on module initialization to prevent
> registering a duplicate platform device.
> 
> Additionally, create_thermal_profile() now takes wmi_device * instead of
> platform_device *.

...

> +static int alienware_alienfx_setup(struct alienfx_platdata *pdata)
> +{
> +	struct device *dev = &pdata->wdev->dev;
> +	struct platform_device *pdev;
>  	int ret;
>  
> +	pdev = platform_device_register_data(NULL, "alienware-wmi",
> +					     PLATFORM_DEVID_NONE, pdata,
> +					     sizeof(*pdata));
> +	if (IS_ERR(pdev))
> +		return PTR_ERR(pdev);
> +
> +	dev_set_drvdata(dev, pdev);
> +	ret = devm_add_action_or_reset(dev, alienware_alienfx_remove, pdev);
> +	if (ret)
> +		return ret;
> +
> +	return 0;

	return devm_add_action_or_reset(...);

> +}

...

> +static const struct wmi_device_id alienware_legacy_device_id_table[] = {
> +	{ LEGACY_CONTROL_GUID, NULL },

Drop that ' , NULL' part, it makes an additional burden if the type of the
driver_data is ever changed.

> +	{ },

No comma in the terminator entries.

> +};

...

> +static const struct wmi_device_id alienware_wmax_device_id_table[] = {
> +	{ WMAX_CONTROL_GUID, NULL },
> +	{ },
> +};

Ditto.

...

> +static int __init alienware_wmax_wmi_init(void)
> +{
> +	return wmi_driver_register(&alienware_wmax_wmi_driver);
> +}
> +
> +static void __exit alienware_wmax_wmi_exit(void)
> +{
> +	wmi_driver_unregister(&alienware_wmax_wmi_driver);
> +}

I believe we have module_wmi_driver() which can be used after the split
(haven't checked those patches yet).

-- 
With Best Regards,
Andy Shevchenko


