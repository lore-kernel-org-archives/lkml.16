Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C89D25A347
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 14:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746457197; cv=none; b=O1soTG/8tDJm5/MdV27IIj0hyh9UjoQJWI25cSPv2vnUUeF+ZYioPYnv1fQtH2HO2QHKfEbmKDdncvsn8DILgTRyD1g5AbaGkcK2aI+JjrrANSkffvum6SZYTtOJ22KdS5aQTmxR/sE0ra8XKysuhI04v45kaSfHcLI6+yIhzS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746457197; c=relaxed/simple;
	bh=ojSubu3t1lk6zjl29ntq7mjUzC4Q27KY/SbonFIumtM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gijchuvdOp9TNnX5pcKrG4KFbdNQ56vOdEPypWyVBEwhydX4rYIeWuXwIiDO+9Gyg2i/TP2iFz93I07ECJUhzzCQWAV5xfsny0QuKwJUY5JIuKZuz9r6nh0WukQVAM57jlT2L0tGZFeCL1OnVYBiWuIL+zrA5LsOn7fi8/hU444=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ibCN2mqk; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ibCN2mqk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746457196; x=1777993196;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ojSubu3t1lk6zjl29ntq7mjUzC4Q27KY/SbonFIumtM=;
  b=ibCN2mqk7zc19QLMxOcrLKu5NMfsimh6KwosRT3yUK95N3t7EXOuZzyU
   BhA3o0YINuZgBPo2plKQ/iOtbBlYKbUBruEZmjzRwlNcp635TcuxrKuPr
   CwgWYL67+7uZmdbzl6ZBi3CXSqzjqwr8kAvr4cnL3ed3MWdnWnTzEt6py
   0V3AhTbdlGJ5eR8TNCZoQVFMzubJOCw1LvAKE2Dbef6ITPIgJjShgiJVn
   cjIxq6gSa9r4br9FkXgUik8HseeosgaCrG1jNoBr/w8t5LHPiwlgcB6QW
   zCqFWBXj+dQMBUQyAB00m/hYAgxRgNKd+gb6l03GgB6Yo8BLdVx0LP6tk
   Q==;
X-CSE-ConnectionGUID: f4oM0OJXTFGZ4+v+a+eKXg==
X-CSE-MsgGUID: /JS6wdtpTC6V4PrFzJBgJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="35689199"
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="35689199"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 07:59:55 -0700
X-CSE-ConnectionGUID: OZhGii6RSaqXoA8M3MQ2Wg==
X-CSE-MsgGUID: iBcZZVjuT1O2I8ACzDdBDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="135012479"
Received: from smile.fi.intel.com ([10.237.72.55])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 07:59:52 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uBxIK-000000035SB-2vpv;
	Mon, 05 May 2025 17:59:48 +0300
Date: Mon, 5 May 2025 17:59:48 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Ashish Kalra <ashish.kalra@amd.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Denis Mukhin <dmukhin@ford.com>
Subject: Re: [PATCH v1 0/6] x86/boot: Enable earlyprintk on MMIO (8-bit)
Message-ID: <aBjSZA29o2zZYvGh@smile.fi.intel.com>
References: <20250502123145.4066635-1-andriy.shevchenko@linux.intel.com>
 <db19e81405d17e9eb9a3c1d4798220178e4f9373.camel@infradead.org>
 <aBjFtWDSuXVq9kW-@smile.fi.intel.com>
 <3c1bd53c8ee5fe0a6e281551dfe2089679e8e5eb.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c1bd53c8ee5fe0a6e281551dfe2089679e8e5eb.camel@infradead.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, May 05, 2025 at 07:35:04AM -0700, David Woodhouse wrote:
> On Mon, 2025-05-05 at 17:05 +0300, Andy Shevchenko wrote:
> > On Fri, May 02, 2025 at 10:33:49AM -0700, David Woodhouse wrote:
> > > On Fri, 2025-05-02 at 15:29 +0300, Andy Shevchenko wrote:
> > > > Some of the platforms may have no legacy COM ports and only provide
> > > > an MMIO accessible UART. Add support for such to earlyprintk for the
> > > > boot phase of the kernel.
> > > 
> > > Shiny. I had to hack QEMU's PCI serial port to do unnatural things, in
> > > order to test the mmio32 variant which was the only thing the
> > > earlyprintk code used to support. But I *did* so, and it works with the
> > > kexec debugging.
> > > 
> > > Can you add support for this mode to the kexec debugging too, please?
> > 
> > Do you mean to add MMIO 8-bit to kexec assembly code and other parts like you
> > did in the below mentioned change?
> > 
> > I can try it at some point, but have no time right now for this.
> > I would appreciate if you can give a try for this patch series
> > functionality to see if it helps for the initial messages (as
> > far as I understand you also want to have this in the second
> > kernel, right?).
> 
> I'll see if I can find the time to take a look. Got a branch I can pull
> your series from?

Yeo, https://bitbucket.org/andy-shev/linux/commits/branch/topic%2Fx86%2Fboot-earlyprintk.


-- 
With Best Regards,
Andy Shevchenko


