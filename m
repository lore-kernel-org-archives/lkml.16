Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41680278E4D
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 22:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744412226; cv=none; b=BHXPkfwEGy14uQD5ZGcC3qY8fR7BWn8+Q2Cnz2k6lUe4AaGWSYHiINYJ5F42c54v5/4Fv9UUd181AP3NQd4A0bQfQ6uHobDpzpo4bMdp/QzUY/UTYaxZM4zGfm02Oe8xmC1NX8tZEKs1ZcSV6dF7+QX6CQqzyK0UmBo57b2Mf+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744412226; c=relaxed/simple;
	bh=SQ8e5BucK1+mCQ1BNvZqkeY3nDbX+TGi4VvneYOHp+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ekf5BC0zQ0UPPT9gb93hX3EBEWFI/6cIKum8iLAi5hY3XVeQ7E3mUjXzLAGlIGVXDeKSWLF5WTQsRziZ73XUM95DAO1x/KIHwbXOcLVuPoGYieYfLSZkmNVx77omA/H8GCnHc4ngY8Tt1vRH3XMsyWr6Q29eiqtco4CJzU+Wg0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jI8E0Uvp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jI8E0Uvp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F052C4CEE2;
	Fri, 11 Apr 2025 22:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744412225;
	bh=SQ8e5BucK1+mCQ1BNvZqkeY3nDbX+TGi4VvneYOHp+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jI8E0Uvp9HL0cxu87B2JaaDwhqi5cG0NbndtaFSZYyTn+Kaja9XCitY78CZNrmcZs
	 NvECRVKND5HG/W02K3yuR+IRgjIhM+KyMkJ5Yp0EywTMvHF7szySrF/RsyGDsHjcWJ
	 ZrQAY0raBZcD+5g2Q47t45WmTW1XA1LpyN4sUxQDOKq3xzhpfaLlFabGBBaRcm9Dda
	 O3KFW27lYv9XtI7HU2+nmXtNv9E/c9q6qEzcXJdHlQCb8pOQITv1AtN0vk6ttI/PGq
	 Nt2XHOktlmUNkudR9X5SSkWeBG7Iw+UKAdrdi3JL/L8CmGVc8Y7/LcDLpFWg01IUnf
	 bnjD/qW+zQNEw==
Date: Sat, 12 Apr 2025 00:57:02 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH] timers: Exclude isolated cpus from timer migation
Message-ID: <Z_mePtIrl6z5fJBc@pavilion.home>
References: <Z_fHLM4nWP5XVGBU@localhost.localdomain>
 <4fdc6582c828fbcd8c6ad202ed7ab560134d1fc3.camel@redhat.com>
 <Z_fTmzdvLEmrAth6@localhost.localdomain>
 <56eae8396c5531b7a92a8e9e329ad68628e53729.camel@redhat.com>
 <Z_fcv6CrHk0Qa9HV@localhost.localdomain>
 <1c60e19d1cebc09a8fd89f073c3dbec80c8ddbf1.camel@redhat.com>
 <Z_fkgN1ro9AeM1QY@localhost.localdomain>
 <75607f0eb5939bf1651ff2e6c3eda4df2b4f26f0.camel@redhat.com>
 <Z_j9fOxE4Ia79dtz@pavilion.home>
 <1047ba4c25cdf4c0098dac308bcddb4b8b671954.camel@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1047ba4c25cdf4c0098dac308bcddb4b8b671954.camel@redhat.com>

Le Fri, Apr 11, 2025 at 03:02:11PM +0200, Gabriele Monaco a écrit :
> 
> 
> On Fri, 2025-04-11 at 13:31 +0200, Frederic Weisbecker wrote:
> > Le Fri, Apr 11, 2025 at 09:08:35AM +0200, Gabriele Monaco a écrit :
> > > Mmh, my patch is in fact allowing isolated cores to still migrate
> > > everything if they go offline.
> > 
> > Sure that doesn't change.
> > 
> > > 
> > > However I don't think housekeeping CPUs can execute remote timers
> > > on
> > > isolated ones.
> > 
> > I'm confused, a CPU can't execute something on another CPU (except
> > with
> > an IPI). But:
> > 
> > Before your patch, a housekeeping or isolated CPU can pull timers
> > from
> > any other CPU and execute them on its behalf.
> > 
> > After your patch, a housekeeping CPU can only pull timers from other
> > housekeeping CPUs. And isolated CPUs each execute their own global
> > timers.
> > 
> 
> Right, the way I said it doesn't really make sense.
> 
> What I mean is: why wouldn't a housekeeping CPU pull global timers from
> an isolated one?
> 
> We want to prevent the other way around, but I think housekeeping
> should be encouraged to pull timers from isolated CPUs, even if those
> are not idle.
> 
> I see only preventing isolated CPUs from pulling remote timers may play
> bad with the algorithm since they'd register in the hierarchy but just
> not pull timers.
> (This simpler approach works in our scenario though)
> 
> The idea in my patch could mostly work, but I'd explicitly let
> housekeeping CPUs pull timers from isolated (while of course not doing
> it for offline ones).
> 
> Does it make sense to you?

If you want housekeeping CPUs to pull timers from isolated ones, then you
need isolated CPUs to eventually be part of the hierarchy (be "available"),
because they would need to propagate their global timers up to the top.

If they propagate their global timers then they must play the whole hierarchy
game and be ready to pull the timers from any other CPUs.

Because if they propagate their timers, they must also propagate their
idle state to synchronize with the whole hierarchy and know if there is
a non-idle housekeeping CPU to take care of their timers. And if they propagate
their (non) idle state, the isolated CPUs also declare themselves as available
to handle other's timers.

And working around that would be very nasty.

-- 
Frederic Weisbecker
SUSE Labs
