Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9132323506E
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 07:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747812562; cv=none; b=LZMYcJxmcYatu0MCq39YEXV+W2EyF1OG3ZA7YIv3Ix+FKMuiWQYotxTNl0xSjN4EkwQiGmSImJS4NKfz7jAm2oB38mF3tqtv59QMm60z3zMYstPf0p0q4GQbC31JxOZsid1mwD9nOSTW0/GGEGRNMFk1bVZhVapItQEzC3tNP4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747812562; c=relaxed/simple;
	bh=voGPLbPeWldljp2/xrSsWfXMeeq9v3Xxq3Z0djb2A88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G/kvWtQyRUYoyiCdl5pzVRF+4b4tjlqBUIpDSjI4UYahWUWpEpSV/IT4tGGuVFVhWsvOnuSAAk6QuFEsvSEmVZ5H1VfRaWVmgMFDQEheuXKoou+NPMwroeE0KtwNtn2kKVw7g7OfwDrM29G+DkRc4pvtqwZd/GWm/zUFR4rkqHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AWuI1uf7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AWuI1uf7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04C0DC4CEE4;
	Wed, 21 May 2025 07:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747812562;
	bh=voGPLbPeWldljp2/xrSsWfXMeeq9v3Xxq3Z0djb2A88=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AWuI1uf7vkevTM4Efk5+3Nkhb2ZqntSJyi8XvPWz3pFnL4NBBMyyVIURHEgOf7y8x
	 IEWIz/zwjxBVywZm7BFXGW6jerdwGeYzS5H4JHqqhyTeZBqXKlgNsPFj6wNK7GRNeb
	 RUqsaBVIyS8Ws96d68lUAwwf+eOktFoGa4OXOeToqlUuwn14YrMk/wIaSBr5APJ/LC
	 9tkrVcwmn6U/mfIK5XoaTo1rRYtmSW+U5uILkJSpXg/I6r4AHvlb/iU9qm5Obj2/TV
	 Pcqb4x7mKca8lyC3Gn8RdFa7ownexmD/NtyclOKuN8UVFUqL85REldL7HYTMGXeLq2
	 bjh6lENCIL2xw==
Date: Wed, 21 May 2025 09:29:14 +0200
From: Alexey Gladkov <legion@kernel.org>
To: Chen Ridong <chenridong@huaweicloud.com>
Cc: akpm@linux-foundation.org, paulmck@kernel.org, bigeasy@linutronix.de,
	roman.gushchin@linux.dev, brauner@kernel.org, tglx@linutronix.de,
	frederic@kernel.org, peterz@infradead.org, oleg@redhat.com,
	joel.granados@kernel.org, viro@zeniv.linux.org.uk,
	lorenzo.stoakes@oracle.com, avagin@google.com,
	mengensun@tencent.com, linux@weissschuh.net, jlayton@kernel.org,
	ruanjinjie@huawei.com, kees@kernel.org,
	linux-kernel@vger.kernel.org, lujialin4@huawei.com,
	Eric Biederman <ebiederm@xmission.com>
Subject: Re: [RFC next v2 0/5] ucount: add rlimit cache for ucount
Message-ID: <aC2AyjNxKRLQf0fd@example.org>
References: <20250509072054.148257-1-chenridong@huaweicloud.com>
 <aCcl9M-BgOJ86gVJ@example.org>
 <f5c701d5-c501-4179-959c-85057705a09d@huaweicloud.com>
 <aCtdCkSGQJKCYApm@example.org>
 <6c3b4ac3-fe33-45d0-b7e8-d722e29c8240@huaweicloud.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6c3b4ac3-fe33-45d0-b7e8-d722e29c8240@huaweicloud.com>

On Wed, May 21, 2025 at 09:32:12AM +0800, Chen Ridong wrote:
> 
> 
> On 2025/5/20 0:32, Alexey Gladkov wrote:
> > On Mon, May 19, 2025 at 09:39:34PM +0800, Chen Ridong wrote:
> >>
> >>
> >> On 2025/5/16 19:48, Alexey Gladkov wrote:
> >>> On Fri, May 09, 2025 at 07:20:49AM +0000, Chen Ridong wrote:
> >>>> The will-it-scale test case signal1 [1] has been observed. and the test
> >>>> results reveal that the signal sending system call lacks linearity.
> >>>
> >>> The signal1 testcase is pretty synthetic. It sends a signal in a busy loop.
> >>>
> >>> Do you have an example of a closer-to-life scenario where this delay
> >>> becomes a bottleneck ?
> >>>
> >>> https://github.com/antonblanchard/will-it-scale/blob/master/tests/signal1.c
> >>>
> >>
> >> Thank you for your prompt reply. Unfortunately, I do not have the
> >> specific scenario.
> >>
> >> Motivation:
> >> I plan to use servers with 384 cores, and potentially even more in the
> >> future. Therefore, I am testing these system calls to identify any
> >> scalability bottlenecks that could arise in massively parallel
> >> high-density computing environments.
> > 
> > But it turns out that you're proposing complex changes for something that
> 
> Using percpu_couter is not as complex as this patch set.
> 
> > is essentially a non-issue. In the real world, applications don't spam
> > signals and I'm not sure we want to support that scenario.
> > 
> >> In addition, we hope that the containers can be isolated as much as
> >> possible to avoid interfering with each other.
> > 
> > But that's impossible. Even before migration to ucounts, some rlimits
> > (RLIMIT_MSGQUEUE, RLIMIT_MEMLOCK, RLIMIT_SIGPENDING, RLIMIT_NPROC) were
> > bound to user_struct. I mean, atomic counter and "bottleneck" was there.
> > We can't remove the counters for that rlimits and they will have an
> > impact.
> > 
> > These rlimits are now counted per-namespace. In real life, docker/podman
> > creates a separate user namespace for each container from init_user_ns.
> > Usually only one additional counter is added for each rlimit in this way.
> > 
> The problem is that when increasing an rlimit in Docker, the limit has
> to be increased in the init_user_ns even if a separate user namespace
> has been created. This is why I believe this issue deserves to be fixed.

man setrlimit(2):

  An unprivileged process may set only its soft limit to a value in the
  range from 0 up to the hard limit, and (irreversibly) lower its hard
  limit. A privileged process may make arbitrary changes to either limit
  value.

This is a well-documented behavior. But it works in all user namespaces.
If a unprivileged user has rlimits in init_user_ns, they should not be
exceeded even if that process uses a different user namespeces.

So even if you increase rlimits in the new user namespace as root (in the
new userns), it doesn't mean that rlimits in the parent user namespace
cease to apply or should somehow increase. You still have limitations from
the upper user namespace.

I don't see a issue here.

> > All I'm saying is that "bottleneck" with atomic counter was there before
> > and can't be removed anywhere.
> > 
> 
> Yes, it can not be removed anywhere, maybe we can make it better.

Yes, we probably can, but we need to have a reason to complicate the code.
And we're still talking about a synthetic test.

> 
> Best regards,
> Ridong
> 
> >>
> >> Best regards,
> >> Ridong
> >>
> >>>> To further investigate this issue, we initiated a series of tests by
> >>>> launching varying numbers of dockers and closely monitored the throughput
> >>>> of each individual docker. The detailed test outcomes are presented as
> >>>> follows:
> >>>>
> >>>> 	| Dockers     |1      |4      |8      |16     |32     |64     |
> >>>> 	| Throughput  |380068 |353204 |308948 |306453 |180659 |129152 |
> >>>>
> >>>> The data clearly demonstrates a discernible trend: as the quantity of
> >>>> dockers increases, the throughput per container progressively declines.
> >>>> In-depth analysis has identified the root cause of this performance
> >>>> degradation. The ucouts module conducts statistics on rlimit, which
> >>>> involves a significant number of atomic operations. These atomic
> >>>> operations, when acting on the same variable, trigger a substantial number
> >>>> of cache misses or remote accesses, ultimately resulting in a drop in
> >>>> performance.
> >>>>
> >>>> Notably, even though a new user_namespace is created upon docker startup,
> >>>> the problem persists. This is because all these dockers share the same
> >>>> parent node, meaning that rlimit statistics continuously modify the same
> >>>> atomic variable.
> >>>>
> >>>> Currently, when incrementing a specific rlimit within a child user
> >>>> namespace by 1, the corresponding rlimit in the parent node must also be
> >>>> incremented by 1. Specifically, if the ucounts corresponding to a task in
> >>>> Docker B is ucount_b_1, after incrementing the rlimit of ucount_b_1 by 1,
> >>>> the rlimit of the parent node, init_ucounts, must also be incremented by 1.
> >>>> This operation should be ensured to stay within the limits set for the
> >>>> user namespaces.
> >>>>
> >>>> 	init_user_ns                             init_ucounts
> >>>> 	^                                              ^
> >>>> 	|                        |                     |
> >>>> 	|<---- usr_ns_a(docker A)|usr_ns_a->ucount---->|
> >>>> 	|                        |                     |
> >>>> 	|<---- usr_ns_b(docker B)|usr_ns_a->ucount---->|
> >>>> 					^
> >>>> 					|
> >>>> 					|
> >>>> 					|
> >>>> 					ucount_b_1
> >>>>
> >>>> What is expected is that dockers operating within separate namespaces
> >>>> should remain isolated and not interfere with one another. Regrettably,
> >>>> the current signal system call fails to achieve this desired level of
> >>>> isolation.
> >>>>
> >>>> Proposal:
> >>>>
> >>>> To address the aforementioned issues, the concept of implementing a cache
> >>>> for each namespace's rlimit has been proposed. If a cache is added for
> >>>> each user namespace's rlimit, a certain amount of rlimits can be allocated
> >>>> to a particular namespace in one go. When resources are abundant, these
> >>>> resources do not need to be immediately returned to the parent node. Within
> >>>> a user namespace, if there are available values in the cache, there is no
> >>>> need to request additional resources from the parent node.
> >>>>
> >>>> 	init_user_ns                             init_ucounts
> >>>> 	^                                              ^
> >>>> 	|                        |                     |
> >>>> 	|<---- usr_ns_a(docker A)|usr_ns_a->ucount---->|
> >>>> 	|                        |                     |
> >>>> 	|<---- usr_ns_b(docker B)|usr_ns_b->ucount---->|
> >>>> 			^		^
> >>>> 			|		|
> >>>> 			cache_rlimit--->|
> >>>> 					|
> >>>> 					ucount_b_1
> >>>>
> >>>>
> >>>> The ultimate objective of this solution is to achieve complete isolation
> >>>> among namespaces. After applying this patch set, the final test results
> >>>> indicate that in the signal1 test case, the performance does not
> >>>> deteriorate as the number of containers increases. This effectively meets
> >>>
> >>>> the goal of linear scalability.
> >>>>
> >>>> 	| Dockers     |1      |4      |8      |16     |32     |64     |
> >>>> 	| Throughput  |381809 |382284 |380640 |383515 |381318 |380120 |
> >>>>
> >>>> Challenges:
> >>>>
> >>>> When checking the pending signals in the parent node using the command
> >>>>  cat /proc/self/status | grep SigQ, the retrieved value includes the
> >>>> cached signal counts from its child nodes. As a result, the SigQ value
> >>>> in the parent node fails to accurately and instantaneously reflect the
> >>>> actual number of pending signals.
> >>>>
> >>>> 	# cat /proc/self/status | grep SigQ
> >>>> 	SigQ:	16/6187667
> >>>>
> >>>> TODO:
> >>>>
> >>>> Add cache for the other rlimits.
> >>>>
> >>>> [1] https://github.com/antonblanchard/will-it-scale/blob/master/tests/
> >>>>
> >>>> Chen Ridong (5):
> >>>>   user_namespace: add children list node
> >>>>   usernamespace: make usernamespace rcu safe
> >>>>   user_namespace: add user_ns iteration helper
> >>>>   uounts: factor out __inc_rlimit_get_ucounts/__dec_rlimit_put_ucounts
> >>>>   ucount: add rlimit cache for ucount
> >>>>
> >>>>  include/linux/user_namespace.h |  23 ++++-
> >>>>  kernel/signal.c                |   2 +-
> >>>>  kernel/ucount.c                | 181 +++++++++++++++++++++++++++++----
> >>>>  kernel/user.c                  |   2 +
> >>>>  kernel/user_namespace.c        |  60 ++++++++++-
> >>>>  5 files changed, 243 insertions(+), 25 deletions(-)
> >>>>
> >>>> -- 
> >>>> 2.34.1
> >>>>
> >>>
> >>
> > 
> 

-- 
Rgrds, legion

