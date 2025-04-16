Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF011AB6C8
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 21:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744839720; cv=none; b=WtofAceMn5y/oDdvBdVbh4Z3lXmYig51ysY8qDwBiBGU5R5OXh+NAcR+YUyxvErJWH0K22HGx4iXiOwFz5sxFqRfL/UtWTqXru+1G9LPgt6gyBIxONwTYwSUYcTqhQhPi3UX8PvnOEIvUZo88FxDKCrXZj10V4EE4l1XrBoJYqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744839720; c=relaxed/simple;
	bh=XCdOcQEZc9PG1o+zfCdjOrmcdumnesOz8svct6bFE0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qIrpRI4YCvyf/01QRbKiMvkDIDTDJvVuf3/meKjJ0pz7wYlFsd15unwGtcVU9uVcHCvB2Gs3nsHWMvDWwzNj9HUgA/ifXPKWsXQKZDznzJEDV3gVsfh3N27Mg9UBNsdcZX55eyfq6/ljxHIWAAxJHI25fDW5ux8Nkz4eA6X4ehU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=TnpSRohv; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="TnpSRohv"
Date: Wed, 16 Apr 2025 14:41:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744839714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lQ4a6LHXoovJFQaVdf4R8kKy+xM0wyq7BBI6Gmk3E6c=;
	b=TnpSRohv1mLWeuskafjsBMrJHSJQj+NKjDKV+Ji0i2mkp4R/kQeHC0IwK0OCkTL+J7kc4Z
	FTGY2QJEiZNkVkkt96jL1S8DfnqpgyghphnOmWVPl3SBAfOQd8oA0+6+VQIds8OVQnptAo
	vHAyLgR2C5tUBpcaMqvKfj2+SWZzwAg=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Suren Baghdasaryan <surenb@google.com>
Cc: Usama Arif <usamaarif642@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, hannes@cmpxchg.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH] alloc_tag: introduce Kconfig option for default
 compressed profiling
Message-ID: <72pac6pkjebt6xo7engiuuu7r3zr7fu6fh6bj77f22m7gslxgr@3gjawofplas2>
References: <20250416180653.3438158-1-usamaarif642@gmail.com>
 <CAJuCfpEKrX+1_SJ5fOyT6JLDSNcDxjcfBMj9_siVZt-rX5WQ=w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJuCfpEKrX+1_SJ5fOyT6JLDSNcDxjcfBMj9_siVZt-rX5WQ=w@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

On Wed, Apr 16, 2025 at 02:08:31PM -0700, Suren Baghdasaryan wrote:
> On Wed, Apr 16, 2025 at 11:06 AM Usama Arif <usamaarif642@gmail.com> wrote:
> >
> > With this Kconfig option enabled, the kernel stores allocation tag references
> > in the page flags by default.
> >
> > There are 2 reasons to introduce this:
> > - As mentioned in [1], compressed tags dont have system memory overhead
> > and much lower performance overhead. It would be preferrable to have this as
> > the default option, and to be able to switch it at compile time. Another
> > option is to just declare the static key as true by default?
> > - As compressed option is the best one, it doesn't make sense to have to
> > change both defconfig and command line options to enable memory
> > allocation profiling. Changing commandline across a large number of services
> > can result in signifcant work, which shouldn't be needed if the kernel
> > defconfig needs to be changed anyways.
> 
> The reason tag compression is not the default option is because it
> works only if there are enough free bits in the page flags to store a
> tag index. If you configure it to use page flags and your build does
> not have enough free bits, the profiling will be disabled (see
> alloc_tag_sec_init()).

Is it possible to fail the build in that case i.e. check the page flags
availability at build time?
