Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FDD231856
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 23:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747439714; cv=none; b=sunVNPLQISZJhvrSKB/n/TlLgsYIc7lynPxWy9HPParCbbqYZb3eXsKXFnXyyaY6tENVsYk3EAouWg6qbVf7eXMKlTM1bSQi3+TOyWxetk7JjDfUKP5z+0VSMmfF7Cmvoz/iLQru4BU1/4cOI+fQ4z1ojtWLvuadZ0LMEuN0AvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747439714; c=relaxed/simple;
	bh=Pmrs3YtR+8uHw+Xhv5T/KJy1yN833vO/VdMql11vq2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PjEBLE2RblqioaVxXywcx10qeffydHYZvfa11tA3xK4a9cT3/EU9J5rbH6qp/FRkwmv+vT6r/p52QilmvN8XnZPdBL67h1IPjNaejc35T0oomT8W6C2nqgu5B5kk/UvdsRGaofvBKZrWyIfsgteCCvNkn6ddp/RH08Re/4bbIlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=Z/MmDALx; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="Z/MmDALx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=bwbGl9ljDPJOyozHAfIOsfkTHOvkwPpRcGdW6147QLs=; b=Z/MmDALxRFkcjCJbKoYot+1t/B
	mWbWxB0jOqmd25LyHkcHepahdH0vXzw8/hSXMUHtb1OwovLif+SIi7ic7V0RO8cu8nCyK6tM3u3VF
	NdkgHxPlUR96F0+kAKyeC+9OJXAkHDn8qdQAV6MBlH5PVtEyr3od4AXf0Obz7WUMloXtW5PXfpSo1
	sV7fyvt+c1TFUbURBgIzkncmxZFlQTtv8n+ky7v1qsQ0VTkWLMwRI3E6LKCro0qcPCdyCLxWggEpO
	FZWPgT1v9rsXMBpoejNxEQoCMocQuXLHSZLpqHHmJHOxJi+CdxLqpDG7IAKJgr2U+LMUGv2TjCTe3
	MmTEydRQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG4tR-00000003wPv-3sXw;
	Fri, 16 May 2025 23:55:10 +0000
Date: Sat, 17 May 2025 00:55:09 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Ozgur Kara <ozgur@goosey.org>
Cc: Christian Brauner <brauner@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Jeff Layton <jlayton@kernel.org>, Song Liu <song@kernel.org>,
	Joel Granados <joel.granados@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kernel: fix acct.c first test openai codex
Message-ID: <20250516235509.GU2023217@ZenIV>
References: <01100196db61ea58-123409dc-7381-487b-91b6-166193f3f349-000000@eu-north-1.amazonses.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01100196db61ea58-123409dc-7381-487b-91b6-166193f3f349-000000@eu-north-1.amazonses.com>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Fri, May 16, 2025 at 11:15:49PM +0000, Ozgur Kara wrote:
> From: Ozgur Karatas <ozgur@goosey.org>
> 
> Hello,
> 
> i want to try out the openai codex and it seemed like a logical
> process so with rcu_read_lock() a protection is started but we dont
> call rcu_read_unlock(); it has to be called to end rcu read lock.
> 
> I guess, this means rcu stays open forever and data structures are not
> cleaned which causes performance degradation.
> 
> Regards
> 
> Ozgur
> 
> Reported-by: Ozgur Karatas <ozgur@goosey.org>

... showing that one needs *something* that would be able to reason somewhere
in the loop.

Your "I guess, this means" is an excellent example - you've got something
(openai codex, visual examination, whatever) pointing you to unusual pattern -
rcu_read_lock() + call of function with no rcu_read_unlock() in sight.

Next step: hypothesis that unlock might be missing.

Next step: blindly send a patch adding an unlock on the strength of that
hypothesis?

Sorry, no.  It's not just that hypothesis is wrong - it is, but that's not
the real issue.  It's that instead of
	* asking how the hell could that work
	* trying to trigger that and checking whether the hypothesis is
corrent
	* looking around for similar places to see whether it looks intentional
(in which case it still might be a bug, but if it's inconsistent, the odds of
a bug are going up)
	* looking through the history (e.g. with git blame) to see if there
might be any explanations in commit message
	* looking through the function in question (git grep would immediately
point to fs/fs_pin.c, and the first glance would show rcu_read_unlock() on
all paths through it, with the total balance of lock/unlock being -1 on
each)
you've chosen to post a patch "fixing" the problem as a way to see whether
it's actually there.

Folks, programming tools can be very useful in directing to places that might
be worth checking.  The codebase is huge, so any heuristics useful in triage
are Good Things(tm); if instead of "bug found because somebody looked at
random line picked out of millions such and it turned out to be broken" you
have "bug found because such-and-such heuristic had picked that line as
odd-looking and it turned out to be broken", you win even if it lists
20 places and only one of them turns out to be actually broken.

But you really can't treat that as anything beyond a hint to bump that
particular place in the list of things to look through.  It might tell you
what looks unusual, but that's it.  Same as with any warning from any
source.

Asking around is fine; so's experimenting, so's reasoning, etc.
But you can't go from "tool gives a warning, I guess it translates into plain
language this way" to "modify that place so that the tool doesn't point to
that place anymore".  You really need to understand what's going on first.
