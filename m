Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4B1189B8B
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 14:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746453950; cv=none; b=fyXGM+io7Ir8S/k7qhGV/jFFChZmmy9JjjEVcCBCpKbYZzkH7DN3qqhYy/rRwgRYzJCBX8XF/X2++hGc2q14KIWYH2Ol2CvkW8c+m1ZdLDq6TTdwdZOO9PVj6OCzax3aw7VD+6BPAN77+a/zBKssJj3JIpT+TlmnVntZJrIGMzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746453950; c=relaxed/simple;
	bh=8O0HN8MQbjFtNR3vanRyfxAGqZCXg0X5Hy16bhnnMUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BJyj8yHRpNz+voOjhJbj0YydgLxmjs5KLpZVbQD3X9ngg9K7hVFYvkA5poz36m8XEfghnq4j6zaaujSPTHNAjx+YdTbeAxvr6RwiN8RC2PYvMm+GDFIhubldLeOwLuPUYSgAppBzpyrDPNUmTzKE8eFSKvonoV7jnquWSI872vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aYAOGbFy; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aYAOGbFy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746453949; x=1777989949;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8O0HN8MQbjFtNR3vanRyfxAGqZCXg0X5Hy16bhnnMUc=;
  b=aYAOGbFy4JyPoO+QjogzWTyVQsffAXmA9ffViHqs0e0OSmsEFPUSK+Ki
   BWoCo+0l+Hv3qPGi6ATkx452BHwZYpBK0y4VR7inPE+VSQk3l/fOTYJKr
   fKM27mLpIipEBl1cxH9ynWG3qsvTDCb/2odJm1wgTKizERxjljshr9AJy
   pNaGB92ZUm1RqkZSfARFjuNhsdSIiiRuMRC252yuWVoB1/0WCPuWawSAK
   SMt2+w/3yjjguyQh+mTovO2gE5vL20KwNkbGabpfwxUZjBM8meSrSHVcv
   F+FK4PwUPgfNSenSQB3Keqwv+EubKlNhJNCSjujJIQ6RhYdVmMxy1SarF
   A==;
X-CSE-ConnectionGUID: 3ghMv7w9TYaVA9nlwjJJxA==
X-CSE-MsgGUID: IiUN8SIaSxy91RvukPmdJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11423"; a="51871172"
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="51871172"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 07:05:48 -0700
X-CSE-ConnectionGUID: MjL7m7kSSEWP9XXFBfUuFg==
X-CSE-MsgGUID: ZrAbJhxZSMuwxS1giQjBXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="140050751"
Received: from smile.fi.intel.com ([10.237.72.55])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 07:05:45 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uBwRx-000000034bt-49MH;
	Mon, 05 May 2025 17:05:41 +0300
Date: Mon, 5 May 2025 17:05:41 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Ashish Kalra <ashish.kalra@amd.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Denis Mukhin <dmukhin@ford.com>
Subject: Re: [PATCH v1 0/6] x86/boot: Enable earlyprintk on MMIO (8-bit)
Message-ID: <aBjFtWDSuXVq9kW-@smile.fi.intel.com>
References: <20250502123145.4066635-1-andriy.shevchenko@linux.intel.com>
 <db19e81405d17e9eb9a3c1d4798220178e4f9373.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db19e81405d17e9eb9a3c1d4798220178e4f9373.camel@infradead.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, May 02, 2025 at 10:33:49AM -0700, David Woodhouse wrote:
> On Fri, 2025-05-02 at 15:29 +0300, Andy Shevchenko wrote:
> > Some of the platforms may have no legacy COM ports and only provide
> > an MMIO accessible UART. Add support for such to earlyprintk for the
> > boot phase of the kernel.
> 
> Shiny. I had to hack QEMU's PCI serial port to do unnatural things, in
> order to test the mmio32 variant which was the only thing the
> earlyprintk code used to support. But I *did* so, and it works with the
> kexec debugging.
> 
> Can you add support for this mode to the kexec debugging too, please?

Do you mean to add MMIO 8-bit to kexec assembly code and other parts like you
did in the below mentioned change?

I can try it at some point, but have no time right now for this.
I would appreciate if you can give a try for this patch series
functionality to see if it helps for the initial messages (as
far as I understand you also want to have this in the second
kernel, right?).

> I believe it's currently in tip/asm. This should be a simple example to
> work from:
> https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?h=x86/asm&id=7516e7216bdfb9e2fab0a0ca3bd23cb2e61e46ed



-- 
With Best Regards,
Andy Shevchenko


