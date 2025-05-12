Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491471E285A;
	Mon, 12 May 2025 01:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747013456; cv=none; b=Ghi2zyMJf3YFDO/uoGk7+qb8TlQ8DT9rrn7ds9y3hDmkvhoVCIJUm1e3nSkIK8o5iI0iEaih4Ec1xHbucRlpIVYc1VEBmMThWNithkerb/pXBmxnmNOA73eiuqiPdQU7MEmc4dpXhndcEGqfpbihkfh74Hs4MLqog+IxT1bvQ48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747013456; c=relaxed/simple;
	bh=2CB/DQOV7TfG+4aY8JMAXt9Yd/LDBRIP8f4DNSwO9vo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=raC4cjEbpgVUWobkRJsKheiaEUwx2TMr8eo9rIqJKsjcD2eswqrXxwBkisOS6+O05PtqEP+IH3PYntDtjhmaJOVFxGA2nzYCHtSITniu1WoIO8IeB9kCkFBgIvYuwItNv7Q3n5KzzcEKcgCANPYedLKbSZ1RP2Omh91GYLwk+2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=TG2XyTt3; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="TG2XyTt3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=WkjtPwXMT1f+zQEbYISmkmvIbS6f5+e9QEENN+aLMkU=; b=TG2XyTt3mAy1o8EG
	zXlmYunHQq8lqi8cugLdyQkKIGoWgnhY/8wFNc89+5EKWvcK+vY8CDzZMFnptdaI+j+/YUq7eocB2
	amsDTjq+YL6TZIUDfitpAvwjmTs2cgKomPzmL+JouP+LGBCni9Oos9YR052iqOl/TqKIxFbDcbUq1
	V+/RnZ5Ud2PRYIPQ0RPwQ19vY6b8yfs+kS09ovQdPf+HM9AE7ci3PHKRIuzeXBCuVCIzTbXGHLJNB
	ujoMuYdm6GEOWIZW83/bfoq/qx7fvmVQYgpK5y3EItIek/xgwJw/R5Th+ZWNDMoOzZAy7RtU9Atzp
	xDiCM9y9ZXQcBQlBaQ==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1uEI0E-002wKa-2s;
	Mon, 12 May 2025 01:30:46 +0000
Date: Mon, 12 May 2025 01:30:46 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Jason Xing <kerneljasonxing@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	andriy.shevchenko@linux.intel.com, corbet@lwn.net,
	linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	viro@zeniv.linux.org.uk, Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH] relay: Remove unused relay_late_setup_files
Message-ID: <aCFPRhfxKUeRu1Qh@gallifrey>
References: <CAL+tcoCVjihJc=exL4hJDaLFr=CrMx=2JgYO_F_m12-LP9Lc-A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <CAL+tcoCVjihJc=exL4hJDaLFr=CrMx=2JgYO_F_m12-LP9Lc-A@mail.gmail.com>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-34-amd64 (x86_64)
X-Uptime: 01:22:24 up 14 days,  9:35,  1 user,  load average: 0.00, 0.00, 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)

* Jason Xing (kerneljasonxing@gmail.com) wrote:
> Hi All,

Hi Jason,

> I noticed this patch "relay: Remove unused relay_late_setup_files"
> appears in the mm branch already[1], which I totally missed. Sorry for
> joining the party late.
> 
> I have a different opinion on this. For me, I'm very cautious about
> what those so-called legacy interfaces are and how they can work in
> different cases and what the use case might be... There are still a
> small number of out-of-tree users like me heavily relying on relayfs
> mechanism. So my humble opinion is that if you want to remove
> so-called dead code, probably clearly state why it cannot be used
> anymore in the future.

We've got lots of deadcode, why it's dead varies a lot; for example
people forgetting to clean it up after other patches etc - so this
_could_ be used but hasn't been for well over 7 years.

> Dr. David, I appreciate your patch, but please do not simply do the
> random cleanup work __here__. If you take a deep look at the relayfs,
> you may find there are other interfaces/functions no one uses in the
> kernel tree.

Actually, that was the only interface in relay that I found unused.

> I'm now checking this kind of patch in relayfs one by one to avoid
> such a thing happening. I'm trying to maintain it as much as possible
> since we internally use it in the networking area to output useful
> information in the hot paths, a little bit like blktrace. BTW, relayfs
> is really a wonderful one that helps kernel modules communicate with
> userspace very efficiently. I'm trying to revive it if I can.

If you've got a use for that function, then I'm more than happy to suggest
just dropping my patch.

However, it is a fairly chunky function that is built into distro
kernels - so I think it should have a little thought put to it.

As I say, if you are using it, it's fine by me just to drop this patch.

Dave

> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/commit/?h=mm-everything&id=46aa76118ee365c25911806e34d28fc2aa5ef997
> 
> Thanks,
> Jason
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
