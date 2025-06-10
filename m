Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3468823BCFD;
	Tue, 10 Jun 2025 15:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749567724; cv=none; b=hQjT+bsOTxFP82AKeIiw2UemI4Qo8UG2PBWgleYa66YQOin4n5QcPIJenbFPdjUF4GHaSGRdYywFORmb4jCv9bmyu9KPwUw41i+kfeJuG6s0AQdz09TOcRO7vn2yj8imDo/BV9VZso0gxv+E4bTPzq1AEJRDYbb9Fx0dNrtV7lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749567724; c=relaxed/simple;
	bh=TWFzodArfUb56G2s5s6j00RgWcg438jjSrUiM05c4wU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NXRIi6Iy1xEhCm41Kja0xKkTUDloe17eDC9Izj8/FnwEeVAYO06yiSRRuTbjfXCb2SGvrdgti8t+cgY3P6D2UDTufOutG/3z6mx9JzpwENQ82etwVkYzXLmrueY65HDenQc9zgCtQMMZ9h17sS8lM1P92TBbOqjVvB4JSyNsPBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3EA411EA6;
	Tue, 10 Jun 2025 08:01:43 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 210F63F59E;
	Tue, 10 Jun 2025 08:02:00 -0700 (PDT)
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
Subject: [PATCH v5 5/6] kselftest/arm64/mte: refactor check_mmap_option test
Date: Tue, 10 Jun 2025 16:01:43 +0100
Message-Id: <20250610150144.2523945-6-yeoreum.yun@arm.com>
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

Before add mtefar testcase on check_mmap_option.c,
refactor check_mmap_option.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 .../selftests/arm64/mte/check_mmap_options.c  | 158 +++++++++++++-----
 1 file changed, 118 insertions(+), 40 deletions(-)

diff --git a/tools/testing/selftests/arm64/mte/check_mmap_options.c b/tools/testing/selftests/arm64/mte/check_mmap_options.c
index b37bf481c9f9..a784b3a31d4f 100644
--- a/tools/testing/selftests/arm64/mte/check_mmap_options.c
+++ b/tools/testing/selftests/arm64/mte/check_mmap_options.c
@@ -3,6 +3,7 @@
 
 #define _GNU_SOURCE
 
+#include <assert.h>
 #include <errno.h>
 #include <fcntl.h>
 #include <signal.h>
@@ -24,6 +25,12 @@
 #define TAG_CHECK_ON		0
 #define TAG_CHECK_OFF		1
 
+#define TEST_NAME_MAX		256
+
+#define CHECK_ANON_MEM		0
+#define CHECK_FILE_MEM		1
+#define CHECK_CLEAR_PROT_MTE	2
+
 static size_t page_size;
 static int sizes[] = {
 	1, 537, 989, 1269, MT_GRANULE_SIZE - 1, MT_GRANULE_SIZE,
@@ -183,10 +190,98 @@ static int check_clear_prot_mte_flag(int mem_type, int mode, int mapping)
 	return KSFT_PASS;
 }
 
+const char *format_test_name(int check_type, int mem_type, int sync,
+		       int mapping, int tag_check)
+{
+	static char test_name[TEST_NAME_MAX];
+	const char* check_type_str;
+	const char* mem_type_str;
+	const char* sync_str;
+	const char* mapping_str;
+	const char* tag_check_str;
+
+	switch (check_type) {
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
+	switch (mem_type) {
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
+	switch (sync) {
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
+	switch (mapping) {
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
+	switch (tag_check) {
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
+	snprintf(test_name, TEST_NAME_MAX,
+	         "Check %s with %s mapping, %s mode, %s memory and %s\n",
+	         check_type_str, mapping_str, sync_str, mem_type_str, tag_check_str);
+
+	return test_name;
+}
+
 int main(int argc, char *argv[])
 {
 	int err;
 	int item = ARRAY_SIZE(sizes);
+	int check_type[] = { CHECK_ANON_MEM, CHECK_FILE_MEM };
+	int mem_type[] = { USE_MMAP, USE_MPROTECT };
+	int mte_sync[] = { MTE_SYNC_ERR, MTE_ASYNC_ERR };
+	int mapping[] = { MAP_PRIVATE, MAP_SHARED };
+	int c, mt, s, m;
 
 	err = mte_default_setup();
 	if (err)
@@ -210,54 +305,37 @@ int main(int argc, char *argv[])
 	mte_enable_pstate_tco();
 
 	evaluate_test(check_anonymous_memory_mapping(USE_MMAP, MTE_SYNC_ERR, MAP_PRIVATE, TAG_CHECK_OFF),
-	"Check anonymous memory with private mapping, sync error mode, mmap memory and tag check off\n");
+		      format_test_name(CHECK_ANON_MEM, USE_MMAP, MTE_SYNC_ERR, MAP_PRIVATE, TAG_CHECK_OFF));
+
 	evaluate_test(check_file_memory_mapping(USE_MPROTECT, MTE_SYNC_ERR, MAP_PRIVATE, TAG_CHECK_OFF),
-	"Check file memory with private mapping, sync error mode, mmap/mprotect memory and tag check off\n");
+		      format_test_name(CHECK_FILE_MEM, USE_MPROTECT, MTE_SYNC_ERR, MAP_PRIVATE, TAG_CHECK_OFF));
 
 	mte_disable_pstate_tco();
+
 	evaluate_test(check_anonymous_memory_mapping(USE_MMAP, MTE_NONE_ERR, MAP_PRIVATE, TAG_CHECK_OFF),
-	"Check anonymous memory with private mapping, no error mode, mmap memory and tag check off\n");
+		      format_test_name(CHECK_ANON_MEM, USE_MMAP, MTE_NONE_ERR, MAP_PRIVATE, TAG_CHECK_OFF));
 	evaluate_test(check_file_memory_mapping(USE_MPROTECT, MTE_NONE_ERR, MAP_PRIVATE, TAG_CHECK_OFF),
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
+		      format_test_name(CHECK_FILE_MEM, USE_MPROTECT, MTE_NONE_ERR, MAP_PRIVATE, TAG_CHECK_OFF));
+
+	for (c = 0 ; c < ARRAY_SIZE(check_type); c++) {
+		for (s = 0; s < ARRAY_SIZE(mte_sync); s++) {
+			for (m = 0; m < ARRAY_SIZE(mapping); m++) {
+				for (mt = 0; mt < ARRAY_SIZE(mem_type); mt++) {
+					if (check_type[c] == CHECK_ANON_MEM)
+						evaluate_test(check_anonymous_memory_mapping(mem_type[mt], mte_sync[s], mapping[m], TAG_CHECK_ON),
+							format_test_name(CHECK_ANON_MEM, mem_type[mt], mte_sync[s], mapping[m], TAG_CHECK_ON));
+					else
+						evaluate_test(check_file_memory_mapping(mem_type[mt], mte_sync[s], mapping[m], TAG_CHECK_ON),
+							format_test_name(CHECK_FILE_MEM, mem_type[mt], mte_sync[s], mapping[m], TAG_CHECK_ON));
+				}
+			}
+		}
+	}
 
 	evaluate_test(check_clear_prot_mte_flag(USE_MMAP, MTE_SYNC_ERR, MAP_PRIVATE),
-	"Check clear PROT_MTE flags with private mapping, sync error mode and mmap memory\n");
+		      format_test_name(CHECK_CLEAR_PROT_MTE, USE_MMAP, MTE_SYNC_ERR, MAP_PRIVATE, TAG_CHECK_ON));
 	evaluate_test(check_clear_prot_mte_flag(USE_MPROTECT, MTE_SYNC_ERR, MAP_PRIVATE),
-	"Check clear PROT_MTE flags with private mapping and sync error mode and mmap/mprotect memory\n");
+		      format_test_name(CHECK_CLEAR_PROT_MTE, USE_MPROTECT, MTE_SYNC_ERR, MAP_PRIVATE, TAG_CHECK_ON));
 
 	mte_restore_setup();
 	ksft_print_cnts();
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}

