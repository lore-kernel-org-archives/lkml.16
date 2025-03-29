Received: from out0-196.mail.aliyun.com (out0-196.mail.aliyun.com [140.205.0.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1101B424F
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 13:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.205.0.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743254481; cv=none; b=UAizlUj3SgH7b99p2ygB9N076UQldcJg6aS+2NQJujYmZY4H+slO+gj2sVx0SN/l1Nzfeh5kC/2tiZuO9iXq9COYXfGsrAV0Uho+QiPoPgqBr44wnT+c8f3HHQeE8FsihBX4izauP5Wrdz7VjvX9gUo600OBUNmGqmi/HX8G2qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743254481; c=relaxed/simple;
	bh=Tj33r8eFpGults4WH7vOF0SmaR01AmzbqRML+2nDOwQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eOdKFPFVq9sFq4yogvsZi7OXa7hJrMMVj7XO0eUEgOQVhxW5bJphUi/q6DzBgRF3qxSqn4E8OIeT1LqfAH8V29VEvbxrcbUzKTSVsFjsrVSXbGMoHQan3MrTsj+Lm8zzNDbLCy9T2MLZ6KLBNY7TJNm68nN7xpOs/IvdEzR4+pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antgroup.com; spf=pass smtp.mailfrom=antgroup.com; dkim=pass (1024-bit key) header.d=antgroup.com header.i=@antgroup.com header.b=XFltEFGi; arc=none smtp.client-ip=140.205.0.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antgroup.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antgroup.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antgroup.com header.i=@antgroup.com header.b="XFltEFGi"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=antgroup.com; s=default;
	t=1743254474; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=aY+k5xAO7wlEJHM5XbSfo9/O2E1HKvzBj9211YyF+U4=;
	b=XFltEFGifNO1MOmmbDmIp1zqHaflS28WIMY4DuOVqaf75NYyEVV1HRPmbiGW0P+8x7w0wFaDSlbHj1ld7qTOA+aOBoX28uuOulev0UN4/xIwcJqAT0GBNa8PCY6H+cAGZhCfB9lizwAfCaK3Pav3RMOgOL+thmbp/GGyImllLg8=
Received: from localhost(mailfrom:houwenlong.hwl@antgroup.com fp:SMTPD_---.c6iAtj2_1743253538 cluster:ay29)
          by smtp.aliyun-inc.com;
          Sat, 29 Mar 2025 21:05:38 +0800
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
  "H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH 3/3] x86/mm: Fix wrong usage of 'MAX_ASID_AVAILABLE' in global ASID allocation
Date: Sat, 29 Mar 2025 21:05:26 +0800
Message-Id: <55dd1b47ef7c8dd5518878fc682290825570225d.1743250122.git.houwenlong.hwl@antgroup.com>
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

'MAX_ASID_AVAILABLE' represents the maximum valid ASID in the current
definetion, meaning that the available ASID range is [0,
MAX_ASID_AVAILABLE]. So the actual count of available ASIDs is
'MAX_ASID_AVAIABLE + 1'. However, global ASID allocation use this value
as the size of the bitmap, which results in the maximum ASID number
being excluded from global ASID allocation. To address this issue,
redefine the 'MAX_ASID_AVAILABLE' as the count of available ASIDs.

Signed-off-by: Hou Wenlong <houwenlong.hwl@antgroup.com>
---
 arch/x86/mm/tlb.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index e9eda296fb0e..0f86c3140fdc 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -102,18 +102,17 @@
 #define CR3_AVAIL_PCID_BITS (X86_CR3_PCID_BITS - PTI_CONSUMED_PCID_BITS)

 /*
- * ASIDs are zero-based: 0->MAX_AVAIL_ASID are valid.  -1 below to account
- * for them being zero-based.  Another -1 is because PCID 0 is reserved for
- * use by non-PCID-aware users.
+ * ASIDs are zero-based: 0->MAX_ASID_AVAILABLE-1 are valid.  -1 is because PCID
+ * 0 is reserved for use by non-PCID-aware users.
  */
-#define MAX_ASID_AVAILABLE ((1 << CR3_AVAIL_PCID_BITS) - 2)
+#define MAX_ASID_AVAILABLE ((1 << CR3_AVAIL_PCID_BITS) - 1)

 /*
  * Given @asid, compute kPCID
  */
 static inline u16 kern_pcid(u16 asid)
 {
-	VM_WARN_ON_ONCE(asid > MAX_ASID_AVAILABLE);
+	VM_WARN_ON_ONCE(asid >= MAX_ASID_AVAILABLE);

 #ifdef CONFIG_MITIGATION_PAGE_TABLE_ISOLATION
 	/*
--
2.31.1

