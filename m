Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4A21F5834
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 11:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746616432; cv=none; b=sMe7fV7avhQJwDeOx35h862cj/fd2j0mg5GXG9vuae1k4EGya58lOecEPQeWtJXs7P3MUYcOcdVc+O3pDnHl30gGOzVz0Wz8DMHt6G5qmV5IQ6SQ1IUi5OBlVeaybhOBPetq6PgDL/7p6llcf5DSDR1rmAFgCk5yK+d00GzSdMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746616432; c=relaxed/simple;
	bh=mAhoWh9DxEqhUnSdwA7h9a1g8P8EZV5LJP6A+LYFtdg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OF4XaBQNBPQ2iBGQ9EOkAa/jTtd1oc2PEJ4F/z0n0nP1mrngfcJV9CYjuH3YQ8fSEZnCzqg6sbvm0ejQfdRQQZZYCALQikteqAkwC9LnGgetkJEfdVK55dpzGPCbNSkbNwp0yWmppWPhEJWh+r76wVdeIR6ZKcdX80cRdqwPDVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A7tlvnLE; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A7tlvnLE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746616431; x=1778152431;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=mAhoWh9DxEqhUnSdwA7h9a1g8P8EZV5LJP6A+LYFtdg=;
  b=A7tlvnLEpM75l8LiIeLea1cEs1vworfiLa6xeVfwO6X3enNvK2eQY40V
   3B2m8JEUghHifx66aRJ3xIKANYbtR+BWpmCNGyaZ+w54gwhV1L1VHNLgh
   UveOTl2dDBScpVAMCOc9yBWjwXZSe93igNK3UGTfcq2o3Zjtzu2We//WG
   cMoq+I+eEbX3IXiM+UIX2+3FyHrtD9qElDOp56rIrSb6D4yP1m76dvzc4
   RWMT+Melw6HgAsNwzT4d6e5yjphk9pMHmfWrqpxpsoi5OA5h0y4bhP5cc
   yq0JP1Ncz4LWLs2u9IHhBYUaoJASM7a7+ipvx8cIZyhrPd94ERizj8DkH
   A==;
X-CSE-ConnectionGUID: ObXNDoj1QV+ejow1FMM6bQ==
X-CSE-MsgGUID: zI4EL/JHRO+MOKk7PsbUUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="59327272"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="59327272"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 04:13:50 -0700
X-CSE-ConnectionGUID: EIKxZXoYRF+PJn0ZmBS7Ow==
X-CSE-MsgGUID: C8/6LO3CQlaRAsVn9KMlMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="135636497"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa009.jf.intel.com with ESMTP; 07 May 2025 04:13:47 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 7D64719D; Wed, 07 May 2025 14:13:45 +0300 (EEST)
Date: Wed, 7 May 2025 14:13:45 +0300
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Brendan Jackman <jackmanb@google.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Borislav Petkov <bp@alien8.de>, 
	Thomas Gleixner <tglx@linutronix.de>, David Hildenbrand <david@redhat.com>, 
	Alexei Starovoitov <ast@kernel.org>, linux-mm <linux-mm@kvack.org>, linux-coco@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] mm/page_alloc: Ensure try_alloc_pages() plays well
 with unaccepted memory
Message-ID: <ruyfdyo7hfb3bdlcfhi4quphrupdyy225flao2xre5vlz5rnbz@ixr26npbzydd>
References: <20250506112509.905147-1-kirill.shutemov@linux.intel.com>
 <20250506112509.905147-2-kirill.shutemov@linux.intel.com>
 <CAADnVQJMNqeEGwcLDFw36KCY+wr_jQNtK2t4G5pLo=+wcDE0RQ@mail.gmail.com>
 <5loiv7lfplpruujplz7wmzj25g34rs2aezvrfsl55dsddrh7mo@rnqrlx5zccol>
 <CAADnVQ+jf+Z+7prRaK3LopmZLtKh6JGzvi2+WZcvLo1DGcLShQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAADnVQ+jf+Z+7prRaK3LopmZLtKh6JGzvi2+WZcvLo1DGcLShQ@mail.gmail.com>

On Tue, May 06, 2025 at 03:05:31PM -0700, Alexei Starovoitov wrote:
> On Tue, May 6, 2025 at 12:00 PM Kirill A. Shutemov
> <kirill.shutemov@linux.intel.com> wrote:
> >
> > On Tue, May 06, 2025 at 10:18:21AM -0700, Alexei Starovoitov wrote:
> > > On Tue, May 6, 2025 at 4:25 AM Kirill A. Shutemov
> > > <kirill.shutemov@linux.intel.com> wrote:
> > > >
> > > > try_alloc_pages() will not attempt to allocate memory if the system has
> > > > *any* unaccepted memory. Memory is accepted as needed and can remain in
> > > > the system indefinitely, causing the interface to always fail.
> > > >
> > > > Rather than immediately giving up, attempt to use already accepted
> > > > memory on free lists.
> > > >
> > > > Pass 'alloc_flags' to cond_accept_memory() and do not accept new memory
> > > > for ALLOC_TRYLOCK requests.
> > > >
> > > > Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> > > > Fixes: 97769a53f117 ("mm, bpf: Introduce try_alloc_pages() for opportunistic page allocation")
> > >
> > > Thanks for working on this, but the fixes tag is overkill.
> > > This limitation is not causing any issues in our setups.
> >
> > Have you had chance to test it on any platform with unaccepted memory?
> > So far it is only Intel TDX and AMD SEV guests.
> 
> We don't use them, and my understanding is that such
> unaccepted memory will be there only during boot time.

That's false. Unaccepted memory can be there indefinitely after boot. It
only gets accepted on demand.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
