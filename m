Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCB51A23A0;
	Fri, 25 Apr 2025 17:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745600676; cv=none; b=SkRJmvZTOQU39EpglZS6QMvAGIGcwYgUf5NJYtQW0lgpOn8b/EgGZ43fgTyzAAeSeVSLohGSaahqCKe/l9Pn5h4Y7bSdCHhWhafR+mf5Ws2gpVCs9H2uHl3lS+QI3uydmqat8/usBG7dJUzVN3vplXpWc/QO+G0aMGWeyueMHys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745600676; c=relaxed/simple;
	bh=i7rmxlG1VQNYidKLjBhaLymocz/9YryXJKLDXg11EyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EvqUhISSZNu8CpV/6EFFIt3bpUcmFI2JHJ838hTqBNfrOkWtgHk95Ej1RYkiLrbkdn78b2R8HJ7IlGaxFVbZmysMgVCiDxmEjudW2QuoZwSVnEoGoASwttw2sN4UWdMn0aFvVNdxLsmrSsnu2j8ntuaGQRTbeUHjp3AUapcmyD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mV18SRh+; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mV18SRh+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745600674; x=1777136674;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=i7rmxlG1VQNYidKLjBhaLymocz/9YryXJKLDXg11EyA=;
  b=mV18SRh+e3fj74CUt2KZpYqoxKAMmytua/G8rDeoxCtGF0xdoEtJMHgC
   oSHVNvqrJxixqz6tvF8IhyXZz6bXsCdEVuvRP0E8cSm5nTQdvFOABQ4MK
   kLSduBNtTGrL7HyJXXMC1Hcegj1ZxeQDzbdtodLadtyW3Ll7qI2ALDQT4
   DEOobn2ZAy4Ul+dIn6L+6wWljYZuvtDTxtIEJkzfBhEQKTh6vevcj/DMK
   BhR7VP+yETfoInnfHV/zGf8AhKlQ+zWXJKgplfyShZtsIG1ZDVYu0L2kw
   i2JK7Szvtf1rp7f8ay1tBFRPU1S3Bz7sUTZrcRX40GlX2qfW15Ip10DMv
   g==;
X-CSE-ConnectionGUID: tSPjuNCVQf2TlwzkViXgkA==
X-CSE-MsgGUID: 8oiO4RZiRhG/dxv3nVeRiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="47144365"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="47144365"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 10:04:33 -0700
X-CSE-ConnectionGUID: UBoKTZr+S8yc0yrIU9VBYA==
X-CSE-MsgGUID: fyjnLAECQ/GU2UJOUOVi5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="132866485"
Received: from smile.fi.intel.com ([10.237.72.55])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 10:04:32 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u8MTU-00000000KH1-0fE3;
	Fri, 25 Apr 2025 20:04:28 +0300
Date: Fri, 25 Apr 2025 20:04:27 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Zijun Hu <quic_zijuhu@quicinc.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Raag Jadav <raag.jadav@intel.com>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v2 0/3] gpiolib: finish conversion to devm_*_action*()
 APIs
Message-ID: <aAvAm14sil9qpeHl@smile.fi.intel.com>
References: <20250220162238.2738038-1-andriy.shevchenko@linux.intel.com>
 <aAfmBlE3ZXU65PQR@smile.fi.intel.com>
 <2025042523-immovable-onyx-e648@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025042523-immovable-onyx-e648@gregkh>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Apr 25, 2025 at 03:22:33PM +0200, Greg Kroah-Hartman wrote:
> On Tue, Apr 22, 2025 at 09:55:02PM +0300, Andy Shevchenko wrote:
> > On Thu, Feb 20, 2025 at 06:20:25PM +0200, Andy Shevchenko wrote:
> > > GPIOLIB has some open coded stuff that can be folded to the devm_*_action*()
> > > calls. This mini-series is for that. The necessary prerequisites are here
> > > as well, namely:
> > > 1) moving the respective APIs to the devres.h;
> > > 2) adding a simple helper that GPIOLIB will rely on;
> > > 3) finishing the GPIOLIB conversion to the device managed action APIs.
> > > 
> > > The series is based on another series that's available via immutable tag
> > > devres-iio-input-pinctrl-v6.15 [1]. The idea is to route this via GPIOLIB
> > > tree (or Intel GPIO for the starter) with an immutable tag for the device
> > > core and others if needed. Please, review and acknowledge.
> > 
> > Greg, I know you are busy, but do you have a chance to look at this and give
> > your Ack if you are okay with the idea? The route is assumed to be via GPIOLIB
> > tree.
> 
> Looks fine to me:
> 
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Thank you!
Bart, are you okay to take this series?

-- 
With Best Regards,
Andy Shevchenko


