Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EDF92576
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 13:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748871265; cv=none; b=pHaC/I5y87SiNIeM1RtrBYHgnLRjqxyC+1ooJZV5vSXExxl7xY7w7UFV40YVHuSKhE3bQ0UO+ZedsxiPsrfnFIHQ3PFvhmXXcdV/0gfavCyAJQXA0yqCJs/KX2GNOOkOIs2pABYsgKmjG+nJiGxYLdJiIMfByTbtygrroL3DkKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748871265; c=relaxed/simple;
	bh=E1jQCmW1AWiKNiWNWSmIeWD2f7jmxwou+CIsK3vzHdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HowuLJUFR/PoDlK5U2VzHBOGHwGeLUSf0k9qG2WtA4edneLwykwE2jn3k9h08noiTR7k4vPE1C1riP8ufV2VtBrpmTcDCRn0ZqanzyV9wxzXLisYpK9vkH8aPL/xC+zBcodxNe9JZMkxn+0k4UiJMfRseVu1m8WlUatUjLZIYpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=surriel.com; dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b=W1ByYhMF; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b="W1ByYhMF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=HOkpLGouw96M0QDvWvRx/Gas9tMsXenCGy9ePmfmVD8=; b=W1ByYhMFdbHHMn4riZuqihHQ/K
	7P7AGhfDEHGfwccrJt7Ij0c7USKu47FVCIoCFa/LQ1BPs1Py0v1PflDq15V7NIsP9NV57dlwqfriT
	5fPEDOydTsYKn1c7gKsLvA8SVWkNXclg/GGNcymWP1golQK5IFrS5/EqRlI/Oyr6teOim9zg6nTmS
	BAiW6QPZzrkuA6ZOFxR5BKkdKlVVX+tNRvVMUjxTmIrid2+LgvadaQXbjvn0nA22JOsnxcGsiAmsI
	rfjXp/imH6OwXYQuO1jQ/lN178xDayDzkXydGGb2gUAZPGhEuKoW62XG00Gog4ZZtLv+GGiEfAnyv
	up0ZTX7w==;
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@surriel.com>)
	id 1uM5Im-000000008IJ-11we;
	Mon, 02 Jun 2025 09:34:08 -0400
From: Rik van Riel <riel@surriel.com>
To: linux-kernel@vger.kernel.org
Cc: kernel-team@meta.com,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	bp@alien8.de,
	x86@kernel.org,
	yu-cheng.yu@intel.com,
	Rik van Riel <riel@surriel.com>,
	stable@kernel.org
Subject: [PATCH 2/3] x86/mm: Fix early boot use of INVPLGB
Date: Mon,  2 Jun 2025 09:30:56 -0400
Message-ID: <20250602133402.3385163-3-riel@surriel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250602133402.3385163-1-riel@surriel.com>
References: <20250602133402.3385163-1-riel@surriel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use of the INVLPGB instruction is done based off the X86_FEATURE_INVLPGB
CPU feature, which is provided directly by the hardware.

If invlpgb_kernel_range_flush is called before the kernel has read
the value of invlpgb_count_max from the hardware, the normally
bounded loop can become an infinite loop if invlpgb_count_max is
initialized to zero.

Fix that issue by initializing invlpgb_count_max to 1.

This way INVPLGB at early boot time will be a little bit slower
than normal (with initialized invplgb_count_max), and not an
instant hang at bootup time.

Signed-off-by: Rik van Riel <riel@surriel.com>
Fixes: b7aa05cbdc52 ("x86/mm: Add INVLPGB support code")
Cc: stable@kernel.org
---
 arch/x86/kernel/cpu/amd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/amd.c b/arch/x86/kernel/cpu/amd.c
index 93da466dfe2c..b2ad8d13211a 100644
--- a/arch/x86/kernel/cpu/amd.c
+++ b/arch/x86/kernel/cpu/amd.c
@@ -31,7 +31,7 @@
 
 #include "cpu.h"
 
-u16 invlpgb_count_max __ro_after_init;
+u16 invlpgb_count_max __ro_after_init = 1;
 
 static inline int rdmsrq_amd_safe(unsigned msr, u64 *p)
 {
-- 
2.49.0

