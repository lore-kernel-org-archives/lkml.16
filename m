Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6D01F461D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 12:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748869035; cv=none; b=u6+f369kMjU/QUlXrzN7LAT7TWb2KJevDjf0MR3xHcESUkPCXMZ+LcX3egKaTLFFkRo+M0UN+CLw4oBggegDpmmaawLovCC+EZIb43kmoH8vD6sTjeJMux5ZJ77hKmxZHu4zymuCtxA2TDDekLEwsPdbtoaeLZEUel2NXg05gAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748869035; c=relaxed/simple;
	bh=Ia69MBn6pqFH7viov3StXLVhknL9Lg/tn1MBOK48wG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jaw/FKAD50hERLAjoT2oCSpB7R/cLPBkP981LCZMCuOxbAZ4hhY5Bz7PL+AyfxNkh5lkMnWIA/QORYeioHtiPj/fx6B6qmURnB1GrtE06ZWHmsgdv08wbEVR7IPBsUAOBN2eRsjXy/PBAaScuDzULGxrbQssiP/rk9xQm5d30BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: fhhoe/9rTj+V7jBnyCpTGg==
X-CSE-MsgGUID: VGrN2ed0RTCtPejIQIKwkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="51021447"
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; 
   d="scan'208";a="51021447"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2025 05:57:13 -0700
X-CSE-ConnectionGUID: u5XV/5HgRXyKJkgTbEPywQ==
X-CSE-MsgGUID: UyJdOlgvTseMQYbG9BZtMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; 
   d="scan'208";a="148391097"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2025 05:57:10 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andy@kernel.org>)
	id 1uM4ix-00000002qS0-2j0z;
	Mon, 02 Jun 2025 15:57:07 +0300
Date: Mon, 2 Jun 2025 15:57:07 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Nikolay Borisov <nik.borisov@suse.com>
Cc: Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Juergen Gross <jgross@suse.com>, "H . Peter Anvin" <hpa@zytor.com>,
	Kees Cook <keescook@chromium.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: Re: [PATCH 25/32] x86/boot/e820: Simplify append_e820_table() and
 remove restriction on single-entry tables
Message-ID: <aD2fozO3s859C7xG@smile.fi.intel.com>
References: <20250515120549.2820541-1-mingo@kernel.org>
 <20250515120549.2820541-26-mingo@kernel.org>
 <206656f9-917e-4478-b731-ab7e05bc8a74@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <206656f9-917e-4478-b731-ab7e05bc8a74@suse.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Jun 02, 2025 at 03:50:24PM +0300, Nikolay Borisov wrote:
> On 5/15/25 15:05, Ingo Molnar wrote:

...

> How about doing this instead (on top of this patch):

> +       for (int i = 0; i < nr_entries; i++) {

This would be nice when defined as u32.

>         }

-- 
With Best Regards,
Andy Shevchenko


