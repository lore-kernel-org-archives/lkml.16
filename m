Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51692192FC;
	Mon, 19 May 2025 22:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747694035; cv=none; b=Aw7KtTTTF7UBbM03i9sILtnY4WUTARvZT5v/YmtbpaGWpr8TVW45H83xCbZ36qAZNBGXcc2O/VDqFWKZ0La11icjx7P72ZZ0BKhsn/DvR+O2Ii6bB8qtMTRbMFkPKPfU3H17uXRtDdAZ/MDF5QrthxiS1aQxo3myDJuwretJhhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747694035; c=relaxed/simple;
	bh=6clWYkJ46bS6af6Y7ODPfkaW96D1yKbSRPHkJFhb7is=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gbWFMZF24BUkmdJcXonLHvGRhMXfkuw9si6AyUoujG2d8z0oqvB0UAZg7QLuqgtv51zOdAfzutuAY0Xm2XF7HQcWnIMlJLjQ5JbUYVyxP+S9wKfZsfHXnje9nAXD69HQ0tAForg17VA2uvMcTQ1oC7bjPjnAzmDgbCBquopS5HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eDxYH/pS; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eDxYH/pS"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-476977848c4so54010711cf.1;
        Mon, 19 May 2025 15:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747694033; x=1748298833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GLL6/TM7VHHA7BD7VtemxaiF2BY2WlisCLQAtLpyNFE=;
        b=eDxYH/pSemxNbUSqcFuW+xByZiYWi5GOBg4qjqgn7O/IvpS+V8a1V3y8B/dxsz/ObA
         tfli25q2GP32H/YxE46YGrziGeW1ZUDLRC7pQ0IDPjwXKIL7jwXwS3+ezJUwiHcO7F1V
         2d3WmyV1K3cw5JQoWiVindRWCfbK6xbN/K+KTjjkNvUceO71JLSGqg+Fcoc54VfIk511
         JY80zS34QhM/Xd7stTpW30DIJeZwGzRbxZed3atQv+mASnXDsDLpl9woLtUpEVZ3Hm88
         tyz6UieVV5lryVP+F7z8lhXbRKWGwUrqdq4oOy6kl1GHIhS1vFVfmvek+wHNlHDFGWZo
         IF7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747694033; x=1748298833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GLL6/TM7VHHA7BD7VtemxaiF2BY2WlisCLQAtLpyNFE=;
        b=oz13oB1Q9lwYVe6GXOxHvQnRx7fRJELRSPGdQm2pF16fNf4lqYhJJllKyIedujDVzl
         iGVraJ4NBj0sKB9lDKTyNWcRP/bXEze6YrDKiL4FHYJyPHO+cQNpB7ilAPT/w4Hx2no7
         nH6i12NR9Mpbo1UxXxTUN92lOlNdaQA+Bdc80oFB94unMuhTcozdC2R07nN4D4BE0JOG
         TwQElaPEjC5WxapNP8fDcal/JPHTphZaZa3mrHPGYFuPsWFUhaURs4V1rZ5fB0IES0Bn
         7m+oaL+EUd0cvIrfvJPMkVVxwDSesfDnSMy1ey3viwCFFhhYQOJWJLgvfq7G+Q1WBaNt
         FB2A==
X-Forwarded-Encrypted: i=1; AJvYcCUmDoVtBdmxw2/q1gU5XKxSpsE+vzYG/H97kn4VUhF+wEZ5uul2l4avxcUQ9dTEVBtFyeraZnLvReI=@vger.kernel.org, AJvYcCXUXF1kuzN7+QTWlOD3cQfVYqfST38j9A377v3h6vcyU5cLHwnqO4UnL0ONrZ2Akan0NFPLeLBwLfskLk7R@vger.kernel.org
X-Gm-Message-State: AOJu0YyY7234vEbKhfQvDW2mKJZqc6/NYz/Yx7KbsE0nsUQN6CfZunLl
	1Kh+LA257gVWISj75GIo6XZIw9VCAcssPMKF012yeCniI9SWaHj8rpSZ
X-Gm-Gg: ASbGncsa6o5NoT2mj7GbV430Y+BI5l9Tht8WHCRWSoBpuT4AzMPEE+NllsuMQQhmWVO
	ulv0G/iwPWy57+Q0nCW4Vsv8fC8bXFoseu9aAKPgvN/4JnJNOjjXHF3lLOoFYQA9A8iveTt6oi6
	kH5pqNovU1DwyRSVBAgvA+F+t10bLctN6YevGIu0SMaZ/R6ZC83j2S0hAw1IiG3bCfmoRcQDKXH
	LOWKuw8yI/EH2dYUGI0iQb5uX+XTdfBG2hE7bNzx5KehdsYLqlUIXzIilYinLvMpxWtJiVq5WOg
	mf7g0dtMs24wCKVh6/vo3HS6g5REf7q94LHLEkVL+jJCF3qZ
X-Google-Smtp-Source: AGHT+IF2bjSrNBKkDGo+548/O/GSqWphCFb2QYFAjC9c4/YfABn2yMXLMwEjhN7yIRg9vuRAbhk/TA==
X-Received: by 2002:a05:622a:a1b:b0:476:a74d:f23b with SMTP id d75a77b69052e-494ae4ca3ffmr252876701cf.48.1747694032568;
        Mon, 19 May 2025 15:33:52 -0700 (PDT)
Received: from localhost ([2a03:2880:20ff:1::])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-494ae427fe5sm62947021cf.44.2025.05.19.15.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 15:33:52 -0700 (PDT)
From: Usama Arif <usamaarif642@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	david@redhat.com,
	linux-mm@kvack.org
Cc: hannes@cmpxchg.org,
	shakeel.butt@linux.dev,
	riel@surriel.com,
	ziy@nvidia.com,
	laoar.shao@gmail.com,
	baolin.wang@linux.alibaba.com,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	npache@redhat.com,
	ryan.roberts@arm.com,
	vbabka@suse.cz,
	jannh@google.com,
	Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kernel-team@meta.com,
	Usama Arif <usamaarif642@gmail.com>
Subject: [PATCH v3 5/7] selftests: prctl: introduce tests for PR_DEFAULT_MADV_NOHUGEPAGE
Date: Mon, 19 May 2025 23:29:57 +0100
Message-ID: <20250519223307.3601786-6-usamaarif642@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250519223307.3601786-1-usamaarif642@gmail.com>
References: <20250519223307.3601786-1-usamaarif642@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The test is limited to 2M PMD THPs. It does not modify the system
settings in order to not disturb other process running in the system.
It checks if the PMD size is 2M, if the 2M policy is set to inherit
and if the system global THP policy is set to "always", so that
the change in behaviour due to PR_DEFAULT_MADV_NOHUGEPAGE can
be seen.

This tests if:
- the process can successfully set the policy
- carry it over to the new process with fork
- if no hugepage is gotten when the process doesn't MADV_HUGEPAGE
- if hugepage is gotten when the process does MADV_HUGEPAGE
- the process can successfully reset the policy to PR_DEFAULT_SYSTEM
- if hugepage is gotten after the policy reset

Signed-off-by: Usama Arif <usamaarif642@gmail.com>
---
 tools/testing/selftests/prctl/Makefile     |   2 +-
 tools/testing/selftests/prctl/thp_policy.c | 214 +++++++++++++++++++++
 2 files changed, 215 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/prctl/thp_policy.c

diff --git a/tools/testing/selftests/prctl/Makefile b/tools/testing/selftests/prctl/Makefile
index 01dc90fbb509..ee8c98e45b53 100644
--- a/tools/testing/selftests/prctl/Makefile
+++ b/tools/testing/selftests/prctl/Makefile
@@ -5,7 +5,7 @@ ARCH ?= $(shell echo $(uname_M) | sed -e s/i.86/x86/ -e s/x86_64/x86/)
 
 ifeq ($(ARCH),x86)
 TEST_PROGS := disable-tsc-ctxt-sw-stress-test disable-tsc-on-off-stress-test \
-		disable-tsc-test set-anon-vma-name-test set-process-name
+		disable-tsc-test set-anon-vma-name-test set-process-name thp_policy
 all: $(TEST_PROGS)
 
 include ../lib.mk
diff --git a/tools/testing/selftests/prctl/thp_policy.c b/tools/testing/selftests/prctl/thp_policy.c
new file mode 100644
index 000000000000..7791d282f7c8
--- /dev/null
+++ b/tools/testing/selftests/prctl/thp_policy.c
@@ -0,0 +1,214 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * This test covers the PR_GET/SET_THP_POLICY functionality of prctl calls
+ */
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+#include <sys/mman.h>
+#include <sys/prctl.h>
+#include <sys/wait.h>
+
+#ifndef PR_SET_THP_POLICY
+#define PR_SET_THP_POLICY		78
+#define PR_GET_THP_POLICY		79
+#define PR_DEFAULT_MADV_HUGEPAGE	0
+#define PR_DEFAULT_MADV_NOHUGEPAGE	1
+#define PR_DEFAULT_SYSTEM		2
+#endif
+
+#define CONTENT_SIZE 256
+#define BUF_SIZE (12 * 2 * 1024 * 1024) // 12 x 2MB pages
+
+enum system_policy {
+	SYSTEM_POLICY_ALWAYS,
+	SYSTEM_POLICY_MADVISE,
+	SYSTEM_POLICY_NEVER,
+};
+
+int system_thp_policy;
+
+/* check if the sysfs file contains the expected substring */
+static int check_file_content(const char *file_path, const char *expected_substring)
+{
+	FILE *file = fopen(file_path, "r");
+	char buffer[CONTENT_SIZE];
+
+	if (!file) {
+		perror("Failed to open file");
+		return -1;
+	}
+	if (fgets(buffer, CONTENT_SIZE, file) == NULL) {
+		perror("Failed to read file");
+		fclose(file);
+		return -1;
+	}
+	fclose(file);
+	// Remove newline character from the buffer
+	buffer[strcspn(buffer, "\n")] = '\0';
+	if (strstr(buffer, expected_substring))
+		return 0;
+	else
+		return 1;
+}
+
+/*
+ * The test is designed for 2M hugepages only.
+ * Check if hugepage size is 2M, if 2M size inherits from global
+ * setting, and if the global setting is madvise or always.
+ */
+static int sysfs_check(void)
+{
+	int res = 0;
+
+	res = check_file_content("/sys/kernel/mm/transparent_hugepage/hpage_pmd_size", "2097152");
+	if (res) {
+		printf("hpage_pmd_size is not set to 2MB. Skipping test.\n");
+		return -1;
+	}
+	res |= check_file_content("/sys/kernel/mm/transparent_hugepage/hugepages-2048kB/enabled",
+				  "[inherit]");
+	if (res) {
+		printf("hugepages-2048kB does not inherit global setting. Skipping test.\n");
+		return -1;
+	}
+
+	res = check_file_content("/sys/kernel/mm/transparent_hugepage/enabled", "[madvise]");
+	if (!res) {
+		system_thp_policy = SYSTEM_POLICY_MADVISE;
+		return 0;
+	}
+	res = check_file_content("/sys/kernel/mm/transparent_hugepage/enabled", "[always]");
+	if (!res) {
+		system_thp_policy = SYSTEM_POLICY_ALWAYS;
+		return 0;
+	}
+	printf("Global THP policy not set to madvise or always. Skipping test.\n");
+	return -1;
+}
+
+static int check_smaps_for_huge(void)
+{
+	FILE *file = fopen("/proc/self/smaps", "r");
+	int is_anonhuge = 0;
+	char line[256];
+
+	if (!file) {
+		perror("fopen");
+		return -1;
+	}
+
+	while (fgets(line, sizeof(line), file)) {
+		if (strstr(line, "AnonHugePages:") && strstr(line, "24576 kB")) {
+			is_anonhuge = 1;
+			break;
+		}
+	}
+	fclose(file);
+	return is_anonhuge;
+}
+
+static int test_mmap_thp(int madvise_buffer)
+{
+	int is_anonhuge;
+
+	char *buffer = (char *)mmap(NULL, BUF_SIZE, PROT_READ | PROT_WRITE,
+				    MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	if (buffer == MAP_FAILED) {
+		perror("mmap");
+		return -1;
+	}
+	if (madvise_buffer)
+		madvise(buffer, BUF_SIZE, MADV_HUGEPAGE);
+
+	// set memory to ensure it's allocated
+	memset(buffer, 0, BUF_SIZE);
+	is_anonhuge = check_smaps_for_huge();
+	munmap(buffer, BUF_SIZE);
+	return is_anonhuge;
+}
+
+/* Global policy is always, process is changed to NOHUGE (process becomes madvise) */
+static int test_global_always_process_nohuge(void)
+{
+	int is_anonhuge = 0, res = 0, status = 0;
+	pid_t pid;
+
+	if (prctl(PR_SET_THP_POLICY, PR_DEFAULT_MADV_NOHUGEPAGE, NULL, NULL, NULL) != 0) {
+		perror("prctl failed to set policy to madvise");
+		return -1;
+	}
+
+	/* Make sure prctl changes are carried across fork */
+	pid = fork();
+	if (pid < 0) {
+		perror("fork");
+		exit(EXIT_FAILURE);
+	}
+
+	res = prctl(PR_GET_THP_POLICY, NULL, NULL, NULL, NULL);
+	if (res != PR_DEFAULT_MADV_NOHUGEPAGE) {
+		printf("prctl PR_GET_THP_POLICY returned %d pid %d\n", res, pid);
+		goto err_out;
+	}
+
+	/* global = always, process = madvise, we shouldn't get HPs without madvise */
+	is_anonhuge = test_mmap_thp(0);
+	if (is_anonhuge) {
+		printf(
+		"PR_DEFAULT_MADV_NOHUGEPAGE set but still got hugepages without MADV_HUGEPAGE\n");
+		goto err_out;
+	}
+
+	is_anonhuge = test_mmap_thp(1);
+	if (!is_anonhuge) {
+		printf(
+		"PR_DEFAULT_MADV_NOHUGEPAGE set but did't get hugepages with MADV_HUGEPAGE\n");
+		goto err_out;
+	}
+
+	/* Reset to system policy */
+	if (prctl(PR_SET_THP_POLICY, PR_DEFAULT_SYSTEM, NULL, NULL, NULL) != 0) {
+		perror("prctl failed to set policy to system");
+		goto err_out;
+	}
+
+	is_anonhuge = test_mmap_thp(0);
+	if (!is_anonhuge) {
+		printf("global policy is always but we still didn't get hugepages\n");
+		goto err_out;
+	}
+
+	is_anonhuge = test_mmap_thp(1);
+	if (!is_anonhuge) {
+		printf("global policy is always but we still didn't get hugepages\n");
+		goto err_out;
+	}
+
+	if (pid == 0) {
+		exit(EXIT_SUCCESS);
+	} else {
+		wait(&status);
+		if (WIFEXITED(status))
+			return 0;
+		else
+			return -1;
+	}
+
+err_out:
+	if (pid == 0)
+		exit(EXIT_FAILURE);
+	else
+		return -1;
+}
+
+int main(void)
+{
+	if (sysfs_check())
+		return 0;
+
+	if (system_thp_policy == SYSTEM_POLICY_ALWAYS)
+		return test_global_always_process_nohuge();
+
+}
-- 
2.47.1

