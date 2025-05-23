Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096D7204840
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 16:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748017138; cv=none; b=L5m3kVgMWTftbyE3NkqqxQf3th/3JN/oZ2bSBRkz++lO+7vIBsLtB19aMeAILWyV21480+TGyKGHLBe3RKz8aSGAkzQxUxPrvIMpK15eUqIRLddC4ejhFBL7KZ9jXGhT+mbWgbszeSlvysOouXu6k99trNQeiVqL+WGJKuR7tRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748017138; c=relaxed/simple;
	bh=xfNHEnLmgeh/K1be+lgdb7XLzEAsPgz6HzSFv9xlG8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cCXuaJGOgoCYOIMGkbQjUN15HqeSA/ctjxUznsUg0OfnxQm69dTQdAldLqFMnuatBTAWMcjE1VYXAET6SaMse+KH4covX0Gxh3xtqmUN6bdW7fluQxqKXAZuIIlAarDKj2ctT4ppfia95+Y6KMZRM2L/Pxze6p85yyF8aWbuX0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A7RkzVla; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A7RkzVla"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748017137; x=1779553137;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=xfNHEnLmgeh/K1be+lgdb7XLzEAsPgz6HzSFv9xlG8c=;
  b=A7RkzVlae6A0x8D+PWDaB72pmg+Nv/Y1bYL2D/2rGj+n03Hz/N2LrwkP
   B8HQY4vHcZNtshdcVtiEo+ioK4k5PLnZToXZ8eH+qGoUHZue1UNOGuh0F
   ZQZiKRs+F0LDMlZDvR0Xt1qdqbRBqo91pXpfTTZQ7UxmV8twT1tCS1ziU
   CdtHvBlgH2HLs6bNGMeGkvYnlqp+6H3utULXB+/Z33eiOzIR6Oxjz418/
   6AoGX48XwmfNvkdPb1qZQfoRhpZ3lJyFpidogaMsZpalUVtk6Pt7N5/3o
   48OHVei9LjoeK+Ggj6HOk00zdmmIazCIAFF+1RyqRbOSRpkB4Fj68rhVL
   A==;
X-CSE-ConnectionGUID: 5SwomvpkTruGJ8yJBjtYiA==
X-CSE-MsgGUID: uFztTZNUQOairN71ZxCOog==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="50242892"
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; 
   d="scan'208";a="50242892"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 09:18:57 -0700
X-CSE-ConnectionGUID: 41ugiljpQYCEsIVJXTeS7A==
X-CSE-MsgGUID: +pRvWpBlQ+yRXzHFr+Arjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; 
   d="scan'208";a="164441000"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 09:18:55 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uIV6h-000000006GG-46qg;
	Fri, 23 May 2025 19:18:51 +0300
Date: Fri, 23 May 2025 19:18:51 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pei Xiao <xiaopei01@kylinos.cn>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	rafael@kernel.org, dakr@kernel.org, bartosz.golaszewski@linaro.org
Subject: Re: [PATCH] devres: Move remaining devm_alloc_percpu and
 devm_device_add_group to devres.h
Message-ID: <aDCf6-xhBStld-a4@smile.fi.intel.com>
References: <5ac1e2a127c9df7233ca8ba0696ebb08960d0fc3.1747903894.git.xiaopei01@kylinos.cn>
 <aC8en60QI0MwnXxM@smile.fi.intel.com>
 <3abc216a-1af5-4cc2-a70c-e406943be274@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3abc216a-1af5-4cc2-a70c-e406943be274@kylinos.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, May 23, 2025 at 11:08:09AM +0800, Pei Xiao wrote:
> 在 2025/5/22 20:54, Andy Shevchenko 写道:
> > On Thu, May 22, 2025 at 05:01:26PM +0800, Pei Xiao wrote:

...

> > Don't you need to cleanup the header inclusions as well?

Any answer here?

...

> >> -int __must_check devm_device_add_group(struct device *dev,
> >> -				       const struct attribute_group *grp);
> > I'm not sure about this. The percpu seems standalone piece, but this has
> > relations with the other group related definitions just above.

And here? You should either agree on non-commented points (and remove them
when replying) or answer what's wrong with the suggestions. Ignoring is not
an option.

...

> >> +#include <linux/sysfs.h>
> >> +#include <asm/percpu.h>
> > What for are these new inclusions, please?
> 
> I add these for build error:
> 
> In file included from drivers/gpio/gpiolib-devres.c:9:
> ./include/linux/device/devres.h:189:15: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘*’ token
>   189 | void __percpu *__devm_alloc_percpu(struct device *dev, size_t size,
>       |               ^
> ./include/linux/device/devres.h:191:57: error: expected ‘;’, ‘,’ or ‘)’ before ‘*’ token
>   191 | void devm_free_percpu(struct device *dev, void __percpu *pdata);
>       |                                                         ^

Nice, and where is the __percpu defined?

> ./include/linux/device/devres.h:194:25: warning: ‘struct attribute_group’ declared inside parameter list will not be visible outside of this definition or declaration
>   194 |            const struct attribute_group *grp);
>       |                         ^~~~~~~~~~~~~~~

And why do you need the sysfs.h to resolve this? I don't see the use of
the struct attribute_group here. (The error message has the hint in it
on how to proceed)

...

> > Please, take your time to understand what is behind the __percpu and
> > why the asm/percpu.h is redundant here.

-- 
With Best Regards,
Andy Shevchenko


