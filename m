Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3775C28153C
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 15:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745334840; cv=none; b=rDMS3pPBMKfFEZL/RwYbCPtK8gF73ac9n4r3uI1h3sSr8tKe4oZHV2cRTw7k5m/fCF+6752ls6bIl+pohyj2BKGEpVyt0n0Y0nV3mnTEfVHueP9QAwIepU3v+bg2rbquRPhbtPdEY3tp12arORY4SwlqW4pZRaC3UHUcRjJhjIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745334840; c=relaxed/simple;
	bh=Wrf6vgp8JDKq6IbHAJGmDbzhlwDyhz6u63GWQrg5oYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C8RSBjQn8Ra4QTESkOWyzD3xAFUMltIpQyBjP8Yv7OYa31xKjylBNiyKNkPBJi3XF9jmOkOG4dCbGSovf/G/g5J68bblHd8X//LIdw06WeY+Kn9sSzhWiEwaVv7xyVXqeD1uN94PbSr1Z1vH00X1e9Cy/0uiPhm+/ca3D+MjVZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: yCxkWzCRTlSMtPLowljZ1Q==
X-CSE-MsgGUID: 5/WmZRUsRUaANWyqvtqcjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="69388624"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; 
   d="scan'208";a="69388624"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 08:13:58 -0700
X-CSE-ConnectionGUID: YVQF3sKHREuJNZmx/nlnag==
X-CSE-MsgGUID: vMxvhr4uTri8r+1Jd6gRMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; 
   d="scan'208";a="132362842"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 08:13:55 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andy@kernel.org>)
	id 1u7FJo-0000000ElI8-0jTx;
	Tue, 22 Apr 2025 18:13:52 +0300
Date: Tue, 22 Apr 2025 18:13:51 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>,
	Borislav Petkov <bp@alien8.de>, Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Kees Cook <keescook@chromium.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: Re: [PATCH 19/29] x86/boot/e820: Standardize e820 table index
 variable types under 'u32'
Message-ID: <aAeyL9yxqXl4pazK@smile.fi.intel.com>
References: <20250421185210.3372306-1-mingo@kernel.org>
 <20250421185210.3372306-20-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421185210.3372306-20-mingo@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Apr 21, 2025 at 08:51:59PM +0200, Ingo Molnar wrote:
> So we have 'idx' types of 'int' and 'unsigned int', and sometimes
> we assign 'u32' fields such as e820_table::nr_entries to these 'int'
> values.
> 
> While there's no real risk of overflow with these tables, make it
> all cleaner by standardizing on a single type: u32.
> 
> This also happens to shrink the code a bit:
> 
>    text      data      bss        dec        hex    filename
>    7745     44072        0      51817       ca69    e820.o.before
>    7613     44072        0      51685       c9e5    e820.o.after

Ah, here it is! You can ignore my respective comment in one of the previous
patches. Perhaps better to group that one (which converts to use idx) and this
one, so they will be sequential in the series?


-- 
With Best Regards,
Andy Shevchenko


