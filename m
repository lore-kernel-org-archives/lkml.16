Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE7A1DA2E5;
	Wed, 16 Apr 2025 18:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744826652; cv=none; b=atKW1VAz6ZuDhR4BRUabYD55weVGlortf9rsDNY66ZdCOb6KkQqz1IibzQf86EhKSQ9zg1fbdcOU82vX8VYBUlat1yy+lwgjyeHblnG++0hehtTu5eukAyWq7WaKzYvSuY8S0we1ofqRI1+Pi0MkIIAKA8/KX4ikFOECgBK3QRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744826652; c=relaxed/simple;
	bh=rkhovvfIaInjDWiRcY8SysMeEZB09iLQUi8FLP0WOs0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X5OgVZFlUoi9ly5KhcyBeb5U2EyOPrf1NlcjATktwn5Ipvn5nMiczW/9pMahMSiQBbLxhvrlHCNZTFxnoowWDrETpVmUc0vxjwchbJA0n6oZrM04RfufZVy/4op9W5olwDHPLGtRbbjUCpjlXo7UHD98csBHwYH732OW0U4Fz2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UibLDwJE; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UibLDwJE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744826650; x=1776362650;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=rkhovvfIaInjDWiRcY8SysMeEZB09iLQUi8FLP0WOs0=;
  b=UibLDwJEtaCBY9JwyyZiBsIeu1XnUK5Ox0JWkWL/jE2j2IcoumF2D4nm
   TibgO6Kf0SnGpZA3jkrs8Y03vvP93PCTAy1noRB1p/RjJKvNrueLLWlJV
   TXpQPT098s4DAqKie4kCj602Ao1kMJ4vDUH0suQ+IVlzmgQF3Brd+SK4w
   IqmvtN/oO6wxezUWdLb/T4HWP8tAo+nOHAL3wA/eaUNG6LWDSLp2uEnmE
   UomCPswzfyNl4X4wEqMV/w2xpwiaZAlsnohhlUii4yc2QsR+yRcu42jry
   RbkuIB4kJudCjbO82dn4G3EHPdMGsLbC/sx+ySmbYrlsE69SLcj6iwTxn
   g==;
X-CSE-ConnectionGUID: XYn7FMB2Q8mfvvsPQoqOcA==
X-CSE-MsgGUID: Dbx7yUm/QhS/K32+a3ZF5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="49085291"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="49085291"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 11:04:09 -0700
X-CSE-ConnectionGUID: C4g2q8wmRsWcSFP3k09e2w==
X-CSE-MsgGUID: zvQgcI4QTBWaatHHzQt9jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="130557977"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 11:04:04 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u5779-0000000Cvup-46gI;
	Wed, 16 Apr 2025 21:03:59 +0300
Date: Wed, 16 Apr 2025 21:03:59 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: phasta@kernel.org
Cc: Bjorn Helgaas <helgaas@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Jaya Kumar <jayakumar.alsa@gmail.com>,
	Clemens Ladisch <clemens@ladisch.de>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Mark Brown <broonie@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Colin Ian King <colin.i.king@gmail.com>,
	David Rhodes <drhodes@opensource.cirrus.com>,
	liujing <liujing@cmss.chinamobile.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Andres Urian Florez <andres.emb.sys@gmail.com>,
	Oswald Buddenhagen <oswald.buddenhagen@gmx.de>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	sound-open-firmware@alsa-project.org
Subject: Re: [PATCH 02/31] ASoC: intel/avs: Use pure devres PCI
Message-ID: <Z__xD0WcujiT-12-@smile.fi.intel.com>
References: <20250416131241.107903-1-phasta@kernel.org>
 <20250416131241.107903-3-phasta@kernel.org>
 <Z__PINxPVW5QrpgH@smile.fi.intel.com>
 <d035a74a2c6d53721df8d68fd75f439feb8da4a7.camel@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d035a74a2c6d53721df8d68fd75f439feb8da4a7.camel@mailbox.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Apr 16, 2025 at 06:25:52PM +0200, Philipp Stanner wrote:
> On Wed, 2025-04-16 at 18:39 +0300, Andy Shevchenko wrote:
> > On Wed, Apr 16, 2025 at 03:12:12PM +0200, Philipp Stanner wrote:

...

> > >  	bus->remap_addr = pci_ioremap_bar(pci, 0);
> > >  	if (!bus->remap_addr) {
> > >  		dev_err(bus->dev, "ioremap error\n");
> > > -		ret = -ENXIO;
> > > -		goto err_remap_bar0;
> > > +		return -ENXIO;
> > 
> > Here and everywhere else these can now be converted to
> > dev_err_probe().
> > Are you planning to do so?
> 
> I want to do what's necessary to get PCI in better shape, since that's
> what the GPUs and accelerators we / I care about use :)
> 
> IOW, I want pci_request_regions() removed from here.

Okay!

...

> > >  err_remap_bar4:
> > >  	iounmap(bus->remap_addr);
> > 
> > This looks weird if the driver already is using pcim_enable_device().
> > Doesn't this look to you as an existing bug?
> 
> I looked briefly at it and it doesn't appear like an obvious bug to me
> because the drivers uses the (very old? deprecated?) pci_ioremap_bar().

> In any case the driver doesn't set up any devres callback, so has to
> iounmap() manually.

Okay, so they are using managed and non-managed APIs, but release / error path
ordering is fine. So, false alarm then.

> @Bjorn:
> Any comments on pci_ioremap_bar()? Should we mark that as deprecated?

> > > -err_remap_bar0:
> > > -	pci_release_regions(pci);
> > >  	return ret;

-- 
With Best Regards,
Andy Shevchenko


