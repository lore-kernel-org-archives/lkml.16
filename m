Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B1826FA54;
	Thu,  8 May 2025 14:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746714723; cv=none; b=mNwwSRtEGku+fDVvLCDGHrS2GXRBo7Ubd6xKb4k3ePFE68LCFXL/hgi3SNzyVaX7wJ03gzBjQIy0a8GTYtoxUdwA67aAwyhmZyxGcAJ7BTq9nKFzxo+yMKz8KRQgW6kN4BA0/ShnarrT4WQJX/m2fwCVX5Bhng3JUnMk1+97usw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746714723; c=relaxed/simple;
	bh=uVh0/3Gi74lEwZOQuHQj7aeM5bZU7QEGlE1JVLL5DOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lzaQBGYuEw0VD+NA1Ot/bJI0HYct6umXd2LGulUsUWVkCGQHjQByZZ94uWPBC9Zflt5eKOrfFyviIHTQBiGLtbXtO8piQC7Q8bL0tAO/Wo7kHBaG0Toxt5bE5KLUivEPwKmyKlLg0Yd3yLliYpqIHgXX1kC5/iDr9jwRwtoluM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C/LLD/8N; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C/LLD/8N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746714722; x=1778250722;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uVh0/3Gi74lEwZOQuHQj7aeM5bZU7QEGlE1JVLL5DOA=;
  b=C/LLD/8NEiDVaBJn/tJ54KfBzQr9Khy6mY2AJZEOremDwVRzYQNduwLU
   vb/x5LQOt9/BpmkgrSDiMX9YrvzItVskwSQhcU7iUp89sDbTFShomIBg0
   nU1CJQXdWokT0iqa815H5CrP//0Rq8LzJSV+8QkiJdkX7V7CqA4ZyP94e
   Iy2LLEvImcHYsuGtdyRqrjhao9ozd3LGKvv39yrEV9QXETOaPyMaTHUGB
   3JA4lArwzZnS61hFi6/W/OJ3X2Yz2cPJgedmpr80/yM4ByepYTN9UiX4n
   Oo4zLBmhLUFnHLbvIi2CYAtziWG7lXEdKwKrHABAW/NcK8RQrb65g8JzB
   Q==;
X-CSE-ConnectionGUID: xk7PMD/BSByrRfOPok35/g==
X-CSE-MsgGUID: nfpC+XpEQB6xlGoknVqFIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="47759511"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="47759511"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 07:32:01 -0700
X-CSE-ConnectionGUID: RXl21VRQTXCPesTxaQlhwg==
X-CSE-MsgGUID: vLwtqeSWQuC75hJojVJD8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="136194494"
Received: from smile.fi.intel.com ([10.237.72.55])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 07:31:58 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uD2Hy-000000048S7-1sFr;
	Thu, 08 May 2025 17:31:54 +0300
Date: Thu, 8 May 2025 17:31:54 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, ikepanhc@gmail.com,
	W_Armin@gmx.de, linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net
Subject: Re: [PATCH 2/2] platform/x86: export thinkpad_acpi handles
Message-ID: <aBzAWrgEgmnAnum-@smile.fi.intel.com>
References: <mpearson-lenovo@squebb.ca>
 <20250507190456.3004367-1-mpearson-lenovo@squebb.ca>
 <20250507190456.3004367-2-mpearson-lenovo@squebb.ca>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507190456.3004367-2-mpearson-lenovo@squebb.ca>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, May 07, 2025 at 03:04:35PM -0400, Mark Pearson wrote:
> Add API to be able to get the thinkpad_acpi various handles.
> 
> Will use this to start pulling some of the thinkpad_acpi functionality
> into separate modules in the future.

...

> +#ifndef _TP_ACPI_H_
> +#define _TP_ACPI_H_

+ include for  acpi_handle typedef.
Or it the forward declaration works

acpi_handle;

but I haven't checked and my gut feelings that it's not correct syntax as
compiler doesn't know what the heck this word means.

> +enum tp_acpi_handle_id {
> +	TP_ROOT_HANDLE,
> +	TP_EC_HANDLE,
> +	TP_HKEY_HANDLE,
> +};
> +
> +int tp_acpi_get_handle(enum tp_acpi_handle_id handle_id, acpi_handle *handle);
> +
> +#endif /* _TP_ACPI_H */

-- 
With Best Regards,
Andy Shevchenko


