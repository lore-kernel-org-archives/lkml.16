Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E2B72639
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 17:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747676503; cv=none; b=CD141VjAc301NXCP+7M97opSrit13NCqQ5GHS2gwuCPc/fSaLJeS422lY8vvb83RgY1WLEgDmq0fku2nPwqrfMGvRzv2rAbESpBC2s+hqWbcJslIU9Kngejec/5T6eHCyBGW5x/nitIwGgVV6Pq/5fPGWF0vyoEoMHSU588Iv8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747676503; c=relaxed/simple;
	bh=3V2vqFuaE2SdMOhQ0ygZRS4CgCRDzWFpkWi8ONWBeYE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DQUn0yt4fLN5EWgpQdLCko46l2L/of8K+k4TPg4B84eNszhvBH84HremmLp9mU9cmLUO/P2iGOx5i0UwimoANaRiBWczgq1zz3HdRIU+Oraaosva6BzPNgNoInabmSWrpDHhqUyu2Gchf8p1Qkbwb+A0flK5EBWvdyYWyTaeCeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=fbsVoseb; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="fbsVoseb"
Received: from terminus.zytor.com (terminus.zytor.com [IPv6:2607:7c80:54:3:0:0:0:136])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 54JHfDtG1816310
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Mon, 19 May 2025 10:41:16 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 54JHfDtG1816310
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1747676477;
	bh=pTwVV9fxR55R/t7oKKxsxSE3YUkSpoGYz0wBL788XNg=;
	h=From:To:Cc:Subject:Date:From;
	b=fbsVosebiXlMbwjaalxddOz+H+aEEvJzOJtvGuWZT1rSTC/GeeJWnd5SEbmSMUvgE
	 TjkOMo+/pWLRjfLkxjzGYuLZH4aCWEQwdD5I4icUQ5Mt7ppXXJk9bthLAt3LFr7IW9
	 g8/fZLOl267Z/zQnZSb+fnEeIqkhvciUOT3ghKIrX3ecFUkLGEm+6+Yh8n9/ct+6aG
	 LWxt9tHqi3ZzhVhaRiOj7/aFtNSyHPl2/dPsa/E19kyprvP8O3uqVXMo0X0fLbAn0+
	 ifu4uZHCQK4VskJqnznXgprS2ItuKcrxe1yJHQIVmsK67xUgcmRJjZNNRDKqhGdrLo
	 DCXCZaE9iC+Gg==
From: "Xin Li (Intel)" <xin@zytor.com>
To: linux-kernel@vger.kernel.org
Cc: tglx@linutronix.de, mingo@kernel.org, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        peterz@infradead.org, jgross@suse.com
Subject: [PATCH v1 1/1] x86/msr: Convert a native_wrmsr() use to native_wrmsrq()
Date: Mon, 19 May 2025 10:41:12 -0700
Message-ID: <20250519174112.1816300-1-xin@zytor.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert a native_wrmsr() use to native_wrmsrq() to zap meaningless type
conversions when a u64 MSR value is splitted into two u32.

Signed-off-by: Xin Li (Intel) <xin@zytor.com>
---
 arch/x86/include/asm/sev-internal.h | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/x86/include/asm/sev-internal.h b/arch/x86/include/asm/sev-internal.h
index 3dfd306d1c9e..f5d6fb3b5916 100644
--- a/arch/x86/include/asm/sev-internal.h
+++ b/arch/x86/include/asm/sev-internal.h
@@ -89,12 +89,7 @@ static inline u64 sev_es_rd_ghcb_msr(void)
 
 static __always_inline void sev_es_wr_ghcb_msr(u64 val)
 {
-	u32 low, high;
-
-	low  = (u32)(val);
-	high = (u32)(val >> 32);
-
-	native_wrmsr(MSR_AMD64_SEV_ES_GHCB, low, high);
+	native_wrmsrq(MSR_AMD64_SEV_ES_GHCB, val);
 }
 
 void snp_register_ghcb_early(unsigned long paddr);
-- 
2.49.0

