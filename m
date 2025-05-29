Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FED14E2F2
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 11:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748516749; cv=none; b=pxN0/zcZCNyiDX8fHPqUf0YmbKAkcJD/yu+uRhCXFeqAPqPoM0J1nyD2gzGP9CL8QDuZ77n+lid/2Th1OtYXIFSarO7BKalJ22r4AQpCJlwfNW/nZiy92qgKAoRb+gM3FybcQDMA/93cf2t3LIpQ9nOsfkFEK9BzihZa1hSP7tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748516749; c=relaxed/simple;
	bh=tdpl2IEH0QGeEXwi+cxbOZIF0icigvm3HOlNwkbflLc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ek0DNcUep+Vz2nti+D+I3MvGwbaHLLAA9Lt0EpquFW2n4Y/jRKGcp9FE+thxEd/lx7FnsvABJh4icd90HcZQyIeNscqCISrcU59uvhTFyIqzNBiGGSCInUqUvePLOWJ1a2oDf7vfsyGpd58Yo8MeY/MtiEWnGkar7D60n0gxeaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.helo=mgamail.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kDU2a3M8; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.helo=mgamail.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kDU2a3M8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748516748; x=1780052748;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tdpl2IEH0QGeEXwi+cxbOZIF0icigvm3HOlNwkbflLc=;
  b=kDU2a3M8OIavhy2HeAXXnlB5VZTCCWqV0qK3efY8z2/ESB6UIIrP11q8
   /8TUx4Si7Yq6c6KJ9IitEkPb5nmosPpGfAqOki+3AeCPNx0Qo8HdsvYor
   3xXXttRh4+oGhcU0vadPZ8Qk9bMKHPFmOasiRxWziYJkr5pHDOWMfKyDo
   QIWCfzAzeLQmVmj5S5H4EzyidMLy3V+dVCuOWWPt7W784uPKnl+HjIDlX
   w7VNGwMLMN78getN+/BZSLy203AkqkolqXopUe/Tl7FX5TUcTG3o5dIl5
   0OkTq44wFq85JavLFTz3aTLxaphrdJRZ4d1fNknrSAoj3R0e0hbnF2fx7
   g==;
X-CSE-ConnectionGUID: sCEdv8fqRAmrz+PW/JJAYQ==
X-CSE-MsgGUID: EcjEZHrRTAaErwtg1Gyhgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="60830721"
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; 
   d="scan'208";a="60830721"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 04:05:48 -0700
X-CSE-ConnectionGUID: 21/7tX9mQ9+nbuwOOYgf3A==
X-CSE-MsgGUID: nA8yYL1FS0yAL2rVfivzbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; 
   d="scan'208";a="143864980"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa008.fm.intel.com with ESMTP; 29 May 2025 04:05:44 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id EA48914B; Thu, 29 May 2025 14:05:42 +0300 (EEST)
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>
Cc: lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Konstantin Khlebnikov <koct9i@gmail.com>
Subject: [PATCH] mm: Strictly check vmstat_text array size
Date: Thu, 29 May 2025 14:05:41 +0300
Message-ID: <20250529110541.2960330-1-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The /proc/vmstat displays counters from various sources. It is easy to
forget to add or remove a label when a new counter is added or removed.

There is a BUILD_BUG_ON() function that catches missing labels. However,
for some reason, it ignores extra labels.

Let's make the check strict. This would help to catch issues when
a counter is removed.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Cc: Konstantin Khlebnikov <koct9i@gmail.com>
---
 mm/vmstat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/vmstat.c b/mm/vmstat.c
index ae9882063d89..0903adace423 100644
--- a/mm/vmstat.c
+++ b/mm/vmstat.c
@@ -1867,7 +1867,7 @@ static void *vmstat_start(struct seq_file *m, loff_t *pos)
 	if (*pos >= NR_VMSTAT_ITEMS)
 		return NULL;
 
-	BUILD_BUG_ON(ARRAY_SIZE(vmstat_text) < NR_VMSTAT_ITEMS);
+	BUILD_BUG_ON(ARRAY_SIZE(vmstat_text) != NR_VMSTAT_ITEMS);
 	fold_vm_numa_events();
 	v = kmalloc_array(NR_VMSTAT_ITEMS, sizeof(unsigned long), GFP_KERNEL);
 	m->private = v;
-- 
2.47.2

