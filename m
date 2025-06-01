Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1237CA935
	for <linux-kernel@vger.kernel.org>; Sun,  1 Jun 2025 05:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748756560; cv=none; b=P2vEiY3xM6FBrjwL04C4UX9lzYjZokozkUtMpRvhvVqpuGFuXx56i1y3qILfHA8ZdGMD2SiD94JB8Y+yzl0bJBcWAWZHRC0c3IqB+MH7ibVkr66N0naLG2bLxC0y/wQNemjtcXvgEN34DOcytiCuEkMFn4e8GpNQb8PX5eiGTDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748756560; c=relaxed/simple;
	bh=vhOM7AVoN1u0Xpu7kHuwRl7GU9jtI4fWMup5Mie84jU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fwzHaAgNYfqLwVxCnDHxaNdcVpJoSFM6vlh1j9KchG7XeK+4vq88Vh3XaDqqELYUapSXiCtZYO5YYIziMa5uvYlHtRh4PAIann83JrG9CqrGZxHLY6ORGe7YGS4nHtppIFbq6LtAg4OmsEkxGLsu2VopL8oKrqd2svlJWYgq3xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mZLyvUL7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mZLyvUL7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D197C4CEED;
	Sun,  1 Jun 2025 05:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748756559;
	bh=vhOM7AVoN1u0Xpu7kHuwRl7GU9jtI4fWMup5Mie84jU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mZLyvUL7TbMMOM1qu57wM8rNsYKmffgAKLY3xbxxOmjdrsOjDpzwXzt8/jQrc5BTp
	 +Hj2D9fxsU86df+/I/sqAr8Eu81rZtmO0X1HKvWmdc7JGU5Uti8iHqjnsgkRkioqrj
	 LLprd2e4g0ZddNynbAXJfVMzEv8q8HGzyFli0qz7uEnTW/MCJQPIlUFivhWsLto2v2
	 IYOETKXCCW2NpERLY9BrtSoUrKf7sve0vX1/Rse+zwJ0uY7vd6SLPNTLb8A0FAXh1l
	 eY+Sg8lPy7tKBlGkoWxZvPFeFjXva+O9QRseU83z3BDYFhXDWBmzzG/3mcDwwDNJ1/
	 LZX2KCY4hu4IQ==
Date: Sat, 31 May 2025 22:42:36 -0700
From: Kees Cook <kees@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@kernel.org>,
	Ingo Saitz <ingo@hannover.ccc.de>,
	kernel test robot <oliver.sang@intel.com>,
	Marco Elver <elver@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Subject: Re: [GIT PULL] hardening fixes for v6.16-rc1
Message-ID: <202505312229.DE917E6D@keescook>
References: <202505310759.3A40AD051@keescook>
 <CAHk-=wj4a_CvL6-=8gobwScstu-gJpX4XbX__hvcE=e9zaQ_9A@mail.gmail.com>
 <156567EE-E5BB-43C4-B5A6-439D83FF387D@kernel.org>
 <CAHk-=wjktqa94u_=++YX7XxUr57iLAs1GqtHPOY-o-N0z7wyeA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wjktqa94u_=++YX7XxUr57iLAs1GqtHPOY-o-N0z7wyeA@mail.gmail.com>

On Sat, May 31, 2025 at 07:35:45PM -0700, Linus Torvalds wrote:
> On Sat, 31 May 2025 at 18:06, Kees Cook <kees@kernel.org> wrote:
> >
> > I have no idea. I had noticed a bunch of my trees were refusing to have sane merges.
> 
> The rebased history would explain that, but the reason I'm upset about
> it is that I don't even see how that rebasing could possibly happen
> "by mistake".
> 
> Any normal git merge rebasing should re-write the committer. So to get
> the kinds of rewritten history that I saw, it almost has to be
> intentional. I don't see how that has happened by mistake.
> 
> At a minimum there is some truly effed up scripting going on.

Well, I didn't do it on purpose. I think I have an established track
record of asking you first before I intentionally do stupid things with
git (like the recent prefix collision PoC[1] that I privately emailed
you about).

I'm trying to figure it out now. I must have shot myself in the foot
somewhere, since I had a number of "by hand" things going on this week.
My current guess (while AFK) was that something went sideways while
trying to rebase my for-next/hardening vs my for-linus/hardening trees,
since I had, at one point, based my for-next on
9d7a0577c9db35c4cc52db90bc415ea248446472 (1 commit past v6.15-rc3) since
I was still working on -Wunterminated-string-initialization patches.
(Normally I exclusively base on -rc2.) Then I had my SSD failure, but
things seemed okay after that, but then when I built the
for-linus/hardening tree I rebased patches that were on top of for-next
over on to latest "master" because basing it on 1 past rc3 seemed weird.
It was around here that I started having problems.

But like I said, I'll see if I can reproduce it. I have a lot of
scripting to sanity check my pushes, and I (stupidly) overrode them
because normally they get angry when I'm not basing on rc2, etc. But
I've never had anything like this happen.

-Kees

[1] https://people.kernel.org/kees/colliding-with-the-sha-prefix-of-linuxs-initial-git-commit

-- 
Kees Cook
