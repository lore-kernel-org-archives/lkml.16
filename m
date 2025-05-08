Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FBA233713
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 23:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746747217; cv=none; b=K+tpraLBZwC+ekc2pCtcu6tM5zY+iKKmy3CixNXBLS5Jq3XQ+mGP25ymaslheeT5mNp6pfdMxJwc/iinLLdQcCDKKoxKAZwgbnssmkQzBjYZPaOfxcSho5fWfy7SoVkBb8Bt+7sTqwL88py6UMD06egEd2zqARU9ouXJoOJBIIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746747217; c=relaxed/simple;
	bh=SvYRsTTTQICOYz8yThrRfPXwRKZWBL4GRgzZV2m3sC0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LrfXsMXZzbiwMSDkFzgtJPOvYHlCDh0fp3EkJ7xF39MQeMFoR+gPr7CiqYb5jCXAOFPHooxfGbyr8i9txdAwdlIRZ3EUgi/KetODOE4CGGlC+iypM8HOw2Ey+OEPDRYX10NbBev4HpcyE9e/lpQinY7yCoZZlsEbHk/VlJX/fPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LF72BmdJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LF72BmdJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AC15C4CEF3;
	Thu,  8 May 2025 23:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746747217;
	bh=SvYRsTTTQICOYz8yThrRfPXwRKZWBL4GRgzZV2m3sC0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LF72BmdJGbNou9K1lp3p/FmR4ok/z457cnXRiKfm+TqNXcj67IxKOwNWP2hdUDSxk
	 l/16bdHy56jztGXuUn0OQbWjpB4SKfNyqdHUH7wFGE6sPudbSzIP1SgKGcSbe3A+8U
	 JZ2B2+0xdW5a+CqBQbcWez/85WHmiRORI9U9wuzy/rTOTjvPpwGRiXyovs6rBY9gyQ
	 +jmHUEeQ/RJTxlxQU0vQ8ys+69Kpr/k2kLKZwwlv3c4I0iOuzXK4TDxdTF4f3H6Dcg
	 qOfWQRJDqCIHkNkvUnL56OLaelLyvKzOMBEH7WE6RnFbtVW2o8FxX726dQDDq86hga
	 rPxkTr6ijwxFg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 99F6CCE1440; Thu,  8 May 2025 16:33:36 -0700 (PDT)
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
Subject: [PATCH v5 21/21] lib: Add stress test for ratelimit
Date: Thu,  8 May 2025 16:33:35 -0700
Message-Id: <20250508233335.1996059-21-paulmck@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <1bcf7d5e-b89c-4118-b872-c8896bdbdc19@paulmck-laptop>
References: <1bcf7d5e-b89c-4118-b872-c8896bdbdc19@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a simple stress test for lib/ratelimit.c

To run on x86:

	./tools/testing/kunit/kunit.py run --arch x86_64 --kconfig_add CONFIG_RATELIMIT_KUNIT_TEST=y --kconfig_add CONFIG_SMP=y --qemu_args "-smp 4" lib_ratelimit

On a 16-CPU system, the "4" in "-smp 4" can be varied between 1 and 8.
Larger numbers have higher probabilities of introducing delays that
break the smoke test.  In the extreme case, increasing the number to
larger than the number of CPUs in the underlying system is an excellent
way to get a test failure.

Link: https://lore.kernel.org/all/fbe93a52-365e-47fe-93a4-44a44547d601@paulmck-laptop/
Link: https://lore.kernel.org/all/20250423115409.3425-1-spasswolf@web.de/
Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Cc: Petr Mladek <pmladek@suse.com>
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
 lib/tests/test_ratelimit.c | 69 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 67 insertions(+), 2 deletions(-)

diff --git a/lib/tests/test_ratelimit.c b/lib/tests/test_ratelimit.c
index 0374107f5ea89..bce80d9dd21bf 100644
--- a/lib/tests/test_ratelimit.c
+++ b/lib/tests/test_ratelimit.c
@@ -4,6 +4,8 @@
 
 #include <linux/ratelimit.h>
 #include <linux/module.h>
+#include <linux/kthread.h>
+#include <linux/cpumask.h>
 
 /* a simple boot-time regression test */
 
@@ -63,14 +65,77 @@ static void test_ratelimit_smoke(struct kunit *test)
 	test_ratelimited(test, false);
 }
 
-static struct kunit_case sort_test_cases[] = {
+static struct ratelimit_state stressrl = RATELIMIT_STATE_INIT_FLAGS("stressrl", HZ / 10, 3,
+								    RATELIMIT_MSG_ON_RELEASE);
+
+static int doneflag;
+static const int stress_duration = 2 * HZ;
+
+struct stress_kthread {
+	unsigned long nattempts;
+	unsigned long nunlimited;
+	unsigned long nlimited;
+	unsigned long nmissed;
+	struct task_struct *tp;
+};
+
+static int test_ratelimit_stress_child(void *arg)
+{
+	struct stress_kthread *sktp = arg;
+
+	set_user_nice(current, MAX_NICE);
+	WARN_ON_ONCE(!sktp->tp);
+
+	while (!READ_ONCE(doneflag)) {
+		sktp->nattempts++;
+		if (___ratelimit(&stressrl, __func__))
+			sktp->nunlimited++;
+		else
+			sktp->nlimited++;
+		cond_resched();
+	}
+
+	sktp->nmissed = ratelimit_state_reset_miss(&stressrl);
+	return 0;
+}
+
+static void test_ratelimit_stress(struct kunit *test)
+{
+	int i;
+	const int n_stress_kthread = cpumask_weight(cpu_online_mask);
+	struct stress_kthread skt = { 0 };
+	struct stress_kthread *sktp = kcalloc(n_stress_kthread, sizeof(*sktp), GFP_KERNEL);
+
+	KUNIT_EXPECT_NOT_NULL_MSG(test, sktp, "Memory allocation failure");
+	for (i = 0; i < n_stress_kthread; i++) {
+		sktp[i].tp = kthread_run(test_ratelimit_stress_child, &sktp[i], "%s/%i",
+					 "test_ratelimit_stress_child", i);
+		KUNIT_EXPECT_NOT_NULL_MSG(test, sktp, "kthread creation failure");
+		pr_alert("Spawned test_ratelimit_stress_child %d\n", i);
+	}
+	schedule_timeout_idle(stress_duration);
+	WRITE_ONCE(doneflag, 1);
+	for (i = 0; i < n_stress_kthread; i++) {
+		kthread_stop(sktp[i].tp);
+		skt.nattempts += sktp[i].nattempts;
+		skt.nunlimited += sktp[i].nunlimited;
+		skt.nlimited += sktp[i].nlimited;
+		skt.nmissed += sktp[i].nmissed;
+	}
+	KUNIT_ASSERT_EQ_MSG(test, skt.nunlimited + skt.nlimited, skt.nattempts,
+			    "Outcomes not equal to attempts");
+	KUNIT_ASSERT_EQ_MSG(test, skt.nlimited, skt.nmissed, "Misses not equal to limits");
+}
+
+static struct kunit_case ratelimit_test_cases[] = {
 	KUNIT_CASE_SLOW(test_ratelimit_smoke),
+	KUNIT_CASE_SLOW(test_ratelimit_stress),
 	{}
 };
 
 static struct kunit_suite ratelimit_test_suite = {
 	.name = "lib_ratelimit",
-	.test_cases = sort_test_cases,
+	.test_cases = ratelimit_test_cases,
 };
 
 kunit_test_suites(&ratelimit_test_suite);
-- 
2.40.1

