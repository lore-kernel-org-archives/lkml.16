Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F68253F25
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 15:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744905507; cv=none; b=oNXSv/ZUCG3LKtUsUNXuq3C93k72esw3B7H9LOxOnXixmMYTXMIEmQTg3RNk5oLW7HHrqqv6iP5jjPRwUToNFTZ7zON+KW+lzV1tdixBQ/V+dZt63QLXTCabPh9b6KAb4Fjul1MvbLA4X4rgNVznII82uqayNbQtTs/E92EPvaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744905507; c=relaxed/simple;
	bh=/Y3bokVYQRr9U0KLVD6KUiYUrvGNUOrM3fPWG6N6ME8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m78A8yIozeF6nq4t0V6S5Qp8gv53MgBaObGE/6AXSB7v47yXrsc1Fxa5zTWUolR7xgvS9stYlp4sHbzqU+uBm7HKEvYOUBsBTnbF2AuvhDWMfBmjzbjdlxjxubD37/C1OIHx91E2Hs7gYZ4l3lBG84A7LRi5Ev8U8TQPNIxIPrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eXn4K7bz; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eXn4K7bz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744905506; x=1776441506;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/Y3bokVYQRr9U0KLVD6KUiYUrvGNUOrM3fPWG6N6ME8=;
  b=eXn4K7bzA4H5gaI8hzhRunDzUH9rbrntarvrb+Mjf6kwybnTrElM6zsk
   48PwLJqrMdTYR+1FSSLMrU3Jfh1N8ZSRQdcbbd7LcV7WLWrGcyREURtA8
   CiZKe3eleT2QkTnzYxePIvELz+gAd55o8/L/7i6iZc2IbN0hbmeua784/
   mG2KTd6CH4WNndHP8MUGn+SDxtLGDUwHuq9Zo4yHWRETR0CNhBYoyEj5m
   dqeI4Npht5iVILRX7n1h1ai8cpyFFL/0w71MNSz2r8c5+FoRxH8dmOMb1
   xN65bCWelGIMOF50jmQ2CyHZIqtJYkxtDHRe9b1xB4JdTu7e2+XRIKSD1
   Q==;
X-CSE-ConnectionGUID: TE8CHNGPS3KX1PBaYeB+Bg==
X-CSE-MsgGUID: iUvYK8lcQcWL6SeQTswnew==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="46396740"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="46396740"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 08:58:25 -0700
X-CSE-ConnectionGUID: HTI50lY9Rqegp98YD26nfA==
X-CSE-MsgGUID: n3C2rWhNS8u4c9nV/lELwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="161805549"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 08:58:24 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u5Rd7-0000000DFE0-3udS;
	Thu, 17 Apr 2025 18:58:21 +0300
Date: Thu, 17 Apr 2025 18:58:21 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Corey Minyard <corey@minyard.net>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>,
	OpenIPMI Developers <openipmi-developer@lists.sourceforge.net>
Subject: Re: [PATCH v2] ipmi:si: Move SI type information into an info
 structure
Message-ID: <aAElHft1iVqZbhBA@smile.fi.intel.com>
References: <20250416183614.3777003-2-corey@minyard.net>
 <aAEkdwD888tW2OUY@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAEkdwD888tW2OUY@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Apr 17, 2025 at 06:55:35PM +0300, Andy Shevchenko wrote:
> On Wed, Apr 16, 2025 at 01:36:15PM -0500, Corey Minyard wrote:
> > Andy reported:
> > 
> > Debian clang version 19.1.7 is not happy when compiled with
> > `make W=1` (note, CONFIG_WERROR=y is the default):
> > 
> > ipmi_si_platform.c:268:15: error: cast to smaller integer type 'enum si_type'
> > +from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

It seems you copied'n'pasted from narrow screen. The lines should kept as is
(as long as they are) without an additional line break and plus sign.

> >   268 |         io.si_type      = (enum
> > +si_type)device_get_match_data(&pdev->dev);

Ditto.

> > The IPMI SI type is an enum that was cast into a pointer that was
> > then cast into an enum again.  That's not the greatest style, so
> > instead create an info structure to hold the data and use that.
> 
> Tested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


