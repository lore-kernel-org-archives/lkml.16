Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDE42561A9;
	Mon, 12 May 2025 07:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747034738; cv=none; b=lKnMoRaLgftRxrz4T9IyKra4FKXgHy8Rfs4xi1N+P66HnSTzFFdqe2Vkck2OTtD1KTgnr+sJlQ2j2A9hvcw3vz/+5qVsG95ohWEjw6RToYWdTAxfzkarVmZyMfAjkPCZjqpwWhgmHL13v/D1PvBCLeZ5zSpNyO72VYbq4hPbdLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747034738; c=relaxed/simple;
	bh=y9J37bo2F5j0tycBv4bxMQnl44tqMOnN6NptncmaQeA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pPoPjS79qf8DulFq117xxNO0VWrUqFAd2EGBUsMX00IFDJi8w6BkorUX/d0srQGzjyLpvWBfzQrAFK0eZ9mNHZaAN7cXx+9sg0pL6JnUYfcdQln7eDIWsFxE8/OvOToL+xC5UQ9lO1/qDP+EIJEhlg9bHo93k89NaUtu+18qGSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fqa9Qf1m; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fqa9Qf1m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747034737; x=1778570737;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=y9J37bo2F5j0tycBv4bxMQnl44tqMOnN6NptncmaQeA=;
  b=Fqa9Qf1mfz1r66KRQoRCZfOORKHA1VE0+dQNU0uHlB5R8SK9jKkzSZ6g
   ODAfGbrdJLr7JMMlmPadm/Ew5PsnFgF0VTjaNfOWlw6MIyfTCvqk7oq5M
   c8FYkb9MdmKe1NUbwjvveRLKr0hV0U5Uj4UULbjGMzd0h0eUM+iii0EpT
   upxKdAr/qeComZWiyfSRjK0hYWC/GQ/OL+ujUZII1smXsHDpfR15qNGif
   t4aTpdSaV1NCmJifIyBKLoqXtmcUCGFMK89/TDolexVxTMpllAuxjMGxh
   +ui7uNO7x+2igAzmY7+PFcicSltKFlFzUl96fOmiH79PUo2dZV+r6lq9o
   Q==;
X-CSE-ConnectionGUID: pycSO+GoSXm+LzOnbVKgrw==
X-CSE-MsgGUID: 9Bu8C61sQz6vmCcjH55Htg==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="48969368"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="48969368"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 00:25:36 -0700
X-CSE-ConnectionGUID: QS4BUgW5RGus07f112caSA==
X-CSE-MsgGUID: aurh/BQUSGa8Sp9YIUmMcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="137143745"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 00:25:34 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uENXW-00000000qYh-1wUA;
	Mon, 12 May 2025 10:25:30 +0300
Date: Mon, 12 May 2025 10:25:30 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jason Xing <kerneljasonxing@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, corbet@lwn.net,
	linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	linux@treblig.org, viro@zeniv.linux.org.uk,
	Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH] relay: Remove unused relay_late_setup_files
Message-ID: <aCGiaoqA1oA-M0PN@smile.fi.intel.com>
References: <CAL+tcoCVjihJc=exL4hJDaLFr=CrMx=2JgYO_F_m12-LP9Lc-A@mail.gmail.com>
 <aCGR4EOcWRK6Rgfv@smile.fi.intel.com>
 <aCGSYSDwDZiJmOtD@smile.fi.intel.com>
 <CAL+tcoAkrtH3NYX+X+6WcvBgGWDW8POnENjbtxStMLRyPORf-A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL+tcoAkrtH3NYX+X+6WcvBgGWDW8POnENjbtxStMLRyPORf-A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, May 12, 2025 at 02:55:45PM +0800, Jason Xing wrote:
> On Mon, May 12, 2025 at 2:17 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Mon, May 12, 2025 at 09:14:56AM +0300, Andy Shevchenko wrote:
> > > On Mon, May 12, 2025 at 09:12:56AM +0800, Jason Xing wrote:
> > > >
> > > > I noticed this patch "relay: Remove unused relay_late_setup_files"
> > > > appears in the mm branch already[1], which I totally missed. Sorry for
> > > > joining the party late.
> > > >
> > > > I have a different opinion on this. For me, I'm very cautious about
> > > > what those so-called legacy interfaces are and how they can work in
> > > > different cases and what the use case might be... There are still a
> > > > small number of out-of-tree users like me heavily relying on relayfs
> > > > mechanism. So my humble opinion is that if you want to remove
> > > > so-called dead code, probably clearly state why it cannot be used
> > > > anymore in the future.
> > > >
> > > > Dr. David, I appreciate your patch, but please do not simply do the
> > > > random cleanup work __here__. If you take a deep look at the relayfs,
> > > > you may find there are other interfaces/functions no one uses in the
> > > > kernel tree.
> > > >
> > > > I'm now checking this kind of patch in relayfs one by one to avoid
> > > > such a thing happening. I'm trying to maintain it as much as possible
> > > > since we internally use it in the networking area to output useful
> > > > information in the hot paths, a little bit like blktrace. BTW, relayfs
> > > > is really a wonderful one that helps kernel modules communicate with
> > > > userspace very efficiently. I'm trying to revive it if I can.
> > >
> > > Jason, with all of the respect, if you are interested in keeping things going
> > > on, please add yourself to the MAINTAINERS. It will makes the users of the
> > > legacy code, Andrew and others, who are doing maintainer's/reviewer's job,
> > > and you happy.
> > >
> > > Also note, we usually do not care about the out-of-tree users. The main Q here
> > > why are they out-of-tree for so long time?
> > >
> > > > [1]: https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/commit/?h=mm-everything&id=46aa76118ee365c25911806e34d28fc2aa5ef997
> >
> > With the above being said, I am +1 for the patch to stay. Feel free to send
> > a revert with a good justification of why it should stay. Note, out-of-tree
> > is not enough argument.
> 
> Thanks for the vote. Let me seriously think of the possible use case
> here. If I find one, I think I would revert it as soon as possible.

Sure, I will be happy to help reviewing such a revert.

-- 
With Best Regards,
Andy Shevchenko


