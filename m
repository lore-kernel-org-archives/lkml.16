Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B033A4315C
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 21:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743714917; cv=none; b=STCPq8Hnopq1idMYVyS72FK9DNkgkwVoyzozlVVHbfIj1kjDjtz1XEKkMNGRVqTiwhF8l4CLBtwzYHWsS3gJmkMCoykVoBEhzGZz9QlDsHMb6yjp8TtNpwObcSsKooeJSeWf1zLTccctDfMQdbqftXaKkzY9H5ZSLqdXFK8MYMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743714917; c=relaxed/simple;
	bh=JH4KSTZ+3aR7UCD0hbafpr1+1zcNSmk9+5u+ukE5vIk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iKB1cvLr4wL2NU6NjjHGmSYMvLYIywJM6u6dB9tZQnXeGhcncm228EzzLFEWxmCXQtn1qHAjW3d1gRxCkDhQZaUXLwv2KeK8clOLweWGMB9v+hvEtHPNixph6QACncD5scSrByqOFQpzhWVivVEFbj1BTx7QwVZoSxu8ZNIuCsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R2iz6yvB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R2iz6yvB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5315DC4CEEE;
	Thu,  3 Apr 2025 21:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743714917;
	bh=JH4KSTZ+3aR7UCD0hbafpr1+1zcNSmk9+5u+ukE5vIk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R2iz6yvBHHJnZuffa1/BCiskKIp0qyFTYKjtguZ3NYSzg9KqoSxe355jFJgbz/2zk
	 nvWFwbUkOv+tmQpRd4cMdgJQjjNy+pYAHVWaj8H8TScsFHUxy4fAvW+Yx5jj1L4gJ5
	 LGj3u/pfeY35r4nc1q6F4g8Xhc9DtCvq4TwzeHGto3K3E8S0UYqHnVqhkMpE19VaAS
	 N+fkmrzUa1u3B5hABak5uSRyKLwAglvb7xkE5l6kLvP8h3181Dp+7x5sqfSxzHljnU
	 ShMuRzn0oU1dfKMYR21yQGrbA+1Ue0NDyxgdAWwOp3pBga+iWIBrQ3gxFPtqlK4QRM
	 jF6f7ArBTtz2A==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id AB1A0CE0FFE; Thu,  3 Apr 2025 14:15:15 -0700 (PDT)
From: "Paul E. McKenney" <paulmck@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: kernel-team@meta.com,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Kuniyuki Iwashima <kuniyu@amazon.com>,
	Mateusz Guzik <mjguzik@gmail.com>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jon Pan-Doh <pandoh@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Karolina Stolarek <karolina.stolarek@oracle.com>
Subject: [PATCH RFC 9/9] lib: Add trivial kunit test for ratelimit
Date: Thu,  3 Apr 2025 14:15:14 -0700
Message-Id: <20250403211514.985900-9-paulmck@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <fbe93a52-365e-47fe-93a4-44a44547d601@paulmck-laptop>
References: <fbe93a52-365e-47fe-93a4-44a44547d601@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a simple single-threaded smoke test for lib/ratelimit.c

Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>
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
 lib/Kconfig.debug    | 11 +++++++
 lib/Makefile         |  1 +
 lib/test_ratelimit.c | 77 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 89 insertions(+)
 create mode 100644 lib/test_ratelimit.c

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 1af972a92d06f..4adbb9b93a6eb 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -3166,6 +3166,17 @@ config TEST_OBJPOOL
 
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
 config INT_POW_TEST
 	tristate "Integer exponentiation (int_pow) test" if !KUNIT_ALL_TESTS
 	depends on KUNIT
diff --git a/lib/Makefile b/lib/Makefile
index d5cfc7afbbb82..21d45806c889c 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -112,6 +112,7 @@ obj-$(CONFIG_TEST_REF_TRACKER) += test_ref_tracker.o
 CFLAGS_test_fprobe.o += $(CC_FLAGS_FTRACE)
 obj-$(CONFIG_FPROBE_SANITY_TEST) += test_fprobe.o
 obj-$(CONFIG_TEST_OBJPOOL) += test_objpool.o
+obj-$(CONFIG_TEST_RATELIMIT) += test_ratelimit.o
 
 obj-$(CONFIG_TEST_FPU) += test_fpu.o
 test_fpu-y := test_fpu_glue.o test_fpu_impl.o
diff --git a/lib/test_ratelimit.c b/lib/test_ratelimit.c
new file mode 100644
index 0000000000000..3d6db9be6be22
--- /dev/null
+++ b/lib/test_ratelimit.c
@@ -0,0 +1,77 @@
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
+	schedule_timeout_idle(TESTRL_INTERVAL - 20);
+	test_ratelimited(test, false);
+
+	schedule_timeout_idle(30);
+	test_ratelimited(test, true);
+
+	schedule_timeout_idle(2 * TESTRL_INTERVAL);
+	test_ratelimited(test, true);
+	test_ratelimited(test, true);
+
+	schedule_timeout_idle(TESTRL_INTERVAL - 20);
+	test_ratelimited(test, true);
+	schedule_timeout_idle(30);
+	test_ratelimited(test, true);
+	test_ratelimited(test, true);
+	test_ratelimited(test, true);
+	test_ratelimited(test, false);
+
+	// Test disabling.
+	testrl.burst = 0;
+	test_ratelimited(test, true);
+	test_ratelimited(test, true);
+	test_ratelimited(test, true);
+	test_ratelimited(test, true);
+	test_ratelimited(test, true);
+	test_ratelimited(test, true);
+	test_ratelimited(test, true);
+
+	// Testing re-enabling.
+	testrl.burst = 3;
+	test_ratelimited(test, true);
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

