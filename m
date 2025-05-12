Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDD63D984;
	Mon, 12 May 2025 06:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747030634; cv=none; b=BLcoHDZZFuAM2VsOSqpfXB+NXI8ag/CLNKho2odnuDIf41FnvbvFhiI4eHXxp4hNRqx+XTckKaWrkRROo+lTAurRRHmhPM/nN7lMyKarRn/S1Goy2ipKWXU7Fnna+7VY0VS/BOp9ppgfvgQ2Yagl0tuuDny+WHTYaKADuVZYnhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747030634; c=relaxed/simple;
	bh=VzZDG00X1ihjnruuvzKH8dj0DPVIaM431wggNiUlxKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cLqTnfkuTW3VTeyYn8nVCQfInLD4i8X8FtF3W4TiBJNRoe75C8t7o9M08CYykiEypQUSBTAmoMa+ADYJ4qVV2l9uVHyIqWUDRcmCq949AAuP6WidSbSlqI+c7Sn8iMUpv+oy+yWUXXukU7iMAUQHeV+2cYhs6V9miSIiBrCagR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W6grNhm1; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W6grNhm1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747030633; x=1778566633;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VzZDG00X1ihjnruuvzKH8dj0DPVIaM431wggNiUlxKM=;
  b=W6grNhm1D1Xm0iGGnnO8JvEQ5HH1RIuJIARPgOgIsDzWgNyqxP35tbgf
   irrUmOkr6yDciJyVr9CGUFksaWXVVvX3ZanSBLwNYIlkwNkCahTUZbTYa
   tyxzrFreCbQxccGX3fSWnCY4EnNLVQHEVNup8VtoKamIftw4dUONfm+Su
   WYYZS8CoVzwpm1tbQTYjLrKsPMoo7OFP9E0m0LtWcw7NwwGp+XcT8bx2s
   9U9VkF4HjY8/GXMcFPyBa/UIzE/BdHi5rTqFa6sM2W60yCJyi4gGhxGPR
   VWhhWPrPyQSE1iHHVCr+fb7Un/613dsmaSZemba+YYXx8/mTqgqjRrD61
   w==;
X-CSE-ConnectionGUID: xm8nmsZmRfSWFrICxysOSg==
X-CSE-MsgGUID: V+Yi6BM2Q0e3Eeqv96tvgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="48059812"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="48059812"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2025 23:17:11 -0700
X-CSE-ConnectionGUID: 5KydAV8kRPGJ3uXCR98K1w==
X-CSE-MsgGUID: ivZgECalSYGUJWx9JMXrCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="137742906"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2025 23:17:09 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uEMTJ-00000000pPc-47Zy;
	Mon, 12 May 2025 09:17:05 +0300
Date: Mon, 12 May 2025 09:17:05 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jason Xing <kerneljasonxing@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, corbet@lwn.net,
	linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	linux@treblig.org, viro@zeniv.linux.org.uk,
	Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH] relay: Remove unused relay_late_setup_files
Message-ID: <aCGSYSDwDZiJmOtD@smile.fi.intel.com>
References: <CAL+tcoCVjihJc=exL4hJDaLFr=CrMx=2JgYO_F_m12-LP9Lc-A@mail.gmail.com>
 <aCGR4EOcWRK6Rgfv@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCGR4EOcWRK6Rgfv@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, May 12, 2025 at 09:14:56AM +0300, Andy Shevchenko wrote:
> On Mon, May 12, 2025 at 09:12:56AM +0800, Jason Xing wrote:
> > Hi All,
> > 
> > I noticed this patch "relay: Remove unused relay_late_setup_files"
> > appears in the mm branch already[1], which I totally missed. Sorry for
> > joining the party late.
> > 
> > I have a different opinion on this. For me, I'm very cautious about
> > what those so-called legacy interfaces are and how they can work in
> > different cases and what the use case might be... There are still a
> > small number of out-of-tree users like me heavily relying on relayfs
> > mechanism. So my humble opinion is that if you want to remove
> > so-called dead code, probably clearly state why it cannot be used
> > anymore in the future.
> > 
> > Dr. David, I appreciate your patch, but please do not simply do the
> > random cleanup work __here__. If you take a deep look at the relayfs,
> > you may find there are other interfaces/functions no one uses in the
> > kernel tree.
> > 
> > I'm now checking this kind of patch in relayfs one by one to avoid
> > such a thing happening. I'm trying to maintain it as much as possible
> > since we internally use it in the networking area to output useful
> > information in the hot paths, a little bit like blktrace. BTW, relayfs
> > is really a wonderful one that helps kernel modules communicate with
> > userspace very efficiently. I'm trying to revive it if I can.
> 
> Jason, with all of the respect, if you are interested in keeping things going
> on, please add yourself to the MAINTAINERS. It will makes the users of the
> legacy code, Andrew and others, who are doing maintainer's/reviewer's job,
> and you happy.
> 
> Also note, we usually do not care about the out-of-tree users. The main Q here
> why are they out-of-tree for so long time?
> 
> > [1]: https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/commit/?h=mm-everything&id=46aa76118ee365c25911806e34d28fc2aa5ef997

With the above being said, I am +1 for the patch to stay. Feel free to send
a revert with a good justification of why it should stay. Note, out-of-tree
is not enough argument.

-- 
With Best Regards,
Andy Shevchenko


