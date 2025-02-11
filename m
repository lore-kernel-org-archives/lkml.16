Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A452580D9;
	Tue, 11 Feb 2025 16:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739291856; cv=none; b=uzN65JuClEhImzMaTxYGAeZITpM29+S0gGT2FXahaq1M+/ztmkONuMe52w6+XvCliZjfv3CNS3906jQcbqX1yoNUNzcrZXk2WKpsvXn79WXh70gKUJ2o+Gzn1qqMj+LdQzDYz3h4wfwZq/MAlH8XPjUrOG8PU8L1S+OmxwT7f0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739291856; c=relaxed/simple;
	bh=hcwZMqLxIT7u1tOWKgzkrJXenrowwi+qLEbQbK2WC0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=csDSu27iyLi+5jG8H2LKlW5xxn8da8Q0AhzSbeZJ4G7nqbtPVeL2le5vAaNQpd5s7giN+H4CerFHQyF/x3ZX46NoryBZ8GNcyo+JB77Ul4a5Gh2kD+OM8ydIWle/7OFJBXk5IF4lSxUzzlsb9h3dTMc193rVzIbcjVbBIAQ8qH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eDPOzy+j; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eDPOzy+j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739291855; x=1770827855;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=hcwZMqLxIT7u1tOWKgzkrJXenrowwi+qLEbQbK2WC0A=;
  b=eDPOzy+j9BujVssGyuPFb86unQOfABWMPDe8QhF/OFHCLgnX9MbIaCyT
   gcty/DNX8f7lANsqbosQ/d1a4PBQpP+QSdNw/NnsCDzL7ku1/cVgr+Pe0
   qr1I/2v3mHS0g+0mEqTA5dj7RZpziBgUaZvWUtq4AH7SeFwmejkLmPXMG
   0KLZUXzvhOouCzHl0hvgBNhdexRn97qcXlDRp48o+OHsLIOAswEBIkFWD
   Np15XObfIUvW7qjMyQ/Nsaqt+kks15gIXbrYVrZtd+CXxLSKC3Js/kthu
   ChlSfXaBmig1rm1TAMugJb1hsZ1rPKANVZr6hC5pg4+v/EEjiBrjTjHer
   Q==;
X-CSE-ConnectionGUID: qwt8OXLjSRyJKTAtdcjGgQ==
X-CSE-MsgGUID: Q4p5g9l6TgSyPUJSt/tpSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="39783093"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="39783093"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 08:37:34 -0800
X-CSE-ConnectionGUID: SydUbG5dRaG440IrlEtoig==
X-CSE-MsgGUID: 0ZjCvwzuRv+FkzqvigaXtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113047173"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa007.jf.intel.com with ESMTP; 11 Feb 2025 08:37:33 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 5FE848F; Tue, 11 Feb 2025 18:37:31 +0200 (EET)
Date: Tue, 11 Feb 2025 18:37:31 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Kurt Borja <kuurtb@gmail.com>
Cc: platform-driver-x86@vger.kernel.org,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Armin Wolf <W_Armin@gmx.de>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Hans de Goede <hdegoede@redhat.com>, Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 05/14] platform/x86: alienware-wmi: Refactor hdmi,
 amplifier, deepslp methods
Message-ID: <Z6t8y7VvZL6UDEck@black.fi.intel.com>
References: <20250207154610.13675-1-kuurtb@gmail.com>
 <20250207154610.13675-6-kuurtb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250207154610.13675-6-kuurtb@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Feb 07, 2025 at 10:46:01AM -0500, Kurt Borja wrote:
> Refactor show/store methods for hdmi, amplifier, deepslp sysfs groups to
> use alienware_wmi_command() instead of alienware_wmax_command() which
> uses deprecated WMI methods.

...

> +	pr_err("alienware-wmi: unknown HDMI cable status: %d\n", ret);

Rather introduce pr_fmt() and drop all these prefixes.

> +	if (!ret) {

Traditional patter is to check for errors:

	if (ret) {
		...do error handling...
	}

>  		if (out_data == 1)
>  			return sysfs_emit(buf, "[input] gpu unknown\n");

>  		else if (out_data == 2)

Redundant 'else'.

>  			return sysfs_emit(buf, "input [gpu] unknown\n");
>  	}
> -	pr_err("alienware-wmi: unknown HDMI source status: %u\n", status);
> +
> +	pr_err("alienware-wmi: unknown HDMI source status: %u\n", ret);
>  	return sysfs_emit(buf, "input gpu [unknown]\n");


...

>  	if (strcmp(buf, "gpu\n") == 0)

Wow! This should be fixed to use sysfs_streq()

...

> +		pr_err("alienware-wmi: HDMI toggle failed: results: %u\n", ret);

pr_fmt()

...

> +	pr_err("alienware-wmi: unknown amplifier cable status: %d\n", ret);

Ditto.

Also note, if you have a struct device available, use the respective dev_*()
macros instead.

...

>  	if (strcmp(buf, "disabled\n") == 0)

sysfs_streq() / sysfs_match_string() — whatever suits better.

-- 
With Best Regards,
Andy Shevchenko


