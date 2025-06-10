Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99DE023C502;
	Tue, 10 Jun 2025 15:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749567727; cv=none; b=NiUgm7jn7Vj51KdDKUzTP5kMrPuWAl/utT1XHi3o8xA60Zrga0XB4YwvrJ+kT5nvNB3aFjCjwvovtRLmehzMiMBPPPKvcVWgtMSgrWWYjvxPrHZdRjxHNBq8PnyuOxfNQDFoTBeK8ElYUUR3I5WGU2d1whX3abT4/EfPNg7JExw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749567727; c=relaxed/simple;
	bh=CdsGf/7xKMmbGVYHunkGolE7VzdDVLZSB9UsioP4co0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=A3wUWD2naD/ZwuZACiJiXwQvb2AnzYtfuU7nDFrCWlgt9itVkRhJOnGO6yYXwd0fv67FlkeS9FdTAiSIy3t+Jc/w49Qz1JIF6wkg4WjT+y8EB2G4POgcoYuYo4aDsQcl41N70ba2qQ18gjJYWQHEoPe967K1H1fSP8Fn9ZaO0iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E13CD1713;
	Tue, 10 Jun 2025 08:01:45 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C582A3F59E;
	Tue, 10 Jun 2025 08:02:02 -0700 (PDT)
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
	shmeerali.kolothum.thodi@huawei.com,
	akpm@linux-foundation.org,
	surenb@google.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v5 6/6] kselftest/arm64/mte: add mtefar test on check_mmap_option
Date: Tue, 10 Jun 2025 16:01:44 +0100
Message-Id: <20250610150144.2523945-7-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250610150144.2523945-1-yeoreum.yun@arm.com>
References: <20250610150144.2523945-1-yeoreum.yun@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If FEAT_MTE_TAGGED_FAR (Armv8.9) is supported, bits 63:60 of the fault address
are preserved in response to synchronous tag check faults (SEGV_MTESERR).

This patch adds new test cases using address tags (bits 63:60),
corresponding to each existing test in check_mmap_option.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 .../selftests/arm64/mte/check_mmap_options.c  | 132 +++++++++++-------
 1 file changed, 80 insertions(+), 52 deletions(-)

diff --git a/tools/testing/selftests/arm64/mte/check_mmap_options.c b/tools/testing/selftests/arm64/mte/check_mmap_options.c
index a784b3a31d4f..4f26617c8e69 100644
--- a/tools/testing/selftests/arm64/mte/check_mmap_options.c
+++ b/tools/testing/selftests/arm64/mte/check_mmap_options.c
@@ -31,14 +31,25 @@
 #define CHECK_FILE_MEM		1
 #define CHECK_CLEAR_PROT_MTE	2
 
+#define ATAG_TEST_ON		1
+#define ATAG_TEST_OFF		0
+
 static size_t page_size;
 static int sizes[] = {
 	1, 537, 989, 1269, MT_GRANULE_SIZE - 1, MT_GRANULE_SIZE,
 	/* page size - 1*/ 0, /* page_size */ 0, /* page size + 1 */ 0
 };
 
-static int check_mte_memory(char *ptr, int size, int mode, int tag_check)
+static int check_mte_memory(char *ptr, int size, int mode, int tag_check, int atag_test)
 {
+	int err;
+
+	if (!mtefar_support && atag_test == ATAG_TEST_ON)
+		return KSFT_SKIP;
+
+	if (atag_test == ATAG_TEST_ON)
+		ptr = mte_insert_atag(ptr);
+
 	mte_initialize_current_context(mode, (uintptr_t)ptr, size);
 	memset(ptr, '1', size);
 	mte_wait_after_trig();
@@ -64,7 +75,7 @@ static int check_mte_memory(char *ptr, int size, int mode, int tag_check)
 	return KSFT_PASS;
 }
 
-static int check_anonymous_memory_mapping(int mem_type, int mode, int mapping, int tag_check)
+static int check_anonymous_memory_mapping(int mem_type, int mode, int mapping, int tag_check, int atag_test)
 {
 	char *ptr, *map_ptr;
 	int run, result, map_size;
@@ -86,16 +97,16 @@ static int check_anonymous_memory_mapping(int mem_type, int mode, int mapping, i
 			munmap((void *)map_ptr, map_size);
 			return KSFT_FAIL;
 		}
-		result = check_mte_memory(ptr, sizes[run], mode, tag_check);
+		result = check_mte_memory(ptr, sizes[run], mode, tag_check, atag_test);
 		mte_clear_tags((void *)ptr, sizes[run]);
 		mte_free_memory((void *)map_ptr, map_size, mem_type, false);
-		if (result == KSFT_FAIL)
-			return KSFT_FAIL;
+		if (result != KSFT_SKIP)
+			return result;
 	}
 	return KSFT_PASS;
 }
 
-static int check_file_memory_mapping(int mem_type, int mode, int mapping, int tag_check)
+static int check_file_memory_mapping(int mem_type, int mode, int mapping, int tag_check, int atag_test)
 {
 	char *ptr, *map_ptr;
 	int run, fd, map_size;
@@ -124,7 +135,7 @@ static int check_file_memory_mapping(int mem_type, int mode, int mapping, int ta
 			close(fd);
 			return KSFT_FAIL;
 		}
-		result = check_mte_memory(ptr, sizes[run], mode, tag_check);
+		result = check_mte_memory(ptr, sizes[run], mode, tag_check, atag_test);
 		mte_clear_tags((void *)ptr, sizes[run]);
 		munmap((void *)map_ptr, map_size);
 		close(fd);
@@ -134,7 +145,7 @@ static int check_file_memory_mapping(int mem_type, int mode, int mapping, int ta
 	return result;
 }
 
-static int check_clear_prot_mte_flag(int mem_type, int mode, int mapping)
+static int check_clear_prot_mte_flag(int mem_type, int mode, int mapping, int atag_test)
 {
 	char *ptr, *map_ptr;
 	int run, prot_flag, result, fd, map_size;
@@ -157,10 +168,10 @@ static int check_clear_prot_mte_flag(int mem_type, int mode, int mapping)
 			ksft_print_msg("FAIL: mprotect not ignoring clear PROT_MTE property\n");
 			return KSFT_FAIL;
 		}
-		result = check_mte_memory(ptr, sizes[run], mode, TAG_CHECK_ON);
+		result = check_mte_memory(ptr, sizes[run], mode, TAG_CHECK_ON, atag_test);
 		mte_free_memory_tag_range((void *)ptr, sizes[run], mem_type, UNDERFLOW, OVERFLOW);
 		if (result != KSFT_PASS)
-			return KSFT_FAIL;
+			return result;
 
 		fd = create_temp_file();
 		if (fd == -1)
@@ -181,17 +192,17 @@ static int check_clear_prot_mte_flag(int mem_type, int mode, int mapping)
 			close(fd);
 			return KSFT_FAIL;
 		}
-		result = check_mte_memory(ptr, sizes[run], mode, TAG_CHECK_ON);
+		result = check_mte_memory(ptr, sizes[run], mode, TAG_CHECK_ON, atag_test);
 		mte_free_memory_tag_range((void *)ptr, sizes[run], mem_type, UNDERFLOW, OVERFLOW);
 		close(fd);
 		if (result != KSFT_PASS)
-			return KSFT_FAIL;
+			return result;
 	}
 	return KSFT_PASS;
 }
 
 const char *format_test_name(int check_type, int mem_type, int sync,
-		       int mapping, int tag_check)
+		       int mapping, int tag_check, int atag_test)
 {
 	static char test_name[TEST_NAME_MAX];
 	const char* check_type_str;
@@ -199,6 +210,7 @@ const char *format_test_name(int check_type, int mem_type, int sync,
 	const char* sync_str;
 	const char* mapping_str;
 	const char* tag_check_str;
+	const char *atag_test_str;
 
 	switch (check_type) {
 	case CHECK_ANON_MEM:
@@ -266,9 +278,22 @@ const char *format_test_name(int check_type, int mem_type, int sync,
 		break;
 	}
 
+	switch (atag_test) {
+	case ATAG_TEST_ON:
+		atag_test_str = "with address tag [63:60]";
+		break;
+	case ATAG_TEST_OFF:
+		atag_test_str = "without address tag [63:60]";
+		break;
+	default:
+		assert(0);
+		break;
+	}
+
 	snprintf(test_name, TEST_NAME_MAX,
-	         "Check %s with %s mapping, %s mode, %s memory and %s\n",
-	         check_type_str, mapping_str, sync_str, mem_type_str, tag_check_str);
+	         "Check %s with %s mapping, %s mode, %s memory and %s (%s)\n",
+	         check_type_str, mapping_str, sync_str, mem_type_str,
+	         tag_check_str, atag_test_str);
 
 	return test_name;
 }
@@ -281,7 +306,8 @@ int main(int argc, char *argv[])
 	int mem_type[] = { USE_MMAP, USE_MPROTECT };
 	int mte_sync[] = { MTE_SYNC_ERR, MTE_ASYNC_ERR };
 	int mapping[] = { MAP_PRIVATE, MAP_SHARED };
-	int c, mt, s, m;
+	int atag_test[] = { ATAG_TEST_OFF, ATAG_TEST_ON };
+	int c, mt, s, m, a;
 
 	err = mte_default_setup();
 	if (err)
@@ -295,47 +321,49 @@ int main(int argc, char *argv[])
 	sizes[item - 2] = page_size;
 	sizes[item - 1] = page_size + 1;
 
-	/* Register signal handlers */
-	mte_register_signal(SIGBUS, mte_default_handler, false);
-	mte_register_signal(SIGSEGV, mte_default_handler, false);
-
 	/* Set test plan */
-	ksft_set_plan(22);
-
-	mte_enable_pstate_tco();
-
-	evaluate_test(check_anonymous_memory_mapping(USE_MMAP, MTE_SYNC_ERR, MAP_PRIVATE, TAG_CHECK_OFF),
-		      format_test_name(CHECK_ANON_MEM, USE_MMAP, MTE_SYNC_ERR, MAP_PRIVATE, TAG_CHECK_OFF));
-
-	evaluate_test(check_file_memory_mapping(USE_MPROTECT, MTE_SYNC_ERR, MAP_PRIVATE, TAG_CHECK_OFF),
-		      format_test_name(CHECK_FILE_MEM, USE_MPROTECT, MTE_SYNC_ERR, MAP_PRIVATE, TAG_CHECK_OFF));
-
-	mte_disable_pstate_tco();
-
-	evaluate_test(check_anonymous_memory_mapping(USE_MMAP, MTE_NONE_ERR, MAP_PRIVATE, TAG_CHECK_OFF),
-		      format_test_name(CHECK_ANON_MEM, USE_MMAP, MTE_NONE_ERR, MAP_PRIVATE, TAG_CHECK_OFF));
-	evaluate_test(check_file_memory_mapping(USE_MPROTECT, MTE_NONE_ERR, MAP_PRIVATE, TAG_CHECK_OFF),
-		      format_test_name(CHECK_FILE_MEM, USE_MPROTECT, MTE_NONE_ERR, MAP_PRIVATE, TAG_CHECK_OFF));
-
-	for (c = 0 ; c < ARRAY_SIZE(check_type); c++) {
-		for (s = 0; s < ARRAY_SIZE(mte_sync); s++) {
-			for (m = 0; m < ARRAY_SIZE(mapping); m++) {
-				for (mt = 0; mt < ARRAY_SIZE(mem_type); mt++) {
-					if (check_type[c] == CHECK_ANON_MEM)
-						evaluate_test(check_anonymous_memory_mapping(mem_type[mt], mte_sync[s], mapping[m], TAG_CHECK_ON),
-							format_test_name(CHECK_ANON_MEM, mem_type[mt], mte_sync[s], mapping[m], TAG_CHECK_ON));
-					else
-						evaluate_test(check_file_memory_mapping(mem_type[mt], mte_sync[s], mapping[m], TAG_CHECK_ON),
-							format_test_name(CHECK_FILE_MEM, mem_type[mt], mte_sync[s], mapping[m], TAG_CHECK_ON));
+	ksft_set_plan(44);
+
+	for (a = 0; a < ARRAY_SIZE(atag_test); a++) {
+		/* Register signal handlers */
+		mte_register_signal(SIGBUS, mte_default_handler, atag_test[a]);
+		mte_register_signal(SIGSEGV, mte_default_handler, atag_test[a]);
+
+		mte_enable_pstate_tco();
+
+		evaluate_test(check_anonymous_memory_mapping(USE_MMAP, MTE_SYNC_ERR, MAP_PRIVATE, TAG_CHECK_OFF, atag_test[a]),
+			      format_test_name(CHECK_ANON_MEM, USE_MMAP, MTE_SYNC_ERR, MAP_PRIVATE, TAG_CHECK_OFF, atag_test[a]));
+
+		evaluate_test(check_file_memory_mapping(USE_MPROTECT, MTE_SYNC_ERR, MAP_PRIVATE, TAG_CHECK_OFF, atag_test[a]),
+			      format_test_name(CHECK_FILE_MEM, USE_MPROTECT, MTE_SYNC_ERR, MAP_PRIVATE, TAG_CHECK_OFF, atag_test[a]));
+
+		mte_disable_pstate_tco();
+
+		evaluate_test(check_anonymous_memory_mapping(USE_MMAP, MTE_NONE_ERR, MAP_PRIVATE, TAG_CHECK_OFF, atag_test[a]),
+			      format_test_name(CHECK_ANON_MEM, USE_MMAP, MTE_NONE_ERR, MAP_PRIVATE, TAG_CHECK_OFF, atag_test[a]));
+		evaluate_test(check_file_memory_mapping(USE_MPROTECT, MTE_NONE_ERR, MAP_PRIVATE, TAG_CHECK_OFF, atag_test[a]),
+			      format_test_name(CHECK_FILE_MEM, USE_MPROTECT, MTE_NONE_ERR, MAP_PRIVATE, TAG_CHECK_OFF, atag_test[a]));
+
+		for (c = 0 ; c < ARRAY_SIZE(check_type); c++) {
+			for (s = 0; s < ARRAY_SIZE(mte_sync); s++) {
+				for (m = 0; m < ARRAY_SIZE(mapping); m++) {
+					for (mt = 0; mt < ARRAY_SIZE(mem_type); mt++) {
+						if (check_type[c] == CHECK_ANON_MEM)
+							evaluate_test(check_anonymous_memory_mapping(mem_type[mt], mte_sync[s], mapping[m], TAG_CHECK_ON, atag_test[a]),
+								format_test_name(CHECK_ANON_MEM, mem_type[mt], mte_sync[s], mapping[m], TAG_CHECK_ON, atag_test[a]));
+						else
+							evaluate_test(check_file_memory_mapping(mem_type[mt], mte_sync[s], mapping[m], TAG_CHECK_ON, atag_test[a]),
+								format_test_name(CHECK_FILE_MEM, mem_type[mt], mte_sync[s], mapping[m], TAG_CHECK_ON, atag_test[a]));
+					}
 				}
 			}
 		}
-	}
 
-	evaluate_test(check_clear_prot_mte_flag(USE_MMAP, MTE_SYNC_ERR, MAP_PRIVATE),
-		      format_test_name(CHECK_CLEAR_PROT_MTE, USE_MMAP, MTE_SYNC_ERR, MAP_PRIVATE, TAG_CHECK_ON));
-	evaluate_test(check_clear_prot_mte_flag(USE_MPROTECT, MTE_SYNC_ERR, MAP_PRIVATE),
-		      format_test_name(CHECK_CLEAR_PROT_MTE, USE_MPROTECT, MTE_SYNC_ERR, MAP_PRIVATE, TAG_CHECK_ON));
+		evaluate_test(check_clear_prot_mte_flag(USE_MMAP, MTE_SYNC_ERR, MAP_PRIVATE, atag_test[a]),
+			      format_test_name(CHECK_CLEAR_PROT_MTE, USE_MMAP, MTE_SYNC_ERR, MAP_PRIVATE, TAG_CHECK_ON, atag_test[a]));
+		evaluate_test(check_clear_prot_mte_flag(USE_MPROTECT, MTE_SYNC_ERR, MAP_PRIVATE, atag_test[a]),
+			      format_test_name(CHECK_CLEAR_PROT_MTE, USE_MPROTECT, MTE_SYNC_ERR, MAP_PRIVATE, TAG_CHECK_ON, atag_test[a]));
+	}
 
 	mte_restore_setup();
 	ksft_print_cnts();
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}

