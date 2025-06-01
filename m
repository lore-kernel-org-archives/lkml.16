Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47784221DB5
	for <linux-kernel@vger.kernel.org>; Sun,  1 Jun 2025 17:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748800156; cv=none; b=Adsmu2tBAaPTWjDfkghRL46R+oXiMQyHv3/79uV3SjPEPkT7dkWBb3yXRjzaztdS1G81zCU6Ll9T2twRgDYMXhcfLu01lJhPZ3LRL9OFdCaktsjkEB9VDTz7f1TXNHuS4U7i/9r9geshZGrf+i9+CISq1+LcgvVIWDrTwcbPWZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748800156; c=relaxed/simple;
	bh=5G1399SFOSB9q2Ez4aTM97qbUvOUjohYUtc0md8n9mk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bKejZS5iCiOSEuj4lQCFrW3GGhAqYvDsnNtK9MReCYA6EgUAbSu0/ofqSMGYxl9CDtcGnLGBlsE2fK6IOJk3KrS1/txJcgRqMGTSlcLtIuP/Br27G8RGfeHhnJO/qKDgyFuMHq6vWWtkkSgByFjbMP8lN27V+aK9xIDb8ZI9n3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=h0BQXwfZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="h0BQXwfZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DE02C4CEE7;
	Sun,  1 Jun 2025 17:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1748800155;
	bh=5G1399SFOSB9q2Ez4aTM97qbUvOUjohYUtc0md8n9mk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h0BQXwfZG77oKLpG5wIl+1bYnlO6OQrhZ/PqiP7xt0aNtIvAtuCD0scUSg5Ms9nDT
	 7HEbXEnQRRMID0a02qUntM5gPsiKGEHxGkZW4oP4RthJzkabK/aW7VgiRHPvEPXg7H
	 9izusIAfhQ+acvP7iR8o21x6kYsDAc5lxDyQrasI=
Date: Sun, 1 Jun 2025 13:49:11 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org, 
	Eric Biggers <ebiggers@kernel.org>, Ingo Saitz <ingo@hannover.ccc.de>, 
	kernel test robot <oliver.sang@intel.com>, Marco Elver <elver@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Subject: Re: [GIT PULL] hardening fixes for v6.16-rc1
Message-ID: <20250601-wandering-graceful-crane-ffc0b7@lemur>
References: <202505310759.3A40AD051@keescook>
 <CAHk-=wj4a_CvL6-=8gobwScstu-gJpX4XbX__hvcE=e9zaQ_9A@mail.gmail.com>
 <156567EE-E5BB-43C4-B5A6-439D83FF387D@kernel.org>
 <CAHk-=wjktqa94u_=++YX7XxUr57iLAs1GqtHPOY-o-N0z7wyeA@mail.gmail.com>
 <202505312300.95D7D917@keescook>
 <20250601-pony-of-imaginary-chaos-eaa59e@lemur>
 <CAHk-=wgcQdD0UzMJrNhQuYAC2wgGtfrCry_iokswaEE5j7W9YA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHk-=wgcQdD0UzMJrNhQuYAC2wgGtfrCry_iokswaEE5j7W9YA@mail.gmail.com>

On Sun, Jun 01, 2025 at 10:12:02AM -0700, Linus Torvalds wrote:
> > Yeah, this is danger territory, because you're asking to update a random
> > commit in the tree history.
> 
> So the *real* danger territory is lying about committer information.
> That's the thing that *no* standard too should ever do, and what made
> me so upset.
> 
> Konstantin, can you please fix b4 to never *ever* rewrite a commit
> that has different committer information than the current user?

Yes, I will add that safety check in for sure. This is one of those scope
creep situations -- the trailers command started out as a way to apply
trailers only to your own curated series, e.g. before submitting a vN+1, but
it was then hacked to also work on arbitrary trees, without properly
considering all possible implications.

> I don't think this is about "39 commits down". This is apparently b4
> just doing plain bad things, adn it would be bad even if it was only
> rewriting the top-most commit.
> 
> Setting authorship to somebody else is normal and expected: "author"
> is about giving credit.
> 
> But setting *committer* information to somebody else is not about
> giving credit, it's about lying. Tools that do that are broken tools.
> 
> I'm also not clear on why apparently the script tries to retain
> committer dates. That's also just plain lying.

It's working as designed, I'm afraid -- git-filter-repo is a powerful tool
for rewriting git history and will happily fire off even when you are pointing
it at your own two feet.

-K
