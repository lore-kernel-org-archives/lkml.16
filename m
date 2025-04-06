Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B001D42A83
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 12:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743943135; cv=none; b=ehqYg1vBe6oTRSDVcIvEYgswLC6VEm5f+kWhTOzbPUDtJPD8XcRmKj2mhNfeh3hCE5SSlpGXliVAMuyY1lZFIOw6mXxBskBClGvanJnRQdCl+4pFCsc95KUGutWBsJLfb+GD3ZUsiHExD30e/RgDD3YChzNrstA2QM/p/cnAo9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743943135; c=relaxed/simple;
	bh=+2E+eVLYZOMNqHXv4RRjlCbqLiaqWjfxeKW9hsWQd7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G17ELQZ3sIV1JVoVMLAvghlRRPqcBPR65iEeShqoJR0zV7u6rvxKAGW2hawm0lBbytqZZ3gtciro6IWQC30KgDbC8slVQ7opYjxG1aH8Y6WqlvOhKWWknpSZU+nDfFcwRXkQZGx89LYamvZQMT+b5m6X9ycL2YPGGpYUAQ1soro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HkaNPmsF; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HkaNPmsF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743943133; x=1775479133;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=+2E+eVLYZOMNqHXv4RRjlCbqLiaqWjfxeKW9hsWQd7Y=;
  b=HkaNPmsFQlDhIfJE761WtlZiwcsBFSt8w8Hxe5WQexZNwX7s3Z8lU8CO
   YgyZ3CR8ZE/Pzqck5oLFVLKljWdhiyGuCr/JHFFoCThaEfbZRtA6MwnA7
   4Eyfugvs8VrY3xt894YhnAXEsjvRrYGcGRbLcqqN/NPlHbNsEv0ir1Ljp
   XoOC6XF+gLeM8gC6V7HYargR/YFl/PbXeATi7jlHOFFSHS6AuDOVmVvdc
   ITvl+A9zpE4TCkYYqV2Wvwmh7ci52M040hvuAnxnAxHUh/l5iutp7vA/5
   CvIvf2xC0T870KVsxGk4qUP35fUM89XwnLLgfBRySQcsENrhWXrUC+M+M
   g==;
X-CSE-ConnectionGUID: stLaK1+ZQcGaM+2WzvAjsw==
X-CSE-MsgGUID: MWgB77qqQEmpqraGsatNBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11395"; a="56702671"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="56702671"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2025 05:38:53 -0700
X-CSE-ConnectionGUID: /cgXgdIbSSGK6jDSKJ6EkA==
X-CSE-MsgGUID: Ablh1bFsTk6b02xq5rRXEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="127686342"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2025 05:38:51 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u1PGy-00000009kMh-2zom;
	Sun, 06 Apr 2025 15:38:48 +0300
Date: Sun, 6 Apr 2025 15:38:48 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v1 1/1] sched/fair: Mark some static const with
 __maybe_unused
Message-ID: <Z_J12Fr-0wYQvEAV@smile.fi.intel.com>
References: <20250404165204.3657093-1-andriy.shevchenko@linux.intel.com>
 <52d144d1-ffda-4b41-9ed5-2a4fcd4f08d7@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <52d144d1-ffda-4b41-9ed5-2a4fcd4f08d7@app.fastmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sat, Apr 05, 2025 at 11:16:19AM +0200, Arnd Bergmann wrote:
> On Fri, Apr 4, 2025, at 18:52, Andy Shevchenko wrote:
> > GCC considers that some static const defined in the lockdep_internals.h
> > are unused, which prevents `make W=1` and CONFIG_WERROR=y builds:
> >
> > kernel/locking/lockdep_internals.h:69:28: error: 
> > ‘LOCKF_USED_IN_IRQ_READ’ defined but not used 
> > [-Werror=unused-const-variable=]
> >    69 | static const unsigned long LOCKF_USED_IN_IRQ_READ =
> >       |                            ^~~~~~~~~~~~~~~~~~~~~~
> > kernel/locking/lockdep_internals.h:63:28: error: 
> > ‘LOCKF_ENABLED_IRQ_READ’ defined but not used 
> > [-Werror=unused-const-variable=]
> >    63 | static const unsigned long LOCKF_ENABLED_IRQ_READ =
> >       |                            ^~~~~~~~~~~~~~~~~~~~~~
> > kernel/locking/lockdep_internals.h:57:28: error: ‘LOCKF_USED_IN_IRQ’ 
> > defined but not used [-Werror=unused-const-variable=]
> >    57 | static const unsigned long LOCKF_USED_IN_IRQ =
> >       |                            ^~~~~~~~~~~~~~~~~
> > kernel/locking/lockdep_internals.h:51:28: error: ‘LOCKF_ENABLED_IRQ’ 
> > defined but not used [-Werror=unused-const-variable=]
> >    51 | static const unsigned long LOCKF_ENABLED_IRQ =
> >       |                            ^~~~~~~~~~~~~~~~~
> >
> > Fix this by marking them with __maybe_unused.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> I posted as different patch for this a while ago:
> 
> https://lore.kernel.org/lkml/20250225200830.4031742-1-arnd@kernel.org/
> 
> Either of the two should be fine here, though I still like my
> version a bit better.

I'm not a fan of __maybe_unused, I just didn't come up with better idea,
you did. So, I also prefer your version. Can anybody apply that patch
from Arnd, please?

-- 
With Best Regards,
Andy Shevchenko


