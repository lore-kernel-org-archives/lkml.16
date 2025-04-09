Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D724821C18D
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 20:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744230601; cv=none; b=GsUpausYrxwYikXvmgSUgeXMV+pimxrZtezvobYd08W4AToGsd1/hpjZ0n80zl+WNjzL2VJv/yFtGfn29m+TAv21z/k8s4P8HtFbl+M4ZTQklmRavZAl/wKo7PcRuLxFHMaHCND8kfuPrNCIRnJAFyvvGqA8eIxRGmVmmAdWP2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744230601; c=relaxed/simple;
	bh=X+VA0lIwOAQriS1JPvrMBGkDqxSlHlVnTNRR/Wd/Eg0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Oa3aDYsEwYDQ7I/UCGhLuq+NcUAzPD8jplxstYlzLNtYu1ESA4sdLLP84cl5Bnq792yflH+Pevq1HsC1FZ5rOHq++GO1BnvjtSgr068DWovXmN0uMzC2VHAr1J8NhCRSEuJowxh30pmS87RmjQU5ojKu4/n6M0MRbtpKbkvKx/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NbZyzqQ4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NbZyzqQ4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72091C4CEE8;
	Wed,  9 Apr 2025 20:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744230601;
	bh=X+VA0lIwOAQriS1JPvrMBGkDqxSlHlVnTNRR/Wd/Eg0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NbZyzqQ4A9UMHSh86js+hS/pYDbOuSkNui4MOBd2Z771zIbNiFZQs8HNkzgAgaWeP
	 cmnA1+2yODLe+EAJfdMMhCKR2uQJ8SZI9d16N/HtxmRPbksj8ievLs12XXmxdE5axL
	 jQUPiegdpf4WeHxhF547Qs+jZYnlI75HyF6WDOY63F7aiGovG31J92vsYvv1TUay3M
	 eA0P08luKyDkxda6y++m67mx67+u+A7nl6BcUU4OhxER8JH5BCwaeztmOu94om+2K7
	 U6rwNPHf5vNEsxDuwJRoVkAzNkr46VcBLNqzqfSNKJLcYRJIfDUCYr4wrn9+TftTfa
	 mD2yOKA1gSvlg==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Dave Hansen <dave.hansen@intel.com>,
	Xin Li <xin@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 16/20] x86/msr: Rename 'mce_wrmsrl()' to 'mce_wrmsrq()'
Date: Wed,  9 Apr 2025 22:29:03 +0200
Message-ID: <20250409202907.3419480-17-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250409202907.3419480-1-mingo@kernel.org>
References: <20250409202907.3419480-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Suggested-by: "H. Peter Anvin" <hpa@zytor.com>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Juergen Gross <jgross@suse.com>
Cc: Dave Hansen <dave.hansen@intel.com>
Cc: Xin Li <xin@zytor.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
---
 arch/x86/kernel/cpu/mce/core.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
index 765b799c7090..255927f0284e 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -423,7 +423,7 @@ noinstr u64 mce_rdmsrq(u32 msr)
 	return EAX_EDX_VAL(val, low, high);
 }
 
-static noinstr void mce_wrmsrl(u32 msr, u64 v)
+static noinstr void mce_wrmsrq(u32 msr, u64 v)
 {
 	u32 low, high;
 
@@ -829,7 +829,7 @@ void machine_check_poll(enum mcp_flags flags, mce_banks_t *b)
 		/*
 		 * Clear state for this bank.
 		 */
-		mce_wrmsrl(mca_msr_reg(i, MCA_STATUS), 0);
+		mce_wrmsrq(mca_msr_reg(i, MCA_STATUS), 0);
 	}
 
 	/*
@@ -910,8 +910,8 @@ static noinstr bool quirk_skylake_repmov(void)
 	      MCI_STATUS_ADDRV | MCI_STATUS_MISCV |
 	      MCI_STATUS_AR | MCI_STATUS_S)) {
 		misc_enable &= ~MSR_IA32_MISC_ENABLE_FAST_STRING;
-		mce_wrmsrl(MSR_IA32_MISC_ENABLE, misc_enable);
-		mce_wrmsrl(MSR_IA32_MCx_STATUS(1), 0);
+		mce_wrmsrq(MSR_IA32_MISC_ENABLE, misc_enable);
+		mce_wrmsrq(MSR_IA32_MCx_STATUS(1), 0);
 
 		instrumentation_begin();
 		pr_err_once("Erratum detected, disable fast string copy instructions.\n");
@@ -1274,7 +1274,7 @@ static __always_inline void mce_clear_state(unsigned long *toclear)
 
 	for (i = 0; i < this_cpu_read(mce_num_banks); i++) {
 		if (arch_test_bit(i, toclear))
-			mce_wrmsrl(mca_msr_reg(i, MCA_STATUS), 0);
+			mce_wrmsrq(mca_msr_reg(i, MCA_STATUS), 0);
 	}
 }
 
@@ -1693,7 +1693,7 @@ noinstr void do_machine_check(struct pt_regs *regs)
 	instrumentation_end();
 
 clear:
-	mce_wrmsrl(MSR_IA32_MCG_STATUS, 0);
+	mce_wrmsrq(MSR_IA32_MCG_STATUS, 0);
 }
 EXPORT_SYMBOL_GPL(do_machine_check);
 
-- 
2.45.2

