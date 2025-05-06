Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0504A2B60
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 00:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746492495; cv=none; b=CfuGXHYd4J9AKmmu9MeBYuTCoMrlnBccsiBvppNq7vaJoBpzCAd1VKCHk29J3hDyKCK4bND1BfTgXlNdIYgvME8jdbKwqFJrRdhuzNfZyQpjVMvXJYmZSbwDkddozT2dgwKYJOJQb0HKRtYRLbwsrqHovM1fLDoEDlF4gzvf4QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746492495; c=relaxed/simple;
	bh=+wIbL1X55MSJzHqFS9CRNQXdCUM1VY3bZFOCVZqzNQA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qMz/AiI24g9XxML/t05WpiYlsKSh8B2hxX3HZeWsvHmgixqih0s3BQwYV66DY2kA9i2JGEGOnMni1DbeI+Au7jWai6Ts3HDBnQDBVpVD7ZkEAxg4OaBQJHEoJOzLW9zmMiLGTf97T7+EujC5E3bGlmUOLzWFY+UkdnP3bUPr+eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=shelob.surriel.com; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shelob.surriel.com
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@shelob.surriel.com>)
	id 1uC6K6-000000000IF-3CQ2;
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
Subject: [RFC PATCH 1/9] x86/mm: Introduce MSR_IA32_CORE_CAPABILITIES
Date: Mon,  5 May 2025 20:37:39 -0400
Message-ID: <20250506003811.92405-2-riel@surriel.com>
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

MSR_IA32_CORE_CAPABILITIES indicates the existence of other MSRs.
Bit[1] indicates Remote Action Request (RAR) TLB registers.

Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>
Signed-off-by: Rik van Riel <riel@surriel.com>
---
 arch/x86/include/asm/msr-index.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
index ac21dc19dde2..0828b891fe2e 100644
--- a/arch/x86/include/asm/msr-index.h
+++ b/arch/x86/include/asm/msr-index.h
@@ -212,6 +212,12 @@
 						 * File.
 						 */
 
+#define MSR_IA32_CORE_CAPABILITIES	0x000000cf
+#define CORE_CAP_RAR			BIT(1)	/*
+						 * Remote Action Request. Used to directly
+						 * flush the TLB on remote CPUs.
+						 */
+
 #define MSR_IA32_FLUSH_CMD		0x0000010b
 #define L1D_FLUSH			BIT(0)	/*
 						 * Writeback and invalidate the
-- 
2.49.0

