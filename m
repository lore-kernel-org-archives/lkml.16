Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0C64C83
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 00:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745540908; cv=none; b=KuBfssiyEXV4Ofsk2hoih3PeICrBUzIc+Uni/Pcjluupl6Zbx7HDzbQEr4KTiNMvHc45oMZvflw4PKVJU/GRYqLZvsjpWzu+MgFStX9INSwQHq99jVdueKiq+4ti4s9fH/9TbHtkKAfF1hI9OzYpV3j7wMyumMIJn5VnCdphh64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745540908; c=relaxed/simple;
	bh=U7zgE6IzCLrPpMWVpq2+GUdcrSUMCh/2FsvZ9huMwiU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FlxK5CxIHem5DFbvoUvCjGGqoLN5LDQwkj3iYQzqy2xrNzPPVijEuLIL3yO28wpqAuRTvPzHoWYWGyAeDL4q5as21X88c+rE9ti7Oizs1F4FyyBoy4JBUMkr/1gYooTgALrfAurSD/XgcP65j9/EN/PijbFjo2c+2rbB2JseU3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pDD94DMu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pDD94DMu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CAE2C4CEE3;
	Fri, 25 Apr 2025 00:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745540907;
	bh=U7zgE6IzCLrPpMWVpq2+GUdcrSUMCh/2FsvZ9huMwiU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pDD94DMuI6yfRWD9cmdPc0YuEwZqo+Fc1GKv9dcoceN30kP1AY530CJ4gP/mLi6El
	 6jOpFJY+Y5ms/L5MEoexUurBTM44eUNsYYl2pjjAS2U2L960ZrUR9amG3Sj6w9y43Y
	 +vnNUgMAauvpYZlEi4r+JDIWQwQeyMNUHFQ9l4jCqXR19yrFLVHjKqT4GozyLn71A2
	 geymrasj2AVR4oI/H+oYy2EXW9g/sNrgVE3aSFOW8uAyXR/6cUng+BqIdbFzCCQC3x
	 TCMcH1i24o46Ic58B6PFUq8DnnUkogoz0Wxlq0hwjOocT3iRfII9/jHu7iGVFyeUMp
	 FO39KvX416ZxA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 24B3CCE18B4; Thu, 24 Apr 2025 17:28:27 -0700 (PDT)
From: "Paul E. McKenney" <paulmck@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: kernel-team@meta.com,
	Andrew Morton <akpm@linux-foundation.org>,
	Kuniyuki Iwashima <kuniyu@amazon.com>,
	Mateusz Guzik <mjguzik@gmail.com>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jon Pan-Doh <pandoh@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Karolina Stolarek <karolina.stolarek@oracle.com>,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: [PATCH v3 01/20] lib: Add trivial kunit test for ratelimit
Date: Thu, 24 Apr 2025 17:28:07 -0700
Message-Id: <20250425002826.3431914-1-paulmck@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <72ee57b8-9e2a-4cad-aaa0-1e3353d146d8@paulmck-laptop>
References: <72ee57b8-9e2a-4cad-aaa0-1e3353d146d8@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a simple single-threaded smoke test for lib/ratelimit.c

To run on x86:

	make ARCH=x86_64 mrproper
	./tools/testing/kunit/kunit.py run --arch x86_64 --kconfig_add CONFIG_RATELIMIT_KUNIT_TEST=y --kconfig_add CONFIG_SMP=y lib_ratelimit

This will fail on old ___ratelimit(), and subsequent patches provide
the fixes that are required.

[ paulmck:  Apply timeout and kunit feedback from Petr Mladek. ]

Link: https://lore.kernel.org/all/fbe93a52-365e-47fe-93a4-44a44547d601@paulmck-laptop/
Link: https://lore.kernel.org/all/20250423115409.3425-1-spasswolf@web.de/
Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Reviewed-by: Petr Mladek <pmladek@suse.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Kuniyuki Iwashima <kuniyu@amazon.com>
Cc: Mateusz Guzik <mjguzik@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Jon Pan-Doh <pandoh@google.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Karolina Stolarek <karolina.stolarek@oracle.com>
---
 lib/Kconfig.debug          | 11 ++++++
 lib/tests/Makefile         |  1 +
 lib/tests/test_ratelimit.c | 79 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 91 insertions(+)
 create mode 100644 lib/tests/test_ratelimit.c

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 9fe4d8dfe5782..c239099218c2b 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -3232,6 +3232,17 @@ config TEST_OBJPOOL
 
 	  If unsure, say N.
 
+config RATELIMIT_KUNIT_TEST
+	tristate "KUnit Test for correctness and stress of ratelimit" if !KUNIT_ALL_TESTS
+	depends on KUNIT
+	default KUNIT_ALL_TESTS
+	help
+	  This builds the "test_ratelimit" module that should be used
+	  for correctness verification and concurrent testings of rate
+	  limiting.
+
+	  If unsure, say N.
+
 config INT_POW_KUNIT_TEST
 	tristate "Integer exponentiation (int_pow) test" if !KUNIT_ALL_TESTS
 	depends on KUNIT
diff --git a/lib/tests/Makefile b/lib/tests/Makefile
index 5a4794c1826e7..1c7c2d20fe501 100644
--- a/lib/tests/Makefile
+++ b/lib/tests/Makefile
@@ -45,5 +45,6 @@ obj-$(CONFIG_STRING_KUNIT_TEST) += string_kunit.o
 obj-$(CONFIG_STRING_HELPERS_KUNIT_TEST) += string_helpers_kunit.o
 obj-$(CONFIG_USERCOPY_KUNIT_TEST) += usercopy_kunit.o
 obj-$(CONFIG_UTIL_MACROS_KUNIT) += util_macros_kunit.o
+obj-$(CONFIG_RATELIMIT_KUNIT_TEST) += test_ratelimit.o
 
 obj-$(CONFIG_TEST_RUNTIME_MODULE)		+= module/
diff --git a/lib/tests/test_ratelimit.c b/lib/tests/test_ratelimit.c
new file mode 100644
index 0000000000000..0374107f5ea89
--- /dev/null
+++ b/lib/tests/test_ratelimit.c
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <kunit/test.h>
+
+#include <linux/ratelimit.h>
+#include <linux/module.h>
+
+/* a simple boot-time regression test */
+
+#define TESTRL_INTERVAL (5 * HZ)
+static DEFINE_RATELIMIT_STATE(testrl, TESTRL_INTERVAL, 3);
+
+#define test_ratelimited(test, expected) \
+	KUNIT_ASSERT_EQ(test, ___ratelimit(&testrl, "test_ratelimit_smoke"), (expected))
+
+static void test_ratelimit_smoke(struct kunit *test)
+{
+	// Check settings.
+	KUNIT_ASSERT_GE(test, TESTRL_INTERVAL, 100);
+
+	// Test normal operation.
+	test_ratelimited(test, true);
+	test_ratelimited(test, true);
+	test_ratelimited(test, true);
+	test_ratelimited(test, false);
+
+	schedule_timeout_idle(TESTRL_INTERVAL - 40);
+	test_ratelimited(test, false);
+
+	schedule_timeout_idle(50);
+	test_ratelimited(test, true);
+
+	schedule_timeout_idle(2 * TESTRL_INTERVAL);
+	test_ratelimited(test, true);
+	test_ratelimited(test, true);
+
+	schedule_timeout_idle(TESTRL_INTERVAL - 40);
+	test_ratelimited(test, true);
+	schedule_timeout_idle(50);
+	test_ratelimited(test, true);
+	test_ratelimited(test, true);
+	test_ratelimited(test, true);
+	test_ratelimited(test, false);
+
+	// Test disabling.
+	testrl.burst = 0;
+	test_ratelimited(test, false);
+	testrl.burst = 2;
+	testrl.interval = 0;
+	test_ratelimited(test, true);
+	test_ratelimited(test, true);
+	test_ratelimited(test, true);
+	test_ratelimited(test, true);
+	test_ratelimited(test, true);
+	test_ratelimited(test, true);
+	test_ratelimited(test, true);
+
+	// Testing re-enabling.
+	testrl.interval = TESTRL_INTERVAL;
+	test_ratelimited(test, true);
+	test_ratelimited(test, true);
+	test_ratelimited(test, false);
+	test_ratelimited(test, false);
+}
+
+static struct kunit_case sort_test_cases[] = {
+	KUNIT_CASE_SLOW(test_ratelimit_smoke),
+	{}
+};
+
+static struct kunit_suite ratelimit_test_suite = {
+	.name = "lib_ratelimit",
+	.test_cases = sort_test_cases,
+};
+
+kunit_test_suites(&ratelimit_test_suite);
+
+MODULE_DESCRIPTION("___ratelimit() KUnit test suite");
+MODULE_LICENSE("GPL");
-- 
2.40.1

