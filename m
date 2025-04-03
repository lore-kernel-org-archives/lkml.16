Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CFB8828
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 02:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743647540; cv=none; b=VoxQ8G6Xm5vc8ibnuWThOg5aPvWR2Q6Sce8/Jqj99S2jSrvXMhPhSrOxD+rhNUZCI12G9U4aI+D9A5KyLcMZJam2rX/RwyxtdGOCLX4ruT2skCKmmxNVG44J5KAoSIVb/z/tIJJMNO+uSdSqof8Wr0CLy083EV04cL2vUXyLSb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743647540; c=relaxed/simple;
	bh=xXnYZQ5jMf6nhqCdS6uW6efKNxrmzpOpJ2V1JKalSDM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KUb4uFqmukFOlEkse4e3ogoxoc3Z4xxTIF3cT2eXP/p/1JJQ0Bmxf9q2ao3isCG66Q0Lg4xknkullv7OVZskCcRBmiV8AnCNMwlpV3t9o5MjKCU8fn+DpEiWgOcZDPprhkrInJAwxl1QRwAQ9sQ3azWpRM9dR8m+4bBrR2k8wEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FdCa/+Yi; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FdCa/+Yi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743647539; x=1775183539;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xXnYZQ5jMf6nhqCdS6uW6efKNxrmzpOpJ2V1JKalSDM=;
  b=FdCa/+Yi141/bA5KiVOeCfQ8LKpmF15xbmm/YuvOiv43/plVsnFba+cF
   3eUqvPUS/RCnrqYeb19uuZhBW310tpOd5so95PbFChtp0bwzmUd+/2efB
   MnEDXOqMyABUpC631ZsQA+br+MuEcHKR3WcZnW7ldNSHiLfhgUElSAiNi
   AkGEFKc5/jvJ6Bxo8WOIX2nZ++6Ih4mvqz9CVLCJ47IXzQthKsNXyYPLF
   CwaDMdKo/wD3reUYj+I/dzr1dJhvSPntncPh388FitLKIJgPRA2XqTBgZ
   x3uK11agpaSB6gld7YARvI+A+B/9+Us3DMbVBTeefPMMJaEBeOOkzWP85
   w==;
X-CSE-ConnectionGUID: qldafW34T7iXwHYJHPHlOg==
X-CSE-MsgGUID: iyc5RDiNSdy7NriTU9lEVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="44746639"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="44746639"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 19:32:16 -0700
X-CSE-ConnectionGUID: uimG9/XdQdWzJwA7doj0vg==
X-CSE-MsgGUID: MMLPcXoOSV6oYTdKOJdZ9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="127368911"
Received: from zhiquan-linux-dev.bj.intel.com ([10.238.156.102])
  by fmviesa010.fm.intel.com with ESMTP; 02 Apr 2025 19:32:13 -0700
From: Zhiquan Li <zhiquan1.li@intel.com>
To: bhe@redhat.com,
	vgoyal@redhat.com,
	dyoung@redhat.com,
	kirill.shutemov@linux.intel.com
Cc: kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	zhiquan1.li@intel.com
Subject: [PATCH v2 RESEND] crash: Export PAGE_UNACCEPTED_MAPCOUNT_VALUE to vmcoreinfo
Date: Thu,  3 Apr 2025 11:08:01 +0800
Message-Id: <20250403030801.758687-1-zhiquan1.li@intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Intel TDX guest, unaccepted memory is unusable free memory which is
not managed by buddy, until it's accepted by guest.  Before that, it
cannot be accessed by the first kernel as well as the kexec'ed kernel.
The kexec'ed kernel will skip these pages and fill in zero data for the
reader of vmcore.

The dump tool like makedumpfile creates a page descriptor (size 24
bytes) for each non-free page, including zero data page, but it will not
create descriptor for free pages.  If it is not able to distinguish
these unaccepted pages with zero data pages, a certain amount of space
will be wasted in proportion (~1/170).  In fact, as a special kind of
free page the unaccepted pages should be excluded, like the real free
pages.

Export the page type PAGE_UNACCEPTED_MAPCOUNT_VALUE to vmcoreinfo, so
that dump tool can identify whether a page is unaccepted.

Link: https://lore.kernel.org/all/20240809114854.3745464-5-kirill.shutemov@linux.intel.com/

Signed-off-by: Zhiquan Li <zhiquan1.li@intel.com>
Reviewed-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

---
Vmcore size statistic of a freshly booted TD VM with different memory
sizes:

  VM.mem | Before  After
  -------+----------------
  512G   | ~4.9G   ~2.0G
  256G   | ~2.0G   ~1.1G

Most of changes are done by makedumpfile, but the prerequisite is kernel
needs to export an indicator to identify unaccepted pages in vmcoreinfo.

V2 RESEND note:
- No changes on this, just rebasd to v6.14.

V1: https://lore.kernel.org/all/20250103074941.3651765-1-zhiquan1.li@intel.com/

Changes since V1:
- Rebase to v6.14-rc5.
- Added document into admin-guide/kdump/vmcoreinfo.rst per Dave's
  suggestion.
- Add Kirill's Reviewed-by tag.
---
 Documentation/admin-guide/kdump/vmcoreinfo.rst | 2 +-
 kernel/vmcore_info.c                           | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kdump/vmcoreinfo.rst b/Documentation/admin-guide/kdump/vmcoreinfo.rst
index 0f714fc945ac..3b47916f1856 100644
--- a/Documentation/admin-guide/kdump/vmcoreinfo.rst
+++ b/Documentation/admin-guide/kdump/vmcoreinfo.rst
@@ -331,7 +331,7 @@ PG_lru|PG_private|PG_swapcache|PG_swapbacked|PG_slab|PG_hwpoision|PG_head_mask|P
 Page attributes. These flags are used to filter various unnecessary for
 dumping pages.
 
-PAGE_BUDDY_MAPCOUNT_VALUE(~PG_buddy)|PAGE_OFFLINE_MAPCOUNT_VALUE(~PG_offline)
+PAGE_BUDDY_MAPCOUNT_VALUE(~PG_buddy)|PAGE_OFFLINE_MAPCOUNT_VALUE(~PG_offline)|PAGE_OFFLINE_MAPCOUNT_VALUE(~PG_unaccepted)
 -----------------------------------------------------------------------------
 
 More page attributes. These flags are used to filter various unnecessary for
diff --git a/kernel/vmcore_info.c b/kernel/vmcore_info.c
index 1fec61603ef3..e066d31d08f8 100644
--- a/kernel/vmcore_info.c
+++ b/kernel/vmcore_info.c
@@ -210,6 +210,10 @@ static int __init crash_save_vmcoreinfo_init(void)
 	VMCOREINFO_NUMBER(PAGE_HUGETLB_MAPCOUNT_VALUE);
 #define PAGE_OFFLINE_MAPCOUNT_VALUE	(PGTY_offline << 24)
 	VMCOREINFO_NUMBER(PAGE_OFFLINE_MAPCOUNT_VALUE);
+#ifdef CONFIG_UNACCEPTED_MEMORY
+#define PAGE_UNACCEPTED_MAPCOUNT_VALUE	(PGTY_unaccepted << 24)
+	VMCOREINFO_NUMBER(PAGE_UNACCEPTED_MAPCOUNT_VALUE);
+#endif
 
 #ifdef CONFIG_KALLSYMS
 	VMCOREINFO_SYMBOL(kallsyms_names);

base-commit: 38fec10eb60d687e30c8c6b5420d86e8149f7557
-- 
2.25.1

