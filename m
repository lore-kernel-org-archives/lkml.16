Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1100A25C6F1;
	Tue, 11 Feb 2025 16:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739292319; cv=none; b=KF2nLHFCJBDc13Rp0KHVQFqTimktDTDUA4FQdiR6fVEE45/VosZ6Z4RV01g9AqH95TC+eMxBNInPK3E9Q/Wpg10zO90J+gCjgkcpLxlCgA/UgCNKR51y+K7xMvKagRKrCusg78nU/M84ifLUb5opw1AU5RXxrZNvR/7F5VRE4UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739292319; c=relaxed/simple;
	bh=9L8ZUqbF0iBBMP8MLx4Nbtbs0icr/OMc95hLDEUrnNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UT2vL/sfTXvqassC38Fra3wZViKRH5RIAUOnPDVY/iNNRzLX+kQEVO78CyEBcvPJnhxamUczKIAarxpd3fWsqi/M7uAEa16UH7Sqa8U7PvlRNKN8+JCTm+ivSUcnstMFtDNqELqfDZcPOIP+OymE859HbXo2maQroPobiF7D2JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QKwjrfyM; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QKwjrfyM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739292318; x=1770828318;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9L8ZUqbF0iBBMP8MLx4Nbtbs0icr/OMc95hLDEUrnNA=;
  b=QKwjrfyMO3Q+fxl2DLjDhWxL5WNc4p6fDlOB3tIPVjx0LHuK4sBd3/CL
   rtWhVPg49kcTFGCq4Y57nDhJUjM/GIH4FOmlF0AViJQDyr3iBzKPqXekF
   szWUpb7UuCOSpnVfKJxOlXTM665qQcfHykB+iHg6xzNF7+wxiDzJp16Se
   kikUtzLWAuv4d6t5YoRN+hh+v+nFgAClyQ2XX5fmMZ2094YpTnsbaGQvC
   NevUIya9aoMPXi6K+QfRlNQuLN7zhhXUBR8peZdkjFvS0jaTPvx7UgWzk
   sFMkPqb5soDcumzG/n83cJrwlj0X4GLApxyhamHl9dgM6k++p5FL2aYN8
   Q==;
X-CSE-ConnectionGUID: X63kVlkpSt2unauJU0VTaQ==
X-CSE-MsgGUID: hG+92dUVSbiEyXJfnlsSSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="57456568"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="57456568"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 08:45:17 -0800
X-CSE-ConnectionGUID: MgiNAx4zTPWcnaKHTcJguA==
X-CSE-MsgGUID: hUcvkqNZTX2Me5q66LplVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117176250"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa005.fm.intel.com with ESMTP; 11 Feb 2025 08:45:15 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 3BAF88F; Tue, 11 Feb 2025 18:45:14 +0200 (EET)
Date: Tue, 11 Feb 2025 18:45:14 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Kurt Borja <kuurtb@gmail.com>
Cc: platform-driver-x86@vger.kernel.org,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Armin Wolf <W_Armin@gmx.de>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Hans de Goede <hdegoede@redhat.com>, Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 10/14] platform/x86: Add alienware-wmi.h
Message-ID: <Z6t-msAAi1lVHzN9@black.fi.intel.com>
References: <20250207154610.13675-1-kuurtb@gmail.com>
 <20250207154610.13675-11-kuurtb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207154610.13675-11-kuurtb@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Feb 07, 2025 at 10:46:06AM -0500, Kurt Borja wrote:
> Add a header file for alienware-wmi with shared resources to support the
> upcoming file split.

...

>  static const struct attribute_group *alienfx_groups[] = {
>  	&zone_attribute_group,
> -	&hdmi_attribute_group,
> -	&amplifier_attribute_group,
> -	&deepsleep_attribute_group,
> +	WMAX_DEV_GROUPS
>  	NULL

I don't like this change as it makes code harder to understand (at one glance
you can't answer the question "what are the groups that being listed here?".

>  };

...

> +#include <linux/leds.h>
> +#include <linux/platform_device.h>
> +#include <linux/wmi.h>

This should follow IWYU principle, now it looks like random stuff which this
header does *not* use.

-- 
With Best Regards,
Andy Shevchenko


