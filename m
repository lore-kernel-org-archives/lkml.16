Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B2D1C695
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 07:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738569248; cv=none; b=qdq5+TpYTP4JxBkRpVw1PQCGiq4P9GSJBRcHdba/LImwCFzbrxwFlcgdkeaUG5p6hzEJHMBISAcFrHxoBhqgniJmr8gi2vyCSVwEKBU39AFX9oEi+DxTUAFyU6xyFsn4wZvOcDdfSJRH/4wQjy4PQ0QhznIM6AYnrCQD6ZLSALA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738569248; c=relaxed/simple;
	bh=1/ET1QniK/lGDuXpeKshr4OrcTc+7UdxvfZJVNIK0CQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LnTje3HSm/SaSdkOOSmktSLTZwMQap4zQitGHDwv/KqdYr55NxopMF4qCBbtftizKHiv6BAfecpKIS2kfrHUg3jlZ40W5GiN8aA8YrnjfIkg7MIPoFJ8rWvqOVZ98Ik9ZV4n5egwSxcWDzepTAbe5/sWDBU/VJcd5/5OviyY28Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RDJ/5XIs; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RDJ/5XIs"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21631789fcdso65727445ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 23:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738569246; x=1739174046; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M07Ozg4FjK4Dc3hgkzc5DkdD23PbJyrA6R8swkgZU7w=;
        b=RDJ/5XIspOj3/qviYXQ9SkwuD9KONp95AO4LX9VHFGZx6bl7eYPdXqBTLHhPQeLJf0
         HxT1brKw1Jbsx/NOJ7NqIjcMGP8GYE9Pc2yuJ0GH9BkYj1IIDfy1u1AvK2V7C5PWo3K8
         jR0HCSbFxgOtWsHtLmVz+6O0H3xH9yhD9mlMquy35q5H+/g5pLTodCdEu5vwcHOCDLbs
         tuMiibmRGW5sPlMyUF1J3DWzRnM61vBcIaMe2TM3SG3pHFAlLqpRWE1Gs3xbvyCRGukD
         N3Cuvab6t2B/D4t5aw58M5bQdYGdDUMtp0DgCqGdQpiwhoJA8PmpAjaX+t8YvsPQPZ/5
         e7wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738569246; x=1739174046;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M07Ozg4FjK4Dc3hgkzc5DkdD23PbJyrA6R8swkgZU7w=;
        b=KULOMv0cjsuCAxllTOBnqYOBq64AtB8u1/YB4EeDgb0/kDR76Jv0j7pgaG5hf7ydRy
         jpCsQ+X2Bz2IYg8moZ5VR60c22TkSmUJu0xVoCe2w9c4ZsYhYjnz8hYpwT0cp4f0m7d9
         RLZUTUhd6hoqvGcfDIFCT271hxNK6ogMggt2z6nSeS8OgRB5C3XNXNVdrAIl2NvkEcc0
         q1gUTaCRWUhlaEHT/KqzuYqJyYqD5UAsJnw33NjEhFkCR2srOOTE0PHrgloHDHx67e8J
         dflwDq7UPDGFTtO49Jo2rQ0q5CAH2xm3zoVyneqxslXug521Gg/zXYR2wqkoSZLrzPjg
         ocUQ==
X-Gm-Message-State: AOJu0Yw91YZkBb09DQJ0syLG9usTV7LnDtOG8WVTOVkhqUbjsvbUnA0p
	DOufItlTLieZ0N5pAwit7EG8PORX72Yr8GfzjaxidBL3hm8UiZT+
X-Gm-Gg: ASbGncs6wJvTucSLy3vr3Kd38Q+uMPcBUW2089uA/3eREBPt1nO39TP2ZJosONoyAa7
	dnduc3jSvCSjU5G+g6GBCZwLXyjRhfzIznB5DnQhIDF4jeJQ//N2Eg3aTEtx79U5DFNpBFPAQ8R
	L4fduMFsoLXgiRf1UcN5oM7rO/9kno17Sw8q+Qub0AWc4rQsq0tokJ1ngcf2IeaAICjerG23DV1
	PPMwt+P//nDIWWKIfkdWXqaAnqA9j1NznYkHyL+zT8JfbSLJzKj5ulrYz3nmc7s8JiXBj4lXmjm
	dT87+BWdnGVmuqtPcW5v
X-Google-Smtp-Source: AGHT+IHiFJcspredxC1OrQ4t3mXJ9+rbLrwd9wCbpG2d3U3aUJb9WQO63wzw0uzi7OKtH3AaKahv6Q==
X-Received: by 2002:a05:6a21:9004:b0:1e1:e2d8:fd4a with SMTP id adf61e73a8af0-1ed872fe623mr26602492637.5.1738569246446;
        Sun, 02 Feb 2025 23:54:06 -0800 (PST)
Received: from eleanor-wkdl.. ([140.116.96.205])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe6a18ca6sm7882441b3a.175.2025.02.02.23.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 23:54:05 -0800 (PST)
From: Yu-Chun Lin <eleanor15x@gmail.com>
To: akpm@linux-foundation.org,
	skhan@linuxfoundation.org,
	davidgow@google.com
Cc: linux-kernel@vger.kernel.org,
	luis.hernandez093@gmail.com,
	jserv@ccns.ncku.edu.tw,
	visitorckw@gmail.com,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH] lib/math: Add Kunit test suite for gcd()
Date: Mon,  3 Feb 2025 15:54:00 +0800
Message-ID: <20250203075400.3431330-1-eleanor15x@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a KUnit test suite for the gcd() function.
This test suite verifies the correctness of gcd() across various
scenarios, including edge cases.

Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
---
 lib/Kconfig.debug          | 13 +++++++++
 lib/math/Makefile          |  3 +-
 lib/math/tests/Makefile    |  1 +
 lib/math/tests/gcd_kunit.c | 56 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 72 insertions(+), 1 deletion(-)
 create mode 100644 lib/math/tests/gcd_kunit.c

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 775966cf6114..66b04683a3b6 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -3211,6 +3211,19 @@ config INT_SQRT_KUNIT_TEST
 
 	  If unsure, say N
 
+config GCD_KUNIT_TEST
+	tristate "Greatest common divisor test" if !KUNIT_ALL_TESTS
+	depends on KUNIT
+	default KUNIT_ALL_TESTS
+	help
+	  This option enables the KUnit test suite for the gcd() function,
+	  which computes the greatest common divisor of two numbers.
+
+	  This test suite verifies the correctness of gcd() across various
+	  scenarios, including edge cases.
+
+	  If unsure, say N
+
 endif # RUNTIME_TESTING_MENU
 
 config ARCH_USE_MEMTEST
diff --git a/lib/math/Makefile b/lib/math/Makefile
index 853f023ae537..3484078177af 100644
--- a/lib/math/Makefile
+++ b/lib/math/Makefile
@@ -9,4 +9,5 @@ obj-$(CONFIG_INT_POW_TEST)  += tests/int_pow_kunit.o
 obj-$(CONFIG_TEST_DIV64)	+= test_div64.o
 obj-$(CONFIG_TEST_MULDIV64)	+= test_mul_u64_u64_div_u64.o
 obj-$(CONFIG_RATIONAL_KUNIT_TEST) += rational-test.o
-obj-$(CONFIG_INT_SQRT_KUNIT_TEST) += tests/int_sqrt_kunit.o
\ No newline at end of file
+obj-$(CONFIG_INT_SQRT_KUNIT_TEST) += tests/int_sqrt_kunit.o
+obj-$(CONFIG_GCD_KUNIT_TEST) += tests/gcd_kunit.o
diff --git a/lib/math/tests/Makefile b/lib/math/tests/Makefile
index e1a79f093b2d..6a04b4eb22b6 100644
--- a/lib/math/tests/Makefile
+++ b/lib/math/tests/Makefile
@@ -2,3 +2,4 @@
 
 obj-$(CONFIG_INT_POW_TEST) += int_pow_kunit.o
 obj-$(CONFIG_INT_SQRT_KUNIT_TEST) += int_sqrt_kunit.o
+obj-$(CONFIG_GCD_KUNIT_TEST) += gcd_kunit.o
diff --git a/lib/math/tests/gcd_kunit.c b/lib/math/tests/gcd_kunit.c
new file mode 100644
index 000000000000..ede1883583b1
--- /dev/null
+++ b/lib/math/tests/gcd_kunit.c
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <kunit/test.h>
+#include <linux/gcd.h>
+#include <linux/limits.h>
+
+struct test_case_params {
+	unsigned long val1;
+	unsigned long val2;
+	unsigned long expected_result;
+	const char *name;
+};
+
+static const struct test_case_params params[] = {
+	{ 48, 18, 6, "GCD of 48 and 18" },
+	{ 18, 48, 6, "GCD of 18 and 48" },
+	{ 56, 98, 14, "GCD of 56 and 98" },
+	{ 17, 13, 1, "Coprime numbers" },
+	{ 101, 103, 1, "Coprime numbers" },
+	{ 270, 192, 6, "GCD of 270 and 192" },
+	{ 0, 5, 5, "GCD with zero" },
+	{ 7, 0, 7, "GCD with zero reversed" },
+	{ 36, 36, 36, "GCD of identical numbers" },
+	{ ULONG_MAX, 1, 1, "GCD of max ulong and 1" },
+	{ ULONG_MAX, ULONG_MAX, ULONG_MAX, "GCD of max ulong values" },
+};
+
+static void get_desc(const struct test_case_params *tc, char *desc)
+{
+	strscpy(desc, tc->name, KUNIT_PARAM_DESC_SIZE);
+}
+
+KUNIT_ARRAY_PARAM(gcd, params, get_desc);
+
+static void gcd_test(struct kunit *test)
+{
+	const struct test_case_params *tc = (const struct test_case_params *)test->param_value;
+
+	KUNIT_EXPECT_EQ(test, tc->expected_result, gcd(tc->val1, tc->val2));
+}
+
+static struct kunit_case math_gcd_test_cases[] = {
+	KUNIT_CASE_PARAM(gcd_test, gcd_gen_params),
+	{}
+};
+
+static struct kunit_suite gcd_test_suite = {
+	.name = "math-gcd",
+	.test_cases = math_gcd_test_cases,
+};
+
+kunit_test_suite(gcd_test_suite);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("math.gcd KUnit test suite");
+MODULE_AUTHOR("Yu-Chun Lin <eleanor15x@gmail.com>");
-- 
2.43.0

