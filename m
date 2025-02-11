Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAD7A1F4E4F
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 11:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739272600; cv=none; b=KXnSI6FOTrZRQ6aZE67VANrxhIMEnhQWF2feoYlrOEyU/FasFGCTkT9FAUzT6MKWh7BD4DmBEr7J3izHeHIpUNlT2foQ0MQp0H8Uxwn4lhMAniYe+qir9/o1PvwGqwbCGmPj/FHTZvoXmqtuPYTkOCcD3f9Z7SCeycIjjSdPGac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739272600; c=relaxed/simple;
	bh=imsoImSM7+lqKreALk6c6mN57FaidMYWztM2PbVsMjI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AH7K6z1edTfSCbdXT086ZRYLN68FqVFXrlvoNTcrgZ1ezREibqYcmYLzrhTsIUrpz+QvynKwY+g6Zmnb1oonbLEroULj0pc4HflU2zv8VrGgT3rz8y6U9HUptBmmMNR5vsve1OQGHU/xRj47xRhL1iT288B1ySzTDaYjnG/DfvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A26381477;
	Tue, 11 Feb 2025 03:16:59 -0800 (PST)
Received: from K4MQJ0H1H2.emea.arm.com (K4MQJ0H1H2.blr.arm.com [10.162.40.80])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2A64C3F5A1;
	Tue, 11 Feb 2025 03:16:27 -0800 (PST)
From: Dev Jain <dev.jain@arm.com>
To: akpm@linux-foundation.org,
	david@redhat.com,
	willy@infradead.org,
	kirill.shutemov@linux.intel.com
Cc: npache@redhat.com,
	ryan.roberts@arm.com,
	anshuman.khandual@arm.com,
	catalin.marinas@arm.com,
	cl@gentwo.org,
	vbabka@suse.cz,
	mhocko@suse.com,
	apopple@nvidia.com,
	dave.hansen@linux.intel.com,
	will@kernel.org,
	baohua@kernel.org,
	jack@suse.cz,
	srivatsa@csail.mit.edu,
	haowenchao22@gmail.com,
	hughd@google.com,
	aneesh.kumar@kernel.org,
	yang@os.amperecomputing.com,
	peterx@redhat.com,
	ioworker0@gmail.com,
	wangkefeng.wang@huawei.com,
	ziy@nvidia.com,
	jglisse@google.com,
	surenb@google.com,
	vishal.moola@gmail.com,
	zokeefe@google.com,
	zhengqi.arch@bytedance.com,
	jhubbard@nvidia.com,
	21cnbao@gmail.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Dev Jain <dev.jain@arm.com>
Subject: [PATCH v2 17/17] Documentation: transhuge: Define khugepaged mTHP collapse policy
Date: Tue, 11 Feb 2025 16:43:26 +0530
Message-Id: <20250211111326.14295-18-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250211111326.14295-1-dev.jain@arm.com>
References: <20250211111326.14295-1-dev.jain@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update documentation to reflect the mTHP specific changes for khugepaged.

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 Documentation/admin-guide/mm/transhuge.rst | 49 +++++++++++++++++-----
 1 file changed, 38 insertions(+), 11 deletions(-)

diff --git a/Documentation/admin-guide/mm/transhuge.rst b/Documentation/admin-guide/mm/transhuge.rst
index dff8d5985f0f..6a513fa81005 100644
--- a/Documentation/admin-guide/mm/transhuge.rst
+++ b/Documentation/admin-guide/mm/transhuge.rst
@@ -63,7 +63,7 @@ often.
 THP can be enabled system wide or restricted to certain tasks or even
 memory ranges inside task's address space. Unless THP is completely
 disabled, there is ``khugepaged`` daemon that scans memory and
-collapses sequences of basic pages into PMD-sized huge pages.
+collapses sequences of basic pages into huge pages.
 
 The THP behaviour is controlled via :ref:`sysfs <thp_sysfs>`
 interface and using madvise(2) and prctl(2) system calls.
@@ -212,20 +212,16 @@ this behaviour by writing 0 to shrink_underused, and enable it by writing
 	echo 0 > /sys/kernel/mm/transparent_hugepage/shrink_underused
 	echo 1 > /sys/kernel/mm/transparent_hugepage/shrink_underused
 
-khugepaged will be automatically started when PMD-sized THP is enabled
+khugepaged will be automatically started when THP is enabled
 (either of the per-size anon control or the top-level control are set
 to "always" or "madvise"), and it'll be automatically shutdown when
-PMD-sized THP is disabled (when both the per-size anon control and the
-top-level control are "never")
+THP is disabled (when all of the per-size anon controls and the
+top-level control are "never"). mTHP collapse is supported only for
+private-anonymous memory.
 
 Khugepaged controls
 -------------------
 
-.. note::
-   khugepaged currently only searches for opportunities to collapse to
-   PMD-sized THP and no attempt is made to collapse to other THP
-   sizes.
-
 khugepaged runs usually at low frequency so while one may not want to
 invoke defrag algorithms synchronously during the page faults, it
 should be worth invoking defrag at least in khugepaged. However it's
@@ -254,8 +250,9 @@ The khugepaged progress can be seen in the number of pages collapsed (note
 that this counter may not be an exact count of the number of pages
 collapsed, since "collapsed" could mean multiple things: (1) A PTE mapping
 being replaced by a PMD mapping, or (2) All 4K physical pages replaced by
-one 2M hugepage. Each may happen independently, or together, depending on
-the type of memory and the failures that occur. As such, this value should
+one 2M hugepage, or (3) A portion of the PTE mapping 4K pages replaced by
+a mapping to an mTHP. Each may happen independently, or together, depending
+on the type of memory and the failures that occur. As such, this value should
 be interpreted roughly as a sign of progress, and counters in /proc/vmstat
 consulted for more accurate accounting)::
 
@@ -294,6 +291,36 @@ that THP is shared. Exceeding the number would block the collapse::
 
 A higher value may increase memory footprint for some workloads.
 
+Khugepaged specifics for anon-mTHP collapse
+------------------------------------------
+
+The objective of khugepaged is to collapse memory to the highest aligned order
+possible. If it fails on PMD order, it will greedily try the lower orders.
+
+The tunables max_ptes_shared and max_ptes_swap are considered to be zero for
+mTHP collapsing; i.e the memory range must not have any shared or swap PTE
+for it to be eligible for mTHP collapse.
+
+The tunable max_ptes_none is scaled downwards, according to the order of
+the collapse. For example, if max_ptes_none = 511, and khugepaged tries to
+collapse to order 4, then the memory range under consideration will become
+a candidate for collapse only when the number of none PTEs (out of the 16 PTEs)
+does not exceed: 511 >> (9 - 4) = 15.
+
+mTHP collapse is supported only if max_ptes_none is either zero or 511 (one less
+than the number of entries in the PTE table). Any other value, given the scaling
+logic presented above, produces what we call the "creep" problem; let the bitmask
+00110000 denote a memory range mapped by 8 consecutive pagetable entries, where 0
+denotes an empty pte and 1, a pte embedding a physical folio. Let max_ptes_none = 50%
+(i.e max_ptes_none = 256, which implies 256 >> (9 - 4) = 8 for our case). If order-2 and
+order-3 are enabled, khugepaged may do the following: it scans the range for order-3, but
+since the percentage of none ptes = 5/8 * 100 = 62.5%, it drops down to order 2.
+It successfully collapses to order-2 for the first 4 PTEs, and the memory range becomes:
+11110000
+Now, from the order-3 PoV, the range has 4 out of 8 PTEs filled, and the range has now
+suddenly become eligible for order-3 collapse. So, we can creep into large order
+collapses in a very inefficient manner.
+
 Boot parameters
 ===============
 
-- 
2.30.2

