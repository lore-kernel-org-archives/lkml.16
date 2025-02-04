Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5512321ADC2
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 21:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738705198; cv=none; b=dVHeCFSwmTYU/WXbUWccp3gEOwsZEbZrCWL36A7aRX3J3tCPkGTOI36I7ZLqCHRxpHldYifWrtHrU0egRL0+mGAmXvBqmgW457hZiT+esSOMIhRG8ZgZykSKWtwK5LkTc9d/kGLQT6AZx1Yblle7KtytVTAUNMLX5h1+5NGOqps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738705198; c=relaxed/simple;
	bh=LX2XkUQcsuseCFIiIi1BnovLHqiSgTtXxJbseCDXGCw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RGmk2vLZ0ZTPQKs1hqNwEvMVjQBsAHEYsPZtHvNo00AVRihYBf9GWxb/McuVV7pKHkWGky6bX30ISd8+ThtP0wZFGxzDS4TrorVzqCFUCbxEyVVGPGyLqOpjbvwbWRyNljxzjKCsSRRyiDzdONvFQHDx+aQESw7XL4krFF4Su84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jMWWJHsY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jMWWJHsY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C29DC4CEDF;
	Tue,  4 Feb 2025 21:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738705197;
	bh=LX2XkUQcsuseCFIiIi1BnovLHqiSgTtXxJbseCDXGCw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jMWWJHsYc4d0wjp563TO0qp6fVF9ZRpWk6+We13gPZ82QNUGRhd3lCnsrig7qtUka
	 x+jnIEL1a8g/TYYr0M2CkpQq9uejxLdRU+r1ilgKME5WlIdYmR6X1AT94hMzHzb0fg
	 R3fzEg0daf+YfO29YndrjhD2ByEIqzFXY608Au584jAOPP1YZdjHoSw7sCeyDHyk12
	 Jc3iTFT5NGv+yxX+frUK2NTbDGHDApzbjsJT3jYf6Vm/kgxYYIUvysqIYNdYiIRvBU
	 XlLnIAsguZe4xmQU+g6SzNiNXhqi3h9qfswzQQL3OVpO3btdT4ZvdxuuTeA0cpcxWF
	 VnFaAE5U84xRw==
Date: Tue, 4 Feb 2025 22:39:54 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] kthreads fixes for v6.14-rc2
Message-ID: <Z6KJKul1JUIpHl0O@pavilion.home>
References: <Z6JjZMdbDoAX_AVW@pavilion.home>
 <CAHk-=wiPQ8PTWZuWXw8s+OLNmgXSM3+DxmY=uKd4F-Nnu4TB9A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHk-=wiPQ8PTWZuWXw8s+OLNmgXSM3+DxmY=uKd4F-Nnu4TB9A@mail.gmail.com>

Le Tue, Feb 04, 2025 at 11:06:57AM -0800, Linus Torvalds a écrit :
> On Tue, 4 Feb 2025 at 10:58, Frederic Weisbecker <frederic@kernel.org> wrote:
> >
> > - Properly handle return value when allocation fails for the preferred
> >   affinity.
> 
> Well, we have exactly one caller of this function, and that caller
> doesn't actually care about the return value.
> 
> The function is literally the "preferred" affinity. If the affinity
> setup fails, it's harmless.
> 
> Anyway, the fix doesn't look wrong, and I've pulled it, but it's just
> all very harmless. I think the "set but not used" error could have
> been fixed by just removing the 'ret' variable entirely.

Right, I wanted to be able to reflect failure just in case but the
point of doing it is certainly debatable... Thanks for pulling it
anyway!
