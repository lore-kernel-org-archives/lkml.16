Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 918C0192B8A
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 18:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738952321; cv=none; b=gkpSH5higDDoqnxRbje1SxnWWXolLRW0Oq7Bv8iSH/sDEA7Blc5Dkw6YB3fdq5pvO8bfXeHrIRaQBqiNPAyKHtvFPlmxw8In9GmljJAHh53cR5kzil01M1ffoS3LFFUhjdkiA3xWGc9ttf5EbBO4tHQYSXyMWS036WAfONTqEsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738952321; c=relaxed/simple;
	bh=Bw4bdI8vrMmafBO4WhlXi6hzTHCWzgSQj7ENt5D82qg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=J5b+u9qfSX6pO7z3uM0iWxlFEUl5ig9bRiq7441mkp69WIddydT60/w+8Gw9taIxR4Q0n3ECUAAob+NjFPTyFriP64hFcsNtjhkdDSKnsLyCuB44Pc+gnUnXuMK87xRzncwyomKlgQh4KIvl/xHJ6cvmvTxoITIWZYiPcLPH748=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 56785113E;
	Fri,  7 Feb 2025 10:19:00 -0800 (PST)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6BCEA3F63F;
	Fri,  7 Feb 2025 10:18:34 -0800 (PST)
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
	Shanker Donthineni <sdonthineni@nvidia.com>
Subject: [PATCH v6 00/42] x86/resctrl: Move the resctrl filesystem code to /fs/resctrl
Date: Fri,  7 Feb 2025 18:17:41 +0000
Message-Id: <20250207181823.6378-1-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes since v5?:
 * Allocate memory for kn->priv - MPAM can't repaint cache-ids anymore.
 * Instead of describing the limit on the number of CLOSID, remove it.
 * Fixed an off-by-one in the for_each walker.
 * Kept the rdt_find_domain() argument used to insert to the list.
 * Resource reset is now per-resource.
 * thread_throttle_mode_init() went and came back again.
 * Added support for throttle_mode on SMBA resources
 * Serialised rdtgroup_destroy_root() and check for duplicate calls.
 * Regex tweaking in the python script to cover more cases

~

This is the final series that allows other architectures to implement resctrl.
The final patch to move the code has been omitted, but can be generated using
the python script at the end of the series.
The final move is a bit of a monster. I don't expect that to get merged as part
of this series - we should wait for it to make less impact on other series.

Otherwise this series renames functions and moves code around. With the
exception of invalid configurations for the configurable-events, there should
be no changes in behaviour caused by this series. It is now possible for
throttle_mode to report 'undefined', but no known platform will do this.

The driving pattern is to make things like struct rdtgroup private to resctrl.
Features like pseudo-lock aren't going to work on arm64, the ability to disable
it at compile time is added.

After this, I can start posting the MPAM driver to make use of resctrl on arm64.
(What's MPAM? See the cover letter of the first series. [1])

This series is based on v6.14-rc1 and can be retrieved from:
https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/move_to_fs/v6

As ever - bugs welcome,
Thanks,

James

[v5] https://lore.kernel.org/r/20241004180347.19985-1-james.morse@arm.com
[v4] https://lore.kernel.org/all/20240802172853.22529-1-james.morse@arm.com/
[v3] https://lore.kernel.org/r/20240614150033.10454-1-james.morse@arm.com
[v2] https://lore.kernel.org/r/20240426150537.8094-1-Dave.Martin@arm.com
[v1] https://lore.kernel.org/r/20240321165106.31602-1-james.morse@arm.com
[1] https://lore.kernel.org/lkml/20201030161120.227225-1-james.morse@arm.com/


Amit Singh Tomar (1):
  x86/resctrl: Remove the limit on the number of CLOSID

James Morse (41):
  x86/resctrl: Fix allocation of cleanest CLOSID on platforms with no
    monitors
  x86/resctrl: Add a helper to avoid reaching into the arch code
    resource list
  x86/resctrl: Remove fflags from struct rdt_resource
  x86/resctrl: Use schema type to determine how to parse schema values
  x86/resctrl: Use schema type to determine the schema format string
  x86/resctrl: Remove data_width and the tabular format
  x86/resctrl: Add max_bw to struct resctrl_membw
  x86/resctrl: Generate default_ctrl instead of sharing it
  x86/resctrl: Add helper for setting CPU default properties
  x86/resctrl: Remove rdtgroup from update_cpu_closid_rmid()
  x86/resctrl: Expose resctrl fs's init function to the rest of the
    kernel
  x86/resctrl: Move rdt_find_domain() to be visible to arch and fs code
  x86/resctrl: Move resctrl types to a separate header
  x86/resctrl: Add an arch helper to reset one resource
  x86/resctrl: Move monitor exit work to a resctrl exit call
  x86/resctrl: Move monitor init work to a resctrl init call
  x86/resctrl: Rewrite and move the for_each_*_rdt_resource() walkers
  x86/resctrl: Move the is_mbm_*_enabled() helpers to asm/resctrl.h
  x86/resctrl: Add resctrl_arch_is_evt_configurable() to abstract BMEC
  x86/resctrl: Change mon_event_config_{read,write}() to be arch helpers
  x86/resctrl: Move mba_mbps_default_event init to filesystem code
  x86/resctrl: Move mbm_cfg_mask to struct rdt_resource
  x86/resctrl: Add resctrl_arch_ prefix to pseudo lock functions
  x86/resctrl: Allow an architecture to disable pseudo lock
  x86/resctrl: Make prefetch_disable_bits belong to the arch code
  x86/resctrl: Make resctrl_arch_pseudo_lock_fn() take a plr
  x86/resctrl: Move RFTYPE flags to be managed by resctrl
  x86/resctrl: Handle throttle_mode for SMBA resources
  x86/resctrl: Move get_config_index() to a header
  x86/resctrl: Claim get_{mon,ctrl}_domain_from_cpu() helpers for
    resctrl
  x86/resctrl: Rename resctrl_sched_in() to begin with "resctrl_arch_"
  x86/resctrl: resctrl_exit() teardown resctrl but leave the mount point
  x86/resctrl: Drop __init/__exit on assorted symbols
  x86/resctrl: Move is_mba_sc() out of core.c
  x86/resctrl: Add end-marker to the resctrl_event_id enum
  x86/restrl: Expand the width of dom_id by replacing mon_data_bits
  x86/resctrl: Remove a newline to avoid confusing the code move script
  x86/resctrl: Split trace.h
  fs/resctrl: Add boiler plate for external resctrl code
  x86/resctrl: Move the filesystem bits to headers visible to fs/resctrl
  x86/resctrl: Add python script to move resctrl code to /fs/resctrl

 MAINTAINERS                                   |   2 +
 arch/Kconfig                                  |   8 +
 arch/x86/Kconfig                              |   6 +-
 arch/x86/include/asm/resctrl.h                |  43 +-
 arch/x86/kernel/cpu/resctrl/Makefile          |   8 +-
 arch/x86/kernel/cpu/resctrl/core.c            | 206 ++---
 arch/x86/kernel/cpu/resctrl/ctrlmondata.c     |  90 +-
 arch/x86/kernel/cpu/resctrl/internal.h        | 251 ++----
 arch/x86/kernel/cpu/resctrl/monitor.c         | 114 ++-
 arch/x86/kernel/cpu/resctrl/monitor_trace.h   |  31 +
 arch/x86/kernel/cpu/resctrl/pseudo_lock.c     |  59 +-
 .../resctrl/{trace.h => pseudo_lock_trace.h}  |  24 +-
 arch/x86/kernel/cpu/resctrl/rdtgroup.c        | 388 ++++++---
 arch/x86/kernel/process_32.c                  |   2 +-
 arch/x86/kernel/process_64.c                  |   2 +-
 fs/Kconfig                                    |   1 +
 fs/Makefile                                   |   1 +
 fs/resctrl/Kconfig                            |  37 +
 fs/resctrl/Makefile                           |   6 +
 fs/resctrl/ctrlmondata.c                      |   0
 fs/resctrl/internal.h                         |   0
 fs/resctrl/monitor.c                          |   0
 fs/resctrl/monitor_trace.h                    |   0
 fs/resctrl/pseudo_lock.c                      |   0
 fs/resctrl/pseudo_lock_trace.h                |   0
 fs/resctrl/rdtgroup.c                         |   0
 include/linux/resctrl.h                       | 273 +++++-
 include/linux/resctrl_types.h                 |  59 ++
 resctrl_copy_pasta.py                         | 812 ++++++++++++++++++
 29 files changed, 1821 insertions(+), 602 deletions(-)
 create mode 100644 arch/x86/kernel/cpu/resctrl/monitor_trace.h
 rename arch/x86/kernel/cpu/resctrl/{trace.h => pseudo_lock_trace.h} (56%)
 create mode 100644 fs/resctrl/Kconfig
 create mode 100644 fs/resctrl/Makefile
 create mode 100644 fs/resctrl/ctrlmondata.c
 create mode 100644 fs/resctrl/internal.h
 create mode 100644 fs/resctrl/monitor.c
 create mode 100644 fs/resctrl/monitor_trace.h
 create mode 100644 fs/resctrl/pseudo_lock.c
 create mode 100644 fs/resctrl/pseudo_lock_trace.h
 create mode 100644 fs/resctrl/rdtgroup.c
 create mode 100644 include/linux/resctrl_types.h
 create mode 100644 resctrl_copy_pasta.py

-- 
2.39.2

