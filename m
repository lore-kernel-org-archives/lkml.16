Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30C326217B;
	Tue, 11 Feb 2025 18:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739299919; cv=none; b=DHOzY1OaWoZuriMK/WrDzoqXDwAoD3ImOSLQoEZclxcCETtFpnIL6CQ0/2rEptGqv5Ee3T1EaHcSAltAT7j6Nf7NWosBuMN/43I8KdF3f6IBK6kVcgl2L/7UIU43uQ7egbxWlAB/4XdCQ8b6J10IiOPnFWyrCB1D/WNFdBvTNYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739299919; c=relaxed/simple;
	bh=bxT1tWVjX3teQxTb0Yb7Jl+Lusk2wJeca1F1uRhrbgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DBLBffVgVvfzzuSPFEjwBo0SwKuipfCDntD2tb6cGU1VkRVXLdQSWVo18LjDJ/4tvI/4mqIRqKuUNTNZ8XCMNbus0DTthEvhZLIFPjUkgvI5ur52CYQSVyMnApgSzzqIOsvgX4N2bQYgXDzUIV656wbLWA1gJHOcBlD597Dmdd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QBWl+d2A; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QBWl+d2A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739299919; x=1770835919;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bxT1tWVjX3teQxTb0Yb7Jl+Lusk2wJeca1F1uRhrbgk=;
  b=QBWl+d2Addz2EToTdMzks5ma8K3MaI7O/nTE4Of/jjJO/JW+0Of98+vE
   Dv5GcQ1c/Y8DEo3JV1SGUTdW7gSWskzmPbzdilHouWM07VffZ8D8e+nlf
   +gXIBiR3WMgrBKwMhUZrZYGAVgoyvqZfsHSVbt3IRD+DM5TcWYiY4A4wC
   PaQiFwfIbMiSBCvxmcv4jxo1xhdE2LAqI2asEZbwI48QSlIT0z0W6pigm
   LveK3wjpUFDVKIDuQqWdM88/sktJOEqLskc9AzAk+zddnWsym6w4sOyKH
   /u7s2h7IaU/1goMMK2TF+ZGJqCMtu7YToUDFMqqmBKRaooDiA39L5P+gf
   A==;
X-CSE-ConnectionGUID: JRx/ZoB0SIuxBO4uLLpSIw==
X-CSE-MsgGUID: p5y+IaaPQlOvuC89j00IFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="50919561"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="50919561"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 10:51:58 -0800
X-CSE-ConnectionGUID: +SjOkiDnRwy402D5n7fMVQ==
X-CSE-MsgGUID: jxbJMoCRTbGMqH6ahf8OcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="112812292"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 10:51:55 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1thvMO-0000000AbD4-1QDd;
	Tue, 11 Feb 2025 20:51:52 +0200
Date: Tue, 11 Feb 2025 20:51:52 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Kurt Borja <kuurtb@gmail.com>
Cc: platform-driver-x86@vger.kernel.org,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Armin Wolf <W_Armin@gmx.de>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Hans de Goede <hdegoede@redhat.com>, Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 02/14] platform/x86: alienware-wmi: Add WMI Drivers
Message-ID: <Z6ucSMw8oRJpaMHy@smile.fi.intel.com>
References: <20250207154610.13675-1-kuurtb@gmail.com>
 <20250207154610.13675-3-kuurtb@gmail.com>
 <Z6t7IjcOFuAbztfn@black.fi.intel.com>
 <D7PSZ410LJW6.3VNZ4VU0H5VUC@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D7PSZ410LJW6.3VNZ4VU0H5VUC@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Feb 11, 2025 at 12:46:40PM -0500, Kurt Borja wrote:
> On Tue Feb 11, 2025 at 11:30 AM -05, Andy Shevchenko wrote:
> > On Fri, Feb 07, 2025 at 10:45:58AM -0500, Kurt Borja wrote:

...

> >> +static int __init alienware_wmax_wmi_init(void)
> >> +{
> >> +	return wmi_driver_register(&alienware_wmax_wmi_driver);
> >> +}
> >> +
> >> +static void __exit alienware_wmax_wmi_exit(void)
> >> +{
> >> +	wmi_driver_unregister(&alienware_wmax_wmi_driver);
> >> +}
> >
> > I believe we have module_wmi_driver() which can be used after the split
> > (haven't checked those patches yet).
> 
> This module has two WMI drivers, so I believe this can't be used.

Even after the split?

-- 
With Best Regards,
Andy Shevchenko


