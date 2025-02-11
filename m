Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D25D1F3FCB
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 12:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739276336; cv=none; b=VqjfgTzihQ6RFKneMmCUukiCOmHISh95AQjyZRFI07F7EaoiV9h6+0y4jmnPn5zdDiMj49mqcxvhKIti87Bybbgln4PjiylUm6A+saiIJu9PZo6Lv7qwzMqMKb0ZqTE8Ac4tZCC8a5E9NBEZsq5hNVHkVEj9oAQALRYEpqFqpds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739276336; c=relaxed/simple;
	bh=F0UA4GkJmTAWWd11ihB545fdyRZyfQwglGF8bAW4a1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GEMZ+RUvr1Oy5lpipVloO+GjiX647q5rIDA+bWDNDN0K1IQfxxXyjVFgPhtqvpvfNqf8dyA/RKYxXjC2mb8AxbmyWv5ioaB3izoo2V0bFwHHfNe9nQEzDMojBHsUFbV65dri51hajbZpaK7QXSBzyCLIfF50sR0kBNFGlF4HzdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PCLbWL9l; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PCLbWL9l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739276335; x=1770812335;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=F0UA4GkJmTAWWd11ihB545fdyRZyfQwglGF8bAW4a1g=;
  b=PCLbWL9lJ50/znxXeRMNOJ+KrQADdrFR9sA7nHrze/A3F7R5x3mPx3da
   Cwo3DeWwKi2QjhOV+V4wuUY+YFPvyHu4O9/MKhTXtdPDx8/7sb2ujdJaU
   AB5hW0Cm8CcZakHOgGElL3uY3UUurBaBmY0IoheEQiJIUk7cM2eoCMIrL
   BjAIiHqCvVust9BOW5Tn7SqCvcMf5ElneU1trbigm3BJQl5wMYYeWfATr
   e2gRYx8OLD9PdocuZiRJrwsFf01Q/n8oyKtUcsaWJyIz3FKbHj2LHbRjF
   bEISnIuciwdGHTKb82p2X76tH+Ng+YT02UZYVa5pS7sJlsSMDcss03nf7
   w==;
X-CSE-ConnectionGUID: hzPzyPttRRKZRYPPC1KxiA==
X-CSE-MsgGUID: ngHlT81bRx27gpWgE8zVSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="65246204"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="65246204"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 04:18:55 -0800
X-CSE-ConnectionGUID: VEyUrMFPSImnG0nVTJt3aQ==
X-CSE-MsgGUID: kwGRvzsGQW+M8TyhBtqe9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117689205"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 04:18:52 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1thpE1-0000000AV0z-2OZW;
	Tue, 11 Feb 2025 14:18:49 +0200
Date: Tue, 11 Feb 2025 14:18:49 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Subject: Re: [rfc, PATCH v1 1/1] hrtimers: Refactor
 hrtimer_clock_to_base_table initialisation
Message-ID: <Z6tAKThLxVc3fxTd@smile.fi.intel.com>
References: <20250210082907.4059064-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210082907.4059064-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Feb 10, 2025 at 10:26:02AM +0200, Andy Shevchenko wrote:
> Clang complains about overlapped initialisers in the
> hrtimer_clock_to_base_table definition. With `make W=1` and
> CONFIG_WERROR=y (which is default nowadays) this breaks
> the build:
> 
>   CC      kernel/time/hrtimer.o
> kernel/time/hrtimer.c:124:21: error: initializer overrides prior initialization of this subobject [-Werror,-Winitializer-overrides]
>   124 |         [CLOCK_REALTIME]        = HRTIMER_BASE_REALTIME,
> 
> kernel/time/hrtimer.c:122:27: note: previous initialization is here
>   122 |         [0 ... MAX_CLOCKS - 1]  = HRTIMER_MAX_CLOCK_BASES,
> 
> (and similar for CLOCK_MONOTONIC, CLOCK_BOOTTIME, and CLOCK_TAI).
> 
> Refactor hrtimer_clock_to_base_table initialisation to make
> the compiler happy.

For the record, GCC also fails here.

-- 
With Best Regards,
Andy Shevchenko


