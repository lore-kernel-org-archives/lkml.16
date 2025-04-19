Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063432B9CD
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 15:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745076108; cv=none; b=d8skScFMbp0GBqJjzKHCXvjw3amh1i+eR6ezpzQDxuPCkR/iUYIcgcSdUGuX2OeN6ts6my/MsRHvk0aimJi9XvQVgFmjR80j8NJjcJNlCE+1PRQ80d2K78D6RDY8Qts6DbqFR0yeM6UIdovcVzmMYYBr1JHRK18jo3v1M0AQ0pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745076108; c=relaxed/simple;
	bh=lSV8rRyHZ6dAi93S48PR/v++SJn4bGAMINRJFduCmGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hHRJA8H+OoY2vP4wpeaFw8Z2hToDSuHbs+gwpV6b9qppmUT3qUnxGYvmyAYf4JwWjpLkvS7jGzPlcmi9R+yLE6eIVNmO/2tkV797HnsqYFee8uZSja4TTK2xjAd2AXLcIIJRfQn/bNHAmfKzElVaMqPe24IbxUH/sog9aGOHI54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IrsVmLDi; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IrsVmLDi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745076107; x=1776612107;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lSV8rRyHZ6dAi93S48PR/v++SJn4bGAMINRJFduCmGc=;
  b=IrsVmLDitWxdLGl61bJQ0vLkYk7OLKFKFUNhPztNbydZPo8DNXMJiXCp
   q+Cb2OtsN88qc9IYx5cNBrOkZJIHy6V2Ejf1OD3FIlQSQ6VZz6J/8bAPR
   RdaVRKUnpYPslf4aD8lIIY18TXW/Y8Dt/MI8JN0K/QI8UjJx5HAmbLmbc
   ruzpw8gq9iYUH+ivw2ebFt/KBXDQ9//ybgYqJRaomVdfdanU2aXOhuAeB
   Gfqi2691OuvJrUKi3j9xEPQRuqW+NXzgKVP/o2Aavt91Dpq2t/2Er2JuJ
   OipsN0acdOJkRHWPwqUr+KqoXhhE1PuFKhGPnlEEQTcGYacEnFMzDHwfR
   w==;
X-CSE-ConnectionGUID: pO3rflUcSumO4gZy3WoT0A==
X-CSE-MsgGUID: y81kSV+dS7W0ZT/diAxrtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11408"; a="46806278"
X-IronPort-AV: E=Sophos;i="6.15,224,1739865600"; 
   d="scan'208";a="46806278"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2025 08:21:47 -0700
X-CSE-ConnectionGUID: FJJofWCZR9CFitWUo59J1A==
X-CSE-MsgGUID: bDbWT53+SFmdWvcc18cSeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,224,1739865600"; 
   d="scan'208";a="154516420"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2025 08:21:45 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u6A0k-0000000Dqki-01Wu;
	Sat, 19 Apr 2025 18:21:42 +0300
Date: Sat, 19 Apr 2025 18:21:41 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: xiaopeitux@foxmail.com
Cc: linux-kernel@vger.kernel.org, f.fangjian@huawei.com, robh@kernel.org,
	john.g.garry@oracle.com, xuwei5@hisilicon.com,
	Pei Xiao <xiaopei01@kylinos.cn>
Subject: Re: [PATCH 2/2] logic_pio: Add detailed comments for find_io_range()
 and logic_pio_trans_cpuaddr()
Message-ID: <aAO_hdYdKW1_Z-T8@smile.fi.intel.com>
References: <cover.1744964101.git.xiaopei01@kylinos.cn>
 <tencent_CDDCEC54C190265E5927ED7353AE68116A08@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_CDDCEC54C190265E5927ED7353AE68116A08@qq.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Apr 18, 2025 at 04:51:45PM +0800, xiaopeitux@foxmail.com wrote:
> From: Pei Xiao <xiaopei01@kylinos.cn>
> 
> Add comments that we were previously overlooked for find_io_range()
> and logic_pio_trans_cpuaddr().

You haven't run definitely the kernel-doc validator. There are missing Return
sections. And even style for returned value description differs in two...

Also, you have an issue with your tools, the cover letter is detached from the
patches. Please, take your time and fix that.

-- 
With Best Regards,
Andy Shevchenko


