Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10065207DE5;
	Wed, 16 Apr 2025 15:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744817800; cv=none; b=X6fvHIzUJNoqpwOFLat8FG+pp8mFZ+8ai5RNU2wZ28A6G23cE/IW4VLCH4DUsbqRtrIqyDdTBe6FwvCUz674JtzBMMLcZNFFTiPcbmkWx49W5F/6niAx3fSbtjuPXZnT5/apsWWZlt98vSEZ5Rjn6UQZF4qkdNMXQCyiC8h31yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744817800; c=relaxed/simple;
	bh=SWUTgPO6IBMtCN7W8Plfj7HHO5crI93/Lqd3PIJuN8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B1rVFzZqAlmyZS4i76Md3yuhwwHGF/xO+RsBxfWnoL408vm+FZw0WhLQr3MICmFS9aO88gTs7S4cNvo0x0kSBPjUuK4din145riqbF1WQY3Es6C/mWauJolMozRzNjOXPoBFw59l4E/YTrRRrnerCZ+qiJd9l9+OBl5Vy6mHpSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S8zIOHLA; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S8zIOHLA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744817799; x=1776353799;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SWUTgPO6IBMtCN7W8Plfj7HHO5crI93/Lqd3PIJuN8s=;
  b=S8zIOHLA4w3PhYxp5WjFLRGC7ZXVtJLZZlDJT6H1FsHMOKCnTpxTHjRS
   G2Zal6YQCuopZzstH5deRdIiw2kURnmgO7k9iEiVsr2YgaNW2+EyioSrR
   vtCgKuiqZzHdAgc6NMzATyTVqxsxXdY5zuSs/8GFCdPIrbpRSM8OPpM3w
   Vvvgv6FktH6cV0nkKbkwVi8bY0sGcQ+Thu61+e8XsfuM7hMt+1yWFrpqT
   MhTjMPycuyeAUNRpnLOsjqNaohcuKOyv1Fh2D8sgNRjPZM/ORQT7X7S3P
   h4QfawtTAuzM5lc5imPfVuBvbZMxCzi2beAwCoTCiD60CtOntAavExloL
   A==;
X-CSE-ConnectionGUID: uF02SWFZTPqxOikCVDfvkg==
X-CSE-MsgGUID: 7EIsCdynTOyMiwnESaSXCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="57012300"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="57012300"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 08:36:38 -0700
X-CSE-ConnectionGUID: O+9qB8NzQMCueDaUY3VkyQ==
X-CSE-MsgGUID: s6DkyLxGTSmgzrvvKDglVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="130478032"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 08:36:32 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u54oO-0000000Ctrg-1OXT;
	Wed, 16 Apr 2025 18:36:28 +0300
Date: Wed, 16 Apr 2025 18:36:28 +0300
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
Subject: Re: [PATCH 01/31] ASoC: sof: Use pure devres PCI
Message-ID: <Z__OfGRaD0iu1hgJ@smile.fi.intel.com>
References: <20250416131241.107903-1-phasta@kernel.org>
 <20250416131241.107903-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416131241.107903-2-phasta@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Apr 16, 2025 at 03:12:11PM +0200, Philipp Stanner wrote:
> pci_request_regions() is a hybrid function which becomes managed if
> pcim_enable_device() was called before. This hybrid nature is deprecated
> and should not be used anymore.
> 
> Replace pci_request_regions() with the always-managed function
> pcim_request_all_regions().
> 
> Remove surplus calls to PCI release functions, since pcim_ functions do
> cleanup automatically.

...

>  	ret = snd_sof_device_probe(dev, sof_pdata);
>  
> -out:
> -	if (ret)
> -		pci_release_regions(pci);
> -
>  	return ret;

Obviously you can go further

	return snd_sof_...(...);

-- 
With Best Regards,
Andy Shevchenko


