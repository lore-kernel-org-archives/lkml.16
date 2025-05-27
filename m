Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEEAB1C5D61
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 11:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748344164; cv=none; b=EfnRTimMIhUMp7RxpFryuD9EkLq/IhLPgdEFq9807t0j/TnF+L+3MkYM8KKfYAHRLFEAXstpTJhKZwE/H+T6y9Hwu+/Wg+IP40sEd29N3r6iCvH17jIAjHV+8fMi5f5HBOHKoqxrrFUjqidlGoAAAPvQ1lSlkzau5JIsqEuK6NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748344164; c=relaxed/simple;
	bh=XYksfjFD/3Q8ilajxL/0Ns8pjisWCTwfCtKGPtnUdAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rIU4SrAcdaPEGm5bpA3heWBQkt7XQO90sjVCILUhagimDLYEnyzFErqVZNqsme1oNg4NXo7hfwne6KtPYholjUt7wMFHrpMgR22mrolICVEI0AS/gzlYrTE97YpGWUppnefxGZPqnte+cMLkZNcVfjiXuefyyeAWZL4goFoEyVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P8RAtomU; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P8RAtomU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748344163; x=1779880163;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=XYksfjFD/3Q8ilajxL/0Ns8pjisWCTwfCtKGPtnUdAg=;
  b=P8RAtomUOrxgamBdim1uCercHzNMgoNR1CE7P86jfRgvgnyyEgowH2LR
   0xGRFP86wmlSr7eO8ObeUVjlNKXtEe1S7Wjo6xnAKwAnLQALWqWTvVH+y
   6R6IeUGL3cBVHhMZALeCuUtNA2yWzyBCUnqGeGXvhCIfPuNgnEByxf6tZ
   NcAhZR3/cWdRpQlkDM9RX4wdHwSsWpjCPoJC3bAeGLUV1zifbYuJn0/K6
   k2pFjnVm9/3shR6jOP6UynOLLp82ITiuIUglgWP06BIoSwM2521Z60sC0
   6B8Zioo4gOoZgL0LTWJTHlHH6V79J3QCpnYMdoWbC10DxjvSCK2ZeM4UC
   g==;
X-CSE-ConnectionGUID: g49X/X5xTGOlJh/7j/tJEw==
X-CSE-MsgGUID: Yz7QfKPgSpeghSo/dACrNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="49580448"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; 
   d="scan'208";a="49580448"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 04:09:22 -0700
X-CSE-ConnectionGUID: KGCFgDpxS8+76GE+0IkH9g==
X-CSE-MsgGUID: 1c6WFYHXSYGN5bQtpj7xTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; 
   d="scan'208";a="142717775"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 04:09:20 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uJsBJ-000000019AT-2qwO;
	Tue, 27 May 2025 14:09:17 +0300
Date: Tue, 27 May 2025 14:09:17 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pei Xiao <xiaopei01@kylinos.cn>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	rafael@kernel.org, dakr@kernel.org, bartosz.golaszewski@linaro.org
Subject: Re: [PATCH] devres: Move remaining devm_alloc_percpu and
 devm_device_add_group to devres.h
Message-ID: <aDWdXT36Ucxk0O63@smile.fi.intel.com>
References: <5ac1e2a127c9df7233ca8ba0696ebb08960d0fc3.1747903894.git.xiaopei01@kylinos.cn>
 <aC8en60QI0MwnXxM@smile.fi.intel.com>
 <b71a4ff3-8013-47e0-b2ac-2c5b3d8f8afc@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b71a4ff3-8013-47e0-b2ac-2c5b3d8f8afc@kylinos.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, May 27, 2025 at 05:41:21PM +0800, Pei Xiao wrote:
> 在 2025/5/22 20:54, Andy Shevchenko 写道:
> > On Thu, May 22, 2025 at 05:01:26PM +0800, Pei Xiao wrote:

...

> >> -void __percpu *__devm_alloc_percpu(struct device *dev, size_t size,
> >> -				   size_t align);
> >> -void devm_free_percpu(struct device *dev, void __percpu *pdata);
> > Don't you need to cleanup the header inclusions as well?
> 
> no, I think we don't need to cleanup .
> 
> #include <linux/lockdep.h> include #include <asm/percpu.h>
> 
> only move #include <asm/percpu.h> to linux/device/devres.h for
> 
> build error.

It's not needed for the build error fixing as far as I understood it. __percpu
is defined in another header.

...

> >> -int __must_check devm_device_add_group(struct device *dev,
> >> -				       const struct attribute_group *grp);
> > I'm not sure about this. The percpu seems standalone piece, but this has
> > relations with the other group related definitions just above.
> 
> I'm also not sure if this devm_device_add_group needs to be moved, 
> 
> which is why I haven't replied to you yet

Fair enough.

...

> >> +#include <linux/sysfs.h>
> it's redundant.
> >> +#include <asm/percpu.h>
> > What for are these new inclusions, please?
> for percpu.

It does not define __percpu.

> >> +void devm_free_percpu(struct device *dev, void __percpu *pdata);
> > Please, take your time to understand what is behind the __percpu and
> > why the asm/percpu.h is redundant here.
> 
> If this header file is missing, there will be a compilation error. 

Right. But this is wrong header for the purpose.

> Which header file should I include?

The one that defines it, hint:
https://elixir.bootlin.com/linux/v6.15/A/ident/__percpu

> I've found that including <asm/percpu.h> does resolve my compilation issue.

-- 
With Best Regards,
Andy Shevchenko


