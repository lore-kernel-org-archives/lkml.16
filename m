Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87862D3A6A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 15:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750432994; cv=none; b=cyZ+v4Vbn/VPYQz/S3Vrp8+/l0hwoyEZk8wdH/FqIfT4YURFxoCWmjhKOKZBQMFLndBcCiXAGrIq6pJGzc0fRzz3uoAuELgMd92D9oApOR6lnC5rOepQl94Vk2Svzlv55sn0NUh1M8FB545uji6kkjgGeszWx8ClmQQKlvMaLRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750432994; c=relaxed/simple;
	bh=G41n1gCk6paidWnY5iwmJtIM/Z4WoDRV3JDX8t0a9Xs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kMh2h8oBQeuc2pkdizAr4QlcICRWXzVwLlgn6deUZR0wI5gCqJhpwPE/L+QQ5E14rLhu7JNhJ/uhof4jhvvT0/Nu9Dx+KT3fzfN6BGWp8vRZ6m8cBbexnVdC7YxUpcoDN9ZdpJiPAM/COW4JPEQNJmvgEUqI4aHhQUmZHeQi1dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PgX9p7c7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PgX9p7c7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74982C4CEE3;
	Fri, 20 Jun 2025 15:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750432994;
	bh=G41n1gCk6paidWnY5iwmJtIM/Z4WoDRV3JDX8t0a9Xs=;
	h=From:To:Cc:Subject:Date:From;
	b=PgX9p7c78DAeFZWEP8nj/PFA38Wq0KuCkyNbMAdBfH+Q5d41ROhYi+k3KFlbOXxg0
	 gTdY6WipVGL1IvrdAYGl3tOZ1dhmG+QuOnWbabXVRloxWV20X5hHbszvD/4++gDDqS
	 10WaDVEXpHfLPn3yheH+DydNetywCz83kZFWemHapYVcCdLmrNLL0qnt/trDiOSP5q
	 DyewNx2hajqz2am/9rzQ5q8VTuzDLyUPEgfq3Y/QYiGo5q2gSEEKcjit9MJSPQKwGM
	 TWo7mpCKnec/wkppMo3enzqdgAnWrxWpuQxiKjHcJ4PXQwYzHyBIH3xRnZVdGjUFYz
	 tanHLXXK009Xw==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Tejun Heo <tj@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>,
	Waiman Long <longman@redhat.com>
Subject: [PATCH 00/27] cpuset/isolation: Honour kthreads preferred affinity
Date: Fri, 20 Jun 2025 17:22:41 +0200
Message-ID: <20250620152308.27492-1-frederic@kernel.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kthread code was enhanced lately to provide an infrastructure which
manages the preferred affinity of unbound kthreads (node or custom
cpumask) against housekeeping constraints and CPU hotplug events.

One crucial missing piece is cpuset: when an isolated partition is
created, deleted, or its CPUs updated, all the unbound kthreads in the
top cpuset are affine to _all_ the non-isolated CPUs, possibly breaking
their preferred affinity along the way

Solve this with performing the kthreads affinity update from cpuset to
the kthreads consolidated relevant code instead so that preferred
affinities are honoured.

The dispatch of the new cpumasks to workqueues and kthreads is performed
by housekeeping, as per the nice Tejun's suggestion.

As a welcome side effect, HK_TYPE_DOMAIN then integrates both the set
from isolcpus= and cpuset isolated partitions. Housekeeping cpumasks are
now modifyable with specific synchronization. A big step toward making
nohz_full= also mutable through cpuset in the future.

git://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git
	kthread/core

HEAD: f43c8b542df665940c2f581d771d92ff50606a6e

Thanks,
	Frederic
---

Frederic Weisbecker (27):
      sched/isolation: Remove housekeeping static key
      sched/isolation: Introduce housekeeping per-cpu rwsem
      PCI: Protect against concurrent change of housekeeping cpumask
      cpu: Protect against concurrent isolated cpuset change
      memcg: Prepare to protect against concurrent isolated cpuset change
      mm: vmstat: Prepare to protect against concurrent isolated cpuset change
      sched/isolation: Save boot defined domain flags
      cpuset: Convert boot_hk_cpus to use HK_TYPE_DOMAIN_BOOT
      driver core: cpu: Convert /sys/devices/system/cpu/isolated to use HK_TYPE_DOMAIN_BOOT
      net: Keep ignoring isolated cpuset change
      block: Protect against concurrent isolated cpuset change
      cpu: Provide lockdep check for CPU hotplug lock write-held
      cpuset: Provide lockdep check for cpuset lock held
      sched/isolation: Convert housekeeping cpumasks to rcu pointers
      cpuset: Update HK_TYPE_DOMAIN cpumask from cpuset
      sched/isolation: Flush memcg workqueues on cpuset isolated partition change
      sched/isolation: Flush vmstat workqueues on cpuset isolated partition change
      cpuset: Propagate cpuset isolation update to workqueue through housekeeping
      cpuset: Remove cpuset_cpu_is_isolated()
      sched/isolation: Remove HK_TYPE_TICK test from cpu_is_isolated()
      kthread: Refine naming of affinity related fields
      kthread: Include unbound kthreads in the managed affinity list
      kthread: Include kthreadd to the managed affinity list
      kthread: Rely on HK_TYPE_DOMAIN for preferred affinity management
      sched: Switch the fallback task allowed cpumask to HK_TYPE_DOMAIN
      kthread: Honour kthreads preferred affinity after cpuset changes
      kthread: Comment on the purpose and placement of kthread_affine_node() call


 block/blk-mq.c                  |   6 +-
 drivers/base/cpu.c              |   2 +-
 drivers/pci/pci-driver.c        |   3 +-
 include/linux/cpuhplock.h       |   1 +
 include/linux/cpuset.h          |   8 +-
 include/linux/kthread.h         |   1 +
 include/linux/memcontrol.h      |   4 +
 include/linux/mmu_context.h     |   2 +-
 include/linux/percpu-rwsem.h    |   1 +
 include/linux/sched/isolation.h |  38 +++++---
 include/linux/vmstat.h          |   2 +
 include/linux/workqueue.h       |   2 +-
 init/Kconfig                    |   1 +
 kernel/cgroup/cpuset.c          |  60 +++++-------
 kernel/cpu.c                    |  49 +++++++---
 kernel/kthread.c                | 136 ++++++++++++++++-----------
 kernel/sched/isolation.c        | 201 ++++++++++++++++++++++++++++------------
 kernel/sched/sched.h            |   5 +
 kernel/workqueue.c              |   2 +-
 mm/memcontrol.c                 |  26 +++++-
 mm/vmstat.c                     |  15 ++-
 net/core/net-sysfs.c            |   2 +-
 22 files changed, 371 insertions(+), 196 deletions(-)
