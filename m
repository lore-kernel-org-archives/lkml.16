Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D7F2116EB
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 10:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745317395; cv=none; b=QLbefDtegLLs98yLEXmOROT8Wi2eFfLn9riKSxRwULs10zbAWhLG9NlFIjyOXrfYYtNyV9Kaqp0Ic9sv+nYzTXlyELT60cDzk5zPvqPwlpvrLaFXJHvMqU80Bto6movcuNq+wxx0QcTDcIW36jLdgS+jg1lvMEQYNerY98wXVYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745317395; c=relaxed/simple;
	bh=zJBJ7aJsAxX1ZlswMDtzHTY+A2puc4ukvLpuVEeKiug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HJMlPtw6XaCc1iYbOJPedwy7UFu7FUwVTROYw/3XeA0e8nTkulsargAqfoDiHTfvlf4raBOKcW9pE25yNZtNyno+dHr/03FL6gRBhho5//3aAR11nQbz5BV7Abv+aZDyLqv5y+Jyrt3zB63jm1zNOX/gZF1GYMRRVW7hMs8K8fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: SHkWhYr7QU+55hVE1wjuiQ==
X-CSE-MsgGUID: UIQAMEggTUeymUcDH7HBKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="64281282"
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; 
   d="scan'208";a="64281282"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 03:23:14 -0700
X-CSE-ConnectionGUID: DEFVBRhHR5iGwXOhvkJqCQ==
X-CSE-MsgGUID: Md2VmPXSTKq3AvVoZFAxCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; 
   d="scan'208";a="132926817"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 03:23:11 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andy@kernel.org>)
	id 1u7AmQ-0000000EhOw-3F8d;
	Tue, 22 Apr 2025 13:23:06 +0300
Date: Tue, 22 Apr 2025 13:23:06 +0300
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
Subject: Re: [PATCH 17/29] x86/boot/e820: Standardize e820 table index
 variable names under 'idx'
Message-ID: <aAduCoINHUkFwIzR@smile.fi.intel.com>
References: <20250421185210.3372306-1-mingo@kernel.org>
 <20250421185210.3372306-18-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421185210.3372306-18-mingo@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Apr 21, 2025 at 08:51:57PM +0200, Ingo Molnar wrote:

...

> +	int idx;

> +	u32 idx, chg_idx, chg_nr;

What about sanitizing the type as well to be let's say unsigned int idx in all cases?

...

> +			change_point[chg_idx]->addr	= entries[idx].addr;
> +			change_point[chg_idx++]->entry	= &entries[idx];
> +			change_point[chg_idx]->addr	= entries[idx].addr + entries[idx].size;
> +			change_point[chg_idx++]->entry	= &entries[idx];

Does GCC 15 not produce any warnings here? Linus recently complain on some code
with index increment inside the accessor. Perhaps just

			change_point[chg_idx]->entry	= &entries[idx];
			chg_idx++;

?

...

> +			for (idx = 0; idx < overlap_entries; idx++) {
> +				if (overlap_list[idx] == change_point[chg_idx]->entry)
> +					overlap_list[idx] = overlap_list[overlap_entries-1];

overlap_entries - 1 ?

>  			}

...

> +	while (--idx >= 0) {

	while (idx--) {

should work as well, no?

-- 
With Best Regards,
Andy Shevchenko


