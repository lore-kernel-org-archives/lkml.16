Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D86158535
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 11:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749124446; cv=none; b=hALPc6OlwE9FXSh6d5fgB9CWsAbeDfXLpsJ7jLDs9soNemE5VYnsImUvquYFU74cRITYhvCKloyqVV7NDvzWcbN+RgsVmmDl5kG+bwjuK6hg3+B4mIkn2xn/gjP5tOwZjwW0vCuVynuTI3tEI8oiJpDkx4hcgqy5wdHk1HU4dco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749124446; c=relaxed/simple;
	bh=EYKhhN5+DbG+XDi2bwEn1W6G5NA1x/Wu782IrUgh8lg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pEG8Pid8y1M2CksmN/hi7O77nIbtDHWcuARWAW5pyerO6u7VBPd6A5RFt/gs40RYEQ4cmvboPJRNAmYBDUurWAT/FsYmL65mnzNEMRnOEVE641BN6m8FYxFX8GpbBYdyspDQOGeHNHjoj9/NBaleNSbThOofOpilsGwHpv0gZv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fbSnba07; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fbSnba07"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749124444; x=1780660444;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EYKhhN5+DbG+XDi2bwEn1W6G5NA1x/Wu782IrUgh8lg=;
  b=fbSnba07CisFRmDSIJxAfdVZ4wWWynp5K3/gqr6CcL1F/d+o6pqeBI4C
   viEy5eCTfqh4Xgar+FTp4S1NnhjuhbTfA9alIw0T59NhOhmQ8Zb40swML
   ACid7LtwglCUv8ygAe7LhSLFmQbBNmNT5broAblVc+ae4XNl14nOpP/XO
   VqrZm8ouKakpKpe5XhDjFb/fAYuHdHPZn9kPkfzQJxMJ38z2Vd4aUB7Ab
   s6+pmoX0nv7QsHxNQVKun1ruF9jp6HCfktsM0kH+GGZgOjeEYYoM8YmbL
   U0Lvq6QIOr/sXwahRCml/pURDziB2nlPIiFMKHjkoypkWQj644XUZ9pQZ
   Q==;
X-CSE-ConnectionGUID: DeHhLSm7RsGDm41TJ/jIYg==
X-CSE-MsgGUID: W90wzjKcRFCrDEomaOPVsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="51110005"
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; 
   d="scan'208";a="51110005"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 04:54:04 -0700
X-CSE-ConnectionGUID: aSgzIK4bQHyJ8u06am4XBw==
X-CSE-MsgGUID: E5HXAx2/T2qZ79fs7/Lg9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; 
   d="scan'208";a="145379925"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa006.jf.intel.com with ESMTP; 05 Jun 2025 04:54:01 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 360FF19D; Thu, 05 Jun 2025 14:53:59 +0300 (EEST)
Date: Thu, 5 Jun 2025 14:53:59 +0300
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, hannes@cmpxchg.org, 
	shakeel.butt@linux.dev, muchun.song@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, 
	Konstantin Khlebnikov <koct9i@gmail.com>
Subject: Re: [PATCH] mm/vmstat: Fix build with MEMCG=y and VM_EVENT_COUNTERS=n
Message-ID: <7lakc6hxbimvkgakpocj3aa65sdhmskm5p6hlurbwzyps33gfb@2z2eoz253hs4>
References: <20250604095111.533783-1-kirill.shutemov@linux.intel.com>
 <6fffd2fe-0cee-405f-af78-b57b5e5d02e8@suse.cz>
 <20250604142043.bdfdf4f9a6a6cbb57946f1a5@linux-foundation.org>
 <03c2b01b-18f5-4015-a19b-79b8af656697@suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <03c2b01b-18f5-4015-a19b-79b8af656697@suse.cz>

On Thu, Jun 05, 2025 at 08:19:28AM +0200, Vlastimil Babka wrote:
> On 6/4/25 23:20, Andrew Morton wrote:
> > On Wed, 4 Jun 2025 11:56:42 +0200 Vlastimil Babka <vbabka@suse.cz> wrote:
> > 
> >> > There is no need to backport this fix to stable trees. Without the
> >> > strict BUILD_BUG_ON(), the issue is not harmful. The elements in
> >> > question would only be read by the memcg code, not by /proc/vmstat.
> >> > 
> >> > Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> >> > Reported-by: Randy Dunlap <rdunlap@infradead.org>
> >> > Fixes: ebc5d83d0443 ("mm/memcontrol: use vmstat names for printing statistics")
> >> 
> >> Well in that case I think we should put Fixes: to the BUILD_BUG_ON() change.
> >> And if it's not yet a stable sha1, squash that together with this?
> >> It doesn't seem ebc5d83d0443 alone needs this fix.
> > 
> > I shuffled things around.
> > 
> > I moved "mm: strictly check vmstat_text array size" from mm-hotfixes
> > and back into mm-new for the next cycle.
> > 
> > I reworked "mm/vmstat: fix build with MEMCG=y and VM_EVENT_COUNTERS=n"
> > so it precedes "mm: strictly check vmstat_text array size".
> > 
> > I reworked "mm/vmstat: utilize designated initializers for the
> > vmstat_text array" so it comes last.
> > 
> > 
> > So the applying order is now
> 
> I checked and in general it looks good, except a nit below.
> 
> > mm-hotfixes:
> > mm-fix-vmstat-after-removing-nr_bounce.patch
> > 
> > mm-new:
> > mm-vmstat-fix-build-with-memcg=y-and-vm_event_counters=n.patch
> > mm-strictly-check-vmstat_text-array-size.patch
> 
> The changelogs of these two don't reflect the new ordering though, maybe
> Kirill can provide updated ones?

Maybe something like this, for the first patch?


mm/vmstat: Make MEMCG select VM_EVENT_COUNTERS

The vmstat_text array contains labels for counters displayed in /proc/vmstat.
It is important to keep the labels in sync with the counters.

There is a BUILD_BUG_ON() check in vmstat_start() that ensures the size of the
vmstat_text is not smaller than VM_EVENT_COUNTERS. This helps to catch cases
where a new counter is added but the label is not. However, it does not help if
a counter is removed but the label remains.

It would be nice to make the BUILD_BUG_ON() check more strict to catch such
cases. However, when compiling with MEMCG enabled but VM_EVENT_COUNTERS
disabled, the vmstat_text array is larger than NR_VMSTAT_ITEMS.

This issue arises because some elements of the vmstat_text array are present
when either MEMCG or VM_EVENT_COUNTERS is enabled, but NR_VMSTAT_ITEMS only
accounts for these elements if VM_EVENT_COUNTERS is enabled.

Instead of adjusting the NR_VMSTAT_ITEMS definition to account for MEMCG, make
MEMCG select VM_EVENT_COUNTERS. VM_EVENT_COUNTERS is enabled in most
configurations anyway.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
