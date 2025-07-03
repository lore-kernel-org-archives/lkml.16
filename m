Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFFF225D6
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 05:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751522272; cv=none; b=EvxlKcER1DbODyXCaTft/whW37ZbU8/2do6jOQ5Dv/q2SUj4BGTizMjDXzoUURYsr66yIKZ6Rzl3uJvALuoYWI9SZioyDvnqAgI/Q8pNgSDRGKKGrz0di3qr1josse3cpKw9+hp46XnFznIScM6bxE+eoh88fVr/hSVITZOFCHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751522272; c=relaxed/simple;
	bh=x0bqtaLqnIyJug6o4pbtBOZSZUAHS5NK6xRC8csKi/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UqmpExbNPqd+Cbm1vnF4icuUiUE6dYXW3M1++21cbuuakwkEM2zCnYXEa946oJDiHLOrHY80frYJxL9xA9lsZZRlHTjHFTknUzYSkah1DGtrHMM7MfgxO+G+u85QjFISbdReg3a/vxT6UKXpjk+ZUdnqB0zWt+1pMgqf2BCeXyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=thoISwQL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="thoISwQL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10FAEC4CEE3;
	Thu,  3 Jul 2025 05:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751522272;
	bh=x0bqtaLqnIyJug6o4pbtBOZSZUAHS5NK6xRC8csKi/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=thoISwQLq8WNToaz9ucAbB2oDVQEbOFc3Z8DBDQGQ8jYYvTpv28IRamleWmJLjzMS
	 elEJgND8ucwiBui6O7jgPoYQ3QNYeRT/s36JcYfsJMAIoAoSVD29ZujteqBiKAQh+5
	 WhMRAi5PmGqAVXCzWm01mXptST856nA1TFJqD2xkFOoRCkWm9AaNapreCT5Rtr+C+n
	 wRXyf8ZLf1xlnhkKJQsd9blAozGYJHU1nYWtlYPicy13uu8QWshW50IgssV9PQbD6u
	 RMrNEVgTv8928rf6O37ALQF68UdITKlI8sVRNpVSiA5pExOAkf2W14QY/SWmFUJhSf
	 vS/kjGK1Lpb2A==
Date: Wed, 2 Jul 2025 22:57:50 -0700
From: Dennis Zhou <dennis@kernel.org>
To: Jeongjun Park <aha310510@gmail.com>
Cc: Shakeel Butt <shakeel.butt@linux.dev>, tj@kernel.org, cl@gentwo.org,
	akpm@linux-foundation.org, vbabka@suse.cz, rientjes@google.com,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	syzbot+e5bd32b79413e86f389e@syzkaller.appspotmail.com
Subject: Re: [PATCH] mm/percpu: prevent concurrency problem for
 pcpu_nr_populated read with spin lock
Message-ID: <aGYb3oqXlva9ASO5@snowbird>
References: <20250702082749.141616-1-aha310510@gmail.com>
 <zvczeiqk535pvryfae4lta5ezvqks6knhugnzgyq6gu634gn4c@av5hhiabqmzf>
 <CAO9qdTG0uDcG5ydXbj5XZdsdH=pD2yHaq9dR=N=Nq5QvUMvuBA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO9qdTG0uDcG5ydXbj5XZdsdH=pD2yHaq9dR=N=Nq5QvUMvuBA@mail.gmail.com>

On Thu, Jul 03, 2025 at 02:19:34PM +0900, Jeongjun Park wrote:
> Shakeel Butt <shakeel.butt@linux.dev> wrote:
> >
> > On Wed, Jul 02, 2025 at 05:27:49PM +0900, Jeongjun Park wrote:
> > > Read/Write to pcpu_nr_populated should be performed while protected
> > > by pcpu_lock. However, pcpu_nr_pages() reads pcpu_nr_populated without any
> > > protection, which causes a data race between read/write.
> > >
> > > Therefore, when reading pcpu_nr_populated in pcpu_nr_pages(), it should be
> > > modified to be protected by pcpu_lock.
> > >
> > > Reported-by: syzbot+e5bd32b79413e86f389e@syzkaller.appspotmail.com
> > > Fixes: 7e8a6304d541 ("/proc/meminfo: add percpu populated pages count")
> > > Signed-off-by: Jeongjun Park <aha310510@gmail.com>
> > > ---
> > >  mm/percpu.c | 8 +++++++-
> > >  1 file changed, 7 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/mm/percpu.c b/mm/percpu.c
> > > index b35494c8ede2..0f98b857fb36 100644
> > > --- a/mm/percpu.c
> > > +++ b/mm/percpu.c
> > > @@ -3355,7 +3355,13 @@ void __init setup_per_cpu_areas(void)
> > >   */
> > >  unsigned long pcpu_nr_pages(void)
> > >  {
> > > -     return pcpu_nr_populated * pcpu_nr_units;
> >
> > No need for the lock as I think race is fine here. Use something like
> > the following and add a comment.
> >
> >         data_race(READ_ONCE(pcpu_nr_populated)) * pcpu_nr_units;
> >
> 
> This race itself is not a critical security vuln, but it is a read/write
> race that actually occurs. Writing to pcpu_nr_populated is already
> systematically protected through pcpu_lock, so why do you think you can
> ignore the data race only when reading?
> 

As mentioned in the other thread, the reader of this value is
/proc/meminfo and reading a stale value isn't the end of the world
either.

Thanks,
Dennis
