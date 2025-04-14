Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9751DC1A7
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 10:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744625239; cv=none; b=SI97UTES9Ek685FGDc9xhiVuaAe0oif3EyknW1B7YKVmebCH7vmVsmyO/ke672sUY9YXwHTd1YFKJj6EC9M6wnBDRDbPn0IwwhRVOwirVcEideusaP/PmFZXvU0orBFbrkH5uXgxd/3qTzV5Edus2b/WkP1E6zO4AcPBLkYMoec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744625239; c=relaxed/simple;
	bh=ozUToj8hnQBLcBSNJc3tQrsZffoKQypZ8aQtkMPwOXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mGFEhBeQgt12PAxJ8UUFBHrfpDnSWH/O4aqOJFPz12yNpM1TUz0UnCUtYgWMFHfI1L+pz4aY5ksuLTNRkuUB1+yoh76AwbH2H9e2FVtTGbvYW98OczIeFOb+KoHddwVg3QO21RRSdqF7rWG+u3I8gsJCqrxTz7kNzsGQLZrsUaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LVpAI05x; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LVpAI05x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744625238; x=1776161238;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ozUToj8hnQBLcBSNJc3tQrsZffoKQypZ8aQtkMPwOXI=;
  b=LVpAI05x/R6gt00tYbj+IHAEXSgrgmqEpF5Rw1S9xL2Phrdvt61R09ev
   Lq1oQYSwh/x9uGoUjM6a7I8qAqRQwwPfZSTjKHXeLM6/ZDMgMyxgTIVyR
   pqKrkVhfkJG3kxJY9x2BA82bsPbQ2SmAuiGPUTJpFT72ze/iRaRNIMCaQ
   4BHN5IK/e91euThNprWgHctLoScpAbFhcsMPvTVPAV5PSyWBxJtmoI6Za
   rt9Dohq2RTyK+g2e0bYjbinCkCe1uiiQ1aY8V2JzGN5CFxG4nt3WC+H2B
   D/izYvvdgFVLWS41TFUXr5YmoH8scQNUDlQLPGUIunq8uEKFkmOTLXmJG
   w==;
X-CSE-ConnectionGUID: zpyv59nfTGyrDP5tfZIJNg==
X-CSE-MsgGUID: zZ3bheEeSxWUmiOCTCLNyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="56268601"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="56268601"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 03:07:18 -0700
X-CSE-ConnectionGUID: EFf+Dns+RL6Rgrz9PTcWjQ==
X-CSE-MsgGUID: ZtfGCfYFQHiJcofNawjWgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="134531819"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 03:07:15 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u4Gie-0000000CCcE-3dPa;
	Mon, 14 Apr 2025 13:07:12 +0300
Date: Mon, 14 Apr 2025 13:07:12 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Avizrat, Yaron" <yaron.avizrat@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Oded Gabbay <ogabbay@kernel.org>,
	"Elbaz, Koby" <koby.elbaz@intel.com>,
	"Sinyuk, Konstantin" <konstantin.sinyuk@intel.com>
Subject: Re: [PATCH v3 1/1] accel/habanalabs: Switch to use %ptTs
Message-ID: <Z_zeUAW7u8UgmEOo@smile.fi.intel.com>
References: <20250305110126.2134307-1-andriy.shevchenko@linux.intel.com>
 <Z-PM8oBtTPzqv-S2@smile.fi.intel.com>
 <87zfh86rqi.fsf@intel.com>
 <81431521-bedf-4361-a222-0e8ec70bea69@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <81431521-bedf-4361-a222-0e8ec70bea69@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sun, Mar 30, 2025 at 02:15:50PM +0300, Avizrat, Yaron wrote:
> 
> On 26/03/2025 11:55, Jani Nikula wrote:
> > On Wed, 26 Mar 2025, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> >> +Cc: Jani (sorry, forgot to add you in the first place).
> >>
> >> Do you think it's applicable now?
> > Cc: Yaron, Koby, and Konstantin who are supposed to be the new
> > maintainers for accel/habanalabs.
> >
> >
> > BR,
> > Jani.
> 
> Thanks for the help, We’ll verify this change in our CI/CD pipeline and update you ASAP.

What's news, please?

-- 
With Best Regards,
Andy Shevchenko


