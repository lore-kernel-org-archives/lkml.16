Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507071D07BA
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 09:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751361113; cv=none; b=E2plWOmIcfnUrxHtGdqmnsa5XbCCX0/fI/nWV8jZrysRD4nV3+NmOIcSM4txM/KiBy510cq4JbrIlQz+gHiIQvmHXkTZQUOFclxYBtlSGnwYmrCW+bF/gC8ZMJMIPcdSEypQpvFIsNIZwF5xD6xKktdwgvDdXuGF9Dv/GrBaOyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751361113; c=relaxed/simple;
	bh=ql5tyJqNB6nfkdC7XaszFpWVQHpSsM1UUL3yjnkQif4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LOlRi8Z3Ke5BIZuRshrMCCFk29aDBLaIEUm9i1gl/3JgtKU80u+t+PkkkIECmh5OHjnEvApUJFo/3A0va075oxK3dCow6YU+8pcdYE6rtJSAqBY9og9KE9mvRe3fXPc8nqJ54rPqcr14kmFigFHLKiOnCN2gQPRPTvAxNPLdVao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jWnipLBO; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jWnipLBO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751361112; x=1782897112;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ql5tyJqNB6nfkdC7XaszFpWVQHpSsM1UUL3yjnkQif4=;
  b=jWnipLBObx9huNLDy0KT5FPgSERedyc+WmFwgkfsvA3syNj6fa27UmT+
   ykdw3Gs1l6UY72UTUbC7CP0HZSGc5n6WUGXW30ZlwcQ/3NSxhnZFIY1D9
   Z63OPmu7tiTefQUD30sy9+E3jEAHztKZ8jqbHlR3puYcuEUa1aFw0DpRY
   bkji7Yiyf9GPNsPuG7L6UeuTQeqGuFu04U9bDc7i7Ppyqyxd5Nost1n5b
   AdDS+FZYcYSjbk3qE6/ep1YawWvwJA8u9puTayh61NuY+nAq5tLK9eYjT
   pq5cVKYqBw7Tpc8EWxDkorc9QQwQPHdUtyaYgcibd/hSs91LPgIDiehQe
   A==;
X-CSE-ConnectionGUID: L5k+tvvDRCWAkNnIqCRRSw==
X-CSE-MsgGUID: sJJnX9YHTp+vwvM0Ygb8vQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="64670881"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="64670881"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 02:11:49 -0700
X-CSE-ConnectionGUID: U4ronh2YTXu2QS7XOxfy+Q==
X-CSE-MsgGUID: KOcH3pjeSXekrzqqtcKi7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="157992814"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa005.fm.intel.com with ESMTP; 01 Jul 2025 02:11:47 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 35DB515D; Tue, 01 Jul 2025 12:11:45 +0300 (EEST)
Date: Tue, 1 Jul 2025 12:11:45 +0300
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Kai Huang <kai.huang@intel.com>
Cc: dave.hansen@intel.com, peterz@infradead.org, tglx@linutronix.de, 
	bp@alien8.de, mingo@redhat.com, hpa@zytor.com, rick.p.edgecombe@intel.com, 
	pbonzini@redhat.com, seanjc@google.com, x86@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] x86/virt/tdx: Further fix tdh_vp_enter() calls
 instrumentable code warning
Message-ID: <gtaaadq6asaxiop2f6cph2dffarruw2lq5yolltiy5snqwc5fr@pofskdkfamqh>
References: <20250630232742.8991-1-kai.huang@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630232742.8991-1-kai.huang@intel.com>

On Tue, Jul 01, 2025 at 11:27:42AM +1200, Kai Huang wrote:
> tdh_vp_enter() needs to be marked noinstr, which means it can't call any
> non-inlined noinstr functions.  Commit e9f17038d814 ("x86/tdx: mark
> tdh_vp_enter() as __flatten") tried to address a build warning caused by
> tdx_tdvpr_pa() not getting inlined.  Unfortunately that commit didn't
> fix the warning completely due to the inconsistent behavior of the
> __flatten annotation.
> 
> There are two problems that can come up depending on the compiler and
> config.  One is that tdx_tdvpr_pa() doesn't get inlined, the other is
> that page_to_phys() doesn't get inlined.
> 
> The __flatten annotation makes the compiler inline all function calls
> that the annotated function makes, and the aforementioned commit assumed
> this is always honored, recursively.  But it turns out it's not always
> true:
> 
>  - Gcc may ignore __flatten when CONFIG_CC_OPTIMIZE_FOR_SIZE=y.
>  - Clang doesn't support recursive inlining for __flatten, which can
>    trigger another similar warning when page_to_phys() calls pfn_valid()
>    when CONFIG_DEBUG_VIRTUAL=y.
> 
> Therefore using __flatten is not the right fix.
> 
> To fix the first problem, remove the __flatten for tdh_vp_enter() and
> instead annotate tdx_tdvpr_pa() with __always_inline to make sure it is
> always inlined.
> 
> To fix the second problem, change tdx_tdvpr_pa() to use
> PFN_PHYS(page_to_pfn()) instead of page_to_phys() so that there will be
> no more function call inside tdx_tdvpr_pa()[*].
> 
> The TDVPR page is always an actual page out of page allocator, so the
> additional warning around pfn_valid() check in page_to_phys() doesn't
> help a lot anyway.  It's not worth complicating the code for such
> warning when CONFIG_DEBUG_VIRTUAL=y.
> 
> [*] Since commit cba5d9b3e99d ("x86/mm/64: Make SPARSEMEM_VMEMMAP the
>     only memory model") page_to_pfn() has been a simple macro without
>     any function call.
> 
> Fixes: e9f17038d814 ("x86/tdx: mark tdh_vp_enter() as __flatten")
> Signed-off-by: Kai Huang <kai.huang@intel.com>
> Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>

Reviewed-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
