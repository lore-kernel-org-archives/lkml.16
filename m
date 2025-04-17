Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB751D0F5A
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 15:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744904860; cv=none; b=G11HJ4z294btslkSwaEmriaWh3Jl04CfObGfk1hzoWt38zUicOl1yWVkejAh8MvS2y+j4Zzqv5sYGai32Lc2dVW77g+XiZGn8DIzwDOKm7cAd1h/Kh6eLEsaTS6Qvro+E+h9iFpJ14ZnytYqFckSIFMUheDkkXXLc72dr9Q6dew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744904860; c=relaxed/simple;
	bh=ocQ5N05ShmmAm8SFnneZNMhIamNVol7C1uCXDxHEM48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O2TFZf9CfTz7fo1b0aBM16N3TB0sMI/kySax0hGamGTsRFOgjJ+umUPyiAZtA2PpB9FYUlmt7woFKlWcVtj22FEATDstWUPzIgrH0AYHknclHPrDIgFOql7/pAx8uth2RWojm4tGMXOAaXUim5NsIhrW9lWRt3+71I0iEy+hyBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=NeKPW5hX; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="NeKPW5hX"
Date: Thu, 17 Apr 2025 08:47:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744904855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ruQFE5xpLxHt7Tvqwi04Crgxry1+Hia7D//3nhNyUoA=;
	b=NeKPW5hXB3l+LWhLZUmxufOB5QDEo+o0ITy+ugUnSf/O+vSGslykC7ZXDOBTPwWV4jOFNf
	GUoI9mIMtMaFZOCwJMQT51GrKKvJ+mKdg0b8MlffV1TaONcK0uBDg3CEFvaR8PQ/DpetwZ
	Py0ZUsbBCW22jex/W0tNpNwxIhzuUkw=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Suren Baghdasaryan <surenb@google.com>
Cc: Usama Arif <usamaarif642@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, hannes@cmpxchg.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH] alloc_tag: introduce Kconfig option for default
 compressed profiling
Message-ID: <ogiahgnqihzg6nfew6oifgzjvetiwo25utp6jwskrhw4axdevp@rwqbgeraivym>
References: <20250416180653.3438158-1-usamaarif642@gmail.com>
 <CAJuCfpEKrX+1_SJ5fOyT6JLDSNcDxjcfBMj9_siVZt-rX5WQ=w@mail.gmail.com>
 <72pac6pkjebt6xo7engiuuu7r3zr7fu6fh6bj77f22m7gslxgr@3gjawofplas2>
 <CAJuCfpHcUfXb8RaGCExLc5U2HK3xcA0CjY1diM=S6DDqNFFykg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJuCfpHcUfXb8RaGCExLc5U2HK3xcA0CjY1diM=S6DDqNFFykg@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

On Wed, Apr 16, 2025 at 05:11:11PM -0700, Suren Baghdasaryan wrote:
> On Wed, Apr 16, 2025 at 2:41 PM Shakeel Butt <shakeel.butt@linux.dev> wrote:
> >
> > On Wed, Apr 16, 2025 at 02:08:31PM -0700, Suren Baghdasaryan wrote:
> > > On Wed, Apr 16, 2025 at 11:06 AM Usama Arif <usamaarif642@gmail.com> wrote:
> > > >
> > > > With this Kconfig option enabled, the kernel stores allocation tag references
> > > > in the page flags by default.
> > > >
> > > > There are 2 reasons to introduce this:
> > > > - As mentioned in [1], compressed tags dont have system memory overhead
> > > > and much lower performance overhead. It would be preferrable to have this as
> > > > the default option, and to be able to switch it at compile time. Another
> > > > option is to just declare the static key as true by default?
> > > > - As compressed option is the best one, it doesn't make sense to have to
> > > > change both defconfig and command line options to enable memory
> > > > allocation profiling. Changing commandline across a large number of services
> > > > can result in signifcant work, which shouldn't be needed if the kernel
> > > > defconfig needs to be changed anyways.
> > >
> > > The reason tag compression is not the default option is because it
> > > works only if there are enough free bits in the page flags to store a
> > > tag index. If you configure it to use page flags and your build does
> > > not have enough free bits, the profiling will be disabled (see
> > > alloc_tag_sec_init()).
> >
> > Is it possible to fail the build in that case i.e. check the page flags
> > availability at build time?
> 
> The difficulty is finding out the number of allocation tags in the
> kernel before it gets built. Maybe there is a way to add an additional
> post-build stage to run that check.

Yeah that would be good to have.

> But even then making this option
> default and causing build failures does not seem like a good idea to
> me but maybe I'm being too cautious?

Oh my question was orthogonal to the patch. Basically some users may
want build time guarantee for this and they can enable such
build-failing opt-in config/check.
