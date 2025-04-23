Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A3527F4DB
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 16:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745427235; cv=none; b=cQjvoaDfbWMLvpmijp7yDCcbeFgFLjLza1+wSHtK14U0gw9WwZoN9unQLbsunhLVeZYN56HOdmdyq+tpBSTg4l1+oAJOQI5fHeTFXfgjn2/yzqD0MYYMTGVJj3ec8FeAA2J06sS9HeFFR9/ca8MG6wsn90HJWV+zdAHSXRPwiEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745427235; c=relaxed/simple;
	bh=Ekv4pcyThuw3BUl0BE9RXRcSNuipGf907NgScrry7NQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ut4ztJHceRSp+Ok/JHqNma9Ja8mKmFjPy9DdpLPX/bXZLLfWqgYnDbNu4UyKcT9p2UlCHkaCXRukEnkEBhvzqc4234z6L56JttJ1cEAvxbEiUSosFSWebYITTRJlT8tgKh72vM/b4eEexKK9sBQ0UvEHnFrxwYr3xEzNrFrsLEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kZTP1nsH; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kZTP1nsH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745427234; x=1776963234;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ekv4pcyThuw3BUl0BE9RXRcSNuipGf907NgScrry7NQ=;
  b=kZTP1nsH44xXpQN8Czz17E6YnjYrw0JwcsBKcHo8+dB8Q0BgI/nKeq/U
   sn2XIEdLmzxx2b/XY802c1+TqiBTPomHUmHUdLRH3CAp+30EkVwFMdl3C
   ntNLCNhKaAD60jiJkiDV99dtVi+A+zOQDV8riHHe3hAAQ+UWSv3yjmwVL
   pYs/kxawSxZqRx+Ni3qqVdXVDdOkhEoQBqvK9WsYHsJ6PeWE6jYfX3kcU
   hop1dCsg4SMDoP8nkcZRn8BR7GmH8mkRu8VeqDJR6hXqkpwuqyHfp6OC1
   9is3oKx3R1Hqb0INQcFojHSnJJ6H/P8uZows6wP1ruUewjyssfV+qL955
   w==;
X-CSE-ConnectionGUID: Bh13e6fFSmy6wBdWSBa/AA==
X-CSE-MsgGUID: /IUS9+VeTESW9VmTqIPQ2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="58403463"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="58403463"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 09:53:53 -0700
X-CSE-ConnectionGUID: oVeQzW6HTS6FIaP5FHrF9A==
X-CSE-MsgGUID: A+Pt+nXgQbmd9cEPwwsGhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="163410222"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 09:53:51 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u7dM4-0000000F7c1-3GM2;
	Wed, 23 Apr 2025 19:53:48 +0300
Date: Wed, 23 Apr 2025 19:53:48 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pei Xiao <xiaopei01@kylinos.cn>
Cc: john.g.garry@oracle.com, linux-kernel@vger.kernel.org,
	xuwei5@hisilicon.com, robh@kernel.org, xiaopeitux@foxmail.com
Subject: Re: [PATCH v3 0/2] clean up hisi_lpc and lib/logic_pio
Message-ID: <aAkbHGcVs3ZWrWiO@smile.fi.intel.com>
References: <cover.1745377493.git.xiaopei01@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1745377493.git.xiaopei01@kylinos.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Apr 23, 2025 at 11:15:34AM +0800, Pei Xiao wrote:
> 1.clean up included headers
> 2.add and clean up comment in logic_lib

LGTM,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


