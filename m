Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E5E20897F;
	Mon,  3 Feb 2025 15:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738595597; cv=none; b=Z9qnlosGUrn2floRhno1fYwq8EdzL1eZUxqSHtY9rKQVJRBApsuq5akRxNswsVltSYx1dQ+wawUpWjaJb9BJ4FrCzY/+U5AnPc5J1CA4sqtcIt4eJH766SAUR0Pftzj6ooZqfdbsqbhHjavqDpzjjj9AtHnrj7tzd1yNGw8z29s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738595597; c=relaxed/simple;
	bh=o4TKeGwyYGWwRMSOizbdGNnVjjPiXdFISziDxmcYmLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vx1HYXXhHmwDqqEJWIrawPvVFGdWspNGV/vFZNKs/fuueDlbrkTGv0IULaT/IAbZ+jMEXcoLyEBOscv+H+htlUaWkM8RhfYPfeHOMgxIzWOFJExDvgW38PjuHtCla3G2pyyOAPsNdYxQITRwJyGttwTyt/sWT5b0ToFcxvSEzyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i6e1UmoH; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i6e1UmoH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738595596; x=1770131596;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o4TKeGwyYGWwRMSOizbdGNnVjjPiXdFISziDxmcYmLE=;
  b=i6e1UmoHV0omftn9vgINvh+eKYDXkwAOgsaV1n6kqLCJsahAI2HLE4UA
   C+gQF3AZoP7U7GT7dhCrFQTFSpV9nhZ6RK+dKZ0c/4LBsRrQ0C0SKiCyb
   wnnORYtnTNT+TviaZRKjYdqEKnMbipBesAG4WrMx8dTcAA9ZtjsUNSLvW
   CR09qMJ+nzE4/vBMc1D9FJyjlrHum2hQKsK6JovuJogZiYOSSD9DNFSju
   GR6O5lFggxKCQj9wY3X1dquplXPCRAyXpTeZiJkv1IfgfFEQMp6/BL1CB
   gWPWnDfkxK3/HEa12Aqjhy3FTUVreOLbNN4ieO6httx2RLxfzScDBR1fR
   g==;
X-CSE-ConnectionGUID: P9q9LcrcT7qk3jYk1KT4wQ==
X-CSE-MsgGUID: zUcOPh0uQhanDcgRP2vXjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="64447671"
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; 
   d="scan'208";a="64447671"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 07:13:15 -0800
X-CSE-ConnectionGUID: 8mrLQktiSxafzYzdPn8Dpw==
X-CSE-MsgGUID: VUllrVkMSva9wJGHo3ql+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; 
   d="scan'208";a="110480178"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 07:13:11 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tey8J-00000007rv9-3DiP;
	Mon, 03 Feb 2025 17:13:07 +0200
Date: Mon, 3 Feb 2025 17:13:07 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Mark Brown <broonie@kernel.org>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	Robin Murphy <robin.murphy@arm.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Zijun Hu <quic_zijuhu@quicinc.com>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 1/3] driver core: add a faux bus for use when a simple
 device/bus is needed
Message-ID: <Z6DdA_2w0QaRgPZo@smile.fi.intel.com>
References: <2025020324-thermal-quilt-1bae@gregkh>
 <2025020326-backer-vendetta-7094@gregkh>
 <Z6DchyPieQKBJ0SN@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6DchyPieQKBJ0SN@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Feb 03, 2025 at 05:11:03PM +0200, Andy Shevchenko wrote:
> On Mon, Feb 03, 2025 at 03:25:17PM +0100, Greg Kroah-Hartman wrote:

...

> I don't remember by heart what it does include, I would go with IWYU principle
> and list above all what we use.
> 
> container_of.h
> device.h
> export.h
> printk.h

> types.h

Probably types.h is too much and stddef.h would suffice (as it provides NULL
pointer definition).

-- 
With Best Regards,
Andy Shevchenko


