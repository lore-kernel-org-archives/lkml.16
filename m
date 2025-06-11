Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0001326529E;
	Wed, 11 Jun 2025 09:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749634886; cv=none; b=AE/kPZxplTlg22H16H3xoHDOaxP7ZCL3JvJ6GUpiRT0EpiveBQPdWwaZxQxYGrW4gyCzDukSDbacwkreRdIN8Ke6wOFzH9dQLUoiCHn8ccSXp01JzqpYHpLUo9oKBpt5JMtcASTcDyq4fWPj+jlrwEJyMPs48J8cQTILiF3O74U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749634886; c=relaxed/simple;
	bh=6uBTdT2B6RsLk513zkhvEYX3v2/E9Qkc18jyHrcnS10=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AtjSBl1ObRidR2E6GHUzf5RC81VQFoCPRQSNraiRUK7UAbChjSnLhwsQuelpin+y3tpwg8+htbSGDayGjvVW46jwNfnRJQTTO6bnc1HTh/Gx/4RD8uplgz5Kt6H8+smuiLRkUkiHcvzW4IBiOBqvDeoeUcNAUl3NMNd7sfX0Zbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BE2C61688;
	Wed, 11 Jun 2025 02:41:04 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1C98A3F59E;
	Wed, 11 Jun 2025 02:41:21 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: catalin.marinas@arm.com,
	pcc@google.com,
	will@kernel.org,
	broonie@kernel.org,
	anshuman.khandual@arm.com,
	joey.gouly@arm.com,
	yury.khrustalev@arm.com,
	maz@kernel.org,
	oliver.upton@linux.dev,
	frederic@kernel.org,
	akpm@linux-foundation.org,
	surenb@google.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v6 5/9] kselftest/arm64/mte: check MTE_FAR feature is supported
Date: Wed, 11 Jun 2025 10:41:03 +0100
Message-Id: <20250611094107.928457-6-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250611094107.928457-1-yeoreum.yun@arm.com>
References: <20250611094107.928457-1-yeoreum.yun@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To run the MTE_FAR test when cpu supports MTE_FAR feature,
check the MTE_FAR_ feature is supported in mte test.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 tools/testing/selftests/arm64/mte/mte_common_util.c | 7 +++++++
 tools/testing/selftests/arm64/mte/mte_common_util.h | 1 +
 2 files changed, 8 insertions(+)

diff --git a/tools/testing/selftests/arm64/mte/mte_common_util.c b/tools/testing/selftests/arm64/mte/mte_common_util.c
index 83240b980f9c..048b8a507b70 100644
--- a/tools/testing/selftests/arm64/mte/mte_common_util.c
+++ b/tools/testing/selftests/arm64/mte/mte_common_util.c
@@ -6,6 +6,7 @@
 #include <signal.h>
 #include <stdio.h>
 #include <stdlib.h>
+#include <time.h>
 #include <unistd.h>
 
 #include <linux/auxvec.h>
@@ -26,6 +27,7 @@
 #define INIT_BUFFER_SIZE       256
 
 struct mte_fault_cxt cur_mte_cxt;
+bool mtefar_support;
 static unsigned int mte_cur_mode;
 static unsigned int mte_cur_pstate_tco;
 
@@ -273,6 +275,7 @@ void mte_initialize_current_context(int mode, uintptr_t ptr, ssize_t range)
 	cur_mte_cxt.fault_valid = false;
 	cur_mte_cxt.trig_addr = ptr;
 	cur_mte_cxt.trig_range = range;
+
 	if (mode == MTE_SYNC_ERR)
 		cur_mte_cxt.trig_si_code = SEGV_MTESERR;
 	else if (mode == MTE_ASYNC_ERR)
@@ -325,12 +328,16 @@ int mte_switch_mode(int mte_option, unsigned long incl_mask)
 int mte_default_setup(void)
 {
 	unsigned long hwcaps2 = getauxval(AT_HWCAP2);
+	unsigned long hwcaps3 = getauxval(AT_HWCAP3);
 	unsigned long en = 0;
 	int ret;
 
 	if (!(hwcaps2 & HWCAP2_MTE))
 		ksft_exit_skip("MTE features unavailable\n");
 
+	if (hwcaps3 & HWCAP3_MTE_FAR)
+		mtefar_support = true;
+
 	/* Get current mte mode */
 	ret = prctl(PR_GET_TAGGED_ADDR_CTRL, en, 0, 0, 0);
 	if (ret < 0) {
diff --git a/tools/testing/selftests/arm64/mte/mte_common_util.h b/tools/testing/selftests/arm64/mte/mte_common_util.h
index 6b109e84fa39..4e1dd959df9b 100644
--- a/tools/testing/selftests/arm64/mte/mte_common_util.h
+++ b/tools/testing/selftests/arm64/mte/mte_common_util.h
@@ -37,6 +37,7 @@ struct mte_fault_cxt {
 };
 
 extern struct mte_fault_cxt cur_mte_cxt;
+extern bool mtefar_support;
 
 /* MTE utility functions */
 void mte_default_handler(int signum, siginfo_t *si, void *uc);
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}

