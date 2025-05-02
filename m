Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0932254861
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 14:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746197677; cv=none; b=mL2AwnMq3seWq/pNAOH6631jalxXg+VxQ95Usq2FaJ6K4fOrGebKtg24pTKQvHaHmsn0cPN9aqFNUdDCOgp00h7K5RFkXp4+zx9kJ0hL7Fi+sGSMzNhgXQJQyb56Pt4fgOQDR5nD5nlmzCY2HbFPm8TvLF9YxTnwiGfYtNiVzhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746197677; c=relaxed/simple;
	bh=0y73RY0urN80J1Jj8SHrAVqHgvajjs8QowqUXePpx7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dNm9lJ7sKnLUXJK9/UvPZk3N8SEYrg9MuR+whX8SSaLPRjD7tWvgh8gq2Cru3dpfwHqQzbotdvRhyysH1UDAjov1enGBoiyDFa9t2UTPHJQPdp10Hq8rNCcX2Z7AXVldAp8VQUsaACepuQhsU4I9RsnXBBapHHpdT2lG8o1jTHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DlauYN08; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DlauYN08"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746197676; x=1777733676;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0y73RY0urN80J1Jj8SHrAVqHgvajjs8QowqUXePpx7g=;
  b=DlauYN08jVWk5kGnTW51SKf/NMS06KV+fxq6KaOX/Tqqas5TuW40A5vg
   Xovuxc9CxUfEaKSt+gb679FJN+2d5LoaqfvI0e9tH+NLe888ZRBdrc8Ge
   NnmssH3jDT1KyB3tk4yr57ZARJZoKm7kjhl9+oqoXkB1i5E+9xWbOy7oN
   rU+tjUXhTsybNoV8UlY24izk/G6NukxXqucPLpVo9pLlhy6uzDEGW0iSl
   CvbA99BZsnttGaKAlYZxJyNLtgZo0D1z/SPjUi/PO7lIFWYiFo5qyQRdA
   yCnlJqDoIafaVzbp/dF+QSODWzygj6VF+H3J5x+E5qJCcLyzECWEbdWIi
   A==;
X-CSE-ConnectionGUID: zBzSumiqTQSmO30y4xaB9g==
X-CSE-MsgGUID: iG2iJuZVQaeR99sekc27yg==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="51543581"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="51543581"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 07:54:36 -0700
X-CSE-ConnectionGUID: u9eiiQJYRs2znahj783Xzw==
X-CSE-MsgGUID: A9IHD9AEQDWvs2uMEOsASw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="134575523"
Received: from smile.fi.intel.com ([10.237.72.55])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 07:54:33 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uArmX-00000002ENu-0kYL;
	Fri, 02 May 2025 17:54:29 +0300
Date: Fri, 2 May 2025 17:54:28 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH v1 1/1] lockdep: Move hlock_equal() to the respective
 ifdeffery
Message-ID: <aBTcpCYHOVtQX1lF@smile.fi.intel.com>
References: <20250415085857.495543-1-andriy.shevchenko@linux.intel.com>
 <aBTP9AaJ0uyzAjxG@smile.fi.intel.com>
 <6814da67.050a0220.2f3283.cdc1@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6814da67.050a0220.2f3283.cdc1@mx.google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, May 02, 2025 at 07:44:53AM -0700, Boqun Feng wrote:
> On Fri, May 02, 2025 at 05:00:20PM +0300, Andy Shevchenko wrote:
> > On Tue, Apr 15, 2025 at 11:58:56AM +0300, Andy Shevchenko wrote:
> > > When hlock_equal() is unused, it prevents kernel builds with clang,
> > > `make W=1` and CONFIG_WERROR=y, CONFIG_LOCKDEP=y and
> > > CONFIG_LOCKDEP_SMALL=n:
> > > 
> > >   lockdep.c:2005:20: error: unused function 'hlock_equal' [-Werror,-Wunused-function]
> > > 
> > > Fix this by moving the function to the respective existing ifdeffery
> > > for its the only user.
> > > 
> > > See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
> > > inline functions for W=1 build").
> > 
> > Any news here, please? The problem still exists in v6.15-rc4.
> 
> This is in my radar, so it will be in a PR to tip soon. I didn't reply
> earlier because I meant to find a whole cleanup for ifdefferies in
> lockdep:
> 
> 	https://lore.kernel.org/lkml/Z46BJ8FhWCIXbM7p@boqun-archlinux/

This is good news! Nobody likes ifdeffery, it makes code harder to read.

> to avoid whack-a-mole fixes. I never found time so I have to postpone
> that. Thanks!

-- 
With Best Regards,
Andy Shevchenko


