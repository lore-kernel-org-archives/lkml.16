Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1909B156F20;
	Wed, 16 Apr 2025 15:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744818219; cv=none; b=eYoRWJj04gcCFbA/NlJyug+0/xbnCkbL7gJUHDCbVnE4+L95Y/7P2VJKXJn6vIgsuyOZBHerZeWmgFE8XIScxQP8sWDcNCp3hw/sRjW0jbQR9YCWO1chkmBGvJNbKxVpjIso28IkMM2o1fCnHu4T1AH7VSR3IkssRPK/MNgn4R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744818219; c=relaxed/simple;
	bh=OBcUm5mNN0B1SRivgz1mRLVUwpAL3jSBjzXAD8nZhng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l9aJovQsw3PogSLrX7wIZP3f7iq4ap9LBi1u5YZyfwLLrE8E4ZAsqe8MlFy900caxRY4oDpPfxcgFHu9pYwhQIg28h4gnSespln6G33dP9q2eRpoXftlcX0ef66HZqPIjD6lQVIKmLTZcn5xZVTa32zAH71Wc/i7I/3e6TuYDbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OcIRED3Q; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OcIRED3Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744818219; x=1776354219;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OBcUm5mNN0B1SRivgz1mRLVUwpAL3jSBjzXAD8nZhng=;
  b=OcIRED3Q3Q+DOalFcsp5+cpWaYgzFZ9LIoB0LaOPEqfb4SGfEnhEzIRf
   IIn39CGx1BhXM14cyETebvZ5U/NAQzwbAHOEwtx9D+t1mAsXuwI/1dd4A
   pJ5u899Rkgk46SxUw/3MKWJ6f5kMdF5Z1GofTVir+HwNyNcYxX4KStOrd
   Mb/E5OvwVuSO3bbNWEPptsByOwJAxdUZbaEZ8YUsT4duNpXY85QvXcE//
   4vcnxhVmRl6mESwScnRaRU77KExv/ULpLQPwJtgPTrcSH6Upo/9xs/9X7
   KJmrwVQomDALZPGPBQ05ans21rTxnecxzq2raLrjjCgxg/FQ/atAu7Znl
   A==;
X-CSE-ConnectionGUID: eheQvJT5S62rxaebcU0N/g==
X-CSE-MsgGUID: qllN6/SvSpen1IcjMmeY5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46387577"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="46387577"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 08:43:38 -0700
X-CSE-ConnectionGUID: O5DwOgn1Sr6qC2ZH0OWrsg==
X-CSE-MsgGUID: m/g36ZQZTJGI1z1d2eSJ2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="131421708"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 08:43:31 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u54v9-0000000Ctxs-1s8y;
	Wed, 16 Apr 2025 18:43:27 +0300
Date: Wed, 16 Apr 2025 18:43:27 +0300
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
Subject: Re: [PATCH 00/31] sound: Phase out hybrid PCI devres API
Message-ID: <Z__QH4pfOYKhmpvm@smile.fi.intel.com>
References: <20250416131241.107903-1-phasta@kernel.org>
 <Z__OC5NDkQYIHNmL@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z__OC5NDkQYIHNmL@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Apr 16, 2025 at 06:34:35PM +0300, Andy Shevchenko wrote:
> On Wed, Apr 16, 2025 at 03:12:10PM +0200, Philipp Stanner wrote:

> > a year ago we spent quite some work trying to get PCI into better shape.
> > Some pci_ functions can be sometimes managed with devres, which is
> > obviously bad. We want to provide an obvious API, where pci_ functions
> > are never, and pcim_ functions are always managed.
> > 
> > Thus, everyone enabling his device with pcim_enable_device() must be
> > ported to pcim_ functions. Porting all users will later enable us to
> > significantly simplify parts of the PCI subsystem. See here [1] for
> > details.
> > 
> > This patch series does that for sound.
> 
> AFAIK the ASoC and ALSA maintained by different people and perhaps you would
> need to split, but I'm not the guy in charge, so wait for them to tell you
> their preferences.

Seems split is a good to have as I just looked to all of them and ALSA are
pretty straightforward, while for every patch in ASoC I have a comment.

So, here is a formal tag for all ALSA patches. Feel free to send a v2
with them and the tag.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


