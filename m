Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388F41A5BA6
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 19:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738954930; cv=none; b=sCaYZJhgqUBhSTDkO8Gd0QIjhnnbxB5Mp+oTsDxpKeA0ZijZ/fbfY67SjjKiNfsz1VXo/55CGiIc0WJShgPINBNiGxs8e26lM6j2FDjk/Uti56+QSQH7b8QyJBQmrn0Y7fFh2tEO44CmeRvcgbHHfB04jgOTrBI7Keo9fEh7f9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738954930; c=relaxed/simple;
	bh=9lMFGcnDh+Vm3/ngY1FYhUIdaRDXvS2jcOYj8/wDl9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NAmF/p13ZnGprHkkxlfL4xy5gXEXXYTucswikf5AgS8EXasvmuUgp5JZCrElf/sr8I39lE8AJqpZTdXxkOwkmJEBSwWM0w1eK5Hq8ZyMObqzqGin/pTyVn2rlrUhgrVCUDc8YLZ9B5by5r1tVRxn43Fp+wCVbFgeMx2cmwP9g+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j4ewA/7B; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j4ewA/7B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738954928; x=1770490928;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=9lMFGcnDh+Vm3/ngY1FYhUIdaRDXvS2jcOYj8/wDl9Y=;
  b=j4ewA/7BTGQ/lFvXevdN0KWo4xLWi9ujhD2CWfHEEDZ3ocediox3pMEp
   TlSAHQgX67vZYNP2eOcXDrSjxatlud7yfUT00O4NBTgHl0XbAyIr9yDsW
   QyKHam9y6g9XK6zpp3lzqkJBzt5otGgAaUJVnjdMUp6O4OAyi+Ihz6tq+
   P6hd90h1tY89S7ddpqGf8Fy1Q2Mt25WlcBhNau7NpIJwQLyKsnI89kXNe
   J6mq2VbXLmoRccZ85Aj3zNnuhHohreJlZR9MPY7fviM2txinMAhvRh5Em
   jUE6tcaCest5WoWTFxpUpgaDmFalm7A5YFh3KAyLB/XQqdbexzFxdmwzH
   A==;
X-CSE-ConnectionGUID: iOsbxl8/S0u5bJvOpb4wLw==
X-CSE-MsgGUID: cX/6VvZYTziZX2drbhXEcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="50585430"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="50585430"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 11:02:07 -0800
X-CSE-ConnectionGUID: BzjZhFMbQtqkTqO+k33isg==
X-CSE-MsgGUID: cN59XlJOTFG7I4gwIBy78A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111448396"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 11:02:06 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tgTc4-00000009Iol-1iBq;
	Fri, 07 Feb 2025 21:02:04 +0200
Date: Fri, 7 Feb 2025 21:02:04 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] kthread: Return the assigned value rather than 0
Message-ID: <Z6ZYrFY_3edV5HZr@smile.fi.intel.com>
References: <20250203164855.3699026-1-andriy.shevchenko@linux.intel.com>
 <Z6FjGV1-CxE12f8L@pavilion.home>
 <Z6IkFec26HmiwM4H@smile.fi.intel.com>
 <Z6YbTgpbimhonft2@black.fi.intel.com>
 <Z6ZRu4biBY7Y_Zss@pavilion.home>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z6ZRu4biBY7Y_Zss@pavilion.home>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Feb 07, 2025 at 07:32:27PM +0100, Frederic Weisbecker wrote:
> Le Fri, Feb 07, 2025 at 04:40:14PM +0200, Andy Shevchenko a écrit :
> > On Tue, Feb 04, 2025 at 04:28:37PM +0200, Andy Shevchenko wrote:
> > > On Tue, Feb 04, 2025 at 01:45:13AM +0100, Frederic Weisbecker wrote:
> > > > Le Mon, Feb 03, 2025 at 06:48:55PM +0200, Andy Shevchenko a écrit :
> > > > > Recently introduced kthread_affine_preferred() has a bug that the value
> > > > > of ret variable set but not used. This breaks the compilation with error
> > > > > (assume default CONFIG_WERROR=y and `make W=1` to run the build):
> > > > > 
> > > > > kernel/kthread.c:862:6: error: variable 'ret' set but not used [-Werror,-Wunused-but-set-variable]
> > > > > 
> > > > > Fixes: 4d13f4304fa4 ("kthread: Implement preferred affinity")
> > > > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > > 
> > > > Thanks but I already have it queued there:
> > > > 
> > > > https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git/commit/?h=kthread/fixes&id=1b0332a42656b798bea867631d739de023633ec6
> > > > 
> > > > I'll do a pull request shortly.
> > > 
> > > I'm fine with any approach as long as the issue will be fixed rather sooner.
> > 
> > Any news? As of today no appearance of the (alternative) fix either in upstream,
> > or in Linux Next. What's the plan, please?
> 
> It's there for a week or so. I must confess I should have advertized it:
> 
> 1b0332a42656 ("kthread: Fix return value on kzalloc() failure in kthread_affine_preferred()")

Thank you, I see it now!

-- 
With Best Regards,
Andy Shevchenko


