Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746A1252283
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 21:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747948285; cv=none; b=YiRQdJI5daZpt/82cXhVi7Sk843z+W9Ok7TfuExuh15H9x8FfgOGW7MrtJgOHrEJ0NcPtNlGVyawm0Y/q222YJCeA1x3+EvD46qtTBc7quRp4TKZeodqUAPlGFGF3iG56vbHQ0CoecGaSFnDlKzafdF2XrgvVK1RlfISuIli1IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747948285; c=relaxed/simple;
	bh=QLvrvYa+K4xMZOP6tQSp3+YrkeZ18pnkKpf69bcEBQA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tVA/PnZeodmwebL972i5IkmuHMnOYloCyscGFDsPaAxLjq4QemY2DWGpK8O5SONxLhBrVzGnx+KuK/H5CFklLMgcLKGiXFw9DoA3bD2mRsz49KWOUnLUZpTtshTEqv8WmbnWvJKCzluGNaepqcPGp92gOE+1co+b6CyFE6juZoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=N7Hb6G44; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="N7Hb6G44"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-742af84818cso5215499b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 14:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747948282; x=1748553082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x0FQBsyoOxisdMVX2Dd68JeQWUs4aaEzR6oODlwuSvU=;
        b=N7Hb6G44S6xQsdgk2V1TwJt70WYzsd9Jfyi2WLtr9b/YoFR535+IgVOELFCgk3ouWI
         gswRk1Mt91GxcHsswcku6h6IHiM4zvctB2v7mM7s+LLxbs2lU4AR3zN4G8LVblWqHtL2
         oFZTq9UV2V+K3YIzaDp8yr2KCh5H/bddLRJ2E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747948282; x=1748553082;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x0FQBsyoOxisdMVX2Dd68JeQWUs4aaEzR6oODlwuSvU=;
        b=ZKS7xExPjHbP6tgN67BL3Q5ktSy2LL6wwC24PevFbVpQsVFEqhCDsgrWB6h2nQQ29F
         xM1mGMj3tPbe1agRt+UnQr2Hhq7qaHKt0g2E0d0TMQOm0BGO6dRW/KenD/rfVEN+Jqvx
         wUpfi+VdKPJREnzfj4fxibvDrhXy4V8NKzwQJhySmGr8gNYmJvstlm99191Oc1mffPKI
         9vXsvH3ZJfRLQFTqurMo9vSxmcWnDCoLz9RnCLc/yVVAH20bl1+gvmNvH8Prh7ULHYAr
         Je9RKIR+DwvHmQ8G5lH0cnMCpG+vg31VtwbjQli1dL/ZTdaRPF940hwNb67K2i1vK6X6
         Cvpg==
X-Forwarded-Encrypted: i=1; AJvYcCUSeuMd4w6KYk+7uIZlvokf23fR98lC1HinKqTKuoyZjElH5gkfagAnCuV0bw6xFubGp26k0Vt2ojG2X4o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAFkXE6cF/Ai0znKW/8ggNscLUdjGBRk6Qs2JJlolRQ56gt6tq
	Z7Fb9bsqkakql8xn5cTNTS7hCxk2+Atn9KHDViOXPb6EyYbbeWBJCUaNRaJYXBgXGw==
X-Gm-Gg: ASbGncu1hvRv4mjmTEXw2uvKu++lUP27bbzDoMfyi4GQh2IoSOjwIB+VJlSMkBt/OAw
	al0iVG2PhpZ872Lu3owQQz0c23F4K5xleyQ4Iw7iqKt/PzT5Ve7PG/vH9IvAIHfcO7BkdcJjIh+
	AJsFEOs8iyJFIu5kcfrHtjQkqZNNfU6vgcoThZHCSShIXTaflkT1ix61mrWjVa9Igi+fT8vsdUf
	f69ZUx20eAWPeIpqTcwNmvjrrsfIepYSggGxRnMeHY74AptPp+9R5gNMVuIU+3hOY+oFiSKQcG0
	/8GsyEiSQvD3G2Ktqbrj6U9PNEsQBVAabwkkU0eNGb3p2aZKGHJp0Rpv66LC3CAbcnsFE2gn6cl
	jKUf6Enw7YShkRA==
X-Google-Smtp-Source: AGHT+IEBRExg9sR7EX0eqcxrI718yswIBPOmbVQ5N3ytMZ1b7a5MtEAgWqedxgLNA0K0zHVPFHrTqQ==
X-Received: by 2002:a05:6a20:cf82:b0:216:67e:bf09 with SMTP id adf61e73a8af0-21621934db1mr39293165637.22.1747948282578;
        Thu, 22 May 2025 14:11:22 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:b00a:2db0:715b:9b95])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-b26eaf8de24sm11758882a12.36.2025.05.22.14.11.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 14:11:21 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Tsai Sung-Fu <danielsftsai@google.com>,
	Douglas Anderson <dianders@chromium.org>,
	linux-kernel@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH v4] genirq: Add kunit tests for depth counts
Date: Thu, 22 May 2025 14:08:01 -0700
Message-ID: <20250522210837.4135244-1-briannorris@chromium.org>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There have been a few bugs and/or misunderstandings about the reference
counting, and startup/shutdown behaviors in the IRQ core and related CPU
hotplug code. These 4 test cases try to capture a few interesting cases.

* irq_disable_depth_test: basic request/disable/enable sequence

* irq_free_disabled_test: request/disable/free/re-request sequence -
  this catches errors on previous revisions of my work

* irq_cpuhotplug_test: exercises managed-affinity IRQ + CPU hotplug.
  This captures a problematic test case that I've fixed.
  This test requires CONFIG_SMP and a hotpluggable CPU#1.

* irq_shutdown_depth_test: exercises similar behavior from
  irq_cpuhotplug_test, but directly using irq_*() APIs instead of going
  through CPU hotplug. This still requires CONFIG_SMP, because
  managed-affinity is stubbed out (and not all APIs are even present)
  without it.

Note the use of 'imply SMP': ARCH=um doesn't support SMP, and kunit is
often exercised there. Thus, 'imply' will force SMP on where possible
(such as ARCH=x86_64), but leave it off where it's not.

Behavior on various SMP and ARCH configurations:

  $ tools/testing/kunit/kunit.py run 'irq_test_cases*' --arch x86_64 --qemu_args '-smp 2'
  [...]
  [11:12:24] Testing complete. Ran 4 tests: passed: 4

  $ tools/testing/kunit/kunit.py run 'irq_test_cases*' --arch x86_64
  [...]
  [11:13:27] [SKIPPED] irq_cpuhotplug_test
  [11:13:27] ================= [PASSED] irq_test_cases ==================
  [11:13:27] ============================================================
  [11:13:27] Testing complete. Ran 4 tests: passed: 3, skipped: 1

  # default: ARCH=um
  $ tools/testing/kunit/kunit.py run 'irq_test_cases*'
  [11:14:26] [SKIPPED] irq_shutdown_depth_test
  [11:14:26] [SKIPPED] irq_cpuhotplug_test
  [11:14:26] ================= [PASSED] irq_test_cases ==================
  [11:14:26] ============================================================
  [11:14:26] Testing complete. Ran 4 tests: passed: 2, skipped: 2

Without commit 788019eb559f ("genirq: Retain disable depth for managed
interrupts across CPU hotplug"), we fail as follows:

  [11:18:55] =============== irq_test_cases (4 subtests) ================
  [11:18:55] [PASSED] irq_disable_depth_test
  [11:18:55] [PASSED] irq_free_disabled_test
  [11:18:55]     # irq_shutdown_depth_test: EXPECTATION FAILED at kernel/irq/irq_test.c:147
  [11:18:55]     Expected desc->depth == 1, but
  [11:18:55]         desc->depth == 0 (0x0)
  [11:18:55] ------------[ cut here ]------------
  [11:18:55] Unbalanced enable for IRQ 26
  [11:18:55] WARNING: CPU: 1 PID: 36 at kernel/irq/manage.c:792 __enable_irq+0x36/0x60
  ...
  [11:18:55] [FAILED] irq_shutdown_depth_test
  [11:18:55]  #1
  [11:18:55]     # irq_cpuhotplug_test: EXPECTATION FAILED at kernel/irq/irq_test.c:202
  [11:18:55]     Expected irqd_is_activated(data) to be false, but is true
  [11:18:55]     # irq_cpuhotplug_test: EXPECTATION FAILED at kernel/irq/irq_test.c:203
  [11:18:55]     Expected irqd_is_started(data) to be false, but is true
  [11:18:55]     # irq_cpuhotplug_test: EXPECTATION FAILED at kernel/irq/irq_test.c:204
  [11:18:55]     Expected desc->depth == 1, but
  [11:18:55]         desc->depth == 0 (0x0)
  [11:18:55] ------------[ cut here ]------------
  [11:18:55] Unbalanced enable for IRQ 27
  [11:18:55] WARNING: CPU: 0 PID: 38 at kernel/irq/manage.c:792 __enable_irq+0x36/0x60
  ...
  [11:18:55] [FAILED] irq_cpuhotplug_test
  [11:18:55]     # module: irq_test
  [11:18:55] # irq_test_cases: pass:2 fail:2 skip:0 total:4
  [11:18:55] # Totals: pass:2 fail:2 skip:0 total:4
  [11:18:55] ================= [FAILED] irq_test_cases ==================
  [11:18:55] ============================================================
  [11:18:55] Testing complete. Ran 4 tests: passed: 2, failed: 2

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

Changes in v4:
 * depend on KUNIT=y: CONFIG_IRQ_KUNIT_TEST=y is incompatible with
   CONFIG_KUNIT=m -- same problem as in commit 35c57fc3f8ea ("kunit:
   building kunit as a module breaks allmodconfig")

Changes in v3:
 * send as standalone patch, since dependent patch was merged
 * make IRQ_KUNIT_TEST bool; we depend on a few internal functions that
   are not exported to modules. Reported:
   https://lore.kernel.org/oe-kbuild-all/202505152136.y04AHovS-lkp@intel.com/

Changes in v2:
 * add request_irq()/disable_irq()/free_irq()/request_irq() test
   sequence
 * clean up more resources in tests
 * move tests to patch 2 (i.e., after bugs are fixed and tests pass)
 * adapt to irq_startup_managed() (new API)

 kernel/irq/Kconfig    |  11 ++
 kernel/irq/Makefile   |   1 +
 kernel/irq/irq_test.c | 229 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 241 insertions(+)
 create mode 100644 kernel/irq/irq_test.c

diff --git a/kernel/irq/Kconfig b/kernel/irq/Kconfig
index 3f02a0e45254..1da5e9d9da71 100644
--- a/kernel/irq/Kconfig
+++ b/kernel/irq/Kconfig
@@ -144,6 +144,17 @@ config GENERIC_IRQ_DEBUGFS
 config GENERIC_IRQ_KEXEC_CLEAR_VM_FORWARD
 	bool
 
+config IRQ_KUNIT_TEST
+	bool "KUnit tests for IRQ management APIs" if !KUNIT_ALL_TESTS
+	depends on KUNIT=y
+	default KUNIT_ALL_TESTS
+	imply SMP
+	help
+	  This option enables KUnit tests for the IRQ subsystem API. These are
+	  only for development and testing, not for regular kernel use cases.
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
index 000000000000..5161b56a12f9
--- /dev/null
+++ b/kernel/irq/irq_test.c
@@ -0,0 +1,229 @@
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
+static irqreturn_t noop_handler(int irq, void *data)
+{
+	return IRQ_HANDLED;
+}
+
+static void noop(struct irq_data *data) { }
+static unsigned int noop_ret(struct irq_data *data) { return 0; }
+
+static int noop_affinity(struct irq_data *data, const struct cpumask *dest,
+			 bool force)
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
+	virq = irq_domain_alloc_descs(-1, 1, 0, NUMA_NO_NODE, NULL);
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
+	free_irq(virq, NULL);
+}
+
+static void irq_free_disabled_test(struct kunit *test)
+{
+	struct irq_desc *desc;
+	int virq, ret;
+
+	virq = irq_domain_alloc_descs(-1, 1, 0, NUMA_NO_NODE, NULL);
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
+	free_irq(virq, NULL);
+	KUNIT_EXPECT_GE(test, desc->depth, 1);
+
+	ret = request_irq(virq, noop_handler, 0, "test_irq", NULL);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_EXPECT_EQ(test, desc->depth, 0);
+
+	free_irq(virq, NULL);
+}
+
+static void irq_shutdown_depth_test(struct kunit *test)
+{
+	struct irq_desc *desc;
+	struct irq_data *data;
+	int virq, ret;
+	struct irq_affinity_desc affinity = {
+		.is_managed = 1,
+		.mask = CPU_MASK_ALL,
+	};
+
+	if (!IS_ENABLED(CONFIG_SMP))
+		kunit_skip(test, "requires CONFIG_SMP for managed shutdown");
+
+	virq = irq_domain_alloc_descs(-1, 1, 0, NUMA_NO_NODE, &affinity);
+	KUNIT_ASSERT_GE(test, virq, 0);
+
+	irq_set_chip_and_handler(virq, &dummy_irq_chip, handle_simple_irq);
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
+	irq_shutdown_and_deactivate(desc);
+
+	KUNIT_EXPECT_FALSE(test, irqd_is_activated(data));
+	KUNIT_EXPECT_FALSE(test, irqd_is_started(data));
+
+	KUNIT_EXPECT_EQ(test, irq_activate(desc), 0);
+#ifdef CONFIG_SMP
+	irq_startup_managed(desc);
+#endif
+
+	KUNIT_EXPECT_EQ(test, desc->depth, 1);
+
+	enable_irq(virq);
+	KUNIT_EXPECT_EQ(test, desc->depth, 0);
+
+	free_irq(virq, NULL);
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
+	if (!IS_ENABLED(CONFIG_SMP))
+		kunit_skip(test, "requires CONFIG_SMP for CPU hotplug");
+	if (!get_cpu_device(1))
+		kunit_skip(test, "requires more than 1 CPU for CPU hotplug");
+	if (!cpu_is_hotpluggable(1))
+		kunit_skip(test, "CPU 1 must be hotpluggable");
+
+	cpumask_copy(&affinity.mask, cpumask_of(1));
+
+	virq = irq_domain_alloc_descs(-1, 1, 0, NUMA_NO_NODE, &affinity);
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
+	KUNIT_EXPECT_FALSE(test, irqd_is_activated(data));
+	KUNIT_EXPECT_FALSE(test, irqd_is_started(data));
+	KUNIT_EXPECT_GE(test, desc->depth, 1);
+	KUNIT_EXPECT_EQ(test, add_cpu(1), 0);
+
+	KUNIT_EXPECT_FALSE(test, irqd_is_activated(data));
+	KUNIT_EXPECT_FALSE(test, irqd_is_started(data));
+	KUNIT_EXPECT_EQ(test, desc->depth, 1);
+
+	enable_irq(virq);
+	KUNIT_EXPECT_TRUE(test, irqd_is_activated(data));
+	KUNIT_EXPECT_TRUE(test, irqd_is_started(data));
+	KUNIT_EXPECT_EQ(test, desc->depth, 0);
+
+	free_irq(virq, NULL);
+}
+
+static struct kunit_case irq_test_cases[] = {
+	KUNIT_CASE(irq_disable_depth_test),
+	KUNIT_CASE(irq_free_disabled_test),
+	KUNIT_CASE(irq_shutdown_depth_test),
+	KUNIT_CASE(irq_cpuhotplug_test),
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
2.49.0.1151.ga128411c76-goog

