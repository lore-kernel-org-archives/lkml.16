Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27D325332A;
	Tue, 11 Feb 2025 16:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739291632; cv=none; b=axwyk1Tzs4jVAHye0YXGYw2gK0FfKOfmemq9NcnEvcrnSNgMxM+1EE8VydN0GUjiD+HwDt4Vt9vaW59J1zhV1+1FtD2v1AqVtSEl5RBacp7jPGrNrlU8Z+L/Tm12JNTy8wtnPEpHOZuIWnS7aA5/cyLCXCvoKbufI5khsaC0c4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739291632; c=relaxed/simple;
	bh=NiU17ZiL7r9njo66V2OXrxgI1jtsjxyiCos9qiXsT/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=meeLdcX+UxXRLxeQmjHlrJmmSkfcQyJrmJdpr8evahOOQjDJcMgMmLGqsRcRz1tN5bdPR2iaGyqgxN5z89wDO3vShsC5iEm5TWUTccu35/zZXK/IpdxBsjgVKu0jEbMBbIQtgU5UUPA8LIMpScM4+NCj/AUlO0bu6APD44Wo11Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U4YfXNEw; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U4YfXNEw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739291630; x=1770827630;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NiU17ZiL7r9njo66V2OXrxgI1jtsjxyiCos9qiXsT/A=;
  b=U4YfXNEwWrRiaPP9pT8OcC6+zSyIQtGK9zr14xIaCYDAIqgSD+Dp/g0R
   8ts54nX9AMEZrFRjb/peXVmFuREEh7YA54rk+zo1WshjqfaJppxygjMwm
   HZ8KDlZnYI9NCu0alvK5c+vwXMlRlUTzOfIW68665TNRnkM1+XEtV7+SR
   XFe4rupdYUWbs/5fiY2JjKpEBfAD1hBE1VpKXGl9/I0EtptTcd/E3pUoB
   2FCiJeM3l1p3qvq7NCS8YTfq51wkX4Uh0Fy47gxBEKgAQOXqujmTZWRuJ
   KOBHQvwG+38V8eZ9C37bQc+Bi1srHnOvNbcMeZ9l7NohNDqwFd4zuyUBH
   w==;
X-CSE-ConnectionGUID: K6I/9dZPTwWZ47W2NcVaig==
X-CSE-MsgGUID: 13lHL14QSIGrkL8lgNJZxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="62389088"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="62389088"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 08:33:50 -0800
X-CSE-ConnectionGUID: MuvdhWw1SSe7ORDRKW5o0A==
X-CSE-MsgGUID: Bm0eJ+ZYS3GOiHoh0NJ5dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="135822447"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa002.fm.intel.com with ESMTP; 11 Feb 2025 08:33:48 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id CBADA8F; Tue, 11 Feb 2025 18:33:46 +0200 (EET)
Date: Tue, 11 Feb 2025 18:33:46 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Kurt Borja <kuurtb@gmail.com>
Cc: platform-driver-x86@vger.kernel.org,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Armin Wolf <W_Armin@gmx.de>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Hans de Goede <hdegoede@redhat.com>, Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 04/14] platform/x86: alienware-wmi: Refactor LED
 control methods
Message-ID: <Z6t76t_4nIXwFX5Q@black.fi.intel.com>
References: <20250207154610.13675-1-kuurtb@gmail.com>
 <20250207154610.13675-5-kuurtb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207154610.13675-5-kuurtb@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Feb 07, 2025 at 10:46:00AM -0500, Kurt Borja wrote:
> Both WMI devices handled by this module specify a distinct interface for
> LED control. Previously this module handled this by dynamically adapting
> arguments passed to wmi_evaluate_method() based on the `interface`
> global variable.
> 
> To avoid the use of global variables, and enable the migration to
> non-deprecated WMI methods, let the WMI drivers define upd_led and
> upd_brightness operations, which completely replace
> alienware_update_led() and wmax_brightness().
> 
> Also define alienware_wmi_command(), which serves as a wrapper for
> wmidev_evaluate_method(). This new method is very similar to
> alienware_wmax_command() but is WMI device agnostic.

...

> +static int alienware_wmi_command(struct wmi_device *wdev, u32 method_id,
> +				 void *in_args, size_t in_size, u32 *out_data)
> +{
> +	struct acpi_buffer out = {ACPI_ALLOCATE_BUFFER, NULL};
> +	struct acpi_buffer in = {in_size, in_args};
> +	acpi_status ret;
> +
> +	ret = wmidev_evaluate_method(wdev, 0, method_id, &in, out_data ? &out : NULL);
> +	if (ACPI_FAILURE(ret))
> +		return -EIO;
> +
> +	union acpi_object *obj __free(kfree) = out.pointer;

Actually we have ACPI_FREE(), but it's not big deal (as of today) to use kfree().

> +	if (out_data) {
> +		if (obj && obj->type == ACPI_TYPE_INTEGER)
> +			*out_data = (u32)obj->integer.value;

Unneeded casting.

> +		else
> +			return -ENOMSG;
> +	}
> +
> +	return 0;
> +}

...

> +	if (legacy_args.state != LEGACY_RUNNING) {

With inverted conditional and duplicated line it will all look better.

> +		legacy_args.state = priv->lighting_control_state;
> +
> +		input.length = sizeof(legacy_args);
> +		input.pointer = &legacy_args;
> +
> +		status = wmi_evaluate_method(LEGACY_POWER_CONTROL_GUID, 0,
> +					     location + 1, &input, NULL);
> +		if (ACPI_FAILURE(status))
> +			return -EIO;
> +
> +		return 0;
> +	}
> +
> +	return alienware_wmi_command(wdev, location + 1, &legacy_args,
> +				     sizeof(legacy_args), NULL);

...

> +static int wmax_wmi_update_brightness(struct alienfx_priv *priv,
> +				      struct wmi_device *wdev, u8 brightness)
> +{
> +	struct wmax_brightness_args in_args = {
> +		.led_mask = 0xFF,

GENMASK()?

> +		.percentage = brightness,
> +	};
> +
> +	return alienware_wmi_command(wdev, WMAX_METHOD_BRIGHTNESS, &in_args,
> +				     sizeof(in_args), NULL);
> +}

-- 
With Best Regards,
Andy Shevchenko


