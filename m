Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A8B218ADE
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 09:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747387032; cv=none; b=Sodm8ScDitVSos1RxDMa3oXYO94uPQrPXaJ8fWhoYY0wDOps/mo7aWjGHgINZVuJRKxMj5o6DbAM3CdX5rmrBa/xami7+T7m39g0uPFJmMdaavJZL8nKpGRa4LFJTNOvJymMg3MPo623zu9BJiXs/8rZJsc+SeZ/RixtmZKz+3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747387032; c=relaxed/simple;
	bh=pimeC/qsqgIfobUJN8Bs2+IJtIqeP3hE2aG6NHmBa9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XQL6M6Zxr7dtu9SUq+xSOr/dz9IrTYsMUJ3BNZC1Ko4+ocTQKbLLR1kKJwdT/EH/fANixtUMpSTLDIm2F9UZat45LVBGT5rjOaDey33J6HEqsK7MlIGHz0vvxZH3hAmdNmGCy2xRm7Py/1u2ix7F9GO/vdl5JbZ+DObYIQAX814=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GZogxHPl; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GZogxHPl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747387031; x=1778923031;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pimeC/qsqgIfobUJN8Bs2+IJtIqeP3hE2aG6NHmBa9I=;
  b=GZogxHPl/iEUk1EkE9dJ8Uo0greY21nupZY/jyr6XeqAqQ5kPGLUJ4mg
   l5oUZb/msZKRBjpFUJiMKEaEWjm0aZnemi5G1yldQ1T9Ua/nEKS6N5MwT
   43m9I1E5gZrELSojx+uEoApSh2WgshbIqK3NrL7hjV7V/WOElDZikAwsV
   pd/eCcxED0aTwu+fm9iSJGympDkYxHqkEQ/SOjDtS3EQCKEWFyGVoj9iT
   +PxmiOMZbmS8JpTGMip0Tis8ptX9+DHPkz61Qdc8iFKGczY0kRetzM058
   EfYD33mVAkRJSWsTdRO+Ss/WwMwTAKgxw8qFfNeW4BNVjCV6aSSlfdC4f
   Q==;
X-CSE-ConnectionGUID: IcVeP0MTRduBxwQRfc5uhQ==
X-CSE-MsgGUID: bgaRz4JGSY2XgtsmHkhXwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="66756378"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="66756378"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 02:17:10 -0700
X-CSE-ConnectionGUID: +7ckBq6NR5uBMCWiGD8KUg==
X-CSE-MsgGUID: m4j//WphSFSOl7JE6Y8CIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="138492992"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa010.jf.intel.com with ESMTP; 16 May 2025 02:17:07 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id F15D438D; Fri, 16 May 2025 12:17:05 +0300 (EEST)
Date: Fri, 16 May 2025 12:17:05 +0300
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Shivank Garg <shivankg@amd.com>, Ard Biesheuvel <ardb+git@google.com>, 
	linux-kernel@vger.kernel.org, x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Ingo Molnar <mingo@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Brian Gerst <brgerst@gmail.com>, "Rao, Bharata Bhasker" <bharata@amd.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v3 1/7] x86/cpu: Use a new feature flag for 5 level paging
Message-ID: <xoigewp763crp6r5nxbrvlwjjcnhivbkfmyx4vc3kcjq63pzgr@znwfmvny6mha>
References: <20250514104242.1275040-9-ardb+git@google.com>
 <20250514104242.1275040-10-ardb+git@google.com>
 <20250515131120.GCaCXn-E8zQutUqKLn@fat_crate.local>
 <7c315a0d-1508-4310-b584-ecaeaba52296@amd.com>
 <20250515191131.GNaCY8Y7PI44akybDM@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515191131.GNaCY8Y7PI44akybDM@fat_crate.local>

On Thu, May 15, 2025 at 09:11:31PM +0200, Borislav Petkov wrote:
> On Thu, May 15, 2025 at 11:50:17PM +0530, Shivank Garg wrote:
> > I've re-tested the performance concerns we discussed earlier regarding 5-level paging.
> > Recent tests on a current kernel don't show any performance issues:
> > 
> > AMD EPYC Zen 5 (SMT enabled).
> > Linux HEAD 6.15.0-rc6+ 088d13246a46
> > 
> > lmbench/lat_pagefault:
> > numactl --membind=1 --cpunodebind=1 bin/x86_64-linux-gnu/lat_pagefault -N 100 1GB_randomfile
> > 
> > Output values (50 runs, Mean, 2.5 percentile and 97.5 percentile, in microseconds):
> > 
> > 4-level (no5lvl option)
> > Mean: 0.138876
> >      2.5%     97.5%
> > 0.1384988 0.1392532
> > 
> > 4-level (CONFIG_X86_5LEVEL=n)
> > Mean: 0.137958
> >      2.5%     97.5%
> > 0.1376473 0.1382687
> > 
> > 5-level
> > Mean: 0.138904
> >      2.5%     97.5%
> > 0.1384789 0.1393291
> > 
> > After repeating the experiments a few times, the observed difference(~1%) in mean values
> > is under noise levels.
> > I think these results address the performance concerns previously raised[1]. I don't
> > foresee any issues in proceeding with the 5-level paging implementation
> > simplification efforts[2].
> > 
> > [1] https://lore.kernel.org/all/80734605-1926-4ac7-9c63-006fe3ea6b6a@amd.com
> > [2] https://lore.kernel.org/all/20240621164406.256314-1-kirill.shutemov@linux.intel.com
> 
> I guess Kirill could dust off his patchset from [2] and that would get rid of
> CONFIG_X86_5LEVEL and likely simplify that aspect considerably...

https://lore.kernel.org/all/20250516091534.3414310-1-kirill.shutemov@linux.intel.com/

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
