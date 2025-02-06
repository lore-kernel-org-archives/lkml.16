Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A004199254;
	Thu,  6 Feb 2025 18:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738868400; cv=none; b=pj/W8k/hzDOxEJ0ZJRQHQFpVwA+FZ7lMtcToT4e8g02YtX65C09Qw1yW6SOYi31r/efLsnHUY7ArFFNd2ZKdAq7nu1go+bhxMJpIBKAshFFapjQQJsASh9TWFzDYA/Syf8VoQEXsrsM77JdEUSGs5UpwhWLTf5bZyms+PRIbLVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738868400; c=relaxed/simple;
	bh=U80uPoVatSGO12LJOZejJ9GnJquSX3z3HrNvtBlX0mI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ppd4o9iTCIXPxTSQalt/HUdZbI+NYa7+u86WpHZzigMumrOGdzfcglE9ztlEWl2qlQc8Ov6eg0crP/PmOPJikh7RUwy7e643F2o4k+0wC/zS7fKUxmgD1c0LQ2B2QJRQs8p3tkA2MoH+a+A219VxgSatxP1+WhwGaQSjDVUaWMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T4XtEqQc; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T4XtEqQc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738868400; x=1770404400;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=U80uPoVatSGO12LJOZejJ9GnJquSX3z3HrNvtBlX0mI=;
  b=T4XtEqQcv8e/Wp5iOaj3Pe+gKVTsuoGQ7yzl9S6OrGhwPHv67AzzuwAK
   GtezpzhAnYM0MYH01EnC2RjhPZ/QLuy8iQ1swxO8IQexsQwTb5qNBJ4KL
   7LBmwHZoLrMQnXXSgjOCIngWiaEt16wpNs7BlMgE+if5w3LaRK5Mo7ucX
   LVlBzdwrPG+ErN5RcP6v47I6aUIVn7W0lE2/O5sYlgsCKcdHm4b8fn0I6
   ZTWrGl2t78E7AluVggtooQp21gaD16GVo0QBrAT5m8EYjSm/uZcsQ+a4L
   Z63feZ79iSnPeEKGsMhugqmb97HTVhaxKFU0eys0cLXODN+KAC3yHbW9Z
   g==;
X-CSE-ConnectionGUID: Ksnpwx2tQ++fx6paZ29vxg==
X-CSE-MsgGUID: ovUzrlwKQ6GMQg7E2neL+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39623815"
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; 
   d="scan'208";a="39623815"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 10:59:59 -0800
X-CSE-ConnectionGUID: jva7puyaRfabh5hDMxqEug==
X-CSE-MsgGUID: fyOtZBuiQCO1CX1oOIVK4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115914634"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 10:59:56 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tg76P-00000008p2a-2u3M;
	Thu, 06 Feb 2025 20:59:53 +0200
Date: Thu, 6 Feb 2025 20:59:53 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>, Shenghao Ding <shenghao-ding@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Kevin Lu <kevin-lu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH v1 1/1] ASoC: tas2781: Switch to use %ptTs
Message-ID: <Z6UGqf_YOtvrHxW8@smile.fi.intel.com>
References: <20250206162339.1127836-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206162339.1127836-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Feb 06, 2025 at 06:23:39PM +0200, Andy Shevchenko wrote:
> Use %ptTs instead of open-coded variant to print contents of time64_t type
> in human readable form.

...

> -		time64_to_tm(tmp_val[20], 0, tm);
> -		dev_dbg(tas_priv->dev, "%4ld-%2d-%2d, %2d:%2d:%2d\n",
> -			tm->tm_year, tm->tm_mon, tm->tm_mday,
> -			tm->tm_hour, tm->tm_min, tm->tm_sec);
> +		dev_dbg(tas_priv->dev, "%ptTsr\n", tmp_val[20]);

Urgh, this should be a pointer, I will update this soon.

-- 
With Best Regards,
Andy Shevchenko


