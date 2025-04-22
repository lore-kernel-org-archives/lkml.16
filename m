Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B29277026
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 15:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745335682; cv=none; b=idiatqunK6n+wqokP1CEmMWre9E1M0V7K0J4KodbgjGCg5Qy5kxlVF8mqhPterqmeG42pMdbcY0KvGeG3zmsYERD2RpfwHUi6Klq3SS1lJRUAjJrWUS7kj8aGJwyziuIJmzRPn4MujJo9xRg5P2FfjV8YKjvvuBP7w3swC4TeWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745335682; c=relaxed/simple;
	bh=Inwq/F//GFe4Bynx9gT6wlWIUeyprcIvZ/Av7+ZSWxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t94xsVdlAV2p5JtIIsfZB+n4CPgaJMMhIn1ll3rIKP9zhRw6Cj975sYOc88U/BR8ij02mtViN87mXqPlGbgM9js1Hbf8xFQROS1He1EmMDD1Jun/KgPY0uQvALxPMRGWEIXwhh30D+jpYyDfQlo2WQ1e1yso0iyO/zXRW4Bh1hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yqq70zl3; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yqq70zl3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745335680; x=1776871680;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Inwq/F//GFe4Bynx9gT6wlWIUeyprcIvZ/Av7+ZSWxw=;
  b=Yqq70zl3+qdel+0Y+CqowdjjfV64oPNngQBQpsA75aIQUrQ2AejZK89M
   64yB93WxJZypsjVHUoyqTQLZoQjTo2W/ItaWOEF/DsRZzxSjqm5ejpUHK
   4gQQgjIBygW+rmbgXyW2I+A7D27eaYXgm6HdkI7S7j5C29IPUkpcdfqIS
   Io2Gi65Gm4tipd9DxxeYocKxUg/zIxwekU4roP5Zf1hrsoZblnbatGF67
   rIC+umgTdds4RQNoIbMxr0iAOvBfv2tMv1QaDNj4Z9BijjmbUPRT4PdZP
   VWrBYj/MS0drJqyvNhLOOd7quSem0ATEZu87W0asVsVSXkWvG3j8RV/17
   g==;
X-CSE-ConnectionGUID: 9wH5qhlcRg66eTW4lbrYEg==
X-CSE-MsgGUID: GOk6FpCUR8SBj+kC+k2x1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="50730731"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; 
   d="scan'208";a="50730731"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 08:28:00 -0700
X-CSE-ConnectionGUID: /FQXzW6STWijchKT4MK8fw==
X-CSE-MsgGUID: 9XTs/XS9Q02906duzBgB/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; 
   d="scan'208";a="132041837"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 08:27:59 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u7FXP-0000000ElV9-20oC;
	Tue, 22 Apr 2025 18:27:55 +0300
Date: Tue, 22 Apr 2025 18:27:55 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: xiaopeitux@foxmail.com
Cc: john.g.garry@oracle.com, linux-kernel@vger.kernel.org, robh@kernel.org,
	xiaopei01@kylinos.cn, xuwei5@hisilicon.com
Subject: Re: [PATCH 2/3 V1] lib: logic_pio: export function symbol in
 logic_pio
Message-ID: <aAe1e66TmC0HtAx0@smile.fi.intel.com>
References: <cover.1745320689.git.xiaopei01@kylinos.cn>
 <tencent_2BC43E7712D51EA49597D8C9DE5CAE2B5906@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_2BC43E7712D51EA49597D8C9DE5CAE2B5906@qq.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Apr 22, 2025 at 07:31:59PM +0800, xiaopeitux@foxmail.com wrote:
> From: Pei Xiao <xiaopei01@kylinos.cn>
> 
> export some function via EXPORT_SYMBOL, convenient to use in

Export

> kernel modules in the future if somebody went to use this lib.
> This is one reason for this library exists.

Can we use namespace from day 1, please?

-- 
With Best Regards,
Andy Shevchenko


