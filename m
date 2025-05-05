Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DEB15574E
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 15:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746457332; cv=none; b=L8KckJkN5fCxrzQUcuBFK6Ws7UKiLEPiIhzsb60Vrs7iUILHV7BFfEN5FvbKW1Bu7O73V2m2vO0h9VIdWF9FZOBJ1w+ybavugmd0MnoKJL/gPaJqZXNidC0Q/GwrcgOTPSkXh4489ZrpWXg6JjuqtgrXb4iLOXsvP6AvP9+SmUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746457332; c=relaxed/simple;
	bh=TnVs85tiIYoNC7OwE4oeE4p0IdFvfq06QFGRKecepm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dZ0glm4rcG1wjMnZ4WYBWRsBeWUHB1ZA8fZpAniK5pvNrk0ITiV2vnE0UMF9QDUYJPG0xSHR9V/HHteohlBJsECL+sn2r3Sl+W7aMW3WsKrUIiPRpLHfAb5Ru9SRF+3UaFZHAkZ4biL5bZ782A4fe8ScgFXNncpW4NXRv0h9LkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TzFYWX+O; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TzFYWX+O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746457331; x=1777993331;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TnVs85tiIYoNC7OwE4oeE4p0IdFvfq06QFGRKecepm0=;
  b=TzFYWX+OISEYAH0gvjKtXwmC3cr02gI3KHHZiRVJ4tu5YMcvSVB+v5+y
   Mc1M/cnHoFokqrOiqjpTCjTZQkmYHbcs/8cLA0rsbrl4e90lTb835SfUd
   Ta4yvZJ3ck27JJfy+ouVlQV5QiVBA9K1saQIIIcSAce3tjS1IKgi8KgsR
   GQoebZiwTe+vjFFtUD9PjJjWC1ug20OR9VUBFewco5GIfPG5r2uaVC/Sh
   qHtvBpXF/qvhkNU/V+Bzi8TdvUfycD9YQSU9cs5KlmDUA4ZPSVrRITrU2
   cbV8OABRRqaWhir0F95k2wQWK/BqvzW51owei2VNqJ5iAYnxV+c1pX0pt
   w==;
X-CSE-ConnectionGUID: kPz21JbHRcW1oS2WSLZ3JA==
X-CSE-MsgGUID: /UUgfuNETzevwUiLOJg7pA==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="35690141"
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="35690141"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 08:01:39 -0700
X-CSE-ConnectionGUID: DdvDcxbrSG6XBK9Q3dPxXg==
X-CSE-MsgGUID: 53arqs8dRHSVJtskLisXRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="135013085"
Received: from smile.fi.intel.com ([10.237.72.55])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 08:01:36 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uBxK0-000000035TV-2MH6;
	Mon, 05 May 2025 18:01:32 +0300
Date: Mon, 5 May 2025 18:01:32 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Ashish Kalra <ashish.kalra@amd.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Denis Mukhin <dmukhin@ford.com>
Subject: Re: [PATCH v1 0/6] x86/boot: Enable earlyprintk on MMIO (8-bit)
Message-ID: <aBjSzIPaovOl03Eg@smile.fi.intel.com>
References: <20250502123145.4066635-1-andriy.shevchenko@linux.intel.com>
 <db19e81405d17e9eb9a3c1d4798220178e4f9373.camel@infradead.org>
 <aBjFtWDSuXVq9kW-@smile.fi.intel.com>
 <3c1bd53c8ee5fe0a6e281551dfe2089679e8e5eb.camel@infradead.org>
 <aBjSZA29o2zZYvGh@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBjSZA29o2zZYvGh@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, May 05, 2025 at 05:59:48PM +0300, Andy Shevchenko wrote:
> On Mon, May 05, 2025 at 07:35:04AM -0700, David Woodhouse wrote:
> > On Mon, 2025-05-05 at 17:05 +0300, Andy Shevchenko wrote:
> > > On Fri, May 02, 2025 at 10:33:49AM -0700, David Woodhouse wrote:
> > > > On Fri, 2025-05-02 at 15:29 +0300, Andy Shevchenko wrote:
> > > > > Some of the platforms may have no legacy COM ports and only provide
> > > > > an MMIO accessible UART. Add support for such to earlyprintk for the
> > > > > boot phase of the kernel.
> > > > 
> > > > Shiny. I had to hack QEMU's PCI serial port to do unnatural things, in
> > > > order to test the mmio32 variant which was the only thing the
> > > > earlyprintk code used to support. But I *did* so, and it works with the
> > > > kexec debugging.
> > > > 
> > > > Can you add support for this mode to the kexec debugging too, please?
> > > 
> > > Do you mean to add MMIO 8-bit to kexec assembly code and other parts like you
> > > did in the below mentioned change?
> > > 
> > > I can try it at some point, but have no time right now for this.
> > > I would appreciate if you can give a try for this patch series
> > > functionality to see if it helps for the initial messages (as
> > > far as I understand you also want to have this in the second
> > > kernel, right?).
> > 
> > I'll see if I can find the time to take a look. Got a branch I can pull
> > your series from?
> 
> Yeo, https://bitbucket.org/andy-shev/linux/commits/branch/topic%2Fx86%2Fboot-earlyprintk.

But just FYI that with `b4` it's as easy to pull from the mailing list as from
a branch:

	b4 am 20250502123145.4066635-1-andriy.shevchenko@linux.intel.com
	git am -C1 -s ...

-- 
With Best Regards,
Andy Shevchenko


