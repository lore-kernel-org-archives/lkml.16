Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0551C3306
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 01:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747703059; cv=none; b=tghp/gvl3LPdJBLnT/rVRIG8hZJ7dMiIUBZtIFMFMVSE3zAMB5PJCsm2fPXPmaQ/P+a1Zqovkfpy1Z/5B+xe0EBsWpoIpgY4ceH20imcqRwhySxCzfKvLrvQ00KqUu2QenxTXVXXCvpMEABJ+UWaobLf416S5r65enpRT0RcNUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747703059; c=relaxed/simple;
	bh=tPmLpGvLJtw7+JasLKgDCdEkuGhtqgstYWemAQ/fUSY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fjCVxcVtV/AQVcUHeWuLcZZZo7Mq21iaN1HaFtKsPR65MDfyUytG2wBG+EvKVs3C5guuwfQ5s4SNl6Opj9PNa8oLfwWB1RS0rZg3kDBdSbyV+8oONv4IuXDZxpV4F4ykW2iYN9yWVaq7dYZuMtUwOo+9xHk7SD3nTonsnIO9d6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=shelob.surriel.com; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shelob.surriel.com
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@shelob.surriel.com>)
	id 1uHBOc-000000000aB-3wmG;
	Mon, 19 May 2025 21:03:54 -0400
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
	nadav.amit@gmail.com,
	Yu-cheng Yu <yu-cheng.yu@intel.com>,
	Rik van Riel <riel@surriel.com>
Subject: [RFC v2 1/9] x86/mm: Introduce MSR_IA32_CORE_CAPABILITIES
Date: Mon, 19 May 2025 21:02:26 -0400
Message-ID: <20250520010350.1740223-2-riel@surriel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250520010350.1740223-1-riel@surriel.com>
References: <20250520010350.1740223-1-riel@surriel.com>
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
index b7dded3c8113..c848dd4bfceb 100644
--- a/arch/x86/include/asm/msr-index.h
+++ b/arch/x86/include/asm/msr-index.h
@@ -220,6 +220,12 @@
 						     * their affected status.
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

