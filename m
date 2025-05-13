Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B2A1FAC50
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 22:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747176508; cv=none; b=B2fEhLoO+V5GnVxWh9VdZcK/hgJVO493CGTO5fyGj20UAkVLGGw8GhJaVp9NxmTjqwWfdg6F7+z9SdJXbUpJiaFzyG5UFTaejAaYcqAxeZXYQUkpICBYKQq4L9JGdKuZjGdnU65KJ1szSllyPDBq+hikaqUFKuuhGkyUM9r+le8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747176508; c=relaxed/simple;
	bh=+SGeBuelbWzoHVT4KTinoM58Q2SG46XlnBX51jQLLso=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T+Xw+riYvaLbuPRKp4/gw7nsik4Ku2j2H9VYUKXG3lHZ4fdFp6/tDqWnbKuXwg9VfakMIRUcZUtxfhHuDPpxWeOZhod0o2JWGpjkrWklk/9nb2KvgwWIpNaiE+YmDCnCz0KART7kr5Xk2ZJkSzKsmpP7JjIb5dDdMFHLi2cudeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JutVVgfB; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JutVVgfB"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-30df7c98462so2328617a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 15:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747176505; x=1747781305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WdPGIhqp6nITU4lkF+zCUBrd5PWNxA3Hgc2vtrWZfHk=;
        b=JutVVgfBuOZfc5kHJiCg+hPOmGrOjJfL7jIir9nBvvvNVPdyg6ZvAB7G1D8TXV0gYN
         0C3IVnIFx9V/V3KCxmBPnOzMx3kyOZRhNf+yW3FRrjSQHdSJUy6b2A1NRCUvYHz6yJzp
         6xDcLWQ+EIrDrTWD7OJMlfxp5CZM/FUBQ1Wxs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747176505; x=1747781305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WdPGIhqp6nITU4lkF+zCUBrd5PWNxA3Hgc2vtrWZfHk=;
        b=aW4N3afF8hMzeGuNp69rKcwJ0hArQCRBOxNvOWXIiQGrTt+OoZ/OKnAZWDEMtBU0lg
         +k9kAxoRS+5gFCXvBoeoN8AAybpCf2GsqGO1dAZPrhpiXmcdTiz3oEof6HjfRjkKfzA6
         82ThDrq/wZusv/mj0o8QXT0feSAoLkvnU0pXIedMsVxSQE9w891Dvumy4FMmc3UkHQV7
         i6OPfqmhNIClk8969p9BONG1Jq/RXTodQaogjZAHfRRwJn5OuLEzvmi3zxm2VEEvMXU/
         eu9cQlx0vgDEaCUsw+3E9NIKZFLgVIeFOYc+JsqpclNBFRkV5ZRRuYiDVAfpctR0Bt9n
         v3HQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIynp7xi2u98r4kWkhvXIReAywqlQ/BsfrtV+UqADxJ2wOZ0Qa3+DJfvvaFs8R+bpwqr9/1bwfeKFQYSc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJfJaQU0trGKvEtPq6+5yxu2YcG6UqvmyziofAogUWyehlg46s
	nCSaOodplpz70IzEyWRbPuFtuDyUQVXYHGiCwfCsGAILZF+2QE8VgZfjlJT0Ag==
X-Gm-Gg: ASbGncssKAOX9TYW/xGn5D3a5ICYDkyjQFaKDcA6Lq1Zxej3d/KEtm7nptF15yrgXSM
	SV0nKoNL0HVKKR4c1Ry/cd6kvNNoN/Wnc+mKLrBVmaOfabQ7JYeu6C3rTXMZSx8PLyUe54gqhHZ
	KalTB8Kg5dWE2Gb4G1TX7IgQv3r4u3bJCHrxa4tWlhfmGgLatCBh1x7cGyXRpAtkVpjjtJpi3K8
	6AWx9bm/5CfnOCuex4U9izceYpwoonHGgEzWyo3d0Wg2nXU7LU7n4g/mjBvkNUZATG7VrpZxFz5
	nwUBiFoQCcpIL8KoskTzcdPTFjnL9qwU3thVZCyymxl3E8kt3y32c+PBleTKbVIIDf79czc0H0f
	w20nuvrDW52Xuvw==
X-Google-Smtp-Source: AGHT+IHfrQ8dgS++DKX7KuY5zVE9ONk5RTOupJPsy54LuplL9pCoQ+Krnya5p+/CvTiGlGi9oRVI4g==
X-Received: by 2002:a17:90b:4a42:b0:305:2d27:7ba5 with SMTP id 98e67ed59e1d1-30e2e5d6e3emr1652333a91.6.1747176505364;
        Tue, 13 May 2025 15:48:25 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:b0a6:1dea:5306:7727])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-30e33401768sm138393a91.3.2025.05.13.15.48.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 15:48:24 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Douglas Anderson <dianders@chromium.org>,
	Tsai Sung-Fu <danielsftsai@google.com>,
	linux-kernel@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH 1/2] genirq: Add kunit tests for depth counts
Date: Tue, 13 May 2025 15:42:37 -0700
Message-ID: <20250513224402.864767-2-briannorris@chromium.org>
X-Mailer: git-send-email 2.49.0.1045.g170613ef41-goog
In-Reply-To: <20250513224402.864767-1-briannorris@chromium.org>
References: <20250513224402.864767-1-briannorris@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These tests demonstrate bugs in the irq shutdown/startup code. See the
appended test report.

In summary, the latter two cases cover:

 ## shutdown depth:
 disable_irq()
 irq_shutdown_and_deactivate()
 irq_activate_and_startup() <-- BUG: depth is 0 after this
 enable_irq()

 ## cpu hotplug:
 affine IRQ to CPU 1
 disable_irq()
 remove CPU 1
 add CPU 1 <-- BUG: depth is 0 after this
 enable_irq()

NB: since one of the tests intersects with CPU hotplug, these tests
requires SMP support. They can be easily run with:

$ tools/testing/kunit/kunit.py run 'irq_test_cases*' --arch x86_64 --qemu_args '-smp 2'
[13:24:21] =============== irq_test_cases (3 subtests) ================
[13:24:21] [PASSED] irq_disable_depth_test
[13:24:21]     # irq_shutdown_depth_test: EXPECTATION FAILED at kernel/irq/irq_test.c:93
[13:24:21]     Expected desc->depth == 1, but
[13:24:21]         desc->depth == 0 (0x0)
[13:24:21] ------------[ cut here ]------------
[13:24:21] Unbalanced enable for IRQ 25
[13:24:21] WARNING: CPU: 1 PID: 34 at kernel/irq/manage.c:792 __enable_irq+0x36/0x60
...
[13:24:21] Call Trace:
[13:24:21]  <TASK>
[13:24:21]  enable_irq+0x4a/0x90
[13:24:21]  irq_shutdown_depth_test+0x17b/0x3b0
[13:24:21]  kunit_try_run_case+0x90/0x120
...
[13:24:21]  </TASK>
[13:24:21] ---[ end trace 0000000000000000 ]---
[13:24:21]     # irq_shutdown_depth_test.speed: slow
[13:24:21] [FAILED] irq_shutdown_depth_test
[13:24:21]  #1
[13:24:21]     # irq_cpuhotplug_test: EXPECTATION FAILED at kernel/irq/irq_test.c:140
[13:24:21]     Expected desc->depth == 1, but
[13:24:21]         desc->depth == 0 (0x0)
[13:24:21] ------------[ cut here ]------------
[13:24:21] Unbalanced enable for IRQ 26
[13:24:21] WARNING: CPU: 0 PID: 36 at kernel/irq/manage.c:792 __enable_irq+0x36/0x60
...
[13:24:21] Call Trace:
[13:24:21]  <TASK>
[13:24:21]  enable_irq+0x4a/0x90
[13:24:21]  irq_cpuhotplug_test+0x28f/0x660
[13:24:21]  kunit_try_run_case+0x90/0x120
...
[13:24:21]  </TASK>
[13:24:21] ---[ end trace 0000000000000000 ]---
[13:24:21]     # irq_cpuhotplug_test.speed: slow
[13:24:21] [FAILED] irq_cpuhotplug_test
[13:24:21]     # module: irq_test
[13:24:21] # irq_test_cases: pass:1 fail:2 skip:0 total:3
[13:24:21] # Totals: pass:1 fail:2 skip:0 total:3
[13:24:21] ================= [FAILED] irq_test_cases ==================
[13:24:21] ============================================================
[13:24:21] Testing complete. Ran 3 tests: passed: 1, failed: 2

Also note that currently, these tests don't fully clean up after
themselves, as I didn't yet figure out all the right ways to set up a
fake virq and domain for the purpose of unit testing. They contain TODOs
to that effect.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 kernel/irq/Kconfig    |  10 +++
 kernel/irq/Makefile   |   1 +
 kernel/irq/irq_test.c | 162 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 173 insertions(+)
 create mode 100644 kernel/irq/irq_test.c

diff --git a/kernel/irq/Kconfig b/kernel/irq/Kconfig
index 3f02a0e45254..9295dabea4a0 100644
--- a/kernel/irq/Kconfig
+++ b/kernel/irq/Kconfig
@@ -144,6 +144,16 @@ config GENERIC_IRQ_DEBUGFS
 config GENERIC_IRQ_KEXEC_CLEAR_VM_FORWARD
 	bool
 
+config IRQ_KUNIT_TEST
+	tristate "KUnit test for IRQ management APIs" if !KUNIT_ALL_TESTS
+	depends on KUNIT
+	default KUNIT_ALL_TESTS
+	select SMP
+	help
+	  Enable this option to test IRQ management APIs.
+
+	  If unsure, say N.
+
 endmenu
 
 config GENERIC_IRQ_MULTI_HANDLER
diff --git a/kernel/irq/Makefile b/kernel/irq/Makefile
index c0f44c06d69d..6ab3a4055667 100644
--- a/kernel/irq/Makefile
+++ b/kernel/irq/Makefile
@@ -19,3 +19,4 @@ obj-$(CONFIG_GENERIC_IRQ_IPI_MUX) += ipi-mux.o
 obj-$(CONFIG_SMP) += affinity.o
 obj-$(CONFIG_GENERIC_IRQ_DEBUGFS) += debugfs.o
 obj-$(CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR) += matrix.o
+obj-$(CONFIG_IRQ_KUNIT_TEST) += irq_test.o
diff --git a/kernel/irq/irq_test.c b/kernel/irq/irq_test.c
new file mode 100644
index 000000000000..24f4d8e6c433
--- /dev/null
+++ b/kernel/irq/irq_test.c
@@ -0,0 +1,162 @@
+// SPDX-License-Identifier: LGPL-2.1+
+
+#include <linux/cpu.h>
+#include <linux/cpumask.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/irqdesc.h>
+#include <linux/irqdomain.h>
+#include <linux/nodemask.h>
+#include <kunit/test.h>
+
+#include "internals.h"
+
+static irqreturn_t noop_handler(int, void *)
+{
+	return IRQ_HANDLED;
+}
+
+static void noop(struct irq_data *data) { }
+static unsigned int noop_ret(struct irq_data *data) { return 0; }
+
+static int noop_affinity(struct irq_data *data, const struct cpumask *dest, bool force)
+{
+	irq_data_update_effective_affinity(data, dest);
+
+	return 0;
+}
+
+static struct irq_chip fake_irq_chip = {
+	.name           = "fake",
+	.irq_startup    = noop_ret,
+	.irq_shutdown   = noop,
+	.irq_enable     = noop,
+	.irq_disable    = noop,
+	.irq_ack        = noop,
+	.irq_mask       = noop,
+	.irq_unmask     = noop,
+	.irq_set_affinity = noop_affinity,
+	.flags          = IRQCHIP_SKIP_SET_WAKE,
+};
+
+static void irq_disable_depth_test(struct kunit *test)
+{
+	struct irq_desc *desc;
+	int virq, ret;
+
+	virq = irq_domain_alloc_descs(-1 /*virq*/, 1 /*nr_irqs*/, 0/*hwirq*/, first_online_node/*node*/, NULL);
+	KUNIT_ASSERT_GE(test, virq, 0);
+
+	irq_set_chip_and_handler(virq, &dummy_irq_chip, handle_simple_irq);
+
+	desc = irq_to_desc(virq);
+	KUNIT_ASSERT_PTR_NE(test, desc, NULL);
+
+	ret = request_irq(virq, noop_handler, 0, "test_irq", NULL);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+
+	KUNIT_EXPECT_EQ(test, desc->depth, 0);
+
+	disable_irq(virq);
+	KUNIT_EXPECT_EQ(test, desc->depth, 1);
+
+	enable_irq(virq);
+	KUNIT_EXPECT_EQ(test, desc->depth, 0);
+
+	/* TODO: free virq? */
+}
+
+static void irq_shutdown_depth_test(struct kunit *test)
+{
+	struct irq_desc *desc;
+	int virq, ret;
+
+	virq = irq_domain_alloc_descs(-1 /*virq*/, 1 /*nr_irqs*/, 0/*hwirq*/, first_online_node/*node*/, NULL);
+	KUNIT_ASSERT_GE(test, virq, 0);
+
+	irq_set_chip_and_handler(virq, &dummy_irq_chip, handle_simple_irq);
+
+	desc = irq_to_desc(virq);
+	KUNIT_ASSERT_PTR_NE(test, desc, NULL);
+
+	ret = request_irq(virq, noop_handler, 0, "test_irq", NULL);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+
+	KUNIT_EXPECT_EQ(test, desc->depth, 0);
+
+	disable_irq(virq);
+	KUNIT_EXPECT_EQ(test, desc->depth, 1);
+
+	irq_shutdown_and_deactivate(desc);
+	KUNIT_EXPECT_EQ(test, irq_activate_and_startup(desc, IRQ_NORESEND), 0);
+
+	KUNIT_EXPECT_EQ(test, desc->depth, 1);
+
+	enable_irq(virq);
+	KUNIT_EXPECT_EQ(test, desc->depth, 0);
+
+	/* TODO: free virq? */
+}
+
+static void irq_cpuhotplug_test(struct kunit *test)
+{
+	struct irq_desc *desc;
+	struct irq_data *data;
+	int virq, ret;
+	struct irq_affinity_desc affinity = {
+		.is_managed = 1,
+	};
+
+	cpumask_copy(&affinity.mask, cpumask_of(1));
+	KUNIT_ASSERT_PTR_NE(test, get_cpu_device(1), NULL);
+	KUNIT_ASSERT_TRUE(test, cpu_is_hotpluggable(1));
+
+	virq = irq_domain_alloc_descs(-1 /*virq*/, 1 /*nr_irqs*/, 0/*hwirq*/, first_online_node/*node*/, &affinity);
+	KUNIT_ASSERT_GE(test, virq, 0);
+
+	irq_set_chip_and_handler(virq, &fake_irq_chip, handle_simple_irq);
+
+	desc = irq_to_desc(virq);
+	KUNIT_ASSERT_PTR_NE(test, desc, NULL);
+
+	data = irq_desc_get_irq_data(desc);
+	KUNIT_ASSERT_PTR_NE(test, data, NULL);
+
+	ret = request_irq(virq, noop_handler, 0, "test_irq", NULL);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+
+	KUNIT_EXPECT_TRUE(test, irqd_is_activated(data));
+	KUNIT_EXPECT_TRUE(test, irqd_is_started(data));
+	KUNIT_EXPECT_TRUE(test, irqd_affinity_is_managed(data));
+
+	KUNIT_EXPECT_EQ(test, desc->depth, 0);
+
+	disable_irq(virq);
+	KUNIT_EXPECT_EQ(test, desc->depth, 1);
+
+	KUNIT_EXPECT_EQ(test, remove_cpu(1), 0);
+	KUNIT_EXPECT_EQ(test, add_cpu(1), 0);
+
+	KUNIT_EXPECT_EQ(test, desc->depth, 1);
+
+	enable_irq(virq);
+	KUNIT_EXPECT_EQ(test, desc->depth, 0);
+
+	/* TODO: free virq? */
+}
+
+static struct kunit_case irq_test_cases[] = {
+	KUNIT_CASE_SLOW(irq_disable_depth_test),
+	KUNIT_CASE_SLOW(irq_shutdown_depth_test),
+	KUNIT_CASE_SLOW(irq_cpuhotplug_test),
+	{}
+};
+
+static struct kunit_suite irq_test_suite = {
+	.name = "irq_test_cases",
+	.test_cases = irq_test_cases,
+};
+
+kunit_test_suite(irq_test_suite);
+MODULE_DESCRIPTION("IRQ unit test suite");
+MODULE_LICENSE("GPL");
-- 
2.49.0.1045.g170613ef41-goog

