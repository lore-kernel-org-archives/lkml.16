Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2D72566DE;
	Thu, 17 Apr 2025 17:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744910334; cv=none; b=qQgE2yCTX0Fmb0imuEzfuGCTXl6GBGd2I4kNqzn0ZaK7bUcMX04ArtleKy+dFGpWIyKDL61l/907fGZp+BdtT+yaQpucI83DQ6RxQvx8XZGqIZ31/1J7pJ2jyJnANXZQzY5aeyLD6nMqJ/Ha+vaC+Lin0kTXwg2fH03FEGhtxPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744910334; c=relaxed/simple;
	bh=rwzHyfxRSjWAcBaUHLb1QsSWYIpjHdvWq0pbmdTtM1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dq95Rweoi1Gd3rWTcr9yYk63PMhhr1aTYzPVU849pnUag7vhTmlPBlyLAhwhzMLRd3k2KWW7W9fnsHniCAZiTCdMD2IOxof4pwycR47A+htW6nan9YejdnjhAelIkg2ygjSy2itfd1eKl9RiaDIYlOjj0bkrZuvZ6eiEsu759uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QOa8XR4I; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QOa8XR4I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744910333; x=1776446333;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rwzHyfxRSjWAcBaUHLb1QsSWYIpjHdvWq0pbmdTtM1U=;
  b=QOa8XR4Iuhl2+s4MPGCre00uWGMDbFEKrt/EvtTg/EttWWPbAAigWsPd
   zC9RjtbmoL48PsXRKYd0sBl1QCI9zNAyQK+rrnfUNfKLQ+SSCFoVT3c2m
   y+jc3siRnG0gJUf+t06lF2lRzEVB385eAkIqlInTn+9gAPi5R1/Ybo3WP
   OoYzxj3+8IgA37B2EwUT/yFWZLBFp3hAfPIoQ1siyfrVPGoYeBdpAgczc
   hb+kykh/tD/XSGE+e8j/cxX+KI4X6uk7n8IokcG672y202Xq+r2H75yx1
   8AedHADuCyoKml37chok6JQ7XKeKIDMRmsqZOVegefIiO1/Ff+s6/23WO
   Q==;
X-CSE-ConnectionGUID: n+HOBfcpQz6NQc2pDNqFMQ==
X-CSE-MsgGUID: GmOhghatQP+GY/11mb/M9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="46440136"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="46440136"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 10:18:53 -0700
X-CSE-ConnectionGUID: 8+aK4r2vR4qyObwriQ1+pQ==
X-CSE-MsgGUID: 8edGMLbPSMeeUEEDDCcQ+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="161827307"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 10:18:50 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u5Ssx-0000000DGTg-0IoD;
	Thu, 17 Apr 2025 20:18:47 +0300
Date: Thu, 17 Apr 2025 20:18:46 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu,
	GaryWang@aaeon.com.tw
Subject: Re: [PATCH v3 05/10] gpio: aggregator: refactor the forwarder
 registration part
Message-ID: <aAE39r-et5CPvzyA@smile.fi.intel.com>
References: <20250416-aaeon-up-board-pinctrl-support-v3-0-f40776bd06ee@bootlin.com>
 <20250416-aaeon-up-board-pinctrl-support-v3-5-f40776bd06ee@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416-aaeon-up-board-pinctrl-support-v3-5-f40776bd06ee@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Apr 16, 2025 at 04:08:13PM +0200, Thomas Richard wrote:
> Add a new function gpiochip_fwd_register(), which finalizes the
> initialization of the forwarder and registers the corresponding gpiochip.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
with one nit-pick below.

...

> +static int gpiochip_fwd_register(struct gpiochip_fwd *fwd)
> +{
> +	struct gpio_chip *chip = &fwd->chip;

> +	int error;

Not needed in this change.

> +	if (chip->can_sleep)
> +		mutex_init(&fwd->mlock);
> +	else
> +		spin_lock_init(&fwd->slock);

> +	error = devm_gpiochip_add_data(chip->parent, chip, fwd);
> +
> +	return error;

	return devm_...

Make it differently when you will need this.

> +}

-- 
With Best Regards,
Andy Shevchenko


