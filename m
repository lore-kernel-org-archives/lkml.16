Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4356224EF84
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 14:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743690708; cv=none; b=G8SUIr3HYsAfTzYz7oxSdXxin4sBNH+DslO/j9iOr7CyzvyA0a/XwIvY98SXbe45CJEp9WgQtjBPxTX8O2F2+mbV9I0jjJxUUPfSe+5PfrykYGhpbCxuc0K+1wAdQ1o2QVY48/aKV9aclMmT1V2X4Xumt7fPQgmQSJ6P3OaX6Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743690708; c=relaxed/simple;
	bh=LgifD2968ixmAiJt7CicKh+PelgJS8sP8k+61rZLcoE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=usK4dgeJVSkhT4cD8aCzI9QpE6IsfMi5894z8qSRUzWckEppMQOfXRvRDyp/kIhR8JuXyxgTJ0DmeYTB4JUU5h7+vV1VFHfxKBcrMJm+KlGjGHW3Sy4qvFbNV89lxa5sm235ldTVmTSDJ4tOj+jLtAWMlpa74WF8ha+YK4eH72Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hQqJqYxM; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hQqJqYxM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743690708; x=1775226708;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LgifD2968ixmAiJt7CicKh+PelgJS8sP8k+61rZLcoE=;
  b=hQqJqYxMgAV/2bDxKhiLSRs7Exwl7Pku0VJYU8vyzl+APOHeBUQHgD8r
   RCSsjztDzoqzXjY2/vlZad73IZdw140KgOYhue5z8WyPPzGShYDzHFefC
   /uObdZBFSbRMvaTuAzUpgUx3fx3D4p0eLFItbo7BtL69rOaJ8GtwHdOa2
   U1WhsThFfQr2wJypW3hel9rmdIimkZcYCCfXXNOIMkgN6weWU7d2XeaTz
   5tHuZDDABOvyF2YvDklLrs+qK64XBd+HBev36EmI9q2zbCmrPidhKu6k4
   a89qMdSyNhbXN5xZWrK4prHifx+yq2M57zGiYfIPTOCdb1A/OFnz9sYSF
   g==;
X-CSE-ConnectionGUID: 66co9IIoR8uRyvIa8B1eQw==
X-CSE-MsgGUID: w8L3/voEQq6FNf14OgZM9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="45015450"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="45015450"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 07:31:47 -0700
X-CSE-ConnectionGUID: C/0kh/vCSUWuxmYP9o/ufA==
X-CSE-MsgGUID: DQ29dRfcRYqKmk3hAHy0ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="131738660"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 07:31:45 -0700
Date: Thu, 3 Apr 2025 17:31:41 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, david.m.ertman@intel.com,
	ira.weiny@intel.com, lee@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] mfd: core: Support auxiliary device
Message-ID: <Z-6bzTC5UMMFLS6S@black.fi.intel.com>
References: <20250403110053.1274521-1-raag.jadav@intel.com>
 <2025040336-ethically-regulate-3594@gregkh>
 <Z-6YU24dhxF5PRaw@smile.fi.intel.com>
 <Z-6Y6lbLSbe46-uQ@smile.fi.intel.com>
 <2025040343-vascular-swung-f124@gregkh>
 <Z-6amuPCmtRpUmxj@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-6amuPCmtRpUmxj@smile.fi.intel.com>

On Thu, Apr 03, 2025 at 05:26:34PM +0300, Andy Shevchenko wrote:
> On Thu, Apr 03, 2025 at 03:23:22PM +0100, Greg KH wrote:
> > On Thu, Apr 03, 2025 at 05:19:22PM +0300, Andy Shevchenko wrote:
> > > On Thu, Apr 03, 2025 at 05:16:51PM +0300, Andy Shevchenko wrote:
> > > > On Thu, Apr 03, 2025 at 03:02:47PM +0100, Greg KH wrote:
> > > > > On Thu, Apr 03, 2025 at 04:30:53PM +0530, Raag Jadav wrote:
> 
> ...
> 
> > > > > > 2. Should we allow auxiliary drivers to manage their own resources
> > > > > >    (MEM, IO, IRQ etc)?
> > > > > 
> > > > > The resources are all shared by the "parent" device, that's what makes
> > > > > aux drivers work, they need to handle this as there is no unique way to
> > > > > carve up the resources here.
> > > > > 
> > > > > So I don't know how you would do this, sorry.
> > > > 
> > > > I think we should simply enforce the requirement that MFD on AUX bus must use
> > > > regmap. This will solve the serialisation and common access to the resources.
> > > 
> > > That said, make an additional API call like
> > > 
> > > dev_mfd_add_aux_devices() which should enforce new infrastructure and convert
> > > drivers one by one. Also with that you may add a warning to the existing (PCI)
> > > drivers that are using old API
> > > 
> > > 	if (dev_is_pci(parent))
> > > 		dev_warn(parent, "Uses old API, please switch to ...\n");
> > 
> > Don't add "warnings" like this if you aren't also going to actually
> > convert the code.  Just convert it, otherwise you pester users with
> > problems that they have no idea how to fix.
> 
> Good point. I'm wondering how many actually we have PCI MFD (ab)users right
> now? 30? 100? More?

$ git grep "struct pci_driver" drivers/mfd/ | wc -l
12

Raag
