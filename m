Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C145D7DA7F
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 10:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744022555; cv=none; b=f6IDfGld8o/4Z3ZPRCfH7gWpNhqVq/jcyGI5hXVGmur1e14pklD62T7eC+ENTrsk0K2f1B2I1d1Tnb+UMmb+BDIplKfLYZc8vp2AgxSMCJUYoaCN9qj0QmzUAQx8aOGlgMOyOVsbIwN+5Bu2waxftghun4Zr3uu4Rx4dBMj69f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744022555; c=relaxed/simple;
	bh=BTQ2TSUP/kMkAIJGD/VdiVrl34f/oVvAMapmxLyIi0U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KR11nGrI/JfFjsH9Ig5FlLoB+YsJusP4r3eg8Sq7Ts7gnEvMJDvS5CATcB4+CVivkZOBITo6F6bauM1FRST+g60X4T8sLruIwlbdyXBwF9t3ZljMjq4kuhHMJUoLS5XY+g37ic05W7S84M1gs688DIGctc97NmpXnt7Ji+swalM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W8CWj4ur; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W8CWj4ur"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744022554; x=1775558554;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BTQ2TSUP/kMkAIJGD/VdiVrl34f/oVvAMapmxLyIi0U=;
  b=W8CWj4urJED5fGJP4qheRquoXhyUlVbuYDe+qU9rQct3A2dlSAe7IUrv
   CbxkOdjG962WjZ2u4JJ6dgYf8YcdQTAOwPvMBF/uvwTqwhIWt+8uluTRy
   wSgIPrUMJMQLmZtVkx0cu9fPY6sD8dsf1tQ7QrLPI3euZ3yKVc+4gHLQs
   dbCCJE0Bcjn7l8IbwnkmhV/x14RLe5DfbiyCni+NWgNhfJXTkleHVMStt
   FzNvcnTIuEK+UMeKeKVlWbIp5lwzysEkAtkxiZgAhLkWFT7aX1BhVyqPV
   3OcaSVxpq6sBtVdq8rBniAWcmylxWRNuXpapU3FqmHM+0+KStwPGgGkHT
   w==;
X-CSE-ConnectionGUID: GuET1i8rTjSYdgQg/jVUKg==
X-CSE-MsgGUID: YBF45wpJQW2uMcCbz/t4Fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="44543753"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="44543753"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 03:42:33 -0700
X-CSE-ConnectionGUID: sYKVmkG7RxmlvumH7/NB3w==
X-CSE-MsgGUID: DpFFYkSxRd+AylRQWrkUIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="128447513"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa007.jf.intel.com with ESMTP; 07 Apr 2025 03:42:30 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id BACDD26A; Mon, 07 Apr 2025 13:42:28 +0300 (EEST)
Date: Mon, 7 Apr 2025 13:42:28 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Waiman Long <longman@redhat.com>,
	Carlos Llamas <cmllamas@google.com>,
	Ying Huang <huang.ying.caritas@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] lockdep: change 'static const' variables to enum values
Message-ID: <Z_OsFKc1PTom_VO3@black.fi.intel.com>
References: <20250225200830.4031742-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225200830.4031742-1-arnd@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Feb 25, 2025 at 09:08:26PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> gcc warns about 'static const' variables even in headers when building
> with -Wunused-const-variables enabled:
> 
> In file included from kernel/locking/lockdep_proc.c:25:
> kernel/locking/lockdep_internals.h:69:28: error: 'LOCKF_USED_IN_IRQ_READ' defined but not used [-Werror=unused-const-variable=]
>    69 | static const unsigned long LOCKF_USED_IN_IRQ_READ =
>       |                            ^~~~~~~~~~~~~~~~~~~~~~
> kernel/locking/lockdep_internals.h:63:28: error: 'LOCKF_ENABLED_IRQ_READ' defined but not used [-Werror=unused-const-variable=]
>    63 | static const unsigned long LOCKF_ENABLED_IRQ_READ =
>       |                            ^~~~~~~~~~~~~~~~~~~~~~
> kernel/locking/lockdep_internals.h:57:28: error: 'LOCKF_USED_IN_IRQ' defined but not used [-Werror=unused-const-variable=]
>    57 | static const unsigned long LOCKF_USED_IN_IRQ =
>       |                            ^~~~~~~~~~~~~~~~~
> kernel/locking/lockdep_internals.h:51:28: error: 'LOCKF_ENABLED_IRQ' defined but not used [-Werror=unused-const-variable=]
>    51 | static const unsigned long LOCKF_ENABLED_IRQ =
>       |                            ^~~~~~~~~~~~~~~~~
> 
> This one is easy to avoid by changing the generated constant definition
> into an equivalent enum.

Tested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


