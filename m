Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E42127FD4E;
	Wed, 18 Jun 2025 08:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750236344; cv=none; b=LPldoXDTEWgDWANXisPSKL66jMyivgOluhNguVpRHkAPc8ZTOKo8FDWMCA7Ur9Gp3iTE7pmBt+3GhmejuFmqCf8/OujnL6VhcLidhJ0V3SMy1ekzCRASoS7I+qURqi8uA9AEsdlwi7sR0Q6ikhrA+zCWC8COcAhgbYaFjTSpOUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750236344; c=relaxed/simple;
	bh=3yYopPMzbPPAcQb5u88F/DY3HGR4llaLo3SO0HxtaZs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qjXsDL5SC3lbHF4Mv5vp7plzqkPkmhnlkPbE3iOC2XEznnsUnZTXUkt/QK7osKa5t9h9MODoqZo1CCaOUFxtX6tigjNN8AoVE+kOf6yWqajIQW/QMq3x5JOjseYEfc4Qg57bKDscQp6g/X5jIszAwhvWZ1vrzYIHusixAUkENfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3E63B14BF;
	Wed, 18 Jun 2025 01:45:20 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9983F3F66E;
	Wed, 18 Jun 2025 01:45:38 -0700 (PDT)
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
Subject: [PATCH v9 09/10] kselftest/arm64/mte: refactor check_mmap_option test
Date: Wed, 18 Jun 2025 09:45:12 +0100
Message-Id: <20250618084513.1761345-10-yeoreum.yun@arm.com>
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

Before add mtefar testcase on check_mmap_option.c,
refactor check_mmap_option:
  - make testcase suite array with test options (mem_type, mte_sync type and etc)
    to use general testcase pattern

  - generate each test case name acoording to test options.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
---
 .../selftests/arm64/mte/check_mmap_options.c  | 367 +++++++++++++++---
 1 file changed, 313 insertions(+), 54 deletions(-)

diff --git a/tools/testing/selftests/arm64/mte/check_mmap_options.c b/tools/testing/selftests/arm64/mte/check_mmap_options.c
index b37bf481c9f9..0df7ce532465 100644
--- a/tools/testing/selftests/arm64/mte/check_mmap_options.c
+++ b/tools/testing/selftests/arm64/mte/check_mmap_options.c
@@ -3,6 +3,7 @@
 
 #define _GNU_SOURCE
 
+#include <assert.h>
 #include <errno.h>
 #include <fcntl.h>
 #include <signal.h>
@@ -24,6 +25,23 @@
 #define TAG_CHECK_ON		0
 #define TAG_CHECK_OFF		1
 
+#define TEST_NAME_MAX		256
+
+enum mte_mem_check_type {
+	CHECK_ANON_MEM = 0,
+	CHECK_FILE_MEM = 1,
+	CHECK_CLEAR_PROT_MTE = 2,
+};
+
+struct check_mmap_testcase {
+	int check_type;
+	int mem_type;
+	int mte_sync;
+	int mapping;
+	int tag_check;
+	bool enable_tco;
+};
+
 static size_t page_size;
 static int sizes[] = {
 	1, 537, 989, 1269, MT_GRANULE_SIZE - 1, MT_GRANULE_SIZE,
@@ -183,10 +201,271 @@ static int check_clear_prot_mte_flag(int mem_type, int mode, int mapping)
 	return KSFT_PASS;
 }
 
+const char *format_test_name(struct check_mmap_testcase *tc)
+{
+	static char test_name[TEST_NAME_MAX];
+	const char *check_type_str;
+	const char *mem_type_str;
+	const char *sync_str;
+	const char *mapping_str;
+	const char *tag_check_str;
+
+	switch (tc->check_type) {
+	case CHECK_ANON_MEM:
+		check_type_str = "anonymous memory";
+		break;
+	case CHECK_FILE_MEM:
+		check_type_str = "file memory";
+		break;
+	case CHECK_CLEAR_PROT_MTE:
+		check_type_str = "clear PROT_MTE flags";
+		break;
+	default:
+		assert(0);
+		break;
+	}
+
+	switch (tc->mem_type) {
+	case USE_MMAP:
+		mem_type_str = "mmap";
+		break;
+	case USE_MPROTECT:
+		mem_type_str = "mmap/mprotect";
+		break;
+	default:
+		assert(0);
+		break;
+	}
+
+	switch (tc->mte_sync) {
+	case MTE_NONE_ERR:
+		sync_str = "no error";
+		break;
+	case MTE_SYNC_ERR:
+		sync_str = "sync error";
+		break;
+	case MTE_ASYNC_ERR:
+		sync_str = "async error";
+		break;
+	default:
+		assert(0);
+		break;
+	}
+
+	switch (tc->mapping) {
+	case MAP_SHARED:
+		mapping_str = "shared";
+		break;
+	case MAP_PRIVATE:
+		mapping_str = "private";
+		break;
+	default:
+		assert(0);
+		break;
+	}
+
+	switch (tc->tag_check) {
+	case TAG_CHECK_ON:
+		tag_check_str = "tag check on";
+		break;
+	case TAG_CHECK_OFF:
+		tag_check_str = "tag check off";
+		break;
+	default:
+		assert(0);
+		break;
+	}
+
+	snprintf(test_name, sizeof(test_name),
+	         "Check %s with %s mapping, %s mode, %s memory and %s\n",
+	         check_type_str, mapping_str, sync_str, mem_type_str,
+	         tag_check_str);
+
+	return test_name;
+}
+
 int main(int argc, char *argv[])
 {
-	int err;
+	int err, i;
 	int item = ARRAY_SIZE(sizes);
+	struct check_mmap_testcase test_cases[]= {
+		{
+			.check_type = CHECK_ANON_MEM,
+			.mem_type = USE_MMAP,
+			.mte_sync = MTE_SYNC_ERR,
+			.mapping = MAP_PRIVATE,
+			.tag_check = TAG_CHECK_OFF,
+			.enable_tco = true,
+		},
+		{
+			.check_type = CHECK_FILE_MEM,
+			.mem_type = USE_MPROTECT,
+			.mte_sync = MTE_SYNC_ERR,
+			.mapping = MAP_PRIVATE,
+			.tag_check = TAG_CHECK_OFF,
+			.enable_tco = true,
+		},
+		{
+			.check_type = CHECK_ANON_MEM,
+			.mem_type = USE_MMAP,
+			.mte_sync = MTE_NONE_ERR,
+			.mapping = MAP_PRIVATE,
+			.tag_check = TAG_CHECK_OFF,
+			.enable_tco = false,
+		},
+		{
+			.check_type = CHECK_FILE_MEM,
+			.mem_type = USE_MPROTECT,
+			.mte_sync = MTE_NONE_ERR,
+			.mapping = MAP_PRIVATE,
+			.tag_check = TAG_CHECK_OFF,
+			.enable_tco = false,
+		},
+		{
+			.check_type = CHECK_ANON_MEM,
+			.mem_type = USE_MMAP,
+			.mte_sync = MTE_SYNC_ERR,
+			.mapping = MAP_PRIVATE,
+			.tag_check = TAG_CHECK_ON,
+			.enable_tco = false,
+		},
+		{
+			.check_type = CHECK_ANON_MEM,
+			.mem_type = USE_MPROTECT,
+			.mte_sync = MTE_SYNC_ERR,
+			.mapping = MAP_PRIVATE,
+			.tag_check = TAG_CHECK_ON,
+			.enable_tco = false,
+		},
+		{
+			.check_type = CHECK_ANON_MEM,
+			.mem_type = USE_MMAP,
+			.mte_sync = MTE_SYNC_ERR,
+			.mapping = MAP_SHARED,
+			.tag_check = TAG_CHECK_ON,
+			.enable_tco = false,
+		},
+		{
+			.check_type = CHECK_ANON_MEM,
+			.mem_type = USE_MPROTECT,
+			.mte_sync = MTE_SYNC_ERR,
+			.mapping = MAP_SHARED,
+			.tag_check = TAG_CHECK_ON,
+			.enable_tco = false,
+		},
+		{
+			.check_type = CHECK_ANON_MEM,
+			.mem_type = USE_MMAP,
+			.mte_sync = MTE_ASYNC_ERR,
+			.mapping = MAP_PRIVATE,
+			.tag_check = TAG_CHECK_ON,
+			.enable_tco = false,
+		},
+		{
+			.check_type = CHECK_ANON_MEM,
+			.mem_type = USE_MPROTECT,
+			.mte_sync = MTE_ASYNC_ERR,
+			.mapping = MAP_PRIVATE,
+			.tag_check = TAG_CHECK_ON,
+			.enable_tco = false,
+		},
+		{
+			.check_type = CHECK_ANON_MEM,
+			.mem_type = USE_MMAP,
+			.mte_sync = MTE_ASYNC_ERR,
+			.mapping = MAP_SHARED,
+			.tag_check = TAG_CHECK_ON,
+			.enable_tco = false,
+		},
+		{
+			.check_type = CHECK_ANON_MEM,
+			.mem_type = USE_MPROTECT,
+			.mte_sync = MTE_ASYNC_ERR,
+			.mapping = MAP_SHARED,
+			.tag_check = TAG_CHECK_ON,
+			.enable_tco = false,
+		},
+		{
+			.check_type = CHECK_FILE_MEM,
+			.mem_type = USE_MMAP,
+			.mte_sync = MTE_SYNC_ERR,
+			.mapping = MAP_PRIVATE,
+			.tag_check = TAG_CHECK_ON,
+			.enable_tco = false,
+		},
+		{
+			.check_type = CHECK_FILE_MEM,
+			.mem_type = USE_MPROTECT,
+			.mte_sync = MTE_SYNC_ERR,
+			.mapping = MAP_PRIVATE,
+			.tag_check = TAG_CHECK_ON,
+			.enable_tco = false,
+		},
+		{
+			.check_type = CHECK_FILE_MEM,
+			.mem_type = USE_MMAP,
+			.mte_sync = MTE_SYNC_ERR,
+			.mapping = MAP_SHARED,
+			.tag_check = TAG_CHECK_ON,
+			.enable_tco = false,
+		},
+		{
+			.check_type = CHECK_FILE_MEM,
+			.mem_type = USE_MPROTECT,
+			.mte_sync = MTE_SYNC_ERR,
+			.mapping = MAP_SHARED,
+			.tag_check = TAG_CHECK_ON,
+			.enable_tco = false,
+		},
+		{
+			.check_type = CHECK_FILE_MEM,
+			.mem_type = USE_MMAP,
+			.mte_sync = MTE_ASYNC_ERR,
+			.mapping = MAP_PRIVATE,
+			.tag_check = TAG_CHECK_ON,
+			.enable_tco = false,
+		},
+		{
+			.check_type = CHECK_FILE_MEM,
+			.mem_type = USE_MPROTECT,
+			.mte_sync = MTE_ASYNC_ERR,
+			.mapping = MAP_PRIVATE,
+			.tag_check = TAG_CHECK_ON,
+			.enable_tco = false,
+		},
+		{
+			.check_type = CHECK_FILE_MEM,
+			.mem_type = USE_MMAP,
+			.mte_sync = MTE_ASYNC_ERR,
+			.mapping = MAP_SHARED,
+			.tag_check = TAG_CHECK_ON,
+			.enable_tco = false,
+		},
+		{
+			.check_type = CHECK_FILE_MEM,
+			.mem_type = USE_MPROTECT,
+			.mte_sync = MTE_ASYNC_ERR,
+			.mapping = MAP_SHARED,
+			.tag_check = TAG_CHECK_ON,
+			.enable_tco = false,
+		},
+		{
+			.check_type = CHECK_CLEAR_PROT_MTE,
+			.mem_type = USE_MMAP,
+			.mte_sync = MTE_SYNC_ERR,
+			.mapping = MAP_PRIVATE,
+			.tag_check = TAG_CHECK_ON,
+			.enable_tco = false,
+		},
+		{
+			.check_type = CHECK_CLEAR_PROT_MTE,
+			.mem_type = USE_MPROTECT,
+			.mte_sync = MTE_SYNC_ERR,
+			.mapping = MAP_PRIVATE,
+			.tag_check = TAG_CHECK_ON,
+			.enable_tco = false,
+		},
+	};
 
 	err = mte_default_setup();
 	if (err)
@@ -205,59 +484,39 @@ int main(int argc, char *argv[])
 	mte_register_signal(SIGSEGV, mte_default_handler, false);
 
 	/* Set test plan */
-	ksft_set_plan(22);
-
-	mte_enable_pstate_tco();
-
-	evaluate_test(check_anonymous_memory_mapping(USE_MMAP, MTE_SYNC_ERR, MAP_PRIVATE, TAG_CHECK_OFF),
-	"Check anonymous memory with private mapping, sync error mode, mmap memory and tag check off\n");
-	evaluate_test(check_file_memory_mapping(USE_MPROTECT, MTE_SYNC_ERR, MAP_PRIVATE, TAG_CHECK_OFF),
-	"Check file memory with private mapping, sync error mode, mmap/mprotect memory and tag check off\n");
-
-	mte_disable_pstate_tco();
-	evaluate_test(check_anonymous_memory_mapping(USE_MMAP, MTE_NONE_ERR, MAP_PRIVATE, TAG_CHECK_OFF),
-	"Check anonymous memory with private mapping, no error mode, mmap memory and tag check off\n");
-	evaluate_test(check_file_memory_mapping(USE_MPROTECT, MTE_NONE_ERR, MAP_PRIVATE, TAG_CHECK_OFF),
-	"Check file memory with private mapping, no error mode, mmap/mprotect memory and tag check off\n");
-
-	evaluate_test(check_anonymous_memory_mapping(USE_MMAP, MTE_SYNC_ERR, MAP_PRIVATE, TAG_CHECK_ON),
-	"Check anonymous memory with private mapping, sync error mode, mmap memory and tag check on\n");
-	evaluate_test(check_anonymous_memory_mapping(USE_MPROTECT, MTE_SYNC_ERR, MAP_PRIVATE, TAG_CHECK_ON),
-	"Check anonymous memory with private mapping, sync error mode, mmap/mprotect memory and tag check on\n");
-	evaluate_test(check_anonymous_memory_mapping(USE_MMAP, MTE_SYNC_ERR, MAP_SHARED, TAG_CHECK_ON),
-	"Check anonymous memory with shared mapping, sync error mode, mmap memory and tag check on\n");
-	evaluate_test(check_anonymous_memory_mapping(USE_MPROTECT, MTE_SYNC_ERR, MAP_SHARED, TAG_CHECK_ON),
-	"Check anonymous memory with shared mapping, sync error mode, mmap/mprotect memory and tag check on\n");
-	evaluate_test(check_anonymous_memory_mapping(USE_MMAP, MTE_ASYNC_ERR, MAP_PRIVATE, TAG_CHECK_ON),
-	"Check anonymous memory with private mapping, async error mode, mmap memory and tag check on\n");
-	evaluate_test(check_anonymous_memory_mapping(USE_MPROTECT, MTE_ASYNC_ERR, MAP_PRIVATE, TAG_CHECK_ON),
-	"Check anonymous memory with private mapping, async error mode, mmap/mprotect memory and tag check on\n");
-	evaluate_test(check_anonymous_memory_mapping(USE_MMAP, MTE_ASYNC_ERR, MAP_SHARED, TAG_CHECK_ON),
-	"Check anonymous memory with shared mapping, async error mode, mmap memory and tag check on\n");
-	evaluate_test(check_anonymous_memory_mapping(USE_MPROTECT, MTE_ASYNC_ERR, MAP_SHARED, TAG_CHECK_ON),
-	"Check anonymous memory with shared mapping, async error mode, mmap/mprotect memory and tag check on\n");
-
-	evaluate_test(check_file_memory_mapping(USE_MMAP, MTE_SYNC_ERR, MAP_PRIVATE, TAG_CHECK_ON),
-	"Check file memory with private mapping, sync error mode, mmap memory and tag check on\n");
-	evaluate_test(check_file_memory_mapping(USE_MPROTECT, MTE_SYNC_ERR, MAP_PRIVATE, TAG_CHECK_ON),
-	"Check file memory with private mapping, sync error mode, mmap/mprotect memory and tag check on\n");
-	evaluate_test(check_file_memory_mapping(USE_MMAP, MTE_SYNC_ERR, MAP_SHARED, TAG_CHECK_ON),
-	"Check file memory with shared mapping, sync error mode, mmap memory and tag check on\n");
-	evaluate_test(check_file_memory_mapping(USE_MPROTECT, MTE_SYNC_ERR, MAP_SHARED, TAG_CHECK_ON),
-	"Check file memory with shared mapping, sync error mode, mmap/mprotect memory and tag check on\n");
-	evaluate_test(check_file_memory_mapping(USE_MMAP, MTE_ASYNC_ERR, MAP_PRIVATE, TAG_CHECK_ON),
-	"Check file memory with private mapping, async error mode, mmap memory and tag check on\n");
-	evaluate_test(check_file_memory_mapping(USE_MPROTECT, MTE_ASYNC_ERR, MAP_PRIVATE, TAG_CHECK_ON),
-	"Check file memory with private mapping, async error mode, mmap/mprotect memory and tag check on\n");
-	evaluate_test(check_file_memory_mapping(USE_MMAP, MTE_ASYNC_ERR, MAP_SHARED, TAG_CHECK_ON),
-	"Check file memory with shared mapping, async error mode, mmap memory and tag check on\n");
-	evaluate_test(check_file_memory_mapping(USE_MPROTECT, MTE_ASYNC_ERR, MAP_SHARED, TAG_CHECK_ON),
-	"Check file memory with shared mapping, async error mode, mmap/mprotect memory and tag check on\n");
-
-	evaluate_test(check_clear_prot_mte_flag(USE_MMAP, MTE_SYNC_ERR, MAP_PRIVATE),
-	"Check clear PROT_MTE flags with private mapping, sync error mode and mmap memory\n");
-	evaluate_test(check_clear_prot_mte_flag(USE_MPROTECT, MTE_SYNC_ERR, MAP_PRIVATE),
-	"Check clear PROT_MTE flags with private mapping and sync error mode and mmap/mprotect memory\n");
+	ksft_set_plan(ARRAY_SIZE(test_cases));
+
+	for (i = 0 ; i < ARRAY_SIZE(test_cases); i++) {
+		if (test_cases[i].enable_tco)
+			mte_enable_pstate_tco();
+		else
+			mte_disable_pstate_tco();
+
+		switch (test_cases[i].check_type) {
+		case CHECK_ANON_MEM:
+			evaluate_test(check_anonymous_memory_mapping(test_cases[i].mem_type,
+								     test_cases[i].mte_sync,
+								     test_cases[i].mapping,
+								     test_cases[i].tag_check),
+				      format_test_name(&test_cases[i]));
+			break;
+		case CHECK_FILE_MEM:
+			evaluate_test(check_file_memory_mapping(test_cases[i].mem_type,
+							        test_cases[i].mte_sync,
+							        test_cases[i].mapping,
+							        test_cases[i].tag_check),
+				      format_test_name(&test_cases[i]));
+			break;
+		case CHECK_CLEAR_PROT_MTE:
+			evaluate_test(check_clear_prot_mte_flag(test_cases[i].mem_type,
+							        test_cases[i].mte_sync,
+							        test_cases[i].mapping),
+				      format_test_name(&test_cases[i]));
+			break;
+		default:
+			exit(KSFT_FAIL);
+		}
+	}
 
 	mte_restore_setup();
 	ksft_print_cnts();
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}

