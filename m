Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F33221C9EB;
	Mon,  9 Jun 2025 20:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749500259; cv=none; b=KCjieaHI11EtLq3Sh51OzTH7EArbE4Gyi/xJQzAEHP+IHVmqLTYdN1qaKAxVGbg62qLuBTOzJbSxnRC0+yq7cgSHRKojQ2Hojl/RRMNOw4aOmXRgMxlYZ0vTU8o1nvsz/HsyBVpS79/+oIA0HREzutfQpjOgx7VdHZYOENUL6RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749500259; c=relaxed/simple;
	bh=R38hBJb4hHoL2F5+5FBgstMAamHDnZtofOGjHkEGdLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RerYKfrRqeyeo6oKv15B+bubcQrTyT4qbDRJmIBs1fFhV6AdqDwBDkhtsSGgtLOvAuzyKx0djkMBhgR9ya9ukdNcD4DUQ6unowYogUN4ESl1fbyStFDlrte2So0q2Bh0GvLwduuX8S1JHDTY+DYqCNsNJEki8osfX41Y24p8FgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=abdIULbV; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="abdIULbV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749500258; x=1781036258;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=R38hBJb4hHoL2F5+5FBgstMAamHDnZtofOGjHkEGdLA=;
  b=abdIULbVd6pwFSMARF+avRbmTI0vSJ5+HNIBRf2WRO6iUMfgH6GZFjyl
   Kiv9QSJgAShybX49S9cCiRSBH61wM6WWpqhgW0xeuGbjeNQDkJRcj62pO
   XecHO96HS2AUTM5Ec2tk3NN/ricNJbF6Yl12RgFIzz+u/SGARi9JInJlj
   k1bW1LlzMrOAtV+hgv6KjFTxSdl7f+wndLwD5pbVlVJ0abnDAJgbCGsHz
   pIZ+Gs3QVTBKdsIOo6iJ+z9gyxeWva1QyI6kACXRUIGjja/LQ/0YtqZOh
   U7O93e8ucuTP7gQNidxY/5wrECFuHQySh+OB9S12lQfqHCYDfaVOAJhWp
   Q==;
X-CSE-ConnectionGUID: e4qHPcNESoabaxlaQm0BOg==
X-CSE-MsgGUID: LW54T6MuTAm6nbFzKUntBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="55383515"
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; 
   d="scan'208";a="55383515"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 13:17:37 -0700
X-CSE-ConnectionGUID: Whf+OXgjQ9aoFFT+hIUQeQ==
X-CSE-MsgGUID: aNY/rQXdQxasgbLrXD2BOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; 
   d="scan'208";a="151752800"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 13:17:34 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uOivz-000000059br-3N0w;
	Mon, 09 Jun 2025 23:17:31 +0300
Date: Mon, 9 Jun 2025 23:17:31 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: ilpo.jarvinen@linux.intel.com, hdegoede@redhat.com, corbet@lwn.net,
	ikepanhc@gmail.com, hmh@hmh.eng.br, W_Armin@gmx.de,
	linux-doc@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] platform/x86: Move Lenovo files into lenovo subdir
Message-ID: <aEdBWymLN7aYqkeB@smile.fi.intel.com>
References: <mpearson-lenovo@squebb.ca>
 <20250609122736.3373471-1-mpearson-lenovo@squebb.ca>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609122736.3373471-1-mpearson-lenovo@squebb.ca>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Jun 09, 2025 at 08:27:24AM -0400, Mark Pearson wrote:
> Create lenovo subdirectory for holding Lenovo specific drivers.

...

>  LENOVO WMI HOTKEY UTILITIES DRIVER
>  M:	Jackie Dong <xy-jackie@139.com>
>  L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
> -F:	drivers/platform/x86/lenovo-wmi-hotkey-utilities.c
> +F:	drivers/platform/x86/lenovo/lenovo-wmi-hotkey-utilities.c

Is this correct?

Otherwise LGTM.

-- 
With Best Regards,
Andy Shevchenko


