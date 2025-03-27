Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409151E1E03
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 23:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743119348; cv=none; b=HtbwGExzFwqIIIt5Cly/8t6KZpAsgvD8vFfS94SqrpxmqhQkN5jLSmWUv1yR5hoYcgNCzBuUblNth90xmyFmjaxua5Ta+qGthZhd4kq30xdArae+vdnpVbCP707TqhQA54MmEnRXCAOTGUpY9O6aDTxCjeox9naGv/uWIs7ejP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743119348; c=relaxed/simple;
	bh=Xa985hyTVi3zPlwFGGC/p+nUAm9XjSASU+XjfFJsLDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uJi2ZI2Oy0vmG9x8Lw7yvvbvDYhXKq8LymulZ/28+aVXLDAszOEtSmfpbPxzPRBo3gTuLbCeyiVaSjfz+w5bdXnZvYdrbeO1P3yu+TlUPj1SeF5iyyaINEXGxVA3opgyuRtWUhzK7CQq5yz/KRNrKB8damKU/a3+FHJDYB+z5Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I6eZhLdS; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I6eZhLdS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743119346; x=1774655346;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Xa985hyTVi3zPlwFGGC/p+nUAm9XjSASU+XjfFJsLDo=;
  b=I6eZhLdSkfPn5FHw/21RYUD+NMwPziHA1gKDF3P3PJaGd6B+4XOSQOEt
   XbAPtcCEZCwZgur+64OO1UnVn4IOqTlGyO/K+vjNH73ngJE+/pmwXFSOg
   o7mAsbzrHBjEMFRbQEEneGJKbF+Ip6ZTmPE286FIT2GqOC9YDMSEIYNbc
   cMoBAz7VVDxlEl+DrXMa9hOcbfbcbJDQtX0w2HR6Q5rRZnaX16GFO9kXN
   +ToDY9pYxxexV7H3Eyd0Y+QhykkA+H8jrq+bOQ/XL/T5ybmHDg99l9kaX
   NQwxd9W9rMT2xqZcRLXmHlTyqYW+aAqCcNggHioiatnBvgTMcriivBnjQ
   A==;
X-CSE-ConnectionGUID: AKMSDGKiSN6ztgMRzc3Z/g==
X-CSE-MsgGUID: x2cYFZEuRoaFwdjPtCEIvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="43627952"
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; 
   d="scan'208";a="43627952"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 16:49:04 -0700
X-CSE-ConnectionGUID: Px/1vkkUSveQc0G5MFfmLw==
X-CSE-MsgGUID: QcY37n7uQr+fK9U6ILkzUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; 
   d="scan'208";a="130150502"
Received: from sohilmeh.sc.intel.com ([172.25.103.65])
  by orviesa003.jf.intel.com with ESMTP; 27 Mar 2025 16:49:03 -0700
From: Sohil Mehta <sohil.mehta@intel.com>
To: x86@kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Sohil Mehta <sohil.mehta@intel.com>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	Kai Huang <kai.huang@intel.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Mike Rapoport <rppt@kernel.org>,
	Petr Mladek <pmladek@suse.com>,
	Jani Nikula <jani.nikula@intel.com>,
	Tony Luck <tony.luck@intel.com>,
	Xin Li <xin@zytor.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/9] x86/nmi: Use a macro to initialize NMI descriptors
Date: Thu, 27 Mar 2025 23:46:23 +0000
Message-ID: <20250327234629.3953536-4-sohil.mehta@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250327234629.3953536-1-sohil.mehta@intel.com>
References: <20250327234629.3953536-1-sohil.mehta@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NMI descriptors for each NMI type are stored in an array. However,
they are currently initialized using raw numbers, which makes it
difficult to understand the code.

Introduce a macro to initialize the NMI descriptors using the NMI type
enum values to make the code more readable.

No functional change.

Signed-off-by: Sohil Mehta <sohil.mehta@intel.com>
---
 arch/x86/kernel/nmi.c | 31 +++++++++++--------------------
 1 file changed, 11 insertions(+), 20 deletions(-)

diff --git a/arch/x86/kernel/nmi.c b/arch/x86/kernel/nmi.c
index 671d846ed620..6a5dc35522c8 100644
--- a/arch/x86/kernel/nmi.c
+++ b/arch/x86/kernel/nmi.c
@@ -49,27 +49,20 @@ struct nmi_desc {
 	struct list_head head;
 };
 
-static struct nmi_desc nmi_desc[NMI_MAX] = 
-{
-	{
-		.lock = __RAW_SPIN_LOCK_UNLOCKED(&nmi_desc[0].lock),
-		.head = LIST_HEAD_INIT(nmi_desc[0].head),
-	},
-	{
-		.lock = __RAW_SPIN_LOCK_UNLOCKED(&nmi_desc[1].lock),
-		.head = LIST_HEAD_INIT(nmi_desc[1].head),
-	},
-	{
-		.lock = __RAW_SPIN_LOCK_UNLOCKED(&nmi_desc[2].lock),
-		.head = LIST_HEAD_INIT(nmi_desc[2].head),
-	},
-	{
-		.lock = __RAW_SPIN_LOCK_UNLOCKED(&nmi_desc[3].lock),
-		.head = LIST_HEAD_INIT(nmi_desc[3].head),
-	},
+#define NMI_DESC_INIT(type) { \
+	.lock = __RAW_SPIN_LOCK_UNLOCKED(&nmi_desc[type].lock), \
+	.head = LIST_HEAD_INIT(nmi_desc[type].head), \
+}
 
+static struct nmi_desc nmi_desc[NMI_MAX] = {
+	NMI_DESC_INIT(NMI_LOCAL),
+	NMI_DESC_INIT(NMI_UNKNOWN),
+	NMI_DESC_INIT(NMI_SERR),
+	NMI_DESC_INIT(NMI_IO_CHECK),
 };
 
+#define nmi_to_desc(type) (&nmi_desc[type])
+
 struct nmi_stats {
 	unsigned int normal;
 	unsigned int unknown;
@@ -107,8 +100,6 @@ static int __init setup_unknown_nmi_panic(char *str)
 }
 __setup("unknown_nmi_panic", setup_unknown_nmi_panic);
 
-#define nmi_to_desc(type) (&nmi_desc[type])
-
 static u64 nmi_longest_ns = 1 * NSEC_PER_MSEC;
 
 static int __init nmi_warning_debugfs(void)
-- 
2.43.0

