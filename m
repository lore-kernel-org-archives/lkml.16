Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77142270549
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 07:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746776342; cv=none; b=AXKgh5MGKUksVRflHRY3WlmHrJUoMm4pvhId2Ks9wDHNk1QsXftnN59A8E/TJgtlQWGjbbtDu9HfvvmxqRm0smsQrWsqW7vqX0xjVt+O5jHnFPl4oS7Fq+k0g1AO5s847yNcvUC92rfjnMmFCSfM2V9R5lQ9a0OpHSJUK7tXIio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746776342; c=relaxed/simple;
	bh=fbVROZLadhAwkuCMlVBIKlJSNpkiZcCLmWWTXLrJX6s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KYaVb2znCsUDPcV7qdtXj2CKeFJX3YeE77SnEWvSkmH9jNGd3BaruxfT6tpGrdDhj/Nje39BsBZxIvkys7N+4RKPP/jbEnuIl5eHVhFlu78ZQTcEhnvGnUyKDm3yFQ+bQ/WDXWmSlNDyD6GpFDErpN9B+wJVrWVJrH4pF0nfv+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4Zv18F0g8Xz4f3jt8
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 15:38:37 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id 6F8861A177F
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 15:38:56 +0800 (CST)
Received: from [10.67.109.79] (unknown [10.67.109.79])
	by APP3 (Coremail) with SMTP id _Ch0CgC3V8INsR1oVP_NLg--.7427S2;
	Fri, 09 May 2025 15:38:54 +0800 (CST)
Message-ID: <11a794f9-6d55-4188-90cb-b8ec6faf1097@huaweicloud.com>
Date: Fri, 9 May 2025 15:38:52 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC next 0/5] ucount: add rlimit cache for ucount
To: akpm@linux-foundation.org, paulmck@kernel.org, bigeasy@linutronix.de,
 legion@kernel.org, roman.gushchin@linux.dev, brauner@kernel.org,
 tglx@linutronix.de, frederic@kernel.org, peterz@infradead.org,
 oleg@redhat.com, joel.granados@kernel.org, viro@zeniv.linux.org.uk,
 lorenzo.stoakes@oracle.com, avagin@google.com, mengensun@tencent.com,
 linux@weissschuh.net, jlayton@kernel.org, ruanjinjie@huawei.com,
 kees@kernel.org
Cc: linux-kernel@vger.kernel.org, lujialin4@huawei.com
References: <20250509065417.147515-1-chenridong@huaweicloud.com>
Content-Language: en-US
From: Chen Ridong <chenridong@huaweicloud.com>
In-Reply-To: <20250509065417.147515-1-chenridong@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:_Ch0CgC3V8INsR1oVP_NLg--.7427S2
X-Coremail-Antispam: 1UD129KBjvJXoWxuF4fZr15GF48GrWUGFWDCFg_yoWrtw4Upr
	WSv3sxJrs5JF17Awn7Z34kXa4S93yrAF4UCFs5Cw1fA3ZxGFySyr1xt3WrZF9rXrZ3Ja4j
	qrWjgw4qkFZ8ZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUv2b4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS
	14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
	8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWr
	XwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x
	0267AKxVW8Jr0_Cr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AK
	xVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa
	7IU0s2-5UUUUU==
X-CM-SenderInfo: hfkh02xlgr0w46kxt4xhlfz01xgou0bp/



On 2025/5/9 14:54, Chen Ridong wrote:
> From: Chen Ridong <chenridong@huawei.com>
> 
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
Sorry for the duplicate patches.
I've sent v2, so please ignore this version.

Link v2:
https://lore.kernel.org/lkml/20250509072054.148257-1-chenridong@huaweicloud.com/T/#ma054c482f06b26c042a86a1797eda51555203327

Thanks,
Ridong

