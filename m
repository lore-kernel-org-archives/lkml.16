Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D02618DF8D
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 08:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744533716; cv=none; b=IcabA3By2qEYyTwwmm87niR7WToJ3h/gswWDpIEgo1yDiNqKaJMKJ8C4sAhZUcvLG7N8o4FN1zvAImSx2bF92L2DKtcqTblNnC9oWzPwjk48ZZa9UZW3IqcQyeBZGITBMrAxXvP6lgD740TGboaCeRPenNOVzaHNDldVHwkBSAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744533716; c=relaxed/simple;
	bh=ToPxVYrGsCS+1Pt/iKiZ9XhspSwbIKtXYzWedB2jReA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fsyx+2IJshGf+FhLbtd0rem2md4RIu5C6BfHg2dj4mxmJ/2KHzJ2Ec6+opiVw3cCMZsxtXTh/TQ/kci/F3A+cGQ76veqSK0ttIXTT5pF0jHU/k1421bMHdSQe1+eU1WbSlbnUPW3iu4AGIeHxiedteV+jV/3Z+8iDL/+98kGmls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UtAf65Qk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UtAf65Qk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EADEC4CEDD;
	Sun, 13 Apr 2025 08:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744533715;
	bh=ToPxVYrGsCS+1Pt/iKiZ9XhspSwbIKtXYzWedB2jReA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UtAf65QkqUGUrDbB7i2Huw1UCvUcfvv1L4S83bLVuSI6syyHCPq3fgbR0nVDjah+E
	 FM9bOAQ+DwwLHEg+cQpKgC3MrREMCRThPkSm1t8VAXiAlg0rOtnLWDdPWZIaXucpJw
	 HYWlcuvuLW1cXyWAjaqgSCbH+CaWP0YWXwVr0IuXKMKwtTAthldtiFCOUSRErpa6Dz
	 A+jqbGh4icnH7PVMPm5/pLN86agJUjevagn6r9RKiRq90AafXdp1QCzrNfQW2N61w8
	 SoNSTqWEwNM01BHQjNZBfmN6O8KZRV2yXsraOXkijav5BHSF92Z14Z3qO28qSMF3LI
	 40kxNWPI0dvsQ==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Mario Limonciello <superm1@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 2/6] x86/platform/amd: Add standard header guards to <asm/amd/ibs.h>
Date: Sun, 13 Apr 2025 10:41:40 +0200
Message-ID: <20250413084144.3746608-3-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250413084144.3746608-1-mingo@kernel.org>
References: <20250413084144.3746608-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cc: Borislav Petkov <bp@alien8.de>
Cc: Mario Limonciello <superm1@kernel.org>
---
 arch/x86/include/asm/amd/ibs.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/x86/include/asm/amd/ibs.h b/arch/x86/include/asm/amd/ibs.h
index 77f3a589a99a..3ee5903982c2 100644
--- a/arch/x86/include/asm/amd/ibs.h
+++ b/arch/x86/include/asm/amd/ibs.h
@@ -1,4 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_X86_AMD_IBS_H
+#define _ASM_X86_AMD_IBS_H
+
 /*
  * From PPR Vol 1 for AMD Family 19h Model 01h B1
  * 55898 Rev 0.35 - Feb 5, 2021
@@ -151,3 +154,5 @@ struct perf_ibs_data {
 	};
 	u64		regs[MSR_AMD64_IBS_REG_COUNT_MAX];
 };
+
+#endif /* _ASM_X86_AMD_IBS_H */
-- 
2.45.2

