Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D42B2376E0
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 20:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750363988; cv=none; b=HPxq6nyAndVXHxvPj2rFEzuSSufoBebvMx4It4EngZs1mp1sggwJX44F/aLJ4eFQcHd0hE1ewCKHcmHej/anWB3J5lc+ngo0VmETYr4s+q7DZrz1yeKyEtp1Qxj1+NNf4lwlvbCa2XXyfeJ7HqNm7d1sdp3824PZ6MjvjqzKi4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750363988; c=relaxed/simple;
	bh=OAMl2/2Up5MxIckrOMb5nox+KObSWQMglG+ax9q9st8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kFHAvHRyt41pw8YZ26SczcLu5uXvEhJ39XvcZZje8vx2Wgw9CKo6zuU0nW8FOE6fQhpv7SDnFBWA0RlpnjQHYyYZ8Dp/KLvJQNFNrY5izPcyHAr2qLH9f5UySJ/37u+y6uhmkScwU8B8r+azM06NZMiTXXnCTRgkVEko9wiMkm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=surriel.com; dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b=QE3hRafb; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b="QE3hRafb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=f4zP15oJQMI/cNiQtQETjNBzcgWHpdktSGMgq1QqQy0=; b=QE3hRafbl5/SUMnuyBSz5icpda
	l7aN1fbrive6B7/aPZ0Am/kziLy6uOL5Y0bsF9RscZRni0l9mCy8j9Jt63QebgfEecE29eEzrnJMQ
	q3Go2tcpvIFeMFCsLnoYpDrEcurf1kAWZWEXwe097NpqVtOIb0Hs0sNUPnSRuW7ItqOa98XqFS+ba
	S3LfzLVjTupovxtqaqw5CmEklefSy7Kv3WkUenJGf1pU3LSW0ipepwP+03yS81r8JroEUeyxgWS61
	pbE6i7B+pTDvC2VTDYo4Nt9R3AumxvKDnPNZ6IIWxkVTT3sGL/4yKroo2UNTiv87h37fxRVfdLdtT
	I/6Qw4aQ==;
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@surriel.com>)
	id 1uSLV6-000000000CT-1OF1;
	Thu, 19 Jun 2025 16:04:44 -0400
From: Rik van Riel <riel@surriel.com>
To: linux-kernel@vger.kernel.org
Cc: kernel-team@meta.com,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	bp@alien8.de,
	x86@kernel.org,
	nadav.amit@gmail.com,
	seanjc@google.com,
	tglx@linutronix.de,
	mingo@kernel.org,
	Yu-cheng Yu <yu-cheng.yu@intel.com>,
	Rik van Riel <riel@surriel.com>
Subject: [RFC PATCH v4 1/8] x86/mm: Introduce Remote Action Request MSRs
Date: Thu, 19 Jun 2025 16:03:53 -0400
Message-ID: <20250619200442.1694583-2-riel@surriel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250619200442.1694583-1-riel@surriel.com>
References: <20250619200442.1694583-1-riel@surriel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yu-cheng Yu <yu-cheng.yu@intel.com>

Remote Action Request (RAR) is a model-specific feature to speed
up inter-processor operations by moving parts of those operations
from software to hardware.

The current RAR implementation handles TLB flushes and MSR writes.

This patch introduces RAR MSRs.  RAR is introduced in later patches.

There are five RAR MSRs:

  MSR_CORE_CAPABILITIES
  MSR_IA32_RAR_CTRL
  MSR_IA32_RAR_ACT_VEC
  MSR_IA32_RAR_PAYLOAD_BASE
  MSR_IA32_RAR_INFO

Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>
Signed-off-by: Rik van Riel <riel@surriel.com>
---
 arch/x86/include/asm/msr-index.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
index b7dded3c8113..367a62c50aa2 100644
--- a/arch/x86/include/asm/msr-index.h
+++ b/arch/x86/include/asm/msr-index.h
@@ -110,6 +110,8 @@
 
 /* Abbreviated from Intel SDM name IA32_CORE_CAPABILITIES */
 #define MSR_IA32_CORE_CAPS			  0x000000cf
+#define MSR_IA32_CORE_CAPS_RAR_BIT		  1
+#define MSR_IA32_CORE_CAPS_RAR			  BIT(MSR_IA32_CORE_CAPS_RAR_BIT)
 #define MSR_IA32_CORE_CAPS_INTEGRITY_CAPS_BIT	  2
 #define MSR_IA32_CORE_CAPS_INTEGRITY_CAPS	  BIT(MSR_IA32_CORE_CAPS_INTEGRITY_CAPS_BIT)
 #define MSR_IA32_CORE_CAPS_SPLIT_LOCK_DETECT_BIT  5
@@ -122,6 +124,17 @@
 #define SNB_C3_AUTO_UNDEMOTE		(1UL << 27)
 #define SNB_C1_AUTO_UNDEMOTE		(1UL << 28)
 
+/*
+ * Remote Action Requests (RAR) MSRs
+ */
+#define MSR_IA32_RAR_CTRL		0x000000ed
+#define MSR_IA32_RAR_ACT_VEC		0x000000ee
+#define MSR_IA32_RAR_PAYLOAD_BASE	0x000000ef
+#define MSR_IA32_RAR_INFO		0x000000f0
+
+#define RAR_CTRL_ENABLE			BIT(31)
+#define RAR_CTRL_IGNORE_IF		BIT(30)
+
 #define MSR_MTRRcap			0x000000fe
 
 #define MSR_IA32_ARCH_CAPABILITIES	0x0000010a
-- 
2.49.0

