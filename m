Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965A82797BC
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 13:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747661096; cv=none; b=TJoxVCF05QD7mBy2dVl5b6wnqzaI6VUBAROrv9i97p/RkY20PuclvCFIfH8ss1gufEfp3sshhcBg1Q3LLRXrKn13ZLbcJgD3lufCx4U2/Uj+fxv5EEAC4Vh8LacZrlX6s5Td8N55KEnVdoQhoa22Mqe1fQmvsaOhHI0Q14+3T6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747661096; c=relaxed/simple;
	bh=aDvySIkwBPf34agGTkuLdNgJSheeYT2i7xzcL4e9PhI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=abfGy730wc04579VJQgz9qidAFg5LCX4Nvjtsy8TKOmEC+247E9SADFjxi3B4JW9mB2nV/yrR5MKSWncNd3FdBpIyf+q77w/XBhSPyORnXFJVyWwHZUC6KDzMim07O8+znJlh9jaE2sV/FRzEywXWL/PF76YbFgf0WrrMh7Hk8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=none smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4b1JLl2WNJz4f3k6M
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 21:24:31 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id 1C1D91A0359
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 21:24:51 +0800 (CST)
Received: from hulk-vt.huawei.com (unknown [10.67.174.121])
	by APP2 (Coremail) with SMTP id Syh0CgDXk2YDMSto5JogMw--.10967S2;
	Mon, 19 May 2025 21:24:48 +0800 (CST)
From: Chen Ridong <chenridong@huaweicloud.com>
To: akpm@linux-foundation.org,
	Liam.Howlett@oracle.com,
	lorenzo.stoakes@oracle.com,
	vbabka@suse.cz,
	jannh@google.com,
	pfalcato@suse.de,
	bigeasy@linutronix.de,
	paulmck@kernel.org,
	chenridong@huawei.com,
	roman.gushchin@linux.dev,
	brauner@kernel.org,
	pmladek@suse.com,
	geert@linux-m68k.org,
	mingo@kernel.org,
	rrangel@chromium.org,
	francesco@valla.it,
	kpsingh@kernel.org,
	guoweikang.kernel@gmail.com,
	link@vivo.com,
	viro@zeniv.linux.org.uk,
	neil@brown.name,
	nichen@iscas.ac.cn,
	tglx@linutronix.de,
	frederic@kernel.org,
	peterz@infradead.org,
	oleg@redhat.com,
	joel.granados@kernel.org,
	linux@weissschuh.net,
	avagin@google.com,
	legion@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lujialin4@huawei.com
Subject: [RFC next v2 0/2] ucounts: turn the atomic rlimit to percpu_counter
Date: Mon, 19 May 2025 13:11:49 +0000
Message-Id: <20250519131151.988900-1-chenridong@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:Syh0CgDXk2YDMSto5JogMw--.10967S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJryfGw47WF47Xry7Xw43KFg_yoW8ur45pr
	WSgas8Kr1vy3Z7J3yxKa4xZ34rKF4xGr15Gw4UGw1xAan3CFyjgFyxKw45Xay7Gr93Ja4j
	qr1jg34DCFyqvaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvIb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0E
	n4kS14v26rWY6Fy7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I
	0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWr
	XVW8Jr1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20x
	vEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE
	14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf
	9x07jSiihUUUUU=
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

This patch set addresses scalability issues in the ucounts rlimit by
replacing atomic rlimit counters with percpu_counter, which distributes
counts across CPU cores to reduce cache contention under heavy load.

Patch 1 modifies thate ucount can be freed until both the refcount and
rlimit are fully released, minimizing redundant summations. Patch 2 turns
the atomic rlimit to percpu_counter, which is suggested by Andrew.

[1] https://github.com/antonblanchard/will-it-scale/blob/master/tests/

---
v2: use percpu_counter intead of cache rlimit.

v1: https://lore.kernel.org/lkml/20250509072054.148257-1-chenridong@huaweicloud.com/

Chen Ridong (2):
  ucounts: free ucount only count and rlimit are zero
  ucounts: turn the atomic rlimit to percpu_counter

 include/linux/user_namespace.h |  17 +++-
 init/main.c                    |   1 +
 ipc/mqueue.c                   |   6 +-
 kernel/signal.c                |   8 +-
 kernel/ucount.c                | 169 +++++++++++++++++++++++----------
 mm/mlock.c                     |   5 +-
 6 files changed, 138 insertions(+), 68 deletions(-)

-- 
2.34.1

