Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D617D098
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 12:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747918502; cv=none; b=SduL+K8zEQVMw7koNI0i6yJCDfZLhKGE/DJM3Ofb30cYTlkLsmXEgO7RKwTzUGWo3UtgB6xpfA/K9r0Gkei/7tSnPmNo7gvQdcQZPGs8tsVhNXhcIaiygiAjBAUTvoKWfRtyHmJdwHuKtF/jRcXxRBOUw+PPbW96qmw3rT8fBBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747918502; c=relaxed/simple;
	bh=PmgUp4Aieui1OBoJqhkmkbPe6Vq/f1tJGdYWguQXDAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L9izSvvlrdoq5bfwCu41iGaWPvYpKBgryriGMLgizCYWuPwdfNsRqDq7oa5nSX3yHNN5gdkY79xjK9NQvNQ+tfQNtHS3nxahFtJsmVI4MzOY1y7+AKlbbxxmL18trC9GAAWR4BoB9qBcpEExGBA1OzOATIhnys9/w2Q4Epks4Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fPRZ3Iw1; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fPRZ3Iw1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747918500; x=1779454500;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PmgUp4Aieui1OBoJqhkmkbPe6Vq/f1tJGdYWguQXDAg=;
  b=fPRZ3Iw1i3iIXmuzRvOI390HALY+TXTs6EdaXnGmTMwd1mRAlstHDB+s
   yOzkDYAb7w2GnHgZLQXzidtNN+jof/UsH1Zc+NnikPlOcd3wWIIj7us1p
   eNIXadJXyWWTVjpIyyR4VeVdFriSyf56q7glFhmsXEHR0/WoUyLiDGffA
   0WUBtCmkG12Ur/R1xobycCyDmPZm8Tk2xrseQM7NX4qzoSIVX3K+//8qy
   yeBvDshf+SYXWZP0iJ58ysWIzx6o3HB3mDFvK+ZURHTLQ9dowZS5vBoMF
   iAcYnivt1TJ+gY/8hPmw/sGVYVep899DjnihymfQcuWAfDQTp+Oe0ulCc
   g==;
X-CSE-ConnectionGUID: kyC2ouM1Q+iBpplGeDZzgA==
X-CSE-MsgGUID: 70ollDgtRSqvFo3nBpAW0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="49059397"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="49059397"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 05:55:00 -0700
X-CSE-ConnectionGUID: 6YBut4cAQIm+VJDH6PEMkA==
X-CSE-MsgGUID: SETYwF+2Q7eTOW7LAGm3Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="140460968"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 05:54:59 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uI5Rn-00000003vha-3Fja;
	Thu, 22 May 2025 15:54:55 +0300
Date: Thu, 22 May 2025 15:54:55 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pei Xiao <xiaopei01@kylinos.cn>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	rafael@kernel.org, dakr@kernel.org, bartosz.golaszewski@linaro.org
Subject: Re: [PATCH] devres: Move remaining devm_alloc_percpu and
 devm_device_add_group to devres.h
Message-ID: <aC8en60QI0MwnXxM@smile.fi.intel.com>
References: <5ac1e2a127c9df7233ca8ba0696ebb08960d0fc3.1747903894.git.xiaopei01@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ac1e2a127c9df7233ca8ba0696ebb08960d0fc3.1747903894.git.xiaopei01@kylinos.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, May 22, 2025 at 05:01:26PM +0800, Pei Xiao wrote:
> Since commit f5e5631df596("devres: Move devm_*_action*() APIs to
> devres.h"), But devm_alloc_percpu() and devm_device_add_group didn't be
> moved.
> 
> so move it.The changes improve header organization by keeping all
> resource-managed device APIs in the dedicated devres.h header,
> reducing cross-header dependencies and making the interfaces
> easier to locate.

Thanks for the patch, my comments below.

...

> -/**
> - * devm_alloc_percpu - Resource-managed alloc_percpu
> - * @dev: Device to allocate per-cpu memory for
> - * @type: Type to allocate per-cpu memory for
> - *
> - * Managed alloc_percpu. Per-cpu memory allocated with this function is
> - * automatically freed on driver detach.
> - *
> - * RETURNS:
> - * Pointer to allocated memory on success, NULL on failure.
> - */
> -#define devm_alloc_percpu(dev, type)      \
> -	((typeof(type) __percpu *)__devm_alloc_percpu((dev), sizeof(type), \
> -						      __alignof__(type)))
> -
> -void __percpu *__devm_alloc_percpu(struct device *dev, size_t size,
> -				   size_t align);
> -void devm_free_percpu(struct device *dev, void __percpu *pdata);

Don't you need to cleanup the header inclusions as well?

...

> -int __must_check devm_device_add_group(struct device *dev,
> -				       const struct attribute_group *grp);

I'm not sure about this. The percpu seems standalone piece, but this has
relations with the other group related definitions just above.

...

> +#include <linux/sysfs.h>

> +#include <asm/percpu.h>

What for are these new inclusions, please?

...

> +/**
> + * devm_alloc_percpu - Resource-managed alloc_percpu
> + * @dev: Device to allocate per-cpu memory for
> + * @type: Type to allocate per-cpu memory for
> + *
> + * Managed alloc_percpu. Per-cpu memory allocated with this function is
> + * automatically freed on driver detach.
> + *
> + * RETURNS:

Please, check that all of the kernel-doc are in align (using same style).

> + * Pointer to allocated memory on success, NULL on failure.
> + */
> +#define devm_alloc_percpu(dev, type)      \
> +	((typeof(type) __percpu *)__devm_alloc_percpu((dev), sizeof(type), \
> +						      __alignof__(type)))

Just make it one line. it will be less than 100.

> +void __percpu *__devm_alloc_percpu(struct device *dev, size_t size,
> +				   size_t align);

Ditto.

> +void devm_free_percpu(struct device *dev, void __percpu *pdata);

Please, take your time to understand what is behind the __percpu and
why the asm/percpu.h is redundant here.

-- 
With Best Regards,
Andy Shevchenko


