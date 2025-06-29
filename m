Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5119E27456
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 15:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=163.172.96.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751209812; cv=none; b=Ixv1TYppFOkxqj3KoiWL2iLlf0kLvbJVC2Pg+xbKAKGWav9QPWhr9k27brQq7tpfddyXb2o9dYJTrvmalUcOuNPjArHPgNGgCvZg+SY/cZtoRGdGEKcMdmk+jEE5cdewH0D1iRAdqpwKO6U8rbG6AP2L3zRLYmnM+cGirqVmPyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751209812; c=relaxed/simple;
	bh=PybjCsqHb/nbbr6lHUL1oMOz7toY/9mLWqYI5xZLRhU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UniRCu8v4XNFnI+V0DE24LoO0nebYVlxTthtgQsKu33aZWqva/2EcTbBO+pp5z4BlIy2LywYZS0OscFY4P4VWn/W9c73M7nacEy+dA/RlD29koJCH7k5/7V1z2gsdOnEOk1vvNK/KiXzUCpJMgxc+nlV814hcotmSIbUl4PUgMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; arc=none smtp.client-ip=163.172.96.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 55TFA6ll029064;
	Sun, 29 Jun 2025 17:10:06 +0200
Date: Sun, 29 Jun 2025 17:10:06 +0200
From: Willy Tarreau <w@1wt.eu>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] tools/nolibc: move FD_* definitions to sys/select.h
Message-ID: <20250629151006.GA16826@1wt.eu>
References: <20250620100251.9877-4-w@1wt.eu>
 <25eb3144-d19e-43d2-af4f-b0251d28808c@t-8ch.de>
 <20250622071958.GA3384@1wt.eu>
 <07f5fdb4-2c5c-4723-b12a-abdb0c9f33b7@t-8ch.de>
 <20250623025618.GA29015@1wt.eu>
 <20250629084628.GA7992@1wt.eu>
 <d8d9ab91-0617-468e-a82d-9f271c5e6a7f@t-8ch.de>
 <20250629092552.GA30947@1wt.eu>
 <029f24fa-3512-4736-94a0-e158c158cc8e@t-8ch.de>
 <20250629094048.GA26861@1wt.eu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250629094048.GA26861@1wt.eu>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Sun, Jun 29, 2025 at 11:40:48AM +0200, Willy Tarreau wrote:
> On Sun, Jun 29, 2025 at 11:37:06AM +0200, Thomas Weißschuh wrote:
> > On 2025-06-29 11:25:52+0200, Willy Tarreau wrote:
> > > On Sun, Jun 29, 2025 at 10:53:34AM +0200, Thomas Weißschuh wrote:
> > > > On 2025-06-29 10:46:28+0200, Willy Tarreau wrote:
> > > > > On Mon, Jun 23, 2025 at 04:56:18AM +0200, Willy Tarreau wrote:
> > 
> > <snip>
> > 
> > > > > Trying it has reopened the circular dependencies can of worms :-(
> > > > > It's the same problem as usual that we've worked around till now
> > > > > by placing some types in types.h, except that this time fd_set is
> > > > > defined based on the macros FD_* that I moved to sys/select.h.
> > > > 
> > > > Can't fd_set also move to sys/select.h? This is how I read fd_set(3).
> > > 
> > > That was what I did and precisely what was causing the problem. We
> > > have sys.h defining select() with fd_set in it with sys/select not yet
> > > being included. I moved sys.h after all sys/* and it broke something
> > > else instead.
> > 
> > Ah. Then move select() also into sys/select.h; where it belongs. :-)
> 
> For an unknown reason I thought we avoided to move the syscall definitions
> there and only used sys/*, but I was apparently confused as we have exactly
> that in prctl or wait. I can give that one a try again.

So after one more hour on it, I'm admitting abandonning the battle.
Adding the necessary includes there is causing "declared inside parameter"
failures in random other totally unrelated stuff (e.g. in sys_getdents64()
or msleep()). We'll have to really clear that circular includes mess again
in a near future. For now I'll stay on the stub which works fine without
affecting the rest.

Cheers,
Willy
