Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E7F426AD9
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 16:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744389765; cv=none; b=QP2mShqCR+U/lnlgNvtGG3xRppFJPC80iqrnkWdIUXP9Sx7r9dVrDAfiArisq7IZA4la7rC2j/BQ/Ta5Iz1Al1vPqJB9y3y/+T/zfC/nBzZwr+n7Q4Qh0rD3SJfBiaPMqxwo492J6oYYrJ09x1dwqnKAtn5wl6shQhskHJjSRTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744389765; c=relaxed/simple;
	bh=goEjl77RfinlOmxikVVtQ3hH9c5z1LujLMVpoNl4hMg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UzaGw7OLPP5eampFes1aREO3ND5jCz8NYSHZLiCLfhsfQETn3D5U1Ni7l73mYqrzFI/JmEDFFpC1j1oPHPlMAaygQ5kyyomTEZ1yU5Qgd21Yl5K3Ofb6Db+UcVI14d/ic4UQis8tV4wh76tGj+YoHKDfpUV/EDKv814o5ZublV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F17C106F;
	Fri, 11 Apr 2025 09:42:42 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 376853F694;
	Fri, 11 Apr 2025 09:42:39 -0700 (PDT)
From: James Morse <james.morse@arm.com>
To: x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Reinette Chatre <reinette.chatre@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	H Peter Anvin <hpa@zytor.com>,
	Babu Moger <Babu.Moger@amd.com>,
	James Morse <james.morse@arm.com>,
	shameerali.kolothum.thodi@huawei.com,
	D Scott Phillips OS <scott@os.amperecomputing.com>,
	carl@os.amperecomputing.com,
	lcherian@marvell.com,
	bobo.shaobowang@huawei.com,
	tan.shaopeng@fujitsu.com,
	baolin.wang@linux.alibaba.com,
	Jamie Iles <quic_jiles@quicinc.com>,
	Xin Hao <xhao@linux.alibaba.com>,
	peternewman@google.com,
	dfustini@baylibre.com,
	amitsinght@marvell.com,
	David Hildenbrand <david@redhat.com>,
	Rex Nie <rex.nie@jaguarmicro.com>,
	Dave Martin <dave.martin@arm.com>,
	Koba Ko <kobak@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	fenghuay@nvidia.com
Subject: [PATCH v8 00/21] x86/resctrl: Move the resctrl filesystem code to /fs/resctrl
Date: Fri, 11 Apr 2025 16:42:08 +0000
Message-Id: <20250411164229.23413-1-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes since v7:
 * Switched to Tony's alternative for having a structure behind struct
   mon_data.

Changes otherwise noted on each patch.

N.B, the disk in my machine recently died - so I've re-done the feedback
changes multiple times. Appologies if I missed something on the second pass!
---
Patch 1 has been posted as a fix that should get picked up independently.

Patches X-Y should be squashed together when merged - they are posted like
this to allow folk to re-generate patch N, then review the differences on
top. Not squashing them together would expose a ftrace build warning
during bisect. (but who does that!)
That would look like this:
git://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/move_to_fs/v8_final

This series is based on rc1, and can be retrieved from:
git://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/move_to_fs/v8

This series renames functions and moves code around. With the
exception of invalid configurations for the configurable-events, there should
be no changes in behaviour caused by this series. It is now possible for
throttle_mode to report 'undefined', but no known platform will do this.

The driving pattern is to make things like struct rdtgroup private to resctrl.
Features like pseudo-lock aren't going to work on arm64, the ability to disable
it at compile time is added.

After this, I can start posting the MPAM driver to make use of resctrl on arm64.
(What's MPAM? See the cover letter of the first series. [1])

As ever - bugs welcome,
Thanks,

James

[v7] https://lore.kernel.org/all/20250228195913.24895-1-james.morse@arm.com/
[v6] https://lore.kernel.org/lkml/20250207181823.6378-1-james.morse@arm.com/
[v5] https://lore.kernel.org/r/20241004180347.19985-1-james.morse@arm.com
[v4] https://lore.kernel.org/all/20240802172853.22529-1-james.morse@arm.com/
[v3] https://lore.kernel.org/r/20240614150033.10454-1-james.morse@arm.com
[v2] https://lore.kernel.org/r/20240426150537.8094-1-Dave.Martin@arm.com
[v1] https://lore.kernel.org/r/20240321165106.31602-1-james.morse@arm.com
[1] https://lore.kernel.org/lkml/20201030161120.227225-1-james.morse@arm.com/

Amit Singh Tomar (1):
  x86/resctrl: Remove the limit on the number of CLOSID

Dave Martin (3):
  x86/resctrl: Squelch whitespace anomalies in resctrl core code
  x86/resctrl: Prefer alloc(sizeof(*foo)) idiom in rdt_init_fs_context()
  x86/resctrl: Relax some asm #includes

James Morse (17):
  x86/resctrl: Fix rdtgroup_mkdir()'s unlocked use of kernfs_node::name
  x86/resctrl: Rename resctrl_sched_in() to begin with "resctrl_arch_"
  x86/resctrl: resctrl_exit() teardown resctrl but leave the mount point
  x86/resctrl: Drop __init/__exit on assorted symbols
  x86/resctrl: Move is_mba_sc() out of core.c
  x86/resctrl: Add end-marker to the resctrl_event_id enum
  x86/resctrl: Expand the width of dom_id by replacing mon_data_bits
  x86/resctrl: Remove a newline to avoid confusing the code move script
  x86/resctrl: Split trace.h
  fs/resctrl: Add boiler plate for external resctrl code
  x86/resctrl: Move the filesystem bits to headers visible to fs/resctrl
  x86/resctrl: Always initialise rid field in rdt_resources_all[]
  x86,fs/resctrl: Move the resctrl filesystem code to live in
    /fs/resctrl
  x86,fs/resctrl: Remove duplicated trace header files
  fs/resctrl: Remove unnecessary includes
  fs/resctrl: Change internal.h's header guard macros
  x86,fs/resctrl: Move resctrl.rst to live under
    Documentation/filesystems

 Documentation/arch/x86/index.rst              |    1 -
 Documentation/filesystems/index.rst           |    1 +
 .../{arch/x86 => filesystems}/resctrl.rst     |    0
 MAINTAINERS                                   |    3 +-
 arch/Kconfig                                  |    8 +
 arch/x86/Kconfig                              |   11 +-
 arch/x86/include/asm/resctrl.h                |    7 +-
 arch/x86/kernel/cpu/resctrl/Makefile          |    3 +
 arch/x86/kernel/cpu/resctrl/core.c            |   31 +-
 arch/x86/kernel/cpu/resctrl/ctrlmondata.c     |  635 ---
 arch/x86/kernel/cpu/resctrl/internal.h        |  397 +-
 arch/x86/kernel/cpu/resctrl/monitor.c         |  909 +---
 arch/x86/kernel/cpu/resctrl/pseudo_lock.c     | 1092 +---
 .../resctrl/{trace.h => pseudo_lock_trace.h}  |   26 +-
 arch/x86/kernel/cpu/resctrl/rdtgroup.c        | 4426 +----------------
 arch/x86/kernel/process_32.c                  |    2 +-
 arch/x86/kernel/process_64.c                  |    2 +-
 fs/Kconfig                                    |    1 +
 fs/Makefile                                   |    1 +
 fs/resctrl/Kconfig                            |   39 +
 fs/resctrl/Makefile                           |    6 +
 fs/resctrl/ctrlmondata.c                      |  660 +++
 fs/resctrl/internal.h                         |  440 ++
 fs/resctrl/monitor.c                          |  929 ++++
 fs/resctrl/monitor_trace.h                    |   33 +
 fs/resctrl/pseudo_lock.c                      | 1105 ++++
 fs/resctrl/rdtgroup.c                         | 4311 ++++++++++++++++
 include/linux/resctrl.h                       |   10 +-
 include/linux/resctrl_types.h                 |    5 +
 29 files changed, 7731 insertions(+), 7363 deletions(-)
 rename Documentation/{arch/x86 => filesystems}/resctrl.rst (100%)
 rename arch/x86/kernel/cpu/resctrl/{trace.h => pseudo_lock_trace.h} (56%)
 create mode 100644 fs/resctrl/Kconfig
 create mode 100644 fs/resctrl/Makefile
 create mode 100644 fs/resctrl/ctrlmondata.c
 create mode 100644 fs/resctrl/internal.h
 create mode 100644 fs/resctrl/monitor.c
 create mode 100644 fs/resctrl/monitor_trace.h
 create mode 100644 fs/resctrl/pseudo_lock.c
 create mode 100644 fs/resctrl/rdtgroup.c

-- 
2.20.1

