Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2EFC1F1905;
	Fri,  6 Jun 2025 18:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749236294; cv=none; b=DhsO2WhxD+6fp4o50GFtfuWi3Y6M6CtyXEo1HPE+NvTBnGYNBzreRd857Z4w1RwqrmBozEk7F/bMkUTiXgPfQRTWY0ozgGh+Q1jKw/yxphg970AeqeKON/8KLugfv/XFAMRxK+aXFJi3Qrw7C/vuIL3KQ7HIrpGCQjh/0VreLtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749236294; c=relaxed/simple;
	bh=h+JweaNJ8/r3ImFh1BQmoSXgPgwr/MU87ypzJO8IqzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hkq8fRaWZJlgQTyQZlvZ4N4T33a2wIJkx+2uU7vSPlpyXynds3HjpTpPrLPBlsh3scQFqZqb2LySxKShvX7GhHsHAbXdlxVsGrQwZhFovm2uHxEmqugg5wdF2hfrGMDWEPMJnQP7KDAsmn1NiGzl0kE3/sV7k8bDUxEngs6By9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NGDjiqjc; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NGDjiqjc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749236293; x=1780772293;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=h+JweaNJ8/r3ImFh1BQmoSXgPgwr/MU87ypzJO8IqzY=;
  b=NGDjiqjcfQSTxmHe+MrovDcNX0R1yKx7dMP3PezA/8/MlRyCSJ4NW5xx
   dGekXFck/TZVK3TZNkJSqT66krF6v71wJ5Oy25L0qh6+YcPOCRkhCtS29
   nyfj37fmYrSovyV/y6H8lcj1B8PCZBjbLVPVc1h2yydFV+HU2ityJLFZX
   3wC3y1i48a0nCb5QdR6e8IK6FzWuPDudSOgvoNA1DVnvJ7XQmOd0iCNeI
   vUMQ08Fgy9yw7t6B8VVvI3dWTHYYUf0UA2CB2cVx55n+QDlcgiEfD76rc
   ZjfgPdlWbmpNQrM695yVWTQ9DYzsTjpk7D83Ag2fj2+rZixwVNntsA+eK
   g==;
X-CSE-ConnectionGUID: 4PLoupiuREGHcij6B8CAkA==
X-CSE-MsgGUID: Ppx7KYFURvSdVg6kvKC7UA==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="51303831"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; 
   d="scan'208";a="51303831"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 11:58:12 -0700
X-CSE-ConnectionGUID: PM6PjR8cTDSt7gCu1v3XvA==
X-CSE-MsgGUID: nvBpNtQmRlGWhkbun1OPAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; 
   d="scan'208";a="146415947"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 11:58:09 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uNcGU-00000004HtF-18zX;
	Fri, 06 Jun 2025 21:58:06 +0300
Date: Fri, 6 Jun 2025 21:58:05 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, ikepanhc@gmail.com,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
	Armin Wolf <W_Armin@gmx.de>, linux-doc@vger.kernel.org,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] platform/x86: Move Lenovo files into lenovo subdir
Message-ID: <aEM6PTCql7l1n6e0@smile.fi.intel.com>
References: <20250604173702.3025074-1-mpearson-lenovo@squebb.ca>
 <202506062319.F0IpDxF6-lkp@intel.com>
 <6d17454f-faac-4616-ac2e-7da80feedf2c@app.fastmail.com>
 <aEM6Da6CZ0DI3x8w@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEM6Da6CZ0DI3x8w@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Jun 06, 2025 at 09:57:17PM +0300, Andy Shevchenko wrote:
> On Fri, Jun 06, 2025 at 01:30:25PM -0400, Mark Pearson wrote:
> > On Fri, Jun 6, 2025, at 11:58 AM, kernel test robot wrote:

...

> > I'm unable to reproduce this issue with a W=1 build
> 
> Do you have GCC-12?

To be more precise you need to have a CONFIG_DMI=n.

> > and I think it's a false positive.
> 
> I think the problematic line is in certificate_store().
> You need to check the value of dmi_get_system_info().
> Or make sure the DMI is always selected (depend on DMI
> in Kconfig, perhaps).
> 
> > Am I safe to ignore this report?
> 
> Please, try to fix it.

-- 
With Best Regards,
Andy Shevchenko


