Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD72199BC
	for <linux-kernel@vger.kernel.org>; Sun,  1 Jun 2025 18:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748804223; cv=none; b=AAHckK/nnDi7dbUteWoZ683EIKLpF28OKvzMnyLQCH5XoR4tTEFM8QxBFIFaDS017gjIrEwQIay14B0ZwQLJ1CHrwAVt+T8Ys2sTx++d3sLacVmkt2AekliC0Olg8Yu3DkR2jeZpK2bkf/2UtsjtrPX3YiNu7u6weAOELp3awCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748804223; c=relaxed/simple;
	bh=MIMYywNVcI819AtSgNn5olntXGqWsyjspYZRhWjZJu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mpcPg1npQCi+P+Ay+o2wL2Q1oRdlllp6CKOdE3eyCKxCJde/wR0OAM9DntMOAorsyz88MzU2CV9uSLe4EsblPJyYsASeyPjwfWEZkMNVuRDiBOPM1mYR1npU19IB4qXSbiRYtbsVTTdpEqXCMwhRvwvOmjVKdJTXCTLBmFJ9B0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TNCTb4R2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TNCTb4R2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B32BFC4CEE7;
	Sun,  1 Jun 2025 18:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748804222;
	bh=MIMYywNVcI819AtSgNn5olntXGqWsyjspYZRhWjZJu0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TNCTb4R2RzZ/KfBhKn0POEx5q1fblEWS+lpbe7QINESwU8s+hXswzZjOKxZAbc7YJ
	 mzhOoYEmrEZBHjen4f0NWyO7V7P+JlaftlHKugyikrZD3cq1si0i6xtWRFOwA3J8VV
	 2GxenzrIFRcxnxHiMYD5kCZAwTAAfeKGSgckrCXNaHWVA/SxFZFKWrfuu4D4+kVkeh
	 WGWpn0Rt9TzQVjx+/ulaj1OB+TiRDdLRIz8A9i8lF72vF80VdFgbpwXqXNALhny40a
	 i15NToevtfRzUGR+wKS3RWkfGubU5stXkzwZ+NCBXbEyChrXXoEjx28kTZVjZAWdWn
	 Or222WnQz9r8A==
Date: Sun, 1 Jun 2025 11:56:59 -0700
From: Kees Cook <kees@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@kernel.org>,
	Ingo Saitz <ingo@hannover.ccc.de>,
	kernel test robot <oliver.sang@intel.com>,
	Marco Elver <elver@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Subject: Re: [GIT PULL] hardening fixes for v6.16-rc1
Message-ID: <202506011152.6D1E4F33B@keescook>
References: <202505310759.3A40AD051@keescook>
 <CAHk-=wj4a_CvL6-=8gobwScstu-gJpX4XbX__hvcE=e9zaQ_9A@mail.gmail.com>
 <156567EE-E5BB-43C4-B5A6-439D83FF387D@kernel.org>
 <CAHk-=wjktqa94u_=++YX7XxUr57iLAs1GqtHPOY-o-N0z7wyeA@mail.gmail.com>
 <202505312300.95D7D917@keescook>
 <20250601-pony-of-imaginary-chaos-eaa59e@lemur>
 <202506010833.A33888CC@keescook>
 <20250601-electric-olivine-wren-d8c5ca@lemur>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250601-electric-olivine-wren-d8c5ca@lemur>

On Sun, Jun 01, 2025 at 01:58:27PM -0400, Konstantin Ryabitsev wrote:
> On Sun, Jun 01, 2025 at 08:38:10AM -0700, Kees Cook wrote:
> > > I don't yet know why it wants to rewrite 39 commits when we're updating a
> > > commit that's only 3 away from the tip. If you manage to rerun this with b4 -d
> > > and send me the output, I will be glad to look at it. Alternatively, if you
> > > can let me know the steps to get my tree in the same state as yours, I can run
> > > it locally.
> > 
> > This shows the same problem (using Linus's tree and linux-next):
> > 
> > $ git checkout 9d230d500b0e -b test/repro/before
> > $ git cherry-pick 368556dd234d
> > $ git cherry-pick eef1355c269b
> > $ b4 trailers -u https://lore.kernel.org/all/CANpmjNPpyJn++DVZmO89ms_HkJ0OvQzkps0GjCFbWkk0F+_8Xg@mail.gmail.com
> 
> Thanks, I was able to recreate it and will use it as my test case. I suggest

Okay, great.

> that until I have a fix in place, that you always use `br trailers -u` with a
> `--since-commit` flag, to restrict the range we're looking at. The solution
> I'll work on is to iterate the range of commits we get back and further
> restrict it to just the contiguous range matching the current committer, going
> backwards from the HEAD. This would have avoided the problem by restricting
> the commits being considered to just the handful that were cherry-picked on
> top of the latest merges from Linus.

Yeah, that would solve my use-case entirely. I actually thought that's
roughly how it was already working, and it has worked for me fine before
this, so I'm not sure what was different here for it.

Thank you!

-Kees

-- 
Kees Cook
