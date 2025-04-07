Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10547322B;
	Mon,  7 Apr 2025 06:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744008603; cv=none; b=IGiB7LuOlVwStXKRrX4y8YhV8TeLu1vZp9Qi55lVT0W81bgtp/udiMd1U0NhkE6YnJmEqmV6tcJ6axnV3KjmQJH54PvCz7AUps9//ZFIzo/Y71CrTG1tIBq/67C/7zhEkNZZSi6e/0CT3ApdqYk+gYVovP3TdkZh5gIDXEakd8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744008603; c=relaxed/simple;
	bh=vImhmLDXzhhro9H5oYdIA7H6KMQDeNwFAMg4t/FZqJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fj3+RjPouXdsipynvWD30UuIx2tzrjS6DrT70nHsVaiJNjsi/OKSsAJMhTnC2zWZguDZyOIFyZ/CdGW/VlhWqXTb7zinx894NUkL7Z6CIkb8fBOEpTZFifYhOOeLGmRrZR2pu08z4fMLjiigoTT/4kUZ7D7msQ/O7IpmpEfg46s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ePGCw0+j; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ePGCw0+j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744008602; x=1775544602;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vImhmLDXzhhro9H5oYdIA7H6KMQDeNwFAMg4t/FZqJA=;
  b=ePGCw0+jDkcC+AmzCKZrxN16UUYwRSemdL2xjYNl+h5BQWggJhXhXCKh
   ZxqFqb845uj8VQfQmVdrYlydgnIhihgW9hFqEXusT2H37DkRrwg+IxBUJ
   JptzYTYVgZlkqz8pDrooNfeKRmO+oGAQqU+rZS3giihh1Ck2TFFZwgSeC
   mpAesX7HD1wiunAaA/FoIzvi0zSSqro7AFLYtBd6t1PL7UzG2tX7JTcng
   sYOPs2KNXiNZrWGxinTyp6VtJ3FkIeSwHCYeX5gx6dMwI+byfAxUItsfR
   8K11YCfvrg18Yd+OE3IkJrI8RuMPr1gmWjR+Zb07/8nT14ZMm84EJ7oKB
   g==;
X-CSE-ConnectionGUID: ET9OV+C4QxmshXeYG1mYCA==
X-CSE-MsgGUID: f2NCMX3pRdqMYheilqLibA==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="45496957"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="45496957"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2025 23:50:01 -0700
X-CSE-ConnectionGUID: gpSUIEjATwGcv3cm791E7g==
X-CSE-MsgGUID: Zwym3cJHTW6qXsApxMnhPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="128185449"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2025 23:49:58 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u1gIu-00000009ylW-0B0M;
	Mon, 07 Apr 2025 09:49:56 +0300
Date: Mon, 7 Apr 2025 09:49:55 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: perex@perex.cz, tiwai@suse.com, dan.carpenter@linaro.org,
	baojun.xu@ti.com, broonie@kernel.org, ckeepax@opensource.cirrus.com,
	nathan@kernel.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/tas2781: Remove unnecessary NULL check before
 release_firmware()
Message-ID: <Z_N1kyRiCVNg8QNK@smile.fi.intel.com>
References: <20250407061939.2771803-1-nichen@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407061939.2771803-1-nichen@iscas.ac.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Apr 07, 2025 at 02:19:39PM +0800, Chen Ni wrote:
> release_firmware() checks for NULL pointers internally.
> Remove unneeded NULL check for fmw here.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


