Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26064A5A25
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 00:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746492539; cv=none; b=EdKj6q1ES6KfdLEWCUPbSGgmtaRqghRmcp9Yq+CbqWRphEfTqPCZ1W0EbOmtx0TlJ3PWiJ424cw6nW5CGmsjZTimDOqiWn9KNC5XUppSJ9lAkySmajZeKEgfkdCt7A2eVbUkn3BY6geOhy8S+A5XPiWRC2fuYNVMXFaI9fKRTrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746492539; c=relaxed/simple;
	bh=/kAYR5itm1l4OmW5bmbutIOLpbCH9d8o5NyuhovS5Hc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r8sfjqTLIfQ84NBeTq7oGQWQ0RwRu3QVXl//GSNq44n62C5VKOaCnxiOs9pRGIz/kMkVdW3f1E0/5QcpSFYJG6ZO/SFL1cYBcL+aln/Ey9KaRvIehQHUSTPo+IDD5LdRTHR0LMbpq2ZhlnIiiF0+mdnQ5haa7BdHxdNxqqMaGig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=shelob.surriel.com; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shelob.surriel.com
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@shelob.surriel.com>)
	id 1uC6K6-000000000IF-3INh;
	Mon, 05 May 2025 20:38:14 -0400
From: Rik van Riel <riel@surriel.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	x86@kernel.org,
	kernel-team@meta.com,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	hpa@zytor.com,
	Yu-cheng Yu <yu-cheng.yu@intel.com>,
	Rik van Riel <riel@surriel.com>
Subject: [RFC PATCH 2/9] x86/mm: Introduce Remote Action Request MSRs
Date: Mon,  5 May 2025 20:37:40 -0400
Message-ID: <20250506003811.92405-3-riel@surriel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250506003811.92405-1-riel@surriel.com>
References: <20250506003811.92405-1-riel@surriel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: riel@surriel.com

From: Yu-cheng Yu <yu-cheng.yu@intel.com>

Remote Action Request (RAR) is a TLB flushing broadcast facility.
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
 arch/x86/include/asm/msr-index.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
index 0828b891fe2e..923e17462712 100644
--- a/arch/x86/include/asm/msr-index.h
+++ b/arch/x86/include/asm/msr-index.h
@@ -122,6 +122,17 @@
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

