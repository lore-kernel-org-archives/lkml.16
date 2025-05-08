Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0489321FF3C
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 22:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746742852; cv=none; b=N5RB3+f7aT65w147vp+D159HhC7+QN6QrkhlXI3nEexZA+uaI2X8hAcEhTQIQeG8ZIchGOVt98zWhFitUpP9lPkAtkXsslTmLi7EYTJaHaZzVkj0qZ782Fv+JHigIncXLK0lrjBJQlW9NCapEbWNqhNDa6pKNSslfLtlP2Nrq2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746742852; c=relaxed/simple;
	bh=S+0b52l2Fqjnu/cRKenxGsypkbJnpIawppBpGhxfSbE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PQMGAFH4lm8Ru4SQpe70GF/4b867jDkLNoHpTt0TQempGSNLwplniQP0pvK0Mqo6605Vnh5Jl54WyhvlZi9swj1xeiY+/OrgnGgljp3i5dXttUA61NCrV8LcilaJBYrmD1UmvvUhTd0gFg8iyxbiVJxaQDkE4BULPI4PcEqk7Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FBb7LhH4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FBb7LhH4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746742845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8oSlQOGx5PSAeVG5B2JhkthMK6xKfNEYwRdVE1GMRZ4=;
	b=FBb7LhH4xA2Lx/zCriFmMwzpYWNgxBCKOwo7ACgPgLPfejWXZlk04Dwrpr7LC4pNDTDJR7
	qH6uxCnvp2qEW0hNz8zHSN3aoB55jt9RHfpAq4penjlMVNJjtjw+FcooyASmwTc/XvqvdQ
	/TEp+CI3H950mTVNyD5piAnVx/iJGrY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-349-q5IpE_PaMNi_0oKvCTcSoQ-1; Thu, 08 May 2025 18:20:44 -0400
X-MC-Unique: q5IpE_PaMNi_0oKvCTcSoQ-1
X-Mimecast-MFC-AGG-ID: q5IpE_PaMNi_0oKvCTcSoQ_1746742843
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43cf172ffe1so9828595e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 15:20:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746742843; x=1747347643;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8oSlQOGx5PSAeVG5B2JhkthMK6xKfNEYwRdVE1GMRZ4=;
        b=W9EIb0oA+lIyJEc8IwTB44oCoWHe2MzKOgB3NL7ZZh5N5A0UQbEOPHXsPQQoJxuHGP
         zZUQigV+7uG7UDgZqkzrwwtMEOh6DSCfVae7dfGyD+iQKMfC4A6Yy5pKnK9hqE41q4E3
         C/1l2aE41dbxWpwGSj8IOmqgI+oxh8I/JxoWXHo592/lg8fkfiyBDhR9aF7B8XfTr7hp
         1gp9z4dN2UfC89mLNayqW2r5fSVpTs+yNB/jUGkdyD9bNVp8XZsy5ewo9bDAcheU0MP4
         sYA4dVKGQSz8dj5yy09UlG2xVBYHjwwXL0P/UbOTOIobJG+f+/q4RFlenTR3K7ZJ4R5m
         YDew==
X-Gm-Message-State: AOJu0YyK7ioXiwmjsHCgWQWX1FxMzrJi6hMN9ZE1XdE+8tpC6NzKvZr6
	+Pk06iuNFQ+q62GnJ931W7sJCmMGYnTv8CujP8rXOlSh7Esa0qKuWMIF6yY93uikmofjQzY3IIQ
	lQ5E5JqmvcrncDd3OpSR5E66SWMGDSzhAUgkvP6wEkXUget7MG8sNqNPt8rWa1+G/nJRX4cQZS7
	vyoyx5vEkA87AlJO5o9j64klzimXYkzU/JiNBW/E2dYA==
X-Gm-Gg: ASbGncvdcxcqYK+/M+v4NClrTImCjOAFPPIGmPqVjH77UXLqKvkiFqAN6MXUhbhNvse
	09Y4ZwWVY6t95qZBxM+ULaeInBDED+9ar8XZHpVLvEED3IMd10Cy9YiEl7fvS/tU5DnFdjnQAr0
	/9JqrtFmtqT8qT42vgNBNYKHxoq/lrdAfaQ+bEzCU0iziboi/2RwEYfrzyYo7bRyAylToyGMNM4
	9v6AyGHHLDdwK1ZDmAWkLnFTYxLCitJsDuVQL5HDxqWRL4eG/63yL/nNLadMjwloK2FYvtZ6LRh
	Y9nfddEWttPgVdGHvdZBLK/ADEa/tZOdPh8TYj6vpwFQ2DeDVsjaW9/OBs6zANYf1xMwgE/L
X-Received: by 2002:a5d:59ae:0:b0:391:2c67:798f with SMTP id ffacd0b85a97d-3a1f64b5771mr893894f8f.41.1746742843099;
        Thu, 08 May 2025 15:20:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExtd4XQA/4NBIzZFkMCTxyRAAu0Q9sQeHtqaKbIjLYrVZYxEpbgKVOcMDojh/vgVIQ4jquVw==
X-Received: by 2002:a5d:59ae:0:b0:391:2c67:798f with SMTP id ffacd0b85a97d-3a1f64b5771mr893877f8f.41.1746742842698;
        Thu, 08 May 2025 15:20:42 -0700 (PDT)
Received: from localhost (p200300d82f3e590027aa5f4ab65c3d3c.dip0.t-ipconnect.de. [2003:d8:2f3e:5900:27aa:5f4a:b65c:3d3c])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a1f58ebd6asm1231706f8f.35.2025.05.08.15.20.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 15:20:42 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Xu <peterx@redhat.com>
Subject: [PATCH v1] selftests/mm: add simple VM_PFNMAP tests based on mmap'ing /dev/mem
Date: Fri,  9 May 2025 00:20:41 +0200
Message-ID: <20250508222041.1647645-1-david@redhat.com>
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
	1..19
	ok 1 madvise(MADV_DONTNEED) should be disallowed
	ok 2 madvise(MADV_DONTNEED_LOCKED) should be disallowed
	ok 3 madvise(MADV_FREE) should be disallowed
	ok 4 madvise(MADV_WIPEONFORK) should be disallowed
	ok 5 madvise(MADV_COLD) should be disallowed
	ok 6 madvise(MADV_PAGEOUT) should be disallowed
	ok 7 madvise(MADV_POPULATE_READ) should be disallowed
	ok 8 madvise(MADV_POPULATE_WRITE) should be disallowed
	ok 9 munmap() splitting
	ok 10 mmap() after splitting
	ok 11 mremap(MREMAP_FIXED)
	ok 12 mremap() shrinking
	ok 13 mremap() growing should be disallowed
	ok 14 mprotect(PROT_NONE)
	ok 15 SIGSEGV expected
	ok 16 mprotect(PROT_READ)
	ok 17 SIGSEGV not expected
	ok 18 fork()
	ok 19 SIGSEGV in child not expected
	# Totals: pass:19 fail:0 xfail:0 xpass:0 skip:0 error:0

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
Signed-off-by: David Hildenbrand <david@redhat.com>
---

On current mm-unstable, the MADV_POPULATE_READ test fails because
mm-unstable contains a patch [1] that must be dropped.

[1] https://lore.kernel.org/all/20250507154105.763088-2-p.antoniou@partner.samsung.com/

---
 tools/testing/selftests/mm/Makefile |   1 +
 tools/testing/selftests/mm/pfnmap.c | 278 ++++++++++++++++++++++++++++
 2 files changed, 279 insertions(+)
 create mode 100644 tools/testing/selftests/mm/pfnmap.c

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
index 0000000000000..59be2f3221124
--- /dev/null
+++ b/tools/testing/selftests/mm/pfnmap.c
@@ -0,0 +1,278 @@
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
+#include "../kselftest.h"
+#include "vm_util.h"
+
+static size_t pagesize;
+static int pagemap_fd;
+static int dev_mem_fd;
+static sigjmp_buf env;
+
+static void signal_handler(int sig)
+{
+	if (sig == SIGSEGV)
+		siglongjmp(env, 1);
+	siglongjmp(env, 2);
+}
+
+static void sense_support(void)
+{
+	char *addr, tmp;
+	int ret;
+
+	dev_mem_fd = open("/dev/mem", O_RDONLY);
+	if (dev_mem_fd < 0)
+		ksft_exit_skip("Cannot open '/dev/mem': %s\n", strerror(errno));
+
+	/* We'll require the first two pages throughout our tests ... */
+	addr = mmap(0, pagesize * 2, PROT_READ, MAP_SHARED, dev_mem_fd, 0);
+	if (addr == MAP_FAILED)
+		ksft_exit_skip("Cannot mmap '/dev/mem'");
+
+	/* ... and want to be able to read from them. */
+	ret = sigsetjmp(env, 1);
+	if (!ret) {
+		tmp = *addr + *(addr + pagesize);
+		asm volatile("" : "+r" (tmp));
+	}
+	if (ret)
+		ksft_exit_skip("Cannot read-access mmap'ed '/dev/mem'");
+
+	munmap(addr, pagesize * 2);
+}
+
+static void test_madvise(void)
+{
+#define INIT_ADVICE(nr) { nr, #nr}
+	const struct {
+		int nr;
+		const char *name;
+	} advices[] = {
+		INIT_ADVICE(MADV_DONTNEED),
+		INIT_ADVICE(MADV_DONTNEED_LOCKED),
+		INIT_ADVICE(MADV_FREE),
+		INIT_ADVICE(MADV_WIPEONFORK),
+		INIT_ADVICE(MADV_COLD),
+		INIT_ADVICE(MADV_PAGEOUT),
+		INIT_ADVICE(MADV_POPULATE_READ),
+		INIT_ADVICE(MADV_POPULATE_WRITE),
+	};
+	char *addr;
+	int ret, i;
+
+	addr = mmap(0, pagesize, PROT_READ, MAP_SHARED, dev_mem_fd, 0);
+	if (addr == MAP_FAILED)
+		ksft_exit_fail_msg("mmap() failed: %s\n", strerror(errno));
+
+	/* All these advices must be rejected. */
+	for (i = 0; i < ARRAY_SIZE(advices); i++) {
+		ret = madvise(addr, pagesize, advices[i].nr);
+		ksft_test_result(ret && errno == EINVAL,
+				 "madvise(%s) should be disallowed\n",
+				 advices[i].name);
+	}
+
+	munmap(addr, pagesize);
+}
+
+static void test_munmap_splitting(void)
+{
+	char *addr1, *addr2;
+	int ret;
+
+	addr1 = mmap(0, pagesize * 2, PROT_READ, MAP_SHARED, dev_mem_fd, 0);
+	if (addr1 == MAP_FAILED)
+		ksft_exit_fail_msg("mmap() failed: %s\n", strerror(errno));
+
+	/* Unmap the first pages. */
+	ret = munmap(addr1, pagesize);
+	ksft_test_result(!ret, "munmap() splitting\n");
+
+	/* Remap the first page while the second page is still mapped. */
+	addr2 = mmap(0, pagesize, PROT_READ, MAP_SHARED, dev_mem_fd, 0);
+	ksft_test_result(addr2 != MAP_FAILED, "mmap() after splitting\n");
+
+	if (addr2 != MAP_FAILED)
+		munmap(addr2, pagesize);
+	if (!ret)
+		munmap(addr1 + pagesize, pagesize);
+	else
+		munmap(addr1, pagesize * 2);
+}
+
+static void test_mremap_fixed(void)
+{
+	char *addr, *new_addr, *ret;
+
+	addr = mmap(0, pagesize * 2, PROT_READ, MAP_SHARED, dev_mem_fd, 0);
+	if (addr == MAP_FAILED)
+		ksft_exit_fail_msg("mmap() failed: %s\n", strerror(errno));
+
+	/* Reserve a destination area. */
+	new_addr = mmap(0, pagesize * 2, PROT_READ, MAP_ANON | MAP_PRIVATE, -1, 0);
+	if (new_addr == MAP_FAILED)
+		ksft_exit_fail_msg("mmap() failed: %s\n", strerror(errno));
+
+	/* mremap() over our destination. */
+	ret = mremap(addr, pagesize * 2, pagesize * 2,
+		     MREMAP_FIXED | MREMAP_MAYMOVE, new_addr);
+	ksft_test_result(ret == new_addr, "mremap(MREMAP_FIXED)\n");
+	if (ret != new_addr)
+		munmap(new_addr, pagesize * 2);
+	munmap(addr, pagesize * 2);
+}
+
+static void test_mremap_shrinking(void)
+{
+	char *addr, *ret;
+
+	addr = mmap(0, pagesize * 2, PROT_READ, MAP_SHARED, dev_mem_fd, 0);
+	if (addr == MAP_FAILED)
+		ksft_exit_fail_msg("mmap() failed: %s\n", strerror(errno));
+
+	/* Shrinking is expected to work. */
+	ret = mremap(addr, pagesize * 2, pagesize, 0);
+	ksft_test_result(ret == addr, "mremap() shrinking\n");
+	if (ret != addr)
+		munmap(addr, pagesize * 2);
+	else
+		munmap(addr, pagesize);
+}
+
+static void test_mremap_growing(void)
+{
+	char *addr, *ret;
+
+	addr = mmap(0, pagesize, PROT_READ, MAP_SHARED, dev_mem_fd, 0);
+	if (addr == MAP_FAILED)
+		ksft_exit_fail_msg("mmap() failed: %s\n", strerror(errno));
+
+	/* Growing is not expected to work. */
+	ret = mremap(addr, pagesize, pagesize * 2, MREMAP_MAYMOVE);
+	ksft_test_result(ret == MAP_FAILED,
+			 "mremap() growing should be disallowed\n");
+	if (ret == MAP_FAILED)
+		munmap(addr, pagesize);
+	else
+		munmap(ret, pagesize * 2);
+}
+
+static void test_mprotect(void)
+{
+	char *addr, tmp;
+	int ret;
+
+	addr = mmap(0, pagesize, PROT_READ, MAP_SHARED, dev_mem_fd, 0);
+	if (addr == MAP_FAILED)
+		ksft_exit_fail_msg("mmap() failed: %s\n", strerror(errno));
+
+	/* With PROT_NONE, read access must result in SIGSEGV. */
+	ret = mprotect(addr, pagesize, PROT_NONE);
+	ksft_test_result(!ret, "mprotect(PROT_NONE)\n");
+
+	ret = sigsetjmp(env, 1);
+	if (!ret) {
+		tmp = *addr;
+		asm volatile("" : "+r" (tmp));
+	}
+	ksft_test_result(ret == 1, "SIGSEGV expected\n");
+
+	/* With PROT_READ, read access must again succeed. */
+	ret = mprotect(addr, pagesize, PROT_READ);
+	ksft_test_result(!ret, "mprotect(PROT_READ)\n");
+
+	ret = sigsetjmp(env, 1);
+	if (!ret) {
+		tmp = *addr;
+		asm volatile("" : "+r" (tmp));
+	}
+	ksft_test_result(!ret, "SIGSEGV not expected\n");
+
+	munmap(addr, pagesize);
+}
+
+static void test_fork(void)
+{
+	char *addr, tmp;
+	int ret;
+
+	addr = mmap(0, pagesize, PROT_READ, MAP_SHARED, dev_mem_fd, 0);
+	if (addr == MAP_FAILED)
+		ksft_exit_fail_msg("mmap() failed: %s\n", strerror(errno));
+
+	/* fork() a child and test if the child can access the page. */
+	ret = fork();
+	if (ret < 0) {
+		ksft_test_result_fail("fork()\n");
+		goto out;
+	} else if (!ret) {
+		ret = sigsetjmp(env, 1);
+		if (!ret) {
+			tmp = *addr;
+			asm volatile("" : "+r" (tmp));
+		}
+		/* Return the result to the parent. */
+		exit(ret);
+	}
+	ksft_test_result_pass("fork()\n");
+
+	/* Wait for our child and obtain the result. */
+	wait(&ret);
+	if (WIFEXITED(ret))
+		ret = WEXITSTATUS(ret);
+	else
+		ret = -EINVAL;
+
+	ksft_test_result(!ret, "SIGSEGV in child not expected\n");
+out:
+	munmap(addr, pagesize);
+}
+
+int main(int argc, char **argv)
+{
+	int err;
+
+	ksft_print_header();
+	ksft_set_plan(19);
+
+	pagesize = getpagesize();
+	pagemap_fd = open("/proc/self/pagemap", O_RDONLY);
+	if (pagemap_fd < 0)
+		ksft_exit_fail_msg("opening pagemap failed\n");
+	if (signal(SIGSEGV, signal_handler) == SIG_ERR)
+		ksft_exit_fail_msg("signal() failed: %s\n", strerror(errno));
+
+	sense_support();
+	test_madvise();
+	test_munmap_splitting();
+	test_mremap_fixed();
+	test_mremap_shrinking();
+	test_mremap_growing();
+	test_mprotect();
+	test_fork();
+
+	err = ksft_get_fail_cnt();
+	if (err)
+		ksft_exit_fail_msg("%d out of %d tests failed\n",
+				   err, ksft_test_num());
+	ksft_exit_pass();
+}
-- 
2.49.0

