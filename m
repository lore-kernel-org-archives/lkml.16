Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D368217733
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 21:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747688498; cv=none; b=UInketdS4Kj2RoKTITPmcApJYUkww0E3ZvidimQEiNMYfWPIHQo/x2jZqE+QICbX9R/tWwX2OsQi9g97tBbChfOUHsKjRuPSHHPjSQbISFOOMdw0yCAjulpXB2wJ6VK7+3SbD+dV3VzXCHcSwu5rQ/vpbtWHXF9slaiNllzWs2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747688498; c=relaxed/simple;
	bh=XixqqRpjosG48i2+PvsQ5v+yrNqZcfiuvL820bhOgm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UbeomimG1ahfs5rof0jm/ebzPoG559lny+ph9YSaChMnyfe5bdpYjmAR1qIpLi+uYMG5Xjhwl9L+qv19yf3JCDfSsEbG8KGpEvWlzorZhuw3tV5NcxKSr3dwmxOKYMkImvsWYMxOTRZcvAMsXMpABK0yR9/n3p+apn54PR2MThc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=njwescSh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="njwescSh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0968C4CEE4;
	Mon, 19 May 2025 21:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747688497;
	bh=XixqqRpjosG48i2+PvsQ5v+yrNqZcfiuvL820bhOgm8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=njwescShl3J8q+voT2CHdV71X8obbaNmulLvx+jpoIMAVzhVduIdS61UtgO3Heqar
	 2gTyrxMewL3bijQ+Cp/GTD4g2ewjq7c2dSnKjujegZIHGMSxgpE+mtEN0y0gM2dsdG
	 U3RNgjaKVBvvZ5NGqnRsWr8yLRIEq871USajKdCQBtTcAerB1QUEiUguLdXMpG+6u9
	 mFu9zMgqOodoTmcn2Elji+/kDmz6FeWXZvdaR+9gOVb02T8ZtRn0KujPZU8q27FpnN
	 fK6QSr1lqm8+6uF2vcAtjFR7fthuh1MBt6V+fQVE5bdPEhBx8iGXu28bTdtTGkUWap
	 3NpTSyrAMHnAw==
Date: Mon, 19 May 2025 23:01:27 +0200
From: Alexey Gladkov <legion@kernel.org>
To: Jann Horn <jannh@google.com>
Cc: Chen Ridong <chenridong@huaweicloud.com>, akpm@linux-foundation.org,
	Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz,
	pfalcato@suse.de, bigeasy@linutronix.de, paulmck@kernel.org,
	chenridong@huawei.com, roman.gushchin@linux.dev, brauner@kernel.org,
	pmladek@suse.com, geert@linux-m68k.org, mingo@kernel.org,
	rrangel@chromium.org, francesco@valla.it, kpsingh@kernel.org,
	guoweikang.kernel@gmail.com, link@vivo.com, viro@zeniv.linux.org.uk,
	neil@brown.name, nichen@iscas.ac.cn, tglx@linutronix.de,
	frederic@kernel.org, peterz@infradead.org, oleg@redhat.com,
	joel.granados@kernel.org, linux@weissschuh.net, avagin@google.com,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	lujialin4@huawei.com, "Serge E. Hallyn" <serge@hallyn.com>,
	David Howells <dhowells@redhat.com>
Subject: Re: [RFC next v2 0/2] ucounts: turn the atomic rlimit to
 percpu_counter
Message-ID: <aCucJ9731YzaZI5b@example.org>
References: <20250519131151.988900-1-chenridong@huaweicloud.com>
 <CAG48ez2bFhYYj2qkJk3j5t=3VwYUH4sSMuohyC=MfrRw-bv22g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAG48ez2bFhYYj2qkJk3j5t=3VwYUH4sSMuohyC=MfrRw-bv22g@mail.gmail.com>

On Mon, May 19, 2025 at 09:32:17PM +0200, Jann Horn wrote:
> On Mon, May 19, 2025 at 3:25 PM Chen Ridong <chenridong@huaweicloud.com> wrote:
> > From: Chen Ridong <chenridong@huawei.com>
> >
> > The will-it-scale test case signal1 [1] has been observed. and the test
> > results reveal that the signal sending system call lacks linearity.
> > To further investigate this issue, we initiated a series of tests by
> > launching varying numbers of dockers and closely monitored the throughput
> > of each individual docker. The detailed test outcomes are presented as
> > follows:
> >
> >         | Dockers     |1      |4      |8      |16     |32     |64     |
> >         | Throughput  |380068 |353204 |308948 |306453 |180659 |129152 |
> >
> > The data clearly demonstrates a discernible trend: as the quantity of
> > dockers increases, the throughput per container progressively declines.
> 
> But is that actually a problem? Do you have real workloads that
> concurrently send so many signals, or create inotify watches so
> quickly, that this is has an actual performance impact?
> 
> > In-depth analysis has identified the root cause of this performance
> > degradation. The ucouts module conducts statistics on rlimit, which
> > involves a significant number of atomic operations. These atomic
> > operations, when acting on the same variable, trigger a substantial number
> > of cache misses or remote accesses, ultimately resulting in a drop in
> > performance.
> 
> You're probably running into the namespace-associated ucounts here? So
> the issue is probably that Docker creates all your containers with the
> same owner UID (EUID at namespace creation), causing them all to
> account towards a single ucount, while normally outside of containers,
> each RUID has its own ucount instance?
> 
> Sharing of rlimits between containers is probably normally undesirable
> even without the cacheline bouncing, because it means that too much
> resource usage in one container can cause resource allocations in
> another container to fail... so I think the real problem here is at a
> higher level, in the namespace setup code. Maybe root should be able
> to create a namespace that doesn't inherit ucount limits of its owner
> UID, or something like that...

If we allow rlimits not to be inherited in the userns being created, the
user will be able to bypass their rlimits by running a fork bomb inside
the new userns.

Or I missed your point ?

In init_user_ns all rlimits that are bound to it are set to RLIM_INFINITY.
So root can only reduce rlimits.

https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/kernel/fork.c#n1091

-- 
Rgrds, legion

