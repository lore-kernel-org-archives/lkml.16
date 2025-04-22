Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DE11E231E
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 10:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745316672; cv=none; b=rIBpu5r0wbfyNB2W6wZtx452KsabKJ/zCIZi6lUH25f+4BmdKWZzEbJKTD0EBoOvD9+sKvpYba8tdOrB5fGHWoOaxvqKBkI2GTO6vsDtQudzAJ1zpyaA/oEDd9hOOqNzA8iAw8dt2yl51E5/ubnPkOkTLfpeLT2nZpjUPTOCECU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745316672; c=relaxed/simple;
	bh=Be9XKhXsNt8ArUOzCYISVtCd83N1sexbQRPCs5bJFts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HCU1c8E5w4MhJNQwfqh4mbqXkmgWENa1jnLD5HvNmXU311FdiJSFdP0DNFvcwXzCUa77frUUPov+ddrSF8Op09PblU+nW4I5ftHLOh9zoyNfFb4qZInQkOqVNpy3rmUvyJkHWU9Xs1csxcEIrBxWXttuBpIuYbYBuT7Sy6JEGA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: EStD+ZeuSWSkbP3vIP1MXQ==
X-CSE-MsgGUID: rtOJGC8zQ92WSpPTzB3N8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="57520537"
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; 
   d="scan'208";a="57520537"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 03:10:51 -0700
X-CSE-ConnectionGUID: OyezLt9IR6+TB7EgkwTVVg==
X-CSE-MsgGUID: vvYtacKFT1y+2Qv1X+oGmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; 
   d="scan'208";a="137125614"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 03:10:47 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andy@kernel.org>)
	id 1u7AaS-0000000EhDz-1jPp;
	Tue, 22 Apr 2025 13:10:44 +0300
Date: Tue, 22 Apr 2025 13:10:44 +0300
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
Subject: Re: [PATCH 14/29] x86/boot/e820: Clean up __e820__range_add() a bit
Message-ID: <aAdrJGBTiC75KPn-@smile.fi.intel.com>
References: <20250421185210.3372306-1-mingo@kernel.org>
 <20250421185210.3372306-15-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421185210.3372306-15-mingo@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Apr 21, 2025 at 08:51:54PM +0200, Ingo Molnar wrote:
>  - Use 'idx' index variable instead of a weird 'x'
>  - Make the error message E820-specific
>  - Group the code a bit better

...

> -	if (x >= ARRAY_SIZE(table->entries)) {
> -		pr_err("too many entries; ignoring [mem %#010llx-%#010llx]\n",
> -		       start, start + size - 1);
> +	if (idx >= ARRAY_SIZE(table->entries)) {
> +		pr_err("too many E820 table entries; ignoring [mem %#010llx-%#010llx]\n",
> +		       start, start + size-1);

size - 1 ?

>  		return;
>  	}

-- 
With Best Regards,
Andy Shevchenko


