Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B40A26A0EE
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 07:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746774418; cv=none; b=deMxOITqbUmFiO2SSrk69nBEh8/pxjhJ3BzvioCDVuhEVpiagpXtEugUKimYjLzSbEOXNZbd270uOSLzXexyiuAa3N1TgVgTWtJVXCFq+IYz64HHvNCgHrollSJZUCrBrul+4jZnTRBWxKtSKfUSV/8yYaA/8nlyBQlzKqnpbbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746774418; c=relaxed/simple;
	bh=zgA44xH88px7Gc0D+by36IzKENo9XiHp4Sbt3M4HI6I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rJCTsRef6GEHyOt3PiIBhnSbU0EOJjGQ+9L0d9rGFkctbmDeBLVRa1N2XN9d+v50/2/WE8HQYB2VeBA0PYJ2+T3wPNayJ8cq8VECsjoM/FnVBl87tKH1sasFj4wKf6FfNkif6/MlXP/y63ccSlUcMooRCcRFzcWXUQ5B88xK4C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4Zv0Rf5D0hzYQv7x
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 15:06:54 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id 14F201A07C0
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 15:06:54 +0800 (CST)
Received: from hulk-vt.huawei.com (unknown [10.67.174.121])
	by APP3 (Coremail) with SMTP id _Ch0CgAnesR4qR1ofcXLLg--.60961S8;
	Fri, 09 May 2025 15:06:53 +0800 (CST)
From: Chen Ridong <chenridong@huaweicloud.com>
To: akpm@linux-foundation.org,
	paulmck@kernel.org,
	bigeasy@linutronix.de,
	legion@kernel.org,
	roman.gushchin@linux.dev,
	brauner@kernel.org,
	tglx@linutronix.de,
	frederic@kernel.org,
	peterz@infradead.org,
	oleg@redhat.com,
	joel.granados@kernel.org,
	viro@zeniv.linux.org.uk,
	lorenzo.stoakes@oracle.com,
	avagin@google.com,
	mengensun@tencent.com,
	linux@weissschuh.net,
	jlayton@kernel.org,
	ruanjinjie@huawei.com,
	kees@kernel.org
Cc: linux-kernel@vger.kernel.org,
	lujialin4@huawei.com,
	chenridong@huaweicloud.com
Subject: [RFC next 0/5] ucount: add rlimit cache for ucount
Date: Fri,  9 May 2025 06:54:12 +0000
Message-Id: <20250509065417.147515-7-chenridong@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250509065417.147515-1-chenridong@huaweicloud.com>
References: <20250509065417.147515-1-chenridong@huaweicloud.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_Ch0CgAnesR4qR1ofcXLLg--.60961S8
X-Coremail-Antispam: 1UD129KBjvJXoWxuF4fZr15GF48JF4xGr17Jrb_yoWrCF1rpr
	WSv3sxJr4kJFnrAr1S934kX34Sg3yrAF4UGFs5C34fA3Z8GFyFyryxta4FvryDKrZ3Ja4j
	qrWjg3yqka1DZaDanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmS14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
	4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
	3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
	IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
	M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
	kIc2xKxwCY1x0262kKe7AKxVWrXVW3AwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkE
	bVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67
	AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI
	42IY6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF
	4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBI
	daVFxhVjvjDU0xZFpf9x0pRUDGrUUUUU=
X-CM-SenderInfo: hfkh02xlgr0w46kxt4xhlfz01xgou0bp/

From: Chen Ridong <chenridong@huawei.com>

The will-it-scale test case signal1 [1] has been observed. and the test
results reveal that the signal sending system call lacks linearity.
To further investigate this issue, we initiated a series of tests by
launching varying numbers of dockers and closely monitored the throughput
of each individual docker. The detailed test outcomes are presented as
follows:

	| Dockers     |1      |4      |8      |16     |32     |64     |
	| Throughput  |380068 |353204 |308948 |306453 |180659 |129152 |

The data clearly demonstrates a discernible trend: as the quantity of
dockers increases, the throughput per container progressively declines.
In-depth analysis has identified the root cause of this performance
degradation. The ucouts module conducts statistics on rlimit, which
involves a significant number of atomic operations. These atomic
operations, when acting on the same variable, trigger a substantial number
of cache misses or remote accesses, ultimately resulting in a drop in
performance.

Notably, even though a new user_namespace is created upon docker startup,
the problem persists. This is because all these dockers share the same
parent node, meaning that rlimit statistics continuously modify the same
atomic variable.

Currently, when incrementing a specific rlimit within a child user
namespace by 1, the corresponding rlimit in the parent node must also be
incremented by 1. Specifically, if the ucounts corresponding to a task in
Docker B is ucount_b_1, after incrementing the rlimit of ucount_b_1 by 1,
the rlimit of the parent node, init_ucounts, must also be incremented by 1.
This operation should be ensured to stay within the limits set for the
user namespaces.

	init_user_ns                             init_ucounts
	^                                              ^
	|                        |                     |
	|<---- usr_ns_a(docker A)|usr_ns_a->ucount---->|
	|                        |                     |
	|<---- usr_ns_b(docker B)|usr_ns_a->ucount---->|
					^
					|
					|
					|
					ucount_b_1

What is expected is that dockers operating within separate namespaces
should remain isolated and not interfere with one another. Regrettably,
the current signal system call fails to achieve this desired level of
isolation.

Proposal:

To address the aforementioned issues, the concept of implementing a cache
for each namespace's rlimit has been proposed. If a cache is added for
each user namespace's rlimit, a certain amount of rlimits can be allocated
to a particular namespace in one go. When resources are abundant, these
resources do not need to be immediately returned to the parent node. Within
a user namespace, if there are available values in the cache, there is no
need to request additional resources from the parent node.

	init_user_ns                             init_ucounts
	^                                              ^
	|                        |                     |
	|<---- usr_ns_a(docker A)|usr_ns_a->ucount---->|
	|                        |                     |
	|<---- usr_ns_b(docker B)|usr_ns_b->ucount---->|
			^		^
			|		|
			cache_rlimit--->|
					|
					ucount_b_1


The ultimate objective of this solution is to achieve complete isolation
among namespaces. After applying this patch set, the final test results
indicate that in the signal1 test case, the performance does not
deteriorate as the number of containers increases. This effectively meets
the goal of linear scalability.

	| Dockers     |1      |4      |8      |16     |32     |64     |
	| Throughput  |381809 |382284 |380640 |383515 |381318 |380120 |

Challenges:

When checking the pending signals in the parent node using the command
 cat /proc/self/status | grep SigQ, the retrieved value includes the
cached signal counts from its child nodes. As a result, the SigQ value
in the parent node fails to accurately and instantaneously reflect the
actual number of pending signals.

	# cat /proc/self/status | grep SigQ
	SigQ:	16/6187667

TODO:

Add cache for the other rlimits.

[1] https://github.com/antonblanchard/will-it-scale/blob/master/tests/

Chen Ridong (5):
  user_namespace: add children list node
  usernamespace: make usernamespace rcu safe
  user_namespace: add user_ns iteration helper
  uounts: factor out __inc_rlimit_get_ucounts/__dec_rlimit_put_ucounts
  ucount: add rlimit cache for ucount

 include/linux/user_namespace.h |  23 ++++-
 kernel/signal.c                |   2 +-
 kernel/ucount.c                | 181 +++++++++++++++++++++++++++++----
 kernel/user.c                  |   2 +
 kernel/user_namespace.c        |  60 ++++++++++-
 5 files changed, 243 insertions(+), 25 deletions(-)

-- 
2.34.1

