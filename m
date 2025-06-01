Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6356E81749
	for <linux-kernel@vger.kernel.org>; Sun,  1 Jun 2025 17:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748800709; cv=none; b=r1rdp1ZyF9TE68g2M1HnQJeK6oRFQjbF6Db4l1hy7G5eax7O6eRHgf7XhTma0F3JtceYWUxEU3jFF4aKOsVw1X571HyEzzWajWt2zTYB1WvrwcHtIoJw51gux76xLXwWP7oPJPC+JkRGmIgZPeldRQfWQP3fRZ6i8G7G/LWzZy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748800709; c=relaxed/simple;
	bh=cA569BPCjFunk07O8huSU8zvqfYvcHXxLn18zxeoVGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pGoJAWjOY93E9WbCBzUNcIJLNtBOyLpXbSe/aa20bF6C+elUwTkPCviyPX6ycPiGWj4RFwY/vNX0ePI+3vPEt9DvPSK92OTvDJJEOyx3LTJbQJy1d5UT43pkEGtojfMR6Ke0PJwxpMvYmXxAjtRpLGgVoaBWeVQAxLgvckQbRRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ThzHBIFk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ThzHBIFk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60956C4CEE7;
	Sun,  1 Jun 2025 17:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1748800708;
	bh=cA569BPCjFunk07O8huSU8zvqfYvcHXxLn18zxeoVGo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ThzHBIFk/ma+B0/K9vYSkOXKEGtz8xSLFshAWKIPSoDfWNXd04d8o4DZiNF7d+lkb
	 Z9TVcYXizxtlTF6WQ2Tlgtioxw8TRmJl06/KWmUD4QcgpZGYZcpZ4aTMpEki+GofE+
	 P7kHu3LNSmQxbY7qRLgGSqdQHK3KFW37gVO49hB0=
Date: Sun, 1 Jun 2025 13:58:27 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Kees Cook <kees@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@kernel.org>, 
	Ingo Saitz <ingo@hannover.ccc.de>, kernel test robot <oliver.sang@intel.com>, 
	Marco Elver <elver@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Subject: Re: [GIT PULL] hardening fixes for v6.16-rc1
Message-ID: <20250601-electric-olivine-wren-d8c5ca@lemur>
References: <202505310759.3A40AD051@keescook>
 <CAHk-=wj4a_CvL6-=8gobwScstu-gJpX4XbX__hvcE=e9zaQ_9A@mail.gmail.com>
 <156567EE-E5BB-43C4-B5A6-439D83FF387D@kernel.org>
 <CAHk-=wjktqa94u_=++YX7XxUr57iLAs1GqtHPOY-o-N0z7wyeA@mail.gmail.com>
 <202505312300.95D7D917@keescook>
 <20250601-pony-of-imaginary-chaos-eaa59e@lemur>
 <202506010833.A33888CC@keescook>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202506010833.A33888CC@keescook>

On Sun, Jun 01, 2025 at 08:38:10AM -0700, Kees Cook wrote:
> > I don't yet know why it wants to rewrite 39 commits when we're updating a
> > commit that's only 3 away from the tip. If you manage to rerun this with b4 -d
> > and send me the output, I will be glad to look at it. Alternatively, if you
> > can let me know the steps to get my tree in the same state as yours, I can run
> > it locally.
> 
> This shows the same problem (using Linus's tree and linux-next):
> 
> $ git checkout 9d230d500b0e -b test/repro/before
> $ git cherry-pick 368556dd234d
> $ git cherry-pick eef1355c269b
> $ b4 trailers -u https://lore.kernel.org/all/CANpmjNPpyJn++DVZmO89ms_HkJ0OvQzkps0GjCFbWkk0F+_8Xg@mail.gmail.com

Thanks, I was able to recreate it and will use it as my test case. I suggest
that until I have a fix in place, that you always use `br trailers -u` with a
`--since-commit` flag, to restrict the range we're looking at. The solution
I'll work on is to iterate the range of commits we get back and further
restrict it to just the contiguous range matching the current committer, going
backwards from the HEAD. This would have avoided the problem by restricting
the commits being considered to just the handful that were cherry-picked on
top of the latest merges from Linus.

-K
