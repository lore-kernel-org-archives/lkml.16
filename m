Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73CCA28BA80
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 15:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746632850; cv=none; b=prdrqFNkJ6+aoUmGpstdjjs8CsWQ30ly3gamqGVe0CVGACRg72bD3fYxGhu0bFk8XZkrkhYYrs3gedkjxjSmC5tyyEmVA7xQb5tmUizNVFOdGSUuE14EJzN8n1sim8A9d9B8AElEDlDyHa+iC12lTjXDfvwaepwwnRUDwT07Lmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746632850; c=relaxed/simple;
	bh=/+1U4shG5AoMx127wEMz8Df1UZJH4I+6oRT2ihxCr0M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZQql0G9em6U6k5S3NS8e9sRh39h5gcgCdqDvH3M8vE5awj56101hBTEprVe5MHLLMyS3rARdTMc4YC9zEr6FhH5CMDGoI9wSUtv/6U8v8rx9CFdTZfl0KWjdGpeiW01G3imL3/TIE26roMmeYQ+T50Hs4shwJqQj5LJoP3KAf4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A723F339;
	Wed,  7 May 2025 08:47:17 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 297773F58B;
	Wed,  7 May 2025 08:47:24 -0700 (PDT)
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
Subject: [PATCH v4 7/7] kselftest/arm64/mte: add MTE_STORE_ONLY testcases
Date: Wed,  7 May 2025 16:46:54 +0100
Message-Id: <20250507154654.1937588-8-yeoreum.yun@arm.com>
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

Adds new test cases using MTE_STORE_ONLY feature.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 .../selftests/arm64/mte/check_mmap_options.c  | 114 ++++++++++++------
 .../testing/selftests/arm64/mte/check_prctl.c |  25 ++--
 2 files changed, 95 insertions(+), 44 deletions(-)

diff --git a/tools/testing/selftests/arm64/mte/check_mmap_options.c b/tools/testing/selftests/arm64/mte/check_mmap_options.c
index d4193377b406..b9db3e05565e 100644
--- a/tools/testing/selftests/arm64/mte/check_mmap_options.c
+++ b/tools/testing/selftests/arm64/mte/check_mmap_options.c
@@ -34,15 +34,19 @@
 #define ATAG_TEST_ON		1
 #define ATAG_TEST_OFF		0
 
+#define TAG_OP_ALL		0
+#define TAG_OP_STONLY		1
+
 static size_t page_size;
 static int sizes[] = {
 	1, 537, 989, 1269, MT_GRANULE_SIZE - 1, MT_GRANULE_SIZE,
 	/* page size - 1*/ 0, /* page_size */ 0, /* page size + 1 */ 0
 };
 
-static int check_mte_memory(char *ptr, int size, int mode, int tag_check, int atag_test)
+static int check_mte_memory(char *ptr, int size, int mode,
+		int tag_check,int atag_test, int tag_op)
 {
-	int err;
+	char buf[MT_GRANULE_SIZE];
 
 	if (!mtefar_support && atag_test == ATAG_TEST_ON)
 		return KSFT_SKIP;
@@ -72,16 +76,34 @@ static int check_mte_memory(char *ptr, int size, int mode, int tag_check, int at
 	if (cur_mte_cxt.fault_valid == true && tag_check == TAG_CHECK_OFF)
 		return KSFT_FAIL;
 
+	if (tag_op == TAG_OP_STONLY) {
+		mte_initialize_current_context(mode, (uintptr_t)ptr, -UNDERFLOW);
+		memcpy(buf, ptr - UNDERFLOW, MT_GRANULE_SIZE);
+		mte_wait_after_trig();
+		if (cur_mte_cxt.fault_valid == true)
+			return KSFT_FAIL;
+
+		mte_initialize_current_context(mode, (uintptr_t)ptr, size + OVERFLOW);
+		memcpy(buf, ptr + size, MT_GRANULE_SIZE);
+		mte_wait_after_trig();
+		if (cur_mte_cxt.fault_valid == true)
+			return KSFT_FAIL;
+	}
+
 	return KSFT_PASS;
 }
 
-static int check_anonymous_memory_mapping(int mem_type, int mode, int mapping, int tag_check, int atag_test)
+static int check_anonymous_memory_mapping(int mem_type, int mode, int mapping,
+		int tag_check, int atag_test, int tag_op)
 {
 	char *ptr, *map_ptr;
 	int run, result, map_size;
 	int item = ARRAY_SIZE(sizes);
 
-	mte_switch_mode(mode, MTE_ALLOW_NON_ZERO_TAG, false);
+	if (tag_op == TAG_OP_STONLY && !mtestonly_support)
+		return KSFT_SKIP;
+
+	mte_switch_mode(mode, MTE_ALLOW_NON_ZERO_TAG, tag_op);
 	for (run = 0; run < item; run++) {
 		map_size = sizes[run] + OVERFLOW + UNDERFLOW;
 		map_ptr = (char *)mte_allocate_memory(map_size, mem_type, mapping, false);
@@ -97,7 +119,7 @@ static int check_anonymous_memory_mapping(int mem_type, int mode, int mapping, i
 			munmap((void *)map_ptr, map_size);
 			return KSFT_FAIL;
 		}
-		result = check_mte_memory(ptr, sizes[run], mode, tag_check, atag_test);
+		result = check_mte_memory(ptr, sizes[run], mode, tag_check, atag_test, tag_op);
 		mte_clear_tags((void *)ptr, sizes[run]);
 		mte_free_memory((void *)map_ptr, map_size, mem_type, false);
 		if (result != KSFT_SKIP)
@@ -106,14 +128,18 @@ static int check_anonymous_memory_mapping(int mem_type, int mode, int mapping, i
 	return KSFT_PASS;
 }
 
-static int check_file_memory_mapping(int mem_type, int mode, int mapping, int tag_check, int atag_test)
+static int check_file_memory_mapping(int mem_type, int mode, int mapping,
+		int tag_check, int atag_test, int tag_op)
 {
 	char *ptr, *map_ptr;
 	int run, fd, map_size;
 	int total = ARRAY_SIZE(sizes);
 	int result = KSFT_PASS;
 
-	mte_switch_mode(mode, MTE_ALLOW_NON_ZERO_TAG, false);
+	if (tag_op == TAG_OP_STONLY && !mtestonly_support)
+		return KSFT_SKIP;
+
+	mte_switch_mode(mode, MTE_ALLOW_NON_ZERO_TAG, tag_op);
 	for (run = 0; run < total; run++) {
 		fd = create_temp_file();
 		if (fd == -1)
@@ -135,7 +161,7 @@ static int check_file_memory_mapping(int mem_type, int mode, int mapping, int ta
 			close(fd);
 			return KSFT_FAIL;
 		}
-		result = check_mte_memory(ptr, sizes[run], mode, tag_check, atag_test);
+		result = check_mte_memory(ptr, sizes[run], mode, tag_check, atag_test, tag_op);
 		mte_clear_tags((void *)ptr, sizes[run]);
 		munmap((void *)map_ptr, map_size);
 		close(fd);
@@ -168,7 +194,7 @@ static int check_clear_prot_mte_flag(int mem_type, int mode, int mapping, int at
 			ksft_print_msg("FAIL: mprotect not ignoring clear PROT_MTE property\n");
 			return KSFT_FAIL;
 		}
-		result = check_mte_memory(ptr, sizes[run], mode, TAG_CHECK_ON, atag_test);
+		result = check_mte_memory(ptr, sizes[run], mode, TAG_CHECK_ON, atag_test, TAG_OP_ALL);
 		mte_free_memory_tag_range((void *)ptr, sizes[run], mem_type, UNDERFLOW, OVERFLOW);
 		if (result != KSFT_PASS)
 			return result;
@@ -192,7 +218,7 @@ static int check_clear_prot_mte_flag(int mem_type, int mode, int mapping, int at
 			close(fd);
 			return KSFT_FAIL;
 		}
-		result = check_mte_memory(ptr, sizes[run], mode, TAG_CHECK_ON, atag_test);
+		result = check_mte_memory(ptr, sizes[run], mode, TAG_CHECK_ON, atag_test, TAG_OP_ALL);
 		mte_free_memory_tag_range((void *)ptr, sizes[run], mem_type, UNDERFLOW, OVERFLOW);
 		close(fd);
 		if (result != KSFT_PASS)
@@ -202,7 +228,7 @@ static int check_clear_prot_mte_flag(int mem_type, int mode, int mapping, int at
 }
 
 const char *format_test_name(int check_type, int mem_type, int sync,
-		       int mapping, int tag_check, int atag_test)
+		       int mapping, int tag_check, int atag_test, int tag_op)
 {
 	static char test_name[TEST_NAME_MAX];
 	const char* check_type_str;
@@ -211,6 +237,7 @@ const char *format_test_name(int check_type, int mem_type, int sync,
 	const char* mapping_str;
 	const char* tag_check_str;
 	const char *atag_test_str;
+	const char *tag_op_str;
 
 	switch (check_type) {
 	case CHECK_ANON_MEM:
@@ -290,10 +317,22 @@ const char *format_test_name(int check_type, int mem_type, int sync,
 		break;
 	}
 
+	switch (tag_op) {
+	case TAG_OP_ALL:
+		tag_op_str = "";
+		break;
+	case TAG_OP_STONLY:
+		tag_op_str = " / store-only";
+		break;
+	default:
+		assert(0);
+		break;
+	}
+
 	snprintf(test_name, TEST_NAME_MAX,
-	         "Check %s with %s mapping, %s mode, %s memory and %s (%s)\n",
+	         "Check %s with %s mapping, %s mode, %s memory and %s (%s%s)\n",
 	         check_type_str, mapping_str, sync_str, mem_type_str,
-	         tag_check_str, atag_test_str);
+	         tag_check_str, atag_test_str, tag_op_str);
 
 	return test_name;
 }
@@ -307,7 +346,8 @@ int main(int argc, char *argv[])
 	int mte_sync[] = { MTE_SYNC_ERR, MTE_ASYNC_ERR };
 	int mapping[] = { MAP_PRIVATE, MAP_SHARED };
 	int atag_test[] = { ATAG_TEST_OFF, ATAG_TEST_ON };
-	int c, mt, s, m, a;
+	int tag_ops[] = { TAG_OP_ALL, TAG_OP_STONLY };
+	int c, mt, s, m, a, o;
 
 	err = mte_default_setup();
 	if (err)
@@ -322,7 +362,7 @@ int main(int argc, char *argv[])
 	sizes[item - 1] = page_size + 1;
 
 	/* Set test plan */
-	ksft_set_plan(44);
+	ksft_set_plan(76);
 
 	for (a = 0; a < ARRAY_SIZE(atag_test); a++) {
 		/* Register signal handlers */
@@ -331,38 +371,40 @@ int main(int argc, char *argv[])
 
 		mte_enable_pstate_tco();
 
-		evaluate_test(check_anonymous_memory_mapping(USE_MMAP, MTE_SYNC_ERR, MAP_PRIVATE, TAG_CHECK_OFF, atag_test[a]),
-			      format_test_name(CHECK_ANON_MEM, USE_MMAP, MTE_SYNC_ERR, MAP_PRIVATE, TAG_CHECK_OFF, atag_test[a]));
+		evaluate_test(check_anonymous_memory_mapping(USE_MMAP, MTE_SYNC_ERR, MAP_PRIVATE, TAG_CHECK_OFF, atag_test[a], TAG_OP_ALL),
+			      format_test_name(CHECK_ANON_MEM, USE_MMAP, MTE_SYNC_ERR, MAP_PRIVATE, TAG_CHECK_OFF, atag_test[a], TAG_OP_ALL));
 
-		evaluate_test(check_file_memory_mapping(USE_MPROTECT, MTE_SYNC_ERR, MAP_PRIVATE, TAG_CHECK_OFF, atag_test[a]),
-			      format_test_name(CHECK_FILE_MEM, USE_MPROTECT, MTE_SYNC_ERR, MAP_PRIVATE, TAG_CHECK_OFF, atag_test[a]));
+		evaluate_test(check_file_memory_mapping(USE_MPROTECT, MTE_SYNC_ERR, MAP_PRIVATE, TAG_CHECK_OFF, atag_test[a], TAG_OP_ALL),
+			      format_test_name(CHECK_FILE_MEM, USE_MPROTECT, MTE_SYNC_ERR, MAP_PRIVATE, TAG_CHECK_OFF, atag_test[a], TAG_OP_ALL));
 
 		mte_disable_pstate_tco();
 
-		evaluate_test(check_anonymous_memory_mapping(USE_MMAP, MTE_NONE_ERR, MAP_PRIVATE, TAG_CHECK_OFF, atag_test[a]),
-			      format_test_name(CHECK_ANON_MEM, USE_MMAP, MTE_NONE_ERR, MAP_PRIVATE, TAG_CHECK_OFF, atag_test[a]));
-		evaluate_test(check_file_memory_mapping(USE_MPROTECT, MTE_NONE_ERR, MAP_PRIVATE, TAG_CHECK_OFF, atag_test[a]),
-			      format_test_name(CHECK_FILE_MEM, USE_MPROTECT, MTE_NONE_ERR, MAP_PRIVATE, TAG_CHECK_OFF, atag_test[a]));
-
-		for (c = 0 ; c < ARRAY_SIZE(check_type); c++) {
-			for (s = 0; s < ARRAY_SIZE(mte_sync); s++) {
-				for (m = 0; m < ARRAY_SIZE(mapping); m++) {
-					for (mt = 0; mt < ARRAY_SIZE(mem_type); mt++) {
-						if (check_type[c] == CHECK_ANON_MEM)
-							evaluate_test(check_anonymous_memory_mapping(mem_type[mt], mte_sync[s], mapping[m], TAG_CHECK_ON, atag_test[a]),
-								format_test_name(CHECK_ANON_MEM, mem_type[mt], mte_sync[s], mapping[m], TAG_CHECK_ON, atag_test[a]));
-						else
-							evaluate_test(check_file_memory_mapping(mem_type[mt], mte_sync[s], mapping[m], TAG_CHECK_ON, atag_test[a]),
-								format_test_name(CHECK_FILE_MEM, mem_type[mt], mte_sync[s], mapping[m], TAG_CHECK_ON, atag_test[a]));
+		evaluate_test(check_anonymous_memory_mapping(USE_MMAP, MTE_NONE_ERR, MAP_PRIVATE, TAG_CHECK_OFF, atag_test[a], TAG_OP_ALL),
+			      format_test_name(CHECK_ANON_MEM, USE_MMAP, MTE_NONE_ERR, MAP_PRIVATE, TAG_CHECK_OFF, atag_test[a], TAG_OP_ALL));
+		evaluate_test(check_file_memory_mapping(USE_MPROTECT, MTE_NONE_ERR, MAP_PRIVATE, TAG_CHECK_OFF, atag_test[a], TAG_OP_ALL),
+			      format_test_name(CHECK_FILE_MEM, USE_MPROTECT, MTE_NONE_ERR, MAP_PRIVATE, TAG_CHECK_OFF, atag_test[a], TAG_OP_ALL));
+
+		for (o = 0; o < ARRAY_SIZE(tag_ops); o++) {
+			for (c = 0 ; c < ARRAY_SIZE(check_type); c++) {
+				for (s = 0; s < ARRAY_SIZE(mte_sync); s++) {
+					for (m = 0; m < ARRAY_SIZE(mapping); m++) {
+						for (mt = 0; mt < ARRAY_SIZE(mem_type); mt++) {
+							if (check_type[c] == CHECK_ANON_MEM)
+								evaluate_test(check_anonymous_memory_mapping(mem_type[mt], mte_sync[s], mapping[m], TAG_CHECK_ON, atag_test[a], tag_ops[o]),
+									format_test_name(CHECK_ANON_MEM, mem_type[mt], mte_sync[s], mapping[m], TAG_CHECK_ON, atag_test[a], tag_ops[o]));
+							else
+								evaluate_test(check_file_memory_mapping(mem_type[mt], mte_sync[s], mapping[m], TAG_CHECK_ON, atag_test[a], tag_ops[o]),
+									format_test_name(CHECK_FILE_MEM, mem_type[mt], mte_sync[s], mapping[m], TAG_CHECK_ON, atag_test[a], tag_ops[o]));
+						}
 					}
 				}
 			}
 		}
 
 		evaluate_test(check_clear_prot_mte_flag(USE_MMAP, MTE_SYNC_ERR, MAP_PRIVATE, atag_test[a]),
-			      format_test_name(CHECK_CLEAR_PROT_MTE, USE_MMAP, MTE_SYNC_ERR, MAP_PRIVATE, TAG_CHECK_ON, atag_test[a]));
+			      format_test_name(CHECK_CLEAR_PROT_MTE, USE_MMAP, MTE_SYNC_ERR, MAP_PRIVATE, TAG_CHECK_ON, atag_test[a], TAG_OP_ALL));
 		evaluate_test(check_clear_prot_mte_flag(USE_MPROTECT, MTE_SYNC_ERR, MAP_PRIVATE, atag_test[a]),
-			      format_test_name(CHECK_CLEAR_PROT_MTE, USE_MPROTECT, MTE_SYNC_ERR, MAP_PRIVATE, TAG_CHECK_ON, atag_test[a]));
+			      format_test_name(CHECK_CLEAR_PROT_MTE, USE_MPROTECT, MTE_SYNC_ERR, MAP_PRIVATE, TAG_CHECK_ON, atag_test[a], TAG_OP_ALL));
 	}
 
 	mte_restore_setup();
diff --git a/tools/testing/selftests/arm64/mte/check_prctl.c b/tools/testing/selftests/arm64/mte/check_prctl.c
index 4c89e9538ca0..83fa20cc6072 100644
--- a/tools/testing/selftests/arm64/mte/check_prctl.c
+++ b/tools/testing/selftests/arm64/mte/check_prctl.c
@@ -60,7 +60,7 @@ void check_basic_read(void)
 /*
  * Attempt to set a specified combination of modes.
  */
-void set_mode_test(const char *name, int hwcap2, int mask)
+void set_mode_test(const char *name, int hwcap2, int hwcap3, int mask)
 {
 	int ret;
 
@@ -69,6 +69,11 @@ void set_mode_test(const char *name, int hwcap2, int mask)
 		return;
 	}
 
+	if ((getauxval(AT_HWCAP3) & hwcap3) != hwcap3) {
+		ksft_test_result_skip("%s\n", name);
+		return;
+	}
+
 	ret = set_tagged_addr_ctrl(mask);
 	if (ret < 0) {
 		ksft_test_result_fail("%s\n", name);
@@ -81,7 +86,7 @@ void set_mode_test(const char *name, int hwcap2, int mask)
 		return;
 	}
 
-	if ((ret & PR_MTE_TCF_MASK) == mask) {
+	if ((ret & (PR_MTE_TCF_MASK | PR_MTE_STORE_ONLY)) == mask) {
 		ksft_test_result_pass("%s\n", name);
 	} else {
 		ksft_print_msg("Got %x, expected %x\n",
@@ -93,12 +98,16 @@ void set_mode_test(const char *name, int hwcap2, int mask)
 struct mte_mode {
 	int mask;
 	int hwcap2;
+	int hwcap3;
 	const char *name;
 } mte_modes[] = {
-	{ PR_MTE_TCF_NONE,  0,          "NONE"  },
-	{ PR_MTE_TCF_SYNC,  HWCAP2_MTE, "SYNC"  },
-	{ PR_MTE_TCF_ASYNC, HWCAP2_MTE, "ASYNC" },
-	{ PR_MTE_TCF_SYNC | PR_MTE_TCF_ASYNC,  HWCAP2_MTE, "SYNC+ASYNC"  },
+	{ PR_MTE_TCF_NONE,                                        0,          0,                     "NONE"  },
+	{ PR_MTE_TCF_SYNC,                                        HWCAP2_MTE, 0,                     "SYNC"  },
+	{ PR_MTE_TCF_ASYNC,                                       HWCAP2_MTE, 0,                     "ASYNC" },
+	{ PR_MTE_TCF_SYNC | PR_MTE_TCF_ASYNC,                     HWCAP2_MTE, 0,                     "SYNC+ASYNC"  },
+	{ PR_MTE_TCF_SYNC | PR_MTE_STORE_ONLY,                    HWCAP2_MTE, HWCAP3_MTE_STORE_ONLY, "SYNC+STONLY" },
+	{ PR_MTE_TCF_ASYNC | PR_MTE_STORE_ONLY,                   HWCAP2_MTE, HWCAP3_MTE_STORE_ONLY, "ASYNC+STONLY" },
+	{ PR_MTE_TCF_SYNC | PR_MTE_TCF_ASYNC | PR_MTE_STORE_ONLY, HWCAP2_MTE, HWCAP3_MTE_STORE_ONLY, "SYNC+ASYNC+STONLY" },
 };
 
 int main(void)
@@ -106,11 +115,11 @@ int main(void)
 	int i;
 
 	ksft_print_header();
-	ksft_set_plan(5);
+	ksft_set_plan(8);
 
 	check_basic_read();
 	for (i = 0; i < ARRAY_SIZE(mte_modes); i++)
-		set_mode_test(mte_modes[i].name, mte_modes[i].hwcap2,
+		set_mode_test(mte_modes[i].name, mte_modes[i].hwcap2, mte_modes[i].hwcap3,
 			      mte_modes[i].mask);
 
 	ksft_print_cnts();
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}

