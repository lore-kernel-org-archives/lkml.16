Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256DD1D07BA
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 11:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744804437; cv=none; b=HiK5JMhmyWBCFzHyMHZ5RGU/jbtWZYnXvLZUALm8HSuaA0yuk7/KyY/hBLLV45MhkX8s+7nYnu7XMu6zZW5xk0Pl+oaWKNUT2LWE/AeQHd00pMIbZYv+3fPmE3xH7du2srRtAN27lbVB9CbRpPX8blvZyVLDLp+spxyqHraweAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744804437; c=relaxed/simple;
	bh=nEUAL9xfxZ1pm145l7SXqcMBvUT5FrwxSZx7ZWyaz/M=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q8kWPViqkii1vrch5YsgFJrFXvUx8mkoU14dt2m+AXiVyMKUrL0Vo+c/dq/5RrMuvRoKRavec5XbLMF+WnGmsHmseTC/sdbhpa0OOJ6n5Qm2CF6oSWJt2BmkIjmZu85KL9ZGxeMtDgniD7MUaf0gvxYg5XKgMoi7RLJyHPQ28CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vc44cQBe; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vc44cQBe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744804436; x=1776340436;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=nEUAL9xfxZ1pm145l7SXqcMBvUT5FrwxSZx7ZWyaz/M=;
  b=Vc44cQBeTfnW+m5ve3rOYbCS6JMuZ/a/smvLaaNUvWtiS2fLJHY2ZH+1
   XnMa92qyZJ6JsdkrvQWz14to89o+HCcENEUCClBk36mWzUgam2/4iA877
   KOX9ndDMzYxvhpmGZoYYYJozjlb/RHTns5Nwg3lwBxvKXckMGlcOtANX8
   o7BBkPYqVTBH8zYDvNxwxHT10HtRiXGSZgV3jvkPA5fUzF9ftUHf27GUP
   JVFrk3X8Y4NC4ERwNZuGuYyvUgmyebk0IXQL6p3J4jCPHEzWMAfAiy5NZ
   jX/DZpMEhZa/Fcgi00PnklCwJDw3Cv/1XNArtKzVT5T5X9gfJGyMlr6/R
   Q==;
X-CSE-ConnectionGUID: CUsubG9BTPyqemFr/0SO5w==
X-CSE-MsgGUID: u5oW7oITQsuGI0UYMWXeQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="50155696"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="50155696"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 04:53:50 -0700
X-CSE-ConnectionGUID: nsKKjB7zRDekJqfRWluubg==
X-CSE-MsgGUID: leWa5SPtQYSV4on0QlVzdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="135619571"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 04:53:49 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u51Ks-0000000CqHL-07Y8;
	Wed, 16 Apr 2025 14:53:46 +0300
Date: Wed, 16 Apr 2025 14:53:45 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] genirq/irqdesc: Balance locking to make sparse
 happy
Message-ID: <Z_-aSfU6iSyNRQhu@smile.fi.intel.com>
References: <20250416114122.2191820-1-andriy.shevchenko@linux.intel.com>
 <20250416114122.2191820-3-andriy.shevchenko@linux.intel.com>
 <Z_-Z8kH0oNVRyA-c@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_-Z8kH0oNVRyA-c@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Apr 16, 2025 at 02:52:18PM +0300, Andy Shevchenko wrote:
> On Wed, Apr 16, 2025 at 02:40:34PM +0300, Andy Shevchenko wrote:
> > Sparse is not happy right now about conditional locking and
> > complains:
> > 
> >   irqdesc.c:899:17: warning: context imbalance in '__irq_get_desc_lock' - wrong count at exit
> > 
> > Refactor the code and use __acquire() to make it happy.
> > Annotate the function that it acquires the lock in the
> > similar way how __irq_put_desc_unlock() is marked.
> 
> Oh, scratch this, it basically will diminish the idea for the users.

That said, the first patch is okay, in case you want it.

-- 
With Best Regards,
Andy Shevchenko


