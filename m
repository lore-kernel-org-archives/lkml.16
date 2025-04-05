Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E01225634
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 05:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743831026; cv=none; b=UxDabuSTLXwihXYYkprV+O9WIv4pUzCXgUCfCpm1AnwQGTCAsG/656obQodozuUX/UNy1UqUGpTGlDi50ObemTVKvNZ67ghwnFNOH5/N/UVxWCuxpVN/1ZQfE99orrcAtZ0OuIfeNi9q1ABKPyLMnEBBcP4lkcrKvc42MfeOT3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743831026; c=relaxed/simple;
	bh=zEsc7b6P2dS3SJaNmkZRSte+pyqL0ydAbw4F1IszLMU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tTgdXYreh/FvlBOzaYj27jDpS0cNQjYeRTBCJ3lQkdCSjpjqnx8zz51/8PLn9hL2HK0QBwGh3hWMIBjxXthkSal3xx1fJwTzz9aULNCPlZ3Y+pnPnK3ZF/iuWEO5Q6zO7HkBMC6K7QMaSyIuDapnNtcM+KdVrdHm30NKq4Oqb1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L68jQYbp; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L68jQYbp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743831024; x=1775367024;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zEsc7b6P2dS3SJaNmkZRSte+pyqL0ydAbw4F1IszLMU=;
  b=L68jQYbpp7tj8QRpAw9sm1Nuk8cwMT2cRAprCrdpsgjQ8VfMOnviD/7b
   7FohePAJE/tgm/IL8IFZ0pXuJqwI4eftMTo46ik+3MS1ZkohTDsoCXY8z
   nUm/Mt1DH0ret6mCa1i++sAbzcJ77pu0AeXht2M/O97Hn2r73SmFXe9Tx
   J5v3h8cU+paG9dNRyL3+u4GBAKXPb/NB3/QCdUdA/3qrmAWWYkTZnJklE
   pXNxUFr1JZkXq9U+tjXgSRm4FZqd88TbLE/HWy7w4bLkZeLvQ7SdGAOw0
   ufiO3AmcI1oy7VAifFyf46fpxPPTEiqID+abneWjy/K3qGqyK71JkHeHx
   g==;
X-CSE-ConnectionGUID: kA039/RaRQWdFoVuusCC5Q==
X-CSE-MsgGUID: PSdP1KzgRTGWDbRaBYJ7pA==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="55942271"
X-IronPort-AV: E=Sophos;i="6.15,190,1739865600"; 
   d="scan'208";a="55942271"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 22:30:21 -0700
X-CSE-ConnectionGUID: OyKeFk3YT56cuwkUVwSO5g==
X-CSE-MsgGUID: H9DYO3P+SwiMemLl0bBCoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,190,1739865600"; 
   d="scan'208";a="127474228"
Received: from zhiquan-linux-dev.bj.intel.com ([10.238.156.102])
  by fmviesa007.fm.intel.com with ESMTP; 04 Apr 2025 22:30:17 -0700
From: Zhiquan Li <zhiquan1.li@intel.com>
To: bhe@redhat.com,
	vgoyal@redhat.com,
	dyoung@redhat.com,
	kirill.shutemov@linux.intel.com,
	akpm@linux-foundation.org
Cc: kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	k-hagio-ab@nec.com,
	yamazaki-msmt@nec.com,
	lijiang@redhat.com,
	ltao@redhat.com,
	zhiquan1.li@intel.com
Subject: [PATCH v3] crash: Export PAGE_UNACCEPTED_MAPCOUNT_VALUE to vmcoreinfo
Date: Sat,  5 Apr 2025 14:06:10 +0800
Message-Id: <20250405060610.860465-1-zhiquan1.li@intel.com>
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
Acked-by: Baoquan He <bhe@redhat.com>

---
Vmcore size statistic of a freshly booted TD VM with different memory
sizes:

  VM.mem | Before  After
  -------+----------------
  512G   | ~4.9G   ~2.0G
  256G   | ~2.0G   ~1.1G

Most of changes are done by makedumpfile, but the prerequisite is kernel
needs to export an indicator to identify unaccepted pages in vmcoreinfo.

V2: https://lore.kernel.org/all/20250403030801.758687-1-zhiquan1.li@intel.com/

Changes since V2:
- Add Baoquan's Acked-by tag.
- Fix docs: "Title underline too short" warning.

V1: https://lore.kernel.org/all/20250103074941.3651765-1-zhiquan1.li@intel.com/

Changes since V1:
- Rebase to v6.14.
- Added document into admin-guide/kdump/vmcoreinfo.rst per Dave's
  suggestion.
- Add Kirill's Reviewed-by tag.
---
 Documentation/admin-guide/kdump/vmcoreinfo.rst | 4 ++--
 kernel/vmcore_info.c                           | 4 ++++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/kdump/vmcoreinfo.rst b/Documentation/admin-guide/kdump/vmcoreinfo.rst
index 0f714fc945ac..8cf4614385b7 100644
--- a/Documentation/admin-guide/kdump/vmcoreinfo.rst
+++ b/Documentation/admin-guide/kdump/vmcoreinfo.rst
@@ -331,8 +331,8 @@ PG_lru|PG_private|PG_swapcache|PG_swapbacked|PG_slab|PG_hwpoision|PG_head_mask|P
 Page attributes. These flags are used to filter various unnecessary for
 dumping pages.
 
-PAGE_BUDDY_MAPCOUNT_VALUE(~PG_buddy)|PAGE_OFFLINE_MAPCOUNT_VALUE(~PG_offline)
------------------------------------------------------------------------------
+PAGE_BUDDY_MAPCOUNT_VALUE(~PG_buddy)|PAGE_OFFLINE_MAPCOUNT_VALUE(~PG_offline)|PAGE_OFFLINE_MAPCOUNT_VALUE(~PG_unaccepted)
+-------------------------------------------------------------------------------------------------------------------------
 
 More page attributes. These flags are used to filter various unnecessary for
 dumping pages.
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

