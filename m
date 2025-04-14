Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBC52DFA3B
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 17:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744652033; cv=none; b=tVW1gUd09mzi/Ou9qYZ7cgbuiO3zG7wA9799fI5kMFQ76qDAUcTVviM7Dq8h189oKCL+/vXhzFt6E4vnSIX/b67X3NjK9coA2ibeXfAb1Pq21zaZKHv7BJi/BnSkK8+DrjvNRcVZcIOF34W9i647QDWNFatuVV59OGDAcs+kl4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744652033; c=relaxed/simple;
	bh=1PCW/YIut26y3RRAnV0jXG6zg80mJVf/mW51VLysGY4=;
	h=Subject:To:Cc:From:Date:Message-Id; b=oJNK+Np3B2873YBmhEF1hstvKhO3ByVYAd6M+vYqJBWap1gDGR6uAmnF4Ux/LV1SRUCtXMkWTqSNd1Tci9iL1q3QJE+BcWeU3F7P2UhTcWXn5E7eg9X9xLFhwENCotqFOCgRPNwhfrhw7+QmC6c4NbMssWMJLNkPiVbvEOR3MjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n5Uc/vKY; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n5Uc/vKY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744652031; x=1776188031;
  h=subject:to:cc:from:date:message-id;
  bh=1PCW/YIut26y3RRAnV0jXG6zg80mJVf/mW51VLysGY4=;
  b=n5Uc/vKYMYhKAtvd0hKPjITBGimG0cPyOEqqFn8SRU2/D1fEH80DmwSn
   iNWc15XjbU9ZilHGI/5sRcB8DdB4Op0ik5BaHVHGSnCYEwEXJC0CagMFL
   CAm/MiJp/XPfYFiuaBQctC6WyjRa5qtrYyreYM+I3caHqWZSHDBaE92c7
   6Xqpn077/2/KdCye4CUo7wtz2MGzUDR/dhe0NrZ4SXrzYhdfWw/5RvhPv
   rw2/kpxzVwayDOe8OH7yS57ykIn6IfzJethAO7DyaAxvQmo4j4pS+4oVT
   EL+oVAxTZ9C/cSoIns4lRu1vXieB4V7nWPiCXZCUXTpEIRPD0JwmS5b6F
   A==;
X-CSE-ConnectionGUID: fXPMphMGTbuclE6nmHOs9A==
X-CSE-MsgGUID: zGlXv9UESaSFFr7pmL+B8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="45270139"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="45270139"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 10:33:50 -0700
X-CSE-ConnectionGUID: WTWm91YtTKe7befnw16aJQ==
X-CSE-MsgGUID: Y5arRZ6cSraqBW9COqQJWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="129878781"
Received: from davehans-spike.ostc.intel.com (HELO localhost.localdomain) ([10.165.164.11])
  by fmviesa007.fm.intel.com with ESMTP; 14 Apr 2025 10:32:33 -0700
Subject: [PATCH 0/8] x86/mm: Simplify PAE page table handling
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org,tglx@linutronix.de,bp@alien8.de,joro@8bytes.org,luto@kernel.org,peterz@infradead.org,kirill.shutemov@linux.intel.com,rick.p.edgecombe@intel.com,jgross@suse.com,Dave Hansen <dave.hansen@linux.intel.com>
From: Dave Hansen <dave.hansen@linux.intel.com>
Date: Mon, 14 Apr 2025 10:32:32 -0700
Message-Id: <20250414173232.32444FF6@davehans-spike.ostc.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Changes from RFC:

 * Rebase on top of current tip/master. Needed to pull in some
   fixes for 32-bit PAE issues.

I'm planning on applying this pretty soon unless someone finds
some issues with it.

--

tl;dr: 32-bit PAE page table handing is a bit different when PTI
is on and off. Making the handling uniform removes a good amount
of code at the cost of not sharing kernel PMDs. The downside of
this simplification is bloating non-PTI PAE kernels by ~2 pages
per process.

Anyone who cares about security on 32-bit is running with PTI and
PAE because PAE has the No-eXecute page table bit. They are already
paying the 2-page penalty. Anyone who cares more about memory
footprint than security is probably already running a !PAE kernel
and will not be affected by this.

--

There are two 32-bit x86 hardware page table formats. A 2-level one
with 32-bit pte_t's and a 3-level one with 64-bit pte_t's called PAE.
But the PAE one is wonky. It effectively loses a bit of addressing
radix per level since its PTEs are twice as large. It makes up for
that by adding the third level, but with only 4 entries in the level.

This leads to all kinds of fun because this level only needs 32 bytes
instead of a whole page. Also, since it has only 4 entries in the top
level, the hardware just always caches the entire thing aggressively.
Modifying a PAE pgd_t ends up needing different rules than the other
other x86 paging modes and probably every other architecture too.

PAE support got even weirder when Xen came along. Xen wants to trap
into the hypervisor on page table writes and so it protects the guest
page tables with paging protections. It can't protect a 32 byte
object with paging protections so it bloats the 32-byte object out
to a page. Xen also didn't support sharing kernel PMD pages.  This
is mostly moot now because the Xen support running as a 32-bit guest
was ripped out, but there are still remnants around.

PAE also interacts with PTI in fun and exciting ways. Since pgd
updates are so fraught, the PTI PAE implementation just chose to
avoid pgd updates by preallocating all the PMDs up front since
there are only 4 instead of 512 or 1024 in the other x86 paging
modes.

Make PAE less weird:
 * Always allocate a page for PAE PGDs. This brings them in line
   with the other 2 paging modes. It was done for Xen and for
   PTI already and nobody screamed, so just do it everywhere.
 * Never share kernel PMD pages. This brings PAE in line with
   32-bit !PAE and 64-bit.
 * Always preallocate all PAE PMD pages. This basically makes
   all PAE kernels behave like PTI ones. It might waste a page
   of memory, but all 4 pages probably get allocated in the common
   case anyway.

--

 include/asm/pgtable-2level_types.h |    2 
 include/asm/pgtable-3level_types.h |    4 -
 include/asm/pgtable_64_types.h     |    2 
 mm/pat/set_memory.c                |    4 -
 mm/pgtable.c                       |  103 +++++-----------------------------
 5 files changed, 19 insertions(+), 96 deletions(-)

