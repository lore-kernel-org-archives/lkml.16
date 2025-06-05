Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9AE71F0E37;
	Thu,  5 Jun 2025 05:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749103133; cv=none; b=S3BNYItl20vAtv6xE9bY6qpwfflFNoqVoZQuJqF0bMdp8NuhbdN5yQ13QrzFlYzVm9xIHlhCsFjZZf1ENDCHmv4RiAJuedZnCI5/UWBwBVip74sL8s8wx8qeZ2iYmm2/I/T30rIXNFm1qc1WocN3w+ukYmc7OQdJWfLOzrSOaPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749103133; c=relaxed/simple;
	bh=/ByTCSRKhoKS/nj0DFNvNzqPbdF7gDWTNXPA+3K7AJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sW3yvWq0/oiux4ZItWdFdvBK0AFcFbycggj5XQ9NheVlT7FHLY9P4ovfG2is1AZKwRPbw7p/NFk6o10HcfSSkNEyhiRhk9cirNXErqFWsFe68XSu1iEJz+8vTXGZ9ldBHcdaNcPd2qOPA5U09sEXaqOrW9s1RVPoP8Dy/wcmWJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WRVrpB+m; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WRVrpB+m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749103132; x=1780639132;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/ByTCSRKhoKS/nj0DFNvNzqPbdF7gDWTNXPA+3K7AJM=;
  b=WRVrpB+mrpp0W7rb3QnmQx+s+9wMnrtfti4s4gHl6nwRNuxXYx1rpKMH
   T6yyYETaSsgAPu5fIp/plcBXc6pDeXQzIkQ15d11Q2iQaC+b4N8wEbK4d
   yyIZUYvSxn0ASe7HY1Zp1i260FHxCemgVE3wjB4o5x02zuFgwMlV9PM7L
   FNdNKwxeQ0MygkxySeVukLT3BuGFfijfqWdIUBmsPu83u5vp3RT5rW2eK
   PcN+afob2THizbSppO6Q8xCBliZliHrYAxFLVqvxamysen0U+yFbKuZD2
   CYZf2zcPPvAG5uKJOEnPveuRkeNVOahNViGheoFHEjbGSFEMcQPIpC2KL
   w==;
X-CSE-ConnectionGUID: 4s9UYh9CSxufvkLOvc3duw==
X-CSE-MsgGUID: +8cYOmsxT0m+Gl6pfeFz2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="51350675"
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; 
   d="scan'208";a="51350675"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 22:58:49 -0700
X-CSE-ConnectionGUID: Qr7ZhDsVSQa50KZK2V97/A==
X-CSE-MsgGUID: RWXMFbBFSLOCtiLFxCnQFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; 
   d="scan'208";a="146391908"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 22:58:46 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uN3cf-00000003m7A-1apF;
	Thu, 05 Jun 2025 08:58:41 +0300
Date: Thu, 5 Jun 2025 08:58:41 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: ilpo.jarvinen@linux.intel.com, hdegoede@redhat.com, corbet@lwn.net,
	ikepanhc@gmail.com, hmh@hmh.eng.br, W_Armin@gmx.de,
	linux-doc@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] platform/x86: Move Lenovo files into lenovo subdir
Message-ID: <aEEyEfYgpPQm8Tlx@smile.fi.intel.com>
References: <mpearson-lenovo@squebb.ca>
 <20250604173702.3025074-1-mpearson-lenovo@squebb.ca>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604173702.3025074-1-mpearson-lenovo@squebb.ca>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Jun 04, 2025 at 01:36:53PM -0400, Mark Pearson wrote:
> Create lenovo subdirectory for holding Lenovo specific drivers.

...

> -F:	drivers/platform/x86/lenovo-wmi-hotkey-utilities.c
> +F:	drivers/platform/x86/lenovo/lenovo-wmi-hotkey-utilities.c

You may follow the trick in the Makefile (see intel folder) to avoid repetition
of the folder name in the file names. Note, the modules will be called the
same (assuming no ABI breakages due to renames).

...

> -# IBM Thinkpad and Lenovo
> +# IBM Thinkpad

This is a bit ambiguous now. It's IBM and Lenove for ThinkPad... Perhaps you
should put some kind of date or so? Like

# IBM Thinkpad (before 2007)

(note, I speculated on the year, you may know better what to put there).

...

> +++ b/drivers/platform/x86/lenovo/Makefile
> @@ -0,0 +1,15 @@
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Makefile for linux/drivers/platform/x86/lenovo
> +# Lenovo x86 Platform-Specific Drivers
> +#
> +obj-$(CONFIG_IDEAPAD_LAPTOP)	+= ideapad-laptop.o
> +obj-$(CONFIG_LENOVO_WMI_HOTKEY_UTILITIES)	+= lenovo-wmi-hotkey-utilities.o
> +obj-$(CONFIG_LENOVO_YMC)	+= lenovo-ymc.o
> +obj-$(CONFIG_THINKPAD_ACPI)	+= thinkpad_acpi.o
> +obj-$(CONFIG_THINKPAD_LMI)	+= think-lmi.o
> +obj-$(CONFIG_YOGABOOK)		+= lenovo-yogabook.o
> +obj-$(CONFIG_YT2_1380)		+= lenovo-yoga-tab2-pro-1380-fastcharger.o
> +obj-$(CONFIG_LENOVO_WMI_CAMERA)	+= lenovo-wmi-camera.o

> +
> +

No need to have even a single blank line at the end of file. Usually editors
even complain about this.

-- 
With Best Regards,
Andy Shevchenko


