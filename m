Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B947525D90C
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 18:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747333416; cv=none; b=qv6v0yFZ2cw1QMZsDEMoPtA4pUhaF9aFL0KGqFe8EVYLO2hJNHD/EyZU11bR3RhGQ9S5C0/YxbmzmtATUb9B5uqC5S9nFM4JnTACwhF5MI2dHHbu946F4Cze9lzC0OaIUvR9UukH2zW2XXcKuV2u6ZV3Q0ipvLf/xk7P7IhxR3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747333416; c=relaxed/simple;
	bh=/0h1DAgvNS7gOWJbGR62D2WLgSr3BUoj0MaCWYY3rNk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JAHgooJjZVae5DPgrS226sHlexdN3+Gpsl3HzlndklO2XlkbefXcHONPQt7pzUZL8R/HNP2MzU72sJlAb2+p4XJgGI71iPvi1nGxybZ9eIoonDr+7TZXdJ3tXT2nXYYYxFG02N0pxLUd9i99o4ds/+b8yatlawDIKLLo43+qksI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=DAVBCold; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="DAVBCold"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7c5b2472969so126951085a.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 11:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1747333412; x=1747938212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oGF8/MZyPeKti2q6s3S+pfY6W5r5tibJELV0vgQCiJw=;
        b=DAVBColdbe2W+tHR30dMjhw7RqwpzAtrjbuR4KnJaaaTBWzrjX302x+O09d72iavfj
         qamSCRrjgzHDYBjcIhh6SAJJMzVid3J0Yyw85kEyFHRm9u5V/n0OtafvoqfR8vlEEOr2
         7cvFmtDn7sC/GYmoQxxYBLT21qSZEyb/KHyzYZVFiNy5fhvALRrplXs8jywOyaluwdhy
         fiUqwMp9u/+ljdrbkLmqVEPRf7fvCt5KJXql42YJwbrQgqsFjtf3kBN5KyNYbdOP0wwa
         9ssjF5CYG14Wt/63FIT7xElRM8UaKXWLRD/gX1GbOwdU6jMBrF3NPgH01RkmG3ulsqS8
         IKtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747333412; x=1747938212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oGF8/MZyPeKti2q6s3S+pfY6W5r5tibJELV0vgQCiJw=;
        b=espqSToWvuJMgU6wvFcTc6JTrpGNu/d7hIoPrzS4XLN8Itc2DXM8XHCyMDyQmIub9d
         0tkzaAocRel+a9F9nft6FSZvFykz/Ixdpym4DNn57zJ2E7JuwFkzBNpe5UqRrp3TmohK
         0jsaTQbsbScftkS0J3wBIb70WIbtpWyrtjIy9FMrME+I92IV/xZa6vFAKa+jS5LhUzKv
         ns+njnIop8nmtvDdgwIvGUMb+AZU9aZT6UDV/ZeUcJUv3VgoSqhlZo3qUc6bSW+eDZWt
         Z/FMztNmRIk0hIiGr5YW/zv8tU/+nvy+bdu6wE580giJ2k2BXlwEPs+RAAAGgUCnjS0v
         ZFIA==
X-Forwarded-Encrypted: i=1; AJvYcCUN7oCVLuMUqFVupqYRQZfglFUCgphWYi/iG3h33OUs/1Jn9P1cdrKT0JQlct7vR4Eqk90+KOHhudBgQ8I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOFbMfK6ez0HUZn6AXMvZ9XQd9eoaO/Zd389NJE2NY6xeX2C0Z
	HePXVJHjfkDbMX6AcIgMrsrXTFe4FaV1iLUSFKdWh/S7w2ccQZxISVrREIS6j6/F6q4=
X-Gm-Gg: ASbGnctbqcE9Cg5B4aREAauq86DELA0fpvTcJ2uuxltE1HhFc+WtIDTzMwjDE2pixoU
	uepHzWjaQJix3MdDfgHQYiztkj2QUe4I/zF0sbkYyojlMXY+Z1Xr490kGWhPz51kJpuYJqJBsHt
	Xwcsv4jI3jZvItVoiyoyTeB44M0zoUows4e3bwgUSt7pBK9Fuv1FS+LvfCj1M3nV7/Ee69LGIfK
	DYfIb7kr9PDX/+43nnDukquYy3BRs8zGcH3OfJf/bhtknM3DpCANKkGxn6g2Bm1cOSIy7irSruq
	bghlXjDS5su2R+d4klxxcrXnpemwqQVQHep6EOe8IjqVNmE9jDMJPhRqt7eeH4/xu00OLx/GQK6
	X9OjZSa3d6oEQyon8ta7oyBAGafXzc3vsv3FLbpL9K9gQ
X-Google-Smtp-Source: AGHT+IGJZWVHZL0uOCsIdspadw7iSpqNWmFKAA4D6+zc22RZ4SvW71jxKclCUhsuNFBb4cm0e/GNGA==
X-Received: by 2002:a05:620a:4114:b0:7c8:c9c:2a8a with SMTP id af79cd13be357-7cd467aa193mr75698585a.49.1747333412061;
        Thu, 15 May 2025 11:23:32 -0700 (PDT)
Received: from soleen.c.googlers.com.com (138.200.150.34.bc.googleusercontent.com. [34.150.200.138])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd466fc2afsm18218685a.0.2025.05.15.11.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 11:23:31 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: pratyush@kernel.org,
	jasonmiu@google.com,
	graf@amazon.com,
	changyuanl@google.com,
	pasha.tatashin@soleen.com,
	rppt@kernel.org,
	dmatlack@google.com,
	rientjes@google.com,
	corbet@lwn.net,
	rdunlap@infradead.org,
	ilpo.jarvinen@linux.intel.com,
	kanie@linux.alibaba.com,
	ojeda@kernel.org,
	aliceryhl@google.com,
	masahiroy@kernel.org,
	akpm@linux-foundation.org,
	tj@kernel.org,
	yoann.congal@smile.fr,
	mmaurer@google.com,
	roman.gushchin@linux.dev,
	chenridong@huawei.com,
	axboe@kernel.dk,
	mark.rutland@arm.com,
	jannh@google.com,
	vincent.guittot@linaro.org,
	hannes@cmpxchg.org,
	dan.j.williams@intel.com,
	david@redhat.com,
	joel.granados@kernel.org,
	rostedt@goodmis.org,
	anna.schumaker@oracle.com,
	song@kernel.org,
	zhangguopeng@kylinos.cn,
	linux@weissschuh.net,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org,
	gregkh@linuxfoundation.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	rafael@kernel.org,
	dakr@kernel.org,
	bartosz.golaszewski@linaro.org,
	cw00.choi@samsung.com,
	myungjoo.ham@samsung.com,
	yesanishhere@gmail.com,
	Jonathan.Cameron@huawei.com,
	quic_zijuhu@quicinc.com,
	aleksander.lobakin@intel.com,
	ira.weiny@intel.com,
	andriy.shevchenko@linux.intel.com,
	leon@kernel.org,
	lukas@wunner.de,
	bhelgaas@google.com,
	wagi@kernel.org,
	djeffery@redhat.com,
	stuart.w.hayes@gmail.com,
	ptyadav@amazon.de
Subject: [RFC v2 04/16] luo: luo_core: Live Update Orchestrator
Date: Thu, 15 May 2025 18:23:08 +0000
Message-ID: <20250515182322.117840-5-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
In-Reply-To: <20250515182322.117840-1-pasha.tatashin@soleen.com>
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce LUO, a mechanism intended to facilitate kernel updates while
keeping designated devices operational across the transition (e.g., via
kexec). The primary use case is updating hypervisors with minimal
disruption to running virtual machines. For userspace side of hypervisor
update we have copyless migration. LUO is for updating the kernel.

This initial patch lays the groundwork for the LUO subsystem.

Further functionality, including the implementation of state transition
logic, integration with KHO, and hooks for subsystems and file
descriptors, will be added in subsequent patches.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 drivers/misc/Kconfig                   |   1 +
 drivers/misc/Makefile                  |   1 +
 drivers/misc/liveupdate/Kconfig        |  27 +++
 drivers/misc/liveupdate/Makefile       |   2 +
 drivers/misc/liveupdate/luo_core.c     | 296 +++++++++++++++++++++++++
 drivers/misc/liveupdate/luo_internal.h |  26 +++
 include/linux/liveupdate.h             | 131 +++++++++++
 7 files changed, 484 insertions(+)
 create mode 100644 drivers/misc/liveupdate/Kconfig
 create mode 100644 drivers/misc/liveupdate/Makefile
 create mode 100644 drivers/misc/liveupdate/luo_core.c
 create mode 100644 drivers/misc/liveupdate/luo_internal.h
 create mode 100644 include/linux/liveupdate.h

diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 6b37d61150ee..851fd9c33b36 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -636,6 +636,7 @@ source "drivers/misc/c2port/Kconfig"
 source "drivers/misc/eeprom/Kconfig"
 source "drivers/misc/cb710/Kconfig"
 source "drivers/misc/lis3lv02d/Kconfig"
+source "drivers/misc/liveupdate/Kconfig"
 source "drivers/misc/altera-stapl/Kconfig"
 source "drivers/misc/mei/Kconfig"
 source "drivers/misc/vmw_vmci/Kconfig"
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index d6c917229c45..ed5b5bc71b85 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -41,6 +41,7 @@ obj-y				+= eeprom/
 obj-y				+= cb710/
 obj-$(CONFIG_VMWARE_BALLOON)	+= vmw_balloon.o
 obj-$(CONFIG_PCH_PHUB)		+= pch_phub.o
+obj-$(CONFIG_LIVEUPDATE)	+= liveupdate/
 obj-y				+= lis3lv02d/
 obj-$(CONFIG_ALTERA_STAPL)	+=altera-stapl/
 obj-$(CONFIG_INTEL_MEI)		+= mei/
diff --git a/drivers/misc/liveupdate/Kconfig b/drivers/misc/liveupdate/Kconfig
new file mode 100644
index 000000000000..a7424ceeba0b
--- /dev/null
+++ b/drivers/misc/liveupdate/Kconfig
@@ -0,0 +1,27 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Copyright (c) 2025, Google LLC.
+# Pasha Tatashin <pasha.tatashin@soleen.com>
+#
+# Live Update Orchestrator
+#
+
+config LIVEUPDATE
+	bool "Live Update Orchestrator"
+	depends on KEXEC_HANDOVER
+	help
+	  Enable the Live Update Orchestrator. Live Update is a mechanism,
+	  typically based on kexec, that allows the kernel to be updated
+	  while keeping selected devices operational across the transition.
+	  These devices are intended to be reclaimed by the new kernel and
+	  re-attached to their original workload without requiring a device
+	  reset.
+
+	  This functionality depends on specific support within device drivers
+	  and related kernel subsystems.
+
+	  This feature is primarily used in cloud environments to quickly
+	  update the kernel hypervisor with minimal disruption to the
+	  running virtual machines.
+
+	  If unsure, say N.
diff --git a/drivers/misc/liveupdate/Makefile b/drivers/misc/liveupdate/Makefile
new file mode 100644
index 000000000000..3bfb4b9fed11
--- /dev/null
+++ b/drivers/misc/liveupdate/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-y					+= luo_core.o
diff --git a/drivers/misc/liveupdate/luo_core.c b/drivers/misc/liveupdate/luo_core.c
new file mode 100644
index 000000000000..919c37b0b4d1
--- /dev/null
+++ b/drivers/misc/liveupdate/luo_core.c
@@ -0,0 +1,296 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * Copyright (c) 2025, Google LLC.
+ * Pasha Tatashin <pasha.tatashin@soleen.com>
+ */
+
+/**
+ * DOC: Live Update Orchestrator (LUO)
+ *
+ * Live Update is a specialized reboot process where selected devices are
+ * kept operational across a kernel transition. For these devices, DMA activity
+ * may continue during the kernel reboot.
+ *
+ * The primary use case is in cloud environments, allowing hypervisor updates
+ * without disrupting running virtual machines. During a live update, VMs can be
+ * suspended (with their state preserved in memory), while the hypervisor kernel
+ * reboots. Devices attached to these VMs (e.g., NICs, block devices) are kept
+ * operational by the LUO during the hypervisor reboot, allowing the VMs to be
+ * quickly resumed on the new kernel.
+ *
+ * The core of LUO is a state machine that tracks the progress of a live update,
+ * along with a callback API that allows other kernel subsystems to participate
+ * in the process. Example subsystems that can hook into LUO include: kvm,
+ * iommu, interrupts, vfio, participating filesystems, and mm.
+ *
+ * LUO uses KHO to transfer memory state from the current Kernel to the next
+ * Kernel.
+ *
+ * The LUO state machine ensures that operations are performed in the correct
+ * sequence and provides a mechanism to track and recover from potential
+ * failures, and select devices and subsystems that should participate in
+ * live update sequence.
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/err.h>
+#include <linux/kobject.h>
+#include <linux/liveupdate.h>
+#include <linux/rwsem.h>
+#include <linux/string.h>
+#include "luo_internal.h"
+
+static DECLARE_RWSEM(luo_state_rwsem);
+
+enum liveupdate_state luo_state;
+
+const char *const luo_state_str[] = {
+	[LIVEUPDATE_STATE_NORMAL]	= "normal",
+	[LIVEUPDATE_STATE_PREPARED]	= "prepared",
+	[LIVEUPDATE_STATE_FROZEN]	= "frozen",
+	[LIVEUPDATE_STATE_UPDATED]	= "updated",
+};
+
+bool luo_enabled;
+
+static int __init early_liveupdate_param(char *buf)
+{
+	return kstrtobool(buf, &luo_enabled);
+}
+early_param("liveupdate", early_liveupdate_param);
+
+/* Return true if the current state is equal to the provided state */
+static inline bool is_current_luo_state(enum liveupdate_state expected_state)
+{
+	return READ_ONCE(luo_state) == expected_state;
+}
+
+static void __luo_set_state(enum liveupdate_state state)
+{
+	WRITE_ONCE(luo_state, state);
+}
+
+static inline void luo_set_state(enum liveupdate_state state)
+{
+	pr_info("Switched from [%s] to [%s] state\n",
+		LUO_STATE_STR, luo_state_str[state]);
+	__luo_set_state(state);
+}
+
+static int luo_do_freeze_calls(void)
+{
+	return 0;
+}
+
+static void luo_do_finish_calls(void)
+{
+}
+
+int luo_prepare(void)
+{
+	return 0;
+}
+
+/**
+ * luo_freeze() - Initiate the final freeze notification phase for live update.
+ *
+ * Attempts to transition the live update orchestrator state from
+ * %LIVEUPDATE_STATE_PREPARED to %LIVEUPDATE_STATE_FROZEN. This function is
+ * typically called just before the actual reboot system call (e.g., kexec)
+ * is invoked, either directly by the orchestration tool or potentially from
+ * within the reboot syscall path itself.
+ *
+ * Based on the outcome of the notification process:
+ * - If luo_do_freeze_calls() returns 0 (all callbacks succeeded), the state
+ * is set to %LIVEUPDATE_STATE_FROZEN using luo_set_state(), indicating
+ * readiness for the imminent kexec.
+ * - If luo_do_freeze_calls() returns a negative error code (a callback
+ * failed), the state is reverted to %LIVEUPDATE_STATE_NORMAL using
+ * luo_set_state() to cancel the live update attempt.
+ *
+ * @return  0: Success. Negative error otherwise. State is reverted to
+ * %LIVEUPDATE_STATE_NORMAL in case of an error during callbacks.
+ */
+int luo_freeze(void)
+{
+	int ret;
+
+	if (down_write_killable(&luo_state_rwsem)) {
+		pr_warn("[freeze] event canceled by user\n");
+		return -EAGAIN;
+	}
+
+	if (!is_current_luo_state(LIVEUPDATE_STATE_PREPARED)) {
+		pr_warn("Can't switch to [%s] from [%s] state\n",
+			luo_state_str[LIVEUPDATE_STATE_FROZEN],
+			LUO_STATE_STR);
+		up_write(&luo_state_rwsem);
+
+		return -EINVAL;
+	}
+
+	ret = luo_do_freeze_calls();
+	if (!ret)
+		luo_set_state(LIVEUPDATE_STATE_FROZEN);
+	else
+		luo_set_state(LIVEUPDATE_STATE_NORMAL);
+
+	up_write(&luo_state_rwsem);
+
+	return ret;
+}
+
+/**
+ * luo_finish - Finalize the live update process in the new kernel.
+ *
+ * This function is called  after a successful live update reboot into a new
+ * kernel, once the new kernel is ready to transition to the normal operational
+ * state. It signals the completion of the live update sequence to subsystems.
+ *
+ * It first attempts to acquire the write lock for the orchestrator state.
+ *
+ * Then, it checks if the system is in the ``LIVEUPDATE_STATE_UPDATED`` state.
+ * If not, it logs a warning and returns ``-EINVAL``.
+ *
+ * If the state is correct, it triggers the ``LIVEUPDATE_FINISH`` notifier
+ * chain. Note that the return value of the notifier is intentionally ignored as
+ * finish callbacks must not fail. Finally, the orchestrator state is
+ * transitioned back to ``LIVEUPDATE_STATE_NORMAL``, indicating the end of the
+ * live update process.
+ *
+ * @return 0 on success, ``-EAGAIN`` if the state change was cancelled by the
+ * user while waiting for the lock, or ``-EINVAL`` if the orchestrator is not in
+ * the updated state.
+ */
+int luo_finish(void)
+{
+	if (down_write_killable(&luo_state_rwsem)) {
+		pr_warn("[finish] event canceled by user\n");
+		return -EAGAIN;
+	}
+
+	if (!is_current_luo_state(LIVEUPDATE_STATE_UPDATED)) {
+		pr_warn("Can't switch to [%s] from [%s] state\n",
+			luo_state_str[LIVEUPDATE_STATE_NORMAL],
+			LUO_STATE_STR);
+		up_write(&luo_state_rwsem);
+
+		return -EINVAL;
+	}
+
+	luo_do_finish_calls();
+	luo_set_state(LIVEUPDATE_STATE_NORMAL);
+
+	up_write(&luo_state_rwsem);
+
+	return 0;
+}
+
+int luo_cancel(void)
+{
+	return 0;
+}
+
+void luo_state_read_enter(void)
+{
+	down_read(&luo_state_rwsem);
+}
+
+void luo_state_read_exit(void)
+{
+	up_read(&luo_state_rwsem);
+}
+
+static int __init luo_startup(void)
+{
+	__luo_set_state(LIVEUPDATE_STATE_NORMAL);
+
+	return 0;
+}
+early_initcall(luo_startup);
+
+/* Public Functions */
+
+/**
+ * liveupdate_reboot() - Kernel reboot notifier for live update final
+ * serialization.
+ *
+ * This function is invoked directly from the reboot() syscall pathway if a
+ * reboot is initiated while the live update state is %LIVEUPDATE_STATE_PREPARED
+ * (i.e., if the user did not explicitly trigger the frozen state). It handles
+ * the implicit transition into the final frozen state.
+ *
+ * It triggers the %LIVEUPDATE_REBOOT event callbacks for participating
+ * subsystems. These callbacks must perform final state saving very quickly as
+ * they execute during the blackout period just before kexec.
+ *
+ * If any %LIVEUPDATE_FREEZE callback fails, this function triggers the
+ * %LIVEUPDATE_CANCEL event for all participants to revert their state, aborts
+ * the live update, and returns an error.
+ */
+int liveupdate_reboot(void)
+{
+	if (!is_current_luo_state(LIVEUPDATE_STATE_PREPARED))
+		return 0;
+
+	return luo_freeze();
+}
+EXPORT_SYMBOL_GPL(liveupdate_reboot);
+
+/**
+ * liveupdate_state_updated - Check if the system is in the live update
+ * 'updated' state.
+ *
+ * This function checks if the live update orchestrator is in the
+ * ``LIVEUPDATE_STATE_UPDATED`` state. This state indicates that the system has
+ * successfully rebooted into a new kernel as part of a live update, and the
+ * preserved devices are expected to be in the process of being reclaimed.
+ *
+ * This is typically used by subsystems during early boot of the new kernel
+ * to determine if they need to attempt to restore state from a previous
+ * live update.
+ *
+ * @return true if the system is in the ``LIVEUPDATE_STATE_UPDATED`` state,
+ * false otherwise.
+ */
+bool liveupdate_state_updated(void)
+{
+	return is_current_luo_state(LIVEUPDATE_STATE_UPDATED);
+}
+EXPORT_SYMBOL_GPL(liveupdate_state_updated);
+
+/**
+ * liveupdate_state_normal - Check if the system is in the live update 'normal'
+ * state.
+ *
+ * This function checks if the live update orchestrator is in the
+ * ``LIVEUPDATE_STATE_NORMAL`` state. This state indicates that no live update
+ * is in progress. It represents the default operational state of the system.
+ *
+ * This can be used to gate actions that should only be performed when no
+ * live update activity is occurring.
+ *
+ * @return true if the system is in the ``LIVEUPDATE_STATE_NORMAL`` state,
+ * false otherwise.
+ */
+bool liveupdate_state_normal(void)
+{
+	return is_current_luo_state(LIVEUPDATE_STATE_NORMAL);
+}
+EXPORT_SYMBOL_GPL(liveupdate_state_normal);
+
+/**
+ * liveupdate_enabled - Check if the live update feature is enabled.
+ *
+ * This function returns the state of the live update feature flag, which
+ * can be controlled via the ``liveupdate`` kernel command-line parameter.
+ *
+ * @return true if live update is enabled, false otherwise.
+ */
+bool liveupdate_enabled(void)
+{
+	return luo_enabled;
+}
+EXPORT_SYMBOL_GPL(liveupdate_enabled);
diff --git a/drivers/misc/liveupdate/luo_internal.h b/drivers/misc/liveupdate/luo_internal.h
new file mode 100644
index 000000000000..34e73fb0318c
--- /dev/null
+++ b/drivers/misc/liveupdate/luo_internal.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/*
+ * Copyright (c) 2025, Google LLC.
+ * Pasha Tatashin <pasha.tatashin@soleen.com>
+ */
+
+#ifndef _LINUX_LUO_INTERNAL_H
+#define _LINUX_LUO_INTERNAL_H
+
+int luo_cancel(void);
+int luo_prepare(void);
+int luo_freeze(void);
+int luo_finish(void);
+
+void luo_state_read_enter(void);
+void luo_state_read_exit(void);
+
+extern const char *const luo_state_str[];
+
+/* Get the current state as a string */
+#define LUO_STATE_STR luo_state_str[READ_ONCE(luo_state)]
+
+extern enum liveupdate_state luo_state;
+
+#endif /* _LINUX_LUO_INTERNAL_H */
diff --git a/include/linux/liveupdate.h b/include/linux/liveupdate.h
new file mode 100644
index 000000000000..c2740da70958
--- /dev/null
+++ b/include/linux/liveupdate.h
@@ -0,0 +1,131 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/*
+ * Copyright (c) 2025, Google LLC.
+ * Pasha Tatashin <pasha.tatashin@soleen.com>
+ */
+#ifndef _LINUX_LIVEUPDATE_H
+#define _LINUX_LIVEUPDATE_H
+
+#include <linux/bug.h>
+#include <linux/types.h>
+#include <linux/list.h>
+
+/**
+ * enum liveupdate_event - Events that trigger live update callbacks.
+ * @LIVEUPDATE_PREPARE: PREPARE should happens *before* the blackout window.
+ *                      Subsystems should prepare for an upcoming reboot by
+ *                      serializing their states. However, it must be considered
+ *                      that user applications, e.g. virtual machines are still
+ *                      running during this phase.
+ * @LIVEUPDATE_FREEZE:  FREEZE sent from the reboot() syscall, when the current
+ *                      kernel is on its way out. This is the final opportunity
+ *                      for subsystems to save any state that must persist
+ *                      across the reboot. Callbacks for this event should be as
+ *                      fast as possible since they are on the critical path of
+ *                      rebooting into the next kernel.
+ * @LIVEUPDATE_FINISH:  FINISH is sent in the newly booted kernel after a
+ *                      successful live update and normally *after* the blackout
+ *                      window. Subsystems should perform any final cleanup
+ *                      during this phase. This phase also provides an
+ *                      opportunity to clean up devices that were preserved but
+ *                      never explicitly reclaimed during the live update
+ *                      process. State restoration should have already occurred
+ *                      before this event. Callbacks for this event must not
+ *                      fail. The completion of this call transitions the
+ *                      machine from ``updated`` to ``normal`` state.
+ * @LIVEUPDATE_CANCEL:  CANCEL the live update and go back to normal state. This
+ *                      event is user initiated, or is done automatically when
+ *                      LIVEUPDATE_PREPARE or LIVEUPDATE_FREEZE stage fails.
+ *                      Subsystems should revert any actions taken during the
+ *                      corresponding prepare event. Callbacks for this event
+ *                      must not fail.
+ *
+ * These events represent the different stages and actions within the live
+ * update process that subsystems (like device drivers and bus drivers)
+ * need to be aware of to correctly serialize and restore their state.
+ *
+ */
+enum liveupdate_event {
+	LIVEUPDATE_PREPARE,
+	LIVEUPDATE_FREEZE,
+	LIVEUPDATE_FINISH,
+	LIVEUPDATE_CANCEL,
+};
+
+/**
+ * enum liveupdate_state - Defines the possible states of the live update
+ * orchestrator.
+ * @LIVEUPDATE_STATE_NORMAL:         Default state, no live update in progress.
+ * @LIVEUPDATE_STATE_PREPARED:       Live update is prepared for reboot; the
+ *                                   LIVEUPDATE_PREPARE callbacks have completed
+ *                                   successfully.
+ *                                   Devices might operate in a limited state
+ *                                   for example the participating devices might
+ *                                   not be allowed to unbind, and also the
+ *                                   setting up of new DMA mappings might be
+ *                                   disabled in this state.
+ * @LIVEUPDATE_STATE_FROZEN:         The final reboot event
+ *                                   (%LIVEUPDATE_FREEZE) has been sent, and the
+ *                                   system is performing its final state saving
+ *                                   within the "blackout window". User
+ *                                   workloads must be suspended. The actual
+ *                                   reboot (kexec) into the next kernel is
+ *                                   imminent.
+ * @LIVEUPDATE_STATE_UPDATED:        The system has rebooted into the next
+ *                                   kernel via live update the system is now
+ *                                   running the next kernel, awaiting the
+ *                                   finish event.
+ *
+ * These states track the progress and outcome of a live update operation.
+ */
+enum liveupdate_state  {
+	LIVEUPDATE_STATE_NORMAL = 0,
+	LIVEUPDATE_STATE_PREPARED = 1,
+	LIVEUPDATE_STATE_FROZEN = 2,
+	LIVEUPDATE_STATE_UPDATED = 3,
+};
+
+#ifdef CONFIG_LIVEUPDATE
+
+/* Return true if live update orchestrator is enabled */
+bool liveupdate_enabled(void);
+
+/* Called during reboot to tell participants to complete serialization */
+int liveupdate_reboot(void);
+
+/*
+ * Return true if machine is in updated state (i.e. live update boot in
+ * progress)
+ */
+bool liveupdate_state_updated(void);
+
+/*
+ * Return true if machine is in normal state (i.e. no live update in progress).
+ */
+bool liveupdate_state_normal(void);
+
+#else /* CONFIG_LIVEUPDATE */
+
+static inline int liveupdate_reboot(void)
+{
+	return 0;
+}
+
+static inline bool liveupdate_enabled(void)
+{
+	return false;
+}
+
+static inline bool liveupdate_state_updated(void)
+{
+	return false;
+}
+
+static inline bool liveupdate_state_normal(void)
+{
+	return true;
+}
+
+#endif /* CONFIG_LIVEUPDATE */
+#endif /* _LINUX_LIVEUPDATE_H */
-- 
2.49.0.1101.gccaa498523-goog

