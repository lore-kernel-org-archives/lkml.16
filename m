Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C06F28467B
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 08:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744705780; cv=none; b=OCeIYN9o2adK4d3N5nMJNT/cIdx0mibP1cbk7lWo+CiuDkfIyvbI8yOxweXZ2n5vHDX59hwKiuF7lgakvSke4ew4bEuxJr/li+/hYaFlk4jT1VYp+FnsrB5wSiEeIJ0B48Ch3IBp4m6B/nWyr3a/3Sf480sDyYcjJCqciahzhAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744705780; c=relaxed/simple;
	bh=KdjIB358yfPQ3UYxdodcRhuR5+7kpsBZ3kVJ8/0yltE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=purnp3uqMHOGDwyVWhQEeHpAM+oLxE7xQvJXPGwCf0Qldn20g/Vz3AcwKA/BCUTx0/Q4wtnp4W4KGr2K0CSUPHZ/HDLGSDDZdKUzdAn+JOrOHbf/FXbCZNtxf4Rra06z05VchtaBmqOozNwN4zLjhYATOhVGADSHevNMTTX/Ns8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LrRTnva5; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LrRTnva5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744705779; x=1776241779;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KdjIB358yfPQ3UYxdodcRhuR5+7kpsBZ3kVJ8/0yltE=;
  b=LrRTnva5E2ugDWotUA5MbgxZIYNlASYYXM/0A3LrAm7HkAflEtlvUQ8o
   yiRBybre0uNDWy2JEckREf4WDW8klpke1/LvUjFTJ1MrgTrxmo1ifSrXW
   TcCaUlSVt74DnCazx557y6MXerPh+2Sd+iuEPjBH2EwxGq7t5ns3iAdZ9
   V8Vdr2ypGsfOEK9j9yK7Cbg3q9ORTnkH5N1aahFTmVzpx94+0NR/e7pzi
   tsNnrseFbowp7ugxt3dzogEk/PaMC6sCX7xd4QUB9a/IEa/ELCzADNYSa
   WXm252Y2zwBGOaolOnT43cFdwZvtegLBbqR1oaquwrknrci7YL3ieDgQI
   g==;
X-CSE-ConnectionGUID: 85cqcqrNQRaJ2fw0p6q7Jg==
X-CSE-MsgGUID: 6C4NAoFyS/iv2RDBATzHtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="71592445"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="71592445"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 01:28:31 -0700
X-CSE-ConnectionGUID: WUpVH4t1STe2QA3yf0MIIw==
X-CSE-MsgGUID: oh9+A1W3RoyrE+YyspRykA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="134914793"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa003.jf.intel.com with ESMTP; 15 Apr 2025 01:28:28 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 456F617B; Tue, 15 Apr 2025 11:28:27 +0300 (EEST)
Date: Tue, 15 Apr 2025 11:28:27 +0300
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, tglx@linutronix.de, 
	bp@alien8.de, joro@8bytes.org, luto@kernel.org, peterz@infradead.org, 
	rick.p.edgecombe@intel.com, jgross@suse.com
Subject: Re: [PATCH 3/8] x86/mm: Always tell core mm to sync kernel mappings
Message-ID: <bqinzxzoiz5pbtgcufgi6o4zfmvyj3q7i7mjtwp2b4x5cek3ca@v5qn4mv2y6ay>
References: <20250414173232.32444FF6@davehans-spike.ostc.intel.com>
 <20250414173237.EC790E95@davehans-spike.ostc.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414173237.EC790E95@davehans-spike.ostc.intel.com>

On Mon, Apr 14, 2025 at 10:32:37AM -0700, Dave Hansen wrote:
> 
> From: Dave Hansen <dave.hansen@linux.intel.com>
> 
> Each mm_struct has its own copy of the page tables. When core mm code
> makes changes to a copy of the page tables those changes sometimes
> need to be synchronized with other mms' copies of the page tables. But
> when this synchronization actually needs to happen is highly
> architecture and configuration specific.
> 
> In cases where kernel PMDs are shared across processes
> (SHARED_KERNEL_PMD) the core mm does not itself need to do that
> synchronization for kernel PMD changes. The x86 code communicates
> this by clearing the PGTBL_PMD_MODIFIED bit cleared in those
> configs to avoid expensive synchronization.
> 
> The kernel is moving toward never sharing kernel PMDs on 32-bit.
> Prepare for that and make 32-bit PAE always set PGTBL_PMD_MODIFIED,
> even if there is no modification to synchronize. This obviously adds
> some synchronization overhead in cases where the kernel page tables
> are being changed.
> 
> Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
> ---
> 
>  b/arch/x86/include/asm/pgtable-3level_types.h |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff -puN arch/x86/include/asm/pgtable-3level_types.h~always-set-ARCH_PAGE_TABLE_SYNC_MASK arch/x86/include/asm/pgtable-3level_types.h
> --- a/arch/x86/include/asm/pgtable-3level_types.h~always-set-ARCH_PAGE_TABLE_SYNC_MASK	2025-04-09 11:49:40.552916845 -0700
> +++ b/arch/x86/include/asm/pgtable-3level_types.h	2025-04-09 11:49:40.555916955 -0700
> @@ -29,7 +29,7 @@ typedef union {
>  
>  #define SHARED_KERNEL_PMD	(!static_cpu_has(X86_FEATURE_PTI))
>  
> -#define ARCH_PAGE_TABLE_SYNC_MASK	(SHARED_KERNEL_PMD ? 0 : PGTBL_PMD_MODIFIED)
> +#define ARCH_PAGE_TABLE_SYNC_MASK	PGTBL_PMD_MODIFIED

The new definition is the same between pgtable-2level_types.h and
pgtable-3level_types.h.

Move it to the common pgtable_32_types.h.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
