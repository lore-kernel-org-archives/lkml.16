Received: from out30-133.freemail.mail.aliyun.com (out30-133.freemail.mail.aliyun.com [115.124.30.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1479823BFA6
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 11:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744025508; cv=none; b=OBRqP/qCT/ZrT1pXlfxLJ8IuIRbWlNQ5QomKOjZxKjp6+goz5iDIZ45z/laLdo/Kw0g5TFB1H7uxKezREh9/6+9HQ2UyEgPquk4inEtlu9hzi6vFbntK3Oq83087f6ncy50JpAdWukcCYa80Gtdh4VY7n1MvMhuUwy6BvUmvNBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744025508; c=relaxed/simple;
	bh=P8mt0ab5TtxC8c8bHOnrbNtXbWnn15ZLGu9xpgcauKE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RnlXf2aqZEezkQi/IrtVIjFUxBzL0glyu8jzE1ChloNqMCmeWNP1Yvl+O00jgv1lXm/LRz57/BuoHBIRFC/NXE4aIcABu39plg72hf0SvKEkVNCpZ0YGLA8lwqFfUJAxnzFiN15tEf7m7W0KdB/SLhsNDfr6VbNMmmI0aQUxEcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=HbbSmBFg; arc=none smtp.client-ip=115.124.30.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="HbbSmBFg"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1744025500; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=NoR+jnV8vnFcnLEbN4HTkH2CWtR7FahKRF30+nlnMyQ=;
	b=HbbSmBFgHMee5b9tNNdEqqDVjyqBe5iBbxQO/aPAodAEwxpSLLE8tYfdelwlYO2nrywqQhEXz4RyzzyBC1/Hq2UESdcNgz3gC2J3IdZivq22GNu6Q+VNEOX9+XYkl/3p7BNiWb+Uf3SzQ3NVQbuF/GppOET0UHbXHOwXPUe+Zfc=
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WVvlCKt_1744025500 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 07 Apr 2025 19:31:40 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: akpm@linux-foundation.org,
	hughd@google.com
Cc: willy@infradead.org,
	david@redhat.com,
	21cnbao@gmail.com,
	ryan.roberts@arm.com,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] selftests: mincore: fix tmpfs mincore test failure
Date: Mon,  7 Apr 2025 19:31:35 +0800
Message-ID: <9a00856cc6a8b4e46f4ab8b1af11ce5fc1a31851.1744025467.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When running mincore test cases, I encountered the following failures:

"
mincore_selftest.c:359:check_tmpfs_mmap:Expected ra_pages (511) == 0 (0)
mincore_selftest.c:360:check_tmpfs_mmap:Read-ahead pages found in memory
check_tmpfs_mmap: Test terminated by assertion
          FAIL  global.check_tmpfs_mmap
not ok 5 global.check_tmpfs_mmap
FAILED: 4 / 5 tests passed
"

The reason for the test case failure is that my system automatically enabled
tmpfs large folio allocation by adding the 'transparent_hugepage_tmpfs=always'
cmdline. However, the test case still expects the tmpfs mounted on /dev/shm to
allocate small folios, which leads to assertion failures when verifying readahead
pages.

As discussed with David, there's no reason to continue checking the readahead
logic for tmpfs. Drop it to fix this issue.

Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
Changes from v1:
 - Drop the readahead logic check, per David.
---
 .../testing/selftests/mincore/mincore_selftest.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/tools/testing/selftests/mincore/mincore_selftest.c b/tools/testing/selftests/mincore/mincore_selftest.c
index e949a43a6145..0fd4b00bd345 100644
--- a/tools/testing/selftests/mincore/mincore_selftest.c
+++ b/tools/testing/selftests/mincore/mincore_selftest.c
@@ -286,8 +286,7 @@ TEST(check_file_mmap)
 
 /*
  * Test mincore() behavior on a page backed by a tmpfs file.  This test
- * performs the same steps as the previous one. However, we don't expect
- * any readahead in this case.
+ * performs the same steps as the previous one.
  */
 TEST(check_tmpfs_mmap)
 {
@@ -298,7 +297,6 @@ TEST(check_tmpfs_mmap)
 	int page_size;
 	int fd;
 	int i;
-	int ra_pages = 0;
 
 	page_size = sysconf(_SC_PAGESIZE);
 	vec_size = FILE_SIZE / page_size;
@@ -341,8 +339,7 @@ TEST(check_tmpfs_mmap)
 	}
 
 	/*
-	 * Touch a page in the middle of the mapping. We expect only
-	 * that page to be fetched into memory.
+	 * Touch a page in the middle of the mapping.
 	 */
 	addr[FILE_SIZE / 2] = 1;
 	retval = mincore(addr, FILE_SIZE, vec);
@@ -351,15 +348,6 @@ TEST(check_tmpfs_mmap)
 		TH_LOG("Page not found in memory after use");
 	}
 
-	i = FILE_SIZE / 2 / page_size + 1;
-	while (i < vec_size && vec[i]) {
-		ra_pages++;
-		i++;
-	}
-	ASSERT_EQ(ra_pages, 0) {
-		TH_LOG("Read-ahead pages found in memory");
-	}
-
 	munmap(addr, FILE_SIZE);
 	close(fd);
 	free(vec);
-- 
2.43.5

