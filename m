Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD58027FD42;
	Wed, 18 Jun 2025 08:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750236335; cv=none; b=nSpxeM3ZrX7moamxm4Q0EMuXwdp/v47E8My2Y782YAnR+JMRPVJwWxt+I7P3VE8UNsvVlHKsV4DfN/5WCMiZCkTf8oY0CURiTxXI3hjDDJPVt0eGIxoxxsXVWK+JTuAxTFFSqp0Ei8ya/CwqdRQt/vX8BFNPO4X2cmaUJpqjZvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750236335; c=relaxed/simple;
	bh=2dLXgiGlLIuWNytTHUgJmAIojt6o20xHkHiEsBOOFwo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jXJP690HDZOsc+rWL75D84Y2boxdf68lWBLCIGQi/vRGt5Xd1u/ip5h1yHkBK9PI1JoJfpIe7kEKwXe7g0T00EaT+TbmIzNwQ9nBOngCJ3hlmNBGcap9kdGA4JTFTIwx96jG6Qj7c9VvH7WYf0/ek2WoCmlhmUgZ3hAgw26+024=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A8A214BF;
	Wed, 18 Jun 2025 01:45:12 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 00EF13F66E;
	Wed, 18 Jun 2025 01:45:30 -0700 (PDT)
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
Subject: [PATCH v9 06/10] kselftest/arm64/mte: check MTE_FAR feature is supported
Date: Wed, 18 Jun 2025 09:45:09 +0100
Message-Id: <20250618084513.1761345-7-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250618084513.1761345-1-yeoreum.yun@arm.com>
References: <20250618084513.1761345-1-yeoreum.yun@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To run the MTE_FAR test when cpu supports MTE_FAR feature,
check the MTE_FAR feature is supported in mte test.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/mte/mte_common_util.c | 4 ++++
 tools/testing/selftests/arm64/mte/mte_common_util.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/tools/testing/selftests/arm64/mte/mte_common_util.c b/tools/testing/selftests/arm64/mte/mte_common_util.c
index 83240b980f9c..5c5680a87498 100644
--- a/tools/testing/selftests/arm64/mte/mte_common_util.c
+++ b/tools/testing/selftests/arm64/mte/mte_common_util.c
@@ -26,6 +26,7 @@
 #define INIT_BUFFER_SIZE       256
 
 struct mte_fault_cxt cur_mte_cxt;
+bool mtefar_support;
 static unsigned int mte_cur_mode;
 static unsigned int mte_cur_pstate_tco;
 
@@ -325,12 +326,15 @@ int mte_switch_mode(int mte_option, unsigned long incl_mask)
 int mte_default_setup(void)
 {
 	unsigned long hwcaps2 = getauxval(AT_HWCAP2);
+	unsigned long hwcaps3 = getauxval(AT_HWCAP3);
 	unsigned long en = 0;
 	int ret;
 
 	if (!(hwcaps2 & HWCAP2_MTE))
 		ksft_exit_skip("MTE features unavailable\n");
 
+	mtefar_support = !!(hwcaps3 & HWCAP3_MTE_FAR);
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

