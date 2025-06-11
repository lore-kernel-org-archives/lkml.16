Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8478A267397;
	Wed, 11 Jun 2025 09:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749634889; cv=none; b=QHJDD4FgguOF3nGITqejEGYmCt0auqP6rGwdK4FD8DUNlUGvwZDSdewdY5w0JqgBsc7GdhyF45Zxzqh+a7mlZ4JmB+d8vcX6bVSDa3MSG6Z/lHf1u6fVmcsYKgyK1ITRvE0Xu58IIXiFbn+ia85Lreuw8xQuqkFSd03AeUNs1FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749634889; c=relaxed/simple;
	bh=iv6MYvhlW3BK16o66NV8jwqGFMdhNfA4PXGg9HIY6eY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C3mftS7dSFyMer3cfiXMIKKhCbWTw5CUk26EQ982Douy/pD5sWVvKAdr5UZcBYGq5u3IoFfSjk/e+XJPHeckBuvWwgsaXNkgNFFplp7MK0i6sSMGeZTOTi1S2T0ChnNRlJvCir9FTYt4MtOBUIHhXXs1yhV1Co0C5AD4BlhtSH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F5E826AC;
	Wed, 11 Jun 2025 02:41:07 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A1D1F3F59E;
	Wed, 11 Jun 2025 02:41:24 -0700 (PDT)
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
Subject: [PATCH v6 6/9] kselftest/arm64/mte: add address tag related macro and function
Date: Wed, 11 Jun 2025 10:41:04 +0100
Message-Id: <20250611094107.928457-7-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250611094107.928457-1-yeoreum.yun@arm.com>
References: <20250611094107.928457-1-yeoreum.yun@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add address tag related macro and function to test MTE_FAR feature.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 .../testing/selftests/arm64/mte/mte_common_util.c  | 14 ++++++++++++++
 .../testing/selftests/arm64/mte/mte_common_util.h  |  2 ++
 tools/testing/selftests/arm64/mte/mte_def.h        |  8 ++++++++
 3 files changed, 24 insertions(+)

diff --git a/tools/testing/selftests/arm64/mte/mte_common_util.c b/tools/testing/selftests/arm64/mte/mte_common_util.c
index 048b8a507b70..c21f86143a6f 100644
--- a/tools/testing/selftests/arm64/mte/mte_common_util.c
+++ b/tools/testing/selftests/arm64/mte/mte_common_util.c
@@ -131,6 +131,20 @@ void mte_clear_tags(void *ptr, size_t size)
 	mte_clear_tag_address_range(ptr, size);
 }
 
+void *mte_insert_atag(void *ptr)
+{
+	unsigned char atag;
+
+	srandom(time(NULL));
+	atag =  mtefar_support ? (random() % MT_ATAG_MASK) + 1 : 0;
+	return (void *)MT_SET_ATAG((unsigned long)ptr, atag);
+}
+
+void *mte_clear_atag(void *ptr)
+{
+	return (void *)MT_CLEAR_ATAG((unsigned long)ptr);
+}
+
 static void *__mte_allocate_memory_range(size_t size, int mem_type, int mapping,
 					 size_t range_before, size_t range_after,
 					 bool tags, int fd)
diff --git a/tools/testing/selftests/arm64/mte/mte_common_util.h b/tools/testing/selftests/arm64/mte/mte_common_util.h
index 4e1dd959df9b..045e4ad2f018 100644
--- a/tools/testing/selftests/arm64/mte/mte_common_util.h
+++ b/tools/testing/selftests/arm64/mte/mte_common_util.h
@@ -56,6 +56,8 @@ void mte_free_memory_tag_range(void *ptr, size_t size, int mem_type,
 			       size_t range_before, size_t range_after);
 void *mte_insert_tags(void *ptr, size_t size);
 void mte_clear_tags(void *ptr, size_t size);
+void *mte_insert_atag(void *ptr);
+void *mte_clear_atag(void *ptr);
 int mte_default_setup(void);
 void mte_restore_setup(void);
 int mte_switch_mode(int mte_option, unsigned long incl_mask);
diff --git a/tools/testing/selftests/arm64/mte/mte_def.h b/tools/testing/selftests/arm64/mte/mte_def.h
index 9b188254b61a..6ad22f07c9b8 100644
--- a/tools/testing/selftests/arm64/mte/mte_def.h
+++ b/tools/testing/selftests/arm64/mte/mte_def.h
@@ -42,6 +42,8 @@
 #define MT_TAG_COUNT		16
 #define MT_INCLUDE_TAG_MASK	0xFFFF
 #define MT_EXCLUDE_TAG_MASK	0x0
+#define MT_ATAG_SHIFT		60
+#define MT_ATAG_MASK		0xFUL
 
 #define MT_ALIGN_GRANULE	(MT_GRANULE_SIZE - 1)
 #define MT_CLEAR_TAG(x)		((x) & ~(MT_TAG_MASK << MT_TAG_SHIFT))
@@ -49,6 +51,12 @@
 #define MT_FETCH_TAG(x)		((x >> MT_TAG_SHIFT) & (MT_TAG_MASK))
 #define MT_ALIGN_UP(x)		((x + MT_ALIGN_GRANULE) & ~(MT_ALIGN_GRANULE))
 
+#define MT_CLEAR_ATAG(x)	((x) & ~(MT_TAG_MASK << MT_ATAG_SHIFT))
+#define MT_SET_ATAG(x, y)	((x) | (((y) & MT_ATAG_MASK) << MT_ATAG_SHIFT))
+#define MT_FETCH_ATAG(x)	((x >> MT_ATAG_SHIFT) & (MT_ATAG_MASK))
+
+#define MT_CLEAR_TAGS(x) 	(MT_CLEAR_ATAG(MT_CLEAR_TAG(x)))
+
 #define MT_PSTATE_TCO_SHIFT	25
 #define MT_PSTATE_TCO_MASK	~(0x1 << MT_PSTATE_TCO_SHIFT)
 #define MT_PSTATE_TCO_EN	1
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}

