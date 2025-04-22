Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346922367B7
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 07:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745308732; cv=none; b=awIaLNLUNiik44uLjr29HrUSOybOEUhmyxZAAoVb0Ujsr5PKKD9U15amfbvFCH7hm+q8Yq5Vt4AGEbomBz81+K02gClHgc4O5gAw21TEGwRe4vo+2Wty4sEDwZnCepVpBfWy8YgXcJhazFAfLXaPpgn0TDoYdshfmqDKcgI1ShM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745308732; c=relaxed/simple;
	bh=ogiVKfFYiMiOdRVDwGm47CIvXWXgieU9H8scVlmpQDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XzwW8nexeSzoILD9bcTMIhieqUw3PLs4ia1bJLr4KLTyE2iMfyhXLGVtPFMiP3fPznc2fSjf8Skhq+vA3RWkoSugHnNfeAS0RNaACbfOsC4Af718CCxcxha5EfbqE/e6Szh6NsVYYUZQkmTj+TyLCLNZgjTU3jljliVFU74FXhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GH/7EHmO; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GH/7EHmO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745308731; x=1776844731;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ogiVKfFYiMiOdRVDwGm47CIvXWXgieU9H8scVlmpQDM=;
  b=GH/7EHmORrxZKLXKOY/T4mZfNd8tM9Pyuh0Xygi9YsEaCHN3HXSsPMRo
   8PvqNHmX5akUGlvAaDD6mJzxJxF1/r+670C1Tdu9aUWJdj97v2Z79UANw
   1x//fkC8ISlyeBABaYWfGp9irdtO+AKXAjQwA1LyVT4vFalEXT7NXlXag
   oMEArP/N4lrdHSoGqcUI1kf0R8SdlMhnq2a1ywK7GJFo5iQOYfvAu6pyN
   fHweFV6ZoaLSsWLwkGEAxZ20uoA85iYDZU6a7NGEXL+/S5T6tCrDIEHZD
   Uw2qtGHTSMRh8Iuc9kdqnl1r0hjeML7mCGr0WrdRBJScOeKh8FWj5kJvl
   g==;
X-CSE-ConnectionGUID: UziObagMSRiNn2dBuqr44Q==
X-CSE-MsgGUID: 4tX1d10yRICa4g9Y9p6tww==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="34470175"
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; 
   d="scan'208";a="34470175"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 00:58:50 -0700
X-CSE-ConnectionGUID: tmHR3+7SQD+fGoLTqyob4w==
X-CSE-MsgGUID: +j0k86aFTtGXuGzpvsXZiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; 
   d="scan'208";a="131892065"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 00:58:49 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u78Wj-0000000EfOi-2KXH;
	Tue, 22 Apr 2025 10:58:45 +0300
Date: Tue, 22 Apr 2025 10:58:45 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pei Xiao <xiaopeitux@foxmail.com>
Cc: linux-kernel@vger.kernel.org, f.fangjian@huawei.com, robh@kernel.org,
	john.g.garry@oracle.com, xuwei5@hisilicon.com,
	Pei Xiao <xiaopei01@kylinos.cn>
Subject: Re: [PATCH 1/2] bus: hisi_lpc: remove unused head file in hisi_lpc.c
Message-ID: <aAdMNb8n_wr5PwyQ@smile.fi.intel.com>
References: <cover.1744964101.git.xiaopei01@kylinos.cn>
 <tencent_8024B8D7E209E31C8E2B5AC411B70C551106@qq.com>
 <aAO_mIY99CMH4o8d@smile.fi.intel.com>
 <tencent_DB84706B5135401678FD9E84CC6DB8C2450A@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <tencent_DB84706B5135401678FD9E84CC6DB8C2450A@qq.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Apr 21, 2025 at 10:06:28AM +0800, Pei Xiao wrote:
> 在 2025/4/19 23:22, Andy Shevchenko 写道:
> > On Fri, Apr 18, 2025 at 04:51:23PM +0800, xiaopeitux@foxmail.com wrote:

...

> >> linux/console.h,linux/io.h,linux/pci.h,linux/slab.h
> >> are not used, this patch removes it.
> > Definitely you haven't tested this...
> 
> Sorry for that,I have tested in ARM64 platform, have no build problem,sorry for that!

Okay, but you need to follow IWYU principle. io.h is definitely used in this
file.

-- 
With Best Regards,
Andy Shevchenko


