Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC643223DE1
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 14:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748875013; cv=none; b=Sk6m5Sf2ZFhB1r1mbBTyPTI7Gk++oEPYOqXfIjCg5V136T+Gzys9EQ9TgImNHwlzh+8gbUIQpedLHh+hrEJrNqytOA3Q8lKuBjIjSgBVBpJqcjE3m63HDQXiPWC2Bad8VLog3GFcATFgQJ4zFEWk4Ko67LRu9zS7itebEfqXLrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748875013; c=relaxed/simple;
	bh=wSDM2Ow69K7WWL2AFg/yFFkjuPt4lSk3N+TksiroyoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SekiHDBjMU2LBAucvfUUnPuF6aZj+89GhK3rsJQ3C7kbBsW8PagLYfKVSp/2K2iohESmE7SyhjbkxTQPFaX+4JQ4yAZIgbTITVv86BedtMCBM9kBQS6KFB+H9oU6PtGbAXM9HHAkgVaN3DPTq+OMH4a8sV4EItmSO8sPXaGWnIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ewp/4u/F; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ewp/4u/F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748875012; x=1780411012;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wSDM2Ow69K7WWL2AFg/yFFkjuPt4lSk3N+TksiroyoI=;
  b=ewp/4u/FcYTtfAv43ayGYpnca5e8naV9Lc2P4GCi0ibZ7F+cyhVN+Mx7
   oh7qHh2J7uRWUq7hn5SyBJiuVySm/ZXrSbX3jmi7pQW3SASFiGfSucHQw
   oXJQVu+7ger117a9RWW0pAnpff6fXUmFw1QsWb7v8zXUVYGnjeQicqNO6
   vaTrow3CR3oyMLLeNXQ6zvQ1x28PAD5SrfG2zOlBQoXT2WvwFxC/HLarg
   rQiVOulQwzrwX1mhCzQruyqScVzg6tJ2pxnyggBnTjgwLqrmElapUvwpn
   mJGO6hr0p3M9c3B0dk8Ax90/DsLMVqwvoRoGEoLXIHRSabTJ19QMAkp5P
   w==;
X-CSE-ConnectionGUID: wTbjd02MRQG8JO18/PjnyA==
X-CSE-MsgGUID: G9/kdJ8zRZO4fJ0ORU2v0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="50583249"
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; 
   d="scan'208";a="50583249"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2025 07:36:52 -0700
X-CSE-ConnectionGUID: uAmgxoX/RQ6CvdE1G34CuA==
X-CSE-MsgGUID: xkNot9LpQO2Lx3xS/ekZWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; 
   d="scan'208";a="144587974"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.35.3])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2025 07:36:48 -0700
Date: Mon, 2 Jun 2025 22:36:45 +0800
From: "Lai, Yi" <yi1.lai@linux.intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>, yi1.lai@intel.com
Subject: Re: [PATCH v12 14/21] futex: Allow to resize the private local hash
Message-ID: <aD22/Ra2jHOsHJ9W@ly-workstation>
References: <20250416162921.513656-1-bigeasy@linutronix.de>
 <20250416162921.513656-15-bigeasy@linutronix.de>
 <aDwDw9Aygqo6oAx+@ly-workstation>
 <20250602110027.wfqbHgzb@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602110027.wfqbHgzb@linutronix.de>

On Mon, Jun 02, 2025 at 01:00:27PM +0200, Sebastian Andrzej Siewior wrote:
> On 2025-06-01 15:39:47 [+0800], Lai, Yi wrote:
> > Hi Sebastian Andrzej Siewior,
> Hi Yi,
> > Greetings!
> > 
> > I used Syzkaller and found that there is KASAN: null-ptr-deref Read in __futex_pivot_hash in linux-next next-20250527.
> > 
> > After bisection and the first bad commit is:
> > "
> > bd54df5ea7ca futex: Allow to resize the private local hash
> > "
> 
> Thank you for the report. Next time please trim your report. There is no
> need to put your report in the middle of the patch.
> 
> The following fixes it:
>

Will trim my report next time.

After applying following patch on top of lastest linux-next, issue
cannot be reproduced. Thanks.

Regards,
Yi Lai

> ----------->8--------------
> 
> From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Date: Mon, 2 Jun 2025 12:11:13 +0200
> Subject: [PATCH] futex: Verify under the lock if global hash is in use
> 
> Once the global hash is requested there is no way back to switch back to
> the per-task private hash. This is checked at the begin of the function.
> 
> It is possible that two threads simultaneously request the global hash
> and both pass the initial check and block later on the
> mm::futex_hash_lock. In this case the first thread performs the switch
> to the global hash. The second thread will also attempt to switch to the
> global hash and while doing so, accessing the nonexisting slot 1 of the
> struct futex_private_hash.
> This has been reported by Yi Lai.
> 
> Verify under mm_struct::futex_phash that the global hash is not in use.
> 
> Reported-by: "Lai, Yi" <yi1.lai@linux.intel.com>
> Closes: https://lore.kernel.org/all/aDwDw9Aygqo6oAx+@ly-workstation/
> Fixes: bd54df5ea7cad ("futex: Allow to resize the private local hash")
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>  kernel/futex/core.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/kernel/futex/core.c b/kernel/futex/core.c
> index 1cd3a646c91fd..abbd97c2fcba8 100644
> --- a/kernel/futex/core.c
> +++ b/kernel/futex/core.c
> @@ -1629,6 +1629,16 @@ static int futex_hash_allocate(unsigned int hash_slots, unsigned int flags)
>  		mm->futex_phash_new = NULL;
>  
>  		if (fph) {
> +			if (cur && !cur->hash_mask) {
> +				/*
> +				 * If two threads simultaneously request the global
> +				 * hash then the first one performs the switch,
> +				 * the second one returns here.
> +				 */
> +				free = fph;
> +				mm->futex_phash_new = new;
> +				return -EBUSY;
> +			}
>  			if (cur && !new) {
>  				/*
>  				 * If we have an existing hash, but do not yet have
> -- 
> 2.49.0
> 
> 
> Sebastian
