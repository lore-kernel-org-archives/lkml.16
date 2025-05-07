Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F82C28B7CE
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 15:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746632846; cv=none; b=ms/cYbeqYvLBE8PhI2zbZ0I6s9w5dBH2j6oBGltpzUplXlblhl7PVrlwY9NKOVCrHovioI1KnlE76CB9RbVuZ9xPhpNAp9hkrzc8FAK9QeH9DnvPdAeXuJ066vtOCsv4D5+NTHrZB5REQy1BggpNI/SZqDMjkxYdReBXm0j96AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746632846; c=relaxed/simple;
	bh=1eZolM8PXZ1glHIOupuL1UKzBcmbDfnVjXHZPkpkycE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=myAWbIGdviPN+8oKPTZHBnA8K8+hylA9d+TvKbiJ4gqiB3oRTZzVxD6gasEH5+7LMSam1Br7FVsuN5nWuff/FodoXaiWUazaLmlWMTYba+L2CpRTIEbkPV9t2raVB3MfGY5eTiwbZgrHfQmE9HwOgVwScBxiIzuj21/RVhoJkuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B45D1204C;
	Wed,  7 May 2025 08:47:13 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 371823F58B;
	Wed,  7 May 2025 08:47:20 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: catalin.marinas@arm.com,
	pcc@google.com,
	will@kernel.org,
	broonie@kernel.org,
	anshuman.khandual@arm.com,
	joey.gouly@arm.com,
	maz@kernel.org,
	oliver.upton@linux.dev,
	frederic@kernel.org,
	james.morse@arm.com,
	hardevsinh.palaniya@siliconsignals.io,
	huangxiaojia2@huawei.com,
	mark.rutland@arm.com,
	samuel.holland@sifive.com,
	palmer@rivosinc.com,
	charlie@rivosinc.com,
	thiago.bauermann@linaro.org,
	bgray@linux.ibm.com,
	tglx@linutronix.de,
	puranjay@kernel.org,
	david@redhat.com,
	yang@os.amperecomputing.com,
	mbenes@suse.cz,
	joel.granados@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v4 6/7] kselftest/arm64/mte: preparation for mte store only test
Date: Wed,  7 May 2025 16:46:53 +0100
Message-Id: <20250507154654.1937588-7-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250507154654.1937588-1-yeoreum.yun@arm.com>
References: <20250507154654.1937588-1-yeoreum.yun@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since ARMv8.9, FEAT_MTE_STORE_ONLY can be used to restrict raise of tag
check fault on store operation only.

This patch is preparation for testing FEAT_MTE_STORE_ONLY
It shouldn't change test result.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 .../selftests/arm64/mte/check_buffer_fill.c        | 10 +++++-----
 .../selftests/arm64/mte/check_child_memory.c       |  4 ++--
 .../selftests/arm64/mte/check_hugetlb_options.c    |  6 +++---
 .../selftests/arm64/mte/check_ksm_options.c        |  2 +-
 .../selftests/arm64/mte/check_mmap_options.c       |  6 +++---
 .../selftests/arm64/mte/check_tags_inclusion.c     |  8 ++++----
 tools/testing/selftests/arm64/mte/check_user_mem.c |  2 +-
 .../testing/selftests/arm64/mte/mte_common_util.c  | 14 ++++++++++++--
 .../testing/selftests/arm64/mte/mte_common_util.h  |  3 ++-
 9 files changed, 33 insertions(+), 22 deletions(-)

diff --git a/tools/testing/selftests/arm64/mte/check_buffer_fill.c b/tools/testing/selftests/arm64/mte/check_buffer_fill.c
index 5248b5265aa4..ff4e07503349 100644
--- a/tools/testing/selftests/arm64/mte/check_buffer_fill.c
+++ b/tools/testing/selftests/arm64/mte/check_buffer_fill.c
@@ -31,7 +31,7 @@ static int check_buffer_by_byte(int mem_type, int mode)
 	int i, j, item;
 	bool err;
 
-	mte_switch_mode(mode, MTE_ALLOW_NON_ZERO_TAG);
+	mte_switch_mode(mode, MTE_ALLOW_NON_ZERO_TAG, false);
 	item = ARRAY_SIZE(sizes);
 
 	for (i = 0; i < item; i++) {
@@ -68,7 +68,7 @@ static int check_buffer_underflow_by_byte(int mem_type, int mode,
 	bool err;
 	char *und_ptr = NULL;
 
-	mte_switch_mode(mode, MTE_ALLOW_NON_ZERO_TAG);
+	mte_switch_mode(mode, MTE_ALLOW_NON_ZERO_TAG, false);
 	item = ARRAY_SIZE(sizes);
 	for (i = 0; i < item; i++) {
 		ptr = (char *)mte_allocate_memory_tag_range(sizes[i], mem_type, 0,
@@ -164,7 +164,7 @@ static int check_buffer_overflow_by_byte(int mem_type, int mode,
 	size_t tagged_size, overflow_size;
 	char *over_ptr = NULL;
 
-	mte_switch_mode(mode, MTE_ALLOW_NON_ZERO_TAG);
+	mte_switch_mode(mode, MTE_ALLOW_NON_ZERO_TAG, false);
 	item = ARRAY_SIZE(sizes);
 	for (i = 0; i < item; i++) {
 		ptr = (char *)mte_allocate_memory_tag_range(sizes[i], mem_type, 0,
@@ -337,7 +337,7 @@ static int check_buffer_by_block(int mem_type, int mode)
 {
 	int i, item, result = KSFT_PASS;
 
-	mte_switch_mode(mode, MTE_ALLOW_NON_ZERO_TAG);
+	mte_switch_mode(mode, MTE_ALLOW_NON_ZERO_TAG, false);
 	item = ARRAY_SIZE(sizes);
 	cur_mte_cxt.fault_valid = false;
 	for (i = 0; i < item; i++) {
@@ -368,7 +368,7 @@ static int check_memory_initial_tags(int mem_type, int mode, int mapping)
 	int run, fd;
 	int total = ARRAY_SIZE(sizes);
 
-	mte_switch_mode(mode, MTE_ALLOW_NON_ZERO_TAG);
+	mte_switch_mode(mode, MTE_ALLOW_NON_ZERO_TAG, false);
 	for (run = 0; run < total; run++) {
 		/* check initial tags for anonymous mmap */
 		ptr = (char *)mte_allocate_memory(sizes[run], mem_type, mapping, false);
diff --git a/tools/testing/selftests/arm64/mte/check_child_memory.c b/tools/testing/selftests/arm64/mte/check_child_memory.c
index b97ea3981c21..5e97ee792e4d 100644
--- a/tools/testing/selftests/arm64/mte/check_child_memory.c
+++ b/tools/testing/selftests/arm64/mte/check_child_memory.c
@@ -88,7 +88,7 @@ static int check_child_memory_mapping(int mem_type, int mode, int mapping)
 	int item = ARRAY_SIZE(sizes);
 
 	item = ARRAY_SIZE(sizes);
-	mte_switch_mode(mode, MTE_ALLOW_NON_ZERO_TAG);
+	mte_switch_mode(mode, MTE_ALLOW_NON_ZERO_TAG, false);
 	for (run = 0; run < item; run++) {
 		ptr = (char *)mte_allocate_memory_tag_range(sizes[run], mem_type, mapping,
 							    UNDERFLOW, OVERFLOW);
@@ -109,7 +109,7 @@ static int check_child_file_mapping(int mem_type, int mode, int mapping)
 	int run, fd, map_size, result = KSFT_PASS;
 	int total = ARRAY_SIZE(sizes);
 
-	mte_switch_mode(mode, MTE_ALLOW_NON_ZERO_TAG);
+	mte_switch_mode(mode, MTE_ALLOW_NON_ZERO_TAG, false);
 	for (run = 0; run < total; run++) {
 		fd = create_temp_file();
 		if (fd == -1)
diff --git a/tools/testing/selftests/arm64/mte/check_hugetlb_options.c b/tools/testing/selftests/arm64/mte/check_hugetlb_options.c
index 4e644a606394..aad1234c7e0f 100644
--- a/tools/testing/selftests/arm64/mte/check_hugetlb_options.c
+++ b/tools/testing/selftests/arm64/mte/check_hugetlb_options.c
@@ -151,7 +151,7 @@ static int check_hugetlb_memory_mapping(int mem_type, int mode, int mapping, int
 
 	map_size = default_huge_page_size();
 
-	mte_switch_mode(mode, MTE_ALLOW_NON_ZERO_TAG);
+	mte_switch_mode(mode, MTE_ALLOW_NON_ZERO_TAG, false);
 	map_ptr = (char *)mte_allocate_memory(map_size, mem_type, mapping, false);
 	if (check_allocated_memory(map_ptr, map_size, mem_type, false) != KSFT_PASS)
 		return KSFT_FAIL;
@@ -180,7 +180,7 @@ static int check_clear_prot_mte_flag(int mem_type, int mode, int mapping)
 	unsigned long map_size;
 
 	prot_flag = PROT_READ | PROT_WRITE;
-	mte_switch_mode(mode, MTE_ALLOW_NON_ZERO_TAG);
+	mte_switch_mode(mode, MTE_ALLOW_NON_ZERO_TAG, false);
 	map_size = default_huge_page_size();
 	map_ptr = (char *)mte_allocate_memory_tag_range(map_size, mem_type, mapping,
 							0, 0);
@@ -210,7 +210,7 @@ static int check_child_hugetlb_memory_mapping(int mem_type, int mode, int mappin
 
 	map_size = default_huge_page_size();
 
-	mte_switch_mode(mode, MTE_ALLOW_NON_ZERO_TAG);
+	mte_switch_mode(mode, MTE_ALLOW_NON_ZERO_TAG, false);
 	ptr = (char *)mte_allocate_memory_tag_range(map_size, mem_type, mapping,
 						    0, 0);
 	if (check_allocated_memory_range(ptr, map_size, mem_type,
diff --git a/tools/testing/selftests/arm64/mte/check_ksm_options.c b/tools/testing/selftests/arm64/mte/check_ksm_options.c
index afea4e381862..0cf5faef1724 100644
--- a/tools/testing/selftests/arm64/mte/check_ksm_options.c
+++ b/tools/testing/selftests/arm64/mte/check_ksm_options.c
@@ -106,7 +106,7 @@ static int check_madvise_options(int mem_type, int mode, int mapping)
 		return err;
 	}
 
-	mte_switch_mode(mode, MTE_ALLOW_NON_ZERO_TAG);
+	mte_switch_mode(mode, MTE_ALLOW_NON_ZERO_TAG, false);
 	ptr = mte_allocate_memory(TEST_UNIT * page_sz, mem_type, mapping, true);
 	if (check_allocated_memory(ptr, TEST_UNIT * page_sz, mem_type, false) != KSFT_PASS)
 		return KSFT_FAIL;
diff --git a/tools/testing/selftests/arm64/mte/check_mmap_options.c b/tools/testing/selftests/arm64/mte/check_mmap_options.c
index 4f26617c8e69..d4193377b406 100644
--- a/tools/testing/selftests/arm64/mte/check_mmap_options.c
+++ b/tools/testing/selftests/arm64/mte/check_mmap_options.c
@@ -81,7 +81,7 @@ static int check_anonymous_memory_mapping(int mem_type, int mode, int mapping, i
 	int run, result, map_size;
 	int item = ARRAY_SIZE(sizes);
 
-	mte_switch_mode(mode, MTE_ALLOW_NON_ZERO_TAG);
+	mte_switch_mode(mode, MTE_ALLOW_NON_ZERO_TAG, false);
 	for (run = 0; run < item; run++) {
 		map_size = sizes[run] + OVERFLOW + UNDERFLOW;
 		map_ptr = (char *)mte_allocate_memory(map_size, mem_type, mapping, false);
@@ -113,7 +113,7 @@ static int check_file_memory_mapping(int mem_type, int mode, int mapping, int ta
 	int total = ARRAY_SIZE(sizes);
 	int result = KSFT_PASS;
 
-	mte_switch_mode(mode, MTE_ALLOW_NON_ZERO_TAG);
+	mte_switch_mode(mode, MTE_ALLOW_NON_ZERO_TAG, false);
 	for (run = 0; run < total; run++) {
 		fd = create_temp_file();
 		if (fd == -1)
@@ -152,7 +152,7 @@ static int check_clear_prot_mte_flag(int mem_type, int mode, int mapping, int at
 	int total = ARRAY_SIZE(sizes);
 
 	prot_flag = PROT_READ | PROT_WRITE;
-	mte_switch_mode(mode, MTE_ALLOW_NON_ZERO_TAG);
+	mte_switch_mode(mode, MTE_ALLOW_NON_ZERO_TAG, false);
 	for (run = 0; run < total; run++) {
 		map_size = sizes[run] + OVERFLOW + UNDERFLOW;
 		ptr = (char *)mte_allocate_memory_tag_range(sizes[run], mem_type, mapping,
diff --git a/tools/testing/selftests/arm64/mte/check_tags_inclusion.c b/tools/testing/selftests/arm64/mte/check_tags_inclusion.c
index b96296ab9870..4b764f2a8185 100644
--- a/tools/testing/selftests/arm64/mte/check_tags_inclusion.c
+++ b/tools/testing/selftests/arm64/mte/check_tags_inclusion.c
@@ -57,7 +57,7 @@ static int check_single_included_tags(int mem_type, int mode)
 		return KSFT_FAIL;
 
 	for (tag = 0; (tag < MT_TAG_COUNT) && (result == KSFT_PASS); tag++) {
-		ret = mte_switch_mode(mode, MT_INCLUDE_VALID_TAG(tag));
+		ret = mte_switch_mode(mode, MT_INCLUDE_VALID_TAG(tag), false);
 		if (ret != 0)
 			result = KSFT_FAIL;
 		/* Try to catch a excluded tag by a number of tries. */
@@ -91,7 +91,7 @@ static int check_multiple_included_tags(int mem_type, int mode)
 
 	for (tag = 0; (tag < MT_TAG_COUNT - 1) && (result == KSFT_PASS); tag++) {
 		excl_mask |= 1 << tag;
-		mte_switch_mode(mode, MT_INCLUDE_VALID_TAGS(excl_mask));
+		mte_switch_mode(mode, MT_INCLUDE_VALID_TAGS(excl_mask), false);
 		/* Try to catch a excluded tag by a number of tries. */
 		for (run = 0; (run < RUNS) && (result == KSFT_PASS); run++) {
 			ptr = mte_insert_tags(ptr, BUFFER_SIZE);
@@ -120,7 +120,7 @@ static int check_all_included_tags(int mem_type, int mode)
 				   mem_type, false) != KSFT_PASS)
 		return KSFT_FAIL;
 
-	ret = mte_switch_mode(mode, MT_INCLUDE_TAG_MASK);
+	ret = mte_switch_mode(mode, MT_INCLUDE_TAG_MASK, false);
 	if (ret != 0)
 		return KSFT_FAIL;
 	/* Try to catch a excluded tag by a number of tries. */
@@ -145,7 +145,7 @@ static int check_none_included_tags(int mem_type, int mode)
 	if (check_allocated_memory(ptr, BUFFER_SIZE, mem_type, false) != KSFT_PASS)
 		return KSFT_FAIL;
 
-	ret = mte_switch_mode(mode, MT_EXCLUDE_TAG_MASK);
+	ret = mte_switch_mode(mode, MT_EXCLUDE_TAG_MASK, false);
 	if (ret != 0)
 		return KSFT_FAIL;
 	/* Try to catch a excluded tag by a number of tries. */
diff --git a/tools/testing/selftests/arm64/mte/check_user_mem.c b/tools/testing/selftests/arm64/mte/check_user_mem.c
index d1d14aaaba16..fb7936c4e097 100644
--- a/tools/testing/selftests/arm64/mte/check_user_mem.c
+++ b/tools/testing/selftests/arm64/mte/check_user_mem.c
@@ -44,7 +44,7 @@ static int check_usermem_access_fault(int mem_type, int mode, int mapping,
 
 	err = KSFT_PASS;
 	len = 2 * page_sz;
-	mte_switch_mode(mode, MTE_ALLOW_NON_ZERO_TAG);
+	mte_switch_mode(mode, MTE_ALLOW_NON_ZERO_TAG, false);
 	fd = create_temp_file();
 	if (fd == -1)
 		return KSFT_FAIL;
diff --git a/tools/testing/selftests/arm64/mte/mte_common_util.c b/tools/testing/selftests/arm64/mte/mte_common_util.c
index 47e5f940b804..d0da7ee82696 100644
--- a/tools/testing/selftests/arm64/mte/mte_common_util.c
+++ b/tools/testing/selftests/arm64/mte/mte_common_util.c
@@ -28,8 +28,10 @@
 
 struct mte_fault_cxt cur_mte_cxt;
 bool mtefar_support;
+bool mtestonly_support;
 static unsigned int mte_cur_mode;
 static unsigned int mte_cur_pstate_tco;
+static bool mte_cur_stonly;
 
 void mte_default_handler(int signum, siginfo_t *si, void *uc)
 {
@@ -316,7 +318,7 @@ void mte_initialize_current_context(int mode, uintptr_t ptr, ssize_t range)
 		cur_mte_cxt.trig_si_code = 0;
 }
 
-int mte_switch_mode(int mte_option, unsigned long incl_mask)
+int mte_switch_mode(int mte_option, unsigned long incl_mask, bool stonly)
 {
 	unsigned long en = 0;
 
@@ -348,6 +350,9 @@ int mte_switch_mode(int mte_option, unsigned long incl_mask)
 		break;
 	}
 
+	if (mtestonly_support && stonly)
+		en |= PR_MTE_STORE_ONLY;
+
 	en |= (incl_mask << PR_MTE_TAG_SHIFT);
 	/* Enable address tagging ABI, mte error reporting mode and tag inclusion mask. */
 	if (prctl(PR_SET_TAGGED_ADDR_CTRL, en, 0, 0, 0) != 0) {
@@ -370,6 +375,9 @@ int mte_default_setup(void)
 	if (hwcaps3 & HWCAP3_MTE_FAR)
 		mtefar_support = true;
 
+	if (hwcaps3 & HWCAP3_MTE_STORE_ONLY)
+		mtestonly_support = true;
+
 	/* Get current mte mode */
 	ret = prctl(PR_GET_TAGGED_ADDR_CTRL, en, 0, 0, 0);
 	if (ret < 0) {
@@ -383,6 +391,8 @@ int mte_default_setup(void)
 	else if (ret & PR_MTE_TCF_NONE)
 		mte_cur_mode = MTE_NONE_ERR;
 
+	mte_cur_stonly = (ret & PR_MTE_STORE_ONLY) ? true : false;
+
 	mte_cur_pstate_tco = mte_get_pstate_tco();
 	/* Disable PSTATE.TCO */
 	mte_disable_pstate_tco();
@@ -391,7 +401,7 @@ int mte_default_setup(void)
 
 void mte_restore_setup(void)
 {
-	mte_switch_mode(mte_cur_mode, MTE_ALLOW_NON_ZERO_TAG);
+	mte_switch_mode(mte_cur_mode, MTE_ALLOW_NON_ZERO_TAG, mte_cur_stonly);
 	if (mte_cur_pstate_tco == MT_PSTATE_TCO_EN)
 		mte_enable_pstate_tco();
 	else if (mte_cur_pstate_tco == MT_PSTATE_TCO_DIS)
diff --git a/tools/testing/selftests/arm64/mte/mte_common_util.h b/tools/testing/selftests/arm64/mte/mte_common_util.h
index 7dbb5e1046ae..567d299b393c 100644
--- a/tools/testing/selftests/arm64/mte/mte_common_util.h
+++ b/tools/testing/selftests/arm64/mte/mte_common_util.h
@@ -40,6 +40,7 @@ struct mte_fault_cxt {
 
 extern struct mte_fault_cxt cur_mte_cxt;
 extern bool mtefar_support;
+extern bool mtestonly_support;
 
 /* MTE utility functions */
 void mte_default_handler(int signum, siginfo_t *si, void *uc);
@@ -62,7 +63,7 @@ void *mte_insert_atag(void *ptr);
 void *mte_clear_atag(void *ptr);
 int mte_default_setup(void);
 void mte_restore_setup(void);
-int mte_switch_mode(int mte_option, unsigned long incl_mask);
+int mte_switch_mode(int mte_option, unsigned long incl_mask, bool stonly);
 void mte_initialize_current_context(int mode, uintptr_t ptr, ssize_t range);
 
 /* Common utility functions */
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}

