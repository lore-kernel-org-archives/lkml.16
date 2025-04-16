Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4047F189902;
	Wed, 16 Apr 2025 15:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744817687; cv=none; b=c2qaB3TZI/fwe4Iam+87gJlPkjSu4A/MM1QQO/6fR6q9IDyFj/ax9UGv0MmGHUJ2ETVFKlnDvt4ZWk+3280d+k/aZZ6dgvjlRqMENUuNuitgHF7AM0nmuWtwUkL9SKkBfynkW1Hm6UTY6J9xC2wDqYz4FMo5Odb0PrR8RJ5Wf/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744817687; c=relaxed/simple;
	bh=zaxzbwyWlfatE3+ds3WIVorARk4YttMEnVcT+1WJOyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SUVf5zKqTXVBcuscHCcgMM86iW5xRetOaqwSsmyztZicwx2li7fTX9js+gJqrXPl3RdjyykVWnDd/DLlmiCwh+tFNjZktXndDpGJ/CD1w5vi9IsfmI68WRNeK00/l/G3CRdPGisGncJS+IpD8YpzzYDLdkpUUlp3TOlSJbvJRwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gBQ2hyXH; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gBQ2hyXH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744817687; x=1776353687;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zaxzbwyWlfatE3+ds3WIVorARk4YttMEnVcT+1WJOyE=;
  b=gBQ2hyXHNUrmjUHI9VRANjX23M0DP7iQ8KdhHIfqAXfsUNdleYsXvPNI
   ScupKZGCGBUX02Za0C2wLVpLQ1d3weVTOGsECMA0SRDmAqdvr4maMxCcT
   qadetQbbQ+9UkXy5GRQoLRqUG6d1VqsANbJcA7206CyQB5NC4BwxTtyGE
   WHfFldzKDwHVLsCIy+mr9xFk/XPg75NX1ls9qwRBvGiUHW9xWDBG0a0o9
   FEHvplYBx/C7f/WkTGJM/yz6Td8SkIjbDwQNdO+58MkSmtr45vy0AFw2T
   ODSt3jkADmGdJ+V0mFrHBdhV2/tdq2xUPzO1z4sxJ23aBaY3gY5Nm+VrT
   A==;
X-CSE-ConnectionGUID: Sf0gqoTaQ66XTKAUaRg6ZQ==
X-CSE-MsgGUID: HGnF49keQPSjmpK120nkTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46500544"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="46500544"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 08:34:46 -0700
X-CSE-ConnectionGUID: DP2yLZsJQEGCNjUl65uggQ==
X-CSE-MsgGUID: NfM7S+4qRD6jNOXjquFnzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="167688528"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 08:34:39 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u54mZ-0000000Ctqa-1NKX;
	Wed, 16 Apr 2025 18:34:35 +0300
Date: Wed, 16 Apr 2025 18:34:35 +0300
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
Message-ID: <Z__OC5NDkQYIHNmL@smile.fi.intel.com>
References: <20250416131241.107903-1-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416131241.107903-1-phasta@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Apr 16, 2025 at 03:12:10PM +0200, Philipp Stanner wrote:
> Hi,
> 
> a year ago we spent quite some work trying to get PCI into better shape.
> Some pci_ functions can be sometimes managed with devres, which is
> obviously bad. We want to provide an obvious API, where pci_ functions
> are never, and pcim_ functions are always managed.
> 
> Thus, everyone enabling his device with pcim_enable_device() must be
> ported to pcim_ functions. Porting all users will later enable us to
> significantly simplify parts of the PCI subsystem. See here [1] for
> details.
> 
> This patch series does that for sound.

AFAIK the ASoC and ALSA maintained by different people and perhaps you would
need to split, but I'm not the guy in charge, so wait for them to tell you
their preferences.

-- 
With Best Regards,
Andy Shevchenko


