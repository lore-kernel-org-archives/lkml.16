Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B841F29673D
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 10:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747304976; cv=none; b=CZo1EbgiLotfax2B50Q84voFmKO8RrgfYzYKzdx2UjLkqeaWWCnSRSroo6VArZilx/GNIwNNIF9xXJXQbljdHQ4Ax5f2KRcY4BFjUPSyf0jSiiyJJVIezW601GWJZhqTocF5T9EclBdOc9o3FqtqWSXhso8rV/HKj3EYOydDrt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747304976; c=relaxed/simple;
	bh=TJKbRCNcoUUdAALtR9SmAOpD6cOgPKJyZTDbK2RoEJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NS0Dr9F//hwKur/pAVNGm+nuY3kYGv3BQfW/TfzVMkOs2Y8Mu9z2i0qprZus8OaleRxjInTaD+V1/61oe94cVmVg+qXtRyNZQZb0v5kj86UVytM+cjvy9v58acTbr+6CkOyr/QZW4qWLi/XB0DpfUJMd+siitKDmcT0eKFZ6DMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ooGATy4x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ooGATy4x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A13C6C4CEF2;
	Thu, 15 May 2025 10:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747304976;
	bh=TJKbRCNcoUUdAALtR9SmAOpD6cOgPKJyZTDbK2RoEJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ooGATy4xX8EDMBBwtzS86c12No3ZkUdyG2DDwbpStCchNss3ouB7dEXJ9RfIHTJNo
	 L5qj5OjlCnaSltE2QurArwIeuFjcIyekrVGHS0vTwnWgtYnIOy+GbNCEgr7ba6vHVp
	 W3ycgPcCqtetlpnUPf1LK99kAHHefSH/EMaoRoviv1ztZaKOnOYCeholqtkLmRlaLy
	 riAS7HFN7DBwdA8ZE/Ra34g0pwNPyqORS4O/yD2S70PMIUdf4DYp9RovjjD7VVuCjJ
	 CjeW4FmAp9OEugFqNLuEd4nQQ5TA2Clon/qveBZf5k3+MuWoTpTM0k+z1T8wRjLD7t
	 5OhfEW3T+uiHA==
Date: Thu, 15 May 2025 12:29:29 +0200
From: Christian Brauner <brauner@kernel.org>
To: Chen Ridong <chenridong@huaweicloud.com>
Cc: akpm@linux-foundation.org, paulmck@kernel.org, bigeasy@linutronix.de, 
	legion@kernel.org, roman.gushchin@linux.dev, tglx@linutronix.de, 
	frederic@kernel.org, peterz@infradead.org, oleg@redhat.com, joel.granados@kernel.org, 
	viro@zeniv.linux.org.uk, lorenzo.stoakes@oracle.com, avagin@google.com, 
	mengensun@tencent.com, linux@weissschuh.net, jlayton@kernel.org, ruanjinjie@huawei.com, 
	kees@kernel.org, linux-kernel@vger.kernel.org, lujialin4@huawei.com
Subject: Re: [RFC next v2 0/5] ucount: add rlimit cache for ucount
Message-ID: <20250515-server-reformieren-b2fd91846538@brauner>
References: <20250509072054.148257-1-chenridong@huaweicloud.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250509072054.148257-1-chenridong@huaweicloud.com>

On Fri, May 09, 2025 at 07:20:49AM +0000, Chen Ridong wrote:
> The will-it-scale test case signal1 [1] has been observed. and the test
> results reveal that the signal sending system call lacks linearity.
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

Woah, I don't think we want to go down that route. That sounds so overly
complex. We should only do that if we absolutely have to. If we can get
away with the percpu counter and some optimizations we might be better
off in the long run.
