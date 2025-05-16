Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46AAC22F743
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 11:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747396093; cv=none; b=cM7r0qg2+FxA1sEMJ1AJ50HvnKS0j6Gkdi3KHbRsjwXfgxEi+nf/d1zt8VASByD7qEnIEHuVJE0wVGPwdVsoTGzN1aGFbSpgwEZ2tKzLUpArzF60J5MPo9m2DogMRPI1kTNtYVr35CYijPAI1Qv9xmnHNtztBN0yBJwbKAdXvdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747396093; c=relaxed/simple;
	bh=3MYijVPQvpzqVThNCDiXH+5zTAGvUkwSQecbvmdBVoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d3teHMCL0wnSpfswWeSQAz1WrlJE5W/51kyrJgRnK/gCfB9ohwgVgJvGKQ6fkAmQsaO3LP5DyW4vsM3LLoQ+sO6XmjCOPwNTCHkcSb0LVS/7kvIszTcE1YZtHF1YaiXZ38Bs2W68dCW/HCFIcbj6Hp1vhurIJWucp/qGqBVZ918=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ow/Zig/M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ow/Zig/M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61EC6C4CEE4;
	Fri, 16 May 2025 11:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747396092;
	bh=3MYijVPQvpzqVThNCDiXH+5zTAGvUkwSQecbvmdBVoc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ow/Zig/MtvU9TV1An7IkGMy5ojFoH6ZCFr3m5fXOfb2daB/s2IvbdCwl+pIdOPNHn
	 +OfoyNdV5npqNeCClbn0lJd3hjNSf30/G0jY15n6nxW+bM+21RaUxHtajhetqs/68h
	 tuqxp7oa26SeBl8p0HtWn24nAV3OMUI7CNCq7t+0MXAoXQeikOWMzk6Gp6e3VjW1i0
	 j8UziO5Rdbslm2zpfpq2bj01teEjuK+RG61zZrcTQIXKfrRzQeGirlaWaNI7Shm6Do
	 3iQpLe277g5Fg4cB3eF2fA9i5QRBa34j/SiVwel0LPB3jNf0FgIRzATvAnNWvTAUjb
	 8zzbLizIcBP5A==
Date: Fri, 16 May 2025 13:48:04 +0200
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
Message-ID: <aCcl9M-BgOJ86gVJ@example.org>
References: <20250509072054.148257-1-chenridong@huaweicloud.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509072054.148257-1-chenridong@huaweicloud.com>

On Fri, May 09, 2025 at 07:20:49AM +0000, Chen Ridong wrote:
> The will-it-scale test case signal1 [1] has been observed. and the test
> results reveal that the signal sending system call lacks linearity.

The signal1 testcase is pretty synthetic. It sends a signal in a busy loop.

Do you have an example of a closer-to-life scenario where this delay
becomes a bottleneck ?

https://github.com/antonblanchard/will-it-scale/blob/master/tests/signal1.c

> To further investigate this issue, we initiated a series of tests by
> launching varying numbers of dockers and closely monitored the throughput
> of each individual docker. The detailed test outcomes are presented as
> follows:
> 
> 	| Dockers     |1      |4      |8      |16     |32     |64     |
> 	| Throughput  |380068 |353204 |308948 |306453 |180659 |129152 |
> 
> The data clearly demonstrates a discernible trend: as the quantity of
> dockers increases, the throughput per container progressively declines.
> In-depth analysis has identified the root cause of this performance
> degradation. The ucouts module conducts statistics on rlimit, which
> involves a significant number of atomic operations. These atomic
> operations, when acting on the same variable, trigger a substantial number
> of cache misses or remote accesses, ultimately resulting in a drop in
> performance.
> 
> Notably, even though a new user_namespace is created upon docker startup,
> the problem persists. This is because all these dockers share the same
> parent node, meaning that rlimit statistics continuously modify the same
> atomic variable.
> 
> Currently, when incrementing a specific rlimit within a child user
> namespace by 1, the corresponding rlimit in the parent node must also be
> incremented by 1. Specifically, if the ucounts corresponding to a task in
> Docker B is ucount_b_1, after incrementing the rlimit of ucount_b_1 by 1,
> the rlimit of the parent node, init_ucounts, must also be incremented by 1.
> This operation should be ensured to stay within the limits set for the
> user namespaces.
> 
> 	init_user_ns                             init_ucounts
> 	^                                              ^
> 	|                        |                     |
> 	|<---- usr_ns_a(docker A)|usr_ns_a->ucount---->|
> 	|                        |                     |
> 	|<---- usr_ns_b(docker B)|usr_ns_a->ucount---->|
> 					^
> 					|
> 					|
> 					|
> 					ucount_b_1
> 
> What is expected is that dockers operating within separate namespaces
> should remain isolated and not interfere with one another. Regrettably,
> the current signal system call fails to achieve this desired level of
> isolation.
> 
> Proposal:
> 
> To address the aforementioned issues, the concept of implementing a cache
> for each namespace's rlimit has been proposed. If a cache is added for
> each user namespace's rlimit, a certain amount of rlimits can be allocated
> to a particular namespace in one go. When resources are abundant, these
> resources do not need to be immediately returned to the parent node. Within
> a user namespace, if there are available values in the cache, there is no
> need to request additional resources from the parent node.
> 
> 	init_user_ns                             init_ucounts
> 	^                                              ^
> 	|                        |                     |
> 	|<---- usr_ns_a(docker A)|usr_ns_a->ucount---->|
> 	|                        |                     |
> 	|<---- usr_ns_b(docker B)|usr_ns_b->ucount---->|
> 			^		^
> 			|		|
> 			cache_rlimit--->|
> 					|
> 					ucount_b_1
> 
> 
> The ultimate objective of this solution is to achieve complete isolation
> among namespaces. After applying this patch set, the final test results
> indicate that in the signal1 test case, the performance does not
> deteriorate as the number of containers increases. This effectively meets

> the goal of linear scalability.
> 
> 	| Dockers     |1      |4      |8      |16     |32     |64     |
> 	| Throughput  |381809 |382284 |380640 |383515 |381318 |380120 |
> 
> Challenges:
> 
> When checking the pending signals in the parent node using the command
>  cat /proc/self/status | grep SigQ, the retrieved value includes the
> cached signal counts from its child nodes. As a result, the SigQ value
> in the parent node fails to accurately and instantaneously reflect the
> actual number of pending signals.
> 
> 	# cat /proc/self/status | grep SigQ
> 	SigQ:	16/6187667
> 
> TODO:
> 
> Add cache for the other rlimits.
> 
> [1] https://github.com/antonblanchard/will-it-scale/blob/master/tests/
> 
> Chen Ridong (5):
>   user_namespace: add children list node
>   usernamespace: make usernamespace rcu safe
>   user_namespace: add user_ns iteration helper
>   uounts: factor out __inc_rlimit_get_ucounts/__dec_rlimit_put_ucounts
>   ucount: add rlimit cache for ucount
> 
>  include/linux/user_namespace.h |  23 ++++-
>  kernel/signal.c                |   2 +-
>  kernel/ucount.c                | 181 +++++++++++++++++++++++++++++----
>  kernel/user.c                  |   2 +
>  kernel/user_namespace.c        |  60 ++++++++++-
>  5 files changed, 243 insertions(+), 25 deletions(-)
> 
> -- 
> 2.34.1
> 

-- 
Rgrds, legion

