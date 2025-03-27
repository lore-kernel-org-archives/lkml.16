Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1933E1F099B
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 23:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743119350; cv=none; b=YWrFyRjYpxcSiGkFF8UBluZ2pYGeulA7Dc5IcN1buCvgFwLJ0VUkFcZg1sGfzA7zTrUCtDsq5xWm9OeR42//PGT1bnwMuL+GBNrYScyruxPUtRDX9oRfD4bzM84jICizCYxuHaWp/pdrhJ8LhUwDwJMUlU8g4lbXDV4+uhqw52E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743119350; c=relaxed/simple;
	bh=VfaXKtN83UCKXqTetLMi6KmG0sbuDIPOw3k0Gwy1EjU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ai7nOfCUfAjrlTSIhX2Qdchf4+z32ick7KzvzM1khwMJEd9/UOtStEB89O/j75aeDWmPkYrm0O3/8ocwCs951WA9wOrXVSr++93gzcHrsgP6ymUsD0QrqRWrMsZ6A3WK3xSyIbRUi2KH1KppNxx613GoQIZwUopxncSsp0o7zIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iIwu6QQ7; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iIwu6QQ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743119349; x=1774655349;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VfaXKtN83UCKXqTetLMi6KmG0sbuDIPOw3k0Gwy1EjU=;
  b=iIwu6QQ7QNKrhOPZ2xSqJARkgYXBd3irat+ZTwdk1100wDb9NoLTgZ0v
   1tMWca/pqeneMspVqTKGgKxZmxiH9jlI5OiOJsEL+kiHQiFnHuFHuSdaG
   q5yzGHCdyZXlqtOY3SVTbk+TteB1mepy9c2JO5yStNageXyFwvryXppi0
   nPM96ALAEmoZPFe1GXOTcxpch14hTQLv6CV8BxUyZuykBDrHoaExBXY9L
   RD6040bezJuyRipxk9zSLHMe/bPUg4Chesq2VSCRU4imBQQH8BHki8FqO
   0sPGO44+McqosZ9uo2M0ZA3DfW8zQN+W32W+H7DbhFuR+x0Wj45HShv6t
   A==;
X-CSE-ConnectionGUID: 1oETKyeQQ0y8sXzFAOq/dQ==
X-CSE-MsgGUID: li+FO+AGSlCxaUl2O79Hbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="43627997"
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; 
   d="scan'208";a="43627997"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 16:49:08 -0700
X-CSE-ConnectionGUID: ZM1lalVuStWkW10SjCIn7A==
X-CSE-MsgGUID: iEDfi0/IQ7CVaEDpZKHoLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; 
   d="scan'208";a="130150528"
Received: from sohilmeh.sc.intel.com ([172.25.103.65])
  by orviesa003.jf.intel.com with ESMTP; 27 Mar 2025 16:49:07 -0700
From: Sohil Mehta <sohil.mehta@intel.com>
To: x86@kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Sohil Mehta <sohil.mehta@intel.com>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	Kai Huang <kai.huang@intel.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Mike Rapoport <rppt@kernel.org>,
	Petr Mladek <pmladek@suse.com>,
	Jani Nikula <jani.nikula@intel.com>,
	Tony Luck <tony.luck@intel.com>,
	Xin Li <xin@zytor.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 8/9] x86/nmi: Clean up NMI selftest
Date: Thu, 27 Mar 2025 23:46:28 +0000
Message-ID: <20250327234629.3953536-9-sohil.mehta@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250327234629.3953536-1-sohil.mehta@intel.com>
References: <20250327234629.3953536-1-sohil.mehta@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The expected_testcase_failures variable in the NMI selftest has never
been set since its introduction. Remove this unused variable along with
the related checks to simplify the code.

While at it, replace printk() with the corresponding pr_{cont,info}()
calls. Also, get rid of the superfluous testname wrapper and the
redundant file path comment.

Signed-off-by: Sohil Mehta <sohil.mehta@intel.com>
---
 arch/x86/kernel/nmi_selftest.c | 52 +++++++++++-----------------------
 1 file changed, 16 insertions(+), 36 deletions(-)

diff --git a/arch/x86/kernel/nmi_selftest.c b/arch/x86/kernel/nmi_selftest.c
index e93a8545c74d..a010e9d062bf 100644
--- a/arch/x86/kernel/nmi_selftest.c
+++ b/arch/x86/kernel/nmi_selftest.c
@@ -1,7 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * arch/x86/kernel/nmi-selftest.c
- *
  * Testsuite for NMI: IPIs
  *
  * Started by Don Zickus:
@@ -30,7 +28,6 @@ static DECLARE_BITMAP(nmi_ipi_mask, NR_CPUS) __initdata;
 
 static int __initdata testcase_total;
 static int __initdata testcase_successes;
-static int __initdata expected_testcase_failures;
 static int __initdata unexpected_testcase_failures;
 static int __initdata unexpected_testcase_unknowns;
 
@@ -120,26 +117,22 @@ static void __init dotest(void (*testcase_fn)(void), int expected)
 		unexpected_testcase_failures++;
 
 		if (nmi_fail == FAILURE)
-			printk(KERN_CONT "FAILED |");
+			pr_cont("FAILED |");
 		else if (nmi_fail == TIMEOUT)
-			printk(KERN_CONT "TIMEOUT|");
+			pr_cont("TIMEOUT|");
 		else
-			printk(KERN_CONT "ERROR  |");
+			pr_cont("ERROR  |");
 		dump_stack();
 	} else {
 		testcase_successes++;
-		printk(KERN_CONT "  ok  |");
+		pr_cont("  ok  |");
 	}
-	testcase_total++;
+	pr_cont("\n");
 
+	testcase_total++;
 	reset_nmi();
 }
 
-static inline void __init print_testname(const char *testname)
-{
-	printk("%12s:", testname);
-}
-
 void __init nmi_selftest(void)
 {
 	init_nmi_testsuite();
@@ -147,38 +140,25 @@ void __init nmi_selftest(void)
         /*
 	 * Run the testsuite:
 	 */
-	printk("----------------\n");
-	printk("| NMI testsuite:\n");
-	printk("--------------------\n");
+	pr_info("----------------\n");
+	pr_info("| NMI testsuite:\n");
+	pr_info("--------------------\n");
 
-	print_testname("remote IPI");
+	pr_info("%12s:", "remote IPI");
 	dotest(remote_ipi, SUCCESS);
-	printk(KERN_CONT "\n");
-	print_testname("local IPI");
+
+	pr_info("%12s:", "local IPI");
 	dotest(local_ipi, SUCCESS);
-	printk(KERN_CONT "\n");
 
 	cleanup_nmi_testsuite();
 
+	pr_info("--------------------\n");
 	if (unexpected_testcase_failures) {
-		printk("--------------------\n");
-		printk("BUG: %3d unexpected failures (out of %3d) - debugging disabled! |\n",
+		pr_info("BUG: %3d unexpected failures (out of %3d) - debugging disabled! |\n",
 			unexpected_testcase_failures, testcase_total);
-		printk("-----------------------------------------------------------------\n");
-	} else if (expected_testcase_failures && testcase_successes) {
-		printk("--------------------\n");
-		printk("%3d out of %3d testcases failed, as expected. |\n",
-			expected_testcase_failures, testcase_total);
-		printk("----------------------------------------------------\n");
-	} else if (expected_testcase_failures && !testcase_successes) {
-		printk("--------------------\n");
-		printk("All %3d testcases failed, as expected. |\n",
-			expected_testcase_failures);
-		printk("----------------------------------------\n");
 	} else {
-		printk("--------------------\n");
-		printk("Good, all %3d testcases passed! |\n",
+		pr_info("Good, all %3d testcases passed! |\n",
 			testcase_successes);
-		printk("---------------------------------\n");
 	}
+	pr_info("-----------------------------------------------------------------\n");
 }
-- 
2.43.0

