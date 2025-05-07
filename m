Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D601028F53F
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 13:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746626055; cv=none; b=sFyVkIVccdL8WjvnnWkTfd64p+NZcee20rps70O6DvMEi9tymi1N2WuXFfp5qUidu2ujWWjhNWKqfUBGIB+BDVxh66UBb2icERFkqyRKWZWY/hs8v976G3epLQdmTaB4qUeDf6bQ7XUfl/qGoorHKUHXpWHdWYDWhfASGl9acgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746626055; c=relaxed/simple;
	bh=vze+17XceRJoOoG/svFEL6SEfqk9yNIzPuCH+KkVmEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=feEBI99DvKXE3lWVugUOhP4iIdDCC2hhYPIObA9sdAt0qX2zn4mFhe6shO8prMyE091uEP0SSzmLLJi0qUCQE6GhBJJ34SZCcgu0IQV8uimqDBnYrBs463mLPnZYo18zVkxxyTOrGlgSHWYkC2nw7xPC+jgnOkJy1F6AAFA5DWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S+gt/9wC; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S+gt/9wC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746626054; x=1778162054;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vze+17XceRJoOoG/svFEL6SEfqk9yNIzPuCH+KkVmEw=;
  b=S+gt/9wC48c2PHB4wZ0u/XYbO/42ibD/siHpSslmIrzNciPTRJIifSPF
   QM7zllZnQBXdYE2cQBgdRmUVX8sU0DyJ1zgH0Edb1odUYmKDrbON/lFeS
   nbPsfERSz4/5L++a7d78sEELdGkvO5nlJRcLRt0EqCx8RvtZzThh0DfwP
   OgH3sTp8mGWUmsLFVm0rGOHFSBAOQ696yKpYCHRvz/WYqIAz1h6W78hzT
   p1YlJpnqlU7H9giMGFcEYV0z2ms2cWrC+zRQKbu6uGq7XFTb6smyEhkNx
   8tEHEKaDxzUoOOV/yaS6yOPoT6BQgFaJlgcUftDatCxHzJVwrf6zTS1W1
   w==;
X-CSE-ConnectionGUID: UtLgApf+TvmmsCkW+vqV7A==
X-CSE-MsgGUID: y7nbrrl7Q/e9Jt6UuWL6ng==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="59753294"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="59753294"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 06:54:14 -0700
X-CSE-ConnectionGUID: fim/3lfsRaizCn/2Drq8kg==
X-CSE-MsgGUID: 0E13cpX1SpSHJ4YXES9ypg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="140720499"
Received: from smile.fi.intel.com ([10.237.72.55])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 06:54:11 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uCfDr-00000003kMP-1t2w;
	Wed, 07 May 2025 16:54:07 +0300
Date: Wed, 7 May 2025 16:54:07 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Ashish Kalra <ashish.kalra@amd.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Denis Mukhin <dmukhin@ford.com>
Subject: Re: [PATCH v1 0/6] x86/boot: Enable earlyprintk on MMIO (8-bit)
Message-ID: <aBtl_zoWwuVC6Gyi@smile.fi.intel.com>
References: <20250502123145.4066635-1-andriy.shevchenko@linux.intel.com>
 <47a4795427d11c7c2d7713edda36d0c63c585c8d.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <47a4795427d11c7c2d7713edda36d0c63c585c8d.camel@infradead.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, May 06, 2025 at 12:38:21PM -0700, David Woodhouse wrote:
> On Fri, 2025-05-02 at 15:29 +0300, Andy Shevchenko wrote:
> > Some of the platforms may have no legacy COM ports and only provide
> > an MMIO accessible UART. Add support for such to earlyprintk for the
> > boot phase of the kernel.
> 
> Aha, I understand now... you've added this *only* for the boot code,
> and haven't added the corresponding support to the in-kernel
> earlyprintk, in arch/x86/kernel/early_printk.c

Haven't added yet. This is part 1 only.

> The latter does already support MMIO but it only supports a 32-bit
> stride, not 8-bit.
> 
> Please could you make that consistent, and ensure the earlyprintk=
> arguments function the same for both phases? I'm happy to add the
> kexec-debug parts on top of *that*.

It's not as easy as it looks like. I had done in the past the comparison table
of what we have between all early*=... for serial consoles and it all so
inconsistent to begin with. A big work needs to be fulfilled in order to put
this mess in order. Hence this is just the first step.

> It would be really helpful if we could test this in QEMU; it shouldn't
> be that hard to make it provide a 16550 on MMIO, along the lines of the
> one-line hack I posted yesterday.

I understand. But if no go for this series, I don't won't to spend time on
the next part.

In any case, thanks for looking into this.

-- 
With Best Regards,
Andy Shevchenko


