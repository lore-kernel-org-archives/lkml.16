Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCA524C077
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 15:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743694099; cv=none; b=okJ7SO5VqR0mO5ajiaxYUIOzV33j6GOdh7TJ6SCiG+/guCVIEiyg8VNAbJlExJSB18jF3amDYe+GivtYa7dzTf5bNOJo2E4/z6El/l2lNACRRdXnnzgzCDTOGkqTC+4L84Xeg+aFzX136tdmUCGKFfH5QxA9WwQK4K+RBrKHMV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743694099; c=relaxed/simple;
	bh=yTFqoTPWLE/L61xmCORPTtNj4dUC8CDKMqJCWYrZP9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O//0NRuyW30dP4yMyg+EDQYPDh24Mrz0mYbL1/7YqiYdZzQNUMdBTVu5Z6m/5BGc2Jy4cNXgBL0oHDMZ7nHDwFrH2BRTK2PPE8ZNHt+1GL1Ka2D+zL0CZOUxIYxkTyXSw1cJofpNP2kuK++1AWPyPPsoFpgrH7Qel/eExjiAq18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IojviI0d; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IojviI0d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743694097; x=1775230097;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yTFqoTPWLE/L61xmCORPTtNj4dUC8CDKMqJCWYrZP9w=;
  b=IojviI0duEyWxDkEoOvAU61+PQoerJ/wM/f0T5C4j1eMLP6KvGsDdeN/
   FTUomEnRx2HHnixsUpCeT4XrkWBX+GPn9qHDA8ZTIgVFpGWuDht2xu3Dg
   3FqYcPuDUaj7wSEm+DwciXnKaEWXV132XR6Ml9wcJaBwPEe2bivSBzTnN
   sZF2AbxL7+Wx19/Hq1y1UwVYVzSLq9rGPw56PaptDfSRW4myWjA84Ig/X
   BgThpHeadymS6svikXT4TjPSKW91F2Bh4m9wCxdGIFaEcCq3Z/+7kT37G
   1UVeGCHNMt/KmqewTGdS0Fi4wTHmLZdNmd/4ik/389RerEoqJdUK7b5ns
   g==;
X-CSE-ConnectionGUID: F2Rq914MS2SwaqA7jpOm9g==
X-CSE-MsgGUID: UJ09gBnLToiNs39ByRF9wA==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="44264451"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="44264451"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 08:28:16 -0700
X-CSE-ConnectionGUID: DQ6ba/fdSUC9LaKY03Ndvw==
X-CSE-MsgGUID: PZ+1Pk5TQqehvJvTQFsX6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="127029583"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP; 03 Apr 2025 08:28:14 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 12AA4109; Thu, 03 Apr 2025 18:28:12 +0300 (EEST)
Date: Thu, 3 Apr 2025 18:28:12 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH -tip 2/4] x86/idle: Use MONITOR and MWAIT mnemonics in
 <asm/mwait.h>
Message-ID: <Z-6pDGR0pQavVQfq@black.fi.intel.com>
References: <20250402180827.3762-1-ubizjak@gmail.com>
 <20250402180827.3762-2-ubizjak@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402180827.3762-2-ubizjak@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Apr 02, 2025 at 08:08:06PM +0200, Uros Bizjak wrote:
> Current minimum required version of binutils is 2.25,
> which supports MONITOR and MWAIT instruction mnemonics.
> 
> Replace the byte-wise specification of MONITOR and
> MWAIT with these proper mnemonics.
> 
> No functional change intended.

Hmm... Is it only me who gets these, please?

In file included from acpi/cstate.c:18:
asm/mwait.h:30:15: error: invalid operand for instruction
   30 |         asm volatile("monitor %0, %1, %2" :: "a" (eax), "c" (ecx), "d" (edx));
      |                      ^
<inline asm>:1:16: note: instantiated into assembly here
    1 |         monitor %rax, %ecx, %edx
      |                       ^~~~~
In file included from acpi/cstate.c:18:
asm/mwait.h:95:15: error: instruction requires: Not 64-bit mode
   95 |         asm volatile("sti; mwait %0, %1" :: "a" (eax), "c" (ecx));
      |                      ^
<inline asm>:1:7: note: instantiated into assembly here
    1 |         sti; mwait %eax, %ecx
      |              ^

-- 
With Best Regards,
Andy Shevchenko


