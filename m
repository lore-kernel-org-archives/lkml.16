Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBF0204C2D;
	Wed,  5 Feb 2025 07:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738742263; cv=none; b=C5f9vL4s2byjCGTbfVosCm3HyFUpmBZk+T/HMOwwD0/bD1pRGZOj51ibFo0P7sTD8z74fbgbqdcYHIO7bGi4KPCK9H9FYIsbSeEgLdIzTc33Edb6Phri5uw8upp+8+DB/LCQm5ggmTOvMk6EYsHSnIqTe+X2TP+F1a/IRYOj2OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738742263; c=relaxed/simple;
	bh=6WDlN7opUnQ1mFJ09g5mK8d5/27wYrKppIZj9++lpV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z/mUhqDeQPpHzyfmpbN0mk+kjpDYZ199bUhRlj0avGb3gXOevksi8jVVM4HT8GsDiEa/3HgMBIOJtereF9MkuinTb4D9JaD8LqRgiVaUaY3U3zSI0+QUSTX3jrZmXkDkAR/pwTqeXkdsq2QrVcqdSK40qa5h2Du1gQTOjG9z+Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PDfA3hwK; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PDfA3hwK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738742262; x=1770278262;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6WDlN7opUnQ1mFJ09g5mK8d5/27wYrKppIZj9++lpV0=;
  b=PDfA3hwKb6Ky0l9aYCmNO17C3NPJg/kyiKJN+25QVdUQwk0hx3BZzQfU
   SMoNyW4x4iwbFMZr48nlb4F7MaDwNbRc41XB0MThbpKDYofroo+SfYkEo
   16Fgavrwznw6slF2zsIH7zkNgio2hXbmmc9thoQ2W1CWN6LuUQHgvwT1A
   1a2QhZc0D9K5Yb/fs/ucKAoAbeWnbg/2HgEBB1Ae71YcZ4dhaxmfElueu
   d1TvxehxJ1cjgrMVRNL/AFcKGkgCnwH7VkezRV3qEPmk/wL/4tNefe7U/
   dADFgCYwjhRyYyxk/e1PL6YRkwp9/oC1Klie1NCHCAjszfliZYah3f09R
   A==;
X-CSE-ConnectionGUID: nMOCGHwaTOmysONXO/leUg==
X-CSE-MsgGUID: 1yPm6lBASxe5cNpel9ZhHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38528297"
X-IronPort-AV: E=Sophos;i="6.13,260,1732608000"; 
   d="scan'208";a="38528297"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 23:57:41 -0800
X-CSE-ConnectionGUID: DkNphc1mQeGvUda7MJCC0Q==
X-CSE-MsgGUID: OyOxDkkEQoOu8moIij6Zig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="134078252"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 23:57:37 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tfaHt-00000008Q0c-0rWo;
	Wed, 05 Feb 2025 09:57:33 +0200
Date: Wed, 5 Feb 2025 09:57:32 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lyude Paul <lyude@redhat.com>, linux-kernel@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Mark Brown <broonie@kernel.org>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	Robin Murphy <robin.murphy@arm.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Zijun Hu <quic_zijuhu@quicinc.com>, linux-usb@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 1/5] driver core: add a faux bus for use when a simple
 device/bus is needed
Message-ID: <Z6MZ7JdP6tynvYRr@smile.fi.intel.com>
References: <2025020421-poster-moisture-534b@gregkh>
 <2025020424-retrain-recharger-407c@gregkh>
 <fd6250102ea9d869448e7a40a60a02f8b167d4ac.camel@redhat.com>
 <2025020518-outcome-harbor-6281@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025020518-outcome-harbor-6281@gregkh>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Feb 05, 2025 at 06:53:09AM +0100, Greg Kroah-Hartman wrote:
> On Tue, Feb 04, 2025 at 06:10:36PM -0500, Lyude Paul wrote:
> > On Tue, 2025-02-04 at 12:09 +0100, Greg Kroah-Hartman wrote:

...

> > Should we add faux_get_drvdata()/faux_set_drvdata() since we've got a
> > probe/remove function? Doesn't really look like the platform driver equivalent
> > does mcuh, but I assume just having an inline function for this would make
> > things a little less confusing for users.
> 
> You already have a reference counted object returned to you, why do you
> need to increment/decrement it again?  All of the users I've found in
> the kernel so far didn't need that, do you have a specific example where
> it would be useful?

It's about getter and setter for the .driver_data field, I don't see how
reference counting can help with this.

> I'll be glad to add it, I just didn't think anyone would ever call it.

-- 
With Best Regards,
Andy Shevchenko


