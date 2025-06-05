Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827194315A
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 16:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749141364; cv=none; b=cV5euo+Yaq6T+lmRyxRVKkxQkuoHSVDvj7oNdoqf3RSUDfEbICR5cL5QDOVzcKN7p2m0FRtQQbO3mU538MDizEbeCQu23BhI7d6qwP/4povEhywyA8VQHyMqm91eB5IUPwf7OqT7DDs1a4seFDWMIU6vBnyjslU/7d8ThsboqM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749141364; c=relaxed/simple;
	bh=OAMl2/2Up5MxIckrOMb5nox+KObSWQMglG+ax9q9st8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Olk/SUj6VV2m3BXJ7PNsU2rtSfJSPWKrfylTGl4cNwDX9uj6sWZbUqUo09Lfh6VKoAVOLPgWlU1Tjv27pI+Jo6QzJCqrW9OChdS4BcioAm+LfQBvFAnO4C4V8N3eXmm5G10JlT5BhJFi4soWZkw3urOUpEv8fAi77hrcCIdCWIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=surriel.com; dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b=QiBLxRLH; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b="QiBLxRLH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=f4zP15oJQMI/cNiQtQETjNBzcgWHpdktSGMgq1QqQy0=; b=QiBLxRLHERqlWHVNPz4Kpw0uUz
	C+LBnp6hw7J/zI9hGXrd8U/iM4/ncoxOrGQPqpBNYr/Br6vezA3cpHPGJvr+SvZvHNiK35H/DGXxe
	HpL18ggmUASpqyzpjaqldVhmHokIYW2PKtabuYDiS68lHHzcvaR0+hNp0vD3CU72bVD42Ais8Zol1
	4a7jtIuqSiITZ7lexE7VJyiYtz8Ycwknn2IVlByeU2kBsDNWLDxB2f8A/j5vOUrp59DnjBjDElh1N
	Tt/MVO1XsUrIMv3oZtEVvNVEX3jHR1BBmT5ZdruH/wt2g3H3hfJBJrIBlG6AlYm713FtZWpIvKp39
	B4Zh+ZWw==;
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@surriel.com>)
	id 1uNDZC-000000002qg-3BgF;
	Thu, 05 Jun 2025 12:35:46 -0400
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
	Yu-cheng Yu <yu-cheng.yu@intel.com>,
	Rik van Riel <riel@surriel.com>
Subject: [RFC PATCH v3 1/7] x86/mm: Introduce Remote Action Request MSRs
Date: Thu,  5 Jun 2025 12:35:10 -0400
Message-ID: <20250605163544.3852565-2-riel@surriel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605163544.3852565-1-riel@surriel.com>
References: <20250605163544.3852565-1-riel@surriel.com>
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

