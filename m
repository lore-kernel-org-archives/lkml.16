Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975BD17BB6
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 08:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747039713; cv=none; b=O9Dv93UMwxFQOJBK5N3x6T+0XxlLTOjdjJMnqYthR15jOW8XvViJ3N7x3PRf0LGg2WzjSouYAoEUud+tBcBjRsjXOVluC7sGoMf9h+cqzkJlmJBQHposPl2mWs+ZopZYTkxasFErKBHym9b69NOqIJbUqt7yIH2XIPQCsVID7RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747039713; c=relaxed/simple;
	bh=WAOvh/4GnvFhcgh061nbP20b/JnhXfig2pIhpA4U20k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pofm+GAO9bILqhKa45zW6LkvEZSVjpyiLyYVu/GMGF+6BII8BeXfPkx3Tb5cE978NEbqIMhDZ/yKr/LJRRE+nqReVySr98X/AnBbpIib3GSIL6fHWtcJLYmmf4hjdBh+44MfzHCRvR+D+QCObVMpyTdJPcRam+3h21nBzR7bj3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PJQKuorq; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PJQKuorq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747039711; x=1778575711;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WAOvh/4GnvFhcgh061nbP20b/JnhXfig2pIhpA4U20k=;
  b=PJQKuorqh3cAXwJckaTgxdUfsQq49rIGjkOUbJ6hzyW1Bb9QuhRlpVmr
   Xp4Gb3YLYvesFDu2X6tbNqBVDIPlbTTcbiea2J2eveLU6S0DTHQCuMFDD
   6ucbbb/cDIQLKDC2RVYfl4g+YrphLJ+FmSK38jKoIgy/54Z6QRDIs3Dj5
   QXe89yPFaNw4IT1dvD3F4YIcFgbr07T507xq2rr1e6KMoSjSl7BRyCo9l
   jfHiwnkKdIpK2zY1IUwH+gVSdCYFzbAWRK1ImXnBe0izn0Fi+hHpz42SN
   YG58KkWvdJ1G1DPyH7P2rZ8SwH56oPXA9dbgBWEcS5mIuLTux+Z58175i
   g==;
X-CSE-ConnectionGUID: ovFPYkmkSv2wZCtqTVrRZQ==
X-CSE-MsgGUID: cChwucTGRw+RCkxHgehp1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="48691073"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="48691073"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 01:48:31 -0700
X-CSE-ConnectionGUID: 8NVwgn5NQtK1eChsNsNmzg==
X-CSE-MsgGUID: dZvUWkknRcOtJJ8GGXb0/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="137709382"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 01:48:28 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uEOpl-00000000rm0-2NyE;
	Mon, 12 May 2025 11:48:25 +0300
Date: Mon, 12 May 2025 11:48:25 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: tiwai@suse.de, broonie@kernel.org, 13564923607@139.com,
	13916275206@139.com, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, baojun.xu@ti.com, Baojun.Xu@fpt.com,
	jesse-ji@ti.com
Subject: Re: [PATCH v2] ALSA: hda/tas2781: Fix the ld issue reported by
 kernel test robot
Message-ID: <aCG12YmBS-9Vmc7N@smile.fi.intel.com>
References: <20250512081822.1513-1-shenghao-ding@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512081822.1513-1-shenghao-ding@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, May 12, 2025 at 04:18:22PM +0800, Shenghao Ding wrote:
> After commit 9fa6a693ad8d ("ALSA: hda/tas2781: Remove tas2781_spi_fwlib.c
> and leverage SND_SOC_TAS2781_FMWLIB")created a separated lib for i2c,
> tasdevice_remove used for not only for I2C but for SPI being still in
> that lib caused ld issue.

> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://urldefense.com/v3/__https://lore.kernel.org/
> |  oe-kbuild-all/202505111855.FP2fScKA-lkp@intel.com/
> |  __;!!G3vK!U-wdsvrOG1iezggZ55RYi8ikBxMaJDVs7u17Z9-7Xa-
> |  0lnyE4S3m2qmLCcHVK4qH1bD1JuBdzg$

This should be in a tag area below, each tag is exactly one line (the same way
as Fixes:, for example)

> All errors (new ones prefixed by >>):
> >> ld.lld: error: undefined symbol: tasdevice_remove
>    >>> referenced by tas2781_hda.c:33 (sound/pci/hda/tas2781_hda.c:33)
>    >>>               vmlinux.o:(tas2781_hda_remove)
> To fix this issue, the implementation of tasdevice_remove was moved from
> tas2781-comlib-i2c.c to tas2781-comlib.c.

-- 
With Best Regards,
Andy Shevchenko


