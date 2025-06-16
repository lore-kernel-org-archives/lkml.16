Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1111D264A9D
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 13:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750079076; cv=none; b=LQDAukNFpzCkmcBSSKs8rbkIi+oONQ2TYzx0k/5xI7lIIm/GoR/pMc5RLstBF0UUDt8KV2/TjnxFgESHRQUT3G0leWBlKl3CIjI8KYnQ3pugbEIQmNdmpNRsrXeKwO2MBiAKA5k3SAX4bhJN/ktZbggO4klKLdAXr3F3xkcbSvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750079076; c=relaxed/simple;
	bh=zHbMFFZVSC+9mYWwl+ZnIqnXkE0H7Syzj52sA71Hc7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UwlrxrHHCCEOZ/ZicZhJs3PQV9uzSjEYkizDMoDLWU7VzEG4Dtp0MZdvjraeBJ3A0pAoZa2sjMwjgbjoT5eKGIPV59B8gw8GjpFKMQyIEkYIbhgO0oPFnRDhiBxe9xOn5qQYgRvS/SOIM707E1QIldpAk/x3rPbGB5Uk/nP9A2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F6e++47j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F6e++47j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDB58C4CEEA;
	Mon, 16 Jun 2025 13:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750079074;
	bh=zHbMFFZVSC+9mYWwl+ZnIqnXkE0H7Syzj52sA71Hc7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F6e++47jRjOTEKMojSWfxy4BXsc5FnCI45X3HhCloXgAoL1d3aw2f+fWHXqiIvqmv
	 XbeRTDjr/hyIKh+JruaPMVj52wY1R+gl/zHqyrBC9ePKXB0+GT/8OCkM4bfP4qIwA4
	 oaMGoxD33QHnA7QirPkV+rb0O64OXRSnunDN/6nmHpVIhl6X40Y3Tqcccdvxrp9qeW
	 I552UpE3EuJ0V1q+DoAxkyxVxENwni+Mab8hxCDxBa+rknXWoN5z5x5TiB3q1pJ8XV
	 3X8PSja3rqBcQpFGsowVoQoXaUu+lrIGTx+T1/XDoHy84CTQGVsw8jCX3AuE90uVxK
	 65RbXv34xwiNA==
Date: Mon, 16 Jun 2025 15:04:29 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	Philipp Stanner <phasta@kernel.org>,
	Matthew Brost <matthew.brost@intel.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/sched/tests: Make timedout_job callback a better
 role model
Message-ID: <aFAWXTjuhYjMlAR9@pollux>
References: <20250605134154.191764-2-phasta@kernel.org>
 <e1b65491-781c-48f7-9368-58d7ede91b12@igalia.com>
 <aE_8lDuMFFhJBeUY@pollux>
 <723c98e2-cf75-4565-b78b-711b3022d44d@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <723c98e2-cf75-4565-b78b-711b3022d44d@igalia.com>

On Mon, Jun 16, 2025 at 09:49:46AM -0300, Maíra Canal wrote:
> Hi Danilo,
> 
> On 16/06/25 08:14, Danilo Krummrich wrote:
> > On Mon, Jun 16, 2025 at 11:57:47AM +0100, Tvrtko Ursulin wrote:
> > > Code looks fine, but currently nothing is broken and I disagree with the
> > > goal that the _mock_^1 components should be role models. The idea is to
> > > implement as little in the mock components as it is required to exercise the
> > > tested functionality.
> > 
> > No, please consider the following.
> > 
> >    1) When we write tests for common infrastructure we should be testing things
> >       as close as possible to how we intend real code to use this infrastructure.
> >       Relying on internals in creative ways is likely to underrun this testing.
> 
> Regarding unit testing (and KUnit is a unit testing framework), the core
> principle is that individual components of the code should be tested in
> isolation to validate that they perform as expected.
> 
> The "units" should be tested independently and we use those mocks to
> simulate dependencies, ensuring that the test focuses solely on the unit
> under scrutiny.
> 
> If we introduce more things into the mock, we end up losing the
> isolation. The mock scheduler, from what I understand, is not suppose to
> be a reference design or even something close to a driver.  It should
> remain just a mock, a minimal interface to test the scheduler's
> internals.

Nothing of what you say seems contradictive to what I say, no?

I'm just saying that while we're doing all this we can (and should) still try
to be as close as possible to how we intend real code to use the corresponding
APIs.
