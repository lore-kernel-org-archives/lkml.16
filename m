Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2030A1E2606
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 07:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743492308; cv=none; b=cInItgD8BLJhN2ubgRIgXhxXWmq+3XRBJLq8mhlv+8Cv50Q9whC+bvplkM2OC27LflN4l3uDphags239msZSPkpIr0jlm/1ZykUjKedzU43ePsyracyoNIZKov5xHlzsNgXgNnYw5al9Lmst2YyFmOpdGMbd4OuEo2uFixhWvP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743492308; c=relaxed/simple;
	bh=lviFBdN6BXt0GE8RcFoBwRgn67ez6kJJ1ofE+xH7fuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ap8RifC0gyI1fyj4gfT+VIE/+QZgZC608wenn+/CuceNaebakWLefSAEwDr0tdGIr+S1/OvokfgP630P8utQG/Fx7hRjr1l+qxhgmhnvpPedKc8eKiepbH75KpYDVAh2wsou3+DOKkUUmV0+OWB89pi0PJ9tvxZCEKbjO/jbdCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l1gmTBdK; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l1gmTBdK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743492307; x=1775028307;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lviFBdN6BXt0GE8RcFoBwRgn67ez6kJJ1ofE+xH7fuk=;
  b=l1gmTBdKKBqCm8kiVmWJCzXa4XBHvEe92aRlXvagOrX3zaaAStVejB6u
   kNV2vR3WT84DnOawMU5O+p3kdJuQWFk8/eBuJSpXbugoOp0k9HG+lCA7e
   0T3gZ3/y5DCQkNNT54y7YKPlws/xpmb/0Zl3jGCR+BfcLac2TqfbHIomD
   CjUiEU06gGSyt/PnLcC0nA45WCrT8Nouz1BCeTWU82aBOj/JXsvzwnY8X
   +hLqM7ZJdWWrCguBGxOCM5+fq9wTsFr8ukaJQuh5WfHDnOL1sdjFRsCsv
   pc61qsTJiCeK1EX7nf+PBugqG9rbJJO8ELNh+5JdMr4RBAs5pVzv8LnxS
   g==;
X-CSE-ConnectionGUID: Llsev2t1Qyq9PIu/k3vqPA==
X-CSE-MsgGUID: JFRz0WIZT6627NkyVWIwww==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="48670616"
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; 
   d="scan'208";a="48670616"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 00:25:06 -0700
X-CSE-ConnectionGUID: 3Pztk+laTtaenkiK1mG16A==
X-CSE-MsgGUID: EE/yTQiGQoGexTN3UtIhNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; 
   d="scan'208";a="126139787"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa006.fm.intel.com with ESMTP; 01 Apr 2025 00:25:03 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 6C2B8278; Tue, 01 Apr 2025 10:25:02 +0300 (EEST)
Date: Tue, 1 Apr 2025 10:25:02 +0300
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@redhat.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mel Gorman <mgorman@techsingularity.net>, 
	Tom Lendacky <thomas.lendacky@amd.com>, "Kalra, Ashish" <ashish.kalra@amd.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, linux-mm@kvack.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Srikanth Aithal <sraithal@amd.com>
Subject: Re: [PATCH] mm/page_alloc: fix deadlock on cpu_hotplug_lock in
 __accept_page()
Message-ID: <mc7rnftmisbx5fpefwaiobngzpbh66yk5535xrfxope4gobu36@2wite5exlfcd>
References: <20250329171030.3942298-1-kirill.shutemov@linux.intel.com>
 <b44cef03-46ef-4153-b21a-98aa6ff43a08@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b44cef03-46ef-4153-b21a-98aa6ff43a08@intel.com>

On Mon, Mar 31, 2025 at 12:07:07PM -0700, Dave Hansen wrote:
> On 3/29/25 10:10, Kirill A. Shutemov wrote:
> > +		if (system_wq)
> > +			schedule_work(&zone->unaccepted_cleanup);
> > +		else
> > +			unaccepted_cleanup_work(&zone->unaccepted_cleanup);
> > +	}
> >  }
> 
> The 'system_wq' check seems like an awfully big hack. No other
> schedule_work() user does anything similar that I can find across the tree.

I don't see how it is "an awfully big hack". It is "use system_wq if it is
ready".

Maybe it is going to be marginally cleaner if schedule_work() would be
open-coded:

		if (system_wq)
		        queue_work(system_wq, &zone->unaccepted_cleanup);
		else
			unaccepted_cleanup_work(&zone->unaccepted_cleanup);

?

> 
> Instead of hacking in some internal state, could you use 'system_state',
> like:
> 
> 	if (system_state == SYSTEM_BOOTING)
> 		unaccepted_cleanup_work(&zone->unaccepted_cleanup);
> 	else
> 		schedule_work(&zone->unaccepted_cleanup);

Really? The transition points between these states are arbitrary defined.
Who said that if we are out of SYSTEM_BOOTING we can use system_wq?
Tomorrow we can introduce additional state between BOOTING and SCHEDULING
and this code will be silently broken. The same for any new state before
BOOTING.

> The other method would be to make it more opportunistic? Basically,
> detect when it might deadlock:
> 
> bool try_to_dec()
> {
> 	if (!cpus_read_trylock())
> 		return false;
> 
> 	static_branch_dec_cpuslocked(&zones_with_unaccepted_pages);
> 	cpus_read_unlock();
> 
> 	return true;
> }
> 
> That still requires a bit in the zone to say whether the
> static_branch_dec() was deferred or not, though. It's kinda open-coding
> schedule_work().

It will also require special handling for soft CPU online/offline.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
