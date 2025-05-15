Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B36146593;
	Thu, 15 May 2025 13:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747316141; cv=none; b=Xa8hCY+E6S1fezOGjiLxUgzG1UtoT2yhaeEH2ftPrxC4u+BmBebAJCb3n6xKbxUm/ohOpLtaJHLOhpmP70T1nDFMeY7jVdVSvAGKMkFvQ9kznu6bn0ouI1aa0HVC/tSVet0I662ZapgW5B5EzGRTZD2yfUSds7t4+/v1YVk1VaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747316141; c=relaxed/simple;
	bh=vaZj73iCxIRDSHGHMuX6ee72qoDLQu34Sg74SmH+rUo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GJuj3bvVuHYVXF//wfRwLnV/85AymC7kAXkLxkK0XG/9LKhzpbcurKTOyi/LwEmVBf0+XOBL2KvB4M3G/hsQZrXeInCFcTTVj5kXJZ0sun0Czdj/Un+VcJKUlROsn0ghdj2yWbwZ679r1w6Op38OGNtEfN3C1v6wThwpH4TzFl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NeUAT47r; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NeUAT47r"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7c5c815f8efso82174885a.2;
        Thu, 15 May 2025 06:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747316138; x=1747920938; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wlNG5Htln8HKvc+6gp+8bgvPUce9d9z2JFDhosQneXo=;
        b=NeUAT47rIAyVOSSSCHsdi4okh02jULmvhEZEia4qLSc9ECGAf0ozLdnPKGUcbEjziX
         DCOjpk0YP67p/EDBum0jkRqSBMj986AlwXXJKTgdIe4nQaF3w/wh//eOa3W3zTdAF+z3
         8cDW9XURFN2IXfap5qXqj4IaNr2kiwRnOQJ2i95N3HNNdO7YNc7WPaP7vipXVUkVRab5
         zpxPrsxcCvyq5eh4UoFaAcpyFoMrr9N3B2snw/HAfiExAcbtd3Rweu7I3sFlSyJTR03L
         SKPNfMnFPmioFkjL2ulgalInEbY/5dqfYnSm7HC3lhqPqxhlH/WvDxneO+ztRzTge0kH
         XxPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747316138; x=1747920938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wlNG5Htln8HKvc+6gp+8bgvPUce9d9z2JFDhosQneXo=;
        b=kt3/1D3Ni1Q/6wLyfNHwgHkz1h1PfiNr8mfSU496OAuzBwKs/HE5wVAZvdN+roYXxF
         g21hIw2IX2sEagnfDvL47fOdft980HgzrpiQsgXpzvQN6B+CO5dxGcSxLkdAkA1gWDhM
         8BW6FXwK9pjI22wTmxAhIM495O9ARRNlre6FbbwuTBW+VkOCb7Z0BrfDIOPa8Fs3TFGp
         ckTZnR3TK+nmnbSx2b1aNJ3ivMf/GUT0zqPsDKmSQzztA54vin3hrgXivWxQrfd9408u
         nJmFlAYULb3AyaPG7YiQQabMTuhqCqANqCUBm2EV+bsL0g4per7Cu7jj4eq4s/CZZSrb
         D5FQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVRTPSYpykWZ+HvJB8/CR7uL9xcbv3nL7qSLmw1ae+qVEFPHTpnVkxejBuQpDCOPtqEdOIZxiiAdxZUH3Q@vger.kernel.org, AJvYcCXvj82PfjTKx9YJPJUPfnMJZHfZ7goCI987EoM+0/l1VTV34pQsWW1AeElqSJuklrv71kpL+fJEBHQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwt8pGUeqj1xprOMnNY2Iksw1eKxhqteVnKByOvBCwEJ4LtH4E
	GLS4+XFAs7+lJbM47vFpUwA6eBmlG34BznqnnfKJD+4jpnocdum1esUfLmmv
X-Gm-Gg: ASbGnctvMkBerUxNwtJV8rVi2lnP1zVdYa1i+vxoZRidQZmtVva87cR8Ss03nKqzR7g
	4wi/i1+V1kDb7ThW5NE/rLmnR1lgttG/wGNH3ShoL0y/cmOQicWeAFAu/Bo9v2X2xbCwU9mfEhb
	rtK2iWhUCwgFaLBFLXpLYX4n8LEA1Q7Y4EfkYt//hqT+yMuUxbIQX4+oYnZLWPlp76S4z0easUh
	o+Lw0RwuuGeMjlSdBEwdjCkHdlhyWSawJQ0mP9quIM7XuDP94v6vMQFIunVdmgYRIr6PsU8hDht
	CJED7ammjfN1a020zTNshQyMw82PMCXdFjXnO11mjKzszftg
X-Google-Smtp-Source: AGHT+IEn86Vf0zD3MKqHNneuDkpt+TgrRPxRiPuPRhn5N/sfp5gibmt93u4lmV51ja/uctouLfRO6w==
X-Received: by 2002:a05:6214:260d:b0:6f5:35fe:6a80 with SMTP id 6a1803df08f44-6f896e3f49emr111367906d6.11.1747316127235;
        Thu, 15 May 2025 06:35:27 -0700 (PDT)
Received: from localhost ([2a03:2880:20ff:3::])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8a793fe1fsm5417566d6.108.2025.05.15.06.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 06:35:26 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kernel-team@meta.com,
	Usama Arif <usamaarif642@gmail.com>
Subject: [PATCH 4/6] selftests: prctl: introduce tests for PR_THP_POLICY_DEFAULT_NOHUGE
Date: Thu, 15 May 2025 14:33:33 +0100
Message-ID: <20250515133519.2779639-5-usamaarif642@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250515133519.2779639-1-usamaarif642@gmail.com>
References: <20250515133519.2779639-1-usamaarif642@gmail.com>
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
the change in behaviour due to PR_THP_POLICY_DEFAULT_NOHUGE can
be seen.

This tests if:
- the process can successfully set the policy
- carry it over to the new process with fork
- if no hugepage is gotten when the process doesn't MADV_HUGEPAGE
- if hugepage is gotten when the process does MADV_HUGEPAGE
- the process can successfully reset the policy to PR_THP_POLICY_SYSTEM
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
index 000000000000..e39872a6d429
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
+#define PR_THP_POLICY_DEFAULT_HUGE	0
+#define PR_THP_POLICY_DEFAULT_NOHUGE	1
+#define PR_THP_POLICY_SYSTEM		2
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
+	if (prctl(PR_SET_THP_POLICY, PR_THP_POLICY_DEFAULT_NOHUGE, NULL, NULL, NULL) != 0) {
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
+	if (res != PR_THP_POLICY_DEFAULT_NOHUGE) {
+		printf("prctl PR_GET_THP_POLICY returned %d pid %d\n", res, pid);
+		goto err_out;
+	}
+
+	/* global = always, process = madvise, we shouldn't get HPs without madvise */
+	is_anonhuge = test_mmap_thp(0);
+	if (is_anonhuge) {
+		printf(
+		"PR_THP_POLICY_DEFAULT_NOHUGE set but still got hugepages without MADV_HUGEPAGE\n");
+		goto err_out;
+	}
+
+	is_anonhuge = test_mmap_thp(1);
+	if (!is_anonhuge) {
+		printf(
+		"PR_THP_POLICY_DEFAULT_NOHUGE set but did't get hugepages with MADV_HUGEPAGE\n");
+		goto err_out;
+	}
+
+	/* Reset to system policy */
+	if (prctl(PR_SET_THP_POLICY, PR_THP_POLICY_SYSTEM, NULL, NULL, NULL) != 0) {
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

