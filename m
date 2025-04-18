Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5657219A8D
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 17:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744996442; cv=none; b=Efm/vUpP4NDibcVdYuGmUds81Dz4dcAEwQzfIZLUFuDn4BUSw7+3UC1Vxm1Yf64xi5tK0quvPso8Aaj1iZ9rG9rBemnbbcY7uGgdKsrw2pfoERhZoKEpvVo2KMJNNrZ00LKL6YooVOvoX4vIF4AE+zVHgD4VzqrdsR6TFtrWhEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744996442; c=relaxed/simple;
	bh=xLqM45sZEZExusqUZbrsZ7wwIEgc1vOr4HA0Is8RAg0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jw6J7boXmvEWcwj3BXJ3kYajZ0JL/YwpCHP2rakU4OTsTftc3vLf5ZNilgRTLrbzeZWZaySySM1fxbWAhHG0inqaf7U8WmTxLhHmNXTXlFy5LbI3X/tThtOL7g4kcMx1QVuF6HyCEKwLTWBRKd0x8YdD15870yDLIivDPPa7IxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=twQgFP65; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="twQgFP65"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33782C4CEE2;
	Fri, 18 Apr 2025 17:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744996442;
	bh=xLqM45sZEZExusqUZbrsZ7wwIEgc1vOr4HA0Is8RAg0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=twQgFP65EF9fFpKhaRP2rUcCroGBJgS28M9N453U+RZm3HydMBZix0WQPyHphfqim
	 TgzxC/FpA8GMHyR0iX6FH21S4Xid6DyKaADSGzidL6KKp7d5SCmrp0Gxffqs3ImqyW
	 Zx/vQbRAfgN55OkuOPnOTmFwLMw16RJ2t1HUw4L1PZRJrclg5bpOSxIzmyvazr0qP2
	 A28YaU6fqMnMORthluzHJJc3SarmFnMDG2zhM55Hp8db+cO31se210KVKHutqt1gkT
	 xbFyDZA9qgR8sDFQcfy/TFDuOkVQdF9fBXBCoAdP5Dj1vy8OLAVQNbF9KBqbeeCmqa
	 4bIzZYwkzms0w==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id D5A17CE077B; Fri, 18 Apr 2025 10:14:01 -0700 (PDT)
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
Subject: [PATCH v2 ratelimit 01/14] lib: Add trivial kunit test for ratelimit
Date: Fri, 18 Apr 2025 10:13:46 -0700
Message-Id: <20250418171359.1187719-1-paulmck@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <4edcefb0-cdbd-4422-8a08-ffc091de158e@paulmck-laptop>
References: <4edcefb0-cdbd-4422-8a08-ffc091de158e@paulmck-laptop>
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
	./tools/testing/kunit/kunit.py run --arch x86_64 --kconfig_add CONFIG_TEST_RATELIMIT=y --kconfig_add CONFIG_SMP=y lib_ratelimit

[ paulmck:  Apply timeout feedback from Petr Mladek. ]

Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Kuniyuki Iwashima <kuniyu@amazon.com>
Cc: Mateusz Guzik <mjguzik@gmail.com>
Cc: Petr Mladek <pmladek@suse.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Jon Pan-Doh <pandoh@google.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Karolina Stolarek <karolina.stolarek@oracle.com>
---
 lib/Kconfig.debug    | 11 ++++++
 lib/Makefile         |  1 +
 lib/test_ratelimit.c | 79 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 91 insertions(+)
 create mode 100644 lib/test_ratelimit.c

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 9fe4d8dfe5782..581d6a8489670 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -3232,6 +3232,17 @@ config TEST_OBJPOOL
 
 	  If unsure, say N.
 
+config TEST_RATELIMIT
+	tristate "Test module for correctness and stress of ratelimit" if !KUNIT_ALL_TESTS
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
diff --git a/lib/Makefile b/lib/Makefile
index f07b24ce1b3f8..9d1f15c91929a 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -103,6 +103,7 @@ obj-$(CONFIG_TEST_HMM) += test_hmm.o
 obj-$(CONFIG_TEST_FREE_PAGES) += test_free_pages.o
 obj-$(CONFIG_TEST_REF_TRACKER) += test_ref_tracker.o
 obj-$(CONFIG_TEST_OBJPOOL) += test_objpool.o
+obj-$(CONFIG_TEST_RATELIMIT) += test_ratelimit.o
 
 obj-$(CONFIG_TEST_FPU) += test_fpu.o
 test_fpu-y := test_fpu_glue.o test_fpu_impl.o
diff --git a/lib/test_ratelimit.c b/lib/test_ratelimit.c
new file mode 100644
index 0000000000000..45b673bbab9e4
--- /dev/null
+++ b/lib/test_ratelimit.c
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
+	KUNIT_ASSERT_EQ(test, ___ratelimit(&testrl, "test_ratelimit_smoke"), (expected));
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
+	KUNIT_CASE(test_ratelimit_smoke),
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

