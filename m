Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023C21CAA7B
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 15:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747409074; cv=none; b=E2bxutBtuJ30LYURwiG7UBKkAxiRJZhJHLQAQ2XUnrsIMgloaAI12RS9EoBlwR8paaqCNSRNCi1CTAOYjODJW/HqXDe7q3YsuEBjhOS3lEUOn6ahRDdOqmAc7ijgCEdFYYKvdaVhcHRQTlBwVoV/2rByPtV8Jun9PojAYLoeL98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747409074; c=relaxed/simple;
	bh=CEudB7xfGfZknsxjDnLgzXAkHegbhBiCvlQuxxKbElw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ugZ1oMbVNbZlfYS0AxcH2xgouZHI4wEDQr6cVhH1LiVCRL7l3EYBa/1trB29gniIr0lYf4SERn8nGRIf7hFfxsFVvWakDpWD9ZAXyjuYsB1F8xypi67KgD2Vi/dgU3BuB6u1qX2T5kIvpJv8n31TR8M+aq/IbcVEj6zudRd3Qz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=dm4rj8o1; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="dm4rj8o1"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-74294fa4bb5so3156195b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 08:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747409071; x=1748013871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YtK7qFNtUWEuKnh+PHuLi6UhkA6KPFOVgyIBIkZ+PDU=;
        b=dm4rj8o1tt2swhpbg42htTc7gi0D47lyCJ//Pch/eq+fxF4FfBCiPnp7DfwrCuEG06
         2xra+dWiRIY2y1khWUT0zjrpxKZl62TQkURcoFO7glkYReMc28br024Nm3Lr2NLimrKw
         6wCI7uPoaxK7LGo1kBQZsDJFNcz8FePrS+KEzHRcjeamymJNxc0Gv9+/C/+swAQzWv1B
         pe3l8rvwIshtgdYQdKH41ClgCDbrw/HlLdZjy+G8cWixlbgPF/rI12v66kfwP25DWCxh
         czob9wxDXuwW6gM1+nifcGL3V3aqI8QWliPpctqzDNps4Ovx/M+jRWfZb81PEGbgGSQs
         AI/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747409071; x=1748013871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YtK7qFNtUWEuKnh+PHuLi6UhkA6KPFOVgyIBIkZ+PDU=;
        b=mhO1ST7JFvVHwD2Tf7k4MSe4mc2QWSbRV7ac3fzaNUa6GPeM2XmoV2hL9Imw2eJCQT
         5r5SX6YqFvc0DPj3fOKmT88RVqNyflKPh715MflaUX8PDSBl16vWAeZeb75o2hU2Xxxd
         POrs+cpaZ5KeXq1WU4PU5QqHRsR0ib1tFnv0bVpSutn2RBLQ6ACYjt2VVZtFE8L2S2Fz
         SeqB3MsnPhUATgX+IPOhNu3Z1kHJHnCX3W5nW3ieay607+NU2eWyhnxY3NCoiGTzihom
         4r7LM5Da5YscnWPtrr26xlXr+DHyHK2+NqOMBHEQm2MDyxWH00yd9fepTZ7zRASn2RKa
         1UZw==
X-Forwarded-Encrypted: i=1; AJvYcCWAsXG+aAUGNcO2pxRIQWWyCBVXHT8TFIKV7r1FbXRPboNXtqN4FeWNprt/0sPgKXFTQtJ+ic80U1sR2Ak=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXP1CfRjMRnn/bA7dyrN5nwWbGoxG/SWL0wMOhclxerdVcHV8n
	yeOGYc9IMJaGaajQrN1NJTNZlfiLYTPK3tOj5P5ndqjFLIERGAKXLYzugOPC/w+i7Is=
X-Gm-Gg: ASbGnctdpthzEUac4t028vwM0wqCvtKpJ+xZ8qG9gnWTEwz+JEBn3P4b8878eBMUfrR
	/md8F33aM2vwhOYH1qiR6wmb6PkBoNHzOyyGiUP58TXVg7dUMgAH2MIDsELZMJBOcM14LGPZ+R/
	uOpfzEbDVs6U0SAjLmW7Svcp90xbaXN2CIkvAHbmYduoL67oSTm6gjdDu79lY1gzreatn2veH3U
	xq1ko8XMuS81v+C8/QoLj0OIlOKbOiBnioHRWTZps9Gxe2f7RMjCtZgL/ILzpAUJ3CwEkCfZKMq
	z22kjwRVVG2Xuj15HHkZzuZ/JDZiM8NPSSd5mDTuAkLQwlLqAJGQBFxsgjGkwJU=
X-Google-Smtp-Source: AGHT+IEPb2CkS9eW8hWebbqfST2/jFMDgmMTTwCG6X9bBOczP0XiPKHLfjkQ/gmtmNVozao4oSdDLw==
X-Received: by 2002:a05:6a00:6f57:b0:73d:b1ff:c758 with SMTP id d2e1a72fcca58-742a98abbecmr4911558b3a.18.1747409070996;
        Fri, 16 May 2025 08:24:30 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a96def68sm1666997b3a.30.2025.05.16.08.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 08:24:30 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Xu Lu <luxu.kernel@bytedance.com>,
	Atish Patra <atishp@atishpatra.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 3/4] drivers: firmware: add riscv SSE support
Date: Fri, 16 May 2025 17:23:41 +0200
Message-ID: <20250516152355.560448-4-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250516152355.560448-1-cleger@rivosinc.com>
References: <20250516152355.560448-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add driver level interface to use RISC-V SSE arch support. This interface
allows registering SSE handlers, and receive them. This will be used by
PMU and GHES driver.

Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
Co-developed-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
Signed-off-by: Clément Léger <cleger@rivosinc.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 MAINTAINERS                        |  15 +
 drivers/firmware/Kconfig           |   1 +
 drivers/firmware/Makefile          |   1 +
 drivers/firmware/riscv/Kconfig     |  15 +
 drivers/firmware/riscv/Makefile    |   3 +
 drivers/firmware/riscv/riscv_sse.c | 696 +++++++++++++++++++++++++++++
 include/linux/riscv_sse.h          |  59 +++
 7 files changed, 790 insertions(+)
 create mode 100644 drivers/firmware/riscv/Kconfig
 create mode 100644 drivers/firmware/riscv/Makefile
 create mode 100644 drivers/firmware/riscv/riscv_sse.c
 create mode 100644 include/linux/riscv_sse.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 3563492e4eba..ae21147bf71d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20892,6 +20892,13 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux.git
 F:	Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
 F:	drivers/iommu/riscv/
 
+RISC-V FIRMWARE DRIVERS
+M:	Conor Dooley <conor@kernel.org>
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git
+F:	drivers/firmware/riscv/*
+
 RISC-V MICROCHIP FPGA SUPPORT
 M:	Conor Dooley <conor.dooley@microchip.com>
 M:	Daire McNamara <daire.mcnamara@microchip.com>
@@ -20956,6 +20963,14 @@ F:	arch/riscv/boot/dts/spacemit/
 N:	spacemit
 K:	spacemit
 
+RISC-V SSE DRIVER
+M:	Clément Léger <cleger@rivosinc.com>
+R:	Himanshu Chauhan <himanshu@thechauhan.dev>
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+F:	drivers/firmware/riscv/riscv_sse.c
+F:	include/linux/riscv_sse.h
+
 RISC-V THEAD SoC SUPPORT
 M:	Drew Fustini <drew@pdp7.com>
 M:	Guo Ren <guoren@kernel.org>
diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index aadc395ee168..fe72e705067c 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -278,6 +278,7 @@ source "drivers/firmware/meson/Kconfig"
 source "drivers/firmware/microchip/Kconfig"
 source "drivers/firmware/psci/Kconfig"
 source "drivers/firmware/qcom/Kconfig"
+source "drivers/firmware/riscv/Kconfig"
 source "drivers/firmware/samsung/Kconfig"
 source "drivers/firmware/smccc/Kconfig"
 source "drivers/firmware/tegra/Kconfig"
diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
index 4ddec2820c96..6cdd84570ea7 100644
--- a/drivers/firmware/Makefile
+++ b/drivers/firmware/Makefile
@@ -34,6 +34,7 @@ obj-y				+= efi/
 obj-y				+= imx/
 obj-y				+= psci/
 obj-y				+= qcom/
+obj-y				+= riscv/
 obj-y				+= samsung/
 obj-y				+= smccc/
 obj-y				+= tegra/
diff --git a/drivers/firmware/riscv/Kconfig b/drivers/firmware/riscv/Kconfig
new file mode 100644
index 000000000000..8056ed3262d9
--- /dev/null
+++ b/drivers/firmware/riscv/Kconfig
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0-only
+menu "Risc-V Specific firmware drivers"
+depends on RISCV
+
+config RISCV_SSE
+	bool "Enable SBI Supervisor Software Events support"
+	depends on RISCV_SBI
+	default y
+	help
+	  The Supervisor Software Events support allow the SBI to deliver
+	  NMI-like notifications to the supervisor mode software. When enable,
+	  this option provides support to register callbacks on specific SSE
+	  events.
+
+endmenu
diff --git a/drivers/firmware/riscv/Makefile b/drivers/firmware/riscv/Makefile
new file mode 100644
index 000000000000..4ccfcbbc28ea
--- /dev/null
+++ b/drivers/firmware/riscv/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_RISCV_SSE)		+= riscv_sse.o
diff --git a/drivers/firmware/riscv/riscv_sse.c b/drivers/firmware/riscv/riscv_sse.c
new file mode 100644
index 000000000000..05e4bc8dfa99
--- /dev/null
+++ b/drivers/firmware/riscv/riscv_sse.c
@@ -0,0 +1,696 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2024 Rivos Inc.
+ */
+
+#define pr_fmt(fmt) "sse: " fmt
+
+#include <linux/cpu.h>
+#include <linux/cpuhotplug.h>
+#include <linux/cpu_pm.h>
+#include <linux/hardirq.h>
+#include <linux/list.h>
+#include <linux/percpu-defs.h>
+#include <linux/reboot.h>
+#include <linux/riscv_sse.h>
+#include <linux/slab.h>
+
+#include <asm/sbi.h>
+#include <asm/sse.h>
+
+struct sse_event {
+	struct list_head list;
+	u32 evt_id;
+	u32 priority;
+	sse_event_handler *handler;
+	void *handler_arg;
+	/* Only valid for global events */
+	unsigned int cpu;
+
+	union {
+		struct sse_registered_event *global;
+		struct sse_registered_event __percpu *local;
+	};
+};
+
+static int sse_hp_state;
+static bool sse_available;
+static DEFINE_SPINLOCK(events_list_lock);
+static LIST_HEAD(events);
+static DEFINE_MUTEX(sse_mutex);
+
+struct sse_registered_event {
+	struct sse_event_arch_data arch;
+	struct sse_event *event;
+	unsigned long attr_buf;
+	bool is_enabled;
+};
+
+void sse_handle_event(struct sse_event_arch_data *arch_event,
+		      struct pt_regs *regs)
+{
+	int ret;
+	struct sse_registered_event *reg_evt =
+		container_of(arch_event, struct sse_registered_event, arch);
+	struct sse_event *evt = reg_evt->event;
+
+	ret = evt->handler(evt->evt_id, evt->handler_arg, regs);
+	if (ret)
+		pr_warn("event %x handler failed with error %d\n", evt->evt_id,
+			ret);
+}
+
+static struct sse_event *sse_event_get(u32 evt)
+{
+	struct sse_event *event = NULL, *tmp;
+
+	scoped_guard(spinlock, &events_list_lock) {
+		list_for_each_entry(tmp, &events, list) {
+			if (tmp->evt_id == evt)
+				return event;
+		}
+	}
+
+	return NULL;
+}
+
+static phys_addr_t sse_event_get_phys(struct sse_registered_event *reg_evt,
+				      void *addr)
+{
+	phys_addr_t phys;
+
+	if (sse_event_is_global(reg_evt->event->evt_id))
+		phys = virt_to_phys(addr);
+	else
+		phys = per_cpu_ptr_to_phys(addr);
+
+	return phys;
+}
+
+static struct sse_registered_event *sse_get_reg_evt(struct sse_event *event)
+{
+	if (sse_event_is_global(event->evt_id))
+		return event->global;
+	else
+		return per_cpu_ptr(event->local, smp_processor_id());
+}
+
+static int sse_sbi_event_func(struct sse_event *event, unsigned long func)
+{
+	struct sbiret ret;
+	u32 evt = event->evt_id;
+	struct sse_registered_event *reg_evt = sse_get_reg_evt(event);
+
+	ret = sbi_ecall(SBI_EXT_SSE, func, evt, 0, 0, 0, 0, 0);
+	if (ret.error)
+		pr_debug("Failed to execute func %lx, event %x, error %ld\n",
+			 func, evt, ret.error);
+
+	if (func == SBI_SSE_EVENT_DISABLE)
+		reg_evt->is_enabled = false;
+	else if (func == SBI_SSE_EVENT_ENABLE)
+		reg_evt->is_enabled = true;
+
+	return sbi_err_map_linux_errno(ret.error);
+}
+
+int sse_event_disable_local(struct sse_event *event)
+{
+	return sse_sbi_event_func(event, SBI_SSE_EVENT_DISABLE);
+}
+
+int sse_event_enable_local(struct sse_event *event)
+{
+	return sse_sbi_event_func(event, SBI_SSE_EVENT_ENABLE);
+}
+
+static int sse_event_attr_get_no_lock(struct sse_registered_event *reg_evt,
+				      unsigned long attr_id, unsigned long *val)
+{
+	struct sbiret sret;
+	u32 evt = reg_evt->event->evt_id;
+	unsigned long phys;
+
+	phys = sse_event_get_phys(reg_evt, &reg_evt->attr_buf);
+
+	sret = sbi_ecall(SBI_EXT_SSE, SBI_SSE_EVENT_ATTR_READ, evt,
+				     attr_id, 1, phys, 0, 0);
+	if (sret.error) {
+		pr_debug("Failed to get event %x attr %lx, error %ld\n", evt,
+			 attr_id, sret.error);
+		return sbi_err_map_linux_errno(sret.error);
+	}
+
+	*val = reg_evt->attr_buf;
+
+	return 0;
+}
+
+static int sse_event_attr_set_nolock(struct sse_registered_event *reg_evt,
+				     unsigned long attr_id, unsigned long val)
+{
+	struct sbiret sret;
+	u32 evt = reg_evt->event->evt_id;
+	unsigned long phys;
+
+	reg_evt->attr_buf = val;
+	phys = sse_event_get_phys(reg_evt, &reg_evt->attr_buf);
+
+	sret = sbi_ecall(SBI_EXT_SSE, SBI_SSE_EVENT_ATTR_WRITE, evt,
+				     attr_id, 1, phys, 0, 0);
+	if (sret.error) {
+		pr_debug("Failed to set event %x attr %lx, error %ld\n", evt,
+			 attr_id, sret.error);
+		return sbi_err_map_linux_errno(sret.error);
+	}
+
+	return 0;
+}
+
+static int sse_event_set_target_cpu_nolock(struct sse_event *event,
+					   unsigned int cpu)
+{
+	unsigned int hart_id = cpuid_to_hartid_map(cpu);
+	struct sse_registered_event *reg_evt = event->global;
+	u32 evt = event->evt_id;
+	bool was_enabled;
+	int ret;
+
+	if (!sse_event_is_global(evt))
+		return -EINVAL;
+
+	was_enabled = reg_evt->is_enabled;
+	if (was_enabled)
+		sse_event_disable_local(event);
+	do {
+		ret = sse_event_attr_set_nolock(reg_evt,
+						SBI_SSE_ATTR_PREFERRED_HART,
+						hart_id);
+	} while (ret == -EINVAL);
+
+	if (ret == 0)
+		event->cpu = cpu;
+
+	if (was_enabled)
+		sse_event_enable_local(event);
+
+	return 0;
+}
+
+int sse_event_set_target_cpu(struct sse_event *event, unsigned int cpu)
+{
+	int ret;
+
+	scoped_guard(mutex, &sse_mutex) {
+		cpus_read_lock();
+
+		if (!cpu_online(cpu))
+			return -EINVAL;
+
+		ret = sse_event_set_target_cpu_nolock(event, cpu);
+
+		cpus_read_unlock();
+	}
+
+	return ret;
+}
+
+static int sse_event_init_registered(unsigned int cpu,
+				     struct sse_registered_event *reg_evt,
+				     struct sse_event *event)
+{
+	reg_evt->event = event;
+	arch_sse_init_event(&reg_evt->arch, event->evt_id, cpu);
+
+	return 0;
+}
+
+static void sse_event_free_registered(struct sse_registered_event *reg_evt)
+{
+	arch_sse_free_event(&reg_evt->arch);
+}
+
+static int sse_event_alloc_global(struct sse_event *event)
+{
+	int err;
+	struct sse_registered_event *reg_evt;
+
+	reg_evt = kzalloc(sizeof(*reg_evt), GFP_KERNEL);
+	if (!reg_evt)
+		return -ENOMEM;
+
+	event->global = reg_evt;
+	err = sse_event_init_registered(smp_processor_id(), reg_evt, event);
+	if (err)
+		kfree(reg_evt);
+
+	return err;
+}
+
+static int sse_event_alloc_local(struct sse_event *event)
+{
+	int err;
+	unsigned int cpu, err_cpu;
+	struct sse_registered_event *reg_evt;
+	struct sse_registered_event __percpu *reg_evts;
+
+	reg_evts = alloc_percpu(struct sse_registered_event);
+	if (!reg_evts)
+		return -ENOMEM;
+
+	event->local = reg_evts;
+
+	for_each_possible_cpu(cpu) {
+		reg_evt = per_cpu_ptr(reg_evts, cpu);
+		err = sse_event_init_registered(cpu, reg_evt, event);
+		if (err) {
+			err_cpu = cpu;
+			goto err_free_per_cpu;
+		}
+	}
+
+	return 0;
+
+err_free_per_cpu:
+	for_each_possible_cpu(cpu) {
+		if (cpu == err_cpu)
+			break;
+		reg_evt = per_cpu_ptr(reg_evts, cpu);
+		sse_event_free_registered(reg_evt);
+	}
+
+	free_percpu(reg_evts);
+
+	return err;
+}
+
+static struct sse_event *sse_event_alloc(u32 evt, u32 priority,
+					 sse_event_handler *handler, void *arg)
+{
+	int err;
+	struct sse_event *event;
+
+	event = kzalloc(sizeof(*event), GFP_KERNEL);
+	if (!event)
+		return ERR_PTR(-ENOMEM);
+
+	event->evt_id = evt;
+	event->priority = priority;
+	event->handler_arg = arg;
+	event->handler = handler;
+
+	if (sse_event_is_global(evt)) {
+		err = sse_event_alloc_global(event);
+		if (err)
+			goto err_alloc_reg_evt;
+	} else {
+		err = sse_event_alloc_local(event);
+		if (err)
+			goto err_alloc_reg_evt;
+	}
+
+	return event;
+
+err_alloc_reg_evt:
+	kfree(event);
+
+	return ERR_PTR(err);
+}
+
+static int sse_sbi_register_event(struct sse_event *event,
+				  struct sse_registered_event *reg_evt)
+{
+	int ret;
+
+	ret = sse_event_attr_set_nolock(reg_evt, SBI_SSE_ATTR_PRIO,
+					event->priority);
+	if (ret)
+		return ret;
+
+	return arch_sse_register_event(&reg_evt->arch);
+}
+
+static int sse_event_register_local(struct sse_event *event)
+{
+	int ret;
+	struct sse_registered_event *reg_evt = per_cpu_ptr(event->local,
+							   smp_processor_id());
+
+	ret = sse_sbi_register_event(event, reg_evt);
+	if (ret)
+		pr_debug("Failed to register event %x: err %d\n", event->evt_id,
+			 ret);
+
+	return ret;
+}
+
+static int sse_sbi_unregister_event(struct sse_event *event)
+{
+	return sse_sbi_event_func(event, SBI_SSE_EVENT_UNREGISTER);
+}
+
+struct sse_per_cpu_evt {
+	struct sse_event *event;
+	unsigned long func;
+	atomic_t error;
+};
+
+static void sse_event_per_cpu_func(void *info)
+{
+	int ret;
+	struct sse_per_cpu_evt *cpu_evt = info;
+
+	if (cpu_evt->func == SBI_SSE_EVENT_REGISTER)
+		ret = sse_event_register_local(cpu_evt->event);
+	else
+		ret = sse_sbi_event_func(cpu_evt->event, cpu_evt->func);
+
+	if (ret)
+		atomic_set(&cpu_evt->error, ret);
+}
+
+static void sse_event_free(struct sse_event *event)
+{
+	unsigned int cpu;
+	struct sse_registered_event *reg_evt;
+
+	if (sse_event_is_global(event->evt_id)) {
+		sse_event_free_registered(event->global);
+		kfree(event->global);
+	} else {
+		for_each_possible_cpu(cpu) {
+			reg_evt = per_cpu_ptr(event->local, cpu);
+			sse_event_free_registered(reg_evt);
+		}
+		free_percpu(event->local);
+	}
+
+	kfree(event);
+}
+
+int sse_event_enable(struct sse_event *event)
+{
+	int ret = 0, cpu;
+	struct sse_per_cpu_evt cpu_evt;
+	struct sse_registered_event *reg_evt;
+
+	scoped_guard(mutex, &sse_mutex) {
+		cpus_read_lock();
+		if (sse_event_is_global(event->evt_id)) {
+			reg_evt = event->global;
+			ret = sse_event_enable_local(event);
+		} else {
+			cpu_evt.event = event;
+			atomic_set(&cpu_evt.error, 0);
+			cpu_evt.func = SBI_SSE_EVENT_ENABLE;
+			on_each_cpu(sse_event_per_cpu_func, &cpu_evt, 1);
+			ret = atomic_read(&cpu_evt.error);
+			if (ret) {
+				cpu_evt.func = SBI_SSE_EVENT_DISABLE;
+				on_each_cpu(sse_event_per_cpu_func, &cpu_evt, 1);
+			} else {
+				for_each_online_cpu(cpu) {
+
+				}
+			}
+		}
+		cpus_read_unlock();
+	}
+
+	return ret;
+}
+
+static void sse_events_mask(void)
+{
+	sbi_ecall(SBI_EXT_SSE, SBI_SSE_EVENT_HART_MASK, 0, 0, 0, 0, 0, 0);
+}
+
+static void sse_events_unmask(void)
+{
+	sbi_ecall(SBI_EXT_SSE, SBI_SSE_EVENT_HART_UNMASK, 0, 0, 0, 0, 0, 0);
+}
+
+static void sse_event_disable_nolock(struct sse_event *event)
+{
+	struct sse_per_cpu_evt cpu_evt;
+
+	if (sse_event_is_global(event->evt_id)) {
+		sse_event_disable_local(event);
+	} else {
+		cpu_evt.event = event;
+		cpu_evt.func = SBI_SSE_EVENT_DISABLE;
+		on_each_cpu(sse_event_per_cpu_func, &cpu_evt, 1);
+	}
+}
+
+void sse_event_disable(struct sse_event *event)
+{
+	scoped_guard(mutex, &sse_mutex) {
+		cpus_read_lock();
+		sse_event_disable_nolock(event);
+		cpus_read_unlock();
+	}
+}
+
+struct sse_event *sse_event_register(u32 evt, u32 priority,
+				     sse_event_handler *handler, void *arg)
+{
+	struct sse_per_cpu_evt cpu_evt;
+	struct sse_event *event;
+	int ret = 0;
+
+	if (!sse_available)
+		return ERR_PTR(-EOPNOTSUPP);
+
+	mutex_lock(&sse_mutex);
+	if (sse_event_get(evt)) {
+		pr_debug("Event %x already registered\n", evt);
+		ret = -EEXIST;
+		goto out_unlock;
+	}
+
+	event = sse_event_alloc(evt, priority, handler, arg);
+	if (IS_ERR(event)) {
+		ret = PTR_ERR(event);
+		goto out_unlock;
+	}
+
+	cpus_read_lock();
+	if (sse_event_is_global(evt)) {
+		unsigned long preferred_hart;
+
+		ret = sse_event_attr_get_no_lock(event->global,
+						 SBI_SSE_ATTR_PREFERRED_HART,
+						 &preferred_hart);
+		if (ret)
+			goto err_event_free;
+		event->cpu = riscv_hartid_to_cpuid(preferred_hart);
+
+		ret = sse_sbi_register_event(event, event->global);
+		if (ret)
+			goto err_event_free;
+
+	} else {
+		cpu_evt.event = event;
+		atomic_set(&cpu_evt.error, 0);
+		cpu_evt.func = SBI_SSE_EVENT_REGISTER;
+		on_each_cpu(sse_event_per_cpu_func, &cpu_evt, 1);
+		ret = atomic_read(&cpu_evt.error);
+		if (ret) {
+			cpu_evt.func = SBI_SSE_EVENT_UNREGISTER;
+			on_each_cpu(sse_event_per_cpu_func, &cpu_evt, 1);
+			goto err_event_free;
+		}
+	}
+	cpus_read_unlock();
+
+	scoped_guard(spinlock, &events_list_lock)
+		list_add(&event->list, &events);
+
+	mutex_unlock(&sse_mutex);
+
+	return event;
+
+err_event_free:
+	cpus_read_unlock();
+	sse_event_free(event);
+out_unlock:
+	mutex_unlock(&sse_mutex);
+
+	return ERR_PTR(ret);
+}
+
+static void sse_event_unregister_nolock(struct sse_event *event)
+{
+	struct sse_per_cpu_evt cpu_evt;
+
+	if (sse_event_is_global(event->evt_id)) {
+		sse_sbi_unregister_event(event);
+	} else {
+		cpu_evt.event = event;
+		cpu_evt.func = SBI_SSE_EVENT_UNREGISTER;
+		on_each_cpu(sse_event_per_cpu_func, &cpu_evt, 1);
+	}
+}
+
+void sse_event_unregister(struct sse_event *event)
+{
+	scoped_guard(mutex, &sse_mutex) {
+		cpus_read_lock();
+		sse_event_unregister_nolock(event);
+		cpus_read_unlock();
+
+		scoped_guard(spinlock, &events_list_lock)
+			list_del(&event->list);
+
+		sse_event_free(event);
+	}
+}
+
+static int sse_cpu_online(unsigned int cpu)
+{
+	struct sse_event *event;
+
+	scoped_guard(spinlock, &events_list_lock) {
+		list_for_each_entry(event, &events, list) {
+			if (sse_event_is_global(event->evt_id))
+				continue;
+
+			sse_event_register_local(event);
+			if (sse_get_reg_evt(event))
+				sse_event_enable_local(event);
+		}
+	}
+
+	/* Ready to handle events. Unmask SSE. */
+	sse_events_unmask();
+
+	return 0;
+}
+
+static int sse_cpu_teardown(unsigned int cpu)
+{
+	unsigned int next_cpu;
+	struct sse_event *event;
+
+	/* Mask the sse events */
+	sse_events_mask();
+
+	scoped_guard(spinlock, &events_list_lock) {
+		list_for_each_entry(event, &events, list) {
+			if (!sse_event_is_global(event->evt_id)) {
+
+				if (event->global->is_enabled)
+					sse_event_disable_local(event);
+
+				sse_sbi_unregister_event(event);
+				continue;
+			}
+
+			if (event->cpu != smp_processor_id())
+				continue;
+
+			/* Update destination hart for global event */
+			next_cpu = cpumask_any_but(cpu_online_mask, cpu);
+			sse_event_set_target_cpu_nolock(event, next_cpu);
+		}
+	}
+
+	return 0;
+}
+
+static void sse_reset(void)
+{
+	struct sse_event *event = NULL;
+
+	list_for_each_entry(event, &events, list) {
+		sse_event_disable_nolock(event);
+		sse_event_unregister_nolock(event);
+	}
+}
+
+static int sse_pm_notifier(struct notifier_block *nb, unsigned long action,
+			   void *data)
+{
+	WARN_ON_ONCE(preemptible());
+
+	switch (action) {
+	case CPU_PM_ENTER:
+		sse_events_mask();
+		break;
+	case CPU_PM_EXIT:
+	case CPU_PM_ENTER_FAILED:
+		sse_events_unmask();
+		break;
+	default:
+		return NOTIFY_DONE;
+	}
+
+	return NOTIFY_OK;
+}
+
+static struct notifier_block sse_pm_nb = {
+	.notifier_call = sse_pm_notifier,
+};
+
+/*
+ * Mask all CPUs and unregister all events on panic, reboot or kexec.
+ */
+static int sse_reboot_notifier(struct notifier_block *nb, unsigned long action,
+				void *data)
+{
+	cpuhp_remove_state(sse_hp_state);
+
+	sse_reset();
+
+	return NOTIFY_OK;
+}
+
+static struct notifier_block sse_reboot_nb = {
+	.notifier_call = sse_reboot_notifier,
+};
+
+static int __init sse_init(void)
+{
+	int cpu, ret;
+
+	if (sbi_probe_extension(SBI_EXT_SSE) <= 0) {
+		pr_err("Missing SBI SSE extension\n");
+		return -EOPNOTSUPP;
+	}
+	pr_info("SBI SSE extension detected\n");
+
+	for_each_possible_cpu(cpu)
+		INIT_LIST_HEAD(&events);
+
+	ret = cpu_pm_register_notifier(&sse_pm_nb);
+	if (ret) {
+		pr_warn("Failed to register CPU PM notifier...\n");
+		return ret;
+	}
+
+	ret = register_reboot_notifier(&sse_reboot_nb);
+	if (ret) {
+		pr_warn("Failed to register reboot notifier...\n");
+		goto remove_cpupm;
+	}
+
+	ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "riscv/sse:online",
+				sse_cpu_online, sse_cpu_teardown);
+	if (ret < 0)
+		goto remove_reboot;
+
+	sse_hp_state = ret;
+	sse_available = true;
+
+	return 0;
+
+remove_reboot:
+	unregister_reboot_notifier(&sse_reboot_nb);
+
+remove_cpupm:
+	cpu_pm_unregister_notifier(&sse_pm_nb);
+
+	return ret;
+}
+arch_initcall(sse_init);
diff --git a/include/linux/riscv_sse.h b/include/linux/riscv_sse.h
new file mode 100644
index 000000000000..8653fa74ec82
--- /dev/null
+++ b/include/linux/riscv_sse.h
@@ -0,0 +1,59 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2024 Rivos Inc.
+ */
+
+#ifndef __LINUX_RISCV_SSE_H
+#define __LINUX_RISCV_SSE_H
+
+#include <linux/types.h>
+#include <linux/linkage.h>
+
+struct sse_event;
+struct pt_regs;
+
+typedef int (sse_event_handler)(u32 event_num, void *arg, struct pt_regs *regs);
+
+#ifdef CONFIG_RISCV_SSE
+
+struct sse_event *sse_event_register(u32 event_num, u32 priority,
+				     sse_event_handler *handler, void *arg);
+
+void sse_event_unregister(struct sse_event *evt);
+
+int sse_event_set_target_cpu(struct sse_event *sse_evt, unsigned int cpu);
+
+int sse_event_enable(struct sse_event *sse_evt);
+
+void sse_event_disable(struct sse_event *sse_evt);
+
+int sse_event_enable_local(struct sse_event *sse_evt);
+int sse_event_disable_local(struct sse_event *sse_evt);
+
+#else
+static inline struct sse_event *sse_event_register(u32 event_num, u32 priority,
+						   sse_event_handler *handler,
+						   void *arg)
+{
+	return ERR_PTR(-EOPNOTSUPP);
+}
+
+static inline void sse_event_unregister(struct sse_event *evt) {}
+
+static inline int sse_event_set_target_cpu(struct sse_event *sse_evt,
+					   unsigned int cpu)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int sse_event_enable(struct sse_event *sse_evt)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline void sse_event_disable(struct sse_event *sse_evt) {}
+
+
+#endif
+
+#endif /* __LINUX_RISCV_SSE_H */
-- 
2.49.0

