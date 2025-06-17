Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A633C01;
	Tue, 17 Jun 2025 10:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.138.61.252
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750156223; cv=none; b=BP3PYi4ttGTYvCsBSh2rMTPZ/kRG9dTJmuOP5aiS1RqriB8Fjjd3r+fIZD2d0VV+QYAAxb6ArsSadNgBYjtHAZBA1O2WWzSCINtw899o850zoFPgZUZW48Pbua9nkBgVhYVYbeuTsp7E8ihx3Z0cQpQmR83xkmCMqHWp9VzMfEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750156223; c=relaxed/simple;
	bh=AdLo+jnyMV5Ky7sRTtO3pQSF5v4mk/+U1lXm7INuZRA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=di57XUtXihnVWY0CikOGcTmcPPDrMbgMi7AA6Lur5fspQCx2WzNW0UwYrtfUyuBAx9AwcElrKOhZKWu05XaRYqRI03LodtZSHddqFW4TfoDcG2qMTkBDGOL5okhkhbuLTvXuVFYdiHGuOC7yT9ejGjNyAK6PrXUB7rtfs3y46PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com; spf=pass smtp.mailfrom=fujitsu.com; dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b=H7zQ5qz1; arc=none smtp.client-ip=139.138.61.252
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b="H7zQ5qz1"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1750156220; x=1781692220;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=AdLo+jnyMV5Ky7sRTtO3pQSF5v4mk/+U1lXm7INuZRA=;
  b=H7zQ5qz1wJAZ6uoMwP3OE7WILcexoX8sbjkoSApUvojD4QvP2w5VyQGb
   gIrH412C//Dwpmaet5Ps6ciP1Lyu0meadBfT2CEzKrCRkVQg6EnE1W3/g
   6Truh/ZFEiPV6sA2Ui67HCb1eOX1JNBmy0NKRcoSLCGvfmCqlfjOWj7F1
   YbJSq6lDLLvWmZB7XyW1kmyaFZPGgP/rNh7/eibeTo1Ejz6AWj/UcM0aN
   YCu6yWm0xweUgVv7tkvZPnWHC6XjF0HnO/IFYE99aP8D0CbD2AtmUWrfA
   01Rr/PdL4I0KsW8mri6ia0ZzC6W2ifQNPR/gSfz+gKV3JwDrl0NzJm0t5
   g==;
X-CSE-ConnectionGUID: 1ZG41gbHTOa4y+2Ajt9ibw==
X-CSE-MsgGUID: StjZN1TwRIm9cYaTaqrXOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="181886993"
X-IronPort-AV: E=Sophos;i="6.16,243,1744038000"; 
   d="scan'208";a="181886993"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 19:29:08 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 2E63415907;
	Tue, 17 Jun 2025 19:29:06 +0900 (JST)
Received: from oym-om2.fujitsu.com (oym-om2.o.css.fujitsu.com [10.85.58.162])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id DC52CD507F;
	Tue, 17 Jun 2025 19:29:05 +0900 (JST)
Received: from sm-arm-grace07.ssoft.mng.com (sm-x86-stp01.soft.fujitsu.com [10.124.178.20])
	by oym-om2.fujitsu.com (Postfix) with ESMTP id 2BD7440030B11;
	Tue, 17 Jun 2025 19:29:05 +0900 (JST)
From: Koichi Okuno <fj2767dz@fujitsu.com>
To: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Koichi Okuno <fj2767dz@fujitsu.com>
Subject: [PATCH v5 1/2] perf: Fujitsu: Add the Uncore MAC PMU driver
Date: Tue, 17 Jun 2025 19:27:49 +0900
Message-ID: <20250617102819.3685543-2-fj2767dz@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617102819.3685543-1-fj2767dz@fujitsu.com>
References: <20250617102819.3685543-1-fj2767dz@fujitsu.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds two new dynamic PMUs to the Perf Events framework to program
and control the Uncore MAC PMUs in Fujitsu chips.

These drivers were created with reference to drivers/perf/qcom_l3_pmu.c.

These drivers export formatting and event information to sysfs so they can
be used by the perf user space tools with the syntaxes:

perf stat -e mac_iod0_mac0_ch0/ea-mac/ ls
perf stat -e mac_iod0_mac0_ch0/event=0x80/ ls

FUJITSU-MONAKA PMU Events Specification v1.1 URL:
https://github.com/fujitsu/FUJITSU-MONAKA

Signed-off-by: Koichi Okuno <fj2767dz@fujitsu.com>
---
 .../admin-guide/perf/fujitsu_mac_pmu.rst      |  73 +++
 Documentation/admin-guide/perf/index.rst      |   1 +
 drivers/perf/Kconfig                          |   9 +
 drivers/perf/Makefile                         |   1 +
 drivers/perf/fujitsu_mac_pmu.c                | 569 ++++++++++++++++++
 5 files changed, 653 insertions(+)
 create mode 100644 Documentation/admin-guide/perf/fujitsu_mac_pmu.rst
 create mode 100644 drivers/perf/fujitsu_mac_pmu.c

diff --git a/Documentation/admin-guide/perf/fujitsu_mac_pmu.rst b/Documentation/admin-guide/perf/fujitsu_mac_pmu.rst
new file mode 100644
index 000000000000..383f3c1bbde7
--- /dev/null
+++ b/Documentation/admin-guide/perf/fujitsu_mac_pmu.rst
@@ -0,0 +1,73 @@
+====================================================
+Fujitsu Uncore MAC Performance Monitoring Unit (PMU)
+====================================================
+
+This driver supports the Uncore MAC PMUs found in Fujitsu chips.
+Each MAC PMU on these chips is exposed as a uncore perf PMU with device name
+mac_iod<iod>_mac<mac>_ch<ch>.
+
+The driver provides a description of its available events and configuration
+options in sysfs, see /sys/bus/event_sources/devices/mac_iod<iod>_mac<mac>_ch<ch>/.
+This driver exports:
+- formats, used by perf user space and other tools to configure events
+- events, used by perf user space and other tools to create events
+  symbolically, e.g.:
+    perf stat -a -e mac_iod0_mac0_ch0/event=0x21/ ls
+- cpumask, used by perf user space and other tools to know on which CPUs
+  to open the events
+
+This driver supports the following events:
+- cycles
+  This event counts MAC cycles at MAC frequency.
+- read-count
+  This event counts the number of read requests to MAC.
+- read-count-request
+  This event counts the number of read requests including retry to MAC.
+- read-count-return
+  This event counts the number of responses to read requests to MAC.
+- read-count-request-pftgt
+  This event counts the number of read requests including retry with PFTGT
+  flag.
+- read-count-request-normal
+  This event counts the number of read requests including retry without PFTGT
+  flag.
+- read-count-return-pftgt-hit
+  This event counts the number of responses to read requests which hit the
+  PFTGT buffer.
+- read-count-return-pftgt-miss
+  This event counts the number of responses to read requests which miss the
+  PFTGT buffer.
+- read-wait
+  This event counts outstanding read requests issued by DDR memory controller
+  per cycle.
+- write-count
+  This event counts the number of write requests to MAC (including zero write,
+  full write, partial write, write cancel).
+- write-count-write
+  This event counts the number of full write requests to MAC (not including
+  zero write).
+- write-count-pwrite
+  This event counts the number of partial write requests to MAC.
+- memory-read-count
+  This event counts the number of read requests from MAC to memory.
+- memory-write-count
+  This event counts the number of full write requests from MAC to memory.
+- memory-pwrite-count
+  This event counts the number of partial write requests from MAC to memory.
+- ea-mac
+  This event counts energy consumption of MAC.
+- ea-memory
+  This event counts energy consumption of memory.
+- ea-memory-mac-write
+  This event counts the number of write requests from MAC to memory.
+- ea-ha
+  This event counts energy consumption of HA.
+
+  'ea' is the abbreviation for 'Energy Analyzer'.
+
+Examples for use with perf::
+
+  perf stat -e mac_iod0_mac0_ch0/ea-mac/ ls
+
+Given that these are uncore PMUs the driver does not support sampling, therefore
+"perf record" will not work. Per-task perf sessions are not supported.
diff --git a/Documentation/admin-guide/perf/index.rst b/Documentation/admin-guide/perf/index.rst
index 072b510385c4..e0262060db17 100644
--- a/Documentation/admin-guide/perf/index.rst
+++ b/Documentation/admin-guide/perf/index.rst
@@ -29,3 +29,4 @@ Performance monitor support
    cxl
    ampere_cspmu
    mrvl-pem-pmu
+   fujitsu_mac_pmu
diff --git a/drivers/perf/Kconfig b/drivers/perf/Kconfig
index 278c929dc87a..269bf72a512a 100644
--- a/drivers/perf/Kconfig
+++ b/drivers/perf/Kconfig
@@ -178,6 +178,15 @@ config FSL_IMX9_DDR_PMU
 	 can give information about memory throughput and other related
 	 events.
 
+config FUJITSU_MAC_PMU
+	bool "Fujitsu Uncore MAC PMU"
+	depends on (ARM64 && (ACPI || COMPILE_TEST))
+	help
+	 Provides support for the Uncore MAC performance monitor unit (PMU)
+	 in Fujitsu processors.
+	 Adds the Uncore MAC PMU into the perf events subsystem for
+	 monitoring Uncore MAC events.
+
 config QCOM_L2_PMU
 	bool "Qualcomm Technologies L2-cache PMU"
 	depends on ARCH_QCOM && ARM64 && ACPI
diff --git a/drivers/perf/Makefile b/drivers/perf/Makefile
index de71d2574857..c9a2ba78d34f 100644
--- a/drivers/perf/Makefile
+++ b/drivers/perf/Makefile
@@ -14,6 +14,7 @@ obj-$(CONFIG_ARM_SMMU_V3_PMU) += arm_smmuv3_pmu.o
 obj-$(CONFIG_FSL_IMX8_DDR_PMU) += fsl_imx8_ddr_perf.o
 obj-$(CONFIG_FSL_IMX9_DDR_PMU) += fsl_imx9_ddr_perf.o
 obj-$(CONFIG_HISI_PMU) += hisilicon/
+obj-$(CONFIG_FUJITSU_MAC_PMU) += fujitsu_mac_pmu.o
 obj-$(CONFIG_QCOM_L2_PMU)	+= qcom_l2_pmu.o
 obj-$(CONFIG_QCOM_L3_PMU) += qcom_l3_pmu.o
 obj-$(CONFIG_RISCV_PMU) += riscv_pmu.o
diff --git a/drivers/perf/fujitsu_mac_pmu.c b/drivers/perf/fujitsu_mac_pmu.c
new file mode 100644
index 000000000000..300df4676578
--- /dev/null
+++ b/drivers/perf/fujitsu_mac_pmu.c
@@ -0,0 +1,569 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Driver for the Uncore MAC PMUs in Fujitsu chips.
+ *
+ * See Documentation/admin-guide/perf/fujitsu_mac_pmu.rst for more details.
+ *
+ * This driver is based on drivers/perf/qcom_l3_pmu.c
+ * Copyright (c) 2015-2017, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2024 Fujitsu. All rights reserved.
+ */
+
+#include <linux/acpi.h>
+#include <linux/bitops.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/list.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/perf_event.h>
+#include <linux/platform_device.h>
+
+/* Number of counters on each PMU */
+#define MAC_NUM_COUNTERS  8
+/* Mask for the event type field within perf_event_attr.config and EVTYPE reg */
+#define MAC_EVTYPE_MASK   0xFF
+
+/* Perfmon registers */
+#define MAC_PM_EVCNTR(__cntr) (0x000 + (__cntr) * 8)
+#define MAC_PM_CNTCTL(__cntr) (0x100 + (__cntr) * 8)
+#define MAC_PM_EVTYPE(__cntr) (0x200 + (__cntr) * 8)
+#define MAC_PM_CR         0x400
+#define MAC_PM_CNTENSET   0x410
+#define MAC_PM_CNTENCLR   0x418
+#define MAC_PM_INTENSET   0x420
+#define MAC_PM_INTENCLR   0x428
+#define MAC_PM_OVSR       0x440
+
+/* MAC_PM_CNTCTLx */
+#define PMCNT_RESET           0
+
+/* MAC_PM_EVTYPEx */
+#define EVSEL(__val)          FIELD_GET(MAC_EVTYPE_MASK, __val)
+
+/* MAC_PM_CR */
+#define PM_RESET              BIT(1)
+#define PM_ENABLE             BIT(0)
+
+/* MAC_PM_CNTENSET */
+#define PMCNTENSET(__cntr)    BIT(__cntr)
+
+/* MAC_PM_CNTENCLR */
+#define PMCNTENCLR(__cntr)    BIT(__cntr)
+#define PM_CNTENCLR_RESET     0xFF
+
+/* MAC_PM_INTENSET */
+#define PMINTENSET(__cntr)    BIT(__cntr)
+
+/* MAC_PM_INTENCLR */
+#define PMINTENCLR(__cntr)    BIT(__cntr)
+#define PM_INTENCLR_RESET     0xFF
+
+/* MAC_PM_OVSR */
+#define PMOVSRCLR(__cntr)     BIT(__cntr)
+#define PMOVSRCLR_RESET       0xFF
+
+#define MAC_EVENT_CYCLES			0x000
+#define MAC_EVENT_READ_COUNT			0x010
+#define MAC_EVENT_READ_COUNT_REQUEST		0x011
+#define MAC_EVENT_READ_COUNT_RETURN		0x012
+#define MAC_EVENT_READ_COUNT_REQUEST_PFTGT	0x013
+#define MAC_EVENT_READ_COUNT_REQUEST_NORMAL	0x014
+#define MAC_EVENT_READ_COUNT_RETURN_PFTGT_HIT	0x015
+#define MAC_EVENT_READ_COUNT_RETURN_PFTGT_MISS	0x016
+#define MAC_EVENT_READ_WAIT			0x017
+#define MAC_EVENT_WRITE_COUNT			0x020
+#define MAC_EVENT_WRITE_COUNT_WRITE		0x021
+#define MAC_EVENT_WRITE_COUNT_PWRITE		0x022
+#define MAC_EVENT_MEMORY_READ_COUNT		0x040
+#define MAC_EVENT_MEMORY_WRITE_COUNT		0x050
+#define MAC_EVENT_MEMORY_PWRITE_COUNT		0x060
+#define MAC_EVENT_EA_MAC			0x080
+#define MAC_EVENT_EA_MEMORY			0x090
+#define MAC_EVENT_EA_MEMORY_MAC_WRITE		0x092
+#define MAC_EVENT_EA_HA			0x0a0
+
+struct mac_pmu {
+	struct pmu		pmu;
+	struct hlist_node	node;
+	void __iomem		*regs;
+	struct perf_event	*events[MAC_NUM_COUNTERS];
+	unsigned long		used_mask[BITS_TO_LONGS(MAC_NUM_COUNTERS)];
+	cpumask_t		cpumask;
+};
+
+#define to_mac_pmu(p) (container_of(p, struct mac_pmu, pmu))
+
+static int mac_pmu_cpuhp_state;
+
+static void fujitsu_mac_counter_start(struct perf_event *event)
+{
+	struct mac_pmu *macpmu = to_mac_pmu(event->pmu);
+	int idx = event->hw.idx;
+
+	/* Initialize the hardware counter and reset prev_count*/
+	local64_set(&event->hw.prev_count, 0);
+	writeq_relaxed(0, macpmu->regs + MAC_PM_EVCNTR(idx));
+
+	/* Set the event type */
+	writeq_relaxed(EVSEL(event->attr.config), macpmu->regs + MAC_PM_EVTYPE(idx));
+
+	/* Enable interrupt generation by this counter */
+	writeq_relaxed(PMINTENSET(idx), macpmu->regs + MAC_PM_INTENSET);
+
+	/* Finally, enable the counter */
+	writeq_relaxed(PMCNT_RESET, macpmu->regs + MAC_PM_CNTCTL(idx));
+	writeq_relaxed(PMCNTENSET(idx), macpmu->regs + MAC_PM_CNTENSET);
+}
+
+static void fujitsu_mac_counter_stop(struct perf_event *event,
+					      int flags)
+{
+	struct mac_pmu *macpmu = to_mac_pmu(event->pmu);
+	int idx = event->hw.idx;
+
+	/* Disable the counter */
+	writeq_relaxed(PMCNTENCLR(idx), macpmu->regs + MAC_PM_CNTENCLR);
+
+	/* Disable interrupt generation by this counter */
+	writeq_relaxed(PMINTENCLR(idx), macpmu->regs + MAC_PM_INTENCLR);
+}
+
+static void fujitsu_mac_counter_update(struct perf_event *event)
+{
+	struct mac_pmu *macpmu = to_mac_pmu(event->pmu);
+	int idx = event->hw.idx;
+	u64 prev, new;
+
+	do {
+		prev = local64_read(&event->hw.prev_count);
+		new = readq_relaxed(macpmu->regs + MAC_PM_EVCNTR(idx));
+	} while (local64_cmpxchg(&event->hw.prev_count, prev, new) != prev);
+
+	local64_add(new - prev, &event->count);
+}
+
+static inline void fujitsu_mac__init(struct mac_pmu *macpmu)
+{
+	int i;
+
+	writeq_relaxed(PM_RESET, macpmu->regs + MAC_PM_CR);
+
+	writeq_relaxed(PM_CNTENCLR_RESET, macpmu->regs + MAC_PM_CNTENCLR);
+	writeq_relaxed(PM_INTENCLR_RESET, macpmu->regs + MAC_PM_INTENCLR);
+	writeq_relaxed(PMOVSRCLR_RESET, macpmu->regs + MAC_PM_OVSR);
+
+	for (i = 0; i < MAC_NUM_COUNTERS; ++i) {
+		writeq_relaxed(PMCNT_RESET, macpmu->regs + MAC_PM_CNTCTL(i));
+		writeq_relaxed(EVSEL(0), macpmu->regs + MAC_PM_EVTYPE(i));
+	}
+
+	/*
+	 * Use writeq here to ensure all programming commands are done
+	 * before proceeding
+	 */
+	writeq(PM_ENABLE, macpmu->regs + MAC_PM_CR);
+}
+
+static irqreturn_t fujitsu_mac__handle_irq(int irq_num, void *data)
+{
+	struct mac_pmu *macpmu = data;
+	/* Read the overflow status register */
+	long status = readq_relaxed(macpmu->regs + MAC_PM_OVSR);
+	int idx;
+
+	if (status == 0)
+		return IRQ_NONE;
+
+	/* Clear the bits we read on the overflow status register */
+	writeq_relaxed(status, macpmu->regs + MAC_PM_OVSR);
+
+	for_each_set_bit(idx, &status, MAC_NUM_COUNTERS) {
+		struct perf_event *event;
+
+		event = macpmu->events[idx];
+		if (!event)
+			continue;
+
+		fujitsu_mac_counter_update(event);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static void fujitsu_mac__pmu_enable(struct pmu *pmu)
+{
+	struct mac_pmu *macpmu = to_mac_pmu(pmu);
+
+	/* Ensure the other programming commands are observed before enabling */
+	wmb();
+
+	writeq_relaxed(PM_ENABLE, macpmu->regs + MAC_PM_CR);
+}
+
+static void fujitsu_mac__pmu_disable(struct pmu *pmu)
+{
+	struct mac_pmu *macpmu = to_mac_pmu(pmu);
+
+	writeq_relaxed(0, macpmu->regs + MAC_PM_CR);
+
+	/* Ensure the basic counter unit is stopped before proceeding */
+	wmb();
+}
+
+/*
+ * We must NOT create groups containing events from multiple hardware PMUs,
+ * although mixing different software and hardware PMUs is allowed.
+ */
+static bool fujitsu_mac__validate_event_group(struct perf_event *event)
+{
+	struct perf_event *leader = event->group_leader;
+	struct perf_event *sibling;
+	int counters = 0;
+
+	if (leader->pmu != event->pmu && !is_software_event(leader))
+		return false;
+
+	/* The sum of the counters used by the event and its leader event */
+	counters = 2;
+
+	for_each_sibling_event(sibling, leader) {
+		if (is_software_event(sibling))
+			continue;
+		if (sibling->pmu != event->pmu)
+			return false;
+		counters++;
+	}
+
+	/*
+	 * If the group requires more counters than the HW has, it
+	 * cannot ever be scheduled.
+	 */
+	return counters <= MAC_NUM_COUNTERS;
+}
+
+static int fujitsu_mac__event_init(struct perf_event *event)
+{
+	struct mac_pmu *macpmu = to_mac_pmu(event->pmu);
+	struct hw_perf_event *hwc = &event->hw;
+
+	/* Is the event for this PMU? */
+	if (event->attr.type != event->pmu->type)
+		return -ENOENT;
+
+	/*
+	 * Sampling not supported since these events are not
+	 * core-attributable.
+	 */
+	if (hwc->sample_period)
+		return -EINVAL;
+
+	/*
+	 * Task mode not available, we run the counters as socket counters,
+	 * not attributable to any CPU and therefore cannot attribute per-task.
+	 */
+	if (event->cpu < 0)
+		return -EINVAL;
+
+	/* Validate the group */
+	if (!fujitsu_mac__validate_event_group(event))
+		return -EINVAL;
+
+	hwc->idx = -1;
+
+	/*
+	 * Many perf core operations (eg. events rotation) operate on a
+	 * single CPU context. This is obvious for CPU PMUs, where one
+	 * expects the same sets of events being observed on all CPUs,
+	 * but can lead to issues for off-core PMUs, like this one, where
+	 * each event could be theoretically assigned to a different CPU.
+	 * To mitigate this, we enforce CPU assignment to one designated
+	 * processor (the one described in the "cpumask" attribute exported
+	 * by the PMU device). perf user space tools honor this and avoid
+	 * opening more than one copy of the events.
+	 */
+	event->cpu = cpumask_first(&macpmu->cpumask);
+
+	return 0;
+}
+
+static void fujitsu_mac__event_start(struct perf_event *event, int flags)
+{
+	struct hw_perf_event *hwc = &event->hw;
+
+	hwc->state = 0;
+	fujitsu_mac_counter_start(event);
+}
+
+static void fujitsu_mac__event_stop(struct perf_event *event, int flags)
+{
+	struct hw_perf_event *hwc = &event->hw;
+
+	if (hwc->state & PERF_HES_STOPPED)
+		return;
+
+	fujitsu_mac_counter_stop(event, flags);
+	if (flags & PERF_EF_UPDATE)
+		fujitsu_mac_counter_update(event);
+	hwc->state |= PERF_HES_STOPPED | PERF_HES_UPTODATE;
+}
+
+static int fujitsu_mac__event_add(struct perf_event *event, int flags)
+{
+	struct mac_pmu *macpmu = to_mac_pmu(event->pmu);
+	struct hw_perf_event *hwc = &event->hw;
+	int idx;
+
+	/* Try to allocate a counter. */
+	idx = bitmap_find_free_region(macpmu->used_mask, MAC_NUM_COUNTERS, 0);
+	if (idx < 0)
+		/* The counters are all in use. */
+		return -EAGAIN;
+
+	hwc->idx = idx;
+	hwc->state = PERF_HES_STOPPED | PERF_HES_UPTODATE;
+	macpmu->events[idx] = event;
+
+	if (flags & PERF_EF_START)
+		fujitsu_mac__event_start(event, 0);
+
+	/* Propagate changes to the userspace mapping. */
+	perf_event_update_userpage(event);
+
+	return 0;
+}
+
+static void fujitsu_mac__event_del(struct perf_event *event, int flags)
+{
+	struct mac_pmu *macpmu = to_mac_pmu(event->pmu);
+	struct hw_perf_event *hwc = &event->hw;
+
+	/* Stop and clean up */
+	fujitsu_mac__event_stop(event, flags | PERF_EF_UPDATE);
+	macpmu->events[hwc->idx] = NULL;
+	bitmap_release_region(macpmu->used_mask, hwc->idx, 0);
+
+	/* Propagate changes to the userspace mapping. */
+	perf_event_update_userpage(event);
+}
+
+static void fujitsu_mac__event_read(struct perf_event *event)
+{
+	fujitsu_mac_counter_update(event);
+}
+
+#define MAC_PMU_FORMAT_ATTR(_name, _config)				      \
+	(&((struct dev_ext_attribute[]) {				      \
+		{ .attr = __ATTR(_name, 0444, device_show_string, NULL),      \
+		  .var = (void *) _config, }				      \
+	})[0].attr.attr)
+
+static struct attribute *fujitsu_mac_pmu_formats[] = {
+	MAC_PMU_FORMAT_ATTR(event, "config:0-7"),
+	NULL
+};
+
+static const struct attribute_group fujitsu_mac_pmu_format_group = {
+	.name = "format",
+	.attrs = fujitsu_mac_pmu_formats,
+};
+
+static ssize_t mac_pmu_event_show(struct device *dev,
+				     struct device_attribute *attr, char *page)
+{
+	struct perf_pmu_events_attr *pmu_attr;
+
+	pmu_attr = container_of(attr, struct perf_pmu_events_attr, attr);
+	return sysfs_emit(page, "event=0x%02llx\n", pmu_attr->id);
+}
+
+#define MAC_EVENT_ATTR(_name, _id)					     \
+	PMU_EVENT_ATTR_ID(_name, mac_pmu_event_show, _id)
+
+static struct attribute *fujitsu_mac_pmu_events[] = {
+	MAC_EVENT_ATTR(cycles, MAC_EVENT_CYCLES),
+	MAC_EVENT_ATTR(read-count, MAC_EVENT_READ_COUNT),
+	MAC_EVENT_ATTR(read-count-request, MAC_EVENT_READ_COUNT_REQUEST),
+	MAC_EVENT_ATTR(read-count-return, MAC_EVENT_READ_COUNT_RETURN),
+	MAC_EVENT_ATTR(read-count-request-pftgt, MAC_EVENT_READ_COUNT_REQUEST_PFTGT),
+	MAC_EVENT_ATTR(read-count-request-normal, MAC_EVENT_READ_COUNT_REQUEST_NORMAL),
+	MAC_EVENT_ATTR(read-count-return-pftgt-hit, MAC_EVENT_READ_COUNT_RETURN_PFTGT_HIT),
+	MAC_EVENT_ATTR(read-count-return-pftgt-miss, MAC_EVENT_READ_COUNT_RETURN_PFTGT_MISS),
+	MAC_EVENT_ATTR(read-wait, MAC_EVENT_READ_WAIT),
+	MAC_EVENT_ATTR(write-count, MAC_EVENT_WRITE_COUNT),
+	MAC_EVENT_ATTR(write-count-write, MAC_EVENT_WRITE_COUNT_WRITE),
+	MAC_EVENT_ATTR(write-count-pwrite, MAC_EVENT_WRITE_COUNT_PWRITE),
+	MAC_EVENT_ATTR(memory-read-count, MAC_EVENT_MEMORY_READ_COUNT),
+	MAC_EVENT_ATTR(memory-write-count, MAC_EVENT_MEMORY_WRITE_COUNT),
+	MAC_EVENT_ATTR(memory-pwrite-count, MAC_EVENT_MEMORY_PWRITE_COUNT),
+	MAC_EVENT_ATTR(ea-mac, MAC_EVENT_EA_MAC),
+	MAC_EVENT_ATTR(ea-memory, MAC_EVENT_EA_MEMORY),
+	MAC_EVENT_ATTR(ea-memory-mac-write, MAC_EVENT_EA_MEMORY_MAC_WRITE),
+	MAC_EVENT_ATTR(ea-ha, MAC_EVENT_EA_HA),
+	NULL
+};
+
+static const struct attribute_group fujitsu_mac_pmu_events_group = {
+	.name = "events",
+	.attrs = fujitsu_mac_pmu_events,
+};
+
+static ssize_t cpumask_show(struct device *dev,
+			    struct device_attribute *attr, char *buf)
+{
+	struct mac_pmu *macpmu = to_mac_pmu(dev_get_drvdata(dev));
+
+	return cpumap_print_to_pagebuf(true, buf, &macpmu->cpumask);
+}
+static DEVICE_ATTR_RO(cpumask);
+
+static struct attribute *fujitsu_mac_pmu_cpumask_attrs[] = {
+	&dev_attr_cpumask.attr,
+	NULL
+};
+
+static const struct attribute_group fujitsu_mac_pmu_cpumask_attr_group = {
+	.attrs = fujitsu_mac_pmu_cpumask_attrs,
+};
+
+static const struct attribute_group *fujitsu_mac_pmu_attr_grps[] = {
+	&fujitsu_mac_pmu_format_group,
+	&fujitsu_mac_pmu_events_group,
+	&fujitsu_mac_pmu_cpumask_attr_group,
+	NULL
+};
+
+static int fujitsu_mac_pmu_online_cpu(unsigned int cpu, struct hlist_node *node)
+{
+	struct mac_pmu *macpmu = hlist_entry_safe(node, struct mac_pmu, node);
+
+	/* If there is not a CPU/PMU association pick this CPU */
+	if (cpumask_empty(&macpmu->cpumask))
+		cpumask_set_cpu(cpu, &macpmu->cpumask);
+
+	return 0;
+}
+
+static int fujitsu_mac_pmu_offline_cpu(unsigned int cpu, struct hlist_node *node)
+{
+	struct mac_pmu *macpmu = hlist_entry_safe(node, struct mac_pmu, node);
+	unsigned int target;
+
+	if (!cpumask_test_and_clear_cpu(cpu, &macpmu->cpumask))
+		return 0;
+
+	target = cpumask_any_but(cpu_online_mask, cpu);
+	if (target >= nr_cpu_ids)
+		return 0;
+
+	perf_pmu_migrate_context(&macpmu->pmu, cpu, target);
+	cpumask_set_cpu(target, &macpmu->cpumask);
+
+	return 0;
+}
+
+static int fujitsu_mac_pmu_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct acpi_device *acpi_dev;
+	struct mac_pmu *macpmu;
+	struct resource *memrc;
+	char *name;
+	int ret;
+	u64 uid;
+
+	acpi_dev = ACPI_COMPANION(dev);
+	if (!acpi_dev)
+		return -ENODEV;
+
+	ret = acpi_dev_uid_to_integer(acpi_dev, &uid);
+	if (ret)
+		return dev_err_probe(dev, ret, "unable to read ACPI uid\n");
+
+	macpmu = devm_kzalloc(dev, sizeof(*macpmu), GFP_KERNEL);
+	if (!macpmu)
+		return -ENOMEM;
+
+	name = devm_kasprintf(dev, GFP_KERNEL, "mac_iod%llu_mac%llu_ch%llu",
+			  (uid >> 8) & 0xF, (uid >> 4) & 0xF, uid & 0xF);
+	if (!name)
+		return -ENOMEM;
+
+	macpmu->pmu = (struct pmu) {
+		.parent		= dev,
+		.task_ctx_nr	= perf_invalid_context,
+
+		.pmu_enable	= fujitsu_mac__pmu_enable,
+		.pmu_disable	= fujitsu_mac__pmu_disable,
+		.event_init	= fujitsu_mac__event_init,
+		.add		= fujitsu_mac__event_add,
+		.del		= fujitsu_mac__event_del,
+		.start		= fujitsu_mac__event_start,
+		.stop		= fujitsu_mac__event_stop,
+		.read		= fujitsu_mac__event_read,
+
+		.attr_groups	= fujitsu_mac_pmu_attr_grps,
+		.capabilities	= PERF_PMU_CAP_NO_EXCLUDE,
+	};
+
+	macpmu->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &memrc);
+	if (IS_ERR(macpmu->regs))
+		return PTR_ERR(macpmu->regs);
+
+	fujitsu_mac__init(macpmu);
+
+	ret = platform_get_irq(pdev, 0);
+	if (ret < 0)
+		return ret;
+
+	ret = devm_request_irq(dev, ret, fujitsu_mac__handle_irq, 0,
+						   name, macpmu);
+	if (ret)
+		return dev_err_probe(dev, ret, "Request for IRQ failed for slice @%pa\n",
+							 &memrc->start);
+
+	/* Add this instance to the list used by the offline callback */
+	ret = cpuhp_state_add_instance(mac_pmu_cpuhp_state, &macpmu->node);
+	if (ret)
+		return dev_err_probe(dev, ret, "Error registering hotplug");
+
+	ret = perf_pmu_register(&macpmu->pmu, name, -1);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to register MAC PMU\n");
+
+	dev_dbg(dev, "Registered %s, type: %d\n", name, macpmu->pmu.type);
+
+	return 0;
+}
+
+static const struct acpi_device_id fujitsu_mac_pmu_acpi_match[] = {
+	{ "FUJI200C", },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, fujitsu_mac_pmu_acpi_match);
+
+static struct platform_driver fujitsu_mac_pmu_driver = {
+	.driver = {
+		.name = "fujitsu-mac-pmu",
+		.acpi_match_table = fujitsu_mac_pmu_acpi_match,
+		.suppress_bind_attrs = true,
+	},
+	.probe = fujitsu_mac_pmu_probe,
+};
+
+static int __init register_fujitsu_mac_pmu_driver(void)
+{
+	int ret;
+
+	/* Install a hook to update the reader CPU in case it goes offline */
+	ret = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN,
+				      "perf/fujitsu/mac:online",
+				      fujitsu_mac_pmu_online_cpu,
+				      fujitsu_mac_pmu_offline_cpu);
+	if (ret < 0)
+		return ret;
+
+	mac_pmu_cpuhp_state = ret;
+	return platform_driver_register(&fujitsu_mac_pmu_driver);
+}
+device_initcall(register_fujitsu_mac_pmu_driver);
-- 
2.43.0

