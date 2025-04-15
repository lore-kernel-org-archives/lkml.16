Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6D227A129
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 08:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744705560; cv=none; b=gt60vWlzUQre0PY0oH+6kfagaWHWUZvTwJEiLYtPIIg0zr2utdq4JUkp4e3ll65ILRPeOrg1m2b1lH1ARaiXQSYA262YZR+Fucs4gFFdUUr9miAU29Uchu3L3F0eeV5ZIM1kTKZcpxn49qgUFQQOsmYgTrWi2TD4BK4biRu/SOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744705560; c=relaxed/simple;
	bh=2iwB1xYFAswKM9vE33s6Qx0dRvqpz2FuzJj95foudds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O7wIA8lcJ9Zu9l+cOihsiPutdJumxT4vJXNlbes14yGD7Z1QSk/gkSIuM/lwAH6ugqE9+bK8OIEeOZssvQEUF0AhO/vUH4OL+obacafK4fHvxxWo7XcQMhTFhfYgYO2/Iq63WxbjPpHwzKWFzeSiOlCM7kknjQhkEAxpOJw3H6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kRAStJNy; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kRAStJNy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744705558; x=1776241558;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2iwB1xYFAswKM9vE33s6Qx0dRvqpz2FuzJj95foudds=;
  b=kRAStJNynYmMKFdueyuWLDYanK6HJ6ZzxplPzhLseBZkiv4l1kPlgdTl
   HzK9rKVBwklPRJILJcbk4XyltPmLO5FfFDbLbPjbEQmD3zBdQhV2iohiV
   ruQRymVEkDoMGXFnM2zZJ/1HhkiLeSClf8P+A1zCjPsyrSzs+BTOx8wpN
   vA9DG7vhtcQ6bILJYqkjPbphfXRJNDntmUul37bYTWwVYz081sNXiFkxe
   fXcNUO8IFpHJ5QJnblMqRGOV5WM0JT5K/UmtgXe7AQoOdEKDmmnmfIJ72
   6C1AT+rOLbSinyYx3nWCzlPMWwcAtUJH6QlL/s8SMqtzNC8ofe4S02fgN
   A==;
X-CSE-ConnectionGUID: u9qRKfkqSdC1fyq/RYlyaw==
X-CSE-MsgGUID: +7vihqfxTJ6VcTzBAUmZnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="63742974"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="63742974"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 01:25:58 -0700
X-CSE-ConnectionGUID: IWyjtJlwS1Wya4ER9e4pCg==
X-CSE-MsgGUID: frPjB3gFRgSAWfDBCETEfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="135121294"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP; 15 Apr 2025 01:25:55 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 68DD817B; Tue, 15 Apr 2025 11:25:54 +0300 (EEST)
Date: Tue, 15 Apr 2025 11:25:54 +0300
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, tglx@linutronix.de, 
	bp@alien8.de, joro@8bytes.org, luto@kernel.org, peterz@infradead.org, 
	rick.p.edgecombe@intel.com, jgross@suse.com
Subject: Re: [PATCH 2/8] x86/mm: Always "broadcast" PMD setting operations
Message-ID: <abvsbz4yqc6xe5izuqw25hwj6y7zjhok4tdpp3kqshkuaomhn5@qnykmira2mik>
References: <20250414173232.32444FF6@davehans-spike.ostc.intel.com>
 <20250414173235.F63F50D1@davehans-spike.ostc.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414173235.F63F50D1@davehans-spike.ostc.intel.com>

On Mon, Apr 14, 2025 at 10:32:35AM -0700, Dave Hansen wrote:
> 
> From: Dave Hansen <dave.hansen@linux.intel.com>
> 
> Kernel PMDs can either be shared across processes or private to a
> process.  On 64-bit, they are always shared.  32-bit non-PAE hardware
> does not have PMDs, but the kernel logically squishes them into the
> PGD and treats them as private. Here are the four cases:
> 
> 	64-bit:                Shared
> 	32-bit: non-PAE:       Private
> 	32-bit:     PAE+  PTI: Private
> 	32-bit:     PAE+noPTI: Shared
> 
> Note that 32-bit is all "Private" except for PAE+noPTI being an
> oddball.  The 32-bit+PAE+noPTI case will be made like the rest of
> 32-bit shortly.
> 
> But until that can be done, temporarily treat the 32-bit+PAE+noPTI
> case as Private. This will do unnecessary walks across pgd_list and
> unnecessary PTE setting but should be otherwise harmless.
> 
> Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
> ---
> 
>  b/arch/x86/mm/pat/set_memory.c |    4 ++--
>  b/arch/x86/mm/pgtable.c        |   11 +++--------
>  2 files changed, 5 insertions(+), 10 deletions(-)
> 
> diff -puN arch/x86/mm/pat/set_memory.c~always-sync-kernel-mapping-updates arch/x86/mm/pat/set_memory.c
> --- a/arch/x86/mm/pat/set_memory.c~always-sync-kernel-mapping-updates	2025-04-09 12:00:17.126319212 -0700
> +++ b/arch/x86/mm/pat/set_memory.c	2025-04-09 12:53:28.082212490 -0700
> @@ -889,7 +889,7 @@ static void __set_pmd_pte(pte_t *kpte, u
>  	/* change init_mm */
>  	set_pte_atomic(kpte, pte);
>  #ifdef CONFIG_X86_32
> -	if (!SHARED_KERNEL_PMD) {
> +	{
>  		struct page *page;
>  
>  		list_for_each_entry(page, &pgd_list, lru) {

Removing the condition, but leaving the block looks sloppy.

Maybe convert #ifdef to IS_ENABLED() while you are there, so it would
justify the block?

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
