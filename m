Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A5829A9FB
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 00:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746492474; cv=none; b=ZGeZ/N53Qcwk1cABJkcLOQ/LHKfBmrbCtvuSihay/tE+zJ5/NgpEDl9LQAbPA0t3xxGCa+wztrtmi06IKwL4e83Jgy0kgFhXA8Dx8uxhM+kqgBWVA8N6PiPT1org6s7UrTS+g+P8ak8863PrnYQn0TFYH/Xpem9eNDqmruLz1Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746492474; c=relaxed/simple;
	bh=71WvzsdPoyrjXq8l+mrusg+sx3T4Ajw8dHlsaDfvdQE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kysyd0laAvCaC6bJ2IFl90e6n+Kx1UiplFCKS97GiCNtkZrc6haboH6nIrbQCk76o1v1n8DmG+h+HeUynj7qaJr/WasUqC/jaQ3i5Wmf26490ozXRSDZk4Z2oNCbXP5boNgdZ2pT7kni8qfy9UFTaW2U5muALrxZvQ2agPJrgNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=shelob.surriel.com; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shelob.surriel.com
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@shelob.surriel.com>)
	id 1uC6K6-000000000IF-3NvK;
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
	Rik van Riel <riel@fb.com>,
	Rik van Riel <riel@surriel.com>
Subject: [RFC PATCH 3/9] x86/mm: enable BROADCAST_TLB_FLUSH on Intel, too
Date: Mon,  5 May 2025 20:37:41 -0400
Message-ID: <20250506003811.92405-4-riel@surriel.com>
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

From: Rik van Riel <riel@fb.com>

Much of the code for Intel RAR and AMD INVLPGB is shared.

Place both under the same config option.

Signed-off-by: Rik van Riel <riel@surriel.com>
---
 arch/x86/Kconfig.cpu | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/Kconfig.cpu b/arch/x86/Kconfig.cpu
index f928cf6e3252..f9cdd145abba 100644
--- a/arch/x86/Kconfig.cpu
+++ b/arch/x86/Kconfig.cpu
@@ -360,7 +360,7 @@ menuconfig PROCESSOR_SELECT
 
 config BROADCAST_TLB_FLUSH
 	def_bool y
-	depends on CPU_SUP_AMD && 64BIT
+	depends on (CPU_SUP_AMD || CPU_SUP_INTEL) && 64BIT
 
 config CPU_SUP_INTEL
 	default y
-- 
2.49.0

