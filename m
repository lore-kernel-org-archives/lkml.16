Received: from out0-218.mail.aliyun.com (out0-218.mail.aliyun.com [140.205.0.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C11B18A92D
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 13:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.205.0.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743254477; cv=none; b=QK3l7C7PnyzD7a9Moo/bszj9jUF4K44fIFJLLzwcs7qCwb6Z+KrpIm++JLQYZMFI/cnp4Om5TQtOlQ4RWzBYGgXkJYUMgzcrSyThhFujSPHCeSWAIQK95PezevtzGTfIK3GyMQdh5liPU1UaDcZVC7usLzyafFwA1IiOPO7cT6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743254477; c=relaxed/simple;
	bh=tdHBFBo/TEYibTp45k+sQQzC3i+qYGY+W8PbDi4tgrg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=d7Fag+bFOAWp4gUZdjNmA59Epfxz1IHTbZtzD6wLdiBJtq5jVyEdbOlZ4Z2dIyyihq30VFyu/9uA5c7blyB8K4DEF3VCdHaFryQLkdXe+rQoEaaAOMmQzwHqxbjQZy+hWRL+b9s9IGjxf6L5wHA9+ulK27408BWTn8Rpfq8xgHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antgroup.com; spf=pass smtp.mailfrom=antgroup.com; dkim=pass (1024-bit key) header.d=antgroup.com header.i=@antgroup.com header.b=AowBBROc; arc=none smtp.client-ip=140.205.0.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antgroup.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antgroup.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antgroup.com header.i=@antgroup.com header.b="AowBBROc"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=antgroup.com; s=default;
	t=1743254470; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=pO5v6BVMqgqC6aARK169RT0wgqkBk4nwsWaRp7E2lKM=;
	b=AowBBROc6jIYsF5XLraCCHCZXLVFTD1b8V+Eyg/EdXuOz3/XxZBYORtognBpjecTAZ9lwEmNOTdOd5dbeDfpSZ/siKyloQKRBQgisng11OHU30lSP+Y3V1nAeKh8M9qrJAscBbPS5kFz9GJ7eMsvMSJDPeyycGqJAF5P2GDe9pg=
Received: from localhost(mailfrom:houwenlong.hwl@antgroup.com fp:SMTPD_---.c6kOebC_1743253536 cluster:ay29)
          by smtp.aliyun-inc.com;
          Sat, 29 Mar 2025 21:05:36 +0800
From: "Hou Wenlong" <houwenlong.hwl@antgroup.com>
To: linux-kernel@vger.kernel.org
Cc: "Hou Wenlong" <houwenlong.hwl@antgroup.com>,
  "Dave Hansen" <dave.hansen@linux.intel.com>,
  "Andy Lutomirski" <luto@kernel.org>,
  "Peter Zijlstra" <peterz@infradead.org>,
  "Thomas Gleixner" <tglx@linutronix.de>,
  "Ingo Molnar" <mingo@redhat.com>,
  "Borislav Petkov" <bp@alien8.de>,
   <x86@kernel.org>,
  "H. Peter Anvin" <hpa@zytor.com>,
  "Rik van Riel" <riel@surriel.com>
Subject: [PATCH 2/3] mm/tlb: Fix wrong judgement in allocate_global_asid()
Date: Sat, 29 Mar 2025 21:05:25 +0800
Message-Id: <b014aea15c01528ce30187e92d1de0df94e76af7.1743250122.git.houwenlong.hwl@antgroup.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1743250122.git.houwenlong.hwl@antgroup.com>
References: <cover.1743250122.git.houwenlong.hwl@antgroup.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In allocate_global_asid(), 'global_asid_available' cannot be zero, as it
has already been checked in use_global_asid(). Therefore, the warning in
allocate_global_asid() cannot be triggered; fix the wrong judgment in
allocate_global_asid().

Fixes: d504d1247e36 ("x86/mm: Add global ASID allocation helper functions")
Signed-off-by: Hou Wenlong <houwenlong.hwl@antgroup.com>
---
 arch/x86/mm/tlb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index cad4a8eae2d8..e9eda296fb0e 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -319,7 +319,7 @@ static u16 allocate_global_asid(void)
 
 	asid = find_next_zero_bit(global_asid_used, MAX_ASID_AVAILABLE, last_global_asid);
 
-	if (asid >= MAX_ASID_AVAILABLE && !global_asid_available) {
+	if (asid >= MAX_ASID_AVAILABLE && global_asid_available) {
 		/* This should never happen. */
 		VM_WARN_ONCE(1, "Unable to allocate global ASID despite %d available\n",
 				global_asid_available);
-- 
2.31.1

