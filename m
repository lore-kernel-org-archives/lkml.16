Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11DFB1F790F;
	Wed, 18 Jun 2025 04:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750219976; cv=none; b=GtQk72Z3haTTPtmUUkcjJGhrZU4xHQz84rnIhOS1cQhXJE/L0o3sCYwI76IjqgGhFbxD3YXWrGJLOlfBYTWihJJCEOiCyjLxx3alxYZ2tKUs1AUDBeSOnlUrP7sFcTY8wmyYrj5BWEnZPVYwNPQN8hYGYw6VR/56iVnoG5LUwvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750219976; c=relaxed/simple;
	bh=98rJ1//QewKdzC2N/A+aPXJWkJN6PClky/lBVKr74Z8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Lpu7AEGGTMMPjBi8alVHzpR714zRtR2M/45qOrRZLNgQ8IJU20k64cFY3bTg0HYDvFYzjOxdmvD62ikMQAJmFmflL9mEyp5LzjvU0NPX2z6l8wXELwV6zD4SUDhyLFlLj+iy84Ns/C+2NeYdtpEZUKi1qwt6jGp9GSSP1dfzrQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 74E7A14BF;
	Tue, 17 Jun 2025 21:12:33 -0700 (PDT)
Received: from a076716.blr.arm.com (a076716.blr.arm.com [10.164.21.47])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id ABF7D3F66E;
	Tue, 17 Jun 2025 21:12:50 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [RFC 2/2] kunit: printf: Add test case for pte_t
Date: Wed, 18 Jun 2025 09:42:35 +0530
Message-Id: <20250618041235.1716143-3-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250618041235.1716143-1-anshuman.khandual@arm.com>
References: <20250618041235.1716143-1-anshuman.khandual@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds a new test case for pte_t printf format.

Cc: Petr Mladek <pmladek@suse.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 lib/tests/printf_kunit.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/lib/tests/printf_kunit.c b/lib/tests/printf_kunit.c
index bc54cca2d7a6f..d94c5067e8b0d 100644
--- a/lib/tests/printf_kunit.c
+++ b/lib/tests/printf_kunit.c
@@ -763,6 +763,31 @@ errptr(struct kunit *kunittest)
 #endif
 }
 
+struct pte_test {
+	u64 val;
+	const char *name;
+};
+
+static struct pte_test pte_test_cases[] = {
+	{ .val = 0xc0ffee,      .name = "0x00c0ffee"},
+	{ .val = 0xdeadbeef,    .name = "0xdeadbeef"},
+	{ .val = 0xaabbcc,      .name = "0x00aabbcc"},
+};
+
+static void
+pte(struct kunit *kunittest)
+{
+	char buf[64];
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(pte_test_cases); i++) {
+		pte_t pte = __pte(pte_test_cases[i].val);
+
+		snprintf(buf, sizeof(buf), "%ppte", &pte);
+		KUNIT_EXPECT_STREQ(kunittest, buf, pte_test_cases[i].name);
+	}
+}
+
 static int printf_suite_init(struct kunit_suite *suite)
 {
 	total_tests = 0;
@@ -811,6 +836,7 @@ static struct kunit_case printf_test_cases[] = {
 	KUNIT_CASE(errptr),
 	KUNIT_CASE(fwnode_pointer),
 	KUNIT_CASE(fourcc_pointer),
+	KUNIT_CASE(pte),
 	{}
 };
 
-- 
2.30.2

