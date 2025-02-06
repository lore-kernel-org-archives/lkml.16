Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CAD91E5B77
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 15:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738855960; cv=none; b=Tdzq2MYh8FnNO8PYEsWY/1g1oCaUXWpDVmU1P2mB42oUcqfgRiI8OwMgJGFmQkIf74QTI0UCPDNHu6AfLHZJ1ULMxu2hLbJRbzhdIPhIVPMFhKRqcSga/vZAJKIXsx/Tc2cn1i7obbJx10XOiYYTFqUfZahUpRwplpCsYtQAhJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738855960; c=relaxed/simple;
	bh=yK3i79DyDNlsmc0cViZ+iSdywpU2dajE/W3jfisTBIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LFlgQBKRThj8g5MtB1tL9cM0zrcpeT9ShchSi4lr7tJOpDKabzLAYKXHfNq+n0zq7McZSwQ0lISORNarobFx38ZiwXB41a6sEwOWXtjHyUMwc3Y5DyeVOoeBwiT8QNpQVLQebpnvrghce5jnMGdN+EkdliPwtJzuNwoRWLZCCno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WsO81xkK; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WsO81xkK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738855958; x=1770391958;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yK3i79DyDNlsmc0cViZ+iSdywpU2dajE/W3jfisTBIE=;
  b=WsO81xkK8k6+ZCtD/BO2F/rZErdTNryyQqHL1ZGRp6mVB5XACuNmPa+i
   3HBCri6UkRsvDK8s3ao0S0naOkIDeSoP/sJHHlYm11Ql6cbqr32tc2XJi
   QVOwSjP5s9gsOZe9Lkewn9rGP4BSv9qpaOvr9kohCY1g2WO+1AFksw7ic
   yaGrID0BXhEL03wMAdQnYxT5yTKjY19wX4fsxqYcvSWrz6ZlOA5ZazRHI
   1PzRvOWX+IZKYcwFEzo99NAs7YEY4pM+pzyYOvCPN5oNLbC7Y/wHDIOUb
   Zd0JUqEizGDoKgbwUmVHGSim7ILarMeiO9nqRz1ZiBunfhHqnxVZ6PLGO
   w==;
X-CSE-ConnectionGUID: cRz0+cloTzOVp0l4NYyftA==
X-CSE-MsgGUID: Af7kdLvBSr+cyKDlkov3Aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39618347"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="39618347"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 07:32:37 -0800
X-CSE-ConnectionGUID: kPkzpI6xQumtbdwdBqBgYA==
X-CSE-MsgGUID: u4+xCnzlRii5eEccxN2P2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="142134167"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 07:32:35 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tg3rk-00000008lLo-1f97;
	Thu, 06 Feb 2025 17:32:32 +0200
Date: Thu, 6 Feb 2025 17:32:32 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: I Hsin Cheng <richard120310@gmail.com>
Cc: pmladek@suse.com, rostedt@goodmis.org, linux@rasmusvillemoes.dk,
	senozhatsky@chromium.org, akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org, jserv@ccns.ncku.edu.tw,
	shuah@kernel.org
Subject: Re: [PATCH] vsprintf: Drop unused assignment of fmt.state
Message-ID: <Z6TWEHvBF0HOxKsY@smile.fi.intel.com>
References: <20250205172508.55358-1-richard120310@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205172508.55358-1-richard120310@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Feb 06, 2025 at 01:25:07AM +0800, I Hsin Cheng wrote:
> Remove unused assignment of "fmt.state", in both cases the value of
> "fmt.state" will be overwritten by either "FORMAT_STATE_PRECISION" or
> "FORMAT_STATE_NUM", the value "FORMAT_STATE_NONE" isn't going to be used
> after the assignment.

...

> struct fmt format_decode(struct fmt fmt, struct printf_spec *spec)

>  			spec->field_width = -spec->field_width;
>  			spec->flags |= LEFT;
>  		}
> -		fmt.state = FORMAT_STATE_NONE;
> +
>  		goto precision;
>  	}
>  

While both are kinda redundant, this is not obvious what's stated in the commit
message. Yes, `goto qualifier;` is straightforward, but not `goto precision;`.
Which makes me think that these assignments can make code robust against
potential future changes to allow to catch up the wrong code paths.

Whatever maintainers decide, technically the change looks correct to me.

...

>  		if (spec->precision < 0)
>  			spec->precision = 0;
>  
> -		fmt.state = FORMAT_STATE_NONE;
> +

What's the reason to add an extra blank line? (We have already one here)

>  		goto qualifier;
>  	}

-- 
With Best Regards,
Andy Shevchenko


