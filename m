Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C76A23D2AF
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 07:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746776006; cv=none; b=nTPRKyhk3XAVCJJRlRfxpBJfZMLlkhmreWu7cluj3aCEoBWeXsKriLX1E6/S+i9hLTrpi6P3ocMYD8Xdhw0M7+BoYwz9dRnvUZVcGO+NeV2Gqz21yaw27IhSOCNPMsbpvpy0v2UeCy6ZVsAj+gVelgk4pkv7Rcj5u2qoVRAyR3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746776006; c=relaxed/simple;
	bh=yRcMZWWIn9IwWXeqtxsIt7Ke1M1EkjF7RXIEeGnVKIQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CwcZLxFxrP6gC0f62o30IUAMbZKro6A7XvWgWp3v5hz6kmFCBCQCC/ZMwvCstpdYInzMdgxN1KHc/Vwvy+aGY3RBIY5hG0Tro/DbO8lthTmXuDO9pKbCLaChG2jVjkmpVSFIT0fz0sOX1Q4A7kDmzu7JB9QAv51Ki6/GxmOHD9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=none smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4Zv11f21THz4f3lVL
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 15:32:54 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id 58E971A07C0
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 15:33:20 +0800 (CST)
Received: from hulk-vt.huawei.com (unknown [10.67.174.121])
	by APP3 (Coremail) with SMTP id _Ch0CgCHJsG1rx1oiZnNLg--.58746S2;
	Fri, 09 May 2025 15:33:20 +0800 (CST)
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
Subject: [RFC next v2 0/5] ucount: add rlimit cache for ucount
Date: Fri,  9 May 2025 07:20:49 +0000
Message-Id: <20250509072054.148257-1-chenridong@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_Ch0CgCHJsG1rx1oiZnNLg--.58746S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAr45Ww17GFWfGrWxWFWfKrg_yoWrCr1xpr
	WSy3sxJr4kJF17Jr1S934kX34Sg3yrAF4UGFs5C34fA3Z8GFyFyr1fta4FvryDKrZ3Ja4j
	qrWjg3yDCa1qvaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9F14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
	0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
	zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
	4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
	CwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcS
	sGvfC2KfnxnUUI43ZEXa7sREhiSPUUUUU==
X-CM-SenderInfo: hfkh02xlgr0w46kxt4xhlfz01xgou0bp/

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

