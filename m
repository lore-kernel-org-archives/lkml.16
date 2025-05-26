Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BC01A314B
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 12:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748261778; cv=none; b=XgusABLZPMQmUow5fwGLR/Jn/5W7oVK6yWRcPnIxhdpPAjNq5Mwbrwz8YgE4Vl+Fdt1YoWJPCGke2NJpMVgJL7X1kvLZLRi40NDErqFuiqT0MEQNOgi0nWOt5cTkFJK+zQpoFnzW3iZIM69k0waDORE/1iMxMu1U3ibO1rIwQbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748261778; c=relaxed/simple;
	bh=RR8OMxlu7wBn0n94D2SZ/cp1eLMg3bwNsBtKW/W4Y1g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vBeQ/1YzZQI1vwxKdHmVSQaKdv7RMfjfz3naAUztoHGJgWu5dsFWl4rIx55xeL/BFgQoey0fgKDWYKVnDLgedcGegT6YhT4XtsX+UtSQr3qShuEDHPM0B8+Egy0KwdB0GvWR15aPDLTj1LyMW2oG2jK/sgovHTgSCydOCgD60so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=NRJUw+pN; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="NRJUw+pN"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 10D5240E0163;
	Mon, 26 May 2025 12:16:10 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id tJbZogHIOiCb; Mon, 26 May 2025 12:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1748261761; bh=NMu/nIAYLej8WWCSxO31S0a5rvVDjYmAU8g31onpMec=;
	h=Date:From:To:Cc:Subject:From;
	b=NRJUw+pNUVNEykr4qr82uAzRlIhGB+hBXpx7tNxt4FtOvfMrMGWRVCXlwBpsKLICr
	 jeO17f4JqnYk0h/z0bUUQC8UTu3IylZ0IhsF5xT2932Gs6APstmJ6Nup/sGY/rQyFM
	 9VOY1PLHQVOwfcwtyhlg4biC4M76IoUGrKyhjjZw/guvaHZGtYr9tiIe2n+pHpQ46a
	 MNQ4vrkB1qsaln2puXByk4q8BYKSStr/fNttKZmoepj4iVavHuayl0qvEJQCRv5zyn
	 DI//W6ulYcqZdQGkpBbpbhpOiIkzl1cj4TfM4fcFW7Son5b3EJoanFa1zaI2vFgyVx
	 4k3FWSnL3Fk6xbmXzn8m84JbMkT/49Tom91FY1OX8vklf2d0iROwgQEGkZihyOWo6F
	 qo3rQbV9oW3WqgwvZ3Z771pcuuXtKFlvJhsyAnjNAn3bcnBqnGK8FSoJHHKm54CnP3
	 ZWQJbEtpEdlcbcAWdlguG1UKI2GFMzxDjJeWJ7v9arADL9tqEuwJp+5wbYd06j4SA+
	 tiYV6aOSb0mLDaDFVsiEdvaAQl/QewK1nXpwA+OM5tGBrNL2Ulvei0SsVK+i5qzxwC
	 bmGHGOUB2Dpgdz+R/YIwZjYn3ec8w2fow2U5PREVK2pEEM26Gr6S0DUJVF9yL8s1X9
	 lzt31Eq7qgYMMCsVNg5rMArk=
Received: from zn.tnic (p57969c58.dip0.t-ipconnect.de [87.150.156.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 5009740E01A8;
	Mon, 26 May 2025 12:15:58 +0000 (UTC)
Date: Mon, 26 May 2025 14:15:50 +0200
From: Borislav Petkov <bp@alien8.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: x86-ml <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] x86/cache for v6.16-rc1
Message-ID: <20250526121550.GAaDRbdu2IYM7xuwxd@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Linus,

please pull the x86/cache lineup for v6.16-rc1.

I have an example at the end of this mail how I've resolved the merge
conflicts if I merge the tip branches in the order you've received them and
the resolution builds fine but that doesn't mean a whole lot...

Thx.

---

The following changes since commit 82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3:

  Linux 6.15-rc6 (2025-05-11 14:54:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip tags/x86_cache_for_v6.16_rc1

for you to fetch changes up to 54d14f25664bbb75c2928dd0d64a095c0f488176:

  MAINTAINERS: Add reviewers for fs/resctrl (2025-05-16 14:36:42 +0200)

----------------------------------------------------------------
Carve out the resctrl filesystem-related code into fs/resctrl/ so that
multiple architectures can share the fs API for manipulating their
respective hw resource control implementation. This is the second step
in the work towards sharing the resctrl filesystem interface, the next
one being plugging ARM's MPAM into the aforementioned fs API.

----------------------------------------------------------------
Amit Singh Tomar (1):
      x86/resctrl: Remove the limit on the number of CLOSID

Dave Martin (3):
      x86/resctrl: Squelch whitespace anomalies in resctrl core code
      x86/resctrl: Prefer alloc(sizeof(*foo)) idiom in rdt_init_fs_context()
      x86/resctrl: Relax some asm #includes

James Morse (17):
      x86/resctrl: Rename resctrl_sched_in() to begin with "resctrl_arch_"
      x86/resctrl: Check all domains are offline in resctrl_exit()
      x86/resctrl: Resctrl_exit() teardown resctrl but leave the mount point
      x86/resctrl: Drop __init/__exit on assorted symbols
      x86/resctrl: Move is_mba_sc() out of core.c
      x86/resctrl: Add end-marker to the resctrl_event_id enum
      x86/resctrl: Expand the width of domid by replacing mon_data_bits
      x86/resctrl: Split trace.h
      x86/resctrl: Add 'resctrl' to the title of the resctrl documentation
      fs/resctrl: Add boiler plate for external resctrl code
      x86/resctrl: Move the filesystem bits to headers visible to fs/resctrl
      x86/resctrl: Move enum resctrl_event_id to resctrl.h
      x86/resctrl: Fix types in resctrl_arch_mon_ctx_{alloc,free}() stubs
      x86/resctrl: Move pseudo lock prototypes to include/linux/resctrl.h
      x86/resctrl: Always initialise rid field in rdt_resources_all[]
      x86,fs/resctrl: Move the resctrl filesystem code to live in /fs/resctrl
      MAINTAINERS: Add reviewers for fs/resctrl

Yury Norov [NVIDIA] (4):
      cpumask: Relax cpumask_any_but()
      find: Add find_first_andnot_bit()
      cpumask: Add cpumask_{first,next}_andnot() API
      x86/resctrl: Optimize cpumask_any_housekeeping()

 Documentation/arch/x86/index.rst                   |    1 -
 Documentation/filesystems/index.rst                |    1 +
 .../{arch/x86 => filesystems}/resctrl.rst          |    6 +-
 MAINTAINERS                                        |    5 +-
 arch/Kconfig                                       |    8 +
 arch/x86/Kconfig                                   |   11 +-
 arch/x86/include/asm/resctrl.h                     |   19 +-
 arch/x86/kernel/cpu/resctrl/Makefile               |    2 +
 arch/x86/kernel/cpu/resctrl/core.c                 |   31 +-
 arch/x86/kernel/cpu/resctrl/ctrlmondata.c          |  635 ---
 arch/x86/kernel/cpu/resctrl/internal.h             |  397 +-
 arch/x86/kernel/cpu/resctrl/monitor.c              |  918 +---
 arch/x86/kernel/cpu/resctrl/pseudo_lock.c          | 1092 +----
 .../cpu/resctrl/{trace.h => pseudo_lock_trace.h}   |   26 +-
 arch/x86/kernel/cpu/resctrl/rdtgroup.c             | 4432 +-------------------
 arch/x86/kernel/process_32.c                       |    2 +-
 arch/x86/kernel/process_64.c                       |    2 +-
 fs/Kconfig                                         |    1 +
 fs/Makefile                                        |    1 +
 fs/resctrl/Kconfig                                 |   39 +
 fs/resctrl/Makefile                                |    6 +
 fs/resctrl/ctrlmondata.c                           |  661 +++
 fs/resctrl/internal.h                              |  426 ++
 fs/resctrl/monitor.c                               |  929 ++++
 fs/resctrl/monitor_trace.h                         |   33 +
 fs/resctrl/pseudo_lock.c                           | 1105 +++++
 fs/resctrl/rdtgroup.c                              | 4353 +++++++++++++++++++
 include/linux/cpumask.h                            |   75 +-
 include/linux/find.h                               |   25 +
 include/linux/resctrl.h                            |   38 +-
 include/linux/resctrl_types.h                      |   16 +-
 lib/find_bit.c                                     |   11 +
 32 files changed, 7906 insertions(+), 7401 deletions(-)
 rename Documentation/{arch/x86 => filesystems}/resctrl.rst (99%)
 rename arch/x86/kernel/cpu/resctrl/{trace.h => pseudo_lock_trace.h} (56%)
 create mode 100644 fs/resctrl/Kconfig
 create mode 100644 fs/resctrl/Makefile
 create mode 100644 fs/resctrl/ctrlmondata.c
 create mode 100644 fs/resctrl/internal.h
 create mode 100644 fs/resctrl/monitor.c
 create mode 100644 fs/resctrl/monitor_trace.h
 create mode 100644 fs/resctrl/pseudo_lock.c
 create mode 100644 fs/resctrl/rdtgroup.c

---
commit a2411468c5747e0d9a087f5f1f4898373ab7f622 (HEAD -> refs/heads/merge-test, refs/remotes/amd3/merge-test)
Merge: 9f79fbe16a26 54d14f25664b
Author: Borislav Petkov (AMD) <bp@alien8.de>
Date:   Mon May 26 13:50:25 2025 +0200

    Merge tag 'x86_cache_for_v6.16_rc1' into merge-test
    
    Carve out the resctrl filesystem-related code into fs/resctrl/ so that
    multiple architectures can share the fs API for manipulating their
    respective hw resource control implementation. This is the second step
    in the work towards sharing the resctrl filesystem interface, the next
    one being plugging ARM's MPAM into the aforementioned fs API.
    
    Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>

diff --cc arch/x86/kernel/cpu/resctrl/monitor.c
index 591b0b44d260,3fc4d9f56f0d..c261558276cd
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@@ -18,63 -18,11 +18,12 @@@
  #define pr_fmt(fmt)	"resctrl: " fmt
  
  #include <linux/cpu.h>
- #include <linux/module.h>
- #include <linux/sizes.h>
- #include <linux/slab.h>
+ #include <linux/resctrl.h>
  
  #include <asm/cpu_device_id.h>
 +#include <asm/msr.h>
- #include <asm/resctrl.h>
  
  #include "internal.h"
- #include "trace.h"
- 
- /**
-  * struct rmid_entry - dirty tracking for all RMID.
-  * @closid:	The CLOSID for this entry.
-  * @rmid:	The RMID for this entry.
-  * @busy:	The number of domains with cached data using this RMID.
-  * @list:	Member of the rmid_free_lru list when busy == 0.
-  *
-  * Depending on the architecture the correct monitor is accessed using
-  * both @closid and @rmid, or @rmid only.
-  *
-  * Take the rdtgroup_mutex when accessing.
-  */
- struct rmid_entry {
- 	u32				closid;
- 	u32				rmid;
- 	int				busy;
- 	struct list_head		list;
- };
- 
- /*
-  * @rmid_free_lru - A least recently used list of free RMIDs
-  *     These RMIDs are guaranteed to have an occupancy less than the
-  *     threshold occupancy
-  */
- static LIST_HEAD(rmid_free_lru);
- 
- /*
-  * @closid_num_dirty_rmid    The number of dirty RMID each CLOSID has.
-  *     Only allocated when CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID is defined.
-  *     Indexed by CLOSID. Protected by rdtgroup_mutex.
-  */
- static u32 *closid_num_dirty_rmid;
- 
- /*
-  * @rmid_limbo_count - count of currently unused but (potentially)
-  *     dirty RMIDs.
-  *     This counts RMIDs that no one is currently using but that
-  *     may have a occupancy value > resctrl_rmid_realloc_threshold. User can
-  *     change the threshold occupancy value.
-  */
- static unsigned int rmid_limbo_count;
- 
- /*
-  * @rmid_entry - The entry in the limbo and free lists.
-  */
- static struct rmid_entry	*rmid_ptrs;
  
  /*
   * Global boolean for rdt_monitor which is true if any
diff --cc arch/x86/kernel/cpu/resctrl/pseudo_lock.c
index 1190c48a16b2,241d0d7e1cb5..de580eca3363
--- a/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
+++ b/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
@@@ -11,21 -11,14 +11,15 @@@
  
  #define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
  
+ #include <linux/cacheflush.h>
  #include <linux/cpu.h>
- #include <linux/cpumask.h>
- #include <linux/debugfs.h>
- #include <linux/kthread.h>
- #include <linux/mman.h>
  #include <linux/perf_event.h>
  #include <linux/pm_qos.h>
- #include <linux/slab.h>
- #include <linux/uaccess.h>
+ #include <linux/resctrl.h>
  
- #include <asm/cacheflush.h>
  #include <asm/cpu_device_id.h>
- #include <asm/resctrl.h>
  #include <asm/perf_event.h>
 +#include <asm/msr.h>
  
  #include "../../events/perf_event.h" /* For X86_CONFIG() */
  #include "internal.h"
diff --cc arch/x86/kernel/cpu/resctrl/rdtgroup.c
index c85ace29ea3a,c7a7f0ae373a..661024569394
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@@ -28,275 -29,142 +29,144 @@@
  
  #include <uapi/linux/magic.h>
  
 +#include <asm/msr.h>
- #include <asm/resctrl.h>
++
  #include "internal.h"
  
  DEFINE_STATIC_KEY_FALSE(rdt_enable_key);
- DEFINE_STATIC_KEY_FALSE(rdt_mon_enable_key);
- DEFINE_STATIC_KEY_FALSE(rdt_alloc_enable_key);
- 
- /* Mutex to protect rdtgroup access. */
- DEFINE_MUTEX(rdtgroup_mutex);
- 
- static struct kernfs_root *rdt_root;
- struct rdtgroup rdtgroup_default;
- LIST_HEAD(rdt_all_groups);
- 
- /* list of entries for the schemata file */
- LIST_HEAD(resctrl_schema_all);
- 
- /* The filesystem can only be mounted once. */
- bool resctrl_mounted;
- 
- /* Kernel fs node for "info" directory under root */
- static struct kernfs_node *kn_info;
  
- /* Kernel fs node for "mon_groups" directory under root */
- static struct kernfs_node *kn_mongrp;
- 
- /* Kernel fs node for "mon_data" directory under root */
- static struct kernfs_node *kn_mondata;
- 
- /*
-  * Used to store the max resource name width to display the schemata names in
-  * a tabular format.
-  */
- int max_name_width;
- 
- static struct seq_buf last_cmd_status;
- static char last_cmd_status_buf[512];
- 
- static int rdtgroup_setup_root(struct rdt_fs_context *ctx);
- static void rdtgroup_destroy_root(void);
+ DEFINE_STATIC_KEY_FALSE(rdt_mon_enable_key);
  
- struct dentry *debugfs_resctrl;
+ DEFINE_STATIC_KEY_FALSE(rdt_alloc_enable_key);
  
  /*
-  * Memory bandwidth monitoring event to use for the default CTRL_MON group
-  * and each new CTRL_MON group created by the user.  Only relevant when
-  * the filesystem is mounted with the "mba_MBps" option so it does not
-  * matter that it remains uninitialized on systems that do not support
-  * the "mba_MBps" option.
+  * This is safe against resctrl_arch_sched_in() called from __switch_to()
+  * because __switch_to() is executed with interrupts disabled. A local call
+  * from update_closid_rmid() is protected against __switch_to() because
+  * preemption is disabled.
   */
- enum resctrl_event_id mba_mbps_default_event;
- 
- static bool resctrl_debug;
- 
- void rdt_last_cmd_clear(void)
- {
- 	lockdep_assert_held(&rdtgroup_mutex);
- 	seq_buf_clear(&last_cmd_status);
- }
- 
- void rdt_last_cmd_puts(const char *s)
- {
- 	lockdep_assert_held(&rdtgroup_mutex);
- 	seq_buf_puts(&last_cmd_status, s);
- }
- 
- void rdt_last_cmd_printf(const char *fmt, ...)
- {
- 	va_list ap;
- 
- 	va_start(ap, fmt);
- 	lockdep_assert_held(&rdtgroup_mutex);
- 	seq_buf_vprintf(&last_cmd_status, fmt, ap);
- 	va_end(ap);
- }
- 
- void rdt_staged_configs_clear(void)
+ void resctrl_arch_sync_cpu_closid_rmid(void *info)
  {
- 	struct rdt_ctrl_domain *dom;
- 	struct rdt_resource *r;
- 
- 	lockdep_assert_held(&rdtgroup_mutex);
+ 	struct resctrl_cpu_defaults *r = info;
  
- 	for_each_alloc_capable_rdt_resource(r) {
- 		list_for_each_entry(dom, &r->ctrl_domains, hdr.list)
- 			memset(dom->staged_config, 0, sizeof(dom->staged_config));
+ 	if (r) {
+ 		this_cpu_write(pqr_state.default_closid, r->closid);
+ 		this_cpu_write(pqr_state.default_rmid, r->rmid);
  	}
- }
  
- static bool resctrl_is_mbm_enabled(void)
- {
- 	return (resctrl_arch_is_mbm_total_enabled() ||
- 		resctrl_arch_is_mbm_local_enabled());
+ 	/*
+ 	 * We cannot unconditionally write the MSR because the current
+ 	 * executing task might have its own closid selected. Just reuse
+ 	 * the context switch code.
+ 	 */
+ 	resctrl_arch_sched_in(current);
  }
  
- static bool resctrl_is_mbm_event(int e)
- {
- 	return (e >= QOS_L3_MBM_TOTAL_EVENT_ID &&
- 		e <= QOS_L3_MBM_LOCAL_EVENT_ID);
- }
+ #define INVALID_CONFIG_INDEX   UINT_MAX
  
- /*
-  * Trivial allocator for CLOSIDs. Since h/w only supports a small number,
-  * we can keep a bitmap of free CLOSIDs in a single integer.
+ /**
+  * mon_event_config_index_get - get the hardware index for the
+  *                              configurable event
+  * @evtid: event id.
   *
-  * Using a global CLOSID across all resources has some advantages and
-  * some drawbacks:
-  * + We can simply set current's closid to assign a task to a resource
-  *   group.
-  * + Context switch code can avoid extra memory references deciding which
-  *   CLOSID to load into the PQR_ASSOC MSR
-  * - We give up some options in configuring resource groups across multi-socket
-  *   systems.
-  * - Our choices on how to configure each resource become progressively more
-  *   limited as the number of resources grows.
+  * Return: 0 for evtid == QOS_L3_MBM_TOTAL_EVENT_ID
+  *         1 for evtid == QOS_L3_MBM_LOCAL_EVENT_ID
+  *         INVALID_CONFIG_INDEX for invalid evtid
   */
- static unsigned long closid_free_map;
- static int closid_free_map_len;
- 
- int closids_supported(void)
- {
- 	return closid_free_map_len;
- }
- 
- static void closid_init(void)
+ static inline unsigned int mon_event_config_index_get(u32 evtid)
  {
- 	struct resctrl_schema *s;
- 	u32 rdt_min_closid = 32;
- 
- 	/* Compute rdt_min_closid across all resources */
- 	list_for_each_entry(s, &resctrl_schema_all, list)
- 		rdt_min_closid = min(rdt_min_closid, s->num_closid);
- 
- 	closid_free_map = BIT_MASK(rdt_min_closid) - 1;
- 
- 	/* RESCTRL_RESERVED_CLOSID is always reserved for the default group */
- 	__clear_bit(RESCTRL_RESERVED_CLOSID, &closid_free_map);
- 	closid_free_map_len = rdt_min_closid;
+ 	switch (evtid) {
+ 	case QOS_L3_MBM_TOTAL_EVENT_ID:
+ 		return 0;
+ 	case QOS_L3_MBM_LOCAL_EVENT_ID:
+ 		return 1;
+ 	default:
+ 		/* Should never reach here */
+ 		return INVALID_CONFIG_INDEX;
+ 	}
  }
  
- static int closid_alloc(void)
+ void resctrl_arch_mon_event_config_read(void *_config_info)
  {
- 	int cleanest_closid;
- 	u32 closid;
- 
- 	lockdep_assert_held(&rdtgroup_mutex);
+ 	struct resctrl_mon_config_info *config_info = _config_info;
+ 	unsigned int index;
+ 	u64 msrval;
  
- 	if (IS_ENABLED(CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID) &&
- 	    resctrl_arch_is_llc_occupancy_enabled()) {
- 		cleanest_closid = resctrl_find_cleanest_closid();
- 		if (cleanest_closid < 0)
- 			return cleanest_closid;
- 		closid = cleanest_closid;
- 	} else {
- 		closid = ffs(closid_free_map);
- 		if (closid == 0)
- 			return -ENOSPC;
- 		closid--;
+ 	index = mon_event_config_index_get(config_info->evtid);
+ 	if (index == INVALID_CONFIG_INDEX) {
+ 		pr_warn_once("Invalid event id %d\n", config_info->evtid);
+ 		return;
  	}
- 	__clear_bit(closid, &closid_free_map);
- 
- 	return closid;
- }
- 
- void closid_free(int closid)
- {
- 	lockdep_assert_held(&rdtgroup_mutex);
 -	rdmsrl(MSR_IA32_EVT_CFG_BASE + index, msrval);
++	rdmsrq(MSR_IA32_EVT_CFG_BASE + index, msrval);
  
- 	__set_bit(closid, &closid_free_map);
+ 	/* Report only the valid event configuration bits */
+ 	config_info->mon_config = msrval & MAX_EVT_CONFIG_BITS;
  }
  
- /**
-  * closid_allocated - test if provided closid is in use
-  * @closid: closid to be tested
-  *
-  * Return: true if @closid is currently associated with a resource group,
-  * false if @closid is free
-  */
- bool closid_allocated(unsigned int closid)
+ void resctrl_arch_mon_event_config_write(void *_config_info)
  {
- 	lockdep_assert_held(&rdtgroup_mutex);
+ 	struct resctrl_mon_config_info *config_info = _config_info;
+ 	unsigned int index;
  
- 	return !test_bit(closid, &closid_free_map);
+ 	index = mon_event_config_index_get(config_info->evtid);
+ 	if (index == INVALID_CONFIG_INDEX) {
+ 		pr_warn_once("Invalid event id %d\n", config_info->evtid);
+ 		return;
+ 	}
 -	wrmsr(MSR_IA32_EVT_CFG_BASE + index, config_info->mon_config, 0);
++	wrmsrq(MSR_IA32_EVT_CFG_BASE + index, config_info->mon_config);
  }
  
- /**
-  * rdtgroup_mode_by_closid - Return mode of resource group with closid
-  * @closid: closid if the resource group
-  *
-  * Each resource group is associated with a @closid. Here the mode
-  * of a resource group can be queried by searching for it using its closid.
-  *
-  * Return: mode as &enum rdtgrp_mode of resource group with closid @closid
-  */
- enum rdtgrp_mode rdtgroup_mode_by_closid(int closid)
+ static void l3_qos_cfg_update(void *arg)
  {
- 	struct rdtgroup *rdtgrp;
- 
- 	list_for_each_entry(rdtgrp, &rdt_all_groups, rdtgroup_list) {
- 		if (rdtgrp->closid == closid)
- 			return rdtgrp->mode;
- 	}
+ 	bool *enable = arg;
  
- 	return RDT_NUM_MODES;
 -	wrmsrl(MSR_IA32_L3_QOS_CFG, *enable ? L3_QOS_CDP_ENABLE : 0ULL);
++	wrmsrq(MSR_IA32_L3_QOS_CFG, *enable ? L3_QOS_CDP_ENABLE : 0ULL);
  }
  
- static const char * const rdt_mode_str[] = {
- 	[RDT_MODE_SHAREABLE]		= "shareable",
- 	[RDT_MODE_EXCLUSIVE]		= "exclusive",
- 	[RDT_MODE_PSEUDO_LOCKSETUP]	= "pseudo-locksetup",
- 	[RDT_MODE_PSEUDO_LOCKED]	= "pseudo-locked",
- };
- 
- /**
-  * rdtgroup_mode_str - Return the string representation of mode
-  * @mode: the resource group mode as &enum rdtgroup_mode
-  *
-  * Return: string representation of valid mode, "unknown" otherwise
-  */
- static const char *rdtgroup_mode_str(enum rdtgrp_mode mode)
+ static void l2_qos_cfg_update(void *arg)
  {
- 	if (mode < RDT_MODE_SHAREABLE || mode >= RDT_NUM_MODES)
- 		return "unknown";
+ 	bool *enable = arg;
  
- 	return rdt_mode_str[mode];
 -	wrmsrl(MSR_IA32_L2_QOS_CFG, *enable ? L2_QOS_CDP_ENABLE : 0ULL);
++	wrmsrq(MSR_IA32_L2_QOS_CFG, *enable ? L2_QOS_CDP_ENABLE : 0ULL);
  }
  
- /* set uid and gid of rdtgroup dirs and files to that of the creator */
- static int rdtgroup_kn_set_ugid(struct kernfs_node *kn)
+ static int set_cache_qos_cfg(int level, bool enable)
  {
- 	struct iattr iattr = { .ia_valid = ATTR_UID | ATTR_GID,
- 				.ia_uid = current_fsuid(),
- 				.ia_gid = current_fsgid(), };
- 
- 	if (uid_eq(iattr.ia_uid, GLOBAL_ROOT_UID) &&
- 	    gid_eq(iattr.ia_gid, GLOBAL_ROOT_GID))
- 		return 0;
+ 	void (*update)(void *arg);
+ 	struct rdt_ctrl_domain *d;
+ 	struct rdt_resource *r_l;
+ 	cpumask_var_t cpu_mask;
+ 	int cpu;
  
- 	return kernfs_setattr(kn, &iattr);
- }
+ 	/* Walking r->domains, ensure it can't race with cpuhp */
+ 	lockdep_assert_cpus_held();
  
- static int rdtgroup_add_file(struct kernfs_node *parent_kn, struct rftype *rft)
- {
- 	struct kernfs_node *kn;
- 	int ret;
+ 	if (level == RDT_RESOURCE_L3)
+ 		update = l3_qos_cfg_update;
+ 	else if (level == RDT_RESOURCE_L2)
+ 		update = l2_qos_cfg_update;
+ 	else
+ 		return -EINVAL;
  
- 	kn = __kernfs_create_file(parent_kn, rft->name, rft->mode,
- 				  GLOBAL_ROOT_UID, GLOBAL_ROOT_GID,
- 				  0, rft->kf_ops, rft, NULL, NULL);
- 	if (IS_ERR(kn))
- 		return PTR_ERR(kn);
+ 	if (!zalloc_cpumask_var(&cpu_mask, GFP_KERNEL))
+ 		return -ENOMEM;
  
- 	ret = rdtgroup_kn_set_ugid(kn);
- 	if (ret) {
- 		kernfs_remove(kn);
- 		return ret;
+ 	r_l = &rdt_resources_all[level].r_resctrl;
+ 	list_for_each_entry(d, &r_l->ctrl_domains, hdr.list) {
+ 		if (r_l->cache.arch_has_per_cpu_cfg)
+ 			/* Pick all the CPUs in the domain instance */
+ 			for_each_cpu(cpu, &d->hdr.cpu_mask)
+ 				cpumask_set_cpu(cpu, cpu_mask);
+ 		else
+ 			/* Pick one CPU from each domain instance to update MSR */
+ 			cpumask_set_cpu(cpumask_any(&d->hdr.cpu_mask), cpu_mask);
  	}
  
- 	return 0;
- }
+ 	/* Update QOS_CFG MSR on all the CPUs in cpu_mask */
+ 	on_each_cpu_mask(cpu_mask, update, &enable, 1);
  
- static int rdtgroup_seqfile_show(struct seq_file *m, void *arg)
- {
- 	struct kernfs_open_file *of = m->private;
- 	struct rftype *rft = of->kn->priv;
+ 	free_cpumask_var(cpu_mask);
  
- 	if (rft->seq_show)
- 		return rft->seq_show(of, m, arg);
  	return 0;
  }
  
diff --cc arch/x86/kernel/process_32.c
index 9bd4fa694da5,f1429fdac11c..a10e180cbf23
--- a/arch/x86/kernel/process_32.c
+++ b/arch/x86/kernel/process_32.c
@@@ -207,8 -208,10 +207,8 @@@ __switch_to(struct task_struct *prev_p
  
  	raw_cpu_write(current_task, next_p);
  
 -	switch_fpu_finish(next_p);
 -
  	/* Load the Intel cache allocation PQR MSR. */
- 	resctrl_sched_in(next_p);
+ 	resctrl_arch_sched_in(next_p);
  
  	return prev_p;
  }


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
