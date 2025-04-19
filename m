Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E50219343B
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 15:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745076128; cv=none; b=j8BhY84kf3Ks+fE6s8XXRovTT6SNnIVLHYhrQb7hk2uVAjqdDA/gl2MYIQj+xucn3vOw0eYR5dGA9LtiL20O1QXa5EXGFgAUEeWYrv5qz6FXeD0OTMgWcUTi+DxEb3p6xCg+h3S78NfegkK0372nJcqCAUA8MEzSE2MINQAfWMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745076128; c=relaxed/simple;
	bh=MogfJOt1bBZYoqAVNlvVZWq0v58Entr788DqatBCldg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R8u4lsfoYg/a7NNYGDF0gk3cRr9HtWGKA44iWXpGAUI+ON6usuHaLo1+OaK0QaKpnSkKGQM/aOW+OcpML1ZvW3jIwtvf0WpmI9+WzNNGCBAGs3pyA8NvdxJwTf/VuJNZQPA9OhSlYhutmG78kzfooWlqJfJ5Q1MS7e3BrNK7DNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m9Oj2r3q; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m9Oj2r3q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745076126; x=1776612126;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MogfJOt1bBZYoqAVNlvVZWq0v58Entr788DqatBCldg=;
  b=m9Oj2r3qSdjmfldaTVxnY3hL75rQg3vTfFnrRFhB08uRc678k4LImf4K
   ko6GdY4MxPcA/KiVkb8giFX/fUvU3TWRNf2eg3I3cg0PlBsblzzFnT2Rs
   PhWjnP2PcHsqle3Oq3748f+BvEvyOR4rbKeMlj9JAq/3dj+xRANCbEFsy
   GvQ33sZljn3ujWh6c5oZln3WQT9z4pCuNOljAq6FS0SH+JUAkDJDGU2Hz
   TAwLwxHLoBMURGn490dx5XFxARu3RamIX4zDEfvIhwGJUg3xNwsO2DXaG
   Go2rVmqo/LBB9RDOo1BC68b1f/SSDC8MDQBPQhzqpHulXh6Og1PxI5tWP
   w==;
X-CSE-ConnectionGUID: PxwpclEKQBSJBNcnOuuY6w==
X-CSE-MsgGUID: eACzxnGwR2urIcZlcijmVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11408"; a="46806293"
X-IronPort-AV: E=Sophos;i="6.15,224,1739865600"; 
   d="scan'208";a="46806293"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2025 08:22:06 -0700
X-CSE-ConnectionGUID: hsGIN0NdTA+QtNop4+8mzQ==
X-CSE-MsgGUID: 8S430m31SpWuVhW510ILfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,224,1739865600"; 
   d="scan'208";a="154516484"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2025 08:22:03 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u6A12-0000000Dql6-3Ok8;
	Sat, 19 Apr 2025 18:22:00 +0300
Date: Sat, 19 Apr 2025 18:22:00 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: xiaopeitux@foxmail.com
Cc: linux-kernel@vger.kernel.org, f.fangjian@huawei.com, robh@kernel.org,
	john.g.garry@oracle.com, xuwei5@hisilicon.com,
	Pei Xiao <xiaopei01@kylinos.cn>
Subject: Re: [PATCH 1/2] bus: hisi_lpc: remove unused head file in hisi_lpc.c
Message-ID: <aAO_mIY99CMH4o8d@smile.fi.intel.com>
References: <cover.1744964101.git.xiaopei01@kylinos.cn>
 <tencent_8024B8D7E209E31C8E2B5AC411B70C551106@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_8024B8D7E209E31C8E2B5AC411B70C551106@qq.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Apr 18, 2025 at 04:51:23PM +0800, xiaopeitux@foxmail.com wrote:
> From: Pei Xiao <xiaopei01@kylinos.cn>
> 
> linux/console.h,linux/io.h,linux/pci.h,linux/slab.h
> are not used, this patch removes it.

Definitely you haven't tested this...

-- 
With Best Regards,
Andy Shevchenko


