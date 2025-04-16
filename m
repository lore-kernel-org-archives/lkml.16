Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19971519B4;
	Wed, 16 Apr 2025 15:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744818095; cv=none; b=eM3xp2AWZyNkpmL1eY76F4CMdZgdpz4sSGRYmDzbnA/SKhJ3WporhKjd2+Bh4YM3GO2e2yQHMRUo8IMdWDTtFfQRPp0/TX22oxoRVdNKYVwZ4TXbHSH6Y7bL4GqCikLLQBHi9JHZA/jHPFT+yqVXueMm4exUexVfDmDJcOvo8jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744818095; c=relaxed/simple;
	bh=6pcFGma3OP3BVIcuVwDM2/nqwbP9hE4r53h6ihIemH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qk3zU6Olv85ID2X9TDp7+XD039+qUhVAQLsirJDsYlmK6h5lo1N0XU9rqgJATDJzfx43Z8tZWi9J284tW93EBgUMZghs0jovF0R3REVlSkQYYyUJE0jyq45ZsLKtQj/mnIAlZ6VDB50QVSmQK207xVz+hO374GWRt6v78kEFFMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c5NUJ5Z5; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c5NUJ5Z5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744818094; x=1776354094;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6pcFGma3OP3BVIcuVwDM2/nqwbP9hE4r53h6ihIemH8=;
  b=c5NUJ5Z59g6Gst4QvlWhAytz7tqAnD6c9M8cttuZWfI/v2hULP6XtDmK
   jHIM0Vh70lGgP9YOZ066qNpxTP/6tuEwRjI4MgOgdHowuwxYM5VztG+HW
   sdhGrtFksL4cGi66VbF2oEcczBB7FrRV1xHkj2mo3KFJIIMzo5wOi2fSW
   MXM+ZxUlMWoVyDrNcdgozB54abMuU2iI4SZe1p5gN71uZxzqxit9pKml9
   1e/cawculRARjfVpOkNjYhGd57Vbpr2sExmG/JMY+eUgXdv4Mpy8MHY01
   TznacRTC39BtN293T69WQoh1Vs2FNcK07wUPed2XYqJJxE0WZX22mg8GT
   w==;
X-CSE-ConnectionGUID: DWYEj3a0TBStKrpfDRp3Ww==
X-CSE-MsgGUID: 2gwAUUkAQCOQrSC0m1TKyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="63784001"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="63784001"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 08:41:34 -0700
X-CSE-ConnectionGUID: PZ1+ZLKzQJu0qlrZHf9/aQ==
X-CSE-MsgGUID: U5e/Sp5cQf+c8YXnUZEawA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="130361211"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 08:41:27 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u54tA-0000000Ctvr-0Ihz;
	Wed, 16 Apr 2025 18:41:24 +0300
Date: Wed, 16 Apr 2025 18:41:23 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Philipp Stanner <phasta@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
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
Subject: Re: [PATCH 03/31] AsoC: intel/atom: Use pure devres PCI
Message-ID: <Z__PozpN0dOH0JWh@smile.fi.intel.com>
References: <20250416131241.107903-1-phasta@kernel.org>
 <20250416131241.107903-4-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416131241.107903-4-phasta@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Apr 16, 2025 at 03:12:13PM +0200, Philipp Stanner wrote:
> pci_request_regions() is a hybrid function which becomes managed if
> pcim_enable_device() was called before. This hybrid nature is deprecated
> and should not be used anymore.
> 
> Replace pci_request_regions() with the always-managed function
> pcim_request_all_regions().
> 
> Remove the call to pci_release_regions(), since pcim_ functions do
> cleanup automatically.
> 
> Pass 0 as length parameter to pcim_iomap(), which is the standard way
> for ioremapping an entire BAR.

...

>  sound/soc/intel/atom/sst/sst_pci.c | 56 ++++++++++++------------------
>  1 file changed, 23 insertions(+), 33 deletions(-)

Cool cleanup!

...

>  	/* DRAM */
>  	ctx->dram_end = pci_resource_end(pci, 4);
>  	ctx->dram_base = pci_resource_start(pci, 4);
> +	ctx->dram = pcim_iomap(pci, 4, 0);
> +	if (!ctx->dram)
> +		return -EINVAL;

Why EINVAL and not ENOMEM? mapping is about memory, no?

> +
>  	dev_dbg(ctx->dev, "DRAM Ptr %p\n", ctx->dram);
> -do_release_regions:
> -	pci_release_regions(pci);
>  	return ret;

Now it seems

	return 0;

should suffice here.

-- 
With Best Regards,
Andy Shevchenko


