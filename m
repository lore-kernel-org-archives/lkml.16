Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53733186E2E;
	Wed, 16 Apr 2025 15:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744817965; cv=none; b=tH15U+j9hs79hV3og4Hg3UB53A1ldxqRlAbCHFQg5Udh6Zxm2ttodanx5tuxO3wqkEKPhoakRowqLF1BT2hP4WJ8rb00ZwTWhrRl5xq6FWi5FMcI/LoMp/4r2bNfbypuCR+UhsiZVHY13iNTV+FDy6r5CbdinAtuifSIwOOBDpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744817965; c=relaxed/simple;
	bh=Xj9zfm/rN5ErJ4dbR4FMT9pGj1hLLQrRAPsbfftn9yw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KArkDRHyizynP+UcqFtjAQ0AXsG/1YHVdmjYB/NSit4joH09iz4IXBqqoeORai5VWnqN0Ar+aYO8RkuxjU7Dq1gmd5uLASGdq12kUcJJne9xzoxI9Ht/+v5xL4wyHTfYatE7OiQSvl3bqRLQkkkCiigGrBZc7E4k3tTP2J6nn94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VUbizI1q; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VUbizI1q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744817965; x=1776353965;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Xj9zfm/rN5ErJ4dbR4FMT9pGj1hLLQrRAPsbfftn9yw=;
  b=VUbizI1q13gp4gsZ9qt5GcLEo8l7BgJA9NOVskXKrVKNmzVnLWrjwFWK
   GmheYOeF63IWLiZDoD5MbugEMGjhAxBkvdyjsqJroF57z6fDFuc9PnHL4
   bRAJtbJQmy6/8p8WiLRqU7xBzIqW23PEP1ZJhO4eIuZKR5OnJipTT+zZM
   oc8QFqns1DC6vnt3VNCBKUsLdq696YZGK+xy35VlLNYYyqGDibsHQTKu6
   b7V+8pkPX6JKkWubMBzYPBid5mXrev2k4ZJL8dZ9VKANvB9WKOoA/HUIA
   V/FaTuNW6Neqis3m/wJJHeJ4t01jos9/0/nYIniGyreLw+zzL9fUHRg/X
   Q==;
X-CSE-ConnectionGUID: dIqRJ/hmT8iTB/ijT4hfPg==
X-CSE-MsgGUID: Y3V6osM9TUyXOvP93EnW3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="57369376"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="57369376"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 08:39:24 -0700
X-CSE-ConnectionGUID: H9QrCgbIRnaok32ncM1ZcQ==
X-CSE-MsgGUID: HgxOF8vYSDGqWwduLWvO2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="135360964"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 08:39:17 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u54r3-0000000CtuT-02ji;
	Wed, 16 Apr 2025 18:39:13 +0300
Date: Wed, 16 Apr 2025 18:39:12 +0300
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
Subject: Re: [PATCH 02/31] ASoC: intel/avs: Use pure devres PCI
Message-ID: <Z__PINxPVW5QrpgH@smile.fi.intel.com>
References: <20250416131241.107903-1-phasta@kernel.org>
 <20250416131241.107903-3-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416131241.107903-3-phasta@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Apr 16, 2025 at 03:12:12PM +0200, Philipp Stanner wrote:
> pci_request_regions() is a hybrid function which becomes managed if
> pcim_enable_device() was called before. This hybrid nature is deprecated
> and should not be used anymore.
> 
> Replace pci_request_regions() with the always-managed function
> pcim_request_all_regions().
> 
> Remove the goto jump to pci_release_regions(), since pcim_ functions
> clean up automatically.

...

>  	bus->remap_addr = pci_ioremap_bar(pci, 0);
>  	if (!bus->remap_addr) {
>  		dev_err(bus->dev, "ioremap error\n");
> -		ret = -ENXIO;
> -		goto err_remap_bar0;
> +		return -ENXIO;

Here and everywhere else these can now be converted to dev_err_probe().
Are you planning to do so?

...

>  err_remap_bar4:
>  	iounmap(bus->remap_addr);

This looks weird if the driver already is using pcim_enable_device().
Doesn't this look to you as an existing bug?

> -err_remap_bar0:
> -	pci_release_regions(pci);
>  	return ret;

-- 
With Best Regards,
Andy Shevchenko


