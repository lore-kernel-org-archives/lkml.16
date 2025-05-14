Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1439296149
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 20:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747253648; cv=none; b=lt9t5XQFOxDybqm7mQF2F8aJ+DcYFitUNeTv9wtedQ+lmqDuLR77yEQ8TFB4xZHq4WkfhkJGXfb5IuvSUlMK5EDCeru1s8D3NYU39xHrlEyZmHvkYCWFF3NXTA9uJjHos8MRDNpVwq4C7iP7+IQilM6CULFO/rKSoG3gD/yZiHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747253648; c=relaxed/simple;
	bh=mSyvG5UdJEvIjesZtc4MF1mH7iQifdrrGu9X9uNA56I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bgj6VLQ25q+37GHRJOESqYJGEuUmOvyq94blfepi8WXGhypAhZsqXvKPRtfE+cP1Y54BX7EaPU/zeBb98ucOqdFFEVaxj6Zp2hm3uuRKU2Un4/qEdkDnFVfr9rnUNkeRJjNrqet+C/sCCw3PPW6CWal8pDJLvLGJod8EDNfYW3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QC8eMc7c; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QC8eMc7c"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-30a8cbddca4so285175a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 13:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747253646; x=1747858446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c/inNegz0udXErsdOR9yI4TlKw0UxuhD6QnZdnsPtzs=;
        b=QC8eMc7cK4HBHQYe+XGXZWpFExwfQuAhatyZJKOP6OALqKvkELOxeHIDaswYZ/6eg2
         qGQHKOkfL+vT/aLr3ZQCTEIj5PcsYMaq1ViT/2XplaVKoPk8Cr0UtZ2ueuyiF2q3QWt9
         cnj10/lqK2UZdBg+cLlJz+/as5MatMFl64QqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747253646; x=1747858446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c/inNegz0udXErsdOR9yI4TlKw0UxuhD6QnZdnsPtzs=;
        b=QCj7M4FjKiuGl8HS1qzZQOog9YG3+MrQZSa9eQ/OKQ2iyTKtYKIUvl07l7693lgTX0
         DfO5WxsE7C8nQ+GtjvCK8jYZWdPVifHXRLoIlHk1luLrO1qsF4H6IqDUp2rIt+cWZiiZ
         z2c1ohLhGSqKTrLvujmns2iDtL1CoDeviT3y1RSKp9HCnwSjrApJU5AQAvtl1dHzf6BT
         G+1GY8PzFIYxeEiIUZlEHygyghPB2UrHmZIZOgwn1ZUBAjqKXl3v0k7iCkX+NLT9t8eY
         QSdHh9CdRheg+3Teebgvdev+Rxvc+NUm4uZaN2n6aUbj5jGm7h/nK8IfeiuPm8DEJsFm
         Tu+w==
X-Forwarded-Encrypted: i=1; AJvYcCWwLByARxaD1z/UBXGpl0/o7uKZB8QDaEe7EoRcgDBoaO2gM94dTlSkV1s2DOCMZHS38mWp5jjXcULV7sc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyopnhhEWYDlmbGgY3nnfSavl9jaMCOBD1+/7tgG9XJ+EZnsvDq
	vo8aDtCp5HlvFCG1AVE6SbqHXbXJoiBXogtfi2jjvwasZcoqujHfi72FkYy0gA==
X-Gm-Gg: ASbGnctE9t+pzFbrLNN+P4H2bwKhlvn7KH0mDFDG0RZ2v72K1le23UzzZ69XJjxIDqw
	hk3+Ty6yhbfPIsfOimBGvTEpOQAssHlayFO6yuj3IHyjwN4vxnEON95cBa7PfCTYTIu/yzeYulk
	oJnNdLqK/bjQ2LTst+Hxq+LwGZK3YifNnlPicxDbGepBPXhutUTxMSO7s3ytQhWtF32q11weIKs
	j+9RBOweYRpqfq4JS9rd4OOc77tZUfaowjWIvGYWPhK1OhnJEhqCVmWZFJyF/VMVzjqzqPBsQBh
	DWuKRHK/B2xGBb+NUQFMYWHAnpjTWpSjhCrC5b3mkC+WE5bsgorrX8tybzsV1BsMmiO23MLFZdy
	wg94jlglttErRGg==
X-Google-Smtp-Source: AGHT+IE6N6/l5Z5kIFwQP+/AgCIZzsQ9hjTmZoL4EwJxImdHLHDgQE9ZQv0BHDn5CEiearFmuQXUWA==
X-Received: by 2002:a17:90b:4c0a:b0:30a:9025:84d6 with SMTP id 98e67ed59e1d1-30e2e630012mr7264208a91.29.1747253645680;
        Wed, 14 May 2025 13:14:05 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:cd06:335b:936a:7dc1])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-30e33424dbbsm1972832a91.11.2025.05.14.13.14.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 13:14:05 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Tsai Sung-Fu <danielsftsai@google.com>,
	Douglas Anderson <dianders@chromium.org>,
	linux-kernel@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH v2 2/2] genirq: Add kunit tests for depth counts
Date: Wed, 14 May 2025 13:13:17 -0700
Message-ID: <20250514201353.3481400-3-briannorris@chromium.org>
X-Mailer: git-send-email 2.49.0.1045.g170613ef41-goog
In-Reply-To: <20250514201353.3481400-1-briannorris@chromium.org>
References: <20250514201353.3481400-1-briannorris@chromium.org>
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

Without the prior fix ("genirq: Retain depth for managed IRQs across CPU
hotplug"), we fail as follows:

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
index 3f02a0e45254..7429abe5011f 100644
--- a/kernel/irq/Kconfig
+++ b/kernel/irq/Kconfig
@@ -144,6 +144,17 @@ config GENERIC_IRQ_DEBUGFS
 config GENERIC_IRQ_KEXEC_CLEAR_VM_FORWARD
 	bool
 
+config IRQ_KUNIT_TEST
+	tristate "KUnit tests for IRQ management APIs" if !KUNIT_ALL_TESTS
+	depends on KUNIT
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
2.49.0.1045.g170613ef41-goog

