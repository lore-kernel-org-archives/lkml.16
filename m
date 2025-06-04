Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9E41F4C8C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 09:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749030687; cv=none; b=EvUiII54jIJoadpc+MK6kIqdy0+Aw0vA2CVpa5rc3uNCqfg3vFUhR7jQeqlB3yhNCIypRFYda//QmarWUGUm/bWcI2tZAWjWEFj/IaThQ5soSOGuigl4p8pdg6wezjj0v5YkRdzeqBuMPlk6L3OqmozUg1LsbDObEvZoXZlIp2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749030687; c=relaxed/simple;
	bh=Ho1O+9wmQfoTB7KOV0bWDiX8dWlZiNJ3mNiwerX/VZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ulfL8nVH2aBGDGub9wT6wiZdr6PbX1lbrKadCP9bpqd3vTaIgS+MuJP6Oh+m+7uTbl26DwKV4g6kDZGz3ggCLuuo47Hrf8JCDnYprO3QxwkfatnUNeZvWkSZwFZDemWYBsr40nxFWYbT495ggmRGH0081rMDSzuZfZRp0Uk4NFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.helo=mgamail.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a80LNb0G; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.helo=mgamail.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a80LNb0G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749030686; x=1780566686;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Ho1O+9wmQfoTB7KOV0bWDiX8dWlZiNJ3mNiwerX/VZ8=;
  b=a80LNb0G+f3KrcB72pCZz2JZhf7MJCZwecD2q37kKzO5YxZInNhMTiZ3
   MKbIhGTpEs5UJqiC/4UNBcCihhxIRBF7f2uN1JvsNftVc0/IOOWYZpEKA
   0JpkPecgVtqdvkHSc4zLT6hFQ50Z0XngY8F5YmSFMEyWtX2Hwar4XUej2
   e18xRiuRwV1awpmf+1VGgdJoxxfxeTQfAgZP4nBhcTUYlBwcxX0T217GV
   4R4DplR0ukXnlQyPcvk4Gzf0+WV1Q69EQPlZ8FDYvj/v7TEi2oGeLpL98
   dz6a9bu31NpoBi+AvFqwbTh8nAF6zA7gDhv775yTSQ9PaZcKvIGCohEdT
   g==;
X-CSE-ConnectionGUID: iGjqdfxxTa+ab+P2NM+c1w==
X-CSE-MsgGUID: 09fRNl7DQMySbRrDYqVu0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="76489249"
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; 
   d="scan'208";a="76489249"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 02:51:25 -0700
X-CSE-ConnectionGUID: GiUBNCIJQEabWNIMVq834Q==
X-CSE-MsgGUID: 0O7V5tS/QjCNCdTs7jLdPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; 
   d="scan'208";a="145157138"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa009.jf.intel.com with ESMTP; 04 Jun 2025 02:51:21 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id F0ED63D8; Wed, 04 Jun 2025 12:51:19 +0300 (EEST)
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>
Cc: lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	hannes@cmpxchg.org,
	shakeel.butt@linux.dev,
	muchun.song@linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Konstantin Khlebnikov <koct9i@gmail.com>
Subject: [PATCH] mm/vmstat: Fix build with MEMCG=y and VM_EVENT_COUNTERS=n
Date: Wed,  4 Jun 2025 12:51:11 +0300
Message-ID: <20250604095111.533783-1-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When compiling with MEMCG enabled but VM_EVENT_COUNTERS disabled,
BUILD_BUG_ON() is triggered in vmstat_start because the vmstat_text
array is larger than NR_VMSTAT_ITEMS.

This issue arises because some elements of the vmstat_text array are
present when either MEMCG or VM_EVENT_COUNTERS is enabled, but
NR_VMSTAT_ITEMS only accounts for these elements if VM_EVENT_COUNTERS is
enabled.

The recent change in the BUILD_BUG_ON() check made it more strict,
disallowing extra elements in the array, which revealed the issue.

Instead of adjusting the NR_VMSTAT_ITEMS definition to account for
MEMCG, make MEMCG select VM_EVENT_COUNTERS. VM_EVENT_COUNTERS is
enabled in most configurations anyway.

There is no need to backport this fix to stable trees. Without the
strict BUILD_BUG_ON(), the issue is not harmful. The elements in
question would only be read by the memcg code, not by /proc/vmstat.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Fixes: ebc5d83d0443 ("mm/memcontrol: use vmstat names for printing statistics")
Cc: Konstantin Khlebnikov <koct9i@gmail.com>
---
 include/linux/vmstat.h | 4 ++--
 init/Kconfig           | 1 +
 mm/vmstat.c            | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/include/linux/vmstat.h b/include/linux/vmstat.h
index b2ccb6845595..c287998908bf 100644
--- a/include/linux/vmstat.h
+++ b/include/linux/vmstat.h
@@ -507,7 +507,7 @@ static inline const char *lru_list_name(enum lru_list lru)
 	return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
 }
 
-#if defined(CONFIG_VM_EVENT_COUNTERS) || defined(CONFIG_MEMCG)
+#if defined(CONFIG_VM_EVENT_COUNTERS)
 static inline const char *vm_event_name(enum vm_event_item item)
 {
 	return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
@@ -516,7 +516,7 @@ static inline const char *vm_event_name(enum vm_event_item item)
 			   NR_VM_STAT_ITEMS +
 			   item];
 }
-#endif /* CONFIG_VM_EVENT_COUNTERS || CONFIG_MEMCG */
+#endif /* CONFIG_VM_EVENT_COUNTERS */
 
 #ifdef CONFIG_MEMCG
 
diff --git a/init/Kconfig b/init/Kconfig
index ab83abe0fd9d..dd332cac6036 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -989,6 +989,7 @@ config MEMCG
 	select PAGE_COUNTER
 	select EVENTFD
 	select SLAB_OBJ_EXT
+	select VM_EVENT_COUNTERS
 	help
 	  Provides control over the memory footprint of tasks in a cgroup.
 
diff --git a/mm/vmstat.c b/mm/vmstat.c
index 27dc37168cfd..c3114b8826e4 100644
--- a/mm/vmstat.c
+++ b/mm/vmstat.c
@@ -1301,7 +1301,7 @@ const char * const vmstat_text[] = {
 	[I(NR_MEMMAP_BOOT_PAGES)]		= "nr_memmap_boot_pages",
 #undef I
 
-#if defined(CONFIG_VM_EVENT_COUNTERS) || defined(CONFIG_MEMCG)
+#if defined(CONFIG_VM_EVENT_COUNTERS)
 	/* enum vm_event_item counters */
 #define I(x) (NR_VM_ZONE_STAT_ITEMS + NR_VM_NUMA_EVENT_ITEMS + \
 	     NR_VM_NODE_STAT_ITEMS + NR_VM_STAT_ITEMS + x)
@@ -1498,7 +1498,7 @@ const char * const vmstat_text[] = {
 #endif
 #endif
 #undef I
-#endif /* CONFIG_VM_EVENT_COUNTERS || CONFIG_MEMCG */
+#endif /* CONFIG_VM_EVENT_COUNTERS */
 };
 #endif /* CONFIG_PROC_FS || CONFIG_SYSFS || CONFIG_NUMA || CONFIG_MEMCG */
 
-- 
2.47.2

