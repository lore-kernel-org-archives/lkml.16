Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AB7D2BEC24;
	Wed, 11 Jun 2025 13:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749650318; cv=none; b=MAoyhAfp/BZDUL3n00cUO32x9u4oNxfxGoXFtREyf6huxk90UH/BiSnj7nydntHVJzA630eofImvJz2ymX0INcA4Bo9xOUUxfIg5Ugyd+VK6m9paq+EFd7nPpt+p5rAOAGmdH5qdFp1sgqXNbtrlscu7Jh3rjGvxMy8Q4/b4g0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749650318; c=relaxed/simple;
	bh=J/neTw/8CtDpMUhv6D9kk1GG4KVb/dHMBveK35bKnrg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=l98cGrMOsdcTP5XaPCx6d2TUjYzwhBKTiff97Pf2MeMaf1nmepuBGYiZERhfDvydYDNZs9r6WfT9mpKTn9zlbSxNqGuO9my0zEc+AJIeUtiMuF/M8S5VYyvLn4i70fIWxAlMXD1McIGbd+Sjv/P7l18NFIEDoE1kblod9DaiC84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7DF9815A1;
	Wed, 11 Jun 2025 06:58:17 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D9BE23F673;
	Wed, 11 Jun 2025 06:58:34 -0700 (PDT)
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
Subject: [PATCH v7 5/9] kselftest/arm64/mte: check MTE_FAR feature is supported
Date: Wed, 11 Jun 2025 14:58:14 +0100
Message-Id: <20250611135818.31070-6-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250611135818.31070-1-yeoreum.yun@arm.com>
References: <20250611135818.31070-1-yeoreum.yun@arm.com>
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

