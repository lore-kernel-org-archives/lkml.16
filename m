Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4165B15D1
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 09:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748424690; cv=none; b=pdaiCyfM+JRmjqGQvHjmVWv5feopIsdJpylZv1W5RyrEW6r3PZuFNvgYjU6BnCJh26+kJn1Sr2J+88otLGYa8guVFJkj8Q/hyE/L0e9btni5MDMLm1UrRxwr9FIM2Ava0lV2CDuJ0ll1a5l8HfoInDA1q/TYpczlWylV/8/7niQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748424690; c=relaxed/simple;
	bh=3gqXNmfgBpy7vgpHSrbi6sQ1P2dp5ocMzaW85aq70PU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ayw9f7wA3oxK+HaHbUKpu3J7v+6NbPC+QDZtAUc7LbtTwKotRDfo8k/kEqYuslOETLFPIZlJpGxGrCvtv7x2VZhTDXFiLx7PvdIMebmD5AgNO0m5nqXCWtK32hLTWH1rdB2stpR4x5GAFva4xIaafCWICPXqfq1C5M/ZlasGJ8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F28DdG0r; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F28DdG0r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748424689; x=1779960689;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=3gqXNmfgBpy7vgpHSrbi6sQ1P2dp5ocMzaW85aq70PU=;
  b=F28DdG0rd9rr4qGnnUlf3rqNDOr8fUKs2/zrzLl7lwVsVsH7W/A7xKe5
   ypA9zHClFYoYEZWP1hxZDhHgPQ5XY7XoUZhHL9sCLBL/ue1NOkKqhofyF
   6w3O1lJM29lqEVgLPSnt7Tke4joLzEeu+dUQImYuXn45+mkRBHg6lrg79
   WUmvQntrl4xRU/GxdmeC3MFWvLRotlD9pIMm0xnTTk+NvxuDKKZ7EroB2
   lfCXZ931uJC3D9ZvoVci2u5rEtZ5+YwoEc+4/285jpreZkC0PB1Ho/hAr
   HKEfR6UrOkBEBcDUNLtqN56ZFDgqQV0bErsScKTpBUlkpZrpV9BIgNkai
   Q==;
X-CSE-ConnectionGUID: SJnjkPslTVax2tWXoh1jwA==
X-CSE-MsgGUID: 5lNWTMwdSIu2TezK9Ry1ng==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="50437449"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; 
   d="scan'208";a="50437449"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 02:31:28 -0700
X-CSE-ConnectionGUID: ck+Bq/amQYmaXnjlUzPETQ==
X-CSE-MsgGUID: DSk/tjlVTEeJIAgfo9VRtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; 
   d="scan'208";a="174077191"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 02:31:26 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uKD87-00000001PBP-0Ylo;
	Wed, 28 May 2025 12:31:23 +0300
Date: Wed, 28 May 2025 12:31:22 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pei Xiao <xiaopei01@kylinos.cn>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	rafael@kernel.org, dakr@kernel.org, bartosz.golaszewski@linaro.org
Subject: Re: [PATCH] devres: Move remaining devm_alloc_percpu and
 devm_device_add_group to devres.h
Message-ID: <aDbX6natYH6Pu2ED@smile.fi.intel.com>
References: <5ac1e2a127c9df7233ca8ba0696ebb08960d0fc3.1747903894.git.xiaopei01@kylinos.cn>
 <aC8en60QI0MwnXxM@smile.fi.intel.com>
 <b71a4ff3-8013-47e0-b2ac-2c5b3d8f8afc@kylinos.cn>
 <aDWdXT36Ucxk0O63@smile.fi.intel.com>
 <2154e254-3cbc-4dc4-8497-f168fee58598@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2154e254-3cbc-4dc4-8497-f168fee58598@kylinos.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, May 28, 2025 at 11:07:43AM +0800, Pei Xiao wrote:
> 
> 在 2025/5/27 19:09, Andy Shevchenko 写道:
> > On Tue, May 27, 2025 at 05:41:21PM +0800, Pei Xiao wrote:
> >> 在 2025/5/22 20:54, Andy Shevchenko 写道:
> >>> On Thu, May 22, 2025 at 05:01:26PM +0800, Pei Xiao wrote:

...

> >> include #include <asm/percpu.h>
> >>
> >> only move #include <asm/percpu.h> to linux/device/devres.h for
> >>
> >> build error.
> > It's not needed for the build error fixing as far as I understood it. __percpu
> > is defined in another header.
> 
> compiler_types.h or compiler.h 
> 
> I tried before send patch, but it all resulted in compilation failures on my arm64 machine.

You need to investigate those. But header doesn't use anything fancy AFAICS, so
compiler_types.h should be enough. I think you need to move asm/percpu.h to
devres.c (C file).

...

> >>>> +#include <linux/sysfs.h>
> >> it's redundant.
> >>>> +#include <asm/percpu.h>
> >>> What for are these new inclusions, please?
> >> for percpu.
> > It does not define __percpu.
> >
> >>>> +void devm_free_percpu(struct device *dev, void __percpu *pdata);
> >>> Please, take your time to understand what is behind the __percpu and
> >>> why the asm/percpu.h is redundant here.
> >> If this header file is missing, there will be a compilation error. 
> > Right. But this is wrong header for the purpose.
> >
> >> Which header file should I include?
> > The one that defines it, hint:
> > https://elixir.bootlin.com/linux/v6.15/A/ident/__percpu
> 
> compiler_types.h or compiler.h 
> 
> I tried before send patch, but it all resulted in compilation failures on my arm64 machine.
> 
>  You can give it a try.

Sure.

> when i add a error in compiler_types.h
> 
> +++ b/include/linux/compiler_types.h
> @@ -26,6 +26,7 @@
>  
>  /* sparse defines __CHECKER__; see Documentation/dev-tools/sparse.rst */
>  #ifdef __CHECKER__
> +sasasas
>  /* address spaces */
>  # define __kernel      __attribute__((address_space(0)))
>  # define __user                __attribute__((noderef, address_space(__user)
> 
> it  still build success,have no build error.
> 
> #include <linux/lockdep.h> include <asm/percpu.h> ,so have no build error before modidy,I think.
> 
> >> I've found that including <asm/percpu.h> does resolve my compilation issue.
> thanks!

-- 
With Best Regards,
Andy Shevchenko


