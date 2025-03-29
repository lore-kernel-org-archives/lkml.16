Received: from out187-23.us.a.mail.aliyun.com (out187-23.us.a.mail.aliyun.com [47.90.187.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D181C460A
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 13:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=47.90.187.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743255403; cv=none; b=IIN+Dw845AsdfYxTNpoewdIf/1KGlMcIsHra9pQI9VOyqj1ZJLuRCi/G2uMnhP50rU6O8lgYV2/BnLQAD1M3DvTBw3DAqlYjns4qzHwLzEFtfz1n9/39rFw6CFFBaaSqxNmE5VpqvCi9vsVLZy8XxOIcTW1G1BP+C9x2pGfALeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743255403; c=relaxed/simple;
	bh=GYA6XhR04RH+1CAfGlxWuNUtvxz+KVpOVf0+Uyr+8/U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HT+P7/LXrbWVadK+XIkwmLDiTOjaIv2fBBbR4QdNFGsDBPOB9yi1cXliePEdgp9yfneOoFUVK3KHpLvO3PfBXOfqxlmE4BExTZWzL2U+XQV4O/16fmmwefR1MPidiiQwLwitx2/9GZAsEOpa2VWnx1qmXHc+RvAWJysSbmZldwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antgroup.com; spf=pass smtp.mailfrom=antgroup.com; dkim=pass (1024-bit key) header.d=antgroup.com header.i=@antgroup.com header.b=hga6NPIf; arc=none smtp.client-ip=47.90.187.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antgroup.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antgroup.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antgroup.com header.i=@antgroup.com header.b="hga6NPIf"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=antgroup.com; s=default;
	t=1743255385; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=eajsjoiON1I0Jxv4Hsr4N5ua6b1s7QOKAILrBRn4bpM=;
	b=hga6NPIf8GI/H5QBBckg8fs/izWnHFnysOz+hQLv/Oa3BA9336mYI76Co5HGpCGRJHPJwsv6QI2clAM6mNq/baAsEgtw28ApOv7gjf9JljRnrkMo6q26JWTQGhk/IKpb1MjKyCwGEWzMEPVzo7HiE0acoBd+Dp0FVyJSuKzhA4k=
Received: from localhost(mailfrom:houwenlong.hwl@antgroup.com fp:SMTPD_---.c7ROdG-_1743253534 cluster:ay29)
          by smtp.aliyun-inc.com;
          Sat, 29 Mar 2025 21:05:35 +0800
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
Subject: [PATCH 1/3] x86/mm: Correct the actual count of available global ASIDs
Date: Sat, 29 Mar 2025 21:05:24 +0800
Message-Id: <0954cb7ec766d6d1e0b66a93876762b516ae9bae.1743250122.git.houwenlong.hwl@antgroup.com>
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

The available ASID range for global ASID allocation is
[TLB_NR_DYN_ASIDS, MAX_ASID_AVAILABLE-1], which is a close interval. So
the actual count of available ASIDs for global ASID allocation should be
'(MAX_ASID_AVIALBE-1) - TLB_NR_DYN_ASIDS + 1'.

Fixes: d504d1247e36 ("x86/mm: Add global ASID allocation helper functions")
Signed-off-by: Hou Wenlong <houwenlong.hwl@antgroup.com>
---
 arch/x86/mm/tlb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index e459d97ef397..cad4a8eae2d8 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -279,7 +279,7 @@ static DEFINE_RAW_SPINLOCK(global_asid_lock);
 static u16 last_global_asid = MAX_ASID_AVAILABLE;
 static DECLARE_BITMAP(global_asid_used, MAX_ASID_AVAILABLE);
 static DECLARE_BITMAP(global_asid_freed, MAX_ASID_AVAILABLE);
-static int global_asid_available = MAX_ASID_AVAILABLE - TLB_NR_DYN_ASIDS - 1;
+static int global_asid_available = MAX_ASID_AVAILABLE - TLB_NR_DYN_ASIDS;
 
 /*
  * When the search for a free ASID in the global ASID space reaches
-- 
2.31.1

