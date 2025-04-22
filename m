Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35134293B70
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 16:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745340122; cv=none; b=eyoFZLU25T6T/57mmpKys9xkIqFOR4Ptu8ziafFj2W+Vjxy3w3aTpDkq051J9CBSEMpOmRD6W8SXV505MFzZE0H7hMoejyllCMe3EHvXtzzbZGKnMprP+CKc8w4EJIR6BAfrV4nEjyQYAnVrcN/yQnwx8he/RC1/SGYffM9taGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745340122; c=relaxed/simple;
	bh=e39cG3iCozvRfooGUgvY+i9PZWy2Mcw16xJrdjz4B6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MzP77M5n+x2VkWOI5LQ/09UKr8H5iq6XhIY/3u1NMVy6gjSzdGjJlXoNg8FGHEM/XfCr5Z167yIngsFYeuZZEBoTOi9juW1CiFxsxGNIKpy6hAsDzRdEKFJ4DqJanAm9udUn16jItjWIv/V7NCDV441L9dN6Rfd61x1wtjAjzhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: lfG6Pzo7R3CVXuYMJnaadQ==
X-CSE-MsgGUID: FeESvbp4TdS0yHiH0AQFcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="50738569"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; 
   d="scan'208";a="50738569"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 09:42:00 -0700
X-CSE-ConnectionGUID: +vpR6mhLStOiHLhN+vPLTw==
X-CSE-MsgGUID: ee9XAGb/RfKzzan751w3aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; 
   d="scan'208";a="133014895"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 09:41:57 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andy@kernel.org>)
	id 1u7Gh0-0000000EmVr-0ZPU;
	Tue, 22 Apr 2025 19:41:54 +0300
Date: Tue, 22 Apr 2025 19:41:53 +0300
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
Subject: Re: [PATCH 27/29] x86/boot/e820: Simplify the e820__range_remove()
 API
Message-ID: <aAfG0fSVFVNciAqi@smile.fi.intel.com>
References: <20250421185210.3372306-1-mingo@kernel.org>
 <20250421185210.3372306-28-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421185210.3372306-28-mingo@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Apr 21, 2025 at 08:52:07PM +0200, Ingo Molnar wrote:
> Right now e820__range_remove() has two parameters to control the
> E820 type of the range removed:
> 
> 	extern void e820__range_remove(u64 start, u64 size, enum e820_type old_type, bool check_type);
> 
> Since E820 types start at 1, zero has a natural meaning of 'no type.
> 
> Consolidate the (old_type,check_type) parameters into a single (filter_type)
> parameter:
> 
> 	extern void e820__range_remove(u64 start, u64 size, enum e820_type filter_type);
> 
> Note that both e820__mapped_raw_any() and e820__mapped_any()
> already have such semantics for their 'type' parameter, although
> it's currently not used with '0' by in-kernel code.
> 
> Also, the __e820__mapped_all() internal helper already has such
> semantics implemented as well, and the e820__get_entry_type() API
> uses the '0' type to such effect.
> 
> This simplifies not just e820__range_remove(), and synchronizes its
> use of type filters with other E820 API functions, but simplifies
> usage sites as well, such as parse_memmap_one(), beyond the reduction
> of the number of parameters:
> 
>   -               else if (from)
>   -                       e820__range_remove(start_at, mem_size, from, 1);
>                   else
>   -                       e820__range_remove(start_at, mem_size, 0, 0);
>   +                       e820__range_remove(start_at, mem_size, from);
> 
> The generated code gets smaller as well:
> 
> 	add/remove: 0/0 grow/shrink: 0/5 up/down: 0/-66 (-66)
> 
> 	Function                                     old     new   delta
> 	parse_memopt                                 112     107      -5
> 	efi_init                                    1048    1039      -9
> 	setup_arch                                  2719    2709     -10
> 	e820__range_remove                           283     273     -10
> 	parse_memmap_opt                             559     527     -32
> 
> 	Total: Before=22,675,600, After=22,675,534, chg -0.00%

>  extern void e820__range_add   (u64 start, u64 size, enum e820_type type);
>  extern u64  e820__range_update(u64 start, u64 size, enum e820_type old_type, enum e820_type new_type);
> -extern void e820__range_remove(u64 start, u64 size, enum e820_type old_type, bool check_type);
> +extern void e820__range_remove(u64 start, u64 size, enum e820_type filter_type);
>  extern u64  e820__range_update_table(struct e820_table *t, u64 start, u64 size, enum e820_type old_type, enum e820_type new_type);
>  
>  extern int  e820__update_table(struct e820_table *table);

Wondering if are going to get rid of 'extern' for the functions...

-- 
With Best Regards,
Andy Shevchenko


