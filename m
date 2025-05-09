Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA24D22D796
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 15:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746804640; cv=none; b=LGEu3IIwkPfOLqgELfvAxD9UYFvm/Gu6Am6cXWKGLGldpXI9WZR1e05bp2cHfhnFFvL+xv379qwZXrtHkDKR+s9FHY5qVIUV/d/KLC0CkaORqZhPEBELCpIYHYIXcUZ2+I2QwLHVrM2PO694BCD3pfNkoJrp+NU/VGiBIz7J52Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746804640; c=relaxed/simple;
	bh=lfDM9r+JA2hEI0mY/gXRms9eYef9aln2qjiVgIvyzXw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MjL48XWk7XxbZumCzHWJWCBiRRA7BSF0jNggsQepYFln8wcSmqziw/Q+WInsJ/gjcwpS+I02yuz2UQblnc3VR49iNVRzag6sHUrPJnFERmWz2eQMY+B450c5i9uuVdkWlWrzwIM1/hT07uxJMr7FTpgtpYpTJzl4R9169uvAUJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UV77rLRv; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UV77rLRv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746804637;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/QETQBLLgywJiVkdBX35qjwYFT1cFvifg3en6u8zZzc=;
	b=UV77rLRvqAlInWsyrr0e9uOGrFUBeN8K9PhKrkTSpgTDUXUxSy5i7LKCDlMYA+J9PWzVxh
	Vo4o/pGJA7jAP9x+Bdw7Zb8AYq/E9yeJj6o5GI/1D6g9CaocHrdWOrvjAEe9BNzro2uCfr
	be3/P2YvkVYi3vyDrg/zA5RcZaxPX5Q=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-378-K7h0lIX_OU2JbzJmLcy38A-1; Fri, 09 May 2025 11:30:36 -0400
X-MC-Unique: K7h0lIX_OU2JbzJmLcy38A-1
X-Mimecast-MFC-AGG-ID: K7h0lIX_OU2JbzJmLcy38A_1746804635
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43d733063cdso17765405e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 08:30:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746804635; x=1747409435;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/QETQBLLgywJiVkdBX35qjwYFT1cFvifg3en6u8zZzc=;
        b=Z39XuAqJLQRuOG3VinoroX8x6c3MnTN3LH+ucsGjLboy7YqwK1bZcxWWe0JZzMpLs4
         Vdujs6lMz+ZdQzxh7RZTyoK14UIzCQJLVqfVRbJV+U3qKtHDsUgbQkKEcmLLcVW76d1C
         kRJ4tfXpnkeqXY4V4gH0SklPyPZmntumPotVbzbdUljDMtjZMablIAHCUA9VbCJPvAEX
         H+0L7ANxbZBDVNB7r14oCE2UMDJKxqifRc/oDlQzN/sGKNR5uKcPGo0u9IqhjU96cJCf
         fquY3511hFSWIP70LpeOXuWusDyzHqmhVQSoKUfe4GDeh8EFThZIE3tO8pp5OnvfSn+w
         RHhA==
X-Gm-Message-State: AOJu0YzFZBuHevpGYIGsikOQDRcWhq6XPwTuurjiTR2NHseVqPJDOb2c
	PPknPRB1EdzwexOje1bQhltJeIC3o5r1Uxb09tPxKMZc67d3okWJRI9hbF1dZS0CjrDx/7zJ70I
	zBLxgAh77ABuJAr03dTG0ECLxUg89IplzVj4nXXFZP+g05OavAcNgBipeMQBnPQCsFeU52zRewN
	RT+jxz3wT4/ocWWBRms0pRwbsjCAeDjGUQV3M3j+AzWA==
X-Gm-Gg: ASbGncswxLXQliEcNNCZ0wvIpF/FHr+ArZiwtP+mXPLR3KvR/e2RN+yVwzWe/V2Z9Og
	VXbNjfPuZUdPbwMnF/E7l20t25hTGYgvdtExjwzFZHK3a8cHNs+2mTFVY0nCTTzuNvpU3Tlixd0
	3l3+oomde5Jk1vpPfMD5DQR32kOF9G0d9xaUl8VDmFmTMpcG84hy6iUhTixvZhqD78GSuP0Jcwe
	4ZKECYu0iNzxL7yfyyaaAI/VoFkqX3NPGGBn7FREiVFkWA98Yu+rr91YrRMb9fuoOA/hqoWsu/t
	f4j7Hv99h4l53iLJYElqeb+b4KAY5ZrwTaJnLZTAnNtnXYJ5j5qSZm5qSjOqsgpf+c+7uB6C
X-Received: by 2002:a05:600c:6095:b0:43b:c0fa:f9cd with SMTP id 5b1f17b1804b1-442d6d0a9ebmr34901915e9.7.1746804635113;
        Fri, 09 May 2025 08:30:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+BxOB6NY2iOaO7FiGmjEOw9RMH7buuCJWOsw4fLTunHCh6Aav62kTXNQTqClatZwokO3a+Q==
X-Received: by 2002:a05:600c:6095:b0:43b:c0fa:f9cd with SMTP id 5b1f17b1804b1-442d6d0a9ebmr34901495e9.7.1746804634577;
        Fri, 09 May 2025 08:30:34 -0700 (PDT)
Received: from localhost (p200300d82f4555008267647f4209dedd.dip0.t-ipconnect.de. [2003:d8:2f45:5500:8267:647f:4209:dedd])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442d67d5c7bsm33791995e9.4.2025.05.09.08.30.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 08:30:34 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	Dev Jain <dev.jain@arm.com>
Subject: [PATCH v2] selftests/mm: add simple VM_PFNMAP tests based on mmap'ing /dev/mem
Date: Fri,  9 May 2025 17:30:32 +0200
Message-ID: <20250509153033.952746-1-david@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Let's test some basic functionality using /dev/mem. These tests will
implicitly cover some PAT (Page Attribute Handling) handling on x86.

These tests will only run when /dev/mem access to the first two pages
in physical address space is possible and allowed; otherwise, the tests
are skipped.

On current x86-64 with PAT inside a VM, all tests pass:

	TAP version 13
	1..6
	# Starting 6 tests from 1 test cases.
	#  RUN           pfnmap.madvise_disallowed ...
	#            OK  pfnmap.madvise_disallowed
	ok 1 pfnmap.madvise_disallowed
	#  RUN           pfnmap.munmap_split ...
	#            OK  pfnmap.munmap_split
	ok 2 pfnmap.munmap_split
	#  RUN           pfnmap.mremap_fixed ...
	#            OK  pfnmap.mremap_fixed
	ok 3 pfnmap.mremap_fixed
	#  RUN           pfnmap.mremap_shrink ...
	#            OK  pfnmap.mremap_shrink
	ok 4 pfnmap.mremap_shrink
	#  RUN           pfnmap.mremap_expand ...
	#            OK  pfnmap.mremap_expand
	ok 5 pfnmap.mremap_expand
	#  RUN           pfnmap.fork ...
	#            OK  pfnmap.fork
	ok 6 pfnmap.fork
	# PASSED: 6 / 6 tests passed.
	# Totals: pass:6 fail:0 xfail:0 xpass:0 skip:0 error:0

However, we are able to trigger:

[   27.888251] x86/PAT: pfnmap:1790 freeing invalid memtype [mem 0x00000000-0x00000fff]

There are probably more things worth testing in the future, such as
MAP_PRIVATE handling. But this set of tests is sufficient to cover most of
the things we will rework regarding PAT handling.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Shuah Khan <shuah@kernel.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Dev Jain <dev.jain@arm.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---

Hopefully I didn't miss any review feedback.

v1 -> v2:
* Rewrite using kselftest_harness, which simplifies a lot of things
* Add to .gitignore and run_vmtests.sh
* Register signal handler on demand
* Use volatile trick to force a read (not factoring out FORCE_READ just yet)
* Drop mprotect() test case
* Add some more comments why we test certain things
* Use NULL for mmap() first parameter instead of 0
* Smaller fixes

---
 tools/testing/selftests/mm/.gitignore     |   1 +
 tools/testing/selftests/mm/Makefile       |   1 +
 tools/testing/selftests/mm/pfnmap.c       | 196 ++++++++++++++++++++++
 tools/testing/selftests/mm/run_vmtests.sh |   4 +
 4 files changed, 202 insertions(+)
 create mode 100644 tools/testing/selftests/mm/pfnmap.c

diff --git a/tools/testing/selftests/mm/.gitignore b/tools/testing/selftests/mm/.gitignore
index 91db34941a143..824266982aa36 100644
--- a/tools/testing/selftests/mm/.gitignore
+++ b/tools/testing/selftests/mm/.gitignore
@@ -20,6 +20,7 @@ mremap_test
 on-fault-limit
 transhuge-stress
 pagemap_ioctl
+pfnmap
 *.tmp*
 protection_keys
 protection_keys_32
diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
index ad4d6043a60f0..ae6f994d3add7 100644
--- a/tools/testing/selftests/mm/Makefile
+++ b/tools/testing/selftests/mm/Makefile
@@ -84,6 +84,7 @@ TEST_GEN_FILES += mremap_test
 TEST_GEN_FILES += mseal_test
 TEST_GEN_FILES += on-fault-limit
 TEST_GEN_FILES += pagemap_ioctl
+TEST_GEN_FILES += pfnmap
 TEST_GEN_FILES += thuge-gen
 TEST_GEN_FILES += transhuge-stress
 TEST_GEN_FILES += uffd-stress
diff --git a/tools/testing/selftests/mm/pfnmap.c b/tools/testing/selftests/mm/pfnmap.c
new file mode 100644
index 0000000000000..8a9d19b6020c7
--- /dev/null
+++ b/tools/testing/selftests/mm/pfnmap.c
@@ -0,0 +1,196 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Basic VM_PFNMAP tests relying on mmap() of '/dev/mem'
+ *
+ * Copyright 2025, Red Hat, Inc.
+ *
+ * Author(s): David Hildenbrand <david@redhat.com>
+ */
+#define _GNU_SOURCE
+#include <stdlib.h>
+#include <string.h>
+#include <stdint.h>
+#include <unistd.h>
+#include <errno.h>
+#include <fcntl.h>
+#include <signal.h>
+#include <setjmp.h>
+#include <linux/mman.h>
+#include <sys/mman.h>
+#include <sys/wait.h>
+
+#include "../kselftest_harness.h"
+#include "vm_util.h"
+
+static sigjmp_buf sigjmp_buf_env;
+
+static void signal_handler(int sig)
+{
+	siglongjmp(sigjmp_buf_env, -EFAULT);
+}
+
+static int test_read_access(char *addr, size_t size, size_t pagesize)
+{
+	size_t offs;
+	int ret;
+
+	if (signal(SIGSEGV, signal_handler) == SIG_ERR)
+		return -EINVAL;
+
+	ret = sigsetjmp(sigjmp_buf_env, 1);
+	if (!ret) {
+		for (offs = 0; offs < size; offs += pagesize)
+			/* Force a read that the compiler cannot optimize out. */
+			*((volatile char *)(addr + offs));
+	}
+	if (signal(SIGSEGV, signal_handler) == SIG_ERR)
+		return -EINVAL;
+
+	return ret;
+}
+
+FIXTURE(pfnmap)
+{
+	size_t pagesize;
+	int dev_mem_fd;
+	char *addr1;
+	size_t size1;
+	char *addr2;
+	size_t size2;
+};
+
+FIXTURE_SETUP(pfnmap)
+{
+	self->pagesize = getpagesize();
+
+	self->dev_mem_fd = open("/dev/mem", O_RDONLY);
+	if (self->dev_mem_fd < 0)
+		SKIP(return, "Cannot open '/dev/mem'\n");
+
+	/* We'll require the first two pages throughout our tests ... */
+	self->size1 = self->pagesize * 2;
+	self->addr1 = mmap(NULL, self->size1, PROT_READ, MAP_SHARED,
+			   self->dev_mem_fd, 0);
+	if (self->addr1 == MAP_FAILED)
+		SKIP(return, "Cannot mmap '/dev/mem'\n");
+
+	/* ... and want to be able to read from them. */
+	if (test_read_access(self->addr1, self->size1, self->pagesize))
+		SKIP(return, "Cannot read-access mmap'ed '/dev/mem'\n");
+
+	self->size2 = 0;
+	self->addr2 = MAP_FAILED;
+}
+
+FIXTURE_TEARDOWN(pfnmap)
+{
+	if (self->addr2 != MAP_FAILED)
+		munmap(self->addr2, self->size2);
+	if (self->addr1 != MAP_FAILED)
+		munmap(self->addr1, self->size1);
+	if (self->dev_mem_fd >= 0)
+		close(self->dev_mem_fd);
+}
+
+TEST_F(pfnmap, madvise_disallowed)
+{
+	int advices[] = {
+		MADV_DONTNEED,
+		MADV_DONTNEED_LOCKED,
+		MADV_FREE,
+		MADV_WIPEONFORK,
+		MADV_COLD,
+		MADV_PAGEOUT,
+		MADV_POPULATE_READ,
+		MADV_POPULATE_WRITE,
+	};
+	int i;
+
+	/* All these advices must be rejected. */
+	for (i = 0; i < ARRAY_SIZE(advices); i++) {
+		EXPECT_LT(madvise(self->addr1, self->pagesize, advices[i]), 0);
+		EXPECT_EQ(errno, EINVAL);
+	}
+}
+
+TEST_F(pfnmap, munmap_split)
+{
+	/*
+	 * Unmap the first page. This munmap() call is not really expected to
+	 * fail, but we might be able to trigger other internal issues.
+	 */
+	ASSERT_EQ(munmap(self->addr1, self->pagesize), 0);
+
+	/*
+	 * Remap the first page while the second page is still mapped. This
+	 * makes sure that any PAT tracking on x86 will allow for mmap()'ing
+	 * a page again while some parts of the first mmap() are still
+	 * around.
+	 */
+	self->size2 = self->pagesize;
+	self->addr2 = mmap(NULL, self->pagesize, PROT_READ, MAP_SHARED,
+			   self->dev_mem_fd, 0);
+	ASSERT_NE(self->addr2, MAP_FAILED);
+}
+
+TEST_F(pfnmap, mremap_fixed)
+{
+	char *ret;
+
+	/* Reserve a destination area. */
+	self->size2 = self->size1;
+	self->addr2 = mmap(NULL, self->size2, PROT_READ, MAP_ANON | MAP_PRIVATE,
+			   -1, 0);
+	ASSERT_NE(self->addr2, MAP_FAILED);
+
+	/* mremap() over our destination. */
+	ret = mremap(self->addr1, self->size1, self->size2,
+		     MREMAP_FIXED | MREMAP_MAYMOVE, self->addr2);
+	ASSERT_NE(ret, MAP_FAILED);
+}
+
+TEST_F(pfnmap, mremap_shrink)
+{
+	char *ret;
+
+	/* Shrinking is expected to work. */
+	ret = mremap(self->addr1, self->size1, self->size1 - self->pagesize, 0);
+	ASSERT_NE(ret, MAP_FAILED);
+}
+
+TEST_F(pfnmap, mremap_expand)
+{
+	/*
+	 * Growing is not expected to work, and getting it right would
+	 * be challenging. So this test primarily serves as an early warning
+	 * that something that probably should never work suddenly works.
+	 */
+	self->size2 = self->size1 + self->pagesize;
+	self->addr2 = mremap(self->addr1, self->size1, self->size2, MREMAP_MAYMOVE);
+	ASSERT_EQ(self->addr2, MAP_FAILED);
+}
+
+TEST_F(pfnmap, fork)
+{
+	pid_t pid;
+	int ret;
+
+	/* fork() a child and test if the child can access the pages. */
+	pid = fork();
+	ASSERT_GE(pid, 0);
+
+	if (!pid) {
+		EXPECT_EQ(test_read_access(self->addr1, self->size1,
+					   self->pagesize), 0);
+		exit(0);
+	}
+
+	wait(&ret);
+	if (WIFEXITED(ret))
+		ret = WEXITSTATUS(ret);
+	else
+		ret = -EINVAL;
+	ASSERT_EQ(ret, 0);
+}
+
+TEST_HARNESS_MAIN
diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
index 188b125bf1f6b..dddd1dd8af145 100755
--- a/tools/testing/selftests/mm/run_vmtests.sh
+++ b/tools/testing/selftests/mm/run_vmtests.sh
@@ -63,6 +63,8 @@ separated by spaces:
 	test soft dirty page bit semantics
 - pagemap
 	test pagemap_scan IOCTL
+- pfnmap
+	tests for VM_PFNMAP handling
 - cow
 	test copy-on-write semantics
 - thp
@@ -472,6 +474,8 @@ fi
 
 CATEGORY="pagemap" run_test ./pagemap_ioctl
 
+CATEGORY="pfnmap" run_test ./pfnmap
+
 # COW tests
 CATEGORY="cow" run_test ./cow
 
-- 
2.49.0

